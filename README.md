# Example Terraform module

Terraform module which is an example.


## Usage
```hcl
module "segment" {
  source                    = "github.com/sncs-uk/terraform-nsx-segment"
  segment_name              = "my-segment"
  segment_description       = "Terraform provisioned Segment"
  edge_cluster_path         = data.nsxt_policy_edge_cluster.EC.path
  tier0_path                = data.nsxt_policy_tier0_gateway.T0.path
  route_advertisement_types = ["TIER1_STATIC_ROUTES", "TIER1_CONNECTED"]
  transport_zone_path       = data.nsxt_policy_transport_zone.tz.path
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
