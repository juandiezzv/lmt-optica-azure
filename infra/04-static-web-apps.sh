#!/bin/bash
set -e
source "$(dirname "$0")/vars.sh"

FRONTEND_LOCATION="eastus2"

echo "Creando Static Web App: $FRONTEND_APP_NAME..."

az staticwebapp create \
  --name "$FRONTEND_APP_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$FRONTEND_LOCATION" \
  --sku Free

echo "Listo. Static Web App creada."
echo "URL: https://$(az staticwebapp show \
  --name $FRONTEND_APP_NAME \
  --resource-group $RESOURCE_GROUP \
  --query defaultHostname \
  --output tsv)"