terraform {
  backend "gcs" {
    bucket = "tf-state-bucket-ba"
    prefix = "dev"
  }
}

provider "google" {
  project = var.project
  region  = var.region
}
