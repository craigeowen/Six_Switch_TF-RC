
###SET VRFs accross switches###
vrf-names = ["vpc", "xx01_es_core"]
###

### SET NTP SERVERS ###
#TBC
###

### Set vlans ###
vlan_map = {
    "10" = {
    fabric_encap = "10"
    name         = "TEMP-TEST"
    },
    "20" = {
    fabric_encap = "20"
    name         = "TEMP-TEST2"
    },
    "1100" = {
    fabric_encap = "1100"
    name         = "xx-01_AGG_to_EDG"
    },
    "1101" = {
    fabric_encap = "1101"
    name         = "XX-01_ES_EDG"
    },
    "3010" = {
    fabric_encap = "3010"
    name         = "xx01_bgp_peers"
    }    
}
###

### SET LOOPBACK Int characteristics and vrf #####

#
loopback_map = {
  "lo101" = {
  interface_id = "lo101"
  admin_state  = "up"
  description  = "### XX-01 loopback ###"
  },
  
}
#
loopback-vrf_map = {
  "lo101" = {
  interface_id = "lo101"
  vrf_dn       = "sys/inst-xx01_es_core"
  },
  
}

### SET PO Interfaces

po_int_map-core01 = {

   "po12" = {
    interface_id          = "po12"
    port_channel_mode     = "active"
    admin_state           = "up"
    description           = "### XX-01 CORE01 - CORE02 BGP ###"
    layer                 = "Layer3"
    mtu                   = 9216
    }, 
   "po111" = {
    interface_id          = "po111"
    port_channel_mode     = "active"
    admin_state           = "up"
    description           = "### XX-01 RC BGP ###"
    layer                 = "Layer3"
    mtu                   = 9216
    },
   "po112" = {
    interface_id          = "po112"
    port_channel_mode     = "active"
    admin_state           = "up"
    description           = "### XX-01 RC BGP ###"
    layer                 = "Layer3"
    mtu                   = 9216
    },    
}
po_int_map-core02 = {

   "po12" = {
    interface_id          = "po12"
    port_channel_mode     = "active"
    admin_state           = "up"
    description           = "### XX-01 CORE01 - CORE02 BGP ###"
    layer                 = "Layer3"
    mtu                   = 9216
    }, 
   "po111" = {
    interface_id          = "po121"
    port_channel_mode     = "active"
    admin_state           = "up"
    description           = "### XX-01 RC BGP ###"
    layer                 = "Layer3"
    mtu                   = 9216
    },
   "po112" = {
    interface_id          = "po122"
    port_channel_mode     = "active"
    admin_state           = "up"
    description           = "### XX-01 RC BGP ###"
    layer                 = "Layer3"
    mtu                   = 9216
    },    
}

### SET PO sub Interface
po_sub-int_map-core01 = {

   "po12" = {
    interface_id = "po12.3010"
    admin_state  = "up"
    description  = "### XX-01 CORE01 - CORE02 BGP ###"
    mtu          = 9216
    encap = "vlan-3010"
    },
   "po111" = {
    interface_id = "po111.3010"
    admin_state  = "up"
    description  = "### XX-01 RC BGP ###"
    mtu          = 9216
    encap = "vlan-3010"
    },
   "po112" = {
    interface_id = "po112.3010"
    admin_state  = "up"
    description  = "### XX-01 RC BGP ###"
    mtu          = 9216
    encap = "vlan-3010"
    },
}
po_sub-int_map-core02 = {

   "po12" = {
    interface_id = "po12.3010"
    admin_state  = "up"
    description  = "### XX-01 CORE01 - CORE02 BGP ###"
    mtu          = 9216
    encap = "vlan-3010"
    },
   "po121" = {
    interface_id = "po121.3010"
    admin_state  = "up"
    description  = "### XX-01 RC BGP ###"
    mtu          = 9216
    encap = "vlan-3010"
    },
   "po122" = {
    interface_id = "po122.3010"
    admin_state  = "up"
    description  = "### XX-01 RC BGP ###"
    mtu          = 9216
    encap = "vlan-3010"
    },
}

