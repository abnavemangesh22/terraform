resource "aws_instance" "myinstance" {
 ami           = "ami-052cef05d01020f1d"
 key_name = "mytestkey"
 instance_type = "t2.micro"
 vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id  ]
 tags = {
  "env" = "production"
  "myapp" = "webmicro"
  "mysample" = "mytest"
   }
   user_data = file("app.sh")

   connection {
     type = "ssh"
     host = self.public_ip
     user = "ec2-user"
     password = ""
     private_key = file("private_key/mytestkey.pem")
   }
   provisioner "file" {
     source = "app.html"
     destination = "/tmp/app.html"
   }

   provisioner "file" {
     content     = "ami used: ${self.ami}"
     destination = "/tmp/file.log"
     on_failure = continue
   }

   provisioner "file" {
     source = "app1"
     destination = "/tmp"
   }
}

    
   /*Self Object
Important Technical Note: Resource references are restricted here because references create dependencies. Referring to a resource by name within its own block would create a dependency cycle.
Expressions in provisioner blocks cannot refer to their parent resource by name. Instead, they can use the special self object.
The self object represents the provisioner's parent resource, and has all of that resource's attributes.
*/