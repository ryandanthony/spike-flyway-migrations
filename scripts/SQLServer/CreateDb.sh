#!/bin/bash
echo "SQLServer: CreateDb"
Server=$1
Port=$2
Database=$3
Username=$4
Password=$5

echo "SQLServer: CreateDb --> Server: ${Server} Port: ${Port} Database: ${Database} Username: ${Username} Password: ${Password}"

sed "s/%%DATABASE%%/${Database}/g" /scripts/SQLServer/CreateDb.sql > /scripts/SQLServer/updated-createDb.sql
/opt/mssql-tools/bin/sqlcmd -U ${Username} -P ${Password} -S tcp:${Server},${Port}  -i /scripts/SQLServer/updated-createDb.sql

