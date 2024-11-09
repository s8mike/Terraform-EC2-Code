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

# Variables for AMI ID and Instance Type
variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"  # Free tier eligible
}

variable "ami_id" {
  description = "Amazon Linux 2 AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0984f4b9e98be44bf"  # Example for Amazon Linux 2 in us-east-1
}

# Retrieve the default security group ID
data "aws_security_group" "default" {
  filter {
    name   = "group-name"
    values = ["default"]
  }
  vpc_id = data.aws_vpc.default.id  # Automatically references the default VPC
}

# Retrieve the default VPC ID
data "aws_vpc" "default" {
  default = true
}

# EC2 Instance Resource: Creates an EC2 instance using the default security group
resource "aws_instance" "example_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.default.id]

  tags = {
    Name = "s8mike-TerraEC2-Instance"
  }
}