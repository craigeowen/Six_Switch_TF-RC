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


resource "nxos_vrf" "vrf-core01" {
  provider = nxos.core01
  for_each = toset(var.vrf-names)
  name = each.value
}


resource "nxos_vrf" "vrf-core02" {
  provider = nxos.core02
  for_each = toset(var.vrf-names)
  name = each.value
}

