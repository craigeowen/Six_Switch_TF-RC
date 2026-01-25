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

##### Port Channels #####

resource "nxos_port_channel_interface" "configure-po-core01" {
  provider              = nxos.core01
  for_each              = {for k, v in var.po_int_map-core01 : k => v}
  interface_id          = "${each.value.interface_id}"
  port_channel_mode     = "${each.value.port_channel_mode}"
  minimum_links         = lookup(each.value, "minimum_links", null)
  suspend_individual    = lookup(each.value, "suspend_individual", null)
  admin_state           = "${each.value.admin_state}"
  mode                  = lookup(each.value, "mode", null)
  trunk_vlans           = lookup(each.value, "trunk_vlans", null)
  description           = lookup(each.value, "description", null)
  layer                 = "${each.value.layer}"
  mtu                   = lookup(each.value, "mtu", null)

}
resource "nxos_port_channel_interface" "configure-po-core02" {
  provider              = nxos.core02
  for_each              = {for k, v in var.po_int_map-core02 : k => v}
  interface_id          = "${each.value.interface_id}"
  port_channel_mode     = "${each.value.port_channel_mode}"
  minimum_links         = lookup(each.value, "minimum_links", null)
  suspend_individual    = lookup(each.value, "suspend_individual", null)
  admin_state           = "${each.value.admin_state}"
  mode                  = lookup(each.value, "mode", null)
  trunk_vlans           = lookup(each.value, "trunk_vlans", null)
  description           = lookup(each.value, "description", null)
  layer                 = "${each.value.layer}"
  mtu                   = lookup(each.value, "mtu", null)

}

##### END OF Port Channels #####

##### Sub-Int on Port Channels ##### 

resource "nxos_subinterface" "po_sub_int_acore1" {
  provider = nxos.core01
  for_each              = {for k, v in var.po_sub-int_map-core01 : k => v}
  interface_id = "${each.value.interface_id}"
  admin_state  = "${each.value.admin_state}"
  description  = lookup(each.value, "description", null)
  mtu          = lookup(each.value, "mtu", null)
  encap        = "${each.value.encap}"
}

resource "nxos_subinterface" "po_sub_int_core02" {
  provider = nxos.core02
  for_each              = {for k, v in var.po_sub-int_map-core02 : k => v}
  interface_id = "${each.value.interface_id}"
  admin_state  = "${each.value.admin_state}"
  description  = lookup(each.value, "description", null)
  mtu          = lookup(each.value, "mtu", null)
  encap        = "${each.value.encap}"
}

##### END OF Sub-Int on Port Channels #####

##### Sub-Int VRF on Port Channels ##### 

resource "nxos_subinterface_vrf" "po_sub_int_vrf_core01" {
  provider = nxos.core01
  for_each              = {for k, v in var.po_sub-int-vrf_map-core01 : k => v}  
  interface_id = "${each.value.interface_id}"
  vrf_dn       = "${each.value.vrf_dn}"
}

resource "nxos_subinterface_vrf" "po_sub_int_vrf_core02" {
  provider     = nxos.core02
  for_each     = {for k, v in var.po_sub-int-vrf_map-core02 : k => v}  
  interface_id = "${each.value.interface_id}"
  vrf_dn       = "${each.value.vrf_dn}"
}

##### END OF Sub-Int VRF on Port Channels ##### 

##### VRF on L3 PO #####

#  resource "nxos_port_channel_interface_vrf" "po-vrf_map_core01" {
#    provider = nxos.core01
#    for_each     = {for k, v in var.po_vrf_map : k => v} 
#    interface_id = "${each.value.interface_id}"
#    vrf_dn       = "${each.value.vrf_dn}"
#  }

#   resource "nxos_port_channel_interface_vrf" "po-vrf_map_core02" {
#    provider = nxos.core02
#    for_each     = {for k, v in var.po_vrf_map : k => v} 
#    interface_id = "${each.value.interface_id}"
#    vrf_dn       = "${each.value.vrf_dn}"
#  }

##### End of VRF on L3 PO #####

##### ADD INT TO PO #####

 resource "nxos_port_channel_interface_member" "po-member_map_core01" {
   provider = nxos.core01
   for_each     = {for k, v in var.po_member_map-core01 : k => v} 
   interface_id = "${each.value.interface_id}"
   interface_dn = "${each.value.interface_dn}"
   force        = "${each.value.force}"
 }

  resource "nxos_port_channel_interface_member" "po-int_member_core02" {
   provider = nxos.core02
   for_each     = {for k, v in var.po_member_map-core02 : k => v} 
   interface_id = "${each.value.interface_id}"
   interface_dn = "${each.value.interface_dn}"
   force        = "${each.value.force}"
 }

##### End of ADD INT TO PO #####

##### End of Config #####

##### Static config below #####

##### Configure Physical Interface for use by PO4 #####
# resource "nxos_rest" "Configure-eth1_6-po4-twe-agg01" {
#   provider = nxos.twe-agg01
#   dn = "sys/intf/phys-[eth1/6]"
#   class_name = "l1PhysIf"
#   content = {
#     "adminSt": "up",
#     "descr": "link to TWE-AGG02 via Port-Channel4",
#     "layer": "Layer3",
#     "id": "eth1/6",
#     "mtu": "9216",
#     "status": "created,modified"
#   }
# }

##### Configure Physical Interface for use by PO4 #####
# resource "nxos_rest" "Configure-eth1_6-po4-twe-agg02" {
#   provider = nxos.twe-agg02
#   dn = "sys/intf/phys-[eth1/6]"
#   class_name = "l1PhysIf"
#   content = {
#     "adminSt": "up",
#     "descr": "link to TWE-AGG01 via Port-Channel4",
#     "layer": "Layer3",
#     "id": "eth1/6",
#     "mtu": "9216",
#     "status": "created,modified"
#   }
# }


##### STP on PO1 #####

#  resource "nxos_spanning_tree_interface" "po1_STP_agg01" {
#    provider = nxos.twe-agg01
#   interface_id = "po1"
#   mode         = "network"
#  }


#  resource "nxos_spanning_tree_interface" "po1_STP_agg02" {
#    provider = nxos.twe-agg02
#   interface_id = "po1"
#   mode         = "network"
#  }

##### END OF STP on PO1 #####