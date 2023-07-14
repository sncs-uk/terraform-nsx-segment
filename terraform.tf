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
  display_name = var.tier1_edge_cluster_name
}

data "nsxt_policy_transport_zone" "tz" {
  display_name = var.transport_zone_name
}

resource "nsxt_policy_tier1_gateway" "tier1_gw" {
  count                     = var.create_tier1_gateway ? 1 : 0
  description               = "${var.segment_name} router"
  display_name              = "${var.segment_name}-gw1"
  edge_cluster_path         = data.nsxt_policy_edge_cluster.EC.path
  failover_mode             = var.tier1_failover_mode
  default_rule_logging      = "false"
  enable_firewall           = var.tier1_enable_firewall
  enable_standby_relocation = "false"
  tier0_path                = data.nsxt_policy_tier0_gateway.T0.path
  route_advertisement_types = var.tier1_route_advertisement_types
  pool_allocation           = "ROUTING"
}

resource "nsxt_policy_segment" "segment" {
  display_name        = var.segment_name
  description         = var.segment_description
  connectivity_path   = var.create_tier1_gateway ? nsxt_policy_tier1_gateway.tier1_gw[0].path : data.nsxt_policy_tier0_gateway.T0.path
  transport_zone_path = data.nsxt_policy_transport_zone.tz.path

  dynamic "subnet" {
    for_each = var.subnets
    content {
      cidr = subnet.value
    }
  }
}
