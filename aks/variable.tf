
variable "resource_group_name" {
  type = string
}
variable "clustername" {
  default = "kubernetes-aks1"
}
variable "location" {
  type = string
}
variable "dnspreffix" {
  default = "kubecluster"
}
variable "size" {
  default = "Standard_D2_v2"
}
variable "agentnode" {
  default = "1"
}
variable "network_plugin" {
  default = "azure"
  type    = string
}
variable "subnet_id" {
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
