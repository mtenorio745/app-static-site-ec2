output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "sn_public_id" {
  value = aws_subnet.sn_public.id
}

output "sg_public_id" {
  value = aws_security_group.sg_public.id
}
