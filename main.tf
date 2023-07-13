provider "azurerm" {

data "azurerm_key_vault" "secret"{
  name                = "myscrets"
  resource_group_name = "Azurevms"
}

output "vault_uri" {

value = data.azurerm_key_vault.secret.vault_uri
}

data "azurerm_key_vault_secret" "id" {
  name         = "clientid"
  vault_uri = data.azurerm_key_vault.secret.vault_uri
}

output "client" {

value = data.azurerm_key_vault_secret.id.value
}

data "azurerm_key_vault_secret" "clientS" {
  name         = "clientsecret"
   vault_uri = data.azurerm_key_vault.secret.vault_uri
}

output "clientSecrets" {

value = data.azurerm_key_vault_secret.clientS.value
}

data "azurerm_key_vault_secret" "subscriptionID" {
  name         = "subscriptionid"
   vault_uri = data.azurerm_key_vault.secret.vault_uri
}

output "Subid" {

value = data.azurerm_key_vault_secret.subscriptionID.value
}

data "azurerm_key_vault_secret" "tenantids" {
  name       = "tenantid"
   vault_uri = data.azurerm_key_vault.secret.vault_uri
}
output "tenid" {

value = data.azurerm_key_vault_secret.tenantids.value
}
  subscription_id = data.azurerm_key_vault_secret.Subid
  client_id       = data.azurerm_key_vault_secret.client
  client_secret   = data.azurerm_key_vault_secret.clientSecrets
  tenant_id       = data.azurerm_key_vault_secret.tenid

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
}
