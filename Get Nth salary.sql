
--**********************get highest salary according to rank******************************************


--question.1)get higest salary from table tblstudent
select * from tblStudent where sal=(select max(sal) from tblStudent)

--question.2)get 2nd highest salary from table tblstudent
select max(sal) from tblstudent where sal < (select max(sal) from tblstudent)

--question.3) get 2nd highest salary all information from table tblstudent
select * from tblstudent where sal=(select max(sal) from tblstudent where sal < (select max(sal) from tblstudent))

----------********--------This is not a good way-----------*****--------------
--get 3rd highest sal by mention the number
SELECT * from tblstudent as s1 where 3=(SELECT COUNT(*) FROM tblStudent as s2 WHERE S1.SAL<=S2.SAL)

--get above 2nd highest sal for all student just mention the number
SELECT * from tblstudent as s1 where 2>=(SELECT COUNT(*) FROM tblStudent as s2 WHERE S1.SAL<=S2.SAL)

-------------------Using top method-----------------------------------------------------
select top 1 sal from 
(select distinct top 2 sal from tblStudent order by sal desc) as Derived_tbl1
order by sal asc

select top 2 sal from 
(select distinct top 5 sal from tblStudent order by sal desc) as Derived_tbl1

----------------------using dense rank function------------------------------------------

select * from (select sal, dense_rank() over (order by sal desc) as sal_rank
from tblStudent) as derivedtbl_2 where sal_rank=2

------------------you also use Common table expression instead of derivedtbl---------------

with result as 
(select *, dense_rank() over (order by sal desc) as sal_rank
from tblStudent)

SELECT * FROM RESULT WHERE sal_rank=2

-------------------Using row Number function to get the same result-------------------
----if there is duplicate sal in the tblstudent then row number not Asign next number to those row
with result as 
(select *, row_number() over (order by sal desc) as sal_rank
from tblStudent)

SELECT * FROM RESULT WHERE sal_rank=2



























