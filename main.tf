#############################################################################
# TERRAFORM CONFIG
#############################################################################

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}


#############################################################################
# PROVIDERS
#############################################################################

provider "azurerm" {
  features {}
}

#############################################################################
# RESOURCES
#############################################################################


# Create Azure Virtual Network - Web

resource "azurerm_virtual_network" "web_vnet_name"{
  name                = var.web_vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.100.0.0/16"]

  subnet {
    name           = var.subnet_names_web
    address_prefix = "10.100.0.0/24"
  }

  tags = {
    team = "web team"
  }
}

# Create Azure Virtual Network - database

resource "azurerm_virtual_network" "db_vnet_name"{
  name                = var.db_vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.120.0.0/16"]

  subnet {
    name           = var.subnet_names_db
    address_prefix = "10.120.0.0/24"
  }

  tags = {
    team = "database team"
  }
}


#############################################################################
# NETWORK PEERING
#############################################################################

resource "azurerm_virtual_network_peering" "azurerm_virtual_network1" {
  name                      = "peerwebtodb"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.web_vnet_name
  remote_virtual_network_id = azurerm_virtual_network.db_vnet_name.id
}

resource "azurerm_virtual_network_peering" "azurerm_virtual_network2" {
  name                      = "peerdbtoweb"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = var.db_vnet_name
  remote_virtual_network_id = azurerm_virtual_network.web_vnet_name.id
}



#############################################################################
# OUTPUTS
#############################################################################

