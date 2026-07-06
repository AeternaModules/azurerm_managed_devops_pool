output "managed_devops_pools" {
  description = "All managed_devops_pool resources"
  value       = azurerm_managed_devops_pool.managed_devops_pools
}
output "managed_devops_pools_azure_devops_organization" {
  description = "List of azure_devops_organization values across all managed_devops_pools"
  value       = [for k, v in azurerm_managed_devops_pool.managed_devops_pools : v.azure_devops_organization]
}
output "managed_devops_pools_dev_center_project_id" {
  description = "List of dev_center_project_id values across all managed_devops_pools"
  value       = [for k, v in azurerm_managed_devops_pool.managed_devops_pools : v.dev_center_project_id]
}
output "managed_devops_pools_identity" {
  description = "List of identity values across all managed_devops_pools"
  value       = [for k, v in azurerm_managed_devops_pool.managed_devops_pools : v.identity]
}
output "managed_devops_pools_location" {
  description = "List of location values across all managed_devops_pools"
  value       = [for k, v in azurerm_managed_devops_pool.managed_devops_pools : v.location]
}
output "managed_devops_pools_maximum_concurrency" {
  description = "List of maximum_concurrency values across all managed_devops_pools"
  value       = [for k, v in azurerm_managed_devops_pool.managed_devops_pools : v.maximum_concurrency]
}
output "managed_devops_pools_name" {
  description = "List of name values across all managed_devops_pools"
  value       = [for k, v in azurerm_managed_devops_pool.managed_devops_pools : v.name]
}
output "managed_devops_pools_resource_group_name" {
  description = "List of resource_group_name values across all managed_devops_pools"
  value       = [for k, v in azurerm_managed_devops_pool.managed_devops_pools : v.resource_group_name]
}
output "managed_devops_pools_stateful_agent" {
  description = "List of stateful_agent values across all managed_devops_pools"
  value       = [for k, v in azurerm_managed_devops_pool.managed_devops_pools : v.stateful_agent]
}
output "managed_devops_pools_stateless_agent" {
  description = "List of stateless_agent values across all managed_devops_pools"
  value       = [for k, v in azurerm_managed_devops_pool.managed_devops_pools : v.stateless_agent]
}
output "managed_devops_pools_tags" {
  description = "List of tags values across all managed_devops_pools"
  value       = [for k, v in azurerm_managed_devops_pool.managed_devops_pools : v.tags]
}
output "managed_devops_pools_virtual_machine_scale_set_fabric" {
  description = "List of virtual_machine_scale_set_fabric values across all managed_devops_pools"
  value       = [for k, v in azurerm_managed_devops_pool.managed_devops_pools : v.virtual_machine_scale_set_fabric]
}
output "managed_devops_pools_work_folder" {
  description = "List of work_folder values across all managed_devops_pools"
  value       = [for k, v in azurerm_managed_devops_pool.managed_devops_pools : v.work_folder]
}

