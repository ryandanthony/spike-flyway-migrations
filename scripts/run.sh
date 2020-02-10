#!/bin/bash
DatabaseType=$1
Action=$2
Server=$3
Port=$4
Database=$5
Username=$6
Password=$7

echo "Run: DatabaseType ${DatabaseType} Action ${Action} Server ${Server} Port ${Port} Database ${Database} Username ${Username} Password ${Password}"
./${DatabaseType}/${Action}.sh $Server $Port $Database $Username $Password