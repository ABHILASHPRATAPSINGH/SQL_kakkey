--List of all type of objects present in ABH_database
select * from sysobjects

--List Diffrent type of xtype present in ABH_database
select distinct xtype from sysobjects

--List of all table present in ABH_database
select * from sys.tables
select * from INFORMATION_SCHEMA.TABLES     --it return table as well as view

--List of all procedure present in ABH_database
select * from sys.procedures
select * from INFORMATION_SCHEMA.ROUTINES      -- it returns list of store procedure and function also

--List of all viewspresent in ABH_database
select * from sys.views