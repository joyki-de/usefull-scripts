#!/bin/bash
set -euo pipefail
PORTAINER_URL="https://DEIN-SERVER:9443"
API_KEY="pt........"
BACKUP_DIR="./portainer-stacks-backup"
# Bei selbstsigniertem Zertifikat:
CURL_OPTS="-k -sS"
# Ohne selbstsigniert:
# CURL_OPTS="-sS"

mkdir -p "$BACKUP_DIR"

echo "1. Prüfe Verbindung und Token..."
HTTP_CODE=$(curl $CURL_OPTS -o /tmp/stacks.json -w "%{http_code}" \
  -H "X-API-Key: $API_KEY" \
  "$PORTAINER_URL/api/stacks")

echo "   HTTP-Status: $HTTP_CODE"

if [[ "$HTTP_CODE" != "200" ]]; then
  echo "Fehler! Antwort:"
  cat /tmp/stacks.json
  exit 1
fi

# Anzahl Stacks prüfen
STACK_COUNT=$(jq 'length' /tmp/stacks.json)
echo "2. Anzahl gefundener Stacks: $STACK_COUNT"

if [[ "$STACK_COUNT" -eq 0 ]]; then
  echo "Keine Stacks gefunden. Prüfe, ob der Token Admin-Rechte hat und die Stacks in Portainer sichtbar sind."
  exit 1
fi

echo "3. Stacks im Überblick:"
jq -r '.[] | "  ID=\(.Id)  Name=\(.Name)  Endpoint=\(.EndpointId)  Type=\(.Type)"' /tmp/stacks.json

echo
echo "4. Hole Compose-Dateien..."

SUCCESS=0
FAILED=0

jq -c '.[]' /tmp/stacks.json | while read -r stack; do

ID=$(echo "$stack" | jq -r '.Id')
  NAME=$(echo "$stack" | jq -r '.Name // "unnamed"')
  ENDPOINT=$(echo "$stack" | jq -r '.EndpointId')

  # Sicherer Dateiname
  SAFE_NAME=$(echo "$NAME" | sed 's/[^a-zA-Z0-9._-]/_/g')

  OUTFILE="$BACKUP_DIR/${ENDPOINT}_${SAFE_NAME}_${ID}.yml"

  # Compose-Inhalt holen
  FILE_RESP=$(curl $CURL_OPTS -w "\n%{http_code}" \
    -H "X-API-Key: $API_KEY" \
    "$PORTAINER_URL/api/stacks/$ID/file")

  HTTP_FILE=$(echo "$FILE_RESP" | tail -n1)
  BODY=$(echo "$FILE_RESP" | sed '$d')

  if [[ "$HTTP_FILE" != "200" ]]; then
    echo "  ✗ $NAME (ID $ID) → HTTP $HTTP_FILE"
    echo "    Antwort: $BODY" | head -c 200
    echo
    ((FAILED++)) || true
    continue
  fi

  CONTENT=$(echo "$BODY" | jq -r '.StackFileContent // empty')

  if [[ -z "$CONTENT" || "$CONTENT" == "null" ]]; then
    echo "  ✗ $NAME (ID $ID) → StackFileContent ist leer (oft bei Git-Stacks oder Limited-Control)"
    ((FAILED++)) || true
    continue
  fi

  echo "$CONTENT" > "$OUTFILE"
  echo "  ✓ $NAME → $OUTFILE"
  ((SUCCESS++)) || true
done

echo
echo "Fertig. Erfolgreich: $SUCCESS  |  Fehlgeschlagen: $FAILED"
ls -la "$BACKUP_DIR"
