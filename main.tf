data "tfe_organization" "terrahouse_aws" {
  name = "Yaamelaa"
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
  public_path = var.assets_path
}

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

module "home_mario" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.teacherseat_user_uuid
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  content_version = var.content_version
  assets_path = var.assets_path
  public_path = var.mario.public_path
}

resource "terratowns_home" "home_mario" {
  name = "Making your Payday Bar"
  description = <<DESCRIPTION
Super Mario Bros. Wonder[b] is a 2023 platform game developed and 
published by Nintendo for the Nintendo Switch. It is the first 
traditional side-scrolling Super Mario game since New Super Mario Bros. U (2012). 
The game sold 4.3 million units in its first two weeks, making it 
the fastest selling Super Mario game, and received critical acclaim.
DESCRIPTION
  domain_name = module.home_mario.domain_name
  town = "missingo"
  content_version = var.mario.content_version
}

module "home_payday_hosting" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.teacherseat_user_uuid
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  content_version = var.content_version
  assets_path = var.assets_path
  public_path = var.payday.public_path
}

resource "terratowns_home" "home_payday" {
  name = "Making your Payday Bar"
  description = <<DESCRIPTION
Since I really like Payday candy bars but they cost so much to import
into Canada, I decided I would see how I could my own Paydays bars,
and if they are most cost effective.
DESCRIPTION
  domain_name = module.home_payday_hosting.domain_name
  town = "missingo"
  content_version = var.payday.content_version
}