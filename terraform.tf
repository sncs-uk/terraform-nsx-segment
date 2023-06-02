terraform {
  required_providers {
    nsxt = {
      source  = "vmware/nsxt"
      version = ">= 3.3.1"
    }
  }
}

resource "nsxt_policy_tier1_gateway" "tier1_gw" {
  description               = "${var.segment_name} router"
  display_name              = "${var.segment_name}-gw1"
  edge_cluster_path         = var.edge_cluster_path
  failover_mode             = var.failover_mode
  default_rule_logging      = "false"
  enable_firewall           = var.enable_firewall
  enable_standby_relocation = "false"
  tier0_path                = var.tier0_path
  route_advertisement_types = var.route_advertisement_types
  pool_allocation           = "ROUTING"
}

resource "nsxt_policy_segment" "segment" {
  display_name        = var.segment_name
  description         = var.segment_description
  connectivity_path   = nsxt_policy_tier1_gateway.tier1_gw.path
  transport_zone_path = var.transport_zone_path

  dynamic "subnet" {
    for_each = var.subnets
    content {
      cidr = subnet.value
    }
  }
}
