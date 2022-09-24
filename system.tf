resource "kubernetes_namespace" "istio_namespace" {
  count = var.create_istio_namespace ? 1 : 0

  metadata {
    name = var.istio_namespace

    labels = {
      istio-injection        = "disabled"
      istio-operator-managed = "Reconcile"
    }
  }
}

resource "k8s_manifest" "istio_deployment" {
  depends_on = [kubernetes_deployment.istio_operator, k8s_manifest.operator_crd, kubernetes_cluster_role_binding.istio_operator]

  content = templatefile(
  "${path.module}/kubernetes/istio-operator.yaml", {
    namespace: var.istio_namespace,
    ingress_gateway_selector: var.ingress_gateway_selector,
    annotations: var.ingress_gateway_annotations,
    lb_ip: var.ingress_gateway_ip,
    lb_source_ranges: var.ingress_gateway_source_ranges,
  })
}