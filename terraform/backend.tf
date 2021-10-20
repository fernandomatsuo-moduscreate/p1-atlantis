# https://github.com/hashicorp/terraform/releases
# https://github.com/terraform-providers/terraform-provider-azurerm/releases
terraform {
  required_version = "1.0.8"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.81.0"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}
