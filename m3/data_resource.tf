##################################################################################

# DATA

##################################################################################

data "azurerm_image" "image" {
name = "Canonical:UbuntuServer:19_04-daily-gen2:19.04.201911140"
resource_group_name = azurerm_resource_group.rg.name
}
