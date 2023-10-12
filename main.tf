provider "aws" {
  region = var.region
}

resource "aws_vpc" "group1" {
  cidr_block       = var.vpc_cidr
  

  tags = {
    Name = var.common_tags}
}

#Public Subnets

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.group1.id
  cidr_block = var.subnet_cidr1
  availability_zone = var.az1
  map_public_ip_on_launch = var.ip_on_launch

  tags = {
    Name = "Subnet1"
  }
}
resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.group1.id
  cidr_block = var.subnet_cidr2
  availability_zone =var.az2
  map_public_ip_on_launch = var.ip_on_launch

  tags = {
    Name = "Subnet2"
  }
}

resource "aws_subnet" "subnet3" {
  vpc_id     = aws_vpc.group1.id
  cidr_block = var.subnet_cidr3
  availability_zone = var.az3
  map_public_ip_on_launch = var.ip_on_launch

  tags = {
    Name = "Subnet3"
  }
}

#Private subnets

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.group1.id
  cidr_block = var.private_subnet_cidr1
  availability_zone = var.az1


  tags = {
    Name = "Private_Subnet"
  }

}

resource "aws_subnet" "private_subnet2" {
  vpc_id     = aws_vpc.group1.id
  cidr_block = var.private_subnet_cidr2
  availability_zone = var.az2


  tags = {
    Name = "Private_Subnet2"
  }

}

resource "aws_subnet" "private_subnet3" {
  vpc_id     = aws_vpc.group1.id
  cidr_block = var.private_subnet_cidr3
  availability_zone = var.az3


  tags = {
    Name = "Private_Subnet3"
  }

}


#Internet Gateway

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.group1.id

  tags = {
    Name = "igw_group1"
  }
}

resource "aws_route_table" "rt_group1" {
  vpc_id = aws_vpc.group1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }


  tags = {
    Name = "route-table"
  }
}

resource "aws_route_table_association" "a1" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.rt_group1.id 
}
resource "aws_route_table_association" "a2" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.rt_group1.id
} 
resource "aws_route_table_association" "a3" {
  subnet_id      = aws_subnet.subnet3.id
  route_table_id = aws_route_table.rt_group1.id
}

#Database Subnet Group

# resource "aws_db_subnet_group" "db_sg" {
# name = "subnet_group"
# subnet_ids =[aws_subnet.private_subnet.id, aws_subnet.private_subnet2.id, aws_subnet.private_subnet3.id]
# }
# resource "aws_db_subnet_group" "db_sg" {
# name = "subnet_group"
# subnet_ids =[aws_subnet.subnet1.id, aws_subnet.subnet2.id, aws_subnet.subnet3.id]
# }
