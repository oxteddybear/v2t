terraform {
  required_providers {
    nsxt = {
      source = "vmware/nsxt"
    }
  }
}

provider "nsxt" {
  host                  = "192.168.254.61"
  username              = "admin"
  password              = "VMware1!VMware1!"
  allow_unverified_ssl  = true
  max_retries           = 10
  retry_min_delay       = 500
  retry_max_delay       = 5000
  retry_on_status_codes = [429]
}

data "nsxt_policy_tier0_gateway" "t0_red" {
  display_name = "t0_red"
}

data "nsxt_policy_edge_cluster" "edge-cluster01" {
  display_name = "edge-cluster01"
}

data "nsxt_policy_transport_zone" "nsx-overlay-transportzone" {
  display_name = "nsx-overlay-transportzone"
}
data "nsxt_policy_edge_node" "edge01a" {
  edge_cluster_path = data.nsxt_policy_edge_cluster.edge-cluster01.path
  member_index      = 0
}

data "nsxt_policy_edge_node" "edge02a" {
  edge_cluster_path = data.nsxt_policy_edge_cluster.edge-cluster01.path
  member_index      = 1
}
resource "nsxt_policy_tier0_gateway" "parent-t0" {
  description              = "Tier-0 provisioned by Terraform"
  display_name             = "Tier0-gw1"
  failover_mode            = "PREEMPTIVE"
  default_rule_logging     = false
  enable_firewall          = false
  force_whitelisting       = false
  # ha_mode                  = "ACTIVE_STANDBY"
  ha_mode                  = "ACTIVE_ACTIVE"
  edge_cluster_path        = data.nsxt_policy_edge_cluster.edge-cluster01.path

  bgp_config {
    local_as_num    = "65000"
    multipath_relax = false

  }

resource "nsxt_policy_tier0_gateway" "vrf-blue" {
  description              = "Tier-0 VRF provisioned by Terraform"
  display_name             = "Tier0-vrf"
  failover_mode            = "PREEMPTIVE"
  default_rule_logging     = false
  enable_firewall          = false
  ha_mode                  = "ACTIVE_ACTIVE"
  edge_cluster_path        = data.nsxt_policy_edge_cluster.cluster01.path

  # bgp_config {
  #   ecmp = true

  #   route_aggregation {
  #     prefix = "12.10.10.0/24"
  #   }
  # }

  vrf_config {
    # gateway_path        = data.nsxt_policy_tier0_gateway.parent-t0.path
    gateway_path        = nsxt_policy_tier0_gateway.parent-t0.path

  }
}



}
# resource "nsxt_policy_segment" "seg-uplink36" {
#   count=250
#   display_name        = "seg-uplink36${count.index}"
#   description         = "Terraform provisioned Segment"
#   transport_zone_path = data.nsxt_policy_transport_zone.nsx-overlay-transportzone.path
# }
# resource "nsxt_policy_tier0_gateway_interface" "red_vrf_uplink1" {
#   count=250
#   display_name   = "seg-uplink36${count.index}"
#   type           = "EXTERNAL"
#   edge_node_path = data.nsxt_policy_edge_node.edge01a.path
#   gateway_path   = data.nsxt_policy_tier0_gateway.t0_red.path
#   segment_path   = nsxt_policy_segment.seg-uplink36[count.index].path
#   # access_vlan_id = 112
#   subnets        = ["192.168.${count.index}.1/31"]
#   mtu            = 1500

#   # depends_on = [nsxt_policy_tier0_gateway_interface.parent_uplink1]
# }
# resource "nsxt_policy_tier0_gateway_interface" "red_vrf_uplink2" {
#   count=250
#   display_name   = "seg-uplink36${count.index}"
#   type           = "EXTERNAL"
#   edge_node_path = data.nsxt_policy_edge_node.edge02a.path
#   gateway_path   = data.nsxt_policy_tier0_gateway.t0_red.path
#   segment_path   = nsxt_policy_segment.seg-uplink36[count.index].path
#   # access_vlan_id = 112
#   subnets        = ["192.168.${count.index}.3/31"]
#   mtu            = 1500

#   # depends_on = [nsxt_policy_tier0_gateway_interface.parent_uplink1]
# }