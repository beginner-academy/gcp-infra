terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
    tls = {
      source = "hashicorp/tls"
      version = ">= 3.0"
    }
  }
  required_version = ">= 0.14"
}
