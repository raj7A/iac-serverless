variable "prefix" {
  type        = string
  description = "prefix used for naming resources"
  default     = "iac-serverless-raj"
}

variable "environment" {
  type        = string
  description = "environment to deploy the resources"
}

variable "db_name" {
  type        = string
  description = "Database name for storing users"
}
