#!/bin/bash

# Variablen definieren
RESOURCE_GROUP="rg-myitjournal"
SWA_NAME="myitjournal-manual"
LOCATION="westeurope"

echo "Starte Erstellung der Static Web App"

# 1. Static Web App ohne GitHub-Bindung erstellen
az staticwebapp create \
  --name "$SWA_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION"

echo "Static Web App erfolgreich erstellt!"