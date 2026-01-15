#--------------
# MSSQL Server
#--------------
output "name" {
  description = "Microsoft SQL Server Name."
  value       = azurerm_mssql_server.mssql_server.name
}

output "id" {
  description = "Microsoft SQL Server ID."
  value       = azurerm_mssql_server.mssql_server.id
}

output "fully_qualified_domain_name" {
  description = "The fully qualified domain name of the Azure SQL Server (e.g. myServerName.database.windows.net)"
  value       = azurerm_mssql_server.mssql_server.fully_qualified_domain_name
}

output "restorable_dropped_database_ids" {
  description = "A list of dropped restorable database IDs on the server."
  value       = azurerm_mssql_server.mssql_server.restorable_dropped_database_ids
}