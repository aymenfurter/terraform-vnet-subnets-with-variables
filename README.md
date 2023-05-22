How to create a VNET with a delegated subnet using terraform
```

  # module.vnet_example.azapi_update_resource.example will be created
  + resource "azapi_update_resource" "example" {
      + body                    = jsonencode(
            {
              + properties = {
                  + delegations = [
                      + {
                          + name       = "delegation"
                          + properties = {
                              + serviceName = "Microsoft.ContainerInstance/containerGroups"
                            }
                        },
                    ]
                }
            }
        )
      + id                      = (known after apply)
      + ignore_casing           = false
      + ignore_missing_property = true
      + name                    = (known after apply)
      + output                  = (known after apply)
      + parent_id               = (known after apply)
      + resource_id             = (known after apply)
      + type                    = "Microsoft.Network/virtualNetworks/subnets@2021-03-01"
    }

  # module.vnet_example.azurerm_network_security_group.example will be created
  + resource "azurerm_network_security_group" "example" {
      + id                  = (known after apply)
      + location            = "westeurope"
      + name                = "example-security-group"
      + resource_group_name = "example-resources"
      + security_rule       = (known after apply)
    }

  # module.vnet_example.azurerm_resource_group.example will be created
  + resource "azurerm_resource_group" "example" {
      + id       = (known after apply)
      + location = "westeurope"
      + name     = "example-resources"
    }

  # module.vnet_example.azurerm_virtual_network.example will be created
  + resource "azurerm_virtual_network" "example" {
      + address_space       = [
          + "10.0.0.0/16",
        ]
      + dns_servers         = [
          + "10.0.0.4",
          + "10.0.0.5",
        ]
      + guid                = (known after apply)
      + id                  = (known after apply)
      + location            = "westeurope"
      + name                = "example-network"
      + resource_group_name = "example-resources"
      + subnet              = [
          + {
              + address_prefix = "10.0.1.0/24"
              + id             = (known after apply)
              + name           = "subnet-1"
              + security_group = (known after apply)
            },
        ]
      + tags                = {
          + "environment" = "Production"
        }
    }

Plan: 4 to add, 0 to change, 0 to destroy.

```
