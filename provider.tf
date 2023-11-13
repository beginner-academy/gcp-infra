terraform {
  backend "gcs" {
    bucket = "tf-state-bucket-ba"
    prefix = "dev"
  }
}

provider "google" {
  project = "gke-terraform-397013"
  region  = "europe-west2"
}
