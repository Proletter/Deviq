data "azurerm_resource_group" "resource-group" {
  name = var.resource_group
}


data "azurerm_storage_account_blob_container_sas" "storage-container-sas" {
  connection_string = azurerm_storage_account.storage-account.primary_connection_string
  container_name    = azurerm_storage_container.storage-container.name
  https_only        = true


  start  = "2022-11-09T00:00:00Z"
  expiry = "2023-11-09T00:00:00Z"

  permissions {
    read   = true
    write  = true
    delete = true
    list   = true
    add    = true
    create = true
  }
}

