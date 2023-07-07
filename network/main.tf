resource "azurerm_virtual_network" "k8s" {
provider = azurerm.provider-sub-hub-we
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.subnet_address_space
}
resource "azurerm_subnet" "k8s" {
provider = azurerm.provider-sub-hub-we
  name                             = var.subnet_name
  resource_group_name              = var.resource_group_name
  virtual_network_name             = azurerm_virtual_network.k8s.name
  address_prefixes                 = var.subnet_address_prefixes
}
