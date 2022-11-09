resource "random_string" "storage_name" {
  length  = 5
  special = false
  lower   = true
  numeric = false
  upper   = false
}

resource "azurerm_storage_account" "storage-account" {
  name                     = "candidatestrg${random_string.storage_name.result}"
  resource_group_name      = var.resource_group
  location                 = local.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "storage-container" {
  name                  = "backup"
  storage_account_name  = azurerm_storage_account.storage-account.name
  container_access_type = "private"
}

resource "azurerm_service_plan" "app-service-plan" {
  name                = var.app_service_plan
  resource_group_name = var.resource_group
  location            = local.location
  os_type             = "Linux"
  sku_name            = var.sku
}


resource "azurerm_linux_web_app" "app-service" {
  name                = var.web_app_name
  resource_group_name = var.resource_group
  location            = local.location
  service_plan_id     = azurerm_service_plan.app-service-plan.id
  backup {
    name = "webappbackup"
    schedule {
      frequency_unit           = "Day"
      frequency_interval       = 7
      keep_at_least_one_backup = true
      retention_period_days    = 30
    }
    storage_account_url = local.sas
    enabled             = true
  }


  site_config {
    app_command_line = "npm start /home/site/wwwroot/index.js"
    application_stack {
      node_version = "16-lts"
    }
  }

}



resource "azurerm_app_service_source_control" "app-service-source-control" {
  app_id                 = azurerm_linux_web_app.app-service.id
  repo_url               = var.repository_url
  branch                 = var.branch
  use_manual_integration = true
}

