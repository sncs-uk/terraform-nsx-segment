# Example Terraform module

Terraform module which is an example.


## Usage
```hcl
module "segment" {
  source                          = "github.com/sncs-uk/terraform-nsx-segment"
  segment_name                    = "my-segment"
  segment_description             = "Terraform provisioned Segment"
  tier0_gateway_name              = "tier-0-1"
  transport_zone_name             = "overlay-zone"
  subnets                         = ["10.20.30.1/24", "2001:db8::1/64"]
  create_tier1_gateway            = true
  tier1_edge_cluster_name         = "edge-cluster-1"
  tier1_route_advertisement_types = ["TIER1_STATIC_ROUTES", "TIER1_CONNECTED"]
  tier1_failover_mode             = "PREEMPTIVE"
  tier1_enable_firewall           = "true"
}
```

## Requirements
| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_nsxt"></a> [nsxt](#requirement\_nsxt) | >= 3.3.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_nsxt"></a> [nsxt](#provider\_nsxt) | >= 3.3.1 |
