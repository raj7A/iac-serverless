output "s3_arn" {
  description = "arn of s3 store that contains static html contents"
  value       = module.s3_bucket.s3_bucket_arn
}