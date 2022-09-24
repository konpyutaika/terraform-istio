locals {
  grafana_cm_manifests = split("\n---\n",
  templatefile(
  "${path.module}/kubernetes/addons/grafana-configmap.yaml", {
    root_url: "%{ if var.grafana_subpath != "" }root_url = %(protocol)s://%(domain)s:%(http_port)s${var.grafana_subpath}%{ endif }",
    serve_from_sub_path: "%{ if var.grafana_subpath != "" }serve_from_sub_path = true%{ endif }",
  }))

  grafana_manifests = split("\n---\n", file("${path.module}/kubernetes/addons/grafana.yaml"))
  jaeger_manifests = split("\n---\n", templatefile("${path.module}/kubernetes/addons/jaeger.yaml", {
    tracing_path:    var.tracing_path,
  }))
  prometheus_manifests = split("\n---\n", templatefile("${path.module}/kubernetes/addons/prometheus.yaml", {
    istio_namespace: var.istio_namespace,
    prometheus_path: var.prometheus_path,
  }))

  kiali_manifests = split("\n---\n", templatefile("${path.module}/kubernetes/addons/kiali.yaml", {
    istio_namespace: var.istio_namespace,
    grafana_path:    var.grafana_subpath,
    kiali_path:      var.kiali_path,
    prometheus_path: var.prometheus_path,
    tracing_path:    var.tracing_path,
  }
  ))
  kiali_crds_manifests = split("\n---\n", file("${path.module}/kubernetes/addons/kiali-crds.yaml"))
}

resource "k8s_manifest" "prometheus-addon" {
  count      = length(local.prometheus_manifests)
  content    = local.prometheus_manifests[count.index]
}

resource "k8s_manifest" "jaeger-addon" {
  count      = length(local.jaeger_manifests)
  content    = local.jaeger_manifests[count.index]
  depends_on = [k8s_manifest.prometheus-addon]
}

resource "k8s_manifest" "grafana-cm-addon" {
  count      = length(local.grafana_cm_manifests)
  content    = local.grafana_cm_manifests[count.index]
  depends_on = [k8s_manifest.jaeger-addon]
}

resource "k8s_manifest" "grafana-addon" {
  count      = length(local.grafana_manifests)
  content    = local.grafana_manifests[count.index]
    depends_on = [k8s_manifest.grafana-cm-addon]
}

resource "k8s_manifest" "kiali-crds-addon" {
  count      = length(local.kiali_crds_manifests)
  content    = local.kiali_crds_manifests[count.index]
  depends_on = [k8s_manifest.grafana-addon]
}

resource "k8s_manifest" "kiali-addon" {
  count      = length(local.kiali_manifests)
  content    = local.kiali_manifests[count.index]
  depends_on = [k8s_manifest.kiali-crds-addon]
}