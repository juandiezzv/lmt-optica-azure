#!/bin/bash
set -e
source "$(dirname "$0")/vars.sh"

echo "Creando Resource Group: $RESOURCE_GROUP en $LOCATION..."

az group create \
  --name "$RESOURCE_GROUP" \
  --location "$LOCATION"

echo "Listo. Resource Group creado."


echo "Devolvio el ARM Resource ID"