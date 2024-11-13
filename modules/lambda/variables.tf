variable "prefix" {
  type        = string
  description = "prefix used for naming resources"
  default     = "iac-serverless-raj"
}

variable "bucket_name" {
  type        = string
  description = "bucket name for storing static html contents"
}

variable "db_name" {
  type        = string
  description = "Database name for storing users"
}

variable "s3_arn" {
  type        = string
  description = "s3 buckets arn - bucket for storing static html contents"
}