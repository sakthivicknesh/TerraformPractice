output "Public-IP" {
    value = aws_instance.example.public_ip
}

output "Private-IP" {
    value = aws_instance.example.private_ip
}

output "VM-name" {
    value = aws_instance.example.tags.Name
}

output "security-group-name" {
    value = aws_instance.example.vpc_security_group_ids
}