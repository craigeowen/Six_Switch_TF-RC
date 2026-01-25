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


resource "nxos_bridge_domain" "vlan-core01" {
  provider = nxos.core01
  for_each = {for k, v in var.vlan_map : k => v}
  fabric_encap = "vlan-${each.value.fabric_encap}"
  name         = "${each.value.name}"
}


resource "nxos_bridge_domain" "vlan-core02" {
  provider = nxos.core02
  for_each = {for k, v in var.vlan_map : k => v}
  fabric_encap = "vlan-${each.value.fabric_encap}"
  name         = "${each.value.name}"
}

