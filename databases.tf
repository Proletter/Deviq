resource "azurerm_mssql_server" "candidate-sql-server" {
  name                         = var.server
  resource_group_name          = var.resource_group
  location                     = local.location
  version                      = "12.0"
  administrator_login          = "Candidateuser"
  administrator_login_password = "Password123@"
}

resource "azurerm_mssql_database" "candidate-sql-database" {
  name      = var.database
  server_id = azurerm_mssql_server.candidate-sql-server.id
}