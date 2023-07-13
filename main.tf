data "azurerm_key_vault" "secret"{
  name                = "myscrets"
  resource_group_name = "Azurevms"
}

data "azurerm_key_vault_secret" "id" {
  name         = "clientid"
  vault_uri = "https://myscrets.vault.azure.net/"
}

data "azurerm_key_vault_secret" "clientS" {
  name         = "clientsecret"
  vault_uri = "https://myscrets.vault.azure.net/"
}

data "azurerm_key_vault_secret" "subscriptionID" {
  name         = "subscriptionid"
  vault_uri = "https://myscrets.vault.azure.net/"
}

data "azurerm_key_vault_secret" "tenantids" {
  name       = "tenantid"
  vault_uri = "https://myscrets.vault.azure.net/"
}
provider "azurerm" {
  subscription_id = "$(data.azurerm_key_vault_secret.subscriptionID.value)"
  client_id       = "$(data.azurerm_key_vault_secret.id.value)"
  client_secret   = "$(data.azurerm_key_vault_secret.clientS.value)"
  tenant_id       = "$(data.azurerm_key_vault_secret.tenantids.value)"
features {}
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
