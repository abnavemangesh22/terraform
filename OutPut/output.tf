

output "ec2-IP-address" {
  description = "This is public ip Address"
  value = aws_instance.myinstance.public_ip
}

output "ec-PrivateIP" {
    value = aws_instance.myinstance.private_ip
}

output "ec2-id" {
  value = aws_instance.myinstance.id
}