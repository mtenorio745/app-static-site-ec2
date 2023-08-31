variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "vpc_az1" {
  type    = string
  default = "us-east-1a"
}

variable "vpc_sn_pub_az1_cidr" {
  type    = string
  default = "10.0.1.0/24"
}
