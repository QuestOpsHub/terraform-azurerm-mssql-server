#--------------
# MSSQL Server
#--------------
data "azurerm_client_config" "current" {}

resource "azurerm_mssql_server" "mssql_server" {
  name                         = var.name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.version
  administrator_login          = var.azuread_administrator.azuread_authentication_only != true ? var.administrator_login : null
  administrator_login_password = var.azuread_administrator.azuread_authentication_only != true ? var.administrator_login_password : null

  dynamic "azuread_administrator" {
    for_each = try(var.azuread_administrator, {}) != {} ? [var.azuread_administrator] : []
    content {
      login_username              = azuread_administrator.value.login_username
      object_id                   = azuread_administrator.value.object_id
      tenant_id                   = lookup(azuread_administrator.value, "tenant_id", data.azurerm_client_config.current.tenant_id)
      azuread_authentication_only = lookup(azuread_administrator.value, "azuread_authentication_only", null)
    }
  }

  connection_policy = try(var.connection_policy, "Default")

  dynamic "identity" {
    for_each = try(var.identity.type, null) != null ? [var.identity.type] : []
    content {
      type         = var.identity.type
      identity_ids = var.identity.type == "UserAssigned" || var.identity.type == "SystemAssigned, UserAssigned" ? var.identity.identity_ids : null
    }
  }

  transparent_data_encryption_key_vault_key_id = try(var.transparent_data_encryption_key_vault_key_id, null)
  minimum_tls_version                          = try(var.minimum_tls_version, "1.2")
  public_network_access_enabled                = try(var.public_network_access_enabled, true)
  outbound_network_restriction_enabled         = try(var.outbound_network_restriction_enabled, false)
  primary_user_assigned_identity_id            = var.identity.type == "UserAssigned" ? var.primary_user_assigned_identity_id : null

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["creation_timestamp"],
    ]
  }
}