variable "segment_name" {
  type        = string
  description = "The display name for the segment."
}
variable "segment_description" {
  type        = string
  description = "A description of the segment."
  default     = ""
}
variable "edge_cluster_name" {
  type        = string
  description = "Name of the edge cluster on which to place the tier 1 router"
}
variable "tier0_gateway_name" {
  type        = string
  description = "The name of the tier 0 gateway to which to connect the tier 1 gateway."
}
variable "transport_zone_name" {
  type        = string
  description = "Name of the transport zone in which to create the segment."
}
variable "route_advertisement_types" {
  type        = list(string)
  description = "Enable different types of route advertisements: TIER1_STATIC_ROUTES, TIER1_CONNECTED, TIER1_NAT, TIER1_LB_VIP, TIER1_LB_SNAT, TIER1_DNS_FORWARDER_IP, TIER1_IPSEC_LOCAL_ENDPOINT."
  default     = ["TIER1_STATIC_ROUTES", "TIER1_CONNECTED"]
}
variable "subnets" {
  type        = list(string)
  description = "List of subnets to assign to the segment in CIDR format."
}
variable "failover_mode" {
  type        = string
  description = "Failover mode of the tier 1 gateway."
  default     = "PREEMPTIVE"
}
variable "enable_firewall" {
  type        = string
  description = "Whether to enable the firewall on the tier 1 gateway."
  default     = "false"
}
