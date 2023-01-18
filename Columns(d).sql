
/*
Topic:-
1-add column after creation of table
2-rename column name
3-delete column name
4-add constraint to existing column
5-adding values to existing column by update statement
*/


--*********************add column after creation of table****************
--syntex:- alter table <table Name> add <column name column data type null/not null constraint>
alter table [Share Details] add [city] nvarchar(50)


--*********************rename column name************************************
--syntex:- exec sp_rename '<column name with table scema>', '<new column name>', 'column'
exec sp_rename 'dbo.Share Details.address', 'cdfdf', 'column'


--*********************delete column name*********************
--syntex:- alter table <table name> drop column <column name>
alter table [share details] drop column [cdfdf]


--********************add constraint to existing column*************
--syntex:- alter table <table name> add constraint <constraint name> <constraint type> 
alter table [share details] add constraint df_shareDetails_marketCap default 10 for [Market cap]

alter table Course
alter column Credit nvarchar(50) not null

--********************add value in column***************************
--syntex:-update <table name> set <column name>=<value you want> where condition
update [Share Details] set [Market cap]=330 where [Market cap]=714





