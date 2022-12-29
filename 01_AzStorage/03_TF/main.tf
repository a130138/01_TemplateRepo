provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "example"  {
    name     = "JoePOC1"
    location = "East US 2"
}
resource "azurerm_storage_account" "example"  {
    name                     = "jcstoracct1"
    resource_group_name      = azurerm_resource_group.example.name
    location                 = azurerm_resource_group.example.location
    account_tier             = "Standard"
    account_replication_type = "GRS"

    tags = {
      environment = "POC"
    }
}