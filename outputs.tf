output "managed_devops_pools_id" {
  description = "Map of id values across all managed_devops_pools, keyed the same as var.managed_devops_pools"
  value       = { for k, v in azurerm_managed_devops_pool.managed_devops_pools : k => v.id if v.id != null && length(v.id) > 0 }
}
output "managed_devops_pools_azure_devops_organization" {
  description = "Map of azure_devops_organization values across all managed_devops_pools, keyed the same as var.managed_devops_pools"
  value       = { for k, v in azurerm_managed_devops_pool.managed_devops_pools : k => v.azure_devops_organization if v.azure_devops_organization != null && length(v.azure_devops_organization) > 0 }
}
output "managed_devops_pools_dev_center_project_id" {
  description = "Map of dev_center_project_id values across all managed_devops_pools, keyed the same as var.managed_devops_pools"
  value       = { for k, v in azurerm_managed_devops_pool.managed_devops_pools : k => v.dev_center_project_id if v.dev_center_project_id != null && length(v.dev_center_project_id) > 0 }
}
output "managed_devops_pools_identity" {
  description = "Map of identity values across all managed_devops_pools, keyed the same as var.managed_devops_pools"
  value       = { for k, v in azurerm_managed_devops_pool.managed_devops_pools : k => v.identity if v.identity != null && length(v.identity) > 0 }
}
output "managed_devops_pools_location" {
  description = "Map of location values across all managed_devops_pools, keyed the same as var.managed_devops_pools"
  value       = { for k, v in azurerm_managed_devops_pool.managed_devops_pools : k => v.location if v.location != null && length(v.location) > 0 }
}
output "managed_devops_pools_maximum_concurrency" {
  description = "Map of maximum_concurrency values across all managed_devops_pools, keyed the same as var.managed_devops_pools"
  value       = { for k, v in azurerm_managed_devops_pool.managed_devops_pools : k => v.maximum_concurrency if v.maximum_concurrency != null }
}
output "managed_devops_pools_name" {
  description = "Map of name values across all managed_devops_pools, keyed the same as var.managed_devops_pools"
  value       = { for k, v in azurerm_managed_devops_pool.managed_devops_pools : k => v.name if v.name != null && length(v.name) > 0 }
}
output "managed_devops_pools_resource_group_name" {
  description = "Map of resource_group_name values across all managed_devops_pools, keyed the same as var.managed_devops_pools"
  value       = { for k, v in azurerm_managed_devops_pool.managed_devops_pools : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "managed_devops_pools_stateful_agent" {
  description = "Map of stateful_agent values across all managed_devops_pools, keyed the same as var.managed_devops_pools"
  value       = { for k, v in azurerm_managed_devops_pool.managed_devops_pools : k => v.stateful_agent if v.stateful_agent != null && length(v.stateful_agent) > 0 }
}
output "managed_devops_pools_stateless_agent" {
  description = "Map of stateless_agent values across all managed_devops_pools, keyed the same as var.managed_devops_pools"
  value       = { for k, v in azurerm_managed_devops_pool.managed_devops_pools : k => v.stateless_agent if v.stateless_agent != null && length(v.stateless_agent) > 0 }
}
output "managed_devops_pools_tags" {
  description = "Map of tags values across all managed_devops_pools, keyed the same as var.managed_devops_pools"
  value       = { for k, v in azurerm_managed_devops_pool.managed_devops_pools : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "managed_devops_pools_virtual_machine_scale_set_fabric" {
  description = "Map of virtual_machine_scale_set_fabric values across all managed_devops_pools, keyed the same as var.managed_devops_pools"
  value       = { for k, v in azurerm_managed_devops_pool.managed_devops_pools : k => v.virtual_machine_scale_set_fabric if v.virtual_machine_scale_set_fabric != null && length(v.virtual_machine_scale_set_fabric) > 0 }
}
output "managed_devops_pools_work_folder" {
  description = "Map of work_folder values across all managed_devops_pools, keyed the same as var.managed_devops_pools"
  value       = { for k, v in azurerm_managed_devops_pool.managed_devops_pools : k => v.work_folder if v.work_folder != null && length(v.work_folder) > 0 }
}

