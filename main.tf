module "vnet_example" {
  source = "./modules/vnet"

  subnet = {
    name                     = "subnet-1"
    address_prefix           = "10.0.1.0/24"
  } 
}