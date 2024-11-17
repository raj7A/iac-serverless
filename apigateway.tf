module "api_gateway" {
  source                     = "./modules/apigateway"
  prefix                     = var.prefix
  register_user_function_arn = module.lambda_function.register_user_function_arn
  verify_user_function_arn   = module.lambda_function.verify_user_function_arn
}