
/*
Functions:- Function is group of one statement or more than one statement which always returns some values.
Types:- 1) system function or built in function
		2) User define funtions
			a) scalar fuctions
			b) inline table valued functions
			c) multi statement table valued functions
		3) Deterministic and non deterministic function
Encrypting function
Schema binding function


Scalar functions:- it may or may not have parameter, but always return a single(scalar) value. The return value can be any datatype
					except text,ntext,image,cursor,timestamp


How to create scalar functions
syntex:-
create function/func <function name> (@parameter1 datatype, @parameter2 datatype.....)
returns return_datatype
as begin
declare aslease 1 varible
set the value in it
and return that variable
	statement1...
	statement2...
	return return_datatype
end
*/
create function funcAddFirst_NameLas_name (@Name_1 nvarchar(20),@Name2 nvarchar(20))
returns nvarchar(30)
as begin
declare @completeName nvarchar(30)
	set @completeName=@Name_1+' '+@Name2
	return @completeName
end

--How to call the scalar user define functions
select dbo.funcAddFirst_NameLas_name(first_name,Last_name) as full_name from worker
select dbo.funcaddfirst_namelas_name('abhilash','pratap')
--Note:- for calling scalar function we have to mention atleast two name function that is dbo.(functionName) or you can may mention 
--3 name function that is <databasename.dbo.functionname>

--How to modify function and delete function
--by using alter statment and drop statement

--***************************************************************************************************

/*Inline table valued functions
scalare user define functiion return single value whereas inline table valued functions returns table
Point to remeber to create inline table valued functions:-
	1)return of datatype should table
	2)inline table vlued functions not contains begin-end statement
	3)the structure of table is determined by select statement
syntex:-
create function <function Name> (@parameter1 datatype, @parameter2 datatype.....)
returns table
as
 statement1..
 statement2..
 return (select statement...)
*/

create function inlineFuncGetAllDetailsByDepartment (@Department nvarchar(20))
returns table
as
	return (select * from worker where department=@Department)

--How to call the Inline table valued function
--B'coz inline table valued funtions always return the table, so we call this function to treat this as table. and we can use where clause order by
--and we also join this with any other table
select * from inlineFuncGetAllDetailsByDepartment('hr')

--*******************************************************************
/*Multi statement table valued functions
point to remeber:- 
	1) We have explicity declare the stucture of table
	2) begin-end is there
	4) we should insert into the value in variable table and return this variable table 
	3) return table datatype should be matched with declare sturcture datatype
syntex:-
create func <function name>(@parameter1 datatype)
returns <variable> <variable datatype that is table> <structure of table>
as begin
	
	statement...
	return
end 
*/
create function multiLineFuncFirstAndLasName(@Department nvarchar(20))
returns @table table (Id int, st_name nvarchar(20), nd_name nvarchar(20))
as begin
	insert into @table
	select Worker_id,First_name,Last_name from worker where department=@Department
	return
end

select * from multiLineFuncFirstAndLasName('hr')

/*
diffrence between inline table valued funtion and multi statement table valued function
						inline										Multiline
1)It does not contain begin-end block keyword		1)It contain begin-end block keyword
2)Used to return table, where structure of			2)Used to return table, Explicitly we have to declare the structure of table
table is not define
3)It have better performance than multi				3)performance wise it is not good
reason-sql server treat inline table valued			reason-sql server treat multi statement table valued function as store procedure
function as view
4)It's possible to update inline					4)update in multi statement table valued function is not possible	

see 4th point with an example
*/
--eg
update inlineFuncGetAllDetailsByDepartment('hr') set last_name='Sharma' where WORKER_ID=1 --it is possible to update

update multiLineFuncFirstAndLasName('hr') set nd_name='verma' where id=3 --it is not possible to update



--***********************************************************************************************************

/*
Deterministic function:- it always return same result for particular parameter and particular database
						eg:- square(3) it always return 9 until we can pass other parameter like 4,5,6 and until we can change the square to add.
						note:- all aggregate functions are deterministic function

Non-deterministic funtion:-it always return diffrent result.
						eg:- getdate(),current_timestamp
note:-rand() function is non-determinstic function, if we provide the parameter it will work as deterministic function


Encrpyting and schemabinding
encrpyting:- if i want to not see the text of function to anyone then we to encrpyt the function by using 'with encrypting' statment inside the function
			just same as we use in store procedure

with scemabinding:- if i used this statement inside the function we prevent all the objects that are refer to this function from 
					update,delete,insert or any manuplation to that object. 
*/

alter function inlineFuncGetAllDetailsByDepartment (@Department nvarchar(20))
returns table
with schemabinding
as
	return (select WORKER_ID from dbo.worker where department=@Department)

drop table worker  -- we cannot delete the worker table 

