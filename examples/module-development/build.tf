module "rg" {
  source = "libre-devops/rg/azurerm"

  rg_name  = "rg-${var.short}-${var.loc}-${var.env}-01"
  location = local.location
  tags     = local.tags
}

resource "azurerm_user_assigned_identity" "uid" {
  name                = "uid-${var.short}-${var.loc}-${var.env}-01"
  resource_group_name = module.rg.rg_name
  location            = module.rg.rg_location
  tags                = module.rg.rg_tags
}


module "shared_vars" {
  source = "libre-devops/shared-vars/azurerm"
}

locals {
  lookup_cidr = {
    for landing_zone, envs in module.shared_vars.cidrs : landing_zone => {
      for env, cidr in envs : env => cidr
    }
  }
}

module "subnet_calculator" {
  source = "libre-devops/subnet-calculator/null"

  base_cidr    = local.lookup_cidr[var.short][var.env][0]
  subnet_sizes = [26, 26, 26]
}

module "network" {
  source = "libre-devops/network/azurerm"

  rg_name  = module.rg.rg_name
  location = module.rg.rg_location
  tags     = module.rg.rg_tags

  vnet_name          = "vnet-${var.short}-${var.loc}-${var.env}-01"
  vnet_location      = module.rg.rg_location
  vnet_address_space = [module.subnet_calculator.base_cidr]

  subnets = {
    for i, name in module.subnet_calculator.subnet_names :
    name => {
      address_prefixes  = toset([module.subnet_calculator.subnet_ranges[i]])
      service_endpoints = ["Microsoft.KeyVault", "Microsoft.Storage", "Microsoft.AzureCosmosDB"]

      # Only assign delegation to subnet3
      delegation = name == "subnet3" ? [
        {
          type = "Microsoft.Web/serverFarms" # Delegation type for subnet3
        },
      ] : []
    }
  }
}


data "http" "user_ip" {
  url = "https://checkip.amazonaws.com"
}

module "role_assignments" {
  source = "github.com/libre-devops/terraform-azurerm-role-assignment"

  role_assignments = [
    {
      principal_ids = [azurerm_user_assigned_identity.uid.principal_id]
      role_names    = ["Key Vault Administrator", "Storage Blob Data Owner"]
      scope         = module.rg.rg_id
      set_condition = true
    },
  ]
}

module "cosmosdb_account" {
  source = "../../"

  cosmosdb_accounts = [
    {
      rg_name  = module.rg.rg_name
      location = module.rg.rg_location
      tags     = module.rg.rg_tags

      name          = "cosmos-${var.short}-${var.loc}-${var.env}-01"
      identity_type = "UserAssigned"
      identity_ids  = [azurerm_user_assigned_identity.uid.id]

      is_virtual_network_filter_enabled = true
      virtual_network_rule = [
        {
          id = module.network.subnets_ids["subnet1"]
        },
      ]

      consistency_policy = {
        consistency_level       = "Session"
        max_interval_in_seconds = 5
        max_staleness_prefix    = 100
      }

      geo_location = {
        failover_priority = 0
        location          = module.rg.rg_location
        zone_redundant    = false
      }
    }
  ]
}