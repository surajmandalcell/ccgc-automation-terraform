# Common
variable "common_tags" {
  type        = map(string)
  description = "This block is to define common tags"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

# This
variable "instance_count" {
  type        = number
  description = "Total number of Windows VMs"
}

variable "vmwindows-info" {
  type        = any
  description = "Contains information about the Windows VM"
}

variable "vmwindows-avs-info" {
  type        = any
  description = "Contains information about the Windows Availability set"
}

variable "vmwindows-nic" {
  type        = any
  description = "Contains information about the Windows' Network interface"
}

variable "vmwindows-pip" {
  type        = any
  description = "Contains information about the Windows' Public IP config"
}

variable "vmwindows-antimalware" {
  type        = any
  description = "Contains information about the Windows' Antimalware"
}
