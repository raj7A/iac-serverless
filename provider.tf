terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
  }
  required_version = ">= 1.9.8"
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      ManagedBy     = "Terraform"
      Project       = var.prefix
      Environment   = "Dev"
      TechOwner     = "user_team@mycompany.com"
      BusinessOwner = "user_business_team@mycompany.com"
    }
  }
}