locals {
  # Local variables for resource tags
  tag_creator    = "terraform"
}

# Create a resource group
resource "azurerm_resource_group" "resource_group" {
  name     = "${var.project_name}-rg-${var.region}-${var.stage}"
  location = var.location

  tags = {
    creator    = local.tag_creator
    env        = var.stage
  }
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "atlantis_test"
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    creator    = local.tag_creator
    env        = var.stage
  }
}