terraform {
  backend "azurerm" {
    resource_group_name  = "tf-backend-rg"
    storage_account_name = "nbtfbackendstorage123"
    container_name       = "tfstate"
    key                  = "aks/terraform.tfstate"
  }
}
