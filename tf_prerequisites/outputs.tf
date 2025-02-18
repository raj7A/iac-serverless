output "tf_lock_arn" {
  description = "arn of dynamodb used for terraform lock"
  value       = module.dynamodb_table.dynamodb_table_arn
}

output "tf_state_arn" {
  description = "arn of s3 bucket used to store terraform state"
  value       = module.s3_bucket.s3_bucket_arn
}