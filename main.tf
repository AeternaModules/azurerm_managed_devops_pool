resource "azurerm_managed_devops_pool" "managed_devops_pools" {
  for_each = var.managed_devops_pools

  dev_center_project_id = each.value.dev_center_project_id
  location              = each.value.location
  maximum_concurrency   = each.value.maximum_concurrency
  name                  = each.value.name
  resource_group_name   = each.value.resource_group_name
  tags                  = each.value.tags
  work_folder           = each.value.work_folder

  azure_devops_organization {
    dynamic "organization" {
      for_each = each.value.azure_devops_organization.organization
      content {
        parallelism = organization.value.parallelism
        projects    = organization.value.projects
        url         = organization.value.url
      }
    }
    dynamic "permission" {
      for_each = each.value.azure_devops_organization.permission != null ? [each.value.azure_devops_organization.permission] : []
      content {
        dynamic "administrator_account" {
          for_each = permission.value.administrator_account != null ? [permission.value.administrator_account] : []
          content {
            groups = administrator_account.value.groups
            users  = administrator_account.value.users
          }
        }
        kind = permission.value.kind
      }
    }
  }

  virtual_machine_scale_set_fabric {
    dynamic "image" {
      for_each = each.value.virtual_machine_scale_set_fabric.image
      content {
        aliases               = image.value.aliases
        buffer                = image.value.buffer
        id                    = image.value.id
        well_known_image_name = image.value.well_known_image_name
      }
    }
    os_disk_storage_account_type = each.value.virtual_machine_scale_set_fabric.os_disk_storage_account_type
    dynamic "security" {
      for_each = each.value.virtual_machine_scale_set_fabric.security != null ? [each.value.virtual_machine_scale_set_fabric.security] : []
      content {
        interactive_logon_enabled = security.value.interactive_logon_enabled
        dynamic "key_vault_management" {
          for_each = security.value.key_vault_management != null ? [security.value.key_vault_management] : []
          content {
            certificate_store_location = key_vault_management.value.certificate_store_location
            certificate_store_name     = key_vault_management.value.certificate_store_name
            key_export_enabled         = key_vault_management.value.key_export_enabled
            key_vault_certificate_ids  = key_vault_management.value.key_vault_certificate_ids
          }
        }
      }
    }
    sku_name = each.value.virtual_machine_scale_set_fabric.sku_name
    dynamic "storage" {
      for_each = each.value.virtual_machine_scale_set_fabric.storage != null ? [each.value.virtual_machine_scale_set_fabric.storage] : []
      content {
        caching              = storage.value.caching
        disk_size_in_gb      = storage.value.disk_size_in_gb
        drive_letter         = storage.value.drive_letter
        storage_account_type = storage.value.storage_account_type
      }
    }
    subnet_id = each.value.virtual_machine_scale_set_fabric.subnet_id
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? [each.value.identity] : []
    content {
      identity_ids = identity.value.identity_ids
      type         = identity.value.type
    }
  }

  dynamic "stateful_agent" {
    for_each = each.value.stateful_agent != null ? [each.value.stateful_agent] : []
    content {
      dynamic "automatic_resource_prediction" {
        for_each = stateful_agent.value.automatic_resource_prediction != null ? [stateful_agent.value.automatic_resource_prediction] : []
        content {
          prediction_preference = automatic_resource_prediction.value.prediction_preference
        }
      }
      grace_period_time_span = stateful_agent.value.grace_period_time_span
      dynamic "manual_resource_prediction" {
        for_each = stateful_agent.value.manual_resource_prediction != null ? [stateful_agent.value.manual_resource_prediction] : []
        content {
          all_week_schedule = manual_resource_prediction.value.all_week_schedule
          dynamic "friday_schedule" {
            for_each = manual_resource_prediction.value.friday_schedule != null ? manual_resource_prediction.value.friday_schedule : []
            content {
              count = friday_schedule.value.count
              time  = friday_schedule.value.time
            }
          }
          dynamic "monday_schedule" {
            for_each = manual_resource_prediction.value.monday_schedule != null ? manual_resource_prediction.value.monday_schedule : []
            content {
              count = monday_schedule.value.count
              time  = monday_schedule.value.time
            }
          }
          dynamic "saturday_schedule" {
            for_each = manual_resource_prediction.value.saturday_schedule != null ? manual_resource_prediction.value.saturday_schedule : []
            content {
              count = saturday_schedule.value.count
              time  = saturday_schedule.value.time
            }
          }
          dynamic "sunday_schedule" {
            for_each = manual_resource_prediction.value.sunday_schedule != null ? manual_resource_prediction.value.sunday_schedule : []
            content {
              count = sunday_schedule.value.count
              time  = sunday_schedule.value.time
            }
          }
          dynamic "thursday_schedule" {
            for_each = manual_resource_prediction.value.thursday_schedule != null ? manual_resource_prediction.value.thursday_schedule : []
            content {
              count = thursday_schedule.value.count
              time  = thursday_schedule.value.time
            }
          }
          time_zone_name = manual_resource_prediction.value.time_zone_name
          dynamic "tuesday_schedule" {
            for_each = manual_resource_prediction.value.tuesday_schedule != null ? manual_resource_prediction.value.tuesday_schedule : []
            content {
              count = tuesday_schedule.value.count
              time  = tuesday_schedule.value.time
            }
          }
          dynamic "wednesday_schedule" {
            for_each = manual_resource_prediction.value.wednesday_schedule != null ? manual_resource_prediction.value.wednesday_schedule : []
            content {
              count = wednesday_schedule.value.count
              time  = wednesday_schedule.value.time
            }
          }
        }
      }
      maximum_agent_lifetime = stateful_agent.value.maximum_agent_lifetime
    }
  }

  dynamic "stateless_agent" {
    for_each = each.value.stateless_agent != null ? [each.value.stateless_agent] : []
    content {
      dynamic "automatic_resource_prediction" {
        for_each = stateless_agent.value.automatic_resource_prediction != null ? [stateless_agent.value.automatic_resource_prediction] : []
        content {
          prediction_preference = automatic_resource_prediction.value.prediction_preference
        }
      }
      dynamic "manual_resource_prediction" {
        for_each = stateless_agent.value.manual_resource_prediction != null ? [stateless_agent.value.manual_resource_prediction] : []
        content {
          all_week_schedule = manual_resource_prediction.value.all_week_schedule
          dynamic "friday_schedule" {
            for_each = manual_resource_prediction.value.friday_schedule != null ? manual_resource_prediction.value.friday_schedule : []
            content {
              count = friday_schedule.value.count
              time  = friday_schedule.value.time
            }
          }
          dynamic "monday_schedule" {
            for_each = manual_resource_prediction.value.monday_schedule != null ? manual_resource_prediction.value.monday_schedule : []
            content {
              count = monday_schedule.value.count
              time  = monday_schedule.value.time
            }
          }
          dynamic "saturday_schedule" {
            for_each = manual_resource_prediction.value.saturday_schedule != null ? manual_resource_prediction.value.saturday_schedule : []
            content {
              count = saturday_schedule.value.count
              time  = saturday_schedule.value.time
            }
          }
          dynamic "sunday_schedule" {
            for_each = manual_resource_prediction.value.sunday_schedule != null ? manual_resource_prediction.value.sunday_schedule : []
            content {
              count = sunday_schedule.value.count
              time  = sunday_schedule.value.time
            }
          }
          dynamic "thursday_schedule" {
            for_each = manual_resource_prediction.value.thursday_schedule != null ? manual_resource_prediction.value.thursday_schedule : []
            content {
              count = thursday_schedule.value.count
              time  = thursday_schedule.value.time
            }
          }
          time_zone_name = manual_resource_prediction.value.time_zone_name
          dynamic "tuesday_schedule" {
            for_each = manual_resource_prediction.value.tuesday_schedule != null ? manual_resource_prediction.value.tuesday_schedule : []
            content {
              count = tuesday_schedule.value.count
              time  = tuesday_schedule.value.time
            }
          }
          dynamic "wednesday_schedule" {
            for_each = manual_resource_prediction.value.wednesday_schedule != null ? manual_resource_prediction.value.wednesday_schedule : []
            content {
              count = wednesday_schedule.value.count
              time  = wednesday_schedule.value.time
            }
          }
        }
      }
    }
  }
}

