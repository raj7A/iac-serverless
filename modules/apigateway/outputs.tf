output "user_app_url" {
  description = "url of the user app"
  value       = module.apigateway-v2.stage_invoke_url
}

output "api_execution_arn" {
  description = "arn of api executor"
  value       = module.apigateway-v2.api_execution_arn
}
