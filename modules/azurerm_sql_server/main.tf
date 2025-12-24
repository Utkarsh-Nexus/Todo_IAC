data "azurerm_key_vault_secret" "sql_user" {
  for_each     = var.sql_servers
  name         = each.value.admin_username_secret
  key_vault_id = var.key_vault_id
}

data "azurerm_key_vault_secret" "sql_pass" {
  for_each     = var.sql_servers
  name         = each.value.admin_password_secret
  key_vault_id = var.key_vault_id
}

resource "azurerm_mssql_server" "sql" {
  for_each = var.sql_servers

  name                         = each.value.name
  resource_group_name          = var.rg_names[each.value.rg_key]
  location                     = each.value.location
  version                      = "12.0"
  administrator_login          = data.azurerm_key_vault_secret.sql_user[each.key].value
  administrator_login_password = data.azurerm_key_vault_secret.sql_pass[each.key].value
}
