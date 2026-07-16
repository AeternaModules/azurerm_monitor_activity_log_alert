output "monitor_activity_log_alerts_id" {
  description = "Map of id values across all monitor_activity_log_alerts, keyed the same as var.monitor_activity_log_alerts"
  value       = { for k, v in azurerm_monitor_activity_log_alert.monitor_activity_log_alerts : k => v.id if v.id != null && length(v.id) > 0 }
}
output "monitor_activity_log_alerts_action" {
  description = "Map of action values across all monitor_activity_log_alerts, keyed the same as var.monitor_activity_log_alerts"
  value       = { for k, v in azurerm_monitor_activity_log_alert.monitor_activity_log_alerts : k => v.action if v.action != null && length(v.action) > 0 }
}
output "monitor_activity_log_alerts_criteria" {
  description = "Map of criteria values across all monitor_activity_log_alerts, keyed the same as var.monitor_activity_log_alerts"
  value       = { for k, v in azurerm_monitor_activity_log_alert.monitor_activity_log_alerts : k => v.criteria if v.criteria != null && length(v.criteria) > 0 }
}
output "monitor_activity_log_alerts_description" {
  description = "Map of description values across all monitor_activity_log_alerts, keyed the same as var.monitor_activity_log_alerts"
  value       = { for k, v in azurerm_monitor_activity_log_alert.monitor_activity_log_alerts : k => v.description if v.description != null && length(v.description) > 0 }
}
output "monitor_activity_log_alerts_enabled" {
  description = "Map of enabled values across all monitor_activity_log_alerts, keyed the same as var.monitor_activity_log_alerts"
  value       = { for k, v in azurerm_monitor_activity_log_alert.monitor_activity_log_alerts : k => v.enabled if v.enabled != null }
}
output "monitor_activity_log_alerts_location" {
  description = "Map of location values across all monitor_activity_log_alerts, keyed the same as var.monitor_activity_log_alerts"
  value       = { for k, v in azurerm_monitor_activity_log_alert.monitor_activity_log_alerts : k => v.location if v.location != null && length(v.location) > 0 }
}
output "monitor_activity_log_alerts_name" {
  description = "Map of name values across all monitor_activity_log_alerts, keyed the same as var.monitor_activity_log_alerts"
  value       = { for k, v in azurerm_monitor_activity_log_alert.monitor_activity_log_alerts : k => v.name if v.name != null && length(v.name) > 0 }
}
output "monitor_activity_log_alerts_resource_group_name" {
  description = "Map of resource_group_name values across all monitor_activity_log_alerts, keyed the same as var.monitor_activity_log_alerts"
  value       = { for k, v in azurerm_monitor_activity_log_alert.monitor_activity_log_alerts : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "monitor_activity_log_alerts_scopes" {
  description = "Map of scopes values across all monitor_activity_log_alerts, keyed the same as var.monitor_activity_log_alerts"
  value       = { for k, v in azurerm_monitor_activity_log_alert.monitor_activity_log_alerts : k => v.scopes if v.scopes != null && length(v.scopes) > 0 }
}
output "monitor_activity_log_alerts_tags" {
  description = "Map of tags values across all monitor_activity_log_alerts, keyed the same as var.monitor_activity_log_alerts"
  value       = { for k, v in azurerm_monitor_activity_log_alert.monitor_activity_log_alerts : k => v.tags if v.tags != null && length(v.tags) > 0 }
}

