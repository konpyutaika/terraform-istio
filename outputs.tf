output "wait_for_provisioned" {
  value = [kubernetes_deployment.istio_operator,k8s_manifest.operator_crd, k8s_manifest.istio_deployment]
}