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

# The "name" of the availability domain to be used for the compute instance.
output "name-of-first-availability-domain" {
  value = data.oci_identity_availability_domains.ads.availability_domains[0].name
}

# Outputs for compute instance
output "public-ip-for-compute-instance" {
  value = oci_core_instance.ubuntu_instance.public_ip
}
output "instance-name" {
  value = oci_core_instance.ubuntu_instance.display_name
}

output "instance-OCID" {
  value = oci_core_instance.ubuntu_instance.id
}

output "instance-region" {
  value = oci_core_instance.ubuntu_instance.region
}

output "instance-shape" {
  value = oci_core_instance.ubuntu_instance.shape
}

output "instance-state" {
  value = oci_core_instance.ubuntu_instance.state
}

output "instance-OCPUs" {
  value = oci_core_instance.ubuntu_instance.shape_config[0].ocpus
}

output "instance-memory-in-GBs" {
  value = oci_core_instance.ubuntu_instance.shape_config[0].memory_in_gbs
}

output "time-created" {
  value = oci_core_instance.ubuntu_instance.time_created
}