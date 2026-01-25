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

##### Layer 2 Eth Int #####

# resource "nxos_physical_interface" "l2_int-core01" {
#   provider              = nxos.core01
#   for_each              = {for k, v in var.l2_int_map : k => v}
#   interface_id          = "${each.value.interface_id}"
#   admin_state           = lookup(each.value, "admin_state", null)
#   mode                  = lookup(each.value, "mode", null)
#   trunk_vlans           = lookup(each.value, "trunk_vlans", null)
#   description           = lookup(each.value, "description", null)
#   layer                 = lookup(each.value, "layer", null)
# }


# resource "nxos_physical_interface" "l2_int-core02" {
#   provider              = nxos.core02
#   for_each              = {for k, v in var.l2_int_map : k => v}
#   interface_id          = "${each.value.interface_id}"
#   admin_state           = lookup(each.value, "admin_state", null)
#   mode                  = lookup(each.value, "mode", null)
#   trunk_vlans           = lookup(each.value, "trunk_vlans", null)
#   description           = lookup(each.value, "description", null)
#   layer                 = lookup(each.value, "layer", null)
# }
#   description  = lookup(each.value, "description", null)
##### End of Layer 2 Eth Int #####

##### End of Config #####

##### Static config below #####


##### Configure Physical Interface for use by PO111 #####

resource "nxos_rest" "Configure-eth1_1-po111-core01" {
  provider = nxos.core01
  dn = "sys/intf/phys-[eth1/1]"
  class_name = "l1PhysIf"
  content = {
    "adminSt": "up",
    "descr": "link to TWE-AGG01 via Port-Channel111",
    "layer": "Layer3",
    "id": "eth1/1",
    "mtu": "9216",
    "status": "created,modified"
  }
}
resource "nxos_rest" "Configure-eth1_2-po112-core01" {
  provider = nxos.core01
  dn = "sys/intf/phys-[eth1/2]"
  class_name = "l1PhysIf"
  content = {
    "adminSt": "up",
    "descr": "link to TWE-AGG02 via Port-Channel112",
    "layer": "Layer3",
    "id": "eth1/2",
    "mtu": "9216",
    "status": "created,modified"
  }
}
#
resource "nxos_rest" "Configure-eth1_1-po121-core02" {
  provider = nxos.core02
  dn = "sys/intf/phys-[eth1/1]"
  class_name = "l1PhysIf"
  content = {
    "adminSt": "up",
    "descr": "link to TWE-AGG01 via Port-Channel121",
    "layer": "Layer3",
    "id": "eth1/1",
    "mtu": "9216",
    "status": "created,modified"
  }
}
resource "nxos_rest" "Configure-eth1_2-po122-core02" {
  provider = nxos.core02
  dn = "sys/intf/phys-[eth1/2]"
  class_name = "l1PhysIf"
  content = {
    "adminSt": "up",
    "descr": "link to TWE-AGG02 via Port-Channel122",
    "layer": "Layer3",
    "id": "eth1/2",
    "mtu": "9216",
    "status": "created,modified"
  }
}

resource "nxos_rest" "Configure-eth1_6-po12-core01" {
  provider = nxos.core01
  dn = "sys/intf/phys-[eth1/6]"
  class_name = "l1PhysIf"
  content = {
    "adminSt": "up",
    "descr": "link to Core01 via Port-Channel12",
    "layer": "Layer3",
    "id": "eth1/6",
    "mtu": "9216",
    "status": "created,modified"
  }
}
resource "nxos_rest" "Configure-eth1_6-po12-core21" {
  provider = nxos.core02
  dn = "sys/intf/phys-[eth1/6]"
  class_name = "l1PhysIf"
  content = {
    "adminSt": "up",
    "descr": "link to Core02 via Port-Channel12",
    "layer": "Layer3",
    "id": "eth1/6",
    "mtu": "9216",
    "status": "created,modified"
  }
}