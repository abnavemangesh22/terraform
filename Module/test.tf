module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "myawsinstance"

  ami                    = "ami-04893cdb768d0f9ee"
  instance_type          = "t2.micro"
  key_name               = "mytestkey"
  monitoring             = true
  vpc_security_group_ids = ["sg-8c124ce2"]
  subnet_id              = "subnet-66b22f2a"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

output "myout" {
    value = module.ec2_instance.public_ip
}