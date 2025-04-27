resource "azurerm_resource_group" "backend_rg" {
  name     = "tf-backend-rg"
  location = "East US"
}

resource "azurerm_storage_account" "backend_sa" {
  name                     = "tfbackendstorage123" # must be globally unique
  resource_group_name      = azurerm_resource_group.backend_rg.name
  location                 = azurerm_resource_group.backend_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  blob_properties {
    delete_retention_policy {
      days = 7
    }
  }

  tags = {
    environment = "TerraformBackend"
  }
}

resource "azurerm_storage_container" "backend_container" {
  name                  = "tfstate"
  storage_account_id    = azurerm_storage_account.backend_sa.id
  container_access_type = "private"
}
