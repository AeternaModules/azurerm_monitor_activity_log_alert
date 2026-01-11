resource "azurerm_monitor_activity_log_alert" "monitor_activity_log_alerts" {
  for_each = var.monitor_activity_log_alerts

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  scopes              = each.value.scopes
  description         = each.value.description
  enabled             = each.value.enabled
  tags                = each.value.tags

  criteria {
    caller                  = each.value.criteria.caller
    category                = each.value.criteria.category
    level                   = each.value.criteria.level
    levels                  = each.value.criteria.levels
    operation_name          = each.value.criteria.operation_name
    recommendation_category = each.value.criteria.recommendation_category
    recommendation_impact   = each.value.criteria.recommendation_impact
    recommendation_type     = each.value.criteria.recommendation_type
    resource_group          = each.value.criteria.resource_group
    resource_groups         = each.value.criteria.resource_groups
    dynamic "resource_health" {
      for_each = each.value.criteria.resource_health != null ? [each.value.criteria.resource_health] : []
      content {
        current  = resource_health.value.current
        previous = resource_health.value.previous
        reason   = resource_health.value.reason
      }
    }
    resource_id        = each.value.criteria.resource_id
    resource_ids       = each.value.criteria.resource_ids
    resource_provider  = each.value.criteria.resource_provider
    resource_providers = each.value.criteria.resource_providers
    resource_type      = each.value.criteria.resource_type
    resource_types     = each.value.criteria.resource_types
    dynamic "service_health" {
      for_each = each.value.criteria.service_health != null ? [each.value.criteria.service_health] : []
      content {
        events    = service_health.value.events
        locations = service_health.value.locations
        services  = service_health.value.services
      }
    }
    status       = each.value.criteria.status
    statuses     = each.value.criteria.statuses
    sub_status   = each.value.criteria.sub_status
    sub_statuses = each.value.criteria.sub_statuses
  }

  dynamic "action" {
    for_each = each.value.action != null ? [each.value.action] : []
    content {
      action_group_id    = action.value.action_group_id
      webhook_properties = action.value.webhook_properties
    }
  }
}

