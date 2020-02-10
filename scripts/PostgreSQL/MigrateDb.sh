#!/bin/bash
echo "PostgreSQL: MigrateDb"
Database=$1
Username=$2
Password=$3

echo "PostgreSQL: DropDb Database ${Database} Username ${Username} Password ${Password}"