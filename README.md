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
7. [infracost](https://www.infracost.io/docs/)
   ``` shell
   brew install infracost
   ```
8. [terraform-docs](https://terraform-docs.io/user-guide/installation/)
   ``` shell
   brew install terraform-docs
   ```
