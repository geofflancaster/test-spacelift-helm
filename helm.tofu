# resource "helm_release" "argo_workflows" {
#   name             = "argo-workflows"
#   repository       = "https://argoproj.github.io/argo-helm"
#   chart            = "argo-workflows"
#   create_namespace = true
#   namespace        = "argocd"

#   set = [
#     {
#       name  = "crds.install"
#       value = true
#     },
#     {
#       name  = "crds.keep"
#       value = false
#     }
#   ]

#   atomic = true
#   wait   = true
# }

# resource "helm_release" "opencost" {
#   name             = "opencost"
#   repository       = "https://opencost.github.io/opencost-helm-chart"
#   chart            = "opencost"
#   namespace        = "opencost"
#   create_namespace = true

#   atomic = true
#   wait   = true
# }

# resource "helm_release" "pingdirectory" {
#   name             = "pingdirectory"
#   repository       = "oci://705370621539.dkr.ecr.us-west-2.amazonaws.com/dev"
#   chart            = "p1as-pingdirectory"
#   version          = "v95.0-pdo-8900"
#   namespace        = "geoff-test"
#   create_namespace = true

#   atomic = true
#   wait   = true

#   set = [
#     {
#       name  = "global.dnsZone"
#       value = var.customer_dns
#     },
#     {
#       name = "global.env"
#       value = var.env
#     },
#     {
#       name = "global.secrets.ping-cloud.sshIdKeyBase64"
#       value = base64encode("dummy-secret")
#     }
#   ]
# }

resource "helm_release" "nginx" {
  name             = "nginx"
  repository       = "oci://registry-1.docker.io/bitnamicharts"
  chart            = "nginx"
  namespace        = "geoff-test"
  version          = "19.0.2"
  create_namespace = true

  atomic = true
  wait   = true

  set = [
    {
      name  = "replicaCount"
      value = var.nginx_pod_count
      }, {
      name  = "cloneStaticSiteFromGit.enabled"
      value = true
      }, {
      name  = "cloneStaticSiteFromGit.repository"
      value = "https://github.com/mdn/beginner-html-site-styled.git"
      }, {
      name  = "cloneStaticSiteFromGit.branch"
      value = "master"
      }, 
      {
      name  = "extraEnvVars"
      value = <<EOT
- name: LOG_LEVEL
  value: ${var.nginx_log_level}
        EOT
    }
  ]
}
