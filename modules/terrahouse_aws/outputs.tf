output "bucket_name" {
  value = aws_s3_bucket.project_bucket.bucket
}

output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.website_configuration
}

output "cloudfront_url" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}

output "domain_name" {
  value = aws_cloudfront_distribution.s3_distribution.domain_name
}