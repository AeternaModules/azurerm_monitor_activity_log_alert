variable "monitor_activity_log_alerts" {
  description = <<EOT
Map of monitor_activity_log_alerts, attributes below
Required:
    - location
    - name
    - resource_group_name
    - scopes
    - criteria (block):
        - caller (optional)
        - category (required)
        - level (optional)
        - levels (optional)
        - operation_name (optional)
        - recommendation_category (optional)
        - recommendation_impact (optional)
        - recommendation_type (optional)
        - resource_group (optional)
        - resource_groups (optional)
        - resource_health (optional, block):
            - current (optional)
            - previous (optional)
            - reason (optional)
        - resource_id (optional)
        - resource_ids (optional)
        - resource_provider (optional)
        - resource_providers (optional)
        - resource_type (optional)
        - resource_types (optional)
        - service_health (optional, block):
            - events (optional)
            - locations (optional)
            - services (optional)
        - status (optional)
        - statuses (optional)
        - sub_status (optional)
        - sub_statuses (optional)
Optional:
    - description
    - enabled
    - tags
    - action (block):
        - action_group_id (required)
        - webhook_properties (optional)
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    scopes              = set(string)
    description         = optional(string)
    enabled             = optional(bool)
    tags                = optional(map(string))
    criteria = object({
      caller                  = optional(string)
      category                = string
      level                   = optional(string)
      levels                  = optional(list(string))
      operation_name          = optional(string)
      recommendation_category = optional(string)
      recommendation_impact   = optional(string)
      recommendation_type     = optional(string)
      resource_group          = optional(string)
      resource_groups         = optional(list(string))
      resource_health = optional(object({
        current  = optional(set(string))
        previous = optional(set(string))
        reason   = optional(set(string))
      }))
      resource_id        = optional(string)
      resource_ids       = optional(list(string))
      resource_provider  = optional(string)
      resource_providers = optional(list(string))
      resource_type      = optional(string)
      resource_types     = optional(list(string))
      service_health = optional(object({
        events    = optional(set(string))
        locations = optional(set(string))
        services  = optional(set(string))
      }))
      status       = optional(string)
      statuses     = optional(list(string))
      sub_status   = optional(string)
      sub_statuses = optional(list(string))
    })
    action = optional(list(object({
      action_group_id    = string
      webhook_properties = optional(map(string))
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        length(v.name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        alltrue([for x in v.scopes : length(x) > 0])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        contains(["Administrative", "Autoscale", "Policy", "Recommendation", "ResourceHealth", "Security", "ServiceHealth"], v.criteria.category)
      )
    ])
    error_message = "must be one of: Administrative, Autoscale, Policy, Recommendation, ResourceHealth, Security, ServiceHealth"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        v.criteria.operation_name == null || (length(v.criteria.operation_name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        v.criteria.caller == null || (length(v.criteria.caller) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        v.criteria.level == null || (contains(["Verbose", "Informational", "Warning", "Error", "Critical"], v.criteria.level))
      )
    ])
    error_message = "must be one of: Verbose, Informational, Warning, Error, Critical"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        v.criteria.levels == null || (alltrue([for x in v.criteria.levels : contains(["Verbose", "Informational", "Warning", "Error", "Critical"], x)]))
      )
    ])
    error_message = "must be one of: Verbose, Informational, Warning, Error, Critical"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        v.criteria.resource_provider == null || (length(v.criteria.resource_provider) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        v.criteria.resource_providers == null || (alltrue([for x in v.criteria.resource_providers : length(x) > 0]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        v.criteria.resource_type == null || (length(v.criteria.resource_type) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        v.criteria.resource_types == null || (alltrue([for x in v.criteria.resource_types : length(x) > 0]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        v.criteria.resource_group == null || (length(v.criteria.resource_group) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        v.criteria.resource_groups == null || (alltrue([for x in v.criteria.resource_groups : length(x) > 0]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        v.criteria.resource_ids == null || (alltrue([for x in v.criteria.resource_ids : length(x) > 0]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        v.criteria.status == null || (length(v.criteria.status) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        v.criteria.statuses == null || (alltrue([for x in v.criteria.statuses : length(x) > 0]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        v.criteria.sub_status == null || (length(v.criteria.sub_status) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        v.criteria.sub_statuses == null || (alltrue([for x in v.criteria.sub_statuses : length(x) > 0]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        v.criteria.recommendation_category == null || (contains(["Cost", "Reliability", "OperationalExcellence", "Performance", "HighAvailability", "Security"], v.criteria.recommendation_category))
      )
    ])
    error_message = "must be one of: Cost, Reliability, OperationalExcellence, Performance, HighAvailability, Security"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        v.criteria.recommendation_impact == null || (contains(["High", "Medium", "Low"], v.criteria.recommendation_impact))
      )
    ])
    error_message = "must be one of: High, Medium, Low"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        v.criteria.recommendation_type == null || (length(v.criteria.recommendation_type) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        v.criteria.resource_health == null || (v.criteria.resource_health.current == null || (alltrue([for x in v.criteria.resource_health.current : contains(["Available", "Degraded", "Unavailable", "Unknown"], x)])))
      )
    ])
    error_message = "must be one of: Available, Degraded, Unavailable, Unknown"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        v.criteria.resource_health == null || (v.criteria.resource_health.previous == null || (alltrue([for x in v.criteria.resource_health.previous : contains(["Available", "Degraded", "Unavailable", "Unknown"], x)])))
      )
    ])
    error_message = "must be one of: Available, Degraded, Unavailable, Unknown"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        v.criteria.resource_health == null || (v.criteria.resource_health.reason == null || (alltrue([for x in v.criteria.resource_health.reason : contains(["PlatformInitiated", "UserInitiated", "Unknown"], x)])))
      )
    ])
    error_message = "must be one of: PlatformInitiated, UserInitiated, Unknown"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        v.criteria.service_health == null || (v.criteria.service_health.events == null || (alltrue([for x in v.criteria.service_health.events : contains(["Incident", "Maintenance", "Informational", "ActionRequired", "Security"], x)])))
      )
    ])
    error_message = "must be one of: Incident, Maintenance, Informational, ActionRequired, Security"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        v.criteria.service_health == null || (v.criteria.service_health.locations == null || (alltrue([for x in v.criteria.service_health.locations : length(x) > 0])))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        v.criteria.service_health == null || (v.criteria.service_health.services == null || (alltrue([for x in v.criteria.service_health.services : length(x) > 0])))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 9 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

