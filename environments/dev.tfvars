prefix      = "iac-serverless-raj"
region      = "ap-southeast-2"
environment = "Dev"

db_name     = "iac-serverless-raj-user-details"
bucket_name = "iac-serverless-raj-user-details-static-contents"

lambda_functions = {
  "register_user" = "./application/user-app/src/register_user.py"
  "verify_user"   = "./application/user-app/src/verify_user.py"
}
