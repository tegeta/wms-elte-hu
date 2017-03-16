#!/bin/bash

if [ $# -eq 0 ]; then
  echo "PostgreSQL felhasználó eltávolítása"
  echo "Használat: $0 <PostgreSQL felhasználói név>"
  exit 1
fi

echo -e "\033[1m[!] FIGYELEM! A \033[31;1m$1\033[39;49m PostgreSQL-felhasználó eltávolítására készülsz.\033[0m"
read -n 1 -r -p "[?] Biztosan ezt akarod? (i/N)"
echo

if [[ $REPLY =~ ^[Ii]$ ]]; then
  echo "[+] Rendben, $1 PostgreSQL-felhasználó eltávolítása..." 

  PGHOST=localhost \
  PGUSER=postgres \
    psql -d gis -c "DROP OWNED BY $1";

  PGHOST=localhost \
  PGUSER=postgres \
    psql -c "DROP USER $1;"

  if [ $? -ne 0 ]; then
    echo "[-] Hiba a felhasználó eltávolítása során." 
    exit 1
  else
    echo "[+] Felhasználó eltávolítva."
  fi
else
  echo "[+] Megszakítva."
fi
