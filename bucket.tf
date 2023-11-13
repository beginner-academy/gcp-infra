resource "google_storage_bucket" "raw" {
  project                     = var.project
  name                        = "sangam-raw111111111"
  force_destroy               = false
  uniform_bucket_level_access = true
  location                    = var.region
  labels                      = local.labels
}

locals {
  labels = {
    "data-project" = "sangam-raw111111111"
  }
}