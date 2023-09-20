terraform {
  required_providers {
    oci = {
      source = "oracle/oci"
    }
  }
}

provider "oci" {
  region              = var.region
  auth                = "SecurityToken"
  config_file_profile = "learn-terraform"
}

# resource "oci_core_vcn" "internal" {
#   dns_label      = "internal"
#   cidr_block     = "172.16.0.0/20"
#   compartment_id = var.compartment_id
#   display_name   = "My internal VCN"
# }

resource "oci_core_subnet" "dev" {
  vcn_id                     = module.vcn.vcn_id
  cidr_block                 = "10.0.0.0/18"
  compartment_id             = oci_identity_compartment.tf-compartment.id
  display_name               = "Dev subnet"
  prohibit_public_ip_on_vnic = true
  dns_label                  = "dev"

}

resource "oci_identity_compartment" "tf-compartment" {
  compartment_id = var.root_compartment_id
  description    = "Compartment for terraform resources"
  name           = "terraform-compartment"
}

resource "oci_core_instance" "ubuntu_instance" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = oci_identity_compartment.tf-compartment.id
  shape               = "VM.Standard2.1"
  source_details {
    source_id   = var.compute_image_ocid
    source_type = "image"
  }

  display_name = "ubuntu_instance"
  create_vnic_details {
    assign_public_ip = false
    subnet_id        = oci_core_subnet.dev.id
  }
  preserve_boot_volume = false
}