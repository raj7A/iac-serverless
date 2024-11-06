output "tf_lock_arn" {
  description = "arn of dynamodb used for terraform lock"
  value       = aws_dynamodb_table.terraform-lock.arn
}