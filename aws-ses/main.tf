terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket = "guddititf"
    region = "us-east-1"
    key = "state"

    
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
