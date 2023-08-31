resource "aws_instance" "example" {
  ami           = "ami-02e136e904f3da870" # Make sure to use the correct AMI
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.sg_id]
  key_name = "your_key_name_here"

  tags = {
    Name = "example-instance"
  }
}
