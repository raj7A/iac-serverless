output "database_arn" {
  description = "arn of dynamodb used for storing users"
  value       = module.dynamodb_table.dynamodb_table_arn
}
