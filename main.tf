provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
features {}
}
terraform {
backend "azurerm" {
resource_group_name = "Azurevms"
storage_account_name = "mystatefiles"
container_name = "statefile"
key = "ei5+DK57QOuIYBJCXra1Q7Q0ZIgBPvkKi53ODWckTE5+3E+a4aYQNjFQPGUz5CFooKGXmhGG8mZl+AStL8xSww=="
}
}
resource "azurerm_resource_group" "k8s" {
  name     = var.resource_group_name
  location = var.location
}
module "network" {
  source    = "./network"
  vnet_name =   var.vnet_name
resource_group_name = azurerm_resource_group.k8s.name
   subnet_address_space    = [var.subnet_address_space]
  subnet_address_prefixes = [var.subnet_address_prefixes]
   }

module "aks" {
  source              = "./aks"
  resource_group_name = azurerm_resource_group.k8s.name
  location            = azurerm_resource_group.k8s.location
  cluster_name        = var.cluster_name
  vm_size             = var.vm_size
   vnet_subnet_id     = .module.network.subnet.k8s.id
   service_cidr        = var.service_cidr
  dns_service_ip      = var.dns_service_ip
}
