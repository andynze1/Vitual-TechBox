// CREATE VPC
resource "aws_vpc" "andynze_vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "andynze-vpc"
  }
}

// CREATE PUBLIC AND PRIVATE SUBNETS
resource "aws_subnet" "andynze_public_subnet_01" {
  vpc_id                  = aws_vpc.andynze_vpc.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone_1
  tags = {
    Name = "andynze-public-subnet-01"
  }
}

resource "aws_subnet" "andynze_private_subnet_02" {
  vpc_id                  = aws_vpc.andynze_vpc.id
  cidr_block              = var.private_subnet_cidr
  map_public_ip_on_launch = false
  availability_zone       = var.availability_zone_2
  tags = {
    Name = "andynze-private-subnet-02"
  }
}

// Create Internet Gateway for VPC
resource "aws_internet_gateway" "andynze_igw" {
  vpc_id = aws_vpc.andynze_vpc.id
  tags = {
    Name = "andynze-igw"
  }
}

// Create Public Route Table
resource "aws_route_table" "andynze_public_rt" {
  vpc_id = aws_vpc.andynze_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.andynze_igw.id
  }
  tags = {
    Name = "andynze-public-rt"
  }
}
// Associate Public subnets with Public route table
resource "aws_route_table_association" "andynze_rta_public_subnet_01" {
  subnet_id      = aws_subnet.andynze_public_subnet_01.id
  route_table_id = aws_route_table.andynze_public_rt.id
}

// Create Private Route Table (optional, depending on requirements)
resource "aws_route_table" "andynze_private_rt" {
  vpc_id = aws_vpc.andynze_vpc.id
  // No internet gateway route for private subnets
  tags = {
    Name = "andynze-private-rt"
  }
}

// Associate private subnet with private route table
resource "aws_route_table_association" "andynze_rta_private_subnet_02" {
  subnet_id      = aws_subnet.andynze_private_subnet_02.id
  route_table_id = aws_route_table.andynze_private_rt.id
}
