# NETWORKING

resource "azurerm_resource_group" "rg" {
name = "ps-rg"
location = "eastus"
}

resource "azurerm_virtual_network" "vnet" {
name = "ps-vnet"
address_space = ["10.0.0.0/16"]
location = azurerm_resource_group.rg.location
resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet1" {
name = "web"
resource_group_name = azurerm_resource_group.rg.name
virtual_network_name = azurerm_virtual_network.vnet.name
address_prefixes = ["10.0.0.0/24"]
}

resource "azurerm_public_ip" "pip" {
name = "ps-pip"
location = azurerm_resource_group.rg.location
resource_group_name = azurerm_resource_group.rg.name
allocation_method = "Dynamic"
}

resource "azurerm_network_interface" "nic" {
name = "ps-nic"
location = azurerm_resource_group.rg.location
resource_group_name = azurerm_resource_group.rg.name
ip_configuration {
name = "example-config"
subnet_id = azurerm_subnet.subnet1.id
private_ip_address_allocation = "Dynamic"
public_ip_address_id = azurerm_public_ip.pip.id
}
}


