output "vcn_state" {
  description = "The state of the VCN"
  value       = oci_core_vcn.internal.state
}

output "vcn_cidr" {
  description = "CIDR block of the core VCN"
  value       = oci_core_vcn.internal.cidr_block

}

output "compartment_name" {
  value = oci_identity_compartment.tf-compartment.name
}

output "compartment_OCID" {
  value = oci_identity_compartment.tf-compartment.id
}

# Output the "list" of all availability domains.
output "all-availabilty-domains-in-tenancy" {
  value = data.oci_identity_availability_domains.ads.availability_domains
}