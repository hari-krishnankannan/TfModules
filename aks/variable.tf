
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
}
variable "service_cidr" {
  type = string
}
variable "network_policy" {
  default = "azure"
  type    = string
}
variable "client_id" {
  type    = string
}
variable "client_secret" {
  type    = string
}
