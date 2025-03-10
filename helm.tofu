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

resource "helm_release" "kubecost" {
  name             = "kubecost"
  repository       = "https://kubecost.github.io/cost-analyzer/"
  chart            = "cost-analyzer"
  namespace        = "kubecost"
  create_namespace = true

  atomic = true
  wait   = true
}
