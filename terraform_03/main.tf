provider "aws" {
  region = "us-east-1"
}

variable "instance_type" {
  description = "type of instance to provision"
  default = "t2.micro"
}

variable "AMI_type" {
  description = "Value of AMI id"
  default = "ami-0e2c8caa4b6378d8c"
}

variable "Instance_count" {
  description = "Number of instances"
  default = 1
}

resource "aws_instance" "Terra-node" {
  ami = var.AMI_type
  instance_type = var.instance_type
  count = var.Instance_count
  tags = {
    Name = "Terraform-node"
  }
}