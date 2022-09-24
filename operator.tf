resource "kubernetes_namespace" "istio_operator" {
  count = var.create_istio_operator_namespace ? 1 : 0
  metadata {
    name = var.istio_operator_namespace

    labels = {
      istio-injection = "disabled"
      istio-operator-managed = "Reconcile"
    }
  }
}

resource "k8s_manifest" "operator_crd" {
  content = templatefile("${path.module}/kubernetes/install.istio.io_istiooperators.yaml", {})
}

resource "kubernetes_deployment" "istio_operator" {
  metadata {
    name      = "istio-operator"
    namespace = var.istio_operator_namespace
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        name = "istio-operator"
      }
    }

    template {
      metadata {
        labels = {
          name = "istio-operator"
        }
      }

      spec {
        automount_service_account_token = true

        container {
          name    = "istio-operator"
          image   = "docker.io/istio/operator:${var.istio_version}"
          command = ["operator", "server"]

          env {
            name  = "WATCH_NAMESPACE"
            value = var.istio_namespace
          }

          env {
            name  = "LEADER_ELECTION_NAMESPACE"
            value = var.istio_operator_namespace
          }

          env {
            name = "POD_NAME"
            value_from {
              field_ref {
                field_path = "metadata.name"
              }
            }
          }

          env {
            name  = "OPERATOR_NAME"
            value = "istio"
          }

          resources {
            limits = {
              cpu    = "200m"
              memory = "256Mi"
            }

            requests = {
              cpu    = "50m"
              memory = "128Mi"
            }
          }

          image_pull_policy = "IfNotPresent"
        }

        service_account_name = kubernetes_service_account.istio_operator.metadata.0.name
      }
    }
  }
}

resource "kubernetes_service" "istio_operator" {
  metadata {
    name      = "istio-operator"
    namespace = var.istio_operator_namespace

    labels = {
      name = "istio-operator"
    }
  }

  spec {
    port {
      name        = "http-metrics"
      port        = 8383
      target_port = "8383"
    }

    selector = {
      name = "istio-operator"
    }
  }
}
