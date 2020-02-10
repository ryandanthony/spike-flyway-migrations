#!/bin/bash
echo "SQLServer: MigrateDb"
Server=$1
Port=$2
Database=$3
Username=$4
Password=$5

echo "SQLServer: DropDb Database ${Database} Username ${Username} Password ${Password}"
flyway -user=${Username} -password=${Password} -url="jdbc:sqlserver://$Server:$Port;databaseName=$Database" -locations="filesystem:/flyway/sql/SQLServer" migrate
