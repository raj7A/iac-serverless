variable "prefix" {
  type        = string
  description = "prefix used for naming resources"
  default     = "iac-serverless-raj"
}

variable "bucket_name" {
  type        = string
  description = "bucket name for storing static html contents"
}