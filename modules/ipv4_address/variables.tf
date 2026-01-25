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

variable "ipv4_int_map-core01" {
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

variable "ipv4_int_map-core02" {
 type = map(object({
   vrf = string
   interface_id = string
  }))
}
  
variable "ipv4_int_address_map-core02" {
 type = map(object({
   vrf = string
   interface_id = string
   address = string
 }))
}

variable "ipv4_vrf_map" {
 type = map(object({
   name = string
 }))
}