#!/bin/sh
set -e
mkdir -p /app/data
BASE="https://raw.githubusercontent.com/${GH_DATA_REPO}/main"
AUTH="Authorization: Bearer ${GH_DATA_TOKEN}"
curl -fsSL -H "$AUTH" "$BASE/gpt-load.db" -o /app/data/gpt-load.db
curl -fsSL -H "$AUTH" "$BASE/encryption.key" -o /app/data/encryption.key
curl -fsSL -H "$AUTH" "$BASE/models.dev.catalog.json" -o /app/data/models.dev.catalog.json || true
exec /app/gpt-load
