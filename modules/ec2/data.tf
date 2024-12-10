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