{{/*
Expand the name of the chart.
*/}}
{{- define "dsb-kong-controller.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "dsb-kong-controller.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "dsb-kong-controller.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Controller labels
*/}}
{{- define "dsb-kong-controller.controller.labels" -}}
helm.sh/chart: {{ include "dsb-kong-controller.chart" . }}
{{ include "dsb-kong-controller.controller.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Controller Selector labels
*/}}
{{- define "dsb-kong-controller.controller.selectorLabels" -}}
app.kubernetes.io/name: {{ include "dsb-kong-controller.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "dsb-kong-controller.serviceAccountName" -}}
{{- default (include "dsb-kong-controller.fullname" .) .Values.serviceAccount.name }}
{{- end }}

{{/*
Create name for the portal ui service
*/}}
{{- define "dsb-kong-controller.portal.fullname" -}}
{{- printf "%s-%s" (include "dsb-kong-controller.fullname" .) "ui" }}
{{- end }}

{{/*
Portal labels
*/}}
{{- define "dsb-kong-controller.portal.labels" -}}
helm.sh/chart: {{ include "dsb-kong-controller.chart" . }}
{{ include "dsb-kong-controller.portal.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Portal Selector labels
*/}}
{{- define "dsb-kong-controller.portal.selectorLabels" -}}
app.kubernetes.io/name: {{ include "dsb-kong-controller.portal.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
