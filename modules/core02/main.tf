terraform {
  required_providers {
    nxos = {
      source = "CiscoDevNet/nxos"
    }
  }
}

provider "nxos" {
  username = var.provider-username
  password = var.provider-userpass
  url      = var.provider-url-core02
}

################## MODULES ###############
  

################## END Of MODULES ###############

################## CONFIG ###############

###Set HOSTNAME###
resource "nxos_system" "hostname-CORE02" {
  name = var.hostname-core02
}
###END OF SET HOTNAME###

################## END OF CONFIG ###############

################## SAVE CONFIG ###############

resource "nxos_save_config" "save-config-core01" {
}

################## END OF SAVE CONFIG ###############