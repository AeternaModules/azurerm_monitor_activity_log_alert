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
}

