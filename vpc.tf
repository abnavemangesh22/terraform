resource "aws_vpc" "myvpc" {
  cidr_block = "192.168.1.0/24"
}

resource "aws_subnet" "myvpcsubnet" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = "192.168.1.0/24"
  #availability_zone = "ap-south-1b"
}

resource "aws_internet_gateway" "mygateway" {
  vpc_id = aws_vpc.myvpc.id

}

