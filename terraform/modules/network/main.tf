resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_subnet" "sn_pub_az1" {
  vpc_id                  = aws_vpc.vpc.id
  availability_zone       = var.vpc_az1
  cidr_block              = var.vpc_sn_pub_az1_cidr
  map_public_ip_on_launch = true
}

resource "aws_route_table" "rt_pub" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "10.0.0.0/16"
    gateway_id = aws_internet_gateway.igw.id
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "rt_pub_sn_pub_az1" {
  subnet_id      = aws_subnet.sn_pub_az1.id
  route_table_id = aws_route_table.rt_pub.id
}

resource "aws_security_group" "vpc_sg_pub" {
  vpc_id = aws_vpc.vpc.id
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
