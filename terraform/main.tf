locals {
  # Local variables for resource tags
  tag_creator = "terraform"
}

# Create a resource group
resource "azurerm_resource_group" "resource_group" {
  name     = "${var.project_name}-rg-${var.region}-${var.stage}"
  location = var.location

  tags = {
    creator = local.tag_creator
    env     = var.stage
  }
}

resource "azurerm_public_ip" "public_ip" {
  name                = "${var.project_name}-pip-test-${var.region}-${var.stage}"
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"
}
