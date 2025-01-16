output "Public-ip-address-01" {
  value = aws_instance.Terra-node[0].public_ip
}

output "Public-ip-address-02" {
  value = aws_instance.Terra-node[1].public_ip
}

output "Private-ip-address-01" {
  value = aws_instance.Terra-node[0].private_ip
}

output "Private-ip-address-02" {
  value = aws_instance.Terra-node[1].private_ip
}