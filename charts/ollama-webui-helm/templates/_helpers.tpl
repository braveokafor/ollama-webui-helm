{{/* vim: set filetype=mustache: */}}

{{/*
Selector labels
*/}}
{{- define "ollama.selectorLabels" -}}
app.kubernetes.io/name: {{ include "common.names.fullname" . }}-ollama
{{- end }}

{{- define "webui.selectorLabels" -}}
app.kubernetes.io/name: {{ include "common.names.fullname" . }}-webui
{{- end }}

{{/*
Return the proper image name
*/}}
{{- define "ollama.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.ollama.image "global" .Values.global) -}}
{{- end -}}

{{- define "webui.image" -}}
{{- include "common.images.image" ( dict "imageRoot" .Values.webui.image "global" .Values.global ) -}}
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
Create the name of the service account to use
*/}}
{{- define "ollama.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "common.names.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{- define "webui.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "common.names.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}
