module "vcn" {
  source = "oracle-terraform-modules/vcn/oci"
  version = "3.5.4"

  # Required inputs 
  compartment_id = var.compartment_id
  region = var.region
  internet_gateway_route_rules = null
  local_peering_gateways = null 
  nat_gateway_route_rules = null 

  # Optional inputs 
  vcn_name = "vcn-module"
  vcn_dns_label = "vcnmodule"
  vcn_cidrs = ["10.0.0.0/16"]

  create_internet_gateway = true 
  create_nat_gateway = true
  create_service_gateway = true 
}