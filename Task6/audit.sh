#!/bin/bash

LOG_FILE="logs.txt"
OUTPUT_FILE="audit-extract.json"

grep '^{' "$LOG_FILE" | jq -c '
  select(
    (.verb == "get" and .objectRef.resource == "secrets") or
    (.verb == "create" and .objectRef.resource == "pods" and (.requestObject?.spec?.containers[]?.securityContext?.privileged == true)) or
    (.verb == "create" and .objectRef.resource == "pods/exec") or
    (.verb == "delete" and (.objectRef.resource == "policies" or .objectRef.resource == "auditpolicies")) or
    (.verb == "create" and .objectRef.resource == "rolebindings" and (.requestObject?.roleRef?.name == "cluster-admin"))
  )
' > "$OUTPUT_FILE"

echo "Анализ завершен. Результаты сохранены в $OUTPUT_FILE"