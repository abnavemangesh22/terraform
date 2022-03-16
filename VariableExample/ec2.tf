resource "aws_instance" "myinstance" {
  ami   = var.ec2_ami_id #mumbai AMI ID
  count = var.ec2_instance_count
  instance_type = var.ec2_instance_type["big"]
  tags = {
  "env" = "production"
  "myapp" = "webmicro"
   }
  availability_zone = "ap-south-1a"
  user_data = <<EOF
		#! /bin/bash
                sudo yum update -y
		sudo yum install -y httpd.x86_64
		sudo service httpd start
		sudo service httpd enable
		echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
	EOF
  }