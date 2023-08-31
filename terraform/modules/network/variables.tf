# NETWORK VARS CUSTOM VALUES

variable "vpc_cidr" {
    description = "CIDR block for the VPC"
    type        = string
    default     = "10.0.0.0/16"
}

variable "vpc_az1" {
    description = "Availability Zone for subnet 1"
    type        = string
    default     = "us-east-1a"
}

variable "vpc_sn_pub_az1_cidr" {
    description = "CIDR block for the public subnet in availability zone 1"
    type        = string
    default     = "10.0.1.0/24"
}

# Optional: You could include this if you have private subnets as well
variable "vpc_sn_priv_az1_cidr" {
    description = "CIDR block for the private subnet in availability zone 1"
    type        = string
    default     = "10.0.3.0/24"
}

# SECURITY GROUPS

variable "egress_rules" {
  description = "List of egress rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "ingress_rules" {
  description = "List of ingress rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["10.0.0.0/16"]
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}
