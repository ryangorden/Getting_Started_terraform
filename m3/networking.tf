NETWORKING

resource "azurerm_resource_group" "rg" {
name = "example"
location = "eastus"
}

resource "azurerm_virtual_network" "vnet" {
name = "example-vnet"
address_space = ["10.0.0.0/16"]
location = azurerm_resource_group.rg.location
resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet1" {
name = "example-subnet"
resource_group_name = azurerm_resource_group.rg.name
virtual_network_name = azurerm_virtual_network.vnet.name
address_prefix = "10.0.0.0/24"
}

resource "azurerm_public_ip" "pip" {
name = "example-pip"
location = azurerm_resource_group.rg.location
resource_group_name = azurerm_resource_group.rg.name
allocation_method = "Dynamic"
}

resource "azurerm_network_interface" "nic" {
name = "example-nic"
location = azurerm_resource_group.rg.location
resource_group_name = azurerm_resource_group.rg.name
network_security_group_id = azurerm_network_security_group.nsg.id
ip_configuration {
name = "example-config"
subnet_id = azurerm_subnet.subnet1.id
private_ip_address_allocation = "dynamic"
public_ip_address_id = azurerm_public_ip.pip.id
}
}

resource "azurerm_network_security_group" "nsg" {
name = "example-nsg"
location = azurerm_resource_group.rg.location
resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_network_security_rule" "http" {
name = "http"
priority = 100
direction = "Inbound"
access = "Allow"
protocol = "Tcp"
source_port_range = ""
destination_port_range = "80"
source_address_prefix = ""
destination_address_prefix = "*"
network_security_group_name = azurerm_network_security_group.nsg.name
}
