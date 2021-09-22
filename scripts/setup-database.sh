#!/usr/bin/env bash

DATABASE=src/data/feathers.db
TABLES=sql/tables

sqlite3 $DATABASE << EOF
.read $TABLES/command.sql
.read $TABLES/ducky.sql
.read $TABLES/leak.sql
.read $TABLES/yak.sql
.exit
EOF
