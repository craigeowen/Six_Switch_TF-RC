terraform {
  required_providers {
    nxos = {
      source = "CiscoDevNet/nxos"
    }
  }
}

provider "nxos" {
  username = var.provider-username
  password = var.provider-userpass
  url      = var.provider-url-core02
}

################## MODULES ###############
  

################## END Of MODULES ###############

################## CONFIG ###############

###Set HOSTNAME###
resource "nxos_system" "hostname-CORE02" {
  name = var.hostname-core02
}
###END OF SET HOTNAME###

#####ROUTE-MAP HO-01-EXPORT-MAP
resource "nxos_route_map_rule" "route-map-core02" {
  name = "HO-01-EXPORT-MAP"

}

resource "nxos_route_map_rule_entry" "route-map-core02-entry" {
  rule_name = "HO-01-EXPORT-MAP"
  order = 10
  action = "permit"
}

 resource "nxos_rest" "route-map-core02-entry" {

   dn = "sys/rpm/rtmap-[HO-01-EXPORT-MAP]/ent-[10]/setaspathprepend"
   class_name = "rtmapSetPrepend"
   content = {
     "as": "65200",

   }
 }

resource "nxos_ipv4_prefix_list_rule" "example" {
  name = "HO-08-DCI-ROUTES"
}

resource "nxos_ipv4_prefix_list_rule_entry" "example-5" {
  rule_name  = "HO-08-DCI-ROUTES"
  order      = 5
  action     = "permit"
  prefix     = "10.38.4.0/22"

}

resource "nxos_ipv4_prefix_list_rule_entry" "example-10" {
  rule_name  = "HO-08-DCI-ROUTES"
  order      = 10
  action     = "permit"
  prefix     = "10.250.10.0/24"

}

################## END OF CONFIG ###############

################## SAVE CONFIG ###############

resource "nxos_save_config" "save-config-core02" {
}

################## END OF SAVE CONFIG ###############