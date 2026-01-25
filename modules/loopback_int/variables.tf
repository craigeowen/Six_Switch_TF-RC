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
