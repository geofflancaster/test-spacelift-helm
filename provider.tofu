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
  kubernetes = {
    host = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
    exec = {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", var.cluster_name]
      command     = "aws"
    }
  }
}
