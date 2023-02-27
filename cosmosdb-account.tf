resource "azurerm_cosmosdb_account" "cosmos_db" {
  name = var.cosmosdb_name

  location            = var.location
  resource_group_name = var.rg_name

  offer_type                            = var.offer_type
  kind                                  = var.kind
  mongo_server_version                  = var.kind == "MongoDB" ? var.mongo_server_version : null
  enable_automatic_failover             = var.enable_automatic_failover
  create_mode                           = title(var.create_mode)
  analytical_storage_enabled            = var.analytical_storage_enabled
  default_identity_type                 = var.cosmos_keyvault_identity_type
  enable_free_tier                      = var.enable_free_tier
  key_vault_key_id                      = var.enable_cmk_support == true ? var.key_vault_id : null
  enable_multiple_write_locations       = var.enable_multiple_write_locations
  access_key_metadata_writes_enabled    = var.access_key_metadata_writes_enabled
  ip_range_filter                       = join(",", var.allowed_cidrs)
  public_network_access_enabled         = var.public_network_access_enabled
  is_virtual_network_filter_enabled     = var.is_virtual_network_filter_enabled
  network_acl_bypass_for_azure_services = var.network_acl_bypass_for_azure_services
  network_acl_bypass_ids                = var.network_acl_bypass_ids
  local_authentication_disabled         = var.local_auth_disabled

  dynamic "capacity" {
    for_each = lookup(var.cosmosdb_account_properties, "capacity", {}) != {} ? [1] : []
    content {
      total_throughput_limit = lookup(var.cosmosdb_account_properties.capacity, "total_throughput_limit", "-1")
    }
  }

  dynamic "cors_rule" {
    for_each = lookup(var.cosmosdb_account_properties, "cors_rule", {}) != {} ? [1] : []

    content {
      allowed_headers    = var.cosmosdb_account_properties.cors_rule.allowed_headers
      allowed_methods    = var.cosmosdb_account_properties.cors_rule.allowed_methods
      allowed_origins    = var.cosmosdb_account_properties.cors_rule.allowed_origins
      exposed_headers    = var.cosmosdb_account_properties.cors_rule.exposed_headers
      max_age_in_seconds = var.cosmosdb_account_properties.cors_rule.max_age_in_seconds
    }
  }

  dynamic "restore" {
    for_each = lookup(var.cosmosdb_account_properties, "restore", {}) != {} ? [1] : []
    content {
      source_cosmosdb_account_id = lookup(var.cosmosdb_account_properties.restore, "source_cosmosdb_account_id", null)
      restore_timestamp_in_utc   = lookup(var.cosmosdb_account_properties.restore, "restore_timestamp_in_utc", null)

      dynamic "database" {
        for_each = lookup(var.cosmosdb_account_properties.restore, "database", {}) != {} ? [1] : []
        content {
          name             = lookup(var.cosmosdb_account_properties.restore.database, "name", null)
          collection_names = toset(lookup(var.cosmosdb_account_properties.restore.database, "collection_names", []))
        }
      }
    }
  }
  dynamic "geo_location" {
    for_each = var.failover_locations != null ? var.failover_locations : local.failover_locations
    content {
      location          = geo_location.value.location
      failover_priority = lookup(geo_location.value, "priority", 0)
      zone_redundant    = lookup(geo_location.value, "zone_redundant", false)
    }
  }


  consistency_policy {
    consistency_level       = var.consistency_policy_level
    max_interval_in_seconds = var.consistency_policy_max_interval_in_seconds
    max_staleness_prefix    = var.consistency_policy_max_staleness_prefix
  }


  dynamic "capabilities" {
    for_each = toset(var.capabilities)
    content {
      name = capabilities.key
    }
  }

  dynamic "virtual_network_rule" {
    for_each = var.virtual_network_rule != null ? toset(var.virtual_network_rule) : []
    content {
      id                                   = virtual_network_rule.value.id
      ignore_missing_vnet_service_endpoint = virtual_network_rule.value.ignore_missing_vnet_service_endpoint
    }
  }

  dynamic "analytical_storage" {
    for_each = lookup(var.cosmosdb_account_properties, "analytical_storage", {}) != {} ? [1] : []
    content {
      schema_type = lookup(var.cosmosdb_account_properties.analytical_storage, "schema_type", null)
    }
  }

  dynamic "backup" {
    for_each = lookup(var.cosmosdb_account_properties, "backup", {}) != {} ? [1] : []
    content {
      type                = lookup(var.cosmosdb_account_properties.backup, "type", null)
      interval_in_minutes = lookup(var.cosmosdb_account_properties.backup, "interval_in_minutes", null)
      retention_in_hours  = lookup(var.cosmosdb_account_properties.backup, "retention_in_hours", null)
    }
  }

  dynamic "identity" {
    for_each = length(var.identity_ids) == 0 && var.identity_type == "SystemAssigned" ? [var.identity_type] : []
    content {
      type = var.identity_type
    }
  }

  dynamic "identity" {
    for_each = length(var.identity_ids) > 0 || var.identity_type == "UserAssigned" ? [var.identity_type] : []
    content {
      type         = var.identity_type
      identity_ids = length(var.identity_ids) > 0 ? var.identity_ids : []
    }
  }

  tags = var.tags
}