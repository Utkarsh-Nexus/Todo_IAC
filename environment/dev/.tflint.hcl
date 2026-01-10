plugin "azurerm" {
  enabled = true
  version = "0.25.1"
  source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
}
ignore = [
  "azurerm_windows_virtual_machine_invalid_size",
  "azurerm_storage_account_invalid_access_tier"
]
