resource "google_data_loss_prevention_job_trigger" "data_loss_prevention_job_triggers" {
  for_each = var.data_loss_prevention_job_triggers

  parent          = each.value.parent
  deletion_policy = each.value.deletion_policy
  description     = each.value.description
  display_name    = each.value.display_name
  status          = each.value.status
  trigger_id      = each.value.trigger_id

  dynamic "triggers" {
    for_each = each.value.triggers
    content {
      dynamic "manual" {
        for_each = triggers.value.manual != null ? [triggers.value.manual] : []
        content {
        }
      }
      dynamic "schedule" {
        for_each = triggers.value.schedule != null ? [triggers.value.schedule] : []
        content {
          recurrence_period_duration = schedule.value.recurrence_period_duration
        }
      }
    }
  }

  dynamic "inspect_job" {
    for_each = each.value.inspect_job != null ? [each.value.inspect_job] : []
    content {
      dynamic "actions" {
        for_each = inspect_job.value.actions != null ? inspect_job.value.actions : []
        content {
          dynamic "deidentify" {
            for_each = actions.value.deidentify != null ? [actions.value.deidentify] : []
            content {
              cloud_storage_output    = deidentify.value.cloud_storage_output
              file_types_to_transform = deidentify.value.file_types_to_transform
              dynamic "transformation_config" {
                for_each = deidentify.value.transformation_config != null ? [deidentify.value.transformation_config] : []
                content {
                  deidentify_template            = transformation_config.value.deidentify_template
                  image_redact_template          = transformation_config.value.image_redact_template
                  structured_deidentify_template = transformation_config.value.structured_deidentify_template
                }
              }
              dynamic "transformation_details_storage_config" {
                for_each = deidentify.value.transformation_details_storage_config != null ? [deidentify.value.transformation_details_storage_config] : []
                content {
                  table {
                    dataset_id = transformation_details_storage_config.value.table.dataset_id
                    project_id = transformation_details_storage_config.value.table.project_id
                    table_id   = transformation_details_storage_config.value.table.table_id
                  }
                }
              }
            }
          }
          dynamic "job_notification_emails" {
            for_each = actions.value.job_notification_emails != null ? [actions.value.job_notification_emails] : []
            content {
            }
          }
          dynamic "pub_sub" {
            for_each = actions.value.pub_sub != null ? [actions.value.pub_sub] : []
            content {
              topic = pub_sub.value.topic
            }
          }
          dynamic "publish_findings_to_dataplex_catalog" {
            for_each = actions.value.publish_findings_to_dataplex_catalog != null ? [actions.value.publish_findings_to_dataplex_catalog] : []
            content {
            }
          }
          dynamic "publish_summary_to_cscc" {
            for_each = actions.value.publish_summary_to_cscc != null ? [actions.value.publish_summary_to_cscc] : []
            content {
            }
          }
          dynamic "publish_to_stackdriver" {
            for_each = actions.value.publish_to_stackdriver != null ? [actions.value.publish_to_stackdriver] : []
            content {
            }
          }
          dynamic "save_findings" {
            for_each = actions.value.save_findings != null ? [actions.value.save_findings] : []
            content {
              output_config {
                output_schema = save_findings.value.output_config.output_schema
                dynamic "storage_path" {
                  for_each = save_findings.value.output_config.storage_path != null ? [save_findings.value.output_config.storage_path] : []
                  content {
                    path = storage_path.value.path
                  }
                }
                dynamic "table" {
                  for_each = save_findings.value.output_config.table != null ? [save_findings.value.output_config.table] : []
                  content {
                    dataset_id = table.value.dataset_id
                    project_id = table.value.project_id
                    table_id   = table.value.table_id
                  }
                }
              }
            }
          }
        }
      }
      dynamic "inspect_config" {
        for_each = inspect_job.value.inspect_config != null ? [inspect_job.value.inspect_config] : []
        content {
          dynamic "custom_info_types" {
            for_each = inspect_config.value.custom_info_types != null ? inspect_config.value.custom_info_types : []
            content {
              dynamic "dictionary" {
                for_each = custom_info_types.value.dictionary != null ? [custom_info_types.value.dictionary] : []
                content {
                  dynamic "cloud_storage_path" {
                    for_each = dictionary.value.cloud_storage_path != null ? [dictionary.value.cloud_storage_path] : []
                    content {
                      path = cloud_storage_path.value.path
                    }
                  }
                  dynamic "word_list" {
                    for_each = dictionary.value.word_list != null ? [dictionary.value.word_list] : []
                    content {
                      words = word_list.value.words
                    }
                  }
                }
              }
              exclusion_type = custom_info_types.value.exclusion_type
              info_type {
                name = custom_info_types.value.info_type.name
                dynamic "sensitivity_score" {
                  for_each = custom_info_types.value.info_type.sensitivity_score != null ? [custom_info_types.value.info_type.sensitivity_score] : []
                  content {
                    score = sensitivity_score.value.score
                  }
                }
                version = custom_info_types.value.info_type.version
              }
              likelihood = custom_info_types.value.likelihood
              dynamic "regex" {
                for_each = custom_info_types.value.regex != null ? [custom_info_types.value.regex] : []
                content {
                  group_indexes = regex.value.group_indexes
                  pattern       = regex.value.pattern
                }
              }
              dynamic "sensitivity_score" {
                for_each = custom_info_types.value.sensitivity_score != null ? [custom_info_types.value.sensitivity_score] : []
                content {
                  score = sensitivity_score.value.score
                }
              }
              dynamic "stored_type" {
                for_each = custom_info_types.value.stored_type != null ? [custom_info_types.value.stored_type] : []
                content {
                  name = stored_type.value.name
                }
              }
              dynamic "surrogate_type" {
                for_each = custom_info_types.value.surrogate_type != null ? [custom_info_types.value.surrogate_type] : []
                content {
                }
              }
            }
          }
          exclude_info_types = inspect_config.value.exclude_info_types
          include_quote      = inspect_config.value.include_quote
          dynamic "info_types" {
            for_each = inspect_config.value.info_types != null ? inspect_config.value.info_types : []
            content {
              name = info_types.value.name
              dynamic "sensitivity_score" {
                for_each = info_types.value.sensitivity_score != null ? [info_types.value.sensitivity_score] : []
                content {
                  score = sensitivity_score.value.score
                }
              }
              version = info_types.value.version
            }
          }
          dynamic "limits" {
            for_each = inspect_config.value.limits != null ? [inspect_config.value.limits] : []
            content {
              dynamic "max_findings_per_info_type" {
                for_each = limits.value.max_findings_per_info_type != null ? limits.value.max_findings_per_info_type : []
                content {
                  dynamic "info_type" {
                    for_each = max_findings_per_info_type.value.info_type != null ? [max_findings_per_info_type.value.info_type] : []
                    content {
                      name = info_type.value.name
                      dynamic "sensitivity_score" {
                        for_each = info_type.value.sensitivity_score != null ? [info_type.value.sensitivity_score] : []
                        content {
                          score = sensitivity_score.value.score
                        }
                      }
                      version = info_type.value.version
                    }
                  }
                  max_findings = max_findings_per_info_type.value.max_findings
                }
              }
              max_findings_per_item    = limits.value.max_findings_per_item
              max_findings_per_request = limits.value.max_findings_per_request
            }
          }
          min_likelihood = inspect_config.value.min_likelihood
          dynamic "rule_set" {
            for_each = inspect_config.value.rule_set != null ? inspect_config.value.rule_set : []
            content {
              dynamic "info_types" {
                for_each = rule_set.value.info_types != null ? rule_set.value.info_types : []
                content {
                  name = info_types.value.name
                  dynamic "sensitivity_score" {
                    for_each = info_types.value.sensitivity_score != null ? [info_types.value.sensitivity_score] : []
                    content {
                      score = sensitivity_score.value.score
                    }
                  }
                  version = info_types.value.version
                }
              }
              dynamic "rules" {
                for_each = rule_set.value.rules
                content {
                  dynamic "exclusion_rule" {
                    for_each = rules.value.exclusion_rule != null ? [rules.value.exclusion_rule] : []
                    content {
                      dynamic "dictionary" {
                        for_each = exclusion_rule.value.dictionary != null ? [exclusion_rule.value.dictionary] : []
                        content {
                          dynamic "cloud_storage_path" {
                            for_each = dictionary.value.cloud_storage_path != null ? [dictionary.value.cloud_storage_path] : []
                            content {
                              path = cloud_storage_path.value.path
                            }
                          }
                          dynamic "word_list" {
                            for_each = dictionary.value.word_list != null ? [dictionary.value.word_list] : []
                            content {
                              words = word_list.value.words
                            }
                          }
                        }
                      }
                      dynamic "exclude_by_hotword" {
                        for_each = exclusion_rule.value.exclude_by_hotword != null ? [exclusion_rule.value.exclude_by_hotword] : []
                        content {
                          dynamic "hotword_regex" {
                            for_each = exclude_by_hotword.value.hotword_regex != null ? [exclude_by_hotword.value.hotword_regex] : []
                            content {
                              group_indexes = hotword_regex.value.group_indexes
                              pattern       = hotword_regex.value.pattern
                            }
                          }
                          dynamic "proximity" {
                            for_each = exclude_by_hotword.value.proximity != null ? [exclude_by_hotword.value.proximity] : []
                            content {
                              window_after  = proximity.value.window_after
                              window_before = proximity.value.window_before
                            }
                          }
                        }
                      }
                      dynamic "exclude_info_types" {
                        for_each = exclusion_rule.value.exclude_info_types != null ? [exclusion_rule.value.exclude_info_types] : []
                        content {
                          dynamic "info_types" {
                            for_each = exclude_info_types.value.info_types
                            content {
                              name = info_types.value.name
                              dynamic "sensitivity_score" {
                                for_each = info_types.value.sensitivity_score != null ? [info_types.value.sensitivity_score] : []
                                content {
                                  score = sensitivity_score.value.score
                                }
                              }
                              version = info_types.value.version
                            }
                          }
                        }
                      }
                      matching_type = exclusion_rule.value.matching_type
                      dynamic "regex" {
                        for_each = exclusion_rule.value.regex != null ? [exclusion_rule.value.regex] : []
                        content {
                          group_indexes = regex.value.group_indexes
                          pattern       = regex.value.pattern
                        }
                      }
                    }
                  }
                  dynamic "hotword_rule" {
                    for_each = rules.value.hotword_rule != null ? [rules.value.hotword_rule] : []
                    content {
                      dynamic "hotword_regex" {
                        for_each = hotword_rule.value.hotword_regex != null ? [hotword_rule.value.hotword_regex] : []
                        content {
                          group_indexes = hotword_regex.value.group_indexes
                          pattern       = hotword_regex.value.pattern
                        }
                      }
                      dynamic "likelihood_adjustment" {
                        for_each = hotword_rule.value.likelihood_adjustment != null ? [hotword_rule.value.likelihood_adjustment] : []
                        content {
                          fixed_likelihood    = likelihood_adjustment.value.fixed_likelihood
                          relative_likelihood = likelihood_adjustment.value.relative_likelihood
                        }
                      }
                      dynamic "proximity" {
                        for_each = hotword_rule.value.proximity != null ? [hotword_rule.value.proximity] : []
                        content {
                          window_after  = proximity.value.window_after
                          window_before = proximity.value.window_before
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      inspect_template_name = inspect_job.value.inspect_template_name
      storage_config {
        dynamic "big_query_options" {
          for_each = inspect_job.value.storage_config.big_query_options != null ? [inspect_job.value.storage_config.big_query_options] : []
          content {
            dynamic "excluded_fields" {
              for_each = big_query_options.value.excluded_fields != null ? big_query_options.value.excluded_fields : []
              content {
                name = excluded_fields.value.name
              }
            }
            dynamic "identifying_fields" {
              for_each = big_query_options.value.identifying_fields != null ? big_query_options.value.identifying_fields : []
              content {
                name = identifying_fields.value.name
              }
            }
            dynamic "included_fields" {
              for_each = big_query_options.value.included_fields != null ? big_query_options.value.included_fields : []
              content {
                name = included_fields.value.name
              }
            }
            rows_limit         = big_query_options.value.rows_limit
            rows_limit_percent = big_query_options.value.rows_limit_percent
            sample_method      = big_query_options.value.sample_method
            table_reference {
              dataset_id = big_query_options.value.table_reference.dataset_id
              project_id = big_query_options.value.table_reference.project_id
              table_id   = big_query_options.value.table_reference.table_id
            }
          }
        }
        dynamic "cloud_storage_options" {
          for_each = inspect_job.value.storage_config.cloud_storage_options != null ? [inspect_job.value.storage_config.cloud_storage_options] : []
          content {
            bytes_limit_per_file         = cloud_storage_options.value.bytes_limit_per_file
            bytes_limit_per_file_percent = cloud_storage_options.value.bytes_limit_per_file_percent
            file_set {
              dynamic "regex_file_set" {
                for_each = cloud_storage_options.value.file_set.regex_file_set != null ? [cloud_storage_options.value.file_set.regex_file_set] : []
                content {
                  bucket_name   = regex_file_set.value.bucket_name
                  exclude_regex = regex_file_set.value.exclude_regex
                  include_regex = regex_file_set.value.include_regex
                }
              }
              url = cloud_storage_options.value.file_set.url
            }
            file_types          = cloud_storage_options.value.file_types
            files_limit_percent = cloud_storage_options.value.files_limit_percent
            sample_method       = cloud_storage_options.value.sample_method
          }
        }
        dynamic "datastore_options" {
          for_each = inspect_job.value.storage_config.datastore_options != null ? [inspect_job.value.storage_config.datastore_options] : []
          content {
            kind {
              name = datastore_options.value.kind.name
            }
            partition_id {
              namespace_id = datastore_options.value.partition_id.namespace_id
              project_id   = datastore_options.value.partition_id.project_id
            }
          }
        }
        dynamic "hybrid_options" {
          for_each = inspect_job.value.storage_config.hybrid_options != null ? [inspect_job.value.storage_config.hybrid_options] : []
          content {
            description                 = hybrid_options.value.description
            labels                      = hybrid_options.value.labels
            required_finding_label_keys = hybrid_options.value.required_finding_label_keys
            dynamic "table_options" {
              for_each = hybrid_options.value.table_options != null ? [hybrid_options.value.table_options] : []
              content {
                dynamic "identifying_fields" {
                  for_each = table_options.value.identifying_fields != null ? table_options.value.identifying_fields : []
                  content {
                    name = identifying_fields.value.name
                  }
                }
              }
            }
          }
        }
        dynamic "timespan_config" {
          for_each = inspect_job.value.storage_config.timespan_config != null ? [inspect_job.value.storage_config.timespan_config] : []
          content {
            enable_auto_population_of_timespan_config = timespan_config.value.enable_auto_population_of_timespan_config
            end_time                                  = timespan_config.value.end_time
            start_time                                = timespan_config.value.start_time
            dynamic "timestamp_field" {
              for_each = timespan_config.value.timestamp_field != null ? [timespan_config.value.timestamp_field] : []
              content {
                name = timestamp_field.value.name
              }
            }
          }
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

