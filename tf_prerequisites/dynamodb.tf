resource "aws_dynamodb_table" "terraform-lock" {
  name         = format("%s-tfstate-lock", var.prefix)
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  server_side_encryption {
    enabled = true
  }

  attribute {
    name = "LockID"
    type = "S"
  }
}