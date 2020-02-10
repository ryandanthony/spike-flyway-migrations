#!/bin/bash
echo "SQLServer: DropDb"
Server=$1
Port=$2
Database=$3
Username=$4
Password=$5

echo "SQLServer: DropDb --> Server: ${Server} Port: ${Port} Database: ${Database} Username: ${Username} Password: ${Password}"

sed "s/%%DATABASE%%/${Database}/g" /scripts/SQLServer/DropDb.sql > /scripts/SQLServer/updated-dropdb.sql
/opt/mssql-tools/bin/sqlcmd -U ${Username} -P ${Password} -S tcp:${Server},${Port}  -i /scripts/SQLServer/updated-dropdb.sql

