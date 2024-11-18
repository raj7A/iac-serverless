module "dynamodb_table" {
  source      = "./modules/dynamodb"
  db_name     = var.db_name
  prefix      = var.prefix
  environment = var.environment
}