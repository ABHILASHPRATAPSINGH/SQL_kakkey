

----------------------Important function--------------------------------


--create table with random number
create table tblrandom
(Number int)
--1st)--------while loop function---------------
declare @i int=1
while @i<50
 begin
  insert into tblrandom values (ceiling(rand()*(@i*10)))

  set @i=@i+1
end 
select * from tblrandom

--2nd)--------case when function------ 
--jb bi ise condition match krti hai to whi condition true krta hai or fir bahar aa jata hai
--it is like elseif in vba
select number,
case 
	when number>10 then 'greater than 10'
	when number>20 then 'greater than 20'
	else 'greater than 50'
end as quantity from tblrandom

--3rd)--------iif function------------
select iif(30>20,'True','false')


--4rd)--------if statement----------------
if 30>20
  begin 
	print 'true'
  end
else
  begin
    print 'false'
  end

--5rd)-------isnull----------------
--if expression is null then it return desire result
select isnull(null,'vijay')----->it return null
select isnull('iii','vijay')---->it return 'iii'

--6th)---------nullif--------------
--it compare two values, if both are same then it returns null otherwise it returns 1st value.
select nullif('ram','ram')----->return null
select nullif('raem','ram')---->return raem

--7th)---------isnumeric----------
--It check wheter number is numberic, it not then it returns zero otherwise it returns 1
select ISNUMERIc('Q')----->it return 0
select ISNUMERIC(23)------>it return 1

--8th)---------choose------------
--It return desire result according to position number
select choose(4,'a','b','c','t')----->it return 't'
select choose(2,'a','b','c','t')----->it return 'b'

--9th)---------coalesce-----------
--It return Ist not null value
--   MobileNumber    LandlineNumber     OfficeNumber
--   234234232       ########            #######------>return 234234232
--   ########        87632874            #######------>return 87632874
--   ########        ########            2342323------>return 2342323
--   23423432        234234234           #######------>return 23423432        
--   32423423        23423422            2342342------>return 32423423
--   Example
select coalesce('abhilash','pratap','singh')------->return abhilash
select coalesce('abhilash',null,null)       ------->return abhilash
select coalesce(null,null,'chitresh')       ------->return chitresh
select coalesce(null,'pratap','chitresh')   ------->return pratap
select coalesce(null,'chitresh',null)       ------->return chitresh

--10th)---------parse--------
--it convert the basic data type structure, if it can not then it through Error
select parse('100.00' as int)               ------>return 100
select parse('abhilash' as int)             ------>return Error

--11th)---------try_parse------
--it try to convert the basic data type structure, if it can not then it return null
select try_parse('100.00' as int)               ------>return 100
select try_parse('abhilash' as int)             ------>return null

--12th)--------convert---------
--it convert the basic data type structure, it also have style parameter
select convert(nvarchar(20),1000)+'abhilash'   ------->return 1000abhilash
select convert(int,'abhilash')                 ------->return error

--13)---------Try_convert------
--it try to convert the basic data type structure, if it can not then it return null
select convert(nvarchar(20),1000)+'abhilash'   ------->return 1000abhilash
select convert(int,'abhilash')                 ------->return null

--14)---------Cast-------------
--it try to convert the basic data type structure, if it can not then it return null
select cast(1000 as nvarchar)+'abhilash'   ------->return 1000abhilash
select cast('abhilash' as int)             ------->return Error

--15)---------Try_Cast-------------
--it try to convert the basic data type structure, if it can not then it return null
select try_cast(1000 as nvarchar(20))+'abhilash'   ------->return 1000abhilash
select try_cast('abhilash' as int)                 ------->return null

-------string function---------
--Ist) Charindex
--It is like a find in vba, it gives the index number from string
select CHARINDEX('b', 'abhilash')					------>return 2
select CHARINDEX('Z', 'abhilash')					------>return 0


--IInd)Patindex
--It return index number of Ist occrence of pattern in a string
select PATINDEX('%h%','abhilash')

--IIIrd)Replace
select REPLACE('abhilash','a','z')				    ------->zbhilzsh

--IVth)Replicate
--it repeat the caracter no. of times
select REPLICATE('abhilash',4)                      -------->abhilashabhilashabhilashabhilash

--Vth)Reverse
select REVERSE('abhilash')                          -------->It reverse the string

--VIth)Space
select 'abhi'+space(10)+'lash'

--VIIth)str
select 'abhilash'+str(199,5,2)

--Xi)substring
--It is like mid function
select SUBSTRING('abhilash',5,1)

--X)ConcatWs
select CONCAT_WS('kh','add','adddd')




































































--isnumeric















