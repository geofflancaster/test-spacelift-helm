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

variable "nginx_pod_count" {
  type = number
  default = 1
}

variable "nginx_log_level" {
    type = string
    default = "info"
}