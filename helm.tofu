resource "helm_release" "argo_workflows" {
  name             = "argo-workflows"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-workflows"
  create_namespace = true
  namespace        = "argocd"

  set = [
    {
      name  = "crds.install"
      value = true
    },
    {
      name  = "crds.keep"
      value = false
    }
  ]

  atomic = true
  wait   = true
}

resource "helm_release" "opencost" {
  name             = "opencost"
  repository       = "https://opencost.github.io/opencost-helm-chart"
  chart            = "opencost"
  namespace        = "opencost"
  create_namespace = true

  atomic = true
  wait   = true
}

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

resource "helm_release" "httpbin" {
  name             = "httpbin"
  repository       = "https://estahn.github.io/charts"
  chart            = "httpbingo"
  namespace        = "httpbin"
  create_namespace = true

  atomic = true
  wait   = true

  set = [
    {
      name  = "replicaCount"
      value = var.httpbin_pod_count
    }
  ]
}