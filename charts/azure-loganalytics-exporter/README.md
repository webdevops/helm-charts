# azure-loganalytics-exporter

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 22.9.0](https://img.shields.io/badge/AppVersion-22.9.0-informational?style=flat-square)

A Helm chart for azure-loganalytics-exporter

**Homepage:** <https://github.com/webdevops/azure-loganalytics-exporter>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| mblaschke | <mblaschke82@gmail.com> |  |

## Source Code

* <https://github.com/webdevops/azure-loganalytics-exporter/>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity for pod assignment |
| config.existingConfigMap | string | `""` | Name of existing configmap |
| config.modules | object | `{"":{"cache":0,"enabled":true}}` | Configuration of modules |
| config.queries | object | `{}` | Configuration of queries |
| containerSecurityContext | object | `{"capabilities":{"drop":["ALL"]},"readOnlyRootFilesystem":true,"runAsNonRoot":true}` | Container Security Context |
| env | object | `{"CONFIG":"/config/config.yaml"}` | define env |
| extraEnv | list | `[]` | Array with extra environment variables to add to all the pods |
| extraVolumeMounts | list | `[]` |  |
| extraVolumes | list | `[]` |  |
| fullnameOverride | string | `""` | String to fully override azure-loganalytics-exporter.fullname template |
| imagePullSecrets | list | `[]` | registry secret names as an array |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"docker.io"` | image registry |
| image.repository | string | `"webdevops/azure-loganalytics-exporter"` | image repository |
| image.tag | string | `.Chart.AppVersion` | image tag (immutable tags are recommended). |
| livenessProbe | object | `{"httpGet":{"path":"/healthz","port":"http"}}` | livenessProbe |
| minReadySeconds | int | `10` |  |
| nameOverride | string | `""` | String to partially override azure-loganalytics-exporter.fullname template (will maintain the release name) |
| namespaceOverride | string | `""` | Allow to override the release namespace |
| netpol.egress | list | `[{"ports":[{"port":53,"protocol":"TCP"}]},{"ports":[{"port":53,"protocol":"UDP"}]},{"ports":[{"port":443,"protocol":"TCP"}]}]` | Define network policy egress |
| netpol.enabled | bool | `true` | Enable network policy |
| netpol.ingress | list | `[]` | Define network policy ingress |
| netpol.policyTypes | list | `["Ingress","Egress"]` | Define network policy types |
| nodeSelector | object | `{"kubernetes.io/os":"linux"}` | Node labels for pod assignment. |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| priorityClassName | string | `""` |  |
| prometheus.monitor.basicAuth | object | `{}` |  |
| prometheus.monitor.bearerTokenFile | string | `nil` |  |
| prometheus.monitor.enabled | bool | `false` |  |
| prometheus.monitor.interval | string | `""` |  |
| prometheus.monitor.jobLabel | string | `""` |  |
| prometheus.monitor.labelLimit | int | `0` |  |
| prometheus.monitor.labelNameLengthLimit | int | `0` |  |
| prometheus.monitor.labelValueLengthLimit | int | `0` |  |
| prometheus.monitor.metricRelabelings | list | `[]` |  |
| prometheus.monitor.proxyUrl | string | `""` |  |
| prometheus.monitor.relabelings | list | `[]` |  |
| prometheus.monitor.sampleLimit | int | `0` |  |
| prometheus.monitor.scheme | string | `"http"` |  |
| prometheus.monitor.scrapeTimeout | string | `""` |  |
| prometheus.monitor.targetLimit | int | `0` |  |
| prometheus.monitor.tlsConfig | object | `{}` |  |
| readinessProbe | object | `{"httpGet":{"path":"/readyz","port":"http"}}` | readinessProbe |
| replicas | int | `1` | Number of amazon-eks-pod-identity-webhook replicas to deploy |
| resources.limits | object | `{"memory":"200Mi"}` | The resources limits for the container |
| resources.requests | object | `{"cpu":"100m","memory":"200Mi"}` | The resources requests for the container |
| restartPolicy | string | `"Always"` |  |
| secrets | object | `{}` |  |
| secretsEnableTemplateFunctions | bool | `false` | Render all secrets values though helm tpl function |
| securityContext | object | `{"fsGroup":1000,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000,"seccompProfile":{"type":"RuntimeDefault"},"supplementalGroups":[1000]}` | Pod Security Context |
| service.annotations | object | `{}` |  |
| service.appProtocol | string | `"http"` |  |
| service.labels | object | `{}` |  |
| service.nodePort | string | `nil` |  |
| service.port | int | `8080` |  |
| service.portName | string | `"http-metrics"` |  |
| service.targetPort | int | `8080` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automountServiceAccountToken | bool | `false` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.labels | object | `{}` |  |
| serviceAccount.name | string | `""` |  |
| startupProbe | object | `{}` | startupProbe |
| strategy | object | `{}` | Customize the strategy if set |
| terminationGracePeriodSeconds | int | `60` |  |
| tolerations | list | `[]` | Tolerations for pod assignment. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
