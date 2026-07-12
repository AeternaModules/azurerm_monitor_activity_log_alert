output "monitor_activity_log_alerts_action" {
  description = "Map of action values across all monitor_activity_log_alerts, keyed the same as var.monitor_activity_log_alerts"
  value       = { for k, v in azurerm_monitor_activity_log_alert.monitor_activity_log_alerts : k => v.action }
}
output "monitor_activity_log_alerts_criteria" {
  description = "Map of criteria values across all monitor_activity_log_alerts, keyed the same as var.monitor_activity_log_alerts"
  value       = { for k, v in azurerm_monitor_activity_log_alert.monitor_activity_log_alerts : k => v.criteria }
}
output "monitor_activity_log_alerts_description" {
  description = "Map of description values across all monitor_activity_log_alerts, keyed the same as var.monitor_activity_log_alerts"
  value       = { for k, v in azurerm_monitor_activity_log_alert.monitor_activity_log_alerts : k => v.description }
}
output "monitor_activity_log_alerts_enabled" {
  description = "Map of enabled values across all monitor_activity_log_alerts, keyed the same as var.monitor_activity_log_alerts"
  value       = { for k, v in azurerm_monitor_activity_log_alert.monitor_activity_log_alerts : k => v.enabled }
}
output "monitor_activity_log_alerts_location" {
  description = "Map of location values across all monitor_activity_log_alerts, keyed the same as var.monitor_activity_log_alerts"
  value       = { for k, v in azurerm_monitor_activity_log_alert.monitor_activity_log_alerts : k => v.location }
}
output "monitor_activity_log_alerts_name" {
  description = "Map of name values across all monitor_activity_log_alerts, keyed the same as var.monitor_activity_log_alerts"
  value       = { for k, v in azurerm_monitor_activity_log_alert.monitor_activity_log_alerts : k => v.name }
}
output "monitor_activity_log_alerts_resource_group_name" {
  description = "Map of resource_group_name values across all monitor_activity_log_alerts, keyed the same as var.monitor_activity_log_alerts"
  value       = { for k, v in azurerm_monitor_activity_log_alert.monitor_activity_log_alerts : k => v.resource_group_name }
}
output "monitor_activity_log_alerts_scopes" {
  description = "Map of scopes values across all monitor_activity_log_alerts, keyed the same as var.monitor_activity_log_alerts"
  value       = { for k, v in azurerm_monitor_activity_log_alert.monitor_activity_log_alerts : k => v.scopes }
}
output "monitor_activity_log_alerts_tags" {
  description = "Map of tags values across all monitor_activity_log_alerts, keyed the same as var.monitor_activity_log_alerts"
  value       = { for k, v in azurerm_monitor_activity_log_alert.monitor_activity_log_alerts : k => v.tags }
}

