output "database_arn" {
  description = "arn of dynamodb used for storing users"
  value       = module.dynamodb_table.database_arn
}

output "s3_arn" {
  description = "arn of s3 store that contains static html contents"
  value       = module.s3.s3_arn
}

output "user_app_url" {
  description = "url of the user app"
  value       = module.api_gateway.user_app_url
}
