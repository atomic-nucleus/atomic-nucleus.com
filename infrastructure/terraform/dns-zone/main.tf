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

resource "azurerm_dns_zone" "main" {
  name = var.dns_zone_name

  resource_group_name = data.azurerm_resource_group.main.name
  tags                = merge(data.azurerm_resource_group.main.tags, var.dns_zone_tags)
}

resource "azurerm_dns_a_record" "main" {
  for_each = { for a_record in var.dns_zone_a_records : a_record.name => a_record }

  zone_name = azurerm_dns_zone.main.name

  name    = each.value.name
  records = each.value.records
  ttl     = each.value.ttl

  resource_group_name = azurerm_dns_zone.main.resource_group_name
  tags                = merge(azurerm_dns_zone.main.tags, each.value.tags)
}

resource "azurerm_dns_ns_record" "main" {
  for_each = { for ns_record in var.dns_zone_ns_records : ns_record.name => ns_record }

  zone_name = azurerm_dns_zone.main.name

  name    = each.value.name
  records = each.value.records
  ttl     = each.value.ttl

  resource_group_name = azurerm_dns_zone.main.resource_group_name
  tags                = merge(azurerm_dns_zone.main.tags, each.value.tags)
}
