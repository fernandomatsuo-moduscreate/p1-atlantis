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



