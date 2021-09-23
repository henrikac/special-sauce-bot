#!/usr/bin/env bash

DATABASE=src/data/feathers.db
TABLES=sql/tables

if [ -f "$DATABASE" ]; then
    echo "$DATABASE already exists"
    exit 1
fi

sqlite3 $DATABASE << EOF
.read $TABLES/command.sql
.read $TABLES/ducky.sql
.read $TABLES/leak.sql
.read $TABLES/yak.sql
.exit
EOF