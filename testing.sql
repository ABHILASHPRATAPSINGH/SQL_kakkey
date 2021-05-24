create database Stock_Market_K

drop database K_Stock_Market

create table [Share Details]
(
[Share name] nvarchar(50) not null constraint pk_Share_SharName primary key,
[Industry] nvarchar(100) null,
[Market cap] int null
)

insert into [Share Details] values ('ITC','FMCG',10000)

select * from [Share Details]