# MODULES ORCHESTRATOR

module "network" {
    source               = "./network"
    vpc_cidr             = var.vpc_cidr
    vpc_az1              = var.vpc_az1
    vpc_sn_pub_az1_cidr  = var.vpc_sn_pub_az1_cidr
}

module "compute" {
    source               = "./compute"
    ec2_lt_name          = var.ec2_lt_name
    ec2_lt_ami           = var.ec2_lt_ami
    ec2_lt_instance_type = var.ec2_lt_instance_type
    ec2_lt_ssh_key_name  = var.ec2_lt_ssh_key_name
    vpc_id               = module.network.vpc_id
    vpc_sn_pub_az1_id    = module.network.vpc_sn_pub_az1_id
    vpc_sg_pub_id        = module.network.vpc_sg_pub_id
}
