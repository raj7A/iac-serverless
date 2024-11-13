variable "prefix" {
  type        = string
  description = "prefix used for naming resources"
  default     = "iac-serverless-raj"
}

variable "db_name" {
  type        = string
  description = "Database name for storing users"
}
