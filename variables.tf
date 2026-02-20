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

  variable "hostname-core01" {
    type = string
  }

  variable "hostname-core02" {
    type = string
  }

  variable "vrf-names" {
  type = list(string)
  }

  variable "vlan_map" {
 type = map(object({
   fabric_encap = string
   name   = string
 }))
}

variable "loopback_map" {
 type = map(object({
   interface_id = string
   admin_state   = string
   description = optional(string)
 }))
}
  
variable "loopback-vrf_map" {
 type = map(object({
   interface_id = string
   vrf_dn   = string
 }))
}

variable "po_int_map-core01" {
 type = map(object({
   interface_id = string
   port_channel_mode = string
   minimum_links = optional(number)
   suspend_individual = optional(string)
   admin_state   = string
   mode = optional(string)
   trunk_vlans = optional(string)
   description = optional(string)
   layer = string
   mtu = optional(number)
 }))
}
variable "po_int_map-core02" {
 type = map(object({
   interface_id = string
   port_channel_mode = string
   minimum_links = optional(number)
   suspend_individual = optional(string)
   admin_state   = string
   mode = optional(string)
   trunk_vlans = optional(string)
   description = optional(string)
   layer = string
   mtu = optional(number)
 }))
}
  
variable "po_sub-int_map-core01" {
  type = map(object({
    interface_id = string
    admin_state  = string
    description  = optional(string)
    mtu          = optional(number)
    encap = string
}))
}
variable "po_sub-int_map-core02" {
  type = map(object({
    interface_id = string
    admin_state  = string
    description  = optional(string)
    mtu          = optional(number)
    encap = string
}))
}

variable "po_sub-int-vrf_map-core01" {
  type = map(object({
    interface_id = string
    vrf_dn = string
}))
}
variable "po_sub-int-vrf_map-core02" {
  type = map(object({
    interface_id = string
    vrf_dn = string
}))
}

# variable "po_vrf_map" {
#   type = map(object({
#     interface_id = string
#     vrf_dn = string
# }))
# }

variable "po_member_map-core01" {
  type = map(object({
    interface_id = string
    interface_dn = string
    force = bool
}))
}
variable "po_member_map-core02" {
  type = map(object({
    interface_id = string
    interface_dn = string
    force = bool
}))
}

variable "ipv4_vrf_map" {
 type = map(object({
   name = string
 }))
}

variable "ipv4_int_map-core01" {
 type = map(object({
   vrf = string
   interface_id = string
  }))
}

variable "ipv4_int_map-core02" {
 type = map(object({
   vrf = string
   interface_id = string
  }))
}

variable "ipv4_int_address_map-core01" {
 type = map(object({
   vrf = string
   interface_id = string
   address = string
 }))
}

variable "ipv4_int_address_map-core02" {
 type = map(object({
   vrf = string
   interface_id = string
   address = string
 }))
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