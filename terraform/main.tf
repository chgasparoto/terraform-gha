//terraform {
//  backend "remote" {
//    # The name of your Terraform Cloud organization.
//    organization = "curso-aws-com-terraform"
//
//    # The name of the Terraform Cloud workspace to store Terraform state files in.
//    workspaces {
//      name = "gha-terraform"
//    }
//  }
//}

terraform {
  required_version = "0.15.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.32.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }

  backend "s3" {}
}

provider "aws" {
  region = "eu-central-1"
}

resource "random_pet" "this" {
  length = 5
}

resource "aws_s3_bucket" "this" {
  bucket = random_pet.this.id
}
