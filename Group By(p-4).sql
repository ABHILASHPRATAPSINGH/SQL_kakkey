create table tblPersons 
(
Id int not null,
[Name] nvarchar(20),
[DepartmentID] int 
)

insert into tblPersons values (1,'abh',111)
insert into tblPersons values (2,'chi',222)
insert into tblPersons values (3,'shi',333)
insert into tblPersons values (4,'shi',444)


create table tblDepartment
(
ID int not null,
Industry nvarchar(20)
)

insert into tblDepartment values (111,'Telecomm')
insert into tblDepartment values (222,'IT')
insert into tblDepartment values (333,'Bank')
insert into tblDepartment values (555,'Metal')

select * from tblPersons 
select * from tblDepartment

select tblPersons.Id, [Name], [Industry] from tblPersons full join tblDepartment on tblDepartment.id=tblPersons.DepartmentID where industry is not null and tblPersons.Id is not null
select tblPersons.Id, [Name], [Industry] from tblPersons full join tblDepartment on tblDepartment.id=tblPersons.DepartmentID

