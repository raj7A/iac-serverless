module "lambda_function" {
  source            = "./modules/lambda"
  prefix            = var.prefix
  bucket_name       = var.bucket_name
  db_name           = var.db_name
  s3_arn            = module.s3.s3_arn
  lambda_functions  = var.lambda_functions
  api_execution_arn = module.api_gateway.api_execution_arn
}