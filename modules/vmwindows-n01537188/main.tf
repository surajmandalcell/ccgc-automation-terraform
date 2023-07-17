resource "azurerm_availability_set" "vmwindows-avs" {
  resource_group_name = var.resource_group_name
  location            = var.location

  count = var.instance_count

  name = "${var.vmwindows-info.name}-avs-${format("%d", count.index + 1)}"

  platform_update_domain_count = var.vmwindows-avs-info.platform_update_domain_count
  platform_fault_domain_count  = var.vmwindows-avs-info.platform_fault_domain_count
}

resource "azurerm_public_ip" "vmwindows-pip" {
  resource_group_name = var.resource_group_name
  location            = var.location

  count = var.instance_count

  name              = "${var.vmwindows-info.name}-pip-${format("%d", count.index + 1)}"
  allocation_method = var.vmwindows-pip.allocation_method
  domain_name_label = "${var.vmwindows-info.name}${format("%d", count.index + 1)}"

  idle_timeout_in_minutes = var.vmwindows-pip.idle_timeout_in_minutes
}

resource "azurerm_network_interface" "vmwindows-nic" {
  resource_group_name = var.resource_group_name
  location            = var.location

  count = var.instance_count

  name = "${var.vmwindows-info.name}-nic-${format("%d", count.index + 1)}"

  ip_configuration {
    name                          = "${var.vmwindows-info.name}-ipconfig-${format("%d", count.index + 1)}"
    subnet_id                     = var.vmwindows-nic.ip_configuration.subnet_id
    private_ip_address_allocation = var.vmwindows-nic.ip_configuration.private_ip_address_allocation
    public_ip_address_id          = azurerm_public_ip.vmwindows-pip[count.index].id
  }
}

resource "azurerm_windows_virtual_machine" "vmwindows" {
  resource_group_name = var.resource_group_name
  location            = var.location

  count = var.instance_count

  name           = "${var.vmwindows-info.name}-${format("%d", count.index + 1)}"
  computer_name  = "win-${var.vmwindows-info.computer_name}"
  size           = var.vmwindows-info.size
  admin_username = var.vmwindows-info.admin_username
  admin_password = var.vmwindows-info.admin_password

  winrm_listener {
    protocol = var.vmwindows-info.winrm_listener_protocol
  }

  os_disk {
    name                 = "${var.vmwindows-info.name}-osdisk-${format("%d", count.index + 1)}"
    storage_account_type = var.vmwindows-info.os_disk.storage_account_type
    disk_size_gb         = var.vmwindows-info.os_disk.disk_size_gb
    caching              = var.vmwindows-info.os_disk.caching
  }

  source_image_reference {
    publisher = var.vmwindows-info.source_image_reference.publisher
    offer     = var.vmwindows-info.source_image_reference.offer
    sku       = var.vmwindows-info.source_image_reference.sku
    version   = var.vmwindows-info.source_image_reference.version
  }

  boot_diagnostics {
    storage_account_uri = var.vmwindows-info.storage_account_uri
  }

  network_interface_ids = [azurerm_network_interface.vmwindows-nic[count.index].id]

  depends_on = [azurerm_availability_set.vmwindows-avs]
}

resource "azurerm_virtual_machine_extension" "vmwindows-antimalware" {

  count = var.instance_count

  name                       = "${var.vmwindows-info.name}-antimalware-${format("%d", count.index + 1)}"
  publisher                  = var.vmwindows-antimalware.publisher
  type                       = var.vmwindows-antimalware.type
  type_handler_version       = var.vmwindows-antimalware.type_handler_version
  auto_upgrade_minor_version = var.vmwindows-antimalware.auto_upgrade_minor_version
  virtual_machine_id         = element(azurerm_windows_virtual_machine.vmwindows[*].id, count.index)

  settings = <<SETTINGS
        {
          "AntimalwareEnabled": true,
          "RealtimeProtectionEnabled": "true",
          "ScheduledScanSettings": {
              "isEnabled": "true",
              "day": "1",
              "time": "120",
              "scanType": "Quick"
          },
          "Exclusions": {
              "Extensions": "",
              "Paths": "",
              "Processes": ""
          }
        }
    SETTINGS
}
