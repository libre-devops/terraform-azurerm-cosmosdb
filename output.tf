output "cosmosdb_account_connection_string" {
  description = "The connection string of the cosmosdb account"
  value       = azurerm_cosmosdb_account.cosmos_db.connection_strings
  sensitive   = true
}

output "cosmosdb_account_endpoint" {
  description = "The endpoint of the cosmosdb"
  value       = azurerm_cosmosdb_account.cosmos_db.endpoint
}

output "cosmosdb_account_id" {
  description = "The name of the cosmosdb account"
  value       = azurerm_cosmosdb_account.cosmos_db.id
}

output "cosmosdb_account_identity" {
  description = "The identity block of the cosmosdb"
  value       = azurerm_cosmosdb_account.cosmos_db.identity
}

output "cosmosdb_account_name" {
  description = "The name of the cosmosdb account"
  value       = azurerm_cosmosdb_account.cosmos_db.name
}

output "cosmosdb_account_primary_key" {
  description = "The primary key for cosmosdb account"
  value       = azurerm_cosmosdb_account.cosmos_db.primary_key
  sensitive   = true
}

output "cosmosdb_account_primary_readonly_key" {
  description = "The primary readonly key for cosmosdb account"
  value       = azurerm_cosmosdb_account.cosmos_db.primary_readonly_key
  sensitive   = true
}

output "cosmosdb_account_read_endpoints" {
  description = "The read endpoint of the cosmosdb"
  value       = azurerm_cosmosdb_account.cosmos_db.read_endpoints
}

output "cosmosdb_account_secondary_key" {
  description = "The secondary key for cosmosdb account"
  value       = azurerm_cosmosdb_account.cosmos_db.secondary_key
  sensitive   = true
}

output "cosmosdb_account_secondary_readonly_key" {
  description = "The secondary readonly key for cosmosdb account"
  value       = azurerm_cosmosdb_account.cosmos_db.secondary_readonly_key
  sensitive   = true
}

output "cosmosdb_account_write_endpoints" {
  description = "The write endpoint of the cosmosdb"
  value       = azurerm_cosmosdb_account.cosmos_db.write_endpoints
}
