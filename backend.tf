terraform {
  backend "azurerm" {
    resource_group_name  = "tfstorage"
    storage_account_name = "n01537188sa"
    container_name       = "n01537188sac"
    key                  = "terraform.tfstate"
  }
}
