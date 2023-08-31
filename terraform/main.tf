module "network" {
  source  = "./network"
  vpc_cidr = "10.0.0.0/16"
}

module "compute" {
  source  = "./compute"
  vpc_id  = module.network.vpc_id
  subnet_id = module.network.subnet_id
  sg_id = module.network.sg_id
}
