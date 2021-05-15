

use abh_work
go
select * from INFORMATION_SCHEMA.TABLES
select * from product_details
select * from product_Sold
==

select SalesCountry,sum(salesamount) as totalSales from sheet2$
group by SalesCountry


select  sum(salesamount) from Sheet2$ where [Sales Agent]='tom'
select sum(salesamount) from Sheet2$ where [Sales Agent]='david'
select sum(salesamount) from Sheet2$ where [Sales Agent]='john'


select * from product_details
select * from product_Sold
------------sub queries----------
--1) get one column data from outer quary where outer quary id match with poductID of inner quary......

select productName from product_details where product_details.id in (select ProductID from product_sold)

--2) get two column data from outer quary where outer quary id match with poductID of inner quary......
 select productName,[description] from product_details where product_details.id in (select ProductID from product_sold)

--3)
--Ist way----- using drive table
select * from
(
select productName, (select sum(UnitPrice) from product_sold where ProductID=product_details.id) as TotalAmount from product_details
)
as vijay where TotalAmount is not null
--IInd way----- using subquary in where clause

select productName, (select sum(UnitPrice) from product_sold where ProductID=product_details.id) as TotalAmount from product_details
where product_details.id in (select productId from product_sold)

---IIIrd way---- using Join


------------------3 tables----------------------------------------
select * from tblitems
select * from tblstudent
select * from tblcourse

--Question 1) Display Name who join SQL
select StudentName from tblstudent where pid=(select pid from tblCourse where CourseName='SQL.Server')

--Question 2) Display Name who brought Mobile
select StudentName from tblstudent where pid=
(select Pid from tblcourse where code=
(select code from tblitems where Item='Mobile'))

--question 3) Display Student name which spend more than 2000 on fees
select studentName from tblstudent where pid in (select pid from tblCourse where fee>=2000)


--------------correlated sub quaries-----------

--Question 4) Display details of 2nd largest sal of student
SELECT * from tblstudent as s1 where 2=(SELECT COUNT(*) FROM tblStudent as s2 WHERE S1.SAL<=S2.SAL)

--Question 5) Display details of top 2 sal of student
SELECT * from tblstudent as s1 where 2>=(SELECT COUNT(*) FROM tblStudent as s2 WHERE S1.SAL<=S2.SAL)




































