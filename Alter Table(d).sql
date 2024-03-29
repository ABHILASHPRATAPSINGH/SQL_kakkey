/*
1-Adding a new column to existing table
2-Deleting existing columns from table
3-rename column of table
4-droping constraints from table
5-adding new constriant to column
6-change Datatype and nullability of column
*/


--Adding a new column to existing table
alter table Course
add MinimumCourseCredit integer not null constraint df_Course_MinimumCourseCredit default 4,
	MaximumCourseCredit integer not null constraint df_Course_MaximumCourseCredit default 8
	Course nvarchar(10) constraint fk_DuStudent_Course foreign key References Course(CourseId)

--Deleting existing columns from table
alter table Course
drop column MinimumCourseCredit,
			MaximumCourseCredit

--rename column of table
exec sp_rename 'Course.MinCourseCredit','MinimumCourseCredit','COLUMN'

  
--droping constraints from table
alter table Course
drop constraint df_Course_MinimumCourseCredit,df_Course_MaximumCourseCredit

--adding new constriant to column
alter table Course	
add constraint uq_Course_CourseName unique(CourseName),
	constraint df_Course_CourseName default 'not defined' for CourseName,
	constraint ck_Course_CourseName check(len(CourseName)>=3)

--change Datatype and nullability of column
alter table K_Stock_Market
alter column Credit nvarchar(50) not null
