resource "azurerm_kubernetes_cluster" "k8s" {
service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dnspreffix
default_node_pool {
    name       = "default"
    node_count = var.agentnode
    vm_size    = var.vm_size
    vnet_subnet_id  = var.vnet_subnet_id
  }
network_profile {
    network_plugin = var.network_plugin
    network_policy = var.network_plugin
    service_cidr   = var.service_cidr
    dns_service_ip = var.dns_service_ip
  }
}

