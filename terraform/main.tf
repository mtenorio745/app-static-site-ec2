module "network" {
  source = "./network"
}

module "compute" {
  source           = "./compute"
  subnet_id        = module.network.sn_public_id
  security_group_id = module.network.sg_public_id
}