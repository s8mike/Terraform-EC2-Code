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