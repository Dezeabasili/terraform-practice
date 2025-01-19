provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "Front-End" {
  ami = var.ami-id
  instance_type = var.instance-type
  subnet_id = var.Public-subnet-id
  vpc_security_group_ids = var.FE-Security-groups-id
  key_name = var.Public-Key-name

  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = terraform.workspace == "dev" ? file("~/.ssh/id_ed25519") : file("~/.ssh/my-default-key")
    host = self.public_ip
  }

  provisioner "file" {
    source = "index.html"
    destination = "/home/ubuntu/index.html"
  }

  provisioner "remote-exec" {
    inline = [ 
      "sudo apt update -y",
      "sudo apt install apache2 -y",
      "sudo mkdir /var/www/",
      "sudo mkdir /var/www/html/",
      "sudo mv /home/ubuntu/index.html /var/www/html/index.html"
     ]
  }

  tags = {
    Name = "${terraform.workspace}-Front-End"
  }
}

resource "aws_instance" "Back-End" {
  ami = var.ami-id
  instance_type = var.instance-type
  subnet_id = var.Private-subnet-id
  vpc_security_group_ids = var.BE-Security-groups-id
  key_name = var.Public-Key-name

  tags = {
    Name = "${terraform.workspace}-Back-End"
  }
}