variable "location" {
  default = "centralindia"
  type    = string
}
variable "resource_group_name" {
  default = "k8s-resourcestest"
type    = string
}
variable "vnet_name" {
  default = "k8s-vnet"
  type    = string
}
variable "subnet_address_space" {
  type = string
default = "10.0.0.0/16"
}
variable "subnet_address_prefixes" {
  type = string
  default = "10.0.1.0/24"
}
variable "cluster_name" {
type = string
 default = "aks1"
}
variable "vm_size"{
type = string
default = "Standard_D2_v2"
}
variable "dns_service_ip" {
  type = string
  default = "10.0.2.10"
}
variable "service_cidr" {
  type = string
  default = "10.0.2.0/24"
}
variable "subscription_id" {
  default = "b3c7ce23-4463-41af-b0ee-2aad6de340b9"
}
variable "client_id" {
  default = "892c5683-828c-45f8-95cb-e112a70d5bd2"
}
variable "client_secret" {
  default = "_AK8Q~DuRTBorGh23XRZH5NQAbDWi.S-FWWrhbfi"
}
variable "tenant_id" {
  default = "2d281bb5-1697-4054-99e8-8ad9ff83402b"
}

