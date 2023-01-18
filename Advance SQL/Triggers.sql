
/* 
Triggers
Types of Triggers:
	1) DML triggers:
		a) After Triggers or For Triggers: 
								After Triggers fire After the DML Command executed.
		b) Instead of Triggers: 
								Insted of Triggers fire before the DML Command executed.
	2) DDL Triggres
	3) Logon Triggers
*/

--After Triggers(DML):-
	create table tbl_Tr_DML_Worker( [No.] int, [Description] nvarchar(50))
/*
syntex:-
create trigger <Trigger name>   Trigger Name Formate:- Tr_forWhichTable_forinsert
On <Table Name for which table is trigger fired>
for <dml command>
as begin
	
	should be mention the magic table name
	Statement....
	Statement....
end
*/
--1st)After Insert Trigger

create trigger tr_worker_ForInsert
on worker
for insert
as begin
	Declare @Name nvarchar(30)
	Declare @Id int
	select @id=worker_id, @Name=[first_name] from inserted                     --here i get the values into varible from magic table

	insert into tbl_Tr_DML_Worker values (@id, @Name +' is Inserted By Trigger')--here i inserted the varible value into another table
end
insert into worker values (9,'Ajay','Kumar',15000,'Admin')

select * from worker
select * from tbl_Tr_DML_Worker

/*
above working of after trigger/for trigger:-
		Whenever i insert the values into worker table, after values will inserted into worker the after trigger will automaticlly fired.
		here this after trigger will take worker_id into @Id Variable and first_name into @Name variable and this two variable will 
		inserted into into other table(tbl_tr_dml_worker)

*/

--2nd) After delete trigger
create trigger tr_worker_ForDelete
on worker
for delete
as begin
	Declare @Name nvarchar(30)
	Declare @Id int
	select @id=worker_id, @Name=[first_name] from deleted   	              --here i get the values into varible from magic table

	insert into tbl_Tr_DML_Worker values (@id, @Name +' is Deleted By Trigger')--here i inserted the varible value into another table
end
delete from worker where WORKER_ID=9
		
select * from worker
select * from tbl_Tr_DML_Worker

--3rd) After update trigger
create trigger tr_worker_ForUpdate
on worker
for Update
as begin
	select * from deleted
	select * from inserted
end
Update worker set FIRST_NAME='Rahul' where Worker_id=6

--Here deleted magic table is a table which contain record before updated the value in worker table
--and inserted magic table is a table which contain record after updated the value in worker table

alter trigger tr_worker_ForUpdate
on worker
for Update
as begin
	Declare @Name nvarchar(30)
	Declare @Id int
	select @id=worker_id, @Name=[first_name] from inserted	              --here i get the values into varible from magic table

	insert into tbl_Tr_DML_Worker values (@id, @Name +' is Updated By Trigger')
end

Update worker set FIRST_NAME='Rakesh' where Worker_id=6

select * from worker
select * from tbl_Tr_DML_Worker

--*****************************************************************************
--instead of triggers









