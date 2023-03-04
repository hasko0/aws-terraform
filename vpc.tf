
// Create a new VPC with a CIDR block of 10.0.0.0/16
resource "aws_vpc" "vpc-1" {
  cidr_block = "10.0.0.0/16"
  
  tags = {
    Name = "vpc-1 VPC"
  }
}

// Create a new internet gateway and attach it to the VPC
resource "aws_internet_gateway" "GW-1" {
  vpc_id = aws_vpc.vpc-1.id
  
  tags = {
    Name = "Example Internet Gateway"
  }
}

// Create a public subnet in the VPC with a CIDR block of 10.0.1.0/24
resource "aws_subnet" "public1" {
  vpc_id            = aws_vpc.vpc-1.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a" //Replace with your desired availability zone
  
  tags = {
    Name = "Public Subnet 1"
  }
}

// Create a public subnet in the VPC with a CIDR block of 10.0.2.0/24
resource "aws_subnet" "public2" {
  vpc_id            = aws_vpc.vpc-1.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b" //Replace with your desired availability zone
  
  tags = {
    Name = "Public Subnet 2"
  }
}

// Create a private subnet in the VPC with a CIDR block of 10.0.3.0/24
resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.vpc-1.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1a" //Replace with your desired availability zone
  
  tags = {
    Name = "Private Subnet 1"
  }
}

// Create a private subnet in the VPC with a CIDR block of 10.0.4.0/24
resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.vpc-1.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-east-1b" //Replace with your desired availability zone
  
  tags = {
    Name = "Private Subnet 2"
  }
}

// Create a new public route table and associate it with the VPC
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc-1.id
  
  tags = {
    Name = "Public Route Table"
  }
}

// Create a new private route table and associate it with the VPC
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc-1.id
  
  tags = {
    Name = "Private Route Table"
  }
}
resource "aws_route_table_association" "public1_a" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public2_a" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "private1_a" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "private2_a" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private.id
}
// Create a new route for the public route table that sends traffic to the internet gateway

