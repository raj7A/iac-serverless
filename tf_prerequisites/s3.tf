resource "aws_s3_bucket" "s3_tf_state_bucket" {
  bucket        = format("%s-tfstate", var.prefix)
  force_destroy = true


  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = format("%s-tf-state-bucket", var.prefix)
  }

}

resource "aws_s3_bucket_versioning" "s3_tf_state_bucket_versioning" {
  bucket = aws_s3_bucket.s3_tf_state_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_tf_state_bucket_encryption" {
  bucket = aws_s3_bucket.s3_tf_state_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_ownership_controls" "s3_tf_state_bucket_oc" {
  bucket = aws_s3_bucket.s3_tf_state_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "s3_tf_state_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.s3_tf_state_bucket_oc]

  bucket = aws_s3_bucket.s3_tf_state_bucket.id
  acl    = "private"

}

resource "aws_s3_bucket_public_access_block" "s3_tf_state_public_access_block" {
  bucket = aws_s3_bucket.s3_tf_state_bucket.bucket

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}