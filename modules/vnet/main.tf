resource "azurerm_resource_group" "example" {
   name     = "example-resources"
   location = "West Europe"
 }
 
resource "azurerm_network_security_group" "example" {
   name                = "example-security-group"
   location            = azurerm_resource_group.example.location
   resource_group_name = azurerm_resource_group.example.name
}

resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  dynamic "subnet" {
    for_each = var.subnets
    content {
      name           = subnet.value.name
      address_prefix = subnet.value.address_prefix
      security_group = azurerm_network_security_group.example.id 
    }
  }

  tags = {
    environment = "Production"
  }
}