resource "aws_instance" "myinstance" {
  ami           = "ami-052cef05d01020f1d" #Mumbai AMI ID
  instance_type = "t2.micro"
  tags = {
  "env" = "production"
  "myapp" = "webmicro"
   }
   #availability_zone = "ap-south-1a"
  availability_zone = "ap-south-1b"
  user_data = <<EOF
		#! /bin/bash
                sudo yum update -y
		sudo yum install -y httpd.x86_64
		sudo service httpd start
		sudo service httpd enable
		echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
	EOF
  }