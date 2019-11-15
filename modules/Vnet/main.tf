data "azurerm_resource_group" "current" {
  name = "${var.resource_group_name}"
}

resource "azurerm_virtual_network" "current" {
  name                = "${var.Vnet_Name}"
  address_space       = "${var.Vnet_address}"
  location            = "${var.location}"
  resource_group_name = "${data.azurerm_resource_group.current.name}"
}