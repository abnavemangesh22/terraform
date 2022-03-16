resource "aws_instance" "myinstance1" {
 # provider = aws.west
  ami           = "ami-052cef05d01020f1d"
  #ami           = "ami-02f47fa62c613afb4"
  instance_type = "t2.small"
  subnet_id = aws_subnet.vpc-dev-public-subnet-1.id
  vpc_security_group_ids = [ aws_security_group.dev-vpc-sg.id ]
  #provider = aws.southeast
  tags = {
  "env" = "production"
  "myapp" = "webmicro"
  "demotag" = "refreshtest"
   }
  #availability_zone = "ap-south-1a"
  #availability_zone = "ap-south-1b"
  user_data = <<EOF
		#! /bin/bash
                sudo yum update -y
		sudo yum install -y httpd.x86_64
		sudo service httpd start
		sudo service httpd enable
		echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
	EOF
  }