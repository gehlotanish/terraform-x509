data "azurerm_key_vault" "example" {
  name                = var.kv_name
  resource_group_name = var.kv_rg
}



