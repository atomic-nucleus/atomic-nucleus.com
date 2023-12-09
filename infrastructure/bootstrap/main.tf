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

# see: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
resource "azurerm_resource_group" "main" {
  name     = "DefaultResourceGroup-CCAN"
  location = "canadacentral"

  tags = {
    "ManagedBy"     = "Terraform"
    "ManagedByRepo" = "https://github.com/atomic-nucleus/atomic-nucleus.com/"
  }
}

# see: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account
resource "azurerm_storage_account" "main" {
  name                     = "sa00tf00tvdxmhgghsgevtln"
  account_tier             = "Standard"
  account_replication_type = "RAGRS"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  tags = merge(azurerm_resource_group.main.tags, {})
}

# see: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container
resource "azurerm_storage_container" "main" {
  name                 = "terraform-state"
  storage_account_name = azurerm_storage_account.main.name
}
