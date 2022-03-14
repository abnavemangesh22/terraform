resource "aws_instance" "myappinstance" {
  ami = "ami-0e0ff68cb8e9a188a"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.myvpcsubnet.id
  availability_zone = "ap-south-1a"
  tags = {
    env = "prod"
    myset = "myapp1"
  }
}

output "myout" {
        value = aws_instance.myappinstance.id
}

output "myinstanceip" {
     value = aws_instance.myappinstance.public_ip
}

output "mytag" {
  value = aws_instance.myappinstance.tags
}