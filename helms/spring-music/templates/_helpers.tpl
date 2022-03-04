{{- define "spring-music.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "spring.labels" }}
labels:
  generator: helm
  date: {{ now | htmlDate }}
  name: {{ .Release.Name }}
{{- end }}
