variable "networks" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    address_space       = list(string)

    subnets = map(object({
      name             = string
      address_prefixes = list(string)
    }))

    tags = map(string)
  }))
}
