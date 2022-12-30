provider "azurerm" {
  features {}
}
resource "azurerm_storage_account" "example" {
  name                     = "jcstoracct1"
  resource_group_name      = "JoePOC1"
  location                 = "East US 2"
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "POC"
  }
}