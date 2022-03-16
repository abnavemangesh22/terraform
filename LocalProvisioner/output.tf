
output "myoutput" {
description = "EC2 Instance Public IP" 
value = aws_instance.myinstance.public_ip
}