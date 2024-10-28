output "cosmosdb_account_ids" {
  description = "The IDs of the CosmosDB accounts."
  value       = { for k, v in azurerm_cosmosdb_account.this : k => v.id }
}

output "cosmosdb_endpoints" {
  description = "The endpoints used to connect to the CosmosDB accounts."
  value       = { for k, v in azurerm_cosmosdb_account.this : k => v.endpoint }
}

output "cosmosdb_read_endpoints" {
  description = "A list of read endpoints available for each CosmosDB account."
  value       = { for k, v in azurerm_cosmosdb_account.this : k => v.read_endpoints }
}

output "cosmosdb_write_endpoints" {
  description = "A list of write endpoints available for each CosmosDB account."
  value       = { for k, v in azurerm_cosmosdb_account.this : k => v.write_endpoints }
}

output "cosmosdb_primary_keys" {
  description = "The primary keys for each CosmosDB account."
  value       = { for k, v in azurerm_cosmosdb_account.this : k => v.primary_key }
}

output "cosmosdb_secondary_keys" {
  description = "The secondary keys for each CosmosDB account."
  value       = { for k, v in azurerm_cosmosdb_account.this : k => v.secondary_key }
}

output "cosmosdb_primary_readonly_keys" {
  description = "The primary read-only keys for each CosmosDB account."
  value       = { for k, v in azurerm_cosmosdb_account.this : k => v.primary_readonly_key }
}

output "cosmosdb_secondary_readonly_keys" {
  description = "The secondary read-only keys for each CosmosDB account."
  value       = { for k, v in azurerm_cosmosdb_account.this : k => v.secondary_readonly_key }
}

output "cosmosdb_primary_sql_connection_strings" {
  description = "Primary SQL connection strings for each CosmosDB account."
  value       = { for k, v in azurerm_cosmosdb_account.this : k => v.primary_sql_connection_string }
}

output "cosmosdb_secondary_sql_connection_strings" {
  description = "Secondary SQL connection strings for each CosmosDB account."
  value       = { for k, v in azurerm_cosmosdb_account.this : k => v.secondary_sql_connection_string }
}

output "cosmosdb_primary_readonly_sql_connection_strings" {
  description = "Primary readonly SQL connection strings for each CosmosDB account."
  value       = { for k, v in azurerm_cosmosdb_account.this : k => v.primary_readonly_sql_connection_string }
}

output "cosmosdb_secondary_readonly_sql_connection_strings" {
  description = "Secondary readonly SQL connection strings for each CosmosDB account."
  value       = { for k, v in azurerm_cosmosdb_account.this : k => v.secondary_readonly_sql_connection_string }
}

output "cosmosdb_primary_mongodb_connection_strings" {
  description = "Primary MongoDB connection strings for each CosmosDB account."
  value       = { for k, v in azurerm_cosmosdb_account.this : k => v.primary_mongodb_connection_string }
}

output "cosmosdb_secondary_mongodb_connection_strings" {
  description = "Secondary MongoDB connection strings for each CosmosDB account."
  value       = { for k, v in azurerm_cosmosdb_account.this : k => v.secondary_mongodb_connection_string }
}

output "cosmosdb_primary_readonly_mongodb_connection_strings" {
  description = "Primary readonly MongoDB connection strings for each CosmosDB account."
  value       = { for k, v in azurerm_cosmosdb_account.this : k => v.primary_readonly_mongodb_connection_string }
}

output "cosmosdb_secondary_readonly_mongodb_connection_strings" {
  description = "Secondary readonly MongoDB connection strings for each CosmosDB account."
  value       = { for k, v in azurerm_cosmosdb_account.this : k => v.secondary_readonly_mongodb_connection_string }
}

# Identity-related outputs
output "cosmosdb_identity_principal_ids" {
  description = "The Principal IDs associated with each CosmosDB account's Managed Service Identity."
  value       = { for k, v in azurerm_cosmosdb_account.this : k => v.identity[0].principal_id }
}

output "cosmosdb_identity_tenant_ids" {
  description = "The Tenant IDs associated with each CosmosDB account's Managed Service Identity."
  value       = { for k, v in azurerm_cosmosdb_account.this : k => v.identity[0].tenant_id }
}
