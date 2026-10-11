data "azurerm_storage_table_entity" "storage_table_entity_lookup" {
  for_each = var.storage_table_entity_lookup

  partition_key    = each.value.partition_key
  row_key          = each.value.row_key
  storage_table_id = each.value.storage_table_id
}

