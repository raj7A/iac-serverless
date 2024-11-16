output "users_app_url" {
  description = "url of the users app"
  value       = module.apigateway-v2.stage_invoke_url
}
