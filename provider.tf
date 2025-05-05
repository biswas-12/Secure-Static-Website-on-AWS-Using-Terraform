terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ADD_REGION"

  #secret key
  access_key = "ADD_ACCESS_KEY"
  secret_key = "ADD_SECRET_KEY"
}


