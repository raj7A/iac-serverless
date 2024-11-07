module "dynamodb_table" {
  source                         = "terraform-aws-modules/dynamodb-table/aws"
  version                        = "4.2.0"
  name                           = format("%s-tfstate-lock", var.prefix)
  hash_key                       = "LockID"
  billing_mode                   = "PAY_PER_REQUEST"
  server_side_encryption_enabled = true

  attributes = [
    {
      name = "LockID"
      type = "S"
    }
  ]

  tags = {
    name = format("%s-tf-statelock-database", var.prefix)
  }
}