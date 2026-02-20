terraform {
  required_providers {
    nxos = {
      source = "CiscoDevNet/nxos"
    }
  }
}


################## MODULES ###############

###
# These are applied to individual switches
# It is how we get the dynamic variable applied to the switch  
###

### SET HOSTNAME using module/core01 02###

module "config-core01" {
  source = "./modules/core01"
  provider-username = var.provider-username
  provider-userpass = var.provider-userpass
  provider-url-core01 = var.provider-url-core01
  hostname-core01 = var.hostname-core01
}  

module "config-core02" {
  source = "./modules/core02"
  provider-username = var.provider-username
  provider-userpass = var.provider-userpass
  provider-url-core02 = var.provider-url-core02
  hostname-core02 = var.hostname-core02
}

###
# These are static modules applied to all switches
# Take care before changing any of these variables
###

#####Enable Features using  modules/features #####

module "config-twe-features" {
  source = "./modules/features"
  provider-username = var.provider-username
  provider-userpass = var.provider-userpass
  provider-url-core01 = var.provider-url-core01
  provider-url-core02 = var.provider-url-core02
}

#####Enable vrf #using  modules/vrf ####
module "config-twe-vrf" {
  source = "./modules/vrf"
  provider-username = var.provider-username
  provider-userpass = var.provider-userpass
  provider-url-core01 = var.provider-url-core01
  provider-url-core02 = var.provider-url-core02
  vrf-names = var.vrf-names 
}

##### Configure  VLANs  using modules/common-vlan #####
module "config-common-vlans" {
  source = "./modules/vlan"
  provider-username = var.provider-username
  provider-userpass = var.provider-userpass
  provider-url-core01 = var.provider-url-core01
  provider-url-core02 = var.provider-url-core02
  vlan_map = var.vlan_map
}

module "config-loopback-int" {
  source = "./modules/loopback_int"
  provider-username = var.provider-username
  provider-userpass = var.provider-userpass
  provider-url-core01 = var.provider-url-core01
  provider-url-core02 = var.provider-url-core02
  loopback_map = var.loopback_map
  loopback-vrf_map = var.loopback-vrf_map
}

##### Configure  po-Int #####
module "config-po-int" {
  source = "./modules/port-channels"
  provider-username = var.provider-username
  provider-userpass = var.provider-userpass
  provider-url-core01 = var.provider-url-core01
  provider-url-core02 = var.provider-url-core02
  po_int_map-core01 = var.po_int_map-core01
  po_sub-int_map-core01 = var.po_sub-int_map-core01
  po_sub-int-vrf_map-core01 = var.po_sub-int-vrf_map-core01
  #po_vrf_map = var.po_vrf_map
  po_member_map-core01 = var.po_member_map-core01
   po_int_map-core02 = var.po_int_map-core02
  po_sub-int_map-core02 = var.po_sub-int_map-core02
  po_sub-int-vrf_map-core02 = var.po_sub-int-vrf_map-core02
  po_member_map-core02 = var.po_member_map-core02
}

# ##### Configure  Eth-Int #####
module "config-eth-int" {
  source = "./modules/Eth_Int"
  provider-username = var.provider-username
  provider-userpass = var.provider-userpass
  provider-url-core01 = var.provider-url-core01
  provider-url-core02 = var.provider-url-core02
  # l2_int_map = var.l2_int_map
 }

module "config-ipv4-int-address" {
  source = "./modules/ipv4_address"
  provider-username = var.provider-username
  provider-userpass = var.provider-userpass
  provider-url-core01 = var.provider-url-core01
  provider-url-core02 = var.provider-url-core02
  ipv4_int_map-core01 = var.ipv4_int_map-core01
  ipv4_int_map-core02 = var.ipv4_int_map-core02
  ipv4_int_address_map-core01 = var.ipv4_int_address_map-core01
  ipv4_int_address_map-core02 = var.ipv4_int_address_map-core02
  ipv4_vrf_map = var.ipv4_vrf_map
}

##### Configure Static routes #####
module "config-static-route" {
  source = "./modules/routing"
  provider-username = var.provider-username
  provider-userpass = var.provider-userpass
  provider-url-core01 = var.provider-url-core01
  provider-url-core02 = var.provider-url-core02
  static-routes_map_core01 = var.static-routes_map_core01
  static-routes_map_core02 = var.static-routes_map_core02  
  #bgp_map = var.bgp_map
}



# ##### Configure  SVI #####
# module "config-svi" {
#   source = "./modules/svi"
#   provider-username = var.provider-username
#   provider-userpass = var.provider-userpass
#   provider-url-agg01 = var.provider-url-agg01
#   provider-url-agg02 = var.provider-url-agg02
#   svi_int_map = var.svi_int_map
#   svi_int_vrf_map = var.svi_int_vrf_map
# }







# module "config-vpc" {
#   source = "./modules/vpc"
#   provider-username = var.provider-username
#   provider-userpass = var.provider-userpass
#   provider-url-agg01 = var.provider-url-agg01
#   provider-url-agg02 = var.provider-url-agg02
# }

# module "config-static-route" {
#   source = "./modules/routing"
#   provider-username = var.provider-username
#   provider-userpass = var.provider-userpass
#   provider-url-agg01 = var.provider-url-agg01
#   provider-url-agg02 = var.provider-url-agg02
#   static-routes_map = var.static-routes_map
#   bgp_map = var.bgp_map
# }

# ##### configure acl #####
# module "config-twe-acl" {
#   source = "./modules/acl"
#   provider-username = var.provider-username
#   provider-userpass = var.provider-userpass
#   provider-url-agg01 = var.provider-url-agg01
#   provider-url-agg02 = var.provider-url-agg02
#   acl-map = var.acl-map
#   acl-entry-map = var.acl-entry-map
# }

# ################## END Of MODULES ###############

# ##### Return Data from Switches #####
# data "nxos_system" "system-info-twe-agg01" {
#   provider = nxos.twe-agg01
# }
# output "hostname-twe-agg01" {
#   value = data.nxos_system.system-info-twe-agg01.name
# }
# data "nxos_system" "system-info-twe-agg02" {
#   provider = nxos.twe-agg02
# }
# output "hostname-twe-agg02" {
#   value = data.nxos_system.system-info-twe-agg02.name
# }

# ##### REST API retulrn data
# data "nxos_rest" "l1PhysIf-agg01" {
#   provider = nxos.twe-agg01
#   dn = "sys/intf/phys-[eth1/1]"
# }
# output "l1_phys_int_eth1_1" {
#   value = data.nxos_rest.l1PhysIf-agg01.content.adminSt
# }

# ##### REST API return data WIP ###

# ####Try to pass back from module ###
