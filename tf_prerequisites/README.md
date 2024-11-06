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
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.54.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.54.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_table.terraform-lock](https://registry.terraform.io/providers/hashicorp/aws/5.54.1/docs/resources/dynamodb_table) | resource |
| [aws_s3_bucket.s3_tf_state_bucket](https://registry.terraform.io/providers/hashicorp/aws/5.54.1/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.s3_tf_state_bucket_acl](https://registry.terraform.io/providers/hashicorp/aws/5.54.1/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_ownership_controls.s3_tf_state_bucket_oc](https://registry.terraform.io/providers/hashicorp/aws/5.54.1/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_public_access_block.s3_tf_state_public_access_block](https://registry.terraform.io/providers/hashicorp/aws/5.54.1/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.s3_tf_state_bucket_encryption](https://registry.terraform.io/providers/hashicorp/aws/5.54.1/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.s3_tf_state_bucket_versioning](https://registry.terraform.io/providers/hashicorp/aws/5.54.1/docs/resources/s3_bucket_versioning) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_prefix"></a> [prefix](#input\_prefix) | prefix used for naming resources | `string` | `"iac-serverless-raj"` | no |
| <a name="input_region"></a> [region](#input\_region) | region for creating all resources | `string` | `"ap-southeast-2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tf_lock_arn"></a> [tf\_lock\_arn](#output\_tf\_lock\_arn) | arn of dynamodb used for terraform lock |
| <a name="output_tf_state_arn"></a> [tf\_state\_arn](#output\_tf\_state\_arn) | arn of s3 bucket used to store terraform state |
<!-- END_TF_DOCS -->