terraform {
  required_providers {
    nxos = {
      source = "CiscoDevNet/nxos"
    }
  }
}

provider "nxos" {
  alias = "core01"
  username = var.provider-username
  password = var.provider-userpass
  url      = var.provider-url-core01
}
provider "nxos" {
  alias = "core02"
  username = var.provider-username
  password = var.provider-userpass
  url      = var.provider-url-core02
}

##### Config #####
### This just sets the loopback interface characterisitscs and vrf - IP Address is done in ipv4 module ###
##### loopback Int #####

resource "nxos_loopback_interface" "loopback_int-core01" {
  provider              = nxos.core01
  for_each              = {for k, v in var.loopback_map : k => v}
  interface_id          = "${each.value.interface_id}"
  admin_state           = "${each.value.admin_state}"
  description           = "${each.value.description}"
}


resource "nxos_loopback_interface" "loopback_int-core02" {
  provider              = nxos.core02
  for_each              = {for k, v in var.loopback_map : k => v}
  interface_id          = "${each.value.interface_id}"
  admin_state           = "${each.value.admin_state}"
  description           = "${each.value.description}"
}

##### End of Loopback Int #####

##### loopback Int VRF #####

resource "nxos_loopback_interface_vrf" "loopback_int_vrf-core01" {
  provider              = nxos.core01
  for_each              = {for k, v in var.loopback-vrf_map : k => v}
  interface_id          = "${each.value.interface_id}"
  vrf_dn                = "${each.value.vrf_dn}"
}


resource "nxos_loopback_interface_vrf" "loopback_int_vrf-core02" {
  provider              = nxos.core02
  for_each              = {for k, v in var.loopback-vrf_map : k => v}
  interface_id          = "${each.value.interface_id}"
  vrf_dn                = "${each.value.vrf_dn}"
}

##### End of Loopback Int VRF #####

##### End of Config #####

##### Static config below #####

