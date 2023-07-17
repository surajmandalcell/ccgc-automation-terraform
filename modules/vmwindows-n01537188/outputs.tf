output "n01537188-vmwindows" {
  value = {
    ids       = azurerm_windows_virtual_machine.n01537188-vmwindows[*].id
    hostnames = azurerm_windows_virtual_machine.n01537188-vmwindows[*].name
  }
}

output "n01537188-vmwindows-fqdn" {
  value = azurerm_public_ip.n01537188-vmwindows-pip[*].fqdn
}

output "n01537188-vmwindows-nic" {
  value = azurerm_network_interface.n01537188-vmwindows-nic[*].id
}

output "n01537188-vmwindows-private-ip" {
  value = azurerm_windows_virtual_machine.n01537188-vmwindows[*].private_ip_address
}

output "n01537188-vmwindows-public-ip" {
  value = azurerm_windows_virtual_machine.n01537188-vmwindows[*].public_ip_address
}
