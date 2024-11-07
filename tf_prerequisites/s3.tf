module "s3_bucket" {
  source                   = "terraform-aws-modules/s3-bucket/aws"
  version                  = "4.2.1"
  bucket                   = format("%s-tfstate", var.prefix)
  force_destroy            = true
  object_ownership         = "BucketOwnerPreferred"
  control_object_ownership = true
  acl                      = "private"
  block_public_acls        = true
  block_public_policy      = true
  ignore_public_acls       = true
  restrict_public_buckets  = true
  versioning = {
    enabled = true
  }
  server_side_encryption_configuration = {
    rule = {
      sse_algorithm = "AES256"
    }
  }

  tags = {
    Name = format("%s-tf-state-bucket", var.prefix)
  }

}