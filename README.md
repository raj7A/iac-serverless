# IaC-Serverless
    
## _Overview_

    Infra as Code to spin up resources on aws to run the serverless user-application, that allows to register and verify the user

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
   2. Create pre-requisite resources,
   ```shell
   cd tf_prerequisites/
   terraform apply
```
   3. Create the remaining resources manually or via pipeline,
   ```shell
   terraform init
   terraform validate
   terraform plan --var-file=dev.tfvars
#   terraform apply --var-file=dev.tfvars
#   terraform output
#   terraform destroy
   ```
   4. Execute tf-tools commands - _to be used prior to every commit,_
   ```shell
   terraform fmt -recursive
   terraform-docs markdown table --output-file README.md .
   tflint --recursive
   tfsec .
   ```

## _How to Test_ :
### Curl :
```shell
curl -X POST '{users_app_url_from_terraform_output}/register?UserId=Raj7'
curl -X POST '{users_app_url_from_terraform_output}/?UserId=Raj7' > verified_user.html
```
### Output :

**_Register user ->_**

![](/images/register_user_output.png)

**_Verify user ->_**

![](/images/verify_user_output.png)
## _FinOps_

Refer the [detailed cost estimates](finOps/iac-serverless-raj_estimate.json) file for detailed rough cost estimates generated via [Cost calculator](https://calculator.aws/#/)
 ``` json
		"Total Cost": {
		"monthly": "21.29",
		"upfront": "0.00",
		"12 months": "255.48"
	}
  ``` 

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
| <a name="module_api_gateway"></a> [api\_gateway](#module\_api\_gateway) | ./modules/apigateway | n/a |
| <a name="module_dynamodb_table"></a> [dynamodb\_table](#module\_dynamodb\_table) | ./modules/dynamodb | n/a |
| <a name="module_lambda_function"></a> [lambda\_function](#module\_lambda\_function) | ./modules/lambda | n/a |
| <a name="module_s3"></a> [s3](#module\_s3) | ./modules/s3 | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | bucket name for storing static html contents | `string` | n/a | yes |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | Database name for storing users | `string` | n/a | yes |
| <a name="input_lambda_functions"></a> [lambda\_functions](#input\_lambda\_functions) | map of functions and the source code path that needs to be deployed | `map(string)` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | prefix used for naming resources | `string` | `"iac-serverless-raj"` | no |
| <a name="input_region"></a> [region](#input\_region) | region for creating all resources | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_database_arn"></a> [database\_arn](#output\_database\_arn) | arn of dynamodb used for storing users |
| <a name="output_s3_arn"></a> [s3\_arn](#output\_s3\_arn) | arn of s3 store that contains static html contents |
| <a name="output_users_app_url"></a> [users\_app\_url](#output\_users\_app\_url) | url of the users app |
<!-- END_TF_DOCS -->