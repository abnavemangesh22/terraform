resource "aws_instance" "myinstance" {
 ami           = "ami-052cef05d01020f1d"
 key_name = "mytestkey"
 instance_type = "t2.micro"
 vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id  ]
 tags = {
  "env" = "production"
  "myapp" = "webmicro"
   }
   user_data = file("app.sh")
    }  

  resource "time_sleep" "wait_90_seconds" {
  depends_on = [aws_instance.myinstance]
  create_duration = "90s"
}


resource "null_resource" "sync_app1_static" {
  depends_on = [ time_sleep.wait_90_seconds ]
  triggers = {
    always-update =  timestamp()
  }

connection {
    type = "ssh"
    host = aws_instance.myinstance.public_ip 
    user = "ec2-user"
    password = ""
    private_key = file("private_key/mytestkey.pem")
  }  

  provisioner "file" {
    source      = "app.html"
    destination = "/tmp/app.html"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mv /tmp/app.html /tmp/null-1.html"
    ]
  }

}




   /*Self Object
Important Technical Note: Resource references are restricted here because references create dependencies. Referring to a resource by name within its own block would create a dependency cycle.
Expressions in provisioner blocks cannot refer to their parent resource by name. Instead, they can use the special self object.
The self object represents the provisioner's parent resource, and has all of that resource's attributes.
*/