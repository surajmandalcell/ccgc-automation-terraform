output "vmlinux" {
  value = {
    ids       = values(azurerm_linux_virtual_machine.vmlinux)[*].id
    hostnames = values(azurerm_linux_virtual_machine.vmlinux)[*].name
    nic_ids   = values(azurerm_linux_virtual_machine.vmlinux)[*].network_interface_ids
  }
}

output "vmlinux-FQDN" {
  value = values(azurerm_public_ip.pip)[*].fqdn
}

output "vmlinux-private-ip" {
  value = values(azurerm_linux_virtual_machine.vmlinux)[*].private_ip_address
}

output "vmlinux-public-ip" {
  value = values(azurerm_linux_virtual_machine.vmlinux)[*].public_ip_address
}

output "vmlinux-nic_ids" {
  value = [values(azurerm_network_interface.nic)[*].id]
}
