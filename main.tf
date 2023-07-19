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

output "clientid" {

value = data.azurerm_key_vault_secret.id.value
}

data "azurerm_key_vault_secret" "clientS" {
  name         = "clientsecret"
   vault_uri = data.azurerm_key_vault.secret.vault_uri
}

output "clientsecret" {

value = data.azurerm_key_vault_secret.clientS.value
}

data "azurerm_key_vault_secret" "subscriptionID" {
  name         = "subscriptionid"
   vault_uri = data.azurerm_key_vault.secret.vault_uri
}

output "subscriptionid" {

value = data.azurerm_key_vault_secret.subscriptionID.value
}

data "azurerm_key_vault_secret" "tenantids" {
  name       = "tenantid"
   vault_uri = data.azurerm_key_vault.secret.vault_uri
}
output "tenantid" {

value = data.azurerm_key_vault_secret.tenantids.value
}
  subscription_id = "$(data.azurerm_key_vault_secret.subscriptionid
  client_id       = "$(data.azurerm_key_vault_secret.clientid)"
  client_secret   = "$(data.azurerm_key_vault_secret.clientsecret)"
  tenant_id       = "$(data.azurerm_key_vault_secret.tenantid)"

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
