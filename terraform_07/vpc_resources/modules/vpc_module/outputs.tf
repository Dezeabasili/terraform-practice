output "Public-subnet-id" { 
  value = aws_subnet.Public_subnet.id
}

output "Private-subnet-id" { 
  value = aws_subnet.Private_subnet.id
}

output "BE-Security-groups-id" { 
  value = [aws_security_group.Back-End.id]
}

output "FE-Security-groups-id" { 
  value = [aws_security_group.Front-End.id]
}

output "Public-Key-name" {
  value = aws_key_pair.Public-key.key_name
}