module "lambda_function" {
  for_each = fileset("./application/user-app/src/", "*")
  source   = "terraform-aws-modules/lambda/aws"

  version       = "7.14.0"
  function_name = format("%s_%s", var.prefix, trim(each.value, local.character_to_be_removed))
  description   = format("%s lambda function", trim(each.value, local.character_to_be_removed))
  handler       = format("%s.lambda_handler", trim(each.value, local.character_to_be_removed))
  runtime       = "python3.12"
  source_path   = "./application/user-app/src/${each.value}"

  timeout = "60"

  environment_variables = {
    "DB_TABLE_NAME" = var.db_name
    "WEBSITE_S3"    = var.bucket_name
  }

  // Though the register-user and verify-user requires different resource access policies on s3 and dynamodb, below gives common access across across - DRY principle
  attach_policy_statements = true
  assume_role_policy_statements = {
    account_root = {
      effect  = "Allow",
      actions = ["sts:AssumeRole"],
      principals = {
        account_principal = {
          type = "AWS",
          identifiers = [
            format("arn:aws:sts::%s:assumed-role/%s/%s", data.aws_caller_identity.current.id, format("%s_%s", var.prefix, trim(each.value, local.character_to_be_removed)), format("%s_%s", var.prefix, trim(each.value, local.character_to_be_removed)))
          ]
        }
      }
    }
  }
  policy_statements = {
    dynamodb = {
      effect = "Allow",
      actions = [
        "dynamodb:Get*",
        "dynamodb:Query",
        "dynamodb:Scan",
        "dynamodb:Delete*",
        "dynamodb:Update*",
        "dynamodb:PutItem"
      ],
      resources = [
        format("arn:aws:dynamodb:%s:%s:table/%s", data.aws_region.current.id, data.aws_caller_identity.current.id, var.db_name)
      ]
    },
    s3_read = {
      effect    = "Allow",
      actions   = ["s3:GetObject"],
      resources = ["${module.s3.s3_arn}/*"]
    }
  }

  tags = {
    Name = format("%s-lambda", var.prefix)
  }
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

locals {
  character_to_be_removed = ".py"
}