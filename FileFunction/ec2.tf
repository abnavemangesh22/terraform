resource "aws_instance" "myinstance" {
 ami           = "ami-052cef05d01020f1d"
 #key_name = "testme"
 instance_type = "t2.micro"
 tags = {
  "env" = "production"
  "myapp" = "webmicro"
   }
   user_data = file("app.sh")
 }
  