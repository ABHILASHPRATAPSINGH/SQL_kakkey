

--What is store procedure??
--It is group of statement, it is used for code reusebility

--How to create store procedure??
/*syntex:- 
create procedure/proc <procedure Name>
		as
		begin
			Statement.....
			Statement.....
		end*/
--eg
CREATE PROC spGetAllDetailsOFWorker
as begin
select * from worker
end

--Note:- when naming user define store procedure, microsoft recommded not to use sp_ as prefix of user define store procedure.
--b'coz all system define store procedure have sp_ as prefix.

--How to call procedure
Execute spGetAllDetailsOFWorker
exec spGetAllDetailsOFWorker
spGetAllDetailsOfWorker


--**************************************************
--How to make input parametrized stored procedure
create procedure spGetWorkerDetailsByDepartment
@Department nvarchar(20)
as begin
	select * from worker where Department=@Department
end

--calling parametrized stored procedure
exec spGetWorkerDetailsByDepartment 'admin'
spGetWorkerDetailsByDepartment 'admin'
execute spGetWorkerDetailsByDepartment 'admin'
exec spGetWorkerDetailsByDepartment @department='admin'

--****************************************************
--How to see the text of store procedure
--1st way-> goto procedure->right click->script procedure as->create to->new query editor window
--2nd way-> By query(system store procedure)
sp_helptext spGetworkerdetailsbydepartment

--***********************************************
--How to modify store procedure
/*alter procedure <procedure Name>
as begin
	statement....
	statement....
end*/
alter procedure spGetWorkerDetailsByDepartment
@Department nvarchar(20)
as begin
	select * from worker where Department=@Department
end

--**********************************************
--How to delete store procedure
drop proc spGetWorkerDetailsByDepartment

--**********************************************
--How to encrpyt the store procedure( means to not show the text of your store procedure by anyone )
/*create procedure <procedure Name>
with encryption
as begin
	statement....
	statement....
end*/
alter proc spGetworkerdetailsbydepartment
@department nvarchar(20)
with encryption
as begin
	select * from worker where Department=@Department
end

sp_helptext spgetworkerdetailsbydepartment 'admin'

--****************************************************************************

--How to create output parametrized store procedure
/*create procedure <procedure Name>
@variable_name datatype output
as begin
	statement....
	statement....
end*/

create procedure spGetNoOfWorkerByDepartment
@Department nvarchar(20),
@workerCount int output
as begin
	select @workerCount=count(*) from worker where Department=@Department
end

--How to call output parametrized store procedure
--step-1 we to make variable which store the value of output of store procedure, variable datatype should be match with datatype of output of sp
--step-2 Excecute <sp name> <outparameter=variableName> output
declare @No_of_Workers int
exec spGetNoOfWorkerByDepartment @workerCount=@No_of_workers output, @Department='admin'
print @No_of_workers

declare @No_of_Workers int
exec spGetNoOfWorkerByDepartment 'admin', @No_of_workers output
print @No_of_workers

--Note:- to receive the value in variable we should mention output keyword, otherwise variable receive null value, and order of arguments should be 
--same as we declare the parameter
--Check variable contains or not
declare @No_of_Workers int
exec spGetNoOfWorkerByDepartment @workerCount=@No_of_workers, @Department='admin'
if @No_of_Workers is null
	print '@No_of_workers is null'
else
	print '@No_of_Workers is not null'

declare @No_of_Workers int
exec spGetNoOfWorkerByDepartment @workerCount=@No_of_workers output, @Department='admin'
if @No_of_Workers is null
	print '@No_of_workers is null'
else
	print '@No_of_Workers is not null'

--*********************************************
--Store procedure output parameter and return values

/*In store procedure generally return indicated the success or failiure of store procedure in form int datatype only, zero indicated the success 
and non-zero indicates the failiure of store procedure, and it also used to receive only one integer datatype values.
where as output parameter is used to receive one or more than one values which have or may not have diffrent datatypes. */

--Eg: let see example where working of output and return is same.
--In this example output and return work as same b'coz both are used to receive int value, but whenever we used to receiver more than one int value
--or to receive diffrent datatype value than int , then return will fail
create proc spGetTotalWorker1
@worker_count int output
as begin
	select @worker_count=count(*) from worker
end

declare @TotalWorker int
exec spGetTotalWorker1 @totalWorker output
print @TotalWorker


create proc spGetTotalWorker2
as begin
	return (select count(*) from worker)
end

declare @TotalWorker int
exec @TotalWorker=spGetTotalWorker2
print @TotalWorker

--Eg:-Failure of return
create proc spGetTotalWorker3
@workerName nvarchar(20) output
as begin
	select @workerName=FIRST_NAME from worker where salary=90000
end

declare @Name nvarchar (20)
exec spGetTotalWorker3 @Name output
select @Name


create proc spGetTotalWorker4
as begin
	return (select FIRST_NAME from worker where salary=90000)
end

declare @Name nvarchar (20)
exec @Name=spGetTotalWorker4
select @Name
--Note:- it through error, b'coz in sp return always store int datatype values.


--****************************************************************
--Advantages of store procedure
--1st advantage) Execution plan retain

select first_name from worker where WORKER_ID=1
select first_name from worker where WORKER_ID=2

/*if i execute 1st query, a new execution plan will generated, and i execute again the same query a old execution plane is reuse.
if i rewrite the same query with small change like or changes the parameter only, a new execution plan will created. but i case of of
store procedure execution plan will reuse.*/

create proc spGetName
@id int
as begin
	select first_name from worker where WORKER_ID=@id
end

exec spGetname 1
exec spGetname 2
--both above query excution plan will same.

--2nd advantage):- Reduces the network traffic.
--3rd advantage):- Code reusability and better maintainbiliity
--4th advantage):- better security
--5th advantage):- avoid injection attack
--what is SQL injection attack please watch:- http://www.youtube.com/watch?v=uSwOloSr3Hk 


--***********************************************************************
--Some system define store procedure
--1)sp_help  :- view the information of store procedure like parameter, datatype etc. this command will also work on diffrent oubjects like
--tables,views,sp,triggers etc. we also use shoutcut key to execute this command by highlight the store procedure name and press alt+f1.
sp_help spGetNoOfWorkerByDepartment

--2)sp_helptext :- It used to see the text of store procedure.
sp_helptext spGetNoOfWorkerByDepartment

--3)sp_depends  :- It used to check the dependency of store procedure, It shows that objects that are refer to this store procedure, if we
--delete that objects then store procedure will effected. This (sp_depends) procedure will also check the refences or dependency 
sp_depends spGetNoOfWorkerByDepartment
sp_depends worker









