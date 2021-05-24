
select * from [share details]

--*********************add column after creation of table****************
--syntex:- alter table <table Name> add <column name column data type null/not null constraint>
alter table [Share Details] add [city] nvarchar(50)

--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
--*********************rename column name************************************
--syntex:- exec sp_rename '<column name with table scema>', '<new column name>', 'column'
exec sp_rename 'dbo.Share Details.address', 'cdfdf', 'column'


--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
--*********************delete column name*********************8888
--syntex:- alter table <table name> drop column <column name>
alter table [share details] drop column [cdfdf]

--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
--********************add constraint to existing column*************
--syntex:- alter table <table name> add constraint <constraint name> <constraint type> 
alter table [share details] add constraint df_shareDetails_marketCap default 10 for [Market cap]

--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
--********************add value in column***************************
--syntex:-update <table name> set <column name>=<value you want> where condition
update [Share Details] set [Market cap]=330 where [Market cap]=714

