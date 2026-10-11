variable "storage_table_entity_lookup" {
  description = <<EOT
Map of storage_table_entity_lookup, attributes below
Required:
    - partition_key
    - row_key
    - storage_table_id
EOT

  type = map(object({
    partition_key    = string
    row_key          = string
    storage_table_id = string
  }))
  validation {
    condition = alltrue([
      for k, v in var.storage_table_entity_lookup : (
        length(v.partition_key) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.storage_table_entity_lookup : (
        length(v.row_key) > 0
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

