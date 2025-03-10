terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "3.0.0-pre2"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.90.1"
    }
  }
}

provider "helm" {
  # Configuration options
  kubernetes = {
    config_path = "~/.kube/config"
  }
}
