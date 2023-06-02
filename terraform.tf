terraform {
  required_providers {
    nsxt = {
      source  = "vmware/nsxt"
      version = ">= 3.3.1"
    }
  }
}

data "nsxt_policy_tier0_gateway" "T0" {
  display_name = var.tier0_gateway_name
}

data "nsxt_policy_edge_cluster" "EC" {
  display_name = var.edge_cluster_name
}

data "nsxt_policy_transport_zone" "tz" {
  display_name = var.transport_zone_name
}

resource "nsxt_policy_tier1_gateway" "tier1_gw" {
  description               = "${var.segment_name} router"
  display_name              = "${var.segment_name}-gw1"
  edge_cluster_path         = data.nsxt_policy_edge_cluster.EC.path
  failover_mode             = var.failover_mode
  default_rule_logging      = "false"
  enable_firewall           = var.enable_firewall
  enable_standby_relocation = "false"
  tier0_path                = data.nsxt_policy_tier0_gateway.T0.path
  route_advertisement_types = var.route_advertisement_types
  pool_allocation           = "ROUTING"
}

resource "nsxt_policy_segment" "segment" {
  display_name        = var.segment_name
  description         = var.segment_description
  connectivity_path   = nsxt_policy_tier1_gateway.tier1_gw.path
  transport_zone_path = data.nsxt_policy_transport_zone.tz.path

  dynamic "subnet" {
    for_each = var.subnets
    content {
      cidr = subnet.value
    }
  }
}
