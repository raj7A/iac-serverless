module "apigateway-v2" {
  source      = "terraform-aws-modules/apigateway-v2/aws"
  version     = "5.2.0"
  name        = format("%s_user_details", var.prefix)
  description = "User application HTTP api gateway"

  body = templatefile("templates/users_app_contract.yaml", {
    register_user_function_arn = var.register_user_function_arn
  })

  # Disable creation of the domain name and API mapping
  create_domain_name = false
  # Disable creation of Route53 alias record(s) for the custom domain
  create_domain_records = false
  # Disable creation of the ACM certificate for the custom domain
  create_certificate = false

  # Stage
  stage_access_log_settings = {
    create_log_group            = true
    log_group_retention_in_days = 1
    format = jsonencode({
      context = {
        domainName              = "$context.domainName"
        integrationErrorMessage = "$context.integrationErrorMessage"
        protocol                = "$context.protocol"
        requestId               = "$context.requestId"
        requestTime             = "$context.requestTime"
        responseLength          = "$context.responseLength"
        routeKey                = "$context.routeKey"
        stage                   = "$context.stage"
        status                  = "$context.status"
        error = {
          message      = "$context.error.message"
          responseType = "$context.error.responseType"
        }
        identity = {
          sourceIP = "$context.identity.sourceIp"
        }
        integration = {
          error             = "$context.integration.error"
          integrationStatus = "$context.integration.integrationStatus"
        }
      }
    })
  }
}