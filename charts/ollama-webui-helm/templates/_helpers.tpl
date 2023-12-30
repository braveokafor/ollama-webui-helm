{{/* vim: set filetype=mustache: */}}


{{/*
Return the proper image names
*/}}
{{- define "ollama.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.ollama.image "global" .Values.global) }}
{{- end -}}

{{- define "webui.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.webui.image "global" .Values.global) }}
{{- end -}}


{{/*
Return the proper resource names
*/}}
{{- define "ollama.name" -}}
  {{- printf "%s-ollama" (include "common.names.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{- define "webui.name" -}}
  {{- printf "%s-webui" (include "common.names.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end -}}


{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "ollama.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.ollama.image) "global" .Values.global) -}}
{{- end -}}

{{- define "webui.imagePullSecrets" -}}
{{- include "common.images.pullSecrets" (dict "images" (list .Values.webui.image) "global" .Values.global) -}}
{{- end -}}


{{/*
Create the name of the service accounts to use
*/}}
{{- define "ollama.serviceAccountName" -}}
{{- if .Values.ollama.serviceAccount.create -}}
    {{ default (printf "%s-ollama" (include "common.names.fullname" .)) .Values.ollama.serviceAccount.name | trunc 63 | trimSuffix "-" }}
{{- else -}}
    {{ default "default" .Values.ollama.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{- define "webui.serviceAccountName" -}}
{{- if .Values.webui.serviceAccount.create -}}
    {{ default (printf "%s-webui" (include "common.names.fullname" .)) .Values.webui.serviceAccount.name | trunc 63 | trimSuffix "-" }}
{{- else -}}
    {{ default "default" .Values.webui.serviceAccount.name }}
{{- end -}}
{{- end -}}