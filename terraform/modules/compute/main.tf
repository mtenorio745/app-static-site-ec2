data "template_file" "user_data" {
    template = file("./modules/compute/scripts/user_data.sh")
}

resource "aws_launch_template" "ec2_lt" {
    name                   = var.ec2_lt_name
    image_id               = var.ec2_lt_ami
    instance_type          = var.ec2_lt_instance_type
    key_name               = var.ec2_lt_ssh_key_name
    user_data              = base64encode(data.template_file.user_data.rendered)
    vpc_security_group_ids = [var.vpc_sg_pub_id]
}
