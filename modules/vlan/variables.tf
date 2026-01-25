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

variable "vlan_map" {
 type = map(object({
   fabric_encap = string
   name   = string
 }))
}
  