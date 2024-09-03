module "network_data" {
  source = "./data_subnets"
}

module "vm_instance" {
  source   = "./vm_instance"
  zone     = var.zone
  subnet_id = module.network_data.subnet_ids[var.zone]
}
