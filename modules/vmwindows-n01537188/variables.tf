variable "rg-info" {
  type        = map(string)
  description = "Contains information about the resource group for Windows machine"
}

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
