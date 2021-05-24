
select * from [Share Details]
select top(10) * from [Share Details]

create table tblStudent 
(
[Roll no] int not null constraint pk_tblStudent_rollNo primary key,
[Name] nvarchar(50) not null,
[Email Id] nvarchar(100) constraint uq_tblStudent_emailID unique ,
Gender nvarchar(8) not null,
Age int,
Marks int
)

alter table tblStudent
add City nvarchar(20) not null

select * from tblStudent

select distinct [Roll no] from tblStudent

select top(5) [Roll no],city from tblStudent

select top(3) * from tblStudent

--**************filter***************

select * from tblStudent where age>23

select top(3) * from tblStudent where age>23

select * from tblStudent where age in(27)

select * from tblStudent where age between 23 and 35

select * from tblstudent where [Name] like '[AB]%' ---> 

select * from tblstudent where [Name] like '_s%'

select * from tblstudent where [Name] like '% i%'

--group by***********88

select * from tblStudent

select [City], count([Roll no]) from tblStudent group by [City]

select [City],[gender], count([Roll no]) from tblStudent group by [City],[gender]

select [City],[gender], count([Roll no]) from tblStudent group by [City],[gender] order by city desc

