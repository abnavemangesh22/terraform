

resource "aws_instance" "myec2instance" {
ami =  "ami-04893cdb768d0f9ee"
instance_type = "t2.micro"
availability_zone = "ap-south-1b"
key_name = "mytestkey"
tags = {
   "myenv"  = "prod"
}
}