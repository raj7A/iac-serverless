module "lambda_function" {
  for_each = var.lambda_functions
  source   = "terraform-aws-modules/lambda/aws"

  version       = "7.14.0"
  function_name = format("%s-%s", var.prefix, each.key)
  description   = format("%s lambda function", each.key)
  handler       = format("%s.lambda_handler", each.key)
  runtime       = "python3.12"
  source_path   = each.value
  publish       = true

  timeout = "60"

  environment_variables = {
    "DB_TABLE_NAME" = var.db_name
    "WEBSITE_S3"    = var.bucket_name
  }

  allowed_triggers = {
    AllowExecutionFromAPIGateway = {
      service    = "apigateway"
      source_arn = "${var.api_execution_arn}/*/*"
    }
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