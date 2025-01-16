provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "vpc-01" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "VPC-Terraform"
  }
}

resource "aws_subnet" "Public_subnet" {
  vpc_id = aws_vpc.vpc-01.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Public_subnet"
  }
}

resource "aws_subnet" "Private_subnet" {
  vpc_id = aws_vpc.vpc-01.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "Private_subnet"
  }
}

resource "aws_internet_gateway" "Internet-Gateway" {
  vpc_id = aws_vpc.vpc-01.id

  tags = {
    Name = "IGW-Don"
  }
}

resource "aws_route_table" "Public_RT" {
  vpc_id = aws_vpc.vpc-01.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Internet-Gateway.id
  }

  tags = {
    Name = "Public_RT"
  }
}

resource "aws_route_table" "Private_RT" {
  vpc_id = aws_vpc.vpc-01.id

  tags = {
    Name = "Private_RT"
  }
}

resource "aws_route_table_association" "RT-Assoc-Public" {
  subnet_id      = aws_subnet.Public_subnet.id
  route_table_id = aws_route_table.Public_RT.id
}

resource "aws_route_table_association" "RT-Assoc-Private" {
  subnet_id      = aws_subnet.Private_subnet.id
  route_table_id = aws_route_table.Private_RT.id
}

resource "aws_security_group" "Front-End" {
  name   = "Front-End"
  vpc_id = aws_vpc.vpc-01.id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Front-End"
  }
}

resource "aws_security_group" "Back-End" {
  name   = "Back-End"
  vpc_id = aws_vpc.vpc-01.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.Front-End.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Back-End"
  }
}

resource "aws_key_pair" "Public-key" {
  key_name   = "Public-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ/0Ny2FEPFKWbuX40oi9A1EzihJAszE31Rh/RvsPWMI dezeabasili@DESKTOP-9L5GVCJ"
}

resource "aws_instance" "Front-End" {
  ami = "ami-0e2c8caa4b6378d8c"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.Public_subnet.id
  vpc_security_group_ids = [aws_security_group.Front-End.id]
  key_name = aws_key_pair.Public-key.key_name
  tags = {
    Name = "Front-End"
  }
}

resource "aws_instance" "Back-End" {
  ami = "ami-0e2c8caa4b6378d8c"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.Private_subnet.id
  vpc_security_group_ids = [aws_security_group.Back-End.id]
  key_name = aws_key_pair.Public-key.key_name
  tags = {
    Name = "Back-End"
  }
}