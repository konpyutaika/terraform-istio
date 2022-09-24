resource "kubernetes_cluster_role" "istio_operator" {
  metadata {
    name = "istio-operator"
  }

  rule {
    verbs      = ["*"]
    api_groups = ["authentication.istio.io"]
    resources  = ["*"]
  }

  rule {
    verbs      = ["*"]
    api_groups = ["config.istio.io"]
    resources  = ["*"]
  }

  rule {
    verbs      = ["*"]
    api_groups = ["install.istio.io"]
    resources  = ["*"]
  }

  rule {
    verbs      = ["*"]
    api_groups = ["networking.istio.io"]
    resources  = ["*"]
  }

  rule {
    verbs      = ["*"]
    api_groups = ["rbac.istio.io"]
    resources  = ["*"]
  }

  rule {
    verbs      = ["*"]
    api_groups = ["security.istio.io"]
    resources  = ["*"]
  }

  rule {
    verbs      = ["*"]
    api_groups = ["admissionregistration.k8s.io"]
    resources  = ["mutatingwebhookconfigurations", "validatingwebhookconfigurations"]
  }

  rule {
    verbs      = ["*"]
    api_groups = ["apiextensions.k8s.io"]
    resources  = ["customresourcedefinitions.apiextensions.k8s.io", "customresourcedefinitions"]
  }

  rule {
    verbs      = ["*"]
    api_groups = ["apps", "extensions"]
    resources  = ["daemonsets", "deployments", "deployments/finalizers", "ingresses", "replicasets", "statefulsets"]
  }

  rule {
    verbs      = ["*"]
    api_groups = ["autoscaling"]
    resources  = ["horizontalpodautoscalers"]
  }

  rule {
    verbs      = ["get", "create"]
    api_groups = ["monitoring.coreos.com"]
    resources  = ["servicemonitors"]
  }

  rule {
    verbs      = ["*"]
    api_groups = ["policy"]
    resources  = ["poddisruptionbudgets"]
  }

  rule {
    verbs      = ["*"]
    api_groups = ["rbac.authorization.k8s.io"]
    resources  = ["clusterrolebindings", "clusterroles", "roles", "rolebindings"]
  }

  rule {
    verbs      = ["*"]
    api_groups = [""]
    resources  = ["configmaps", "endpoints", "events", "namespaces", "pods", "persistentvolumeclaims", "secrets", "services", "serviceaccounts"]
  }

  rule {
    verbs      = ["*"]
    api_groups = ["coordination.k8s.io"]
    resources  = ["leases"]
  }
}

resource "kubernetes_cluster_role_binding" "istio_operator" {
  metadata {
    name = "istio-operator"
  }

  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.istio_operator.metadata.0.name
    namespace = var.istio_operator_namespace
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = kubernetes_cluster_role.istio_operator.metadata.0.name
  }
}

resource "kubernetes_service_account" "istio_operator" {
  metadata {
    name      = "istio-operator"
    namespace = var.istio_operator_namespace
  }
}