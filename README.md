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
   terraform-docs markdown table --output-file README-tf.md .
   tflint --recursive
   tfsec .
   ```

## FinOps

Refer the [detailed cost estimates](FinOps/iac-serverless-raj_estimate.json) file for detailed rough cost estimates generated via [Cost calculator](https://calculator.aws/#/)

![](/FinOps/total_cost.png)