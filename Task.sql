
select * from tblChar
declare @Name as nvarchar(max)='adfd23423@&#}?/kjhd232'

declare @i as int=1
while @i<=len(@name)
begin
	select SUBSTRING(@name,@i,1)
	if  
	set @i=@i+1
end