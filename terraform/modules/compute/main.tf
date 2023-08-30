data "template_file" "user_data" {
    template = "${file("./scripts/user_data.sh")}"
}

resource "aws_instance" "instance" {
    ami                    = "ami-02e136e904f3da870"
    instance_type          = "t2.micro"
    subnet_id              = var.subnet_id
    vpc_security_group_ids = [var.security_group_id]
    user_data              = "${base64encode(data.template_file.user_data.rendered)}"
}
