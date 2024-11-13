module "lambda_function" {
  for_each = fileset("./application/user-app/src/", "*")
  source   = "terraform-aws-modules/lambda/aws"

  version       = "7.14.0"
  function_name = format("%s_%s", var.prefix, trim(each.value, local.character_to_be_removed))
  description   = format("%s lambda function", trim(each.value, local.character_to_be_removed))
  handler       = format("%s.lambda_handler", trim(each.value, local.character_to_be_removed))
  runtime       = "python3.12"
  source_path   = "./application/user-app/src/${each.value}"
  trigger_on_package_timestamp = false
  timeout = "60"

  environment_variables = {
    "DB_TABLE_NAME" = var.db_name
    "WEBSITE_S3"    = var.bucket_name
  }

  create_role              = true
  attach_policy_statements = true
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
      resources = ["${var.s3_arn}/*"]
    }
  }

  cloudwatch_logs_tags = {
    Name = format("%s-lambda-cloudwatch-logs", var.prefix)
  }
  function_tags = {
    Name = format("%s-lambda-function", var.prefix)
  }
  role_tags = {
    Name = format("%s-lambda-roles", var.prefix)
  }

}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

locals {
  character_to_be_removed = ".py"
}