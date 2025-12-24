rgs = {
  dev = {
    name     = "rg-dev"
    location = "eastus"
    tags = {
      env = "dev"
    }
  }
}

storage_accounts = {
  appstore = {
    name                     = "appsa12345"
    resource_group_name      = "rg-dev"
    location                 = "eastus"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    tags = {
      env = "dev"
    }
  }
}

networks = {
  dev = {
    name          = "vnet-dev"
    resource_group_name   = "rg-dev"
    location      = "eastus"
    address_space = ["10.0.0.0/16"]

    subnets = {
      frontend = {
        name             = "frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      }

      backend = {
        name             = "backend-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    }

    tags = {
      env = "dev"
    }
  }
}
