output "vnet_ids" {
  value = {
    for k, v in azurerm_virtual_network.virtual_networks :
    k => v.id
  }
}

output "subnet_ids" {
  value = {
    for k, v in azurerm_virtual_network.virtual_networks :
    k => {
      for sn in v.subnet :
        sn.name => sn.id
    }
  }
}
