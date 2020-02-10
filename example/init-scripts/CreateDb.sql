USE [master]
GO

CREATE DATABASE [%%DATABASE%%];

SELECT name, database_id, create_date  
FROM sys.databases 
where name = '%%DATABASE%%';  