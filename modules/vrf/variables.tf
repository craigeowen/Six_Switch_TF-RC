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

variable "vrf-names" {
  type = list(string)
### It is not mandatroy to define a default action here  
}
  