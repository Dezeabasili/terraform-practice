provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "Front-End" {
  ami = "ami-0e2c8caa4b6378d8c"
  instance_type = "t2.micro"
  subnet_id = var.Public-subnet-id
  vpc_security_group_ids = var.FE-Security-groups-id
  key_name = var.Public-Key-name
  tags = {
    Name = "Front-End"
  }
}

resource "aws_instance" "Back-End" {
  ami = "ami-0e2c8caa4b6378d8c"
  instance_type = "t2.micro"
  subnet_id = var.Private-subnet-id
  vpc_security_group_ids = var.BE-Security-groups-id
  key_name = var.Public-Key-name
  tags = {
    Name = "Back-End"
  }
}