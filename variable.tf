
variable "project" {
  type        = string
  description = "ID Google project"
  #  default     = "gke-terraform-397013"
}

variable "region" {
  type        = string
  description = "Region Google project"
  #  default     = "europe-west2"
}

variable "data-project" {
  type        = string
  description = "Name of data pipeline project to use as resource prefix"
  default     = "ba"
}
