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
  # --- Unconfirmed validation candidates, derived from azurerm_monitor_activity_log_alert's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   condition: length(value) > 0
  #   message:   must not be empty
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
  # path: criteria.category
  #   condition: contains(["Administrative", "Autoscale", "Policy", "Recommendation", "ResourceHealth", "Security", "ServiceHealth"], value)
  #   message:   must be one of: Administrative, Autoscale, Policy, Recommendation, ResourceHealth, Security, ServiceHealth
  # path: criteria.operation_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: criteria.caller
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: criteria.level
  #   condition: contains(["Verbose", "Informational", "Warning", "Error", "Critical"], value)
  #   message:   must be one of: Verbose, Informational, Warning, Error, Critical
  # path: criteria.levels[*]
  #   condition: contains(["Verbose", "Informational", "Warning", "Error", "Critical"], value)
  #   message:   must be one of: Verbose, Informational, Warning, Error, Critical
  # path: criteria.resource_provider
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: criteria.resource_providers[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: criteria.resource_type
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: criteria.resource_types[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: criteria.resource_group
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: criteria.resource_groups[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: criteria.resource_id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: criteria.resource_id
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: criteria.resource_ids[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: criteria.status
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: criteria.statuses[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: criteria.sub_status
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: criteria.sub_statuses[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: criteria.recommendation_category
  #   condition: contains(["Cost", "Reliability", "OperationalExcellence", "Performance", "HighAvailability", "Security"], value)
  #   message:   must be one of: Cost, Reliability, OperationalExcellence, Performance, HighAvailability, Security
  # path: criteria.recommendation_impact
  #   condition: contains(["High", "Medium", "Low"], value)
  #   message:   must be one of: High, Medium, Low
  # path: criteria.recommendation_type
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: criteria.resource_health.current[*]
  #   condition: contains(["Available", "Degraded", "Unavailable", "Unknown"], value)
  #   message:   must be one of: Available, Degraded, Unavailable, Unknown
  # path: criteria.resource_health.previous[*]
  #   condition: contains(["Available", "Degraded", "Unavailable", "Unknown"], value)
  #   message:   must be one of: Available, Degraded, Unavailable, Unknown
  # path: criteria.resource_health.reason[*]
  #   condition: contains(["PlatformInitiated", "UserInitiated", "Unknown"], value)
  #   message:   must be one of: PlatformInitiated, UserInitiated, Unknown
  # path: criteria.service_health.events[*]
  #   condition: contains(["Incident", "Maintenance", "Informational", "ActionRequired", "Security"], value)
  #   message:   must be one of: Incident, Maintenance, Informational, ActionRequired, Security
  # path: criteria.service_health.locations[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: criteria.service_health.services[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
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

