##################################################################################

# PROVIDERS

##################################################################################

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.39.1"
    }
  }
}

provider "azurerm" {
  features {}
}

# provider "azurerm" {
# subscription_id = "SUBSCRIPTION_ID"
# client_id = "CLIENT_ID"
# client_secret = "CLIENT_SECRET"
# tenant_id = "TENANT_ID"
# }
