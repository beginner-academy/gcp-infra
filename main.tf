module "gke-cluster" {
  source             = "./modules/google-gke-cluster/"
  GOOGLE_CREDENTIALS = var.GOOGLE_CREDENTIALS
  region             = var.region
  project_id         = var.project_id
  cluster_name       = var.cluster_name
  cluster_location   = var.cluster_zone
  network            = google_compute_network.vpc.id
  subnetwork         = google_compute_subnetwork.subnet.id
  initial_node_count = var.num_vault_pods
  #  unseal_service_account = module.unseal_kms.service_account
}
#
#module "tls" {
#  source            = "./modules/tls-private"
#  hostname          = "*.vault-internal"
#  organization_name = var.cert_organization_name
#  common_name       = var.cert_common_name
#  country           = var.cert_country
#}
#
#module "acme_cert" {
#  source             = "./modules/acme-cert"
#  project_id         = var.project_id
#  GOOGLE_CREDENTIALS = var.GOOGLE_CREDENTIALS
#    cluster_endpoint   = module.gke-cluster.endpoint
#    cluster_cert       = module.gke-cluster.ca_certificate
#  #  vault_namespace    = module.vault.vault_namespace
#  cert_secret_name = var.cert_secret_name
#  vault_hostname   = var.vault_hostname
#  email_address    = var.public_cert_email_address
#}
#
#module "external_ip_address" {
#  source     = "./modules/google-static-ip"
#  project_id = var.project_id
#  region     = var.region
#}
#
##module "cloud_dns" {
##  source              = "./modules/google-cloud-dns"
##  project_id          = var.project_id
##  cluster_listener_ip = module.external_ip_address.ip_address
##  vault_hostname      = var.vault_hostname
##}
###
#module "vault" {
#  source                    = "./modules/vault"
#  project_id                = var.project_id
#  region                    = var.region
#  vault_version             = var.vault_version
#  unseal_keyring_name       = module.unseal_kms.unseal_keyring_name
#  unseal_key_name           = module.unseal_kms.unseal_key_name
#  unseal_account_name       = module.unseal_kms.service_account
#  num_vault_pods            = var.num_vault_pods
#  cluster_endpoint          = module.gke-cluster.endpoint
#  node_pool                 = module.gke-cluster.node_pool_id
#  cluster_cert              = module.gke-cluster.ca_certificate
#  vault_internal_tls_ca     = module.tls.ca_cert
#  vault_internal_tls_cert   = module.tls.cert
#  vault_internal_tls_key    = module.tls.key
#  loadbalancer_ip           = module.external_ip_address.ip_address
#  vault_tls_k8s_secret      = var.cert_secret_name
#  vault_tls_secret_resource = module.acme_cert.secret_resource
#  vault_hostname            = var.vault_hostname
#}
#
#module "unseal_kms" {
#  source             = "./modules/google-kms"
#  GOOGLE_CREDENTIALS = var.GOOGLE_CREDENTIALS
#  project_id         = var.project_id
#  region             = "global"
#  keyring_name       = module.randomized.friendly_keyring_name
#  key_name           = module.randomized.friendly_key_name
#}
#
#module "randomized" {
#  source = "./modules/randomized"
#}
