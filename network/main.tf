resource "azurerm_virtual_network" "k8s" {
  name                = var.vnet_name
  resource_group_name = var.resourcename
  location            = var.resource_group_location
  address_space       = var.subnet_address_space
}
resource "azurerm_subnet" "k8s" {
  name                             = var.subnet_name
  resource_group_name              = var.resourcename
  virtual_network_name             = azurerm_virtual_network.k8s.name
  address_prefixes                 = var.subnet_address_prefixes
}
