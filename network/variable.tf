variable "location" {
  default = "centralindia"
  type    = string
}

variable "resourcename" {
  type = string
default = k8s-resourcestest
}

variable "vnet_name" {
  default = "k8s-vnet"
  type    = string
}

variable "subnet_name" {
  default = "k8s-subnet"
  type    = string
}

variable "subnet_address_space" {
  type = list
}

variable "subnet_address_prefixes" {
  type = list
}
