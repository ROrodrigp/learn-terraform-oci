variable "compartment_id" {
  description = "OCID from your tenancy page"
  type        = string
}

variable "region" {
  description = "region where you have OCI tenancy"
  type        = string
  default     = "us-sanjose-1"
}

variable "root_compartment_id" {
  description = "OCID from the root compartment in your tenancy"
  type        = string
}

variable "compute_image_ocid" {
  description = "OCID from the Ubuntu compute instance"
  type        = string
}