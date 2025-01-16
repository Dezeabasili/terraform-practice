provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "Terra-node" {
  ami = var.AMI_type
  instance_type = var.instance_type
  count = var.Instance_count
  tags = {
    Name = "Terraform-node"
  }
}