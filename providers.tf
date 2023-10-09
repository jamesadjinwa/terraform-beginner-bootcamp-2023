terraform {
  required_providers {
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