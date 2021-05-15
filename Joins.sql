
select * from tblstudent
select * from tblCourse

-----inner join or join
--show that data in which values of common column of table are match 
select studentname,[Location],CourseName from tblStudent inner join tblCourse on tblStudent.pid=tblcourse.pid

-----left join or left outer join
--show all data of left table with common data also 
select studentname,[Location],CourseName from tblStudent left join tblCourse on tblStudent.pid=tblcourse.pid 

-----right join or right outer join
-- show all data of right table with common data also
select studentname,[Location],CourseName from tblStudent right join tblCourse on tblStudent.pid=tblcourse.pid

-----Full Join or Full outer join
--show all data of both table matching or non matching values
select studentname,[Location],CourseName from tblStudent full outer join tblCourse on tblStudent.pid=tblcourse.pid

------crossed join
--it does not contain on clause
select studentname,[Location],CourseName from tblStudent cross join tblCourse



 
