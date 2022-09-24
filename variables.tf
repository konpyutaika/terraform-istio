variable "istio_namespace" {
  type        = string
  description = "Namespace where istio components will be deployed"
  default     = "istio-system"
}

variable "create_istio_namespace" {
  type        = bool
  description = "Whether or not the targeted namespace for istio components should be deployed"
  default     = true
}

variable "istio_operator_namespace" {
  type        = string
  description = "Namespace where the istio operator will be deployed"
  default     = "istio-operator"
}

variable "create_istio_operator_namespace" {
  type        = bool
  description = "Whether or not the targeted namespace for istio operator should be deployed"
  default     = true
}

variable "ingress_gateway_annotations" {
  type        = map(string)
  description = "Map of annotation for the istio ingress gateway"
  default     = {}
}

variable "ingress_gateway_selector" {
  type        = string
  description = "Istio ingress gateway selector suffix"
  default     = "ingressgateway"
}

variable "ingress_gateway_ip" {
  type        = string
  description = "Ingress gateway IP, if you want to fix it"
  default     = ""
}

variable "ingress_gateway_source_ranges" {
  type        = string
  description = "Ingress gateway allowed source ranges"
  default     = ""
}

variable "istio_version" {
  type        = string
  description = "Version of istio that will be deployed"
  default     = "1.13.4"
}

variable "module_depends_on" {
  type    = any
  default = null
}

variable "grafana_subpath" {
  type        = string
  description = "Subpath for Grafana endpoint, useful if is behind a Virtual Service"
  default     = ""
}

variable "kiali_path" {
  type        = string
  description = "Path for Kiali endpoint, useful if is behind a Virtual Service"
  default     = ""
}

variable "tracing_path" {
  type        = string
  description = "Path for Jaeger endpoint, useful if is behind a Virtual Service"
  default = "/jaeger"
}

variable "prometheus_path" {
  type        = string
  description = "Path for prometheus endpoint, useful if is behind a Virtual Service"
  default     = ""
}