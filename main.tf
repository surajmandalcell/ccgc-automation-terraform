module "rgroup-n01537188" {
  source              = "./modules/rgroup-n01537188"
  resource_group_name = "n01537188-rg"
  location            = var.location
  common_tags         = var.common_tags
}

module "network-n01537188" {
  source               = "./modules/network-n01537188"
  virtual_network_name = "n01537188-vnet"
  subnet_name          = "n01537188-subnet"
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

module "database-n01537188" {
  source              = "./modules/database-n01537188"
  humber_id           = var.personal.n_number
  location            = var.location
  resource_group_name = module.rgroup-n01537188.resource_group_name
  sku_name            = "GP_Gen5_2"
  postgresql_version  = "10"
  common_tags         = var.common_tags
}

# module "vmlinux-n01537188" {
#   source = "./modules/vmlinux-n01537188"

#   instance_count      = 3
#   location            = var.location
#   resource_group_name = module.rgroup-n01537188.resource_group_name

#   vmlinux-info = {
#     name          = "n01537188-linux"
#     computer_name = "n01537188-computer_name"
#     size          = "Standard_B1s"

#     storage_account_uri = module.common-n01537188.storage_account-primary_blob_endpoint

#     admin_ssh_key = {
#       admin_username = "n01537188-surajmandal"
#       public_key     = "/Users/surajmandal/Desktop/dev.nosync/cloud/keys/aws_devops/devops1.pub"
#     }

#     private_key = "/Users/surajmandal/Desktop/dev.nosync/cloud/keys/aws_devops/devops1"

#     os_disk = {
#       storage_account_type = "Standard_LRS"
#       disk_size_gb         = "32"
#       caching              = "ReadWrite"
#     }

#     source_image_reference = {
#       publisher = "OpenLogic"
#       offer     = "CentOS"
#       sku       = "8_2"
#       version   = "latest"
#     }
#   }

#   vmlinux-avs-info = {
#     name                         = "linux-avs"
#     platform_update_domain_count = "3"
#     platform_fault_domain_count  = "2"
#   }

#   vmlinux-nic = {
#     ip_configuration = {
#       subnet_id                     = module.network-n01537188.n01537188-subnet.id
#       private_ip_address_allocation = "Dynamic"
#     }
#   }

#   vmlinux-pip = {
#     allocation_method       = "Dynamic"
#     idle_timeout_in_minutes = "30"
#   }

#   vmlinux-network-watcher = {
#     publisher                  = "Microsoft.Azure.NetworkWatcher"
#     type                       = "NetworkWatcherAgentLinux"
#     type_handler_version       = "1.0"
#     auto_upgrade_minor_version = true

#     settings = <<SETTINGS
#         {}
#     SETTINGS
#   }

#   vmlinux-network-monitor = {
#     publisher                  = "Microsoft.Azure.Monitor"
#     type                       = "AzureMonitorLinuxAgent"
#     type_handler_version       = "1.0"
#     auto_upgrade_minor_version = true

#     settings = <<SETTINGS
#       {}
#   SETTINGS
#   }

#   common_tags = var.common_tags
# }

module "vmwindows-n01537188" {
  source = "./modules/vmwindows-n01537188"

  location            = var.location
  resource_group_name = module.rgroup-n01537188.resource_group_name

  instance_count = 1

  vmwindows-info = {
    name           = "n7188-win"
    computer_name  = "n01537188"
    size           = "Standard_B1s"
    admin_username = "n01537188"
    admin_password = "/Users/surajmandal/Desktop/dev.nosync/cloud/keys/aws_devops/devops1"

    winrm_listener_protocol = "Http"

    storage_account_uri = module.common-n01537188.storage_account-primary_blob_endpoint

    os_disk = {
      storage_account_type = "StandardSSD_LRS"
      disk_size_gb         = "128"
      caching              = "ReadWrite"
    }

    source_image_reference = {
      publisher = "MicrosoftWindowsServer"
      offer     = "WindowsServer"
      sku       = "2016-Datacenter"
      version   = "latest"
    }
  }

  vmwindows-avs-info = {
    platform_update_domain_count = 1
    platform_fault_domain_count  = 1
  }

  vmwindows-nic = {
    ip_configuration = {
      subnet_id                     = module.network-n01537188.n01537188-subnet.id
      private_ip_address_allocation = "Dynamic"
    }
  }

  vmwindows-pip = {
    allocation_method       = "Dynamic"
    idle_timeout_in_minutes = 30
  }

  vmwindows-antimalware = {
    publisher                  = "Microsoft.Azure.Security"
    type                       = "IaaSAntimalware"
    type_handler_version       = "1.3"
    auto_upgrade_minor_version = "true"

    settings = <<SETTINGS
        {}
    SETTINGS
  }

  common_tags = var.common_tags
}
