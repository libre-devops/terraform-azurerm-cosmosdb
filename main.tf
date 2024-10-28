resource "azurerm_cosmosdb_account" "this" {
  for_each            = { for cosmosdb_account in var.cosmosdb_accounts : cosmosdb_account.name => cosmosdb_account }
  location            = each.value.location
  name                = each.value.name
  offer_type          = each.value.offer_type
  resource_group_name = each.value.rg_name
  tags                = each.value.tags

  # Attributes directly based on the variable object
  minimal_tls_version                   = each.value.minimal_tls_version
  create_mode                           = each.value.create_mode
  default_identity_type                 = each.value.default_identity_type
  kind                                  = each.value.kind
  free_tier_enabled                     = each.value.free_tier_enabled
  ip_range_filter                       = each.value.ip_range_filter
  analytical_storage_enabled            = each.value.analytical_storage_enabled
  automatic_failover_enabled            = each.value.automatic_failover_enabled
  partition_merge_enabled               = each.value.partition_merge_enabled
  burst_capacity_enabled                = each.value.burst_capacity_enabled
  public_network_access_enabled         = each.value.public_network_access_enabled
  is_virtual_network_filter_enabled     = each.value.is_virtual_network_filter_enabled
  key_vault_key_id                      = each.value.key_vault_key_id
  multiple_write_locations_enabled      = each.value.multiple_write_locations_enabled
  access_key_metadata_writes_enabled    = each.value.access_key_metadata_writes_enabled
  mongo_server_version                  = each.value.mongo_server_version
  network_acl_bypass_for_azure_services = each.value.network_acl_bypass_for_azure_services
  network_acl_bypass_ids                = each.value.network_acl_bypass_ids
  local_authentication_disabled         = each.value.local_authentication_disabled

  # Consistency Policy Block
  dynamic "consistency_policy" {
    for_each = each.value.consistency_policy != null ? [each.value.consistency_policy] : []
    content {
      consistency_level       = consistency_policy.value.consistency_level
      max_interval_in_seconds = try(consistency_policy.value.max_interval_in_seconds, null)
      max_staleness_prefix    = try(consistency_policy.value.max_staleness_prefix, null)
    }
  }

  # Identity Block for different identity types
  dynamic "identity" {
    for_each = each.value.identity_type == "SystemAssigned" ? [each.value.identity_type] : []
    content {
      type = each.value.identity_type
    }
  }

  dynamic "identity" {
    for_each = each.value.identity_type == "SystemAssigned, UserAssigned" ? [each.value.identity_type] : []
    content {
      type         = each.value.identity_type
      identity_ids = try(each.value.identity_ids, [])
    }
  }

  dynamic "identity" {
    for_each = each.value.identity_type == "UserAssigned" ? [each.value.identity_type] : []
    content {
      type         = each.value.identity_type
      identity_ids = length(try(each.value.identity_ids, [])) > 0 ? each.value.identity_ids : []
    }
  }

  # Geo Locations Block
  dynamic "geo_location" {
    for_each = each.value.geo_location != null ? [each.value.geo_location] : []
    content {
      failover_priority = geo_location.value.failover_priority
      location          = geo_location.value.location
      zone_redundant    = try(geo_location.value.zone_redundant, null)
    }
  }

  # Capabilities Block
  dynamic "capabilities" {
    for_each = each.value.capabilities != null ? each.value.capabilities : []
    content {
      name = capabilities.value.name
    }
  }

  # Virtual Network Rules Block
  dynamic "virtual_network_rule" {
    for_each = each.value.virtual_network_rule != null ? each.value.virtual_network_rule : []
    content {
      id                                   = virtual_network_rule.value.id
      ignore_missing_vnet_service_endpoint = try(virtual_network_rule.value.ignore_missing_vnet_service_endpoint, null)
    }
  }

  # Analytical Storage Block
  dynamic "analytical_storage" {
    for_each = each.value.analytical_storage != null ? each.value.analytical_storage : []
    content {
      schema_type = analytical_storage.value.schema_type
    }
  }

  # Capacity Block
  dynamic "capacity" {
    for_each = each.value.capacity != null ? [each.value.capacity] : []
    content {
      total_throughput_limit = capacity.value.total_throughput_limit
    }
  }

  # Backup Block
  dynamic "backup" {
    for_each = each.value.backup != null ? [each.value.backup] : []
    content {
      type                = backup.value.type
      tier                = try(backup.value.tier, null)
      interval_in_minutes = try(backup.value.interval_in_minutes, null)
      retention_in_hours  = try(backup.value.retention_in_hours, null)
      storage_redundancy  = try(backup.value.storage_redundancy, null)
    }
  }

  # CORS Rules Block
  dynamic "cors_rule" {
    for_each = each.value.cors_rule != null ? each.value.cors_rule : []
    content {
      allowed_headers    = cors_rule.value.allowed_headers
      allowed_methods    = cors_rule.value.allowed_methods
      allowed_origins    = cors_rule.value.allowed_origins
      exposed_headers    = cors_rule.value.exposed_headers
      max_age_in_seconds = cors_rule.value.max_age_in_seconds
    }
  }

  # Restore Block
  dynamic "restore" {
    for_each = each.value.restore != null ? [each.value.restore] : []
    content {
      source_cosmosdb_account_id = restore.value.source_cosmosdb_account_id
      restore_timestamp_in_utc   = restore.value.restore_timestamp_in_utc

      # Nested Database Block inside Restore
      dynamic "database" {
        for_each = try([restore.value.database], []) != [null] ? [restore.value.database] : []
        content {
          name             = database.value.name
          collection_names = try(database.value.collection_names, null)
        }
      }

      # Nested Gremlin Database Block inside Restore
      dynamic "gremlin_database" {
        for_each = try(restore.value.gremlin_database, []) != [] ? restore.value.gremlin_database : []
        content {
          name        = gremlin_database.value.name
          graph_names = try(gremlin_database.value.graph_names, null)
        }
      }

      # Nested Tables to Restore inside Restore
      tables_to_restore = try(restore.value.tables_to_restore, null)
    }
  }
}
