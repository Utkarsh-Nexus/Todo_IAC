data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  for_each = var.key_vaults

  name                = each.value.name
  location            = each.value.location
  resource_group_name = var.rg_names[each.value.rg_key]
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
  purge_protection_enabled = true

  network_acls {
  default_action = "Deny"
  bypass         = "AzureServices"
  ip_rules       = var.kv_allowed_ips
}
}