prefix      = "iac-serverless-raj"
region      = "ap-southeast-2"
environment = "Dev"
db_name     = "user_details"
bucket_name = "user-details-static-contents"

lambda_functions = {
  "register_user" = "./application/user-app/src/register_user.py"
  "verify_user"   = "./application/user-app/src/verify_user.py"
}
