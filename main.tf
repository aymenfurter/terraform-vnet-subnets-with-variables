module "vnet_example" {
  source = "./modules/vnet"

  subnets = [
    {
      name                     = "subnet-1"
      address_prefix           = "10.0.1.0/24"
    },
    {
      name                     = "subnet-2"
      address_prefix           = "10.0.2.0/24"
    },
    {
      name                     = "subnet-3"
      address_prefix           = "10.0.3.0/24"
    }
  ]
}