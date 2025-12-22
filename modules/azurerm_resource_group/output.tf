output "rg_ids" {
  value = {
    for k, v in azurerm_resource_group.rg : k => v.id
  }
}

output "rg_names" {
  value = {
    for k, v in azurerm_resource_group.rg : k => v.name
  }
}

output "rg" {
  value = {
    for k, v in azurerm_resource_group.rg :
    k => {
      name     = v.name
      location = v.location
      id       = v.id
    }
  }
}
