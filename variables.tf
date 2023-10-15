#############################################################################
# VARIABLES
#############################################################################

variable "resource_group_name" {
  type = string
  default = "rg-pasaolu-training-cc-001"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "web_vnet_name" {
  type    = string
  default = "vnet-web-cc-001"
}

variable "db_vnet_name" {
  type    = string
  default = "vnet-db-cc-001"
}

variable "vnet_cidr_range" {
  type    = string
  default = "10.0.0.0/16"
}

variable "subnet_prefixes" {
  type    = list(string)
  default = ["10.100.0.0/24", "10.120.0.0/24"]
}

variable "subnet_names_web" {
  type    = string
  default = "snet-vnet-web-cc-001"
}

variable "subnet_names_db" {
  type    = string
  default = "snet-vnet-db-cc-001"
}

variable "azurerm_virtual_network1" {
  type    = string
  default = "webtodb"
}


variable "azurerm_virtual_network2" {
  type    = string
  default = "dbtoweb"
}


