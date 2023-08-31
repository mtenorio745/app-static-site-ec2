output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "vpc_cidr" {
  value = aws_vpc.vpc.cidr_block
}

output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}

output "subnet_public_az1_id" {
  value = aws_subnet.sn_pub_az1.id
}

output "route_table_public_id" {
  value = aws_route_table.rt_pub.id
}

output "security_group_public_id" {
  value = aws_security_group.vpc_sg_pub.id
}

output "availability_zone" {
  value = var.vpc_az1
}
