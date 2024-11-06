terraform {
  backend "s3" {
    bucket = "iac-serverless-raj-tfstate"
    key    = "tfstate"
    region = "ap-southeast-2"

    dynamodb_table = "iac-serverless-raj-tfstate-lock"
    encrypt        = true
  }
}