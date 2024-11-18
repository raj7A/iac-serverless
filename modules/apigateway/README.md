<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.8 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | = 5.72.1 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_apigateway-v2"></a> [apigateway-v2](#module\_apigateway-v2) | terraform-aws-modules/apigateway-v2/aws | 5.2.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | environment to deploy the resources | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | prefix used for naming resources | `string` | `"iac-serverless-raj"` | no |
| <a name="input_register_user_function_arn"></a> [register\_user\_function\_arn](#input\_register\_user\_function\_arn) | arn of register\_user lambda function | `string` | n/a | yes |
| <a name="input_verify_user_function_arn"></a> [verify\_user\_function\_arn](#input\_verify\_user\_function\_arn) | arn of verify\_user lambda function | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_execution_arn"></a> [api\_execution\_arn](#output\_api\_execution\_arn) | arn of api executor |
| <a name="output_users_app_url"></a> [users\_app\_url](#output\_users\_app\_url) | url of the users app |
<!-- END_TF_DOCS -->