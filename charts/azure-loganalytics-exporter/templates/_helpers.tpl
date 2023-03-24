{{/* vim: set filetype=mustache: */}}
{{/* Expand the name of the chart. */}}
{{- define "azure-loganalytics-exporter.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 50 | trimSuffix "-" -}}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "azure-loganalytics-exporter.fullname" -}}
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
{{- define "azure-loganalytics-exporter.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Allow the release namespace to be overridden for multi-namespace deployments in combined charts
*/}}
{{- define "azure-loganalytics-exporter.namespace" -}}
  {{- if .Values.namespaceOverride -}}
    {{- .Values.namespaceOverride -}}
  {{- else -}}
    {{- .Release.Namespace -}}
  {{- end -}}
{{- end -}}

{{/* Generate basic labels */}}
{{- define "azure-loganalytics-exporter.labels" }}
helm.sh/chart: {{ template "azure-loganalytics-exporter.chart" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/component: metrics
app.kubernetes.io/part-of: {{ template "azure-loganalytics-exporter.name" . }}
{{- include "azure-loganalytics-exporter.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
{{- if .Values.releaseLabel }}
release: {{ .Release.Name }}
{{- end }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "azure-loganalytics-exporter.selectorLabels" }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/name: {{ template "azure-loganalytics-exporter.name" . }}
{{- end }}

{{/*
The image to use
*/}}
{{- define "azure-loganalytics-exporter.image" -}}
{{- if .Values.image.sha -}}
{{- printf "%s/%s:%s@%s" .Values.image.registry .Values.image.repository (default (printf "%s" .Chart.AppVersion) .Values.image.tag) .Values.image.sha }}
{{- else -}}
{{- printf "%s/%s:%s" .Values.image.registry .Values.image.repository (default (printf "%s" .Chart.AppVersion) .Values.image.tag) }}
{{- end }}
{{- end }}


{{/*
Create the name of the service account to use
*/}}
{{- define "azure-loganalytics-exporter.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "azure-loganalytics-exporter.fullname" .) .Values.serviceAccount.name }}
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
