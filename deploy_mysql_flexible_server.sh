#!/usr/bin/env bash
# Deploy Azure Database for MySQL - Flexible Server (público) e base desafio_powerbi
# Requisitos: Azure CLI (2.0+), extensão mysql já incluída nos comandos core.
# ATENÇÃO: Substitua os valores abaixo antes de executar.

set -euo pipefail

# ======= Parâmetros =======
RESOURCE_GROUP="rg-desafio-mysql"
LOCATION="brazilsouth"
SERVER_NAME="mysql-desafio-$$"        # deixe único; aqui usa PID para exemplo
ADMIN_USER="manoel"
ADMIN_PASSWORD="Troque-esta-Senha!123"   # troque
PUBLIC_ACCESS_IP="SEU_IP_PUBLICO"        # ex: 177.0.0.1 ou 177.0.0.1-177.0.0.1
DB_NAME="desafio_powerbi"
SKU_NAME="B_Standard_B1ms"               # custo baixo p/ dev

# ======= Execução =======

az group create --name "$RESOURCE_GROUP" --location "$LOCATION"

# Cria o servidor com acesso público (firewall permitindo seu IP). 
az mysql flexible-server create \
  --resource-group "$RESOURCE_GROUP" \
  --name "$SERVER_NAME" \
  --location "$LOCATION" \
  --admin-user "$ADMIN_USER" \
  --admin-password "$ADMIN_PASSWORD" \
  --sku-name "$SKU_NAME" \
  --public-access "$PUBLIC_ACCESS_IP"

# Cria o database (child resource)
az mysql flexible-server db create \
  --resource-group "$RESOURCE_GROUP" \
  --server-name "$SERVER_NAME" \
  --database-name "$DB_NAME"

echo "Servidor: $SERVER_NAME.mysql.database.azure.com"
echo "Database: $DB_NAME"
