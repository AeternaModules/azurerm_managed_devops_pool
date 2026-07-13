variable "managed_devops_pools" {
  description = <<EOT
Map of managed_devops_pools, attributes below
Required:
    - dev_center_project_id
    - location
    - maximum_concurrency
    - name
    - resource_group_name
    - azure_devops_organization (block):
        - organization (required, block):
            - parallelism (required)
            - projects (optional)
            - url (required)
        - permission (optional, block):
            - administrator_account (optional, block):
                - groups (optional)
                - users (optional)
            - kind (required)
    - virtual_machine_scale_set_fabric (block):
        - image (required, block):
            - aliases (optional)
            - buffer (optional)
            - id (optional)
            - well_known_image_name (optional)
        - os_disk_storage_account_type (optional)
        - security (optional, block):
            - interactive_logon_enabled (optional)
            - key_vault_management (optional, block):
                - certificate_store_location (optional)
                - certificate_store_name (optional)
                - key_export_enabled (optional)
                - key_vault_certificate_ids (required)
        - sku_name (required)
        - storage (optional, block):
            - caching (optional)
            - disk_size_in_gb (required)
            - drive_letter (optional)
            - storage_account_type (optional)
        - subnet_id (optional)
Optional:
    - tags
    - work_folder
    - identity (block):
        - identity_ids (required)
        - type (required)
    - stateful_agent (block):
        - automatic_resource_prediction (optional, block):
            - prediction_preference (optional)
        - grace_period_time_span (optional)
        - manual_resource_prediction (optional, block):
            - all_week_schedule (optional)
            - friday_schedule (optional, block):
                - count (required)
                - time (required)
            - monday_schedule (optional, block):
                - count (required)
                - time (required)
            - saturday_schedule (optional, block):
                - count (required)
                - time (required)
            - sunday_schedule (optional, block):
                - count (required)
                - time (required)
            - thursday_schedule (optional, block):
                - count (required)
                - time (required)
            - time_zone_name (optional)
            - tuesday_schedule (optional, block):
                - count (required)
                - time (required)
            - wednesday_schedule (optional, block):
                - count (required)
                - time (required)
        - maximum_agent_lifetime (optional)
    - stateless_agent (block):
        - automatic_resource_prediction (optional, block):
            - prediction_preference (optional)
        - manual_resource_prediction (optional, block):
            - all_week_schedule (optional)
            - friday_schedule (optional, block):
                - count (required)
                - time (required)
            - monday_schedule (optional, block):
                - count (required)
                - time (required)
            - saturday_schedule (optional, block):
                - count (required)
                - time (required)
            - sunday_schedule (optional, block):
                - count (required)
                - time (required)
            - thursday_schedule (optional, block):
                - count (required)
                - time (required)
            - time_zone_name (optional)
            - tuesday_schedule (optional, block):
                - count (required)
                - time (required)
            - wednesday_schedule (optional, block):
                - count (required)
                - time (required)
EOT

  type = map(object({
    dev_center_project_id = string
    location              = string
    maximum_concurrency   = number
    name                  = string
    resource_group_name   = string
    tags                  = optional(map(string))
    work_folder           = optional(string)
    azure_devops_organization = object({
      organization = list(object({
        parallelism = number
        projects    = optional(list(string))
        url         = string
      }))
      permission = optional(object({
        administrator_account = optional(object({
          groups = optional(list(string))
          users  = optional(list(string))
        }))
        kind = string
      }))
    })
    virtual_machine_scale_set_fabric = object({
      image = list(object({
        aliases               = optional(list(string))
        buffer                = optional(string)
        id                    = optional(string)
        well_known_image_name = optional(string)
      }))
      os_disk_storage_account_type = optional(string)
      security = optional(object({
        interactive_logon_enabled = optional(bool)
        key_vault_management = optional(object({
          certificate_store_location = optional(string)
          certificate_store_name     = optional(string)
          key_export_enabled         = optional(bool)
          key_vault_certificate_ids  = list(string)
        }))
      }))
      sku_name = string
      storage = optional(object({
        caching              = optional(string)
        disk_size_in_gb      = number
        drive_letter         = optional(string)
        storage_account_type = optional(string)
      }))
      subnet_id = optional(string)
    })
    identity = optional(object({
      identity_ids = set(string)
      type         = string
    }))
    stateful_agent = optional(object({
      automatic_resource_prediction = optional(object({
        prediction_preference = optional(string)
      }))
      grace_period_time_span = optional(string)
      manual_resource_prediction = optional(object({
        all_week_schedule = optional(number)
        friday_schedule = optional(list(object({
          count = number
          time  = string
        })))
        monday_schedule = optional(list(object({
          count = number
          time  = string
        })))
        saturday_schedule = optional(list(object({
          count = number
          time  = string
        })))
        sunday_schedule = optional(list(object({
          count = number
          time  = string
        })))
        thursday_schedule = optional(list(object({
          count = number
          time  = string
        })))
        time_zone_name = optional(string)
        tuesday_schedule = optional(list(object({
          count = number
          time  = string
        })))
        wednesday_schedule = optional(list(object({
          count = number
          time  = string
        })))
      }))
      maximum_agent_lifetime = optional(string)
    }))
    stateless_agent = optional(object({
      automatic_resource_prediction = optional(object({
        prediction_preference = optional(string)
      }))
      manual_resource_prediction = optional(object({
        all_week_schedule = optional(number)
        friday_schedule = optional(list(object({
          count = number
          time  = string
        })))
        monday_schedule = optional(list(object({
          count = number
          time  = string
        })))
        saturday_schedule = optional(list(object({
          count = number
          time  = string
        })))
        sunday_schedule = optional(list(object({
          count = number
          time  = string
        })))
        thursday_schedule = optional(list(object({
          count = number
          time  = string
        })))
        time_zone_name = optional(string)
        tuesday_schedule = optional(list(object({
          count = number
          time  = string
        })))
        wednesday_schedule = optional(list(object({
          count = number
          time  = string
        })))
      }))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.managed_devops_pools : (
        length(v.azure_devops_organization.organization) >= 1
      )
    ])
    error_message = "Each organization list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.managed_devops_pools : (
        length(v.virtual_machine_scale_set_fabric.image) >= 1
      )
    ])
    error_message = "Each image list must contain at least 1 items"
  }
}

