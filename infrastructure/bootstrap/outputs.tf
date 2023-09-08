output "storage_account_resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "storage_account_name" {
  value = azurerm_storage_account.main.name
}

output "storage_account_container_name" {
  value = azurerm_storage_container.main.name
}
