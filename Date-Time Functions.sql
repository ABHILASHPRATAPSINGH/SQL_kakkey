
---Datepart input
/*year
quarter
month
dayofyear
day
week
weekday
hour
minute
second
millisecond
microsecond
nanosecond
tzoffset*/

--1)Datepart Functions & Datename functions

select datepart(WEEKDAY,getdate())  --->Returns int
select datepart(month,getdate())
select datename(WEEKDAY,getdate())  --->returns name
select datename(WEEKDAY,getdate())

--2)DateAdd functions
--add or subtract from datePart of provided date
select dateadd(day,-1,getdate())
select dateadd(month,1,getdate())

--3)Datediff function
--diff b/w two date in term of datepart
select datediff(day,getdate(),'2020-05-26')

alter function calculateAge (@DOB nvarchar(max))
returns nvarchar(max)
as
begin
	declare @year as int
	declare @month as int
	declare @age as nvarchar(max)
	declare @DateAfterAddYear as nvarchar(max)
	declare @dayafteraddmonth as nvarchar(max)
	set @year=datediff(year,@DOB,GETDATE())-1
	set @DateAfterAddYear=cast(DATEADD(year,@year,@DOB) as nvarchar(max))
	set @month=datediff(month,@DateAfterAddYear,getdate())-1
	set @dayafteraddmonth=dateadd(month,@month,@DateAfterAddYear)
	set @age=cast(@year as nvarchar(10))+'-Year  ' +cast(@month as nvarchar(10))+'-Months'
	return @age
end
 select dbo.calculateAge('2020-04-24')

 alter function getStartingMonthDate(@Date datetime)
 returns datetime
 as
 begin
	return (select dateadd(month,-1,dateadd(day,1,EOMONTH(@Date))))
 end

 select dbo.getstartingMonthdate('2020-12-12')



 

















