terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
}

provider "terratowns" {
  endpoint = "http://localhost:4567/api"
  user_uuid="e328f4ab-b99f-421c-84c9-4ccea042c7d1" 
  token="9b49b3fb-b8e9-483c-b703-97ba88eef8e0"
}

/* module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  content_version = var.content_version
  assets_path = var.assets_path
} */

/* data "tfe_organization" "terrahouse_aws" {
  name = "Yaamelaa"
} */



resource "terratowns_home" "home" {
  name = "Mario in 2023 and beyond!"
  description = <<DESCRIPTION
Super Mario Bros. Wonder[b] is a 2023 platform game developed and 
published by Nintendo for the Nintendo Switch. It is the first 
traditional side-scrolling Super Mario game since New Super Mario Bros. U (2012). 
The game sold 4.3 million units in its first two weeks, making it 
the fastest selling Super Mario game, and received critical acclaim. 
DESCRIPTION
  #domain_name = module.terrahouse_aws.cloudfront_url
  domain_name = "3fdq3gz.cloudfront.net"
  town = "gamers-grotto"
  content_version = 1
}