output "data_loss_prevention_job_triggers_id" {
  description = "Map of id values across all data_loss_prevention_job_triggers, keyed the same as var.data_loss_prevention_job_triggers except keys with no id are omitted"
  value       = { for k, v in google_data_loss_prevention_job_trigger.data_loss_prevention_job_triggers : k => v.id if v.id != null && length(v.id) > 0 }
}
output "data_loss_prevention_job_triggers_create_time" {
  description = "Map of create_time values across all data_loss_prevention_job_triggers, keyed the same as var.data_loss_prevention_job_triggers except keys with no create_time are omitted"
  value       = { for k, v in google_data_loss_prevention_job_trigger.data_loss_prevention_job_triggers : k => v.create_time if v.create_time != null && length(v.create_time) > 0 }
}
output "data_loss_prevention_job_triggers_deletion_policy" {
  description = "Map of deletion_policy values across all data_loss_prevention_job_triggers, keyed the same as var.data_loss_prevention_job_triggers except keys with no deletion_policy are omitted"
  value       = { for k, v in google_data_loss_prevention_job_trigger.data_loss_prevention_job_triggers : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "data_loss_prevention_job_triggers_description" {
  description = "Map of description values across all data_loss_prevention_job_triggers, keyed the same as var.data_loss_prevention_job_triggers except keys with no description are omitted"
  value       = { for k, v in google_data_loss_prevention_job_trigger.data_loss_prevention_job_triggers : k => v.description if v.description != null && length(v.description) > 0 }
}
output "data_loss_prevention_job_triggers_display_name" {
  description = "Map of display_name values across all data_loss_prevention_job_triggers, keyed the same as var.data_loss_prevention_job_triggers except keys with no display_name are omitted"
  value       = { for k, v in google_data_loss_prevention_job_trigger.data_loss_prevention_job_triggers : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "data_loss_prevention_job_triggers_inspect_job" {
  description = "Map of inspect_job values across all data_loss_prevention_job_triggers, keyed the same as var.data_loss_prevention_job_triggers except keys with no inspect_job are omitted"
  value       = { for k, v in google_data_loss_prevention_job_trigger.data_loss_prevention_job_triggers : k => one(v.inspect_job) if v.inspect_job != null && length(v.inspect_job) > 0 }
}
output "data_loss_prevention_job_triggers_last_run_time" {
  description = "Map of last_run_time values across all data_loss_prevention_job_triggers, keyed the same as var.data_loss_prevention_job_triggers except keys with no last_run_time are omitted"
  value       = { for k, v in google_data_loss_prevention_job_trigger.data_loss_prevention_job_triggers : k => v.last_run_time if v.last_run_time != null && length(v.last_run_time) > 0 }
}
output "data_loss_prevention_job_triggers_name" {
  description = "Map of name values across all data_loss_prevention_job_triggers, keyed the same as var.data_loss_prevention_job_triggers except keys with no name are omitted"
  value       = { for k, v in google_data_loss_prevention_job_trigger.data_loss_prevention_job_triggers : k => v.name if v.name != null && length(v.name) > 0 }
}
output "data_loss_prevention_job_triggers_parent" {
  description = "Map of parent values across all data_loss_prevention_job_triggers, keyed the same as var.data_loss_prevention_job_triggers except keys with no parent are omitted"
  value       = { for k, v in google_data_loss_prevention_job_trigger.data_loss_prevention_job_triggers : k => v.parent if v.parent != null && length(v.parent) > 0 }
}
output "data_loss_prevention_job_triggers_status" {
  description = "Map of status values across all data_loss_prevention_job_triggers, keyed the same as var.data_loss_prevention_job_triggers except keys with no status are omitted"
  value       = { for k, v in google_data_loss_prevention_job_trigger.data_loss_prevention_job_triggers : k => v.status if v.status != null && length(v.status) > 0 }
}
output "data_loss_prevention_job_triggers_trigger_id" {
  description = "Map of trigger_id values across all data_loss_prevention_job_triggers, keyed the same as var.data_loss_prevention_job_triggers except keys with no trigger_id are omitted"
  value       = { for k, v in google_data_loss_prevention_job_trigger.data_loss_prevention_job_triggers : k => v.trigger_id if v.trigger_id != null && length(v.trigger_id) > 0 }
}
output "data_loss_prevention_job_triggers_triggers" {
  description = "Map of triggers values across all data_loss_prevention_job_triggers, keyed the same as var.data_loss_prevention_job_triggers except keys with no triggers are omitted"
  value       = { for k, v in google_data_loss_prevention_job_trigger.data_loss_prevention_job_triggers : k => v.triggers if v.triggers != null && length(v.triggers) > 0 }
}
output "data_loss_prevention_job_triggers_update_time" {
  description = "Map of update_time values across all data_loss_prevention_job_triggers, keyed the same as var.data_loss_prevention_job_triggers except keys with no update_time are omitted"
  value       = { for k, v in google_data_loss_prevention_job_trigger.data_loss_prevention_job_triggers : k => v.update_time if v.update_time != null && length(v.update_time) > 0 }
}

