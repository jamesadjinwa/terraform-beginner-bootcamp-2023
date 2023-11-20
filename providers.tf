terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.19.0"
    }

    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }  

  # backend "local" {
  #   path = "terraform.tfstate"
  # }

  cloud {
    organization = "Yaamelaa"
    
    workspaces {
      name = "terra-house-0"
    }
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity
data "aws_caller_identity" "current" {}

# provider "aws" {
#   # Configuration options
# }