variable "provider-username" {
  type = string
  }

variable "provider-userpass" {
  type = string
  }

variable "provider-url-core01" {
  type = string
  }

variable "provider-url-core02" {
  type = string
  }

variable "static-routes_map_core01" {
 type = map(object({
   vrf_name = string
   prefix = string
   interface_id = string
   nh-address  = string
}))
}

variable "static-routes_map_core02" {
 type = map(object({
   vrf_name = string
   prefix = string
   interface_id = string
   nh-address  = string  
 }))
}

# variable "bgp_map" {
#  type = map(object({
#    admin_state = string
#    local-asn   = string
#    vrf-name = string
#    router_id-agg01 = string
#    router_id-agg02 = string
#    address_family = string
#    prefix-agg01 = string
#    prefix-agg02 = string
#    template_name = string
#    remote-asn = string
#    send-comm-extended = string
#    send-comm-standard = string
#    description = string
#    peer_template = string
#    peer-address-agg01-02 = string
#    peer-address-agg02-01 = string
#    peer-description = string
#    source_interface = string
#  }))
# }
 