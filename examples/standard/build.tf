resource "random_string" "random" {
  length  = 4
  special = false
}

module "rg" {
  source = "registry.terraform.io/libre-devops/rg/azurerm"

  rg_name  = "rg-${var.short}-${var.loc}-${terraform.workspace}-build" // rg-ldo-euw-dev-build
  location = local.location                                            // compares var.loc with the var.regions var to match a long-hand name, in this case, "euw", so "westeurope"
  tags     = local.tags

  #  lock_level = "CanNotDelete" // Do not set this value to skip lock
}


module "cosmosdb" {
  source = "registry.terraform.io/libre-devops/cosmosdb/azurerm"

  rg_name  = module.rg.rg_name
  location = module.rg.rg_location
  tags     = module.rg.rg_tags

  cosmosdb_name                 = "cosmos-${var.short}-${var.loc}-${terraform.workspace}-${lower(random_string.random.result)}"
  cosmos_keyvault_identity_type = "FirstPartyIdentity"
  identity_type                 = "SystemAssigned"
  cosmosdb_account_properties   = {}
}

