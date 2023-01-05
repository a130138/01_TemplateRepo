# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_storage_account" "jc_storage_acct" {
  name                     = "@@AzStorageName@@"
  resource_group_name      = "@@AzRgName@@"
  location                 = "@@AzLoc@@"
  account_tier             = "@@AzSkuTier@@"
  account_replication_type = "@@AzSkuName@@"

  tags = {
    environment = "@@AzTagEnv@@"
    owner       = "@@AzTagOwn@@"
  }
}