module "dynamodb_table" {
  source                         = "terraform-aws-modules/dynamodb-table/aws"
  version                        = "4.2.0"
  name                           = var.db_name
  hash_key                       = "UserId"
  billing_mode                   = "PAY_PER_REQUEST"
  server_side_encryption_enabled = true

  attributes = [
    {
      name = "UserId"
      type = "S"
    }
  ]

  tags = {
    name = format("%s-database", var.prefix)
  }
}