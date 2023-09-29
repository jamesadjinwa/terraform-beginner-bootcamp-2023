terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.19.0"
    }
  }
  cloud {
    organization = "Yaamelaa"
    
    workspaces {
      name = "terra-house-0"
    }
  }
}


provider "aws" {
  # Configuration options
}

provider "random" {
  # Configuration options
}

# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string
resource "random_string" "bucket_name" {
  length           = 48
  upper            = false
  numeric          = false 
  special          = false
  override_special = ""
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "example" {
  bucket = random_string.bucket_name.id

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

output "random_bucket_name_id" {
  value = random_string.bucket_name.id
}
