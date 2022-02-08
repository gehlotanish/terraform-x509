provider "azurerm" {
  features {}
}

variable "password" {
  type      = string
  sensitive = true
}

module "tls" {

  source = "./generate-cert"

  ca_common_name    = "example com"
  common_name       = "example.com"
  dns_names         = ["example.com", "www.example.com", "api.example.com"]
  organization_name = "Example com ltd"
  password          = var.password
  kv_name           = "kgml"
  kv_rg             = "example"
  kv_certname       = "cert1"
  kv_secretname     = "secret1"
}
