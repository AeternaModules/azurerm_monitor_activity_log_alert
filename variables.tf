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
    enabled             = optional(bool) # Default: true
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
    action = optional(object({
      action_group_id    = string
      webhook_properties = optional(map(string))
    }))
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
        v.criteria.levels == null || (contains(["Verbose", "Informational", "Warning", "Error", "Critical"], v.criteria.levels))
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
        v.criteria.resource_providers == null || (length(v.criteria.resource_providers) > 0)
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
        v.criteria.resource_types == null || (length(v.criteria.resource_types) > 0)
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
        v.criteria.resource_groups == null || (length(v.criteria.resource_groups) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        v.criteria.resource_ids == null || (length(v.criteria.resource_ids) > 0)
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
        v.criteria.statuses == null || (length(v.criteria.statuses) > 0)
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
        v.criteria.sub_statuses == null || (length(v.criteria.sub_statuses) > 0)
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
        v.criteria.resource_health == null || (v.criteria.resource_health.current == null || (contains(["Available", "Degraded", "Unavailable", "Unknown"], v.criteria.resource_health.current)))
      )
    ])
    error_message = "must be one of: Available, Degraded, Unavailable, Unknown"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        v.criteria.resource_health == null || (v.criteria.resource_health.previous == null || (contains(["Available", "Degraded", "Unavailable", "Unknown"], v.criteria.resource_health.previous)))
      )
    ])
    error_message = "must be one of: Available, Degraded, Unavailable, Unknown"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        v.criteria.resource_health == null || (v.criteria.resource_health.reason == null || (contains(["PlatformInitiated", "UserInitiated", "Unknown"], v.criteria.resource_health.reason)))
      )
    ])
    error_message = "must be one of: PlatformInitiated, UserInitiated, Unknown"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        v.criteria.service_health == null || (v.criteria.service_health.events == null || (contains(["Incident", "Maintenance", "Informational", "ActionRequired", "Security"], v.criteria.service_health.events)))
      )
    ])
    error_message = "must be one of: Incident, Maintenance, Informational, ActionRequired, Security"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        v.criteria.service_health == null || (v.criteria.service_health.locations == null || (length(v.criteria.service_health.locations) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.monitor_activity_log_alerts : (
        v.criteria.service_health == null || (v.criteria.service_health.services == null || (length(v.criteria.service_health.services) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_monitor_activity_log_alert's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: scopes[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: criteria.resource_id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: criteria.resource_id
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: action.action_group_id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: action.action_group_id
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

