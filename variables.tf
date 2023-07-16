variable "location" {
  description = "Location for the resource group"
  type        = string
  default     = "canadacentral"
}

# All resources will have these tags
variable "common_tags" {
  type = map(string)
  default = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "Suraj.Mandal"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}
