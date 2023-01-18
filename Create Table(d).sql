
/*Topics:-
1-Create table
	General method
	By select * into statement
	By joining two existing Table 
2-Delete Table
3-Delete all values from table, without deleting table
3-Insert Values in Table
4-Rename table

*/


--Creating table In DataBase & adding constraint at time of creation table
--Syntex:--Create Table <Table Name> in DB<Existing Database> 


use ABH_work																		 --use(keyword) is liye lgaya kyuki hm <ABH_work> m table bna sake

Create table tbl_StudentInfo

(
[Roll Number] int not null,															------agr null/not null nahi likhe, default ye null leta hai
--[Roll Number] int constraint nn_studentinfo_RollNumber not null					------ye line=above, pr yeh col<Roll Number> m turant constraint dalti hai

[Name] nvarchar(50) not null primary key,

--[Name] nvarchar(50) not null constraint pk_tblstudentinfo_name primary key,		------ye line=above, pr yeh col<name> m turant constraint dalti hai
--constraint pk_tblstudentinfo_name primary key([name])								------ye line=above, pr yeh col<name> kahi bi constraint dalti hai


City nvarchar(20) not null unique,
--City nvarchar(20) not null constraint un_tblstudent_city unique					-----
--constraint un_tblstudent_city unique(city)

[State] nvarchar(20) default('Uttar pardesh'),
--[state] int constraint df_studentinfo_state default('uttar pardesh'),								-----				
--constraint df_studentinfo_state default(state='uttarpardesh')									-----pending

[Marks] int check(Marks>30),
--[Marks] int constraint ck_studentinfo_marks check(marks>30)
--constraint ck_studentinfo_marks check(marks>30)

[Aadhar No] int not null references <tablename(col.name)>
--[RegisteredCourse] nvarchar(10) not null constraint fk_Student_RegisteredCourse_Course_CourseId references Course(CourseId)
--constraint fk_Student_CourseRegistered_Course_CourseId foreign key(CourseRegistered) references Course(CourseId)
)


create table tbl_AadharNo
(
AadharId int not null primary key,
AadharNo int not null 
)


--create new table by select * into statement
select * into newTbl from all$

--create table by as statement
create table nnn as select * from tblStudent
--Note:- it will not work in sql server


--*************************Deleting Table******************
drop table tbl_AadharNo

--************************Deleting all content from table or remove all content
delete from tbl_Aadharno

--************************insert Values in table**********
insert into tbl_AadharNo values (1,112233)
insert into tbl_AadharNo values (2,224455)
insert into tbl_AadharNo values (3,334466)


--*************************Rename Table**********************

exec sp_rename 'tblPersons','tblCustomers'

--Note;- In sql server renameming through Alter Statement and Rename Statement not working

