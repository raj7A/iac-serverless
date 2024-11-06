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