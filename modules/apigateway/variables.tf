variable "prefix" {
  type        = string
  description = "prefix used for naming resources"
  default     = "iac-serverless-raj"
}

variable "register_user_function_arn" {
  type        = string
  description = "arn of register_user lambda function"
}

variable "verify_user_function_arn" {
  type        = string
  description = "arn of verify_user lambda function"
}