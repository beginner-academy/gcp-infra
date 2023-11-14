provider "google" {
  CREDENTIALS = var.GOOGLE_CREDENTIALS
  project     = var.project_id
  region      = var.region
}
