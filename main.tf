provider "azurerm" {

data "azurerm_key_vault" "secrets"{
  name                = "myscrets"
  resource_group_name = "Azurevms"
}

data "azurerm_key_vault_secret" "id" {
  name         = "clientid"
  key_vault_uri = https://myscrets.vault.azure.net/
}
data "azurerm_key_vault_secret" "Secret" {
  name         = "clientSecret"
  key_vault_uri = https://myscrets.vault.azure.net/
}
data "azurerm_key_vault_secret" "subscription" {
  name         = "subscriptionid"
  key_vault_uri = https://myscrets.vault.azure.net/
}
data "azurerm_key_vault_secret" "tenant" {
  name         = "tenantid"
  key_vault_uri = https://myscrets.vault.azure.net/
}
  subscription_id = https://myscrets.vault.azure.net/secrets/subscriptionid/1114b528da72481a8852a19b505dfb0d
  client_id       = https://myscrets.vault.azure.net/secrets/clientid/e5d81d51788a4daf8e64e2343df79732
  client_secret   =https://myscrets.vault.azure.net/secrets/clientsecret/215d7086e31942919636bd190a668d7e
  tenant_id       = https://myscrets.vault.azure.net/secrets/tenantid/79d7013f7c2049a1afbb51587682e085

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
 client_id     = var.client_id
 client_secret = var.client_secret
  resource_group_name = azurerm_resource_group.k8s.name
  location            = azurerm_resource_group.k8s.location
  cluster_name        = var.cluster_name
  vm_size             = var.vm_size
   vnet_subnet_id     =  module.network.subnet_id
   service_cidr        = var.service_cidr
  dns_service_ip      = var.dns_service_ip
}
}
