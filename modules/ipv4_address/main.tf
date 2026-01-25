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

##### IPv4 vrf #####

resource "nxos_ipv4_vrf" "ipv4-vrf-core01" {
  provider = nxos.core01
  for_each     = {for k, v in var.ipv4_vrf_map : k => v}  
  name = "${each.value.name}"
}
resource "nxos_ipv4_vrf" "ipv4-vrf-core02" {
  provider = nxos.core02
  for_each     = {for k, v in var.ipv4_vrf_map : k => v}  
  name = "${each.value.name}"
}

##### END OF IPv4 vrf #####

##### loopback IPv4 Int Address #####
# AGG01
resource "nxos_ipv4_interface" "ipv4-int-core01" {
  provider     = nxos.core01
  for_each     = {for k, v in var.ipv4_int_map-core01 : k => v}
  vrf          = "${each.value.vrf}"
  interface_id = "${each.value.interface_id}"
}

resource "nxos_ipv4_interface_address" "int-ipv4-address-core01" {
  provider       = nxos.core01
  for_each       = {for k, v in var.ipv4_int_address_map-core01 : k => v}
  vrf            = "${each.value.vrf}"
  interface_id   = "${each.value.interface_id}"
  address        = "${each.value.address}"
}

#AGG02
resource "nxos_ipv4_interface" "ipv4-int-core02" {
  provider     = nxos.core02
  for_each     = {for k, v in var.ipv4_int_map-core02 : k => v}
  vrf          = "${each.value.vrf}"
  interface_id = "${each.value.interface_id}"
}

resource "nxos_ipv4_interface_address" "int-ipv4-address-core02" {
  provider       = nxos.core02
  for_each       = {for k, v in var.ipv4_int_address_map-core02 : k => v}
  vrf            = "${each.value.vrf}"
  interface_id   = "${each.value.interface_id}"
  address        = "${each.value.address}"
}

##### End of loopback IPv4 Int Address #####



##### End of Config #####

##### Static config below #####

