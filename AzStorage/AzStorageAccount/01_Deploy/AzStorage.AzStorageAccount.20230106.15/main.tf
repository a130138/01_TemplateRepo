# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_storage_account" "AzStorageAccount" {
  name                     = "tftest2"
  resource_group_name      = "JoePOC1"
  location                 = "East US 2"
  account_tier             = "Premium"
  account_replication_type = "LRS"

  tags = {
    environment = "POC"
    owner       = "joseph cropper"
  }
}
