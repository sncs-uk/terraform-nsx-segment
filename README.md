# Example Terraform module

Terraform module which is an example.


## Usage
```hcl
module "segment" {
  source                    = "github.com/sncs-uk/terraform-nsx-segment"
  segment_name              = "my-segment"
  segment_description       = "Terraform provisioned Segment"
  edge_cluster_name         = "edge-cluster-1"
  tier0_gateway_name        = "tier-0-1"
  transport_zone_name       = "overlay-zone"
  route_advertisement_types = ["TIER1_STATIC_ROUTES", "TIER1_CONNECTED"]
  subnets                   = ["10.20.30.0/24", "2001:db8::/64"]
  failover_mode             = "PREEMPTIVE"
  enable_firewall           = "true"
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
