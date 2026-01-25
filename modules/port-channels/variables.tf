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