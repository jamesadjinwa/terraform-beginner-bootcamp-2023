terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.16.2"
    }
  }
  #required_version = "~> 1.6.4"
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity
data "aws_caller_identity" "current" {}