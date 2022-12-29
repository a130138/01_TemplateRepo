provider "azurerm" {
  features {}
}
resource "azurerm_subscription" "example" {
  alias             = "examplesub"
  subscription_name = "Dev_Azure_10002_CloudSandbox3"
  subscription_id   = "239c71f8-a24e-41d1-96f6-b4f834a1f615"
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