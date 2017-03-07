#!/bin/bash

if [ $# -eq 0 ]; then
  read -p "Új felhasználó neve: " uname
else
  $uname=$1
fi

if [ "${uname}" == "" ]; then
  echo "[-] Üres felhasználói név."
  exit 1
fi

echo "[+] '${uname}' PostgreSQL-felhasználó létrehozása:"

read -s -p "[?] Új felhasználó jelszava: " pass
printf "\n"
read -s -p "[?] Jelszó újból: " pass2

if [ "${pass}" -ne "${pass2}" ]; then
  echo "[-] A megadott jelszavak nem egyeznek."
  exit 1
fi

PGHOST=localhost \
PGUSER=postgres \
  psql -c "CREATE USER ${uname} IN ROLE gis_users ENCRYPTED PASSWORD '${pass}';"

if [ $? -ne 0 ]; then
  echo "[-] Hiba a felhasználó létrehozása során." 
  exit 1
else
  echo "[+] Felhasználó létrehozva."
fi
