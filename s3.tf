module "s3_bucket" {
  source                   = "terraform-aws-modules/s3-bucket/aws"
  version                  = "4.2.1"
  bucket                   = var.bucket_name
  force_destroy            = true
  object_ownership         = "BucketOwnerPreferred"
  control_object_ownership = true
  acl                      = "private"
  block_public_acls        = true
  block_public_policy      = true
  ignore_public_acls       = true
  restrict_public_buckets  = true
  server_side_encryption_configuration = {
    rule = {
      sse_algorithm = "AES256"
    }
  }

  tags = {
    Name = format("%s-%s", var.prefix, var.bucket_name)
  }

}

resource "aws_s3_object" "user_app_static_page_objects" {
  for_each = fileset("./application/user-app/static-page/", "*")

  bucket = module.s3_bucket.s3_bucket_id
  key    = each.value
  source = "./application/user-app/static-page/${each.value}"

  tags = {
    Name = format("%s-%s", var.prefix, "user-app-static-page")
  }

}