output "monitor_activity_log_alerts" {
  description = "All monitor_activity_log_alert resources"
  value       = azurerm_monitor_activity_log_alert.monitor_activity_log_alerts
}
output "monitor_activity_log_alerts_action" {
  description = "List of action values across all monitor_activity_log_alerts"
  value       = [for k, v in azurerm_monitor_activity_log_alert.monitor_activity_log_alerts : v.action]
}
output "monitor_activity_log_alerts_criteria" {
  description = "List of criteria values across all monitor_activity_log_alerts"
  value       = [for k, v in azurerm_monitor_activity_log_alert.monitor_activity_log_alerts : v.criteria]
}
output "monitor_activity_log_alerts_description" {
  description = "List of description values across all monitor_activity_log_alerts"
  value       = [for k, v in azurerm_monitor_activity_log_alert.monitor_activity_log_alerts : v.description]
}
output "monitor_activity_log_alerts_enabled" {
  description = "List of enabled values across all monitor_activity_log_alerts"
  value       = [for k, v in azurerm_monitor_activity_log_alert.monitor_activity_log_alerts : v.enabled]
}
output "monitor_activity_log_alerts_location" {
  description = "List of location values across all monitor_activity_log_alerts"
  value       = [for k, v in azurerm_monitor_activity_log_alert.monitor_activity_log_alerts : v.location]
}
output "monitor_activity_log_alerts_name" {
  description = "List of name values across all monitor_activity_log_alerts"
  value       = [for k, v in azurerm_monitor_activity_log_alert.monitor_activity_log_alerts : v.name]
}
output "monitor_activity_log_alerts_resource_group_name" {
  description = "List of resource_group_name values across all monitor_activity_log_alerts"
  value       = [for k, v in azurerm_monitor_activity_log_alert.monitor_activity_log_alerts : v.resource_group_name]
}
output "monitor_activity_log_alerts_scopes" {
  description = "List of scopes values across all monitor_activity_log_alerts"
  value       = [for k, v in azurerm_monitor_activity_log_alert.monitor_activity_log_alerts : v.scopes]
}
output "monitor_activity_log_alerts_tags" {
  description = "List of tags values across all monitor_activity_log_alerts"
  value       = [for k, v in azurerm_monitor_activity_log_alert.monitor_activity_log_alerts : v.tags]
}

