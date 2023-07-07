variable "location" {
  default = "centralindia"
  type    = string
}
variable "resourcename" {
  default = "k8s-resourcestest"
}
variable "subnet_address_space" {
  type = string
default = "10.0.0.0/16"
}
variable "subnet_address_prefixes" {
  type = string
  default = "10.0.1.0/24"
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
