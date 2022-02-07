provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "example" {
  name = "example"
}

data "azurerm_key_vault" "example" {
  name                = "kgml"
  resource_group_name = data.azurerm_resource_group.example.name
}

module "tls" {

  source = "./generate-cert"

  ca_common_name    = "example.com"
  common_name       = "example.com"
  dns_names         = ["example.com", "www.example.com", "api.example.com"]
  organization_name = "Example com ltd"
  pfx_filename      = "cert.pfx"
  password          = "123456"
}

resource "azurerm_key_vault_certificate" "example" {
  name         = "imported-cert"
  key_vault_id = data.azurerm_key_vault.example.id

  certificate {
    contents = filebase64("cert.pfx")
    password = "123456"
  }
}
