module "rgroup" {
  source              = "./rgroup-n01537188"
  resource_group_name = "n01537188-RG"
  location            = "eastus"
  tags                = var.common_tags
}
