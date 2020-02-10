# /usr/bin/env pssh
docker build . -t flyway-migrations
Push-Location .\example
docker build . -t example-migration
Pop-Location
#docker run flyway-migrations SQLServer CreateDb Server1 Database1 User1 Password1

docker run --network=bct-common-devtools_default example-migration SQLServer DropDb sql-server-db 1433 Database1 sa "c3kgC5#Adfl*"
docker run --network=bct-common-devtools_default example-migration SQLServer CreateDb sql-server-db 1433 Database1 sa "c3kgC5#Adfl*"
docker run --network=bct-common-devtools_default example-migration SQLServer MigrateDb sql-server-db 1433 Database1 sa "c3kgC5#Adfl*"

#docker run flyway-migrations PostgreSQL CreateDb localhost 1433 Database1 sa "c3kgC5#Adfl*"


# Potential Improvements
# - Make parameters use --Database vs ordering
# - Don't use flyway as a base, use busybox and pull in flyway
# 