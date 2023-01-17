variable "vm_password" {
  type = string
  description= "virtural machine password"
  sensitive= true
}

variable "vm_user" {
  type = string
  description= "virtural machine user"
  sensitive= false
}

variable "azure_rg" {
  type = string
  description= "azure resource group"
  
}

variable "azure_location" {
  type = string
  description= "virtural machine password"
  default= "eastus"
}
