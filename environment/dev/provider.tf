terraform {
  required_version = ">= 1.4.0"
  required_providers {
    azurerm = { source = "hashicorp/azurerm", version = ">= 3.0" }
    random  = { source = "hashicorp/random", version = ">= 3.0" }
  }
}

provider "azurerm" {
  features {}
  use_cli         = true
  subscription_id = "02fc6674-9e4d-4764-8702-0c4550e06df7"
}
