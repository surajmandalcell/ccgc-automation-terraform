# rgroup-n01537188
output "resource_group_name" {
  value = module.rgroup-n01537188.resource_group_name
}

# network-n01537188
output "virtual_network_name" {
  value = module.network-n01537188.virtual_network_name
}

output "subnet_name" {
  value = module.network-n01537188.subnet_name
}

# common-n01537188
output "log_analytics_workspace_name" {
  value = module.common-n01537188.log_analytics_workspace_name
}

output "recovery_services_vault_name" {
  value = module.common-n01537188.recovery_services_vault_name
}

output "storage_account_name" {
  value = module.common-n01537188.storage_account_name
}

# vmlinux-n01537188

# database-n01537188
output "database_instance_name" {
  value = module.database.database_instance_name
}
