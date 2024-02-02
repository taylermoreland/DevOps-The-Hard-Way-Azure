terraform {
  required_version = ">= 1.5.7"
  backend "azurerm" {
    resource_group_name  = "nl004pa-tayler-dev"
    storage_account_name = "nl004devsa"
    container_name       = "tfstate"
    key                  = "acr-terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "acr_resource_group" {
  name     = "nl004pa-tayler-dev"
  location = var.location

  tags = var.tags

}

resource "azurerm_container_registry" "acr" {
  name                = "nl004acrdev"
  resource_group_name = azurerm_resource_group.acr_resource_group.name
  location            = azurerm_resource_group.acr_resource_group.location
  sku                 = "Standard"
  admin_enabled       = false

  tags = var.tags

}