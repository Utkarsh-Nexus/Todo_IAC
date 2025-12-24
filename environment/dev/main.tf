module "rg" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "storage" {
  source           = "../../modules/azurerm_storage_account"
  storage_accounts = var.storage_accounts
}

module "networks" {
  source   = "../../modules/azurerm_networking"
  networks = var.networks
}