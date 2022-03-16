resource "aws_eip" "my-eip" {
  instance = aws_instance.myinstance1.id
   vpc = true
    #Meta argument depends_on should be mentioned
   depends_on = [
     aws_internet_gateway.vpc-dev-igw
   ]
}