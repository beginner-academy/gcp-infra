resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  project  = var.project_id
  location = var.cluster_location

  initial_node_count       = 1
  remove_default_node_pool = true

  network    = var.network
  subnetwork = var.subnetwork

  maintenance_policy {
    daily_maintenance_window {
      start_time = "03:00"
    }
  }

#  enable_binary_authorization = true
}

## GKE cluster
data "google_container_engine_versions" "gke_version" {
  location       = var.region
  version_prefix = "1.27."
}


# Separately Managed Node Pool
resource "google_container_node_pool" "primary_nodes" {
  name     = google_container_cluster.primary.name
  location = var.region
  cluster  = google_container_cluster.primary.name

  version    = data.google_container_engine_versions.gke_version.release_channel_latest_version["STABLE"]
  node_count = var.initial_node_count

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      env = var.project_id
    }

    # preemptible  = true
    machine_type = "n1-standard-1"
    tags         = ["gke-node", "${var.project_id}-gke"]
#    metadata = {
#      disable-legacy-endpoints = "true"
#    }
  }
}

#
#resource "google_container_node_pool" "vault_node_pool" {
#  name       = "vault-node-pool"
#  location   = var.cluster_location
#  cluster    = google_container_cluster.primary.name
#  version    = data.google_container_engine_versions.gke_version.release_channel_latest_version["STABLE"]
#  node_count = var.initial_node_count
#
#  node_config {
#    service_account = var.unseal_service_account
#    machine_type    = var.node_machine_type
#    image_type      = var.node_image_type
#
#    oauth_scopes = [
#      "https://www.googleapis.com/auth/cloudkms",
#      "https://www.googleapis.com/auth/cloud-platform",
#      "https://www.googleapis.com/auth/compute",
#      "https://www.googleapis.com/auth/devstorage.read_only",
#      "https://www.googleapis.com/auth/logging.write",
#      "https://www.googleapis.com/auth/monitoring",
#    ]
#  }
#}
