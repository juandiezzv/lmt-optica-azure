#!/bin/bash
RESOURCE_GROUP="lmt-optica-rg"
LOCATION="brazilsouth"
PROJECT="lmtoptica"

DB_SERVER_NAME="${PROJECT}-db"
DB_NAME="lmtoptica"
DB_ADMIN_USER="lmtadmin"

# App Service
PLAN_NAME="${PROJECT}-plan"
BACKEND_APP_NAME="${PROJECT}-backend"
JAVA_VERSION="JAVA:21-java21"

# Static Web Apps
FRONTEND_APP_NAME="${PROJECT}-frontend"