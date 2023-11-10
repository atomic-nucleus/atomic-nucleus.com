terraform {
  required_version = ">= 1.5.0, < 2.0.0"

  required_providers {
    # see: https://registry.terraform.io/providers/hashicorp/azurerm/latest
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.72.0"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "main" {
  name = var.resource_group_name
}

resource "azurerm_container_registry" "main" {
  name          = var.name
  admin_enabled = var.admin_enabled
  sku           = var.sku

  resource_group_name = data.azurerm_resource_group.main.name
  location            = data.azurerm_resource_group.main.location
  tags                = merge(data.azurerm_resource_group.main.tags, var.tags)
}
