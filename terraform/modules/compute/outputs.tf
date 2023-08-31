output "ec2_instance_type" {
  value = var.ec2_lt_instance_type
}

output "ec2_instance_ami" {
  value = var.ec2_lt_ami
}

output "ec2_security_group_id" {
  value = aws_security_group.ec2_sg.id
}

output "ec2_asg_name" {
  value = aws_autoscaling_group.ec2_asg.name
}
