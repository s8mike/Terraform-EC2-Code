# Terraform Block: Specifies the Terraform and provider versions
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# AWS Provider Configuration: Specifies the AWS region
provider "aws" {
  region = "us-east-1"  # Replace with your preferred AWS region
}