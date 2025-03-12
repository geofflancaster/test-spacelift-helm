variable "cluster_name" {
    type = string
    description = "Name of the EKS cluster"
}

variable "customer_dns" {
    type = string
}

variable "env" {
  type = string
}

variable "httpbin_pod_count" {
  type = number
  default = 1
}