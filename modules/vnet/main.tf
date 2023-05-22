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

  subnet {
    name           = var.subnet.name
    address_prefix = var.subnet.address_prefix
    security_group = azurerm_network_security_group.example.id 
  }

  tags = {
    environment = "Production"
  }
}


resource "azapi_update_resource" "example" {
  type        = "Microsoft.Network/virtualNetworks/subnets@2021-03-01"
  resource_id = format("%s/subnets/%s", azurerm_virtual_network.example.id, var.subnet.name)

  body = jsonencode({
    properties = {
      delegations = [
        {
          name = "delegation",
          properties = {
            serviceName = "Microsoft.ContainerInstance/containerGroups"
          }
        }
      ]
    }
  })

  depends_on = [
    azurerm_virtual_network.example,
  ]
}