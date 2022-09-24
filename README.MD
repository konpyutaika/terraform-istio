<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_k8s"></a> [k8s](#requirement\_k8s) | 0.9.1 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.11.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_k8s"></a> [k8s](#provider\_k8s) | 0.9.1 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.11.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [k8s_manifest.grafana-addon](https://registry.terraform.io/providers/banzaicloud/k8s/0.9.1/docs/resources/manifest) | resource |
| [k8s_manifest.grafana-cm-addon](https://registry.terraform.io/providers/banzaicloud/k8s/0.9.1/docs/resources/manifest) | resource |
| [k8s_manifest.istio_deployment](https://registry.terraform.io/providers/banzaicloud/k8s/0.9.1/docs/resources/manifest) | resource |
| [k8s_manifest.jaeger-addon](https://registry.terraform.io/providers/banzaicloud/k8s/0.9.1/docs/resources/manifest) | resource |
| [k8s_manifest.kiali-addon](https://registry.terraform.io/providers/banzaicloud/k8s/0.9.1/docs/resources/manifest) | resource |
| [k8s_manifest.kiali-crds-addon](https://registry.terraform.io/providers/banzaicloud/k8s/0.9.1/docs/resources/manifest) | resource |
| [k8s_manifest.operator_crd](https://registry.terraform.io/providers/banzaicloud/k8s/0.9.1/docs/resources/manifest) | resource |
| [k8s_manifest.prometheus-addon](https://registry.terraform.io/providers/banzaicloud/k8s/0.9.1/docs/resources/manifest) | resource |
| [kubernetes_cluster_role.istio_operator](https://registry.terraform.io/providers/hashicorp/kubernetes/2.11.0/docs/resources/cluster_role) | resource |
| [kubernetes_cluster_role_binding.istio_operator](https://registry.terraform.io/providers/hashicorp/kubernetes/2.11.0/docs/resources/cluster_role_binding) | resource |
| [kubernetes_deployment.istio_operator](https://registry.terraform.io/providers/hashicorp/kubernetes/2.11.0/docs/resources/deployment) | resource |
| [kubernetes_namespace.istio_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/2.11.0/docs/resources/namespace) | resource |
| [kubernetes_namespace.istio_operator](https://registry.terraform.io/providers/hashicorp/kubernetes/2.11.0/docs/resources/namespace) | resource |
| [kubernetes_service.istio_operator](https://registry.terraform.io/providers/hashicorp/kubernetes/2.11.0/docs/resources/service) | resource |
| [kubernetes_service_account.istio_operator](https://registry.terraform.io/providers/hashicorp/kubernetes/2.11.0/docs/resources/service_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_istio_namespace"></a> [create\_istio\_namespace](#input\_create\_istio\_namespace) | Whether or not the targeted namespace for istio components should be deployed | `bool` | `true` | no |
| <a name="input_create_istio_operator_namespace"></a> [create\_istio\_operator\_namespace](#input\_create\_istio\_operator\_namespace) | Whether or not the targeted namespace for istio operator should be deployed | `bool` | `true` | no |
| <a name="input_grafana_subpath"></a> [grafana\_subpath](#input\_grafana\_subpath) | Subpath for Grafana endpoint, useful if is behind a Virtual Service | `string` | `""` | no |
| <a name="input_ingress_gateway_annotations"></a> [ingress\_gateway\_annotations](#input\_ingress\_gateway\_annotations) | Map of annotation for the istio ingress gateway | `map(string)` | `{}` | no |
| <a name="input_ingress_gateway_ip"></a> [ingress\_gateway\_ip](#input\_ingress\_gateway\_ip) | Ingress gateway IP, if you want to fix it | `string` | `""` | no |
| <a name="input_ingress_gateway_selector"></a> [ingress\_gateway\_selector](#input\_ingress\_gateway\_selector) | Istio ingress gateway selector suffix | `string` | `"ingressgateway"` | no |
| <a name="input_ingress_gateway_source_ranges"></a> [ingress\_gateway\_source\_ranges](#input\_ingress\_gateway\_source\_ranges) | Ingress gateway allowed source ranges | `string` | `""` | no |
| <a name="input_istio_namespace"></a> [istio\_namespace](#input\_istio\_namespace) | Namespace where istio components will be deployed | `string` | `"istio-system"` | no |
| <a name="input_istio_operator_namespace"></a> [istio\_operator\_namespace](#input\_istio\_operator\_namespace) | Namespace where the istio operator will be deployed | `string` | `"istio-operator"` | no |
| <a name="input_istio_version"></a> [istio\_version](#input\_istio\_version) | Version of istio that will be deployed | `string` | `"1.13.4"` | no |
| <a name="input_kiali_path"></a> [kiali\_path](#input\_kiali\_path) | Path for Kiali endpoint, useful if is behind a Virtual Service | `string` | `""` | no |
| <a name="input_module_depends_on"></a> [module\_depends\_on](#input\_module\_depends\_on) | n/a | `any` | `null` | no |
| <a name="input_prometheus_path"></a> [prometheus\_path](#input\_prometheus\_path) | Path for prometheus endpoint, useful if is behind a Virtual Service | `string` | `""` | no |
| <a name="input_tracing_path"></a> [tracing\_path](#input\_tracing\_path) | Path for Jaeger endpoint, useful if is behind a Virtual Service | `string` | `"/jaeger"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_wait_for_provisioned"></a> [wait\_for\_provisioned](#output\_wait\_for\_provisioned) | n/a |
<!-- END_TF_DOCS -->