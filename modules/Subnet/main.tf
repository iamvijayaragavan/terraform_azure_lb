data "azurerm_resource_group" "current" {
  name = "${var.resource_group_name}"

}

resource "azurerm_subnet" "current" {
  name                      = "${var.subnet_name}"
  resource_group_name       = "${data.azurerm_resource_group.current.name}"
  virtual_network_name      = "${var.Vnet_Name}"
  address_prefix            = "${var.subnet_prefix}"
}
