
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
  default = "892c5683-828c-45f8-95cb-e112a70d5bd2"
}
variable "client_secret" {
  default = "_AK8Q~DuRTBorGh23XRZH5NQAbDWi.S-FWWrhbfi"
}
