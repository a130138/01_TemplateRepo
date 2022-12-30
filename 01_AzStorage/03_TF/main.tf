# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}
resource "azure_resource_group" "JoePOC1" {
   name = "JoePOC1"
   location = "East US 2"
 }
resource "azurerm_storage_account" "jc_storage_acct" {
  name                     = "jcstoracctname1"
  resource_group_name      = "JoePOC1"
  location                 = "East US 2"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "POC"
    owner = "jc"
  }
}