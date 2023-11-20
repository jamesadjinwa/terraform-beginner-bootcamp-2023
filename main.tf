terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  
  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.teacherseat_user_uuid
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  content_version = var.content_version
  assets_path = var.assets_path
}
/* 
data "tfe_organization" "terrahouse_aws" {
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
  domain_name = module.terrahouse_aws.cloudfront_url
  town = "missingo"
  content_version = 1
}