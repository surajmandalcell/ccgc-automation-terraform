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

# database-n01537188
output "database_instance_name" {
  value = module.database-n01537188.database_instance_name
}

# vmlinux-n01537188
output "vmlinux-hostname" {
  value = module.vmlinux-n01537188.vmlinux
}

output "vmlinux-FQDN" {
  value = module.vmlinux-n01537188.vmlinux-FQDN
}

output "vmlinux-private-ip" {
  value = module.vmlinux-n01537188.vmlinux-private-ip
}

output "vmlinux-public-ip" {
  value = module.vmlinux-n01537188.vmlinux-public-ip
}

output "vmlinux-nic_ids" {
  value = module.vmlinux-n01537188.vmlinux-nic_ids
}

# vmwindows-n01537188
# output "vmwindows-hostname" {
#   value = module.vmwindows-n01537188.vmwindows
# }

# output "vmwindows-FQDN" {
#   value = module.vmwindows-n01537188.vmwindows-FQDN
# }

# output "vmwindows-private-ip" {
#   value = module.vmwindows-n01537188.vmwindows-private-ip
# }

# output "vmwindows-public-ip" {
#   value = module.vmwindows-n01537188.vmwindows-public-ip
# }
