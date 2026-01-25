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

resource "nxos_feature_vpc" "feature_vpc-core-01" {
  provider = nxos.core01 
  admin_state = "enabled"
}
resource "nxos_feature_lacp" "feature_lacp-core-01" {
  provider = nxos.core01 
  admin_state = "enabled"
}
resource "nxos_feature_bgp" "feature_bgp-core-01" {
  provider = nxos.core01 
  admin_state = "enabled"
}
resource "nxos_feature_bfd" "feature_bfd-core-01" {
  provider = nxos.core01 
  admin_state = "enabled"
}
resource "nxos_feature_interface_vlan" "feature_svi-core-01" {
  provider = nxos.core01 
  admin_state = "enabled"
}

resource "nxos_feature_vpc" "feature_vpc-core-02" {
  provider = nxos.core02 
  admin_state = "enabled"
}
resource "nxos_feature_lacp" "feature_lacp-core-02" {
  provider = nxos.core02 
  admin_state = "enabled"
}
resource "nxos_feature_bgp" "feature_bgp-core-02" {
  provider = nxos.core02 
  admin_state = "enabled"
}
resource "nxos_feature_bfd" "feature_bfd-core-02" {
  provider = nxos.core02 
  admin_state = "enabled"
}
resource "nxos_feature_interface_vlan" "feature_svi-core-02" {
  provider = nxos.core02 
  admin_state = "enabled"
}