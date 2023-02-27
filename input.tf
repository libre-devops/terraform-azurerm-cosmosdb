variable "access_key_metadata_writes_enabled" {
  type        = bool
  description = "Whether key metadata writes is enabled"
  default     = false
}

variable "allowed_cidrs" {
  type        = list(string)
  description = "CosmosDB Firewall Support: This value specifies the set of IP addresses or IP address ranges in CIDR form to be included as the allowed list of client IP's for a given database account."
  default     = []
}

variable "analytical_storage_enabled" {
  description = "Enable Analytical Storage option for this Cosmos DB account. Defaults to `false`. Changing this forces a new resource to be created."
  type        = bool
  default     = false
}

variable "analytical_storage_type" {
  description = "The schema type of the Analytical Storage for this Cosmos DB account. Possible values are `FullFidelity` and `WellDefined`."
  type        = string
  default     = null

  validation {
    condition     = try(contains(["FullFidelity", "WellDefined"], var.analytical_storage_type), true)
    error_message = "The `analytical_storage_type` value must be valid. Possible values are `FullFidelity` and `WellDefined`."
  }
}

variable "capabilities" {
  type        = list(string)
  description = <<EOD
Configures the capabilities to enable for this Cosmos DB account:
Possible values are
  AllowSelfServeUpgradeToMongo36, DisableRateLimitingResponses,
  EnableAggregationPipeline, EnableCassandra, EnableGremlin,EnableMongo, EnableTable, EnableServerless,
  MongoDBv3.4 and mongoEnableDocLevelTTL.
EOD
  default     = []
}

variable "consistency_policy_level" {
  description = "Consistency policy level. Allowed values are `BoundedStaleness`, `Eventual`, `Session`, `Strong` or `ConsistentPrefix`"
  type        = string
  default     = "BoundedStaleness"
}

variable "consistency_policy_max_interval_in_seconds" {
  description = "When used with the Bounded Staleness consistency level, this value represents the time amount of staleness (in seconds) tolerated. Accepted range for this value is 5 - 86400 (1 day). Defaults to 5. Required when consistency_level is set to BoundedStaleness."
  type        = number
  default     = 10
}

variable "consistency_policy_max_staleness_prefix" {
  description = "When used with the Bounded Staleness consistency level, this value represents the number of stale requests tolerated. Accepted range for this value is 10 – 2147483647. Defaults to 100. Required when consistency_level is set to BoundedStaleness."
  type        = number
  default     = 200
}

variable "cosmos_keyvault_identity_type" {
  type        = string
  description = "The type of managed identity that the CosmosDB will use to access a key vault, defaults to SystemAssignedIdentity"
  default     = "SystemAssignedIdentity"
}

variable "cosmosdb_account_properties" {
  type        = map(any)
  description = "The block for nested configuration of the configuration blocks of the module"
  default     = {}
}

variable "cosmosdb_name" {
  type        = string
  description = "The name for the cosmosdb account"
}

variable "create_mode" {
  type        = string
  description = "The createmode of the cosmosdb account"
  default     = "Default"
}

variable "enable_automatic_failover" {
  type        = bool
  description = "Whether automatic failover should be enabled"
  default     = false
}

variable "enable_cmk_support" {
  type        = bool
  description = "Whether customer managed key encryption is enabled"
  default     = false
}

variable "enable_free_tier" {
  type        = bool
  description = "Whether the free tier is enabled"
  default     = false
}

variable "enable_multiple_write_locations" {
  type        = bool
  description = "Determines whether multiple write locations are enabled, defaults to false"
  default     = false
}

variable "failover_locations" {
  description = "The name of the Azure region to host replicated data and their priority."
  type        = map(map(string))
  default     = null
}

variable "identity_ids" {
  description = "Specifies a list of user managed identity ids to be assigned to the VM."
  type        = list(string)
  default     = []
}

variable "identity_type" {
  description = "The Managed Service Identity Type of this Virtual Machine."
  type        = string
  default     = ""
}

variable "is_virtual_network_filter_enabled" {
  description = "Enables virtual network filtering for this Cosmos DB account"
  type        = bool
  default     = false
}

variable "key_vault_id" {
  type        = string
  description = "If a key vault is enabled for CMK, its id"
  default     = null
}

variable "key_vault_url" {
  type        = string
  description = "If customer CMK is enabled, the URL for the key vault"
  default     = null
}

variable "kind" {
  type        = string
  description = "Specifies the Kind of CosmosDB to create - possible values are `GlobalDocumentDB` and `MongoDB`."
  default     = "GlobalDocumentDB"
}

variable "local_auth_disabled" {
  type        = bool
  description = "Whether local auth is enabled, defaults to false"
  default     = false
}

variable "location" {
  description = "The location for this resource to be put in"
  type        = string
}

variable "mongo_server_version" {
  description = "The Server Version of a MongoDB account. See possible values https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cosmosdb_account#mongo_server_version"
  type        = string
  default     = "4.2"
}

variable "network_acl_bypass_for_azure_services" {
  description = "If azure services can bypass ACLs."
  type        = bool
  default     = false
}

variable "network_acl_bypass_ids" {
  description = "The list of resource Ids for Network Acl Bypass for this Cosmos DB account."
  type        = list(string)
  default     = null
}

variable "offer_type" {
  type        = string
  description = "Specifies the Offer Type to use for this CosmosDB Account - currently this can only be set to Standard."
  default     = "Standard"
}

variable "public_network_access_enabled" {
  description = "Whether or not public network access is allowed for this CosmosDB account."
  type        = bool
  default     = true
}

variable "rg_name" {
  description = "The name of the resource group, this module does not create a resource group, it is expecting the value of a resource group already exists"
  type        = string
  validation {
    condition     = length(var.rg_name) > 1 && length(var.rg_name) <= 24
    error_message = "Resource group name is not valid."
  }
}

variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."

  default = {
    source = "terraform"
  }
}

variable "virtual_network_rule" {
  description = "Specifies a virtual_network_rules resource used to define which subnets are allowed to access this CosmosDB account"
  type = list(object({
    id                                   = string,
    ignore_missing_vnet_service_endpoint = bool
  }))
  default = null
}

variable "zone_redundancy_enabled" {
  description = "True to enabled zone redundancy on default primary location"
  type        = bool
  default     = true
}
