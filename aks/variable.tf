
variable "resource_group_name" {
  type = string
}
variable "cluster_name" {
type = string
}
variable "location" {
  type = string
}
variable "dnspreffix" {
  default = "kubecluster"
}
variable "vm_size" {
 type  = string
}
variable "agentnode" {
  default = "1"
}
variable "network_plugin" {
  default = "azure"
  type    = string
}
variable "vnet_subnet_id" {
  type = string
}
variable "dns_service_ip" {
  type = string
  default = "10.0.2.10"
}
variable "service_cidr" {
  type = string
  default = "10.0.2.0/24"
}
variable "network_policy" {
  default = "azure"
  type    = string
}
