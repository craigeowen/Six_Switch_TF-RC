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


##### Static Routes #####
resource "nxos_ipv4_static_route" "SR-for-bgp-core01" {
  provider = nxos.core01
  for_each = {for k, v in var.static-routes_map_core01 : k => v} 
  vrf_name = "${each.value.vrf_name}"
  prefix   = "${each.value.prefix}"
  next_hops = [{
    interface_id = "${each.value.interface_id}"
    address      = "${each.value.nh-address}"
    vrf_name     = "${each.value.vrf_name}"
  }]
}

resource "nxos_ipv4_static_route" "SR-for-bgp-core02" {
  provider = nxos.core02
  for_each = {for k, v in var.static-routes_map_core02 : k => v} 
  vrf_name = "${each.value.vrf_name}"
  prefix   = "${each.value.prefix}"
  next_hops = [{
    interface_id = "${each.value.interface_id}"
    address      = "${each.value.nh-address}"
    vrf_name     = "${each.value.vrf_name}"
  }]
}

##### END OF STATIC ROUTES #####

##### BGP #####
# resource "nxos_bgp" "router_bgp-agg01" {
#   provider = nxos.twe-agg01
#   admin_state = "enabled"
# }
# resource "nxos_bgp" "router_bgp-agg02" {
#   provider = nxos.twe-agg02
#   admin_state = "enabled"
# }

# resource "nxos_bgp_instance" "router_bgp_instance-agg01" {
#   provider                = nxos.twe-agg01
#   for_each = {for k, v in var.bgp_map : k => v}
#   admin_state             = "${each.value.admin_state}"
#   asn                     = "${each.value.local-asn}"
# }
# resource "nxos_bgp_instance" "router_bgp_instance-agg02" {
#   provider                = nxos.twe-agg02
#   for_each = {for k, v in var.bgp_map : k => v}
#   admin_state             = "${each.value.admin_state}"
#   asn                     = "${each.value.local-asn}"
# }

# resource "nxos_bgp_vrf" "router-bgp-vrf-agg01" {
#   provider = nxos.twe-agg01
#   for_each = {for k, v in var.bgp_map : k => v}
#   asn       = "${each.value.local-asn}"
#   name      = "${each.value.vrf-name}"
#   router_id = "${each.value.router_id-agg01}"
# }
# resource "nxos_bgp_vrf" "router-bgp-vrf-agg02" {
#   provider = nxos.twe-agg02
#   for_each = {for k, v in var.bgp_map : k => v}
#   asn       = "${each.value.local-asn}"
#   name      = "${each.value.vrf-name}"
#   router_id = "${each.value.router_id-agg02}"
# }

# resource "nxos_bgp_address_family" "router-bgp-AF-agg01" {
#   provider = nxos.twe-agg01
#   for_each = {for k, v in var.bgp_map : k => v}
#   asn                                    = "${each.value.local-asn}"
#   vrf                                    = "${each.value.vrf-name}"
#   address_family                         = "${each.value.address_family}"
#   }
#   resource "nxos_bgp_address_family" "router-bgp-AF-agg02" {
#   provider = nxos.twe-agg02
#   for_each = {for k, v in var.bgp_map : k => v}
#   asn                                    = "${each.value.local-asn}"
#   vrf                                    = "${each.value.vrf-name}"
#   address_family                         = "${each.value.address_family}"
#   }

#   resource "nxos_bgp_advertised_prefix" "router-bgp-prefix-agg01" {
#   provider = nxos.twe-agg01
#   for_each = {for k, v in var.bgp_map : k => v}
#   asn            = "${each.value.local-asn}"
#   vrf            = "${each.value.vrf-name}"
#   address_family = "${each.value.address_family}"
#   prefix         = "${each.value.prefix-agg01}"
# }
#   resource "nxos_bgp_advertised_prefix" "router-bgp-prefix-agg02" {
#   provider = nxos.twe-agg02
#   for_each = {for k, v in var.bgp_map : k => v}
#   asn            = "${each.value.local-asn}"
#   vrf            = "${each.value.vrf-name}"
#   address_family = "${each.value.address_family}"
#   prefix         = "${each.value.prefix-agg02}"
# }

