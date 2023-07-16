module "rgroup-n01537188" {
  source              = "./modules/rgroup-n01537188"
  resource_group_name = "n01537188-RG"
  location            = var.location
  common_tags         = var.common_tags
}

module "network-n01537188" {
  source               = "./modules/network-n01537188"
  virtual_network_name = "n01537188-VNET"
  subnet_name          = "n01537188-SUBNET"
  resource_group_name  = module.rgroup-n01537188.resource_group_name
  location             = var.location
  common_tags          = var.common_tags
}

module "common-n01537188" {
  source              = "./modules/common-n01537188"
  resource_group_name = module.rgroup-n01537188.resource_group_name
  location            = var.location
  common_tags         = var.common_tags
}

