#!/bin/bash
set -e

RESOURCE_GROUP="rg-davide-journal-test"
SWA_NAME="myitjournal-manual"

echo "Überspringe Build (Dateien liegen bereit in /site)..."

echo "Rufe Deployment-Token live ab..."
DEPLOY_TOKEN=$(az staticwebapp secrets list \
  --name "$SWA_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --query "properties.apiKey" \
  -o tsv)

echo "Publiziere Website in der Azure SWA..."
swa deploy ./site --deployment-token "$DEPLOY_TOKEN" --env production

echo "Fertig! Deine Website ist live."