resource "google_storage_bucket" "raw" {
  project                     = var.project
  name                        = "${var.data-project}-raw"
  force_destroy               = false
  uniform_bucket_level_access = true
  location                    = var.region
  labels                      = local.labels
}

locals {
  labels = {
    "data-project" = var.data-project
  }
}

variable "project" {
  type        = string
  description = "ID Google project"
  default = "gke-terraform-397013"
}

variable "region" {
  type        = string
  description = "Region Google project"
  default = "europe-west2"
}

variable "data-project" {
  type        = string
  description = "Name of data pipeline project to use as resource prefix"
  default = "ba"
}
