# IaC-Serverless
    
## _Overview_

    Infra as Code to spin up resources on aws to run the serverless user-application, that allows users to register and verify the user

## _Architecture_

![](/images/user_application_iac_architecture.png)

## _Tools required_

1. [git](https://git-scm.com/downloads)
   ``` shell
   brew install git
   ```
2. [terraform](https://developer.hashicorp.com/terraform/install)
   ``` shell
   brew tap hashicorp/tap
   brew install hashicorp/tap/terraform
   ```
3. [aws-cli](https://github.com/aws/aws-cli)
   ``` shell
   brew install awscli
   ```
5. [tflint](https://github.com/terraform-linters/tflint)
   ``` shell
   brew install tflint
   ```
6. [tfsec](https://aquasecurity.github.io/tfsec/v0.63.1/getting-started/installation/)
   ``` shell
   brew install tfsec
   ```
7. [terraform-docs](https://terraform-docs.io/user-guide/installation/)
   ``` shell
   brew install terraform-docs
   ```

## _How to Run_
   1. Sign-in to aws,
   ```shell
   aws sso login --profile {profile} && export AWS_PROFILE={profile}
   ```
   2. Execute the following tf commands,
   ```shell
   terraform init
   terraform validate
   terraform plan
#   terraform apply
#   terraform output
#   terraform destroy
   ```
   3. Execute tf-tools commands - to be used prior to every commit,
   ```shell
   terraform fmt -recursive
   terraform-docs markdown table --output-file README.md .
   tflint --recursive
   tfsec .
   ```

## FinOps

Refer the [detailed cost estimates](finOps/iac-serverless-raj_estimate.json) file for detailed rough cost estimates generated via [Cost calculator](https://calculator.aws/#/)

	"Total Cost": {
		"monthly": "9.77",
		"upfront": "0.00",
		"12 months": "117.24"
    }

########################## **_Terraform docs generated using [terraform-docs](https://terraform-docs.io/user-guide/installation/)_** ##########################

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
| <a name="module_dynamodb_table"></a> [dynamodb\_table](#module\_dynamodb\_table) | terraform-aws-modules/dynamodb-table/aws | 4.2.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | Database name | `string` | `"user"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | prefix used for naming resources | `string` | `"iac-serverless-raj"` | no |
| <a name="input_region"></a> [region](#input\_region) | region for creating all resources | `string` | `"ap-southeast-2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_database_arn"></a> [database\_arn](#output\_database\_arn) | arn of dynamodb used for storing users |
<!-- END_TF_DOCS -->