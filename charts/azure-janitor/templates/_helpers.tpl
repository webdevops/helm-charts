{{/* vim: set filetype=mustache: */}}
{{/* Expand the name of the chart. */}}
{{- define "azure-janitor.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 50 | trimSuffix "-" -}}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "azure-janitor.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 26 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 26 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "azure-janitor.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}


{{/*
Allow the release namespace to be overridden for multi-namespace deployments in combined charts
*/}}
{{- define "azure-janitor.namespace" -}}
  {{- if .Values.namespaceOverride -}}
    {{- .Values.namespaceOverride -}}
  {{- else -}}
    {{- .Release.Namespace -}}
  {{- end -}}
{{- end -}}

{{/* Generate basic labels */}}
{{- define "azure-janitor.labels" }}
helm.sh/chart: {{ template "azure-janitor.chart" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/component: metrics
app.kubernetes.io/part-of: {{ template "azure-janitor.name" . }}
{{- include "azure-janitor.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
{{- if .Values.podLabels}}
{{ toYaml .Values.podLabels }}
{{- end }}
{{- if .Values.releaseLabel }}
release: {{ .Release.Name }}
{{- end }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "azure-janitor.selectorLabels" }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/name: {{ template "azure-janitor.name" . }}
{{- end }}

{{/*
The image to use
*/}}
{{- define "azure-janitor.image" -}}
{{- if .Values.image.sha -}}
{{- printf "%s/%s:%s@%s" .Values.image.registry .Values.image.repository (default (printf "%s" .Chart.AppVersion) .Values.image.tag) .Values.image.sha }}
{{- else -}}
{{- printf "%s/%s:%s" .Values.image.registry .Values.image.repository (default (printf "%s" .Chart.AppVersion) .Values.image.tag) }}
{{- end }}
{{- end }}


{{/*
Create the name of the service account to use
*/}}
{{- define "azure-janitor.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "azure-janitor.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/* Sets default scrape limits for servicemonitor */}}
{{- define "servicemonitor.scrapeLimits" -}}
{{- if .sampleLimit }}
sampleLimit: {{ .sampleLimit }}
{{- end }}
{{- if .targetLimit }}
targetLimit: {{ .targetLimit }}
{{- end }}
{{- if .labelLimit }}
labelLimit: {{ .labelLimit }}
{{- end }}
{{- if .labelNameLengthLimit }}
labelNameLengthLimit: {{ .labelNameLengthLimit }}
{{- end }}
{{- if .labelValueLengthLimit }}
labelValueLengthLimit: {{ .labelValueLengthLimit }}
{{- end }}
{{- end }}
