#!/bin/bash
set -e
source "$(dirname "$0")/vars.sh"
source "$(dirname "$0")/secrets.sh"

echo "Creando PostgreSQL Flexible Server: $DB_SERVER_NAME..."

az postgres flexible-server create \
  --name "$DB_SERVER_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --location "$LOCATION" \
  --admin-user "$DB_ADMIN_USER" \
  --admin-password "$DB_ADMIN_PASSWORD" \
  --sku-name Standard_B1ms \
  --tier Burstable \
  --version 16 \
  --storage-size 32 \
  --public-access 0.0.0.0 \
  --yes

echo "Esperando que el servidor esté Ready..."

az postgres flexible-server wait \
  --name "$DB_SERVER_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --created

echo "Creando base de datos: $DB_NAME..."

az postgres flexible-server db create \
  --server-name "$DB_SERVER_NAME" \
  --resource-group "$RESOURCE_GROUP" \
  --database-name "$DB_NAME"

echo "Listo. Base de datos creada."
echo "Host: ${DB_SERVER_NAME}.postgres.database.azure.com"