#--------------
# MSSQL Server
#--------------
variable "name" {
  description = "(Required) The name of the Microsoft SQL Server. This needs to be globally unique within Azure. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the Microsoft SQL Server. Changing this forces a new resource to be created."
  type        = string
}

variable "location" {
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "mssql_server_version" {
  description = "(Required) The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server). Changing this forces a new resource to be created."
  type        = string
}

variable "administrator_login" {
  description = "(Optional) The administrator login name for the new server. Required unless azuread_authentication_only in the azuread_administrator block is true. When omitted, Azure will generate a default username which cannot be subsequently changed. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "administrator_login_password" {
  description = "(Optional) The password associated with the administrator_login user."
  type        = string
  default     = null
}

variable "azuread_administrator" {
  description = "(Optional) An azuread_administrator block"
  type        = any
  default     = {}
}

variable "connection_policy" {
  description = "(Optional) The connection policy the server will use. Possible values are Default, Proxy, and Redirect. Defaults to Default."
  type        = string
  default     = "Default"
}

variable "identity" {
  description = "(Optional) An identity block"
  type        = any
  default     = {}
}

variable "transparent_data_encryption_key_vault_key_id" {
  description = "(Optional) The fully versioned Key Vault Key URL (e.g. 'https://<YourVaultName>.vault.azure.net/keys/<YourKeyName>/<YourKeyVersion>) to be used as the Customer Managed Key(CMK/BYOK) for the Transparent Data Encryption(TDE) layer."
  type        = string
  default     = null
}

variable "minimum_tls_version" {
  description = "(Optional) The Minimum TLS Version for all SQL Database and SQL Data Warehouse databases associated with the server. Valid values are: 1.0, 1.1 , 1.2 and Disabled. Defaults to 1.2."
  type        = string
  default     = "1.2"
}

variable "public_network_access_enabled" {
  description = "(Optional) Whether public network access is allowed for this server. Defaults to true."
  type        = bool
  default     = true
}

variable "outbound_network_restriction_enabled" {
  description = "(Optional) Whether outbound network traffic is restricted for this server. Defaults to false."
  type        = bool
  default     = false
}

variable "primary_user_assigned_identity_id" {
  description = "(Optional) Specifies the primary user managed identity id. Required if type within the identity block is set to either SystemAssigned, UserAssigned or UserAssigned and should be set at same time as setting identity_ids."
  type        = string
  default     = null
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(any)
  default     = {}
}