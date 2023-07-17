output "vmwindows" {
  value = {
    ids       = azurerm_windows_virtual_machine.vmwindows[*].id
    hostnames = azurerm_windows_virtual_machine.vmwindows[*].name
  }
}

output "vmwindows-fqdn" {
  value = azurerm_public_ip.vmwindows-pip[*].fqdn
}

output "vmwindows-private-ip" {
  value = azurerm_windows_virtual_machine.vmwindows[*].private_ip_address
}

output "vmwindows-public-ip" {
  value = azurerm_windows_virtual_machine.vmwindows[*].public_ip_address
}