#  resource "nxos_bgp_peer_template" "pt-ibgp-baseline-agg01" {
#   provider = nxos.twe-agg01
#   for_each = {for k, v in var.bgp_map : k => v}
#   asn              = "${each.value.local-asn}"
#   template_name    = "${each.value.template_name}"
#   remote_asn       = "${each.value.remote-asn}"
# }
#  resource "nxos_bgp_peer_template" "pt-ibgp-baseline-agg02" {
#   provider = nxos.twe-agg02
#   for_each = {for k, v in var.bgp_map : k => v}
#   asn              = "${each.value.local-asn}"
#   template_name    = "${each.value.template_name}"
#   remote_asn       = "${each.value.remote-asn}"
# }

# resource "nxos_bgp_peer_template_address_family" "pt-ibgp-baseline-AF-agg01" {
#   provider = nxos.twe-agg01
#   for_each = {for k, v in var.bgp_map : k => v}
#   asn                     = "${each.value.local-asn}"
#   template_name           = "${each.value.template_name}"
#   address_family          = "${each.value.address_family}"
#   send_community_extended = "${each.value.send-comm-extended}"
#   send_community_standard = "${each.value.send-comm-standard}"
# }
# resource "nxos_bgp_peer_template_address_family" "pt-ibgp-baseline-AF-agg02" {
#   provider = nxos.twe-agg02
#   for_each = {for k, v in var.bgp_map : k => v}
#   asn                     = "${each.value.local-asn}"
#   template_name           = "${each.value.template_name}"
#   address_family          = "${each.value.address_family}"
#   send_community_extended = "${each.value.send-comm-extended}"
#   send_community_standard = "${each.value.send-comm-standard}"
# }

# resource "nxos_rest" "test-bgp-pt-peercont-agg01" {
#   provider = nxos.twe-agg01
#   dn = "sys/bgp/inst/dom-[default]/peercont-[ibgp-baseline]"
#   class_name = "bgpPeerCont"
#   content = {
#     "holdIntvl": "30",
#     "kaIntvl": "10",
#     #"password": "password1234"

#   }
# }
# resource "nxos_rest" "test-bgp-pt-peercont-agg02" {
#   provider = nxos.twe-agg02
#   dn = "sys/bgp/inst/dom-[default]/peercont-[ibgp-baseline]"
#   class_name = "bgpPeerCont"
#   content = {
#     "holdIntvl": "30",
#     "kaIntvl": "10",
#     #"password": "password1234"

#   }
# }

# resource "nxos_rest" "test-bgp-pt-peeraf-agg01" {
#   provider = nxos.twe-agg01
#   dn = "sys/bgp/inst/dom-[default]/peercont-[ibgp-baseline]/af-[ipv4-ucast]"
#   class_name = "bgpPeerAf"
#   content = {
#     "ctrl": "nh-self,rr-client",
#     "softReconfigBackup": "inbound"
#   }
# }
# resource "nxos_rest" "test-bgp-pt-peeraf-agg02" {
#   provider = nxos.twe-agg02
#   dn = "sys/bgp/inst/dom-[default]/peercont-[ibgp-baseline]/af-[ipv4-ucast]"
#   class_name = "bgpPeerAf"
#   content = {
#     "ctrl": "nh-self,rr-client",
#     "softReconfigBackup": "inbound"
#   }
# }

# resource "nxos_bgp_peer" "bgp-peer-AGG02-agg01" {
#   provider = nxos.twe-agg01
#   for_each = {for k, v in var.bgp_map : k => v}  
#   asn               = "${each.value.local-asn}"
#   vrf               = "${each.value.vrf-name}"
#   address           = "${each.value.peer-address-agg01-02}"
#   description       = "${each.value.peer-description}"
#   peer_template     = "${each.value.template_name}"
#   source_interface  = "${each.value.source_interface}"
# }
# resource "nxos_bgp_peer" "bgp-peer-AGG01-agg02" {
#   provider = nxos.twe-agg02
#   for_each = {for k, v in var.bgp_map : k => v}  
#   asn               = "${each.value.local-asn}"
#   vrf               = "${each.value.vrf-name}"
#   address           = "${each.value.peer-address-agg02-01}"
#   description       = "${each.value.peer-description}"
#   peer_template     = "${each.value.template_name}"
#   source_interface  = "${each.value.source_interface}"
# }