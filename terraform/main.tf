terraform {
  backend "remote" {
    # The name of your Terraform Cloud organization.
    organization = "curso-aws-com-terraform"

    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = "gha-terraform"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

resource "null_resource" "example" {
  triggers = {
    value = "A example resource that does nothing! And that's amazing, isn't it? It has run on ${timestamp()}"
  }
}

resource "random_pet" "this" {
  length = 5
}

resource "aws_s3_bucket" "this" {
  bucket = random_pet.this.id
}
