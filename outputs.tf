output "managed_devops_pools_id" {
  description = "Map of id values across all managed_devops_pools, keyed the same as var.managed_devops_pools"
  value       = { for k, v in azurerm_managed_devops_pool.managed_devops_pools : k => v.id }
}
output "managed_devops_pools_azure_devops_organization" {
  description = "Map of azure_devops_organization values across all managed_devops_pools, keyed the same as var.managed_devops_pools"
  value       = { for k, v in azurerm_managed_devops_pool.managed_devops_pools : k => v.azure_devops_organization }
}
output "managed_devops_pools_dev_center_project_id" {
  description = "Map of dev_center_project_id values across all managed_devops_pools, keyed the same as var.managed_devops_pools"
  value       = { for k, v in azurerm_managed_devops_pool.managed_devops_pools : k => v.dev_center_project_id }
}
output "managed_devops_pools_identity" {
  description = "Map of identity values across all managed_devops_pools, keyed the same as var.managed_devops_pools"
  value       = { for k, v in azurerm_managed_devops_pool.managed_devops_pools : k => v.identity }
}
output "managed_devops_pools_location" {
  description = "Map of location values across all managed_devops_pools, keyed the same as var.managed_devops_pools"
  value       = { for k, v in azurerm_managed_devops_pool.managed_devops_pools : k => v.location }
}
output "managed_devops_pools_maximum_concurrency" {
  description = "Map of maximum_concurrency values across all managed_devops_pools, keyed the same as var.managed_devops_pools"
  value       = { for k, v in azurerm_managed_devops_pool.managed_devops_pools : k => v.maximum_concurrency }
}
output "managed_devops_pools_name" {
  description = "Map of name values across all managed_devops_pools, keyed the same as var.managed_devops_pools"
  value       = { for k, v in azurerm_managed_devops_pool.managed_devops_pools : k => v.name }
}
output "managed_devops_pools_resource_group_name" {
  description = "Map of resource_group_name values across all managed_devops_pools, keyed the same as var.managed_devops_pools"
  value       = { for k, v in azurerm_managed_devops_pool.managed_devops_pools : k => v.resource_group_name }
}
output "managed_devops_pools_stateful_agent" {
  description = "Map of stateful_agent values across all managed_devops_pools, keyed the same as var.managed_devops_pools"
  value       = { for k, v in azurerm_managed_devops_pool.managed_devops_pools : k => v.stateful_agent }
}
output "managed_devops_pools_stateless_agent" {
  description = "Map of stateless_agent values across all managed_devops_pools, keyed the same as var.managed_devops_pools"
  value       = { for k, v in azurerm_managed_devops_pool.managed_devops_pools : k => v.stateless_agent }
}
output "managed_devops_pools_tags" {
  description = "Map of tags values across all managed_devops_pools, keyed the same as var.managed_devops_pools"
  value       = { for k, v in azurerm_managed_devops_pool.managed_devops_pools : k => v.tags }
}
output "managed_devops_pools_virtual_machine_scale_set_fabric" {
  description = "Map of virtual_machine_scale_set_fabric values across all managed_devops_pools, keyed the same as var.managed_devops_pools"
  value       = { for k, v in azurerm_managed_devops_pool.managed_devops_pools : k => v.virtual_machine_scale_set_fabric }
}
output "managed_devops_pools_work_folder" {
  description = "Map of work_folder values across all managed_devops_pools, keyed the same as var.managed_devops_pools"
  value       = { for k, v in azurerm_managed_devops_pool.managed_devops_pools : k => v.work_folder }
}

