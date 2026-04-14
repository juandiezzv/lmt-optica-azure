#!/bin/bash
set -e
source "$(dirname "$0")/vars.sh"
source "$(dirname "$0")/secrets.sh"

echo "Creando App Service Plan: $PLAN_NAME..."

az appservice plan create \
  --name "$PLAN_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --sku B1 \
  --is-linux

echo "Creando Web App: $BACKEND_APP_NAME..."

az webapp create \
  --name "$BACKEND_APP_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --plan "$PLAN_NAME" \
  --runtime "$JAVA_VERSION"

echo "Configurando variables de entorno..."

az webapp config appsettings set \
  --name "$BACKEND_APP_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --settings \
    DATABASE_URL="jdbc:postgresql://${DB_SERVER_NAME}.postgres.database.azure.com:5432/${DB_NAME}" \
    DB_USER="$DB_ADMIN_USER" \
    DB_PASS="$DB_ADMIN_PASSWORD" \
    SPRING_PROFILES_ACTIVE="prod"

echo "Listo. Web App creada."
echo "URL: https://${BACKEND_APP_NAME}.azurewebsites.net"
