if [ $# -eq 0 ]; then
  echo "PostgreSQL felhasználó eltávolítása"
  echo "Használat: $0 <PostgreSQL felhasználói név>"
  exit 1
fi

PGHOST=localhost \
PGUSER=postgres \
  psql -c "DROP USER $1;"

if [ $? -ne 0 ]; then
  echo "[-] Hiba a felhasználó eltávolítása során." 
  exit 1
else
  echo "[+] Felhasználó eltávolítva."
fi
