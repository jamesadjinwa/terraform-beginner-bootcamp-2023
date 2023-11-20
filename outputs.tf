# output "bucket_name" {
#   description = "Bucket name for our static website"
#   value = module.terrahouse_aws
# }

# output "s3_website_endpoint" {
#   description = "S3 Static Website hosting endpoint"
#   value = module.terrahouse_aws.website_endpoint
# }

# output "cloudfront_url" {
#   description = "The CloudFront Distribution Domain Name"
#   value = module.terrahouse_aws.cloudfront_url
# }

output "bucket_name" {
  description = "Bucket name for our static website hosting"
  #value = module.terrahouse_aws.bucket_name
  value = module.home_mario.bucket_name
}

output "s3_website_endpoint" {
  description = "S3 Static Website hosting endpoint"
  #value = module.terrahouse_aws.website_endpoint
  value = module.home_mario.website_endpoint
}

output "cloudfront_url" {
  description = "The CloudFront Distribution Domain Name"
  #value = module.terrahouse_aws.cloudfront_url
  value = module.home_mario.cloudfront_url
}