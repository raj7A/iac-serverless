module "lambda_function" {
  for_each = fileset("./application/user-app/src/", "*")
  source   = "terraform-aws-modules/lambda/aws"

  version       = "7.14.0"
  function_name = format("%s_%s", var.prefix, trim(each.value, ".py"))
  description   = format("%s lambda function", trim(each.value, ".py"))
  handler       = format("%s.lambda_handler", trim(each.value, ".py"))
  runtime       = "python3.12"
  source_path   = "./application/user-app/src/${each.value}"

  environment_variables = {
    "DB_TABLE_NAME" = var.db_name
  }

  tags = {
    Name = format("%s-lambda", var.prefix)
  }
}