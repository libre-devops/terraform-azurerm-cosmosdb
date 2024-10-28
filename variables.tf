variable "cosmosdb_accounts" {
  description = "The list of cosmosdb accounts to create"
  type = list(object({
    name                                  = string
    rg_name                               = string
    location                              = optional(string, "uksouth")
    tags                                  = map(string)
    minimal_tls_version                   = optional(string, "Tls12")
    offer_type                            = optional(string, "Standard")
    create_mode                           = optional(string)
    default_identity_type                 = optional(string)
    kind                                  = optional(string)
    free_tier_enabled                     = optional(bool)
    ip_range_filter                       = optional(set(string))
    analytical_storage_enabled            = optional(bool)
    automatic_failover_enabled            = optional(bool)
    partition_merge_enabled               = optional(bool)
    burst_capacity_enabled                = optional(bool)
    public_network_access_enabled         = optional(bool)
    is_virtual_network_filter_enabled     = optional(bool)
    key_vault_key_id                      = optional(string)
    multiple_write_locations_enabled      = optional(bool)
    access_key_metadata_writes_enabled    = optional(bool, false)
    mongo_server_version                  = optional(string)
    network_acl_bypass_for_azure_services = optional(bool, true)
    network_acl_bypass_ids                = optional(list(string))
    local_authentication_disabled         = optional(bool)
    identity_ids                          = optional(list(string))
    identity_type                         = optional(string)
    consistency_policy = object({
      consistency_level       = string
      max_interval_in_seconds = optional(number)
      max_staleness_prefix    = optional(number)
    })
    geo_location = object({
      failover_priority = number
      location          = string
      zone_redundant    = optional(bool)
    })
    capabilities = optional(list(object({
      name = string
    })))
    virtual_network_rule = optional(list(object({
      id                                   = string
      ignore_missing_vnet_service_endpoint = optional(bool)
    })))
    analytical_storage = optional(list(object({
      schema_type = string
    })))
    capacity = optional(object({
      total_throughput_limit = number
    }))
    backup = optional(object({
      type                = string
      tier                = optional(string)
      interval_in_minutes = optional(number)
      retention_in_hours  = optional(number)
      storage_redundancy  = optional(string)
    }))
    cors_rule = optional(list(object({
      allowed_headers    = list(string)
      allowed_methods    = list(string)
      allowed_origins    = list(string)
      exposed_headers    = list(string)
      max_age_in_seconds = number
    })))
    restore = optional(object({
      source_cosmosdb_account_id = string
      restore_timestamp_in_utc   = string
      database = optional(object({
        name             = string
        collection_names = optional(list(string))
      }))
      gremlin_database = optional(list(object({
        name        = string
        graph_names = optional(list(string))
      })))
      tables_to_restore = optional(list(string))
    }))
  }))
}
