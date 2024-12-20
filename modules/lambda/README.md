<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9.8 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | = 5.72.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.72.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_lambda_function"></a> [lambda\_function](#module\_lambda\_function) | terraform-aws-modules/lambda/aws | 7.14.0 |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/5.72.1/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/5.72.1/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_execution_arn"></a> [api\_execution\_arn](#input\_api\_execution\_arn) | arn of apigateway | `string` | n/a | yes |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | bucket name for storing static html contents | `string` | n/a | yes |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | Database name for storing users | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | environment to deploy the resources | `string` | n/a | yes |
| <a name="input_lambda_functions"></a> [lambda\_functions](#input\_lambda\_functions) | map of functions and the source code path that needs to be deployed | `map(string)` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | prefix used for naming resources | `string` | `"iac-serverless-raj"` | no |
| <a name="input_s3_arn"></a> [s3\_arn](#input\_s3\_arn) | s3 buckets arn - bucket for storing static html contents | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_register_user_function_arn"></a> [register\_user\_function\_arn](#output\_register\_user\_function\_arn) | arn of register user lambda function |
| <a name="output_verify_user_function_arn"></a> [verify\_user\_function\_arn](#output\_verify\_user\_function\_arn) | arn of verify user lambda function |
<!-- END_TF_DOCS -->