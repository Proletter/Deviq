
locals {
  location = data.azurerm_resource_group.resource-group.location
  sas      = "https://${azurerm_storage_account.storage-account.name}.blob.core.windows.net/backup?${data.azurerm_storage_account_blob_container_sas.storage-container-sas.sas}"
}
