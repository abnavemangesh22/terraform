# creating the VPC

resource "aws_vpc" "vpc-dev" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "name" = "vpc-dev"
  }
}

# create the subnet

resource "aws_subnet" "vpc-dev-public-subnet-1" {
vpc_id = aws_vpc.vpc-dev.id
cidr_block = "10.0.1.0/24"
availability_zone = "ap-south-1a"
#availability_zone = "ap-southeast-1a"
map_public_ip_on_launch = true
}

# create igw

resource "aws_internet_gateway" "vpc-dev-igw" {
  vpc_id = aws_vpc.vpc-dev.id
}


# create route table

resource "aws_route_table" "vpc-dev-public-route-table" {
  vpc_id = aws_vpc.vpc-dev.id
}

# create the route for the route table
resource "aws_route" "vpc-dev-public-route" {
  route_table_id = aws_route_table.vpc-dev-public-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.vpc-dev-igw.id

}


# subnet association with route table
resource "aws_route_table_association" "vpc-dev-public-route-table-associate" {
  route_table_id = aws_route_table.vpc-dev-public-route-table.id
  subnet_id = aws_subnet.vpc-dev-public-subnet-1.id
}
