terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}
data "azurerm_key_vault" "secret"{
  name                = "myscrets"
  resource_group_name = "Azurevms"
}
data "azurerm_key_vault_secret" "id" {
  name         = "clientid"
  key_vault_id = data.azurerm_key_vault.secret.id
}

output "client" {

value = data.azurerm_key_vault_secret.id.value
}

data "azurerm_key_vault_secret" "clientS" {
  name         = "clientsecret"
     key_vault_id = data.azurerm_key_vault.secret.id
}

output "clientSecrets" {

value = data.azurerm_key_vault_secret.clientS.value
}

data "azurerm_key_vault_secret" "subscriptionID" {
  name         = "subscriptionid"
     key_vault_id = data.azurerm_key_vault.secret.id
}

output "Subid" {

value = data.azurerm_key_vault_secret.subscriptionID.value
}

data "azurerm_key_vault_secret" "tenantids" {
  name       = "tenantid"
    key_vault_id = data.azurerm_key_vault.secret.id
}
output "tenid" {

value = data.azurerm_key_vault_secret.tenantids.value
}
provider "azurerm" {
  subscription_id = "$(data.azurerm_key_vault_secret.Subid)"
  client_id       = "$(data.azurerm_key_vault_secret.clientSecrets)"
  client_secret   = "$(data.azurerm_key_vault_secret.client)"
  tenant_id       = "$(data.azurerm_key_vault_secret.tenid)"
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
