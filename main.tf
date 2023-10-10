module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}

data "tfe_organization" "terrahouse_aws" {
  name = "Yaamelaa"
}