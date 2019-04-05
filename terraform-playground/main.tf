provider "azurerm" {
    version = "=1.20.0"
}

variable "prefix" {
  default = "playground"
}

data "azurerm_subscription" "current" {}

output "current_subscription_display_name" {
  value = "${data.azurerm_subscription.current.display_name}"
}

resource "azurerm_resource_group" "playground" {
  name     = "playground"
  location = "West US"
}

resource "azurerm_virtual_network" "playground" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.playground.location}"
  resource_group_name = "${azurerm_resource_group.playground.name}"
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = "${azurerm_resource_group.playground.name}"
  virtual_network_name = "${azurerm_virtual_network.playground.name}"
  address_prefix       = "10.0.2.0/24"
}

resource "azurerm_network_interface" "playground" {
  name                = "${var.prefix}-nic"
  location            = "${azurerm_resource_group.playground.location}"
  resource_group_name = "${azurerm_resource_group.playground.name}"

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = "${azurerm_subnet.internal.id}"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "playground" {
  name                  = "${var.prefix}-vm"
  location              = "${azurerm_resource_group.playground.location}"
  resource_group_name   = "${azurerm_resource_group.playground.name}"
  network_interface_ids = ["${azurerm_network_interface.playground.id}"]
  vm_size               = "Standard_DS1_v2"

  delete_os_disk_on_termination = true

  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "${var.prefix}osdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "testadmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}