#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Használat: $0 <PostgreSQL felhasználói név>"
fi

echo "[+] '$1' PostgreSQL-felhasználó létrehozása:"

PG_HOST=localhost \
PG_USER=postgres \
  createuser \
    --echo \
    --encrypted \
    --password \
    --pwprompt \
    $1

echo "[+] '$1' hozzáadása a 'gis_users' csoporthoz"

PG_HOST=localhost \
PG_USER=postgres \
  psql -c 'GRANT gis_users TO $1;'

echo "[+] A felhasználó sikeresen létrejött." 
