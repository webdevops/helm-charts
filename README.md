# webdevops helm-charts

[![license](https://img.shields.io/github/license/webdevops/helm-azure-tpl.svg)](https://github.com/webdevops/helm-azure-tpl/blob/master/LICENSE)
[![Chart Publish](https://github.com/webdevops/helm-charts/actions/workflows/release.yaml/badge.svg)](https://github.com/webdevops/helm-charts/actions/workflows/release.yaml)

## usage

```shell
helm repo add webdevops https://webdevops.github.io/helm-charts/
```


## helm-azure-tpl (injecting Azure KeyVault secrets in helm charts)

To inject Azure KeyVault secrets and other Azure related information try [helm plugin "azure-tpl"](https://github.com/webdevops/helm-azure-tpl).
This plugin (which also can be used as standalone tool) can process helm `values.yaml` files and injects secrets.