### SET PO VRF
po_sub-int-vrf_map-core01 = {

   "po12" = {
    interface_id = "po12.3010"
    vrf_dn       = "sys/inst-xx01_es_core"
    },
   "po111" = {
    interface_id = "po111.3010"
    vrf_dn       = "sys/inst-xx01_es_core"
    },
   "po112" = {
    interface_id = "po112.3010"
    vrf_dn       = "sys/inst-xx01_es_core"
    },
    
}
po_sub-int-vrf_map-core02 = {

   "po12" = {
    interface_id = "po12.3010"
    vrf_dn       = "sys/inst-xx01_es_core"
    },
   "po121" = {
    interface_id = "po121.3010"
    vrf_dn       = "sys/inst-xx01_es_core"
    },
   "po122" = {
    interface_id = "po122.3010"
    vrf_dn       = "sys/inst-xx01_es_core"
    },
    
}

### MAP interfacde to PO
po_member_map-core01 = {

    "po12-1" = {
      interface_id = "po12"
      interface_dn = "sys/intf/phys-[eth1/6]"
      force        = true        
    },
    "po111-1" = {
      interface_id = "po111"
      interface_dn = "sys/intf/phys-[eth1/1]"
      force        = true        
    },
    "po112-1" = {
      interface_id = "po112"
      interface_dn = "sys/intf/phys-[eth1/2]"
      force        = true        
    },    
    
}
po_member_map-core02 = {

    "po12-1" = {
      interface_id = "po12"
      interface_dn = "sys/intf/phys-[eth1/6]"
      force        = true        
    },
    "po121-1" = {
      interface_id = "po121"
      interface_dn = "sys/intf/phys-[eth1/1]"
      force        = true        
    },
    "po122-1" = {
      interface_id = "po122"
      interface_dn = "sys/intf/phys-[eth1/2]"
      force        = true        
    },    
    
}

### ADD IPV4 addresses
ipv4_vrf_map = {
  "xx01_es_core" = {
  name = "xx01_es_core"
  },
  
}

ipv4_int_map-core01 = {

    "lo101" = {
        vrf = "xx01_es_core"
        interface_id = "lo101"
    },
    "po12_3010" = {
        vrf = "xx01_es_core"
        interface_id = "po12.3010"
    },
    "po111_3010" = {
        vrf = "xx01_es_core"
        interface_id = "po111.3010"
    },
    "po112_3010" = {
        vrf = "xx01_es_core"
        interface_id = "po112.3010"
        
}
}
ipv4_int_map-core02 = {

    "lo101" = {
        vrf = "xx01_es_core"
        interface_id = "lo101"
    },
    "po12_3010" = {
        vrf = "xx01_es_core"
        interface_id = "po12.3010"
    },
    "po121_3010" = {
        vrf = "xx01_es_core"
        interface_id = "po121.3010"
    },
    "po122_3010" = {
        vrf = "xx01_es_core"
        interface_id = "po122.3010"
    },
       
}

ipv4_int_address_map-core01 = {
   
    "lo101" = {
        vrf = "xx01_es_core"
        interface_id = "lo101"
        address = "10.66.127.1/32"
    },
    "po12_3010" = {
        vrf = "xx01_es_core"
        interface_id = "po12.3010"
        address = "10.66.125.0/31"
    },
    "po111_3010" = {
        vrf = "xx01_es_core"
        interface_id = "po111.3010"
        address = "10.66.125.2/31"
    },
    "po112_3010" = {
        vrf = "xx01_es_core"
        interface_id = "po112.3010"
        address = "10.66.125.4/31"
    },         
      
}

ipv4_int_address_map-core02 = {
   
    "lo101" = {
        vrf = "xx01_es_core"
        interface_id = "lo101"
        address = "10.66.127.2/32"
    },
    "po12_3010" = {
        vrf = "xx01_es_core"
        interface_id = "po12.3010"
        address = "10.66.125.1/31"
    },
    "po121_3010" = {
        vrf = "xx01_es_core"
        interface_id = "po121.3010"
        address = "10.66.125.6/31"
    },
    "po122_3010" = {
        vrf = "xx01_es_core"
        interface_id = "po122.3010"
        address = "10.66.125.8/31"
    },         
      
}

##### STATIC VARS CAUTION BEFORE CHANGING #####
provider-username = "cisco"
provider-userpass = "cisco"
provider-url-core01 = "https://192.168.1.138"
provider-url-core02 = "https://192.168.1.179"
hostname-core01 = "Dev-Test-CORE01"
hostname-core02 = "Dev-Test-CORE02"
#
