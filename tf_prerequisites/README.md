# terraform prerequisites

## Overview
_IaC to Create resources for backend support (state file store and state locking),_
1. [S3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket)
2. [DynamoDB](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table)

########################## **_Terraform docs generated using [terraform-docs](https://terraform-docs.io/user-guide/installation/)_** ##########################
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
| <a name="module_dynamodb_table"></a> [dynamodb\_table](#module\_dynamodb\_table) | terraform-aws-modules/dynamodb-table/aws | 4.2.0 |
| <a name="module_s3_bucket"></a> [s3\_bucket](#module\_s3\_bucket) | terraform-aws-modules/s3-bucket/aws | 4.2.1 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_openid_connect_provider.default](https://registry.terraform.io/providers/hashicorp/aws/5.72.1/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_role.github_actions_role](https://registry.terraform.io/providers/hashicorp/aws/5.72.1/docs/resources/iam_role) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/5.72.1/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/5.72.1/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_prefix"></a> [prefix](#input\_prefix) | prefix used for naming resources | `string` | `"iac-serverless-raj"` | no |
| <a name="input_region"></a> [region](#input\_region) | region for creating all resources | `string` | `"ap-southeast-2"` | no |
| <a name="input_repo_name"></a> [repo\_name](#input\_repo\_name) | iac repository name | `string` | `"raj7A/iac-serverless"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tf_lock_arn"></a> [tf\_lock\_arn](#output\_tf\_lock\_arn) | arn of dynamodb used for terraform lock |
| <a name="output_tf_state_arn"></a> [tf\_state\_arn](#output\_tf\_state\_arn) | arn of s3 bucket used to store terraform state |
<!-- END_TF_DOCS -->