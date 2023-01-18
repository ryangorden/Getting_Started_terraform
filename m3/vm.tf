# INSTANCES

resource "azurerm_virtual_machine" "nginx1" {
name = "nginx1"
location = azurerm_resource_group.rg.location
resource_group_name = azurerm_resource_group.rg.name
network_interface_ids = [azurerm_network_interface.nic.id]
vm_size = "Standard_DS1_v2"

 storage_image_reference {
  publisher = "Canonical"
  offer     = "UbuntuServer"
  sku       = "16.04-LTS"
  version   = "latest"
}
  
# storage_image_reference {
# id = data.azurerm_image.image.id
# }
  
storage_os_disk {
name = "nginx1-os-disk"
#vhd_uri = "${azurerm_storage_account.storage.primary_blob_endpoint}/nginx1-os-disk.vhd"
caching = "ReadWrite"
create_option = "FromImage"
managed_disk_type = "Standard_LRS"
}
os_profile {
computer_name = "nginx1"
admin_username = ""
admin_password = ""
}
os_profile_linux_config {
disable_password_authentication = false
}
}
