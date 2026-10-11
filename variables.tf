variable "data_loss_prevention_job_triggers" {
  description = <<EOT
Map of data_loss_prevention_job_triggers, attributes below
Required:
    - parent
    - triggers (block):
        - manual (optional, block):
        - schedule (optional, block):
            - recurrence_period_duration (optional)
Optional:
    - deletion_policy
    - description
    - display_name
    - status
    - trigger_id
    - inspect_job (block):
        - actions (optional, block):
            - deidentify (optional, block):
                - cloud_storage_output (required)
                - file_types_to_transform (optional)
                - transformation_config (optional, block):
                    - deidentify_template (optional)
                    - image_redact_template (optional)
                    - structured_deidentify_template (optional)
                - transformation_details_storage_config (optional, block):
                    - table (required, block):
                        - dataset_id (required)
                        - project_id (required)
                        - table_id (optional)
            - job_notification_emails (optional, block):
            - pub_sub (optional, block):
                - topic (required)
            - publish_findings_to_dataplex_catalog (optional, block):
            - publish_summary_to_cscc (optional, block):
            - publish_to_stackdriver (optional, block):
            - save_findings (optional, block):
                - output_config (required, block):
                    - output_schema (optional)
                    - storage_path (optional, block):
                        - path (required)
                    - table (optional, block):
                        - dataset_id (required)
                        - project_id (required)
                        - table_id (optional)
        - inspect_config (optional, block):
            - custom_info_types (optional, block):
                - dictionary (optional, block):
                    - cloud_storage_path (optional, block):
                        - path (required)
                    - word_list (optional, block):
                        - words (required)
                - exclusion_type (optional)
                - info_type (required, block):
                    - name (required)
                    - sensitivity_score (optional, block):
                        - score (required)
                    - version (optional)
                - likelihood (optional)
                - regex (optional, block):
                    - group_indexes (optional)
                    - pattern (required)
                - sensitivity_score (optional, block):
                    - score (required)
                - stored_type (optional, block):
                    - name (required)
                - surrogate_type (optional, block):
            - exclude_info_types (optional)
            - include_quote (optional)
            - info_types (optional, block):
                - name (required)
                - sensitivity_score (optional, block):
                    - score (required)
                - version (optional)
            - limits (optional, block):
                - max_findings_per_info_type (optional, block):
                    - info_type (optional, block):
                        - name (required)
                        - sensitivity_score (optional, block):
                            - score (required)
                        - version (optional)
                    - max_findings (optional)
                - max_findings_per_item (optional)
                - max_findings_per_request (optional)
            - min_likelihood (optional)
            - rule_set (optional, block):
                - info_types (optional, block):
                    - name (required)
                    - sensitivity_score (optional, block):
                        - score (required)
                    - version (optional)
                - rules (required, block):
                    - exclusion_rule (optional, block):
                        - dictionary (optional, block):
                            - cloud_storage_path (optional, block):
                                - path (required)
                            - word_list (optional, block):
                                - words (required)
                        - exclude_by_hotword (optional, block):
                            - hotword_regex (optional, block):
                                - group_indexes (optional)
                                - pattern (optional)
                            - proximity (optional, block):
                                - window_after (optional)
                                - window_before (optional)
                        - exclude_info_types (optional, block):
                            - info_types (required, block):
                                - name (required)
                                - sensitivity_score (optional, block):
                                    - score (required)
                                - version (optional)
                        - matching_type (required)
                        - regex (optional, block):
                            - group_indexes (optional)
                            - pattern (required)
                    - hotword_rule (optional, block):
                        - hotword_regex (optional, block):
                            - group_indexes (optional)
                            - pattern (optional)
                        - likelihood_adjustment (optional, block):
                            - fixed_likelihood (optional)
                            - relative_likelihood (optional)
                        - proximity (optional, block):
                            - window_after (optional)
                            - window_before (optional)
        - inspect_template_name (optional)
        - storage_config (required, block):
            - big_query_options (optional, block):
                - excluded_fields (optional, block):
                    - name (required)
                - identifying_fields (optional, block):
                    - name (required)
                - included_fields (optional, block):
                    - name (required)
                - rows_limit (optional)
                - rows_limit_percent (optional)
                - sample_method (optional)
                - table_reference (required, block):
                    - dataset_id (required)
                    - project_id (required)
                    - table_id (required)
            - cloud_storage_options (optional, block):
                - bytes_limit_per_file (optional)
                - bytes_limit_per_file_percent (optional)
                - file_set (required, block):
                    - regex_file_set (optional, block):
                        - bucket_name (required)
                        - exclude_regex (optional)
                        - include_regex (optional)
                    - url (optional)
                - file_types (optional)
                - files_limit_percent (optional)
                - sample_method (optional)
            - datastore_options (optional, block):
                - kind (required, block):
                    - name (required)
                - partition_id (required, block):
                    - namespace_id (optional)
                    - project_id (required)
            - hybrid_options (optional, block):
                - description (optional)
                - labels (optional)
                - required_finding_label_keys (optional)
                - table_options (optional, block):
                    - identifying_fields (optional, block):
                        - name (required)
            - timespan_config (optional, block):
                - enable_auto_population_of_timespan_config (optional)
                - end_time (optional)
                - start_time (optional)
                - timestamp_field (optional, block):
                    - name (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    parent          = string
    deletion_policy = optional(string)
    description     = optional(string)
    display_name    = optional(string)
    status          = optional(string)
    trigger_id      = optional(string)
    triggers = list(object({
      manual = optional(object({
      }))
      schedule = optional(object({
        recurrence_period_duration = optional(string)
      }))
    }))
    inspect_job = optional(object({
      actions = optional(list(object({
        deidentify = optional(object({
          cloud_storage_output    = string
          file_types_to_transform = optional(list(string))
          transformation_config = optional(object({
            deidentify_template            = optional(string)
            image_redact_template          = optional(string)
            structured_deidentify_template = optional(string)
          }))
          transformation_details_storage_config = optional(object({
            table = object({
              dataset_id = string
              project_id = string
              table_id   = optional(string)
            })
          }))
        }))
        job_notification_emails = optional(object({
        }))
        pub_sub = optional(object({
          topic = string
        }))
        publish_findings_to_dataplex_catalog = optional(object({
        }))
        publish_summary_to_cscc = optional(object({
        }))
        publish_to_stackdriver = optional(object({
        }))
        save_findings = optional(object({
          output_config = object({
            output_schema = optional(string)
            storage_path = optional(object({
              path = string
            }))
            table = optional(object({
              dataset_id = string
              project_id = string
              table_id   = optional(string)
            }))
          })
        }))
      })))
      inspect_config = optional(object({
        custom_info_types = optional(list(object({
          dictionary = optional(object({
            cloud_storage_path = optional(object({
              path = string
            }))
            word_list = optional(object({
              words = list(string)
            }))
          }))
          exclusion_type = optional(string)
          info_type = object({
            name = string
            sensitivity_score = optional(object({
              score = string
            }))
            version = optional(string)
          })
          likelihood = optional(string)
          regex = optional(object({
            group_indexes = optional(list(number))
            pattern       = string
          }))
          sensitivity_score = optional(object({
            score = string
          }))
          stored_type = optional(object({
            name = string
          }))
          surrogate_type = optional(object({
          }))
        })))
        exclude_info_types = optional(bool)
        include_quote      = optional(bool)
        info_types = optional(list(object({
          name = string
          sensitivity_score = optional(object({
            score = string
          }))
          version = optional(string)
        })))
        limits = optional(object({
          max_findings_per_info_type = optional(list(object({
            info_type = optional(object({
              name = string
              sensitivity_score = optional(object({
                score = string
              }))
              version = optional(string)
            }))
            max_findings = optional(number)
          })))
          max_findings_per_item    = optional(number)
          max_findings_per_request = optional(number)
        }))
        min_likelihood = optional(string)
        rule_set = optional(list(object({
          info_types = optional(list(object({
            name = string
            sensitivity_score = optional(object({
              score = string
            }))
            version = optional(string)
          })))
          rules = list(object({
            exclusion_rule = optional(object({
              dictionary = optional(object({
                cloud_storage_path = optional(object({
                  path = string
                }))
                word_list = optional(object({
                  words = list(string)
                }))
              }))
              exclude_by_hotword = optional(object({
                hotword_regex = optional(object({
                  group_indexes = optional(list(number))
                  pattern       = optional(string)
                }))
                proximity = optional(object({
                  window_after  = optional(number)
                  window_before = optional(number)
                }))
              }))
              exclude_info_types = optional(object({
                info_types = list(object({
                  name = string
                  sensitivity_score = optional(object({
                    score = string
                  }))
                  version = optional(string)
                }))
              }))
              matching_type = string
              regex = optional(object({
                group_indexes = optional(list(number))
                pattern       = string
              }))
            }))
            hotword_rule = optional(object({
              hotword_regex = optional(object({
                group_indexes = optional(list(number))
                pattern       = optional(string)
              }))
              likelihood_adjustment = optional(object({
                fixed_likelihood    = optional(string)
                relative_likelihood = optional(number)
              }))
              proximity = optional(object({
                window_after  = optional(number)
                window_before = optional(number)
              }))
            }))
          }))
        })))
      }))
      inspect_template_name = optional(string)
      storage_config = object({
        big_query_options = optional(object({
          excluded_fields = optional(list(object({
            name = string
          })))
          identifying_fields = optional(list(object({
            name = string
          })))
          included_fields = optional(list(object({
            name = string
          })))
          rows_limit         = optional(number)
          rows_limit_percent = optional(number)
          sample_method      = optional(string)
          table_reference = object({
            dataset_id = string
            project_id = string
            table_id   = string
          })
        }))
        cloud_storage_options = optional(object({
          bytes_limit_per_file         = optional(number)
          bytes_limit_per_file_percent = optional(number)
          file_set = object({
            regex_file_set = optional(object({
              bucket_name   = string
              exclude_regex = optional(list(string))
              include_regex = optional(list(string))
            }))
            url = optional(string)
          })
          file_types          = optional(list(string))
          files_limit_percent = optional(number)
          sample_method       = optional(string)
        }))
        datastore_options = optional(object({
          kind = object({
            name = string
          })
          partition_id = object({
            namespace_id = optional(string)
            project_id   = string
          })
        }))
        hybrid_options = optional(object({
          description                 = optional(string)
          labels                      = optional(map(string))
          required_finding_label_keys = optional(list(string))
          table_options = optional(object({
            identifying_fields = optional(list(object({
              name = string
            })))
          }))
        }))
        timespan_config = optional(object({
          enable_auto_population_of_timespan_config = optional(bool)
          end_time                                  = optional(string)
          start_time                                = optional(string)
          timestamp_field = optional(object({
            name = string
          }))
        }))
      })
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.data_loss_prevention_job_triggers : (
        length(v.triggers) >= 1
      )
    ])
    error_message = "Each triggers list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_loss_prevention_job_triggers : (
        v.inspect_job == null || (v.inspect_job.inspect_config == null || (v.inspect_job.inspect_config.rule_set == null || alltrue([for item in v.inspect_job.inspect_config.rule_set : (length(item.rules) >= 1)])))
      )
    ])
    error_message = "Each rules list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_loss_prevention_job_triggers : (
        v.inspect_job == null || (v.inspect_job.inspect_config == null || (v.inspect_job.inspect_config.rule_set == null || alltrue([for item in v.inspect_job.inspect_config.rule_set : (alltrue([for item in item.rules : (item.exclusion_rule == null || (item.exclusion_rule.exclude_info_types == null || (length(item.exclusion_rule.exclude_info_types.info_types) >= 1)))]))])))
      )
    ])
    error_message = "Each info_types list must contain at least 1 items"
  }
  # Note: 17 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

