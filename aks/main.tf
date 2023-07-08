resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.clustername
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dnspreffix
default_node_pool {
    name       = "default"
    node_count = var.agentnode
    vm_size    = var.size
    vnet_subnet_id  = var.subnet_id
  }
network_profile {
    network_plugin = var.network_plugin
    network_policy = var.network_plugin
    service_cidr   = var.service_cidr
    dns_service_ip = var.dns_service_ip
  }
}
