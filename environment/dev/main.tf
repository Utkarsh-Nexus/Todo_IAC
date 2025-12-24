module "rg" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "networks" {
  source   = "../../modules/azurerm_networking"
  networks = var.networks
  rg_names = module.rg.rg_names
}

module "vm" {
  source       = "../../modules/azurerm_virtual_machine"
  vms          = var.vms
  rg_names     = module.rg.rg_names
  subnet_ids   = module.networks.subnet_ids
  key_vault_id = module.key_vault.key_vault_ids["app"]
}

module "storage_account" {
  source           = "../../modules/azurerm_storage_account"
  storage_accounts = var.storage_accounts
  rg_names        = module.rg.rg_names
}

module "public_ip" {
  source     = "../../modules/azurerm_public_ip"
  public_ips = var.public_ips
  rg_names   = module.rg.rg_names
}

module "key_vault" {
  source     = "../../modules/azurerm_key_vault"
  key_vaults = var.key_vaults
  rg_names   = module.rg.rg_names
}