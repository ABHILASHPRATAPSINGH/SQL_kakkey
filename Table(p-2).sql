
--******************Creating Table in existing database****************************

use New_Stock_Market  --to use the context of specified database
--creating table columns
--Syntex: create table <table name> (<[column1 name]> <column1 datatype> null/not null,<column2 name> <column2 DT> null/not null, ......)

create table Student
(
	--adding nullability and domain constriant
	[EnrollmentNumber] nvarchar(30) not null,

	[Name] nvarchar(100) not null,
	[FatherName] nvarchar(100) not null,
	[AadharCardNo] nvarchar(20) not null,
	[ContactNumber] nvarchar(10) null,
	[Email] nvarchar(100) not null,
	[DOB] Date not null default '01-Jan-1991' ,

	--computed column
	[Age] as year(GetDate()) - year(DOB),

	[Address] nvarchar(500) not null,
	[City] nvarchar(100) not null,
	[ZipCode] nvarchar(10) not null,
	[CourseRegistered] nvarchar(10) not null
)

--****************************************************************************************

--************creating table and add constraint at time of creation of table******************

--Syntex1:- create table <table name> (<[column1 name]> <column1 datatype> null/not null, constraint <constraint Name> constraint type(<Column1 Name>))
create table Student
(
	--adding nullability and domain constriant
	[EnrollmentNumber] nvarchar(30) not null,

	[Name] nvarchar(100) not null,
	[FatherName] nvarchar(100) not null,
	[AadharCardNo] nvarchar(20) not null,
	[ContactNumber] nvarchar(10) null,
	[Email] nvarchar(100) not null,
	[DOB] Date not null default '01-Jan-1991' ,

	--computed column
	[Age] as year(GetDate()) - year(DOB),

	[Address] nvarchar(500) not null,
	[City] nvarchar(100) not null,
	[ZipCode] nvarchar(10) not null,
	[CourseRegistered] nvarchar(10) not null,

	--adding unique constraint
	constraint ck_Student_AadharCardNo Unique (AadharCardNo),

	--adding primary key constraint
	constraint pk_Student_EnrollmentNumber Primary Key (EnrollmentNumber),

	--adding check constraint
	constraint ck_Student_ZipCode check (len(zipCode)>=10),

	--adding foreign key constraint
	constraint fk_Student_CourseRegistered_Course_CourseId foreign key(CourseRegistered) references Course(CourseId)
)
	--Adding refrential integrity constraints for foreign key constraint
	on delete cascade
	on update cascade
		--on delete cascade
		--on update cascade
			--or
		--on delete no action
		--on update no action
			--or
		--on delete set default
		--on update set default

)

--Syntex2:- create table <table name> (<column1 name> <column1 datatype> null/not null constraint <constraint Name> constraint type)

create table Student
(
	--named primary key
	[EnrollmentNumber] nvarchar(30) constraint pk_Student_EnrollmentNumber Primary Key,

	--not null constraint
	[Name] nvarchar(100) constraint nn_Student_Name not null,

	--not null constraint
	[FatherName] nvarchar(100) not null,

	--unique constraint
	[AadharCardNo] nvarchar(20) null constraint uq_Student_AdharCardNo Unique,

	[ContactNumber] nvarchar(10) null,
	[Email] nvarchar(100) not null,

	--default constraint
	[DOB] Date not null constraint df_Student_DOB default '01-Jan-1991',

	--computed column
	[Age] as year(getDate())- year(DOB)  ,

	[Address] nvarchar(500) not null,
	[City] nvarchar(100) not null,

	--check constraint
	[ZipCode] nvarchar(10) not null constraint ck_Student_Age check(len(ZipCode) >=10),

	--foreign key constraint
	[RegisteredCourse] nvarchar(10) not null constraint fk_Student_RegisteredCourse_Course_CourseId references Course(CourseId)
)


--Syntex3:- create table <table name> (<column1 name> <column1 datatype> null/not null constraint type)

Create table tbl_StudentInfo

(
[Roll Number] int not null,															------agr null/not null nahi likhe, default ye null leta hai
[Name] nvarchar(50) not null primary key,
City nvarchar(20) not null unique,
[State] nvarchar(20) default('Uttar pardesh'),
[Marks] int check(Marks>30),
[Aadhar No] int not null references <tablename(col.name)>
)

**********************************************************************************************************************

--**************Delete table*********

--Syntex: drop table <table name>
drop table Student

*********************************************************************************************************************

--**************Rename table**********************
--Syntex1: Execute sp_rename <'old existing table name'>, <'New table name'>

Execute sp_rename 'Course.MinCourseCredit','MinimumCourseCredit'


************************************************************************************************************************