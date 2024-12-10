# EC2 Instance Resource: Creates an EC2 instance using the default security group
resource "aws_instance" "example_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.default.id]

  tags = {
    Name = "s8mike-TerraEC2-Instance"
  }
}