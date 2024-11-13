module "lambda_function" {
  source      = "./modules/lambda"
  prefix      = var.prefix
  bucket_name = var.bucket_name
  db_name     = var.db_name
  s3_arn      = module.s3.s3_arn
}