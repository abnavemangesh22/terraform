resource "aws_instance" "myinstance" {
   ami           = data.aws_ami.awsami.id
   instance_type = "t2.micro"
    tags = {
  "env" = "production"
  "myapp" = "webmicro"
   }
   user_data = <<EOF
		#! /bin/bash
                sudo yum update -y
		sudo yum install -y httpd.x86_64
		sudo service httpd start
		sudo service httpd enable
		echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
	EOF
  }