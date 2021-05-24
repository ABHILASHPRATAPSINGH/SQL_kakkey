--********************adding constraint in Existing table**********************************
--The following constraints are commonly used in SQL:

--NOT NULL - Ensures that a column cannot have a NULL value
--UNIQUE - Ensures that all values in a column are different
--PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
--FOREIGN KEY - Prevents actions that would destroy links between tables
--CHECK - Ensures that the values in a column satisfies a specific condition
--DEFAULT - Sets a default value for a column if no value is specified
--CREATE INDEX - Used to create and retrieve data from the database very quickly
-- Primary key--1)1 table 1 se jyada primary key nhi bna skte hai
	--			2)doublicate are not allowed
	--			3)isi ke behafe pr sare records ko hm seprately define kr skte hai
-- Foreign key--1)iska use hm unwanted values se bachne ke liye krte hai
   	--			2)foreign key jis table ki column m bnti hai uska relation hm dusri table ke id column se krde to foreign key colum
	--			  kbi id column se alag value nhi aa skti.
  --Unique key--1)ek table ek se jyada unique key ho skti hai
	--			2)iska use hm us particular column m dublicacy ko rokne ke liye karte hai
				
--Syntax1: Alter table <existing table name> Add Constraint <constraint name> constraint type<(column name)>

alter table Course	
add constraint uq_Course_CourseName unique(CourseName),
	constraint df_Course_CourseName default 'not defined' for CourseName,
	constraint ck_Course_CourseName check(len(CourseName)>=3)

--Syntax2: Alter table <existing table name> Add Constraint type <(column name)>
ALTER TABLE Persons
ADD UNIQUE (ID)

***************************************************************************************************************************




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


