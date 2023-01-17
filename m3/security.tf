SECURITY GROUPS

resource "azurerm_network_security_group" "nginx-sg" {
name = "nginx_sg"
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
network_security_group_name = azurerm_network_security_group.nginx-sg.name
}
