--XXXXXXXXXXXXXXXXXXXXX Creating,Deleting,Renaming DataBase XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX



--Creating DataBase
--Syntex: create database <DataBase Name>
create database K_Stock_Market

--Drop database
--Syntex: drop database <Existing DataBase Name>
drop database New_Stock_Market


--Renaming database
--Syntex:1 alter database <Old Database Name> modify name=<New Database Name>
alter database New_Stock_Market
modify name=K_Stock_Market

--Syntex:2 execute sp_renameDB <'Old Database Name'>,<'New Database Name'>
execute sp_renameDB 'k_Stock_Market','New_Stock_Market'

/*
Note:-You might have seen "The database could not be exclusively locked to perform the operation. (Microsoft SQL Server, Error: 5030)" error when you try to rename SQL server database.  This error normally occurs when your database is in Multi User mode where users are accessing your database or some objects are referring to your database.
 Nothing much to do to resolve the issue. First set the database to single user mode and then try to rename the database and then set it back to Multi user mode.
 We will go through step by step.
First we will see how to set the database to single user mode,

ALTER DATABASE dbName
SET SINGLE_USER WITH ROLLBACK IMMEDIATE

Now we will try to rename the database

ALTER DATABASE dbName MODIFY NAME = dbNewName

Finally we will set the database to Multiuser mode

ALTER DATABASE dbName
SET MULTI_USER WITH ROLLBACK IMMEDIATE

Hope you are able to rename your database without any issues now!!!*/
