variable "prefix" {
  type        = string
  description = "prefix used for naming resources"
  default     = "iac-serverless-raj"
}

variable "region" {
  type        = string
  description = "region for creating all resources"
  default     = "ap-southeast-2"
}

variable "environment" {
  type        = string
  description = "environment to deploy the resources"
  default     = "Dev"
}

variable "repo_name" {
  type        = string
  description = "iac repository name"
  default     = "raj7A/iac-serverless"
}

variable "bucket_name" {
  type        = string
  description = "bucket name for storing static contents"
  default     = "user-details-static-contents"
}