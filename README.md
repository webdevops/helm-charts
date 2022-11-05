# webdevops helm-charts

[![license](https://img.shields.io/github/license/webdevops/helm-azure-tpl.svg)](https://github.com/webdevops/helm-azure-tpl/blob/master/LICENSE)
[![Chart Publish](https://github.com/webdevops/helm-charts/actions/workflows/release.yaml/badge.svg)](https://github.com/webdevops/helm-charts/actions/workflows/release.yaml)

> **Note**
> These helm charts are currently in preview and in development. Please report issues and problem.


## usage

```shell
helm repo add webdevops https://webdevops.github.io/helm-charts/
```

or in `Chart.yaml`:
```yaml
apiVersion: v2
name: foobar
description: example chart
# ...
dependencies:
  - name: xxxxx
    version: 1.x.x
    repository: "https://webdevops.github.io/helm-charts/"
```

## charts

| Chart                                                                     | Description                                                                                                                                                                              | Project                                                                                                                                                   |
|---------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| [azure-janitor](./charts/azure-janitor)                                   | Automated removal of Azure resources based on ttl tag                                                                                                                                    | [![](https://img.shields.io/badge/github-webdevops%2Fazure--janitor-blue)](https://github.com/webdevops/azure-janitor)                                    |
| [azure-resourcemanager-exporter](./charts/azure-resourcemanager-exporter) | Prometheus exporter for Azure ResourceManager information                                                                                                                                | [![](https://img.shields.io/badge/github-webdevops%2Fazure--resourcemanager--exporter-blue)](https://github.com/webdevops/azure-resourcemanager-exporter) |
| [azure-scheduledevents-manager](./charts/azure-scheduledevents-manager)   | Manages [Azure ScheduledEvents](https://learn.microsoft.com/en-us/azure/virtual-machines/windows/scheduled-events) (drain nodes) and provides metrics for upcoming Azure ScheduledEvents | [![](https://img.shields.io/badge/github-webdevops%2Fazure--scheduledevents--manager-blue)](https://github.com/webdevops/azure-scheduledevents-manager)   |
| [kube-pool-manager](./charts/kube-pool-manager)                           | Manages Kubernetes pool nodes (adds labels, annotations, ...) based on node spec                                                                                                         | [![](https://img.shields.io/badge/github-webdevops%2Fkube--pool--manager-blue)](https://github.com/webdevops/kube-pool-manager)                           |
| [pagerduty-exporter](./charts/pagerduty-exporter)                         | Prometheus exporter for PagerDuty accounts                                                                                                                                               | [![](https://img.shields.io/badge/github-webdevops%2Fpagerduty--exporter-blue)](https://github.com/webdevops/pagerduty-exporter)                          |

## helm-azure-tpl (injecting Azure KeyVault secrets in helm charts)

To inject Azure KeyVault secrets and other Azure related information try [helm plugin "azure-tpl"](https://github.com/webdevops/helm-azure-tpl).
This plugin (which also can be used as standalone tool) can process helm `values.yaml` files and injects secrets.
