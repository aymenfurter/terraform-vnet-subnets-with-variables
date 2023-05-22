variable "subnet" {
  description = "Subnet configuration"
  type = object({
    name           = string
    address_prefix = string
  })
}
