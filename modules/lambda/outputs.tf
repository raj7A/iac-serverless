output "register_user_function_arn" {
  description = "arn of register_user lambda function"
  value       = module.lambda_function["register_user"].lambda_function_arn
}

output "verify_user_function_arn" {
  description = "arn of verify_user lambda function"
  value       = module.lambda_function["verify_user"].lambda_function_arn
}
