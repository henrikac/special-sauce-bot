#!/usr/bin/env bash

if ! command -v sqlite3 > /dev/null; then
	echo "Error: sqlite3 is not installed"
	exit 1
fi

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
