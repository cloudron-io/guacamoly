#!/bin/bash

set -eu

export NODE_ENV=production
export ATTACHMENT_DIR=/app/data/storage

mkdir -p "$ATTACHMENT_DIR"

chown -R cloudron:cloudron /app/data

echo "=> Run dbmigration for new collection names"
/usr/local/bin/gosu cloudron:cloudron node /app/code/dbmigrate

echo "=> Start meemo"
exec /usr/local/bin/gosu cloudron:cloudron node /app/code/app.js
