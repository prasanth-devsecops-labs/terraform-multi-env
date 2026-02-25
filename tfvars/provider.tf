terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.33.0"
    }
  }
  backend "s3" {
    # Leave this empty or with minimal fields
    # Terraform will fill these in from dev/backend.tf
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}