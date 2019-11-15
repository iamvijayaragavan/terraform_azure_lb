module "resource_group" {
  source              = "../modules/RG"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.location}"
}

data "azurerm_resource_group" "RG" {
  name = "${var.resource_group_name}"

}

module "Vnet" {
  source               = "../modules/Vnet"
  name                 = "${var.vnet_name}"
  address_space        = "${var.vnet_address}"
  location             = "${var.location}"
  resource_group_name  = "${data.azurerm_resource_group.RG.name}"
}

module "subnet" {
  source               = "../modules/Subnet"
  name                 = "${var.subnet_name}"
  resource_group_name  = "${data.azurerm_resource_group.RG.name}"
  virtual_network_name = "${var.vnet_name}"
  address_prefix       = "${var.subnet_address}"
}

module "VM_1" {
  source               = "../modules/VM"
  virtual_machine_name = "${var.vm-1_name}"
  location             = "${var.location}"
  resource_group_name  = "${data.azurerm_resource_group.RG.name}"
  vm_size              = "${var.vm_size}"
  subnet_id            = "${module.subnet.subnet_id}"
  private_ip_address   = "${var.vm-1_private_address}"
  admin_username       = "${var.admin_username}"
  admin_password       = "${var.admin_password}"
}

module "VM_2" {
  source               = "../modules/VM"
  virtual_machine_name = "${var.vm-2_name}"
  location             = "${var.location}"
  resource_group_name  = "${data.azurerm_resource_group.RG.name}"
  vm_size              = "${var.vm_size}"
  subnet_id            = "${module.subnet.subnet_id}"
  private_ip_address   = "${var.vm-2_private_address}"
  admin_username       = "${var.admin_username}"
  admin_password       = "${var.admin_password}"
}