
--filtering records
select * from tblStudent where EnrollmentNumber='12345678'
select * from tblStudent where EnrollmentNumber!='12345678'
select * from tblStudent where EnrollmentNumber<>'12345678'
select * from tblStudent where EnrollmentNumber in ('12345678','12345677','12345679')
select * from tblStudent where EnrollmentNumber not in ('12345678','12345677','12345679')
select * from tblStudent where EnrollmentNumber ='12345634' or EnrollmentNumber ='12345677' or EnrollmentNumber ='12345688'
Select * from tblStudent where Age between 20 and 25
select * from tblStudent where Age>=20 and Age<=25

--usse of wildcard carachacter in sql
--wild card Characters are 
-- % - 0 or more character
-- _(underscore - exactly one character
-- [] any character within the bracket
-- [^] not any character within the bracket
-- -(minus) range of charactor

select * from tblStudent
--Name starts with t
select * from tblStudent where [Roll no] like '3'
select * from tblStudent where [Name] not like '[^t]%'

--Name starts with t or g
select * from tblStudent where [Name] like '[TG]%'

--Name Not start with t or g
select * from tblStudent where [Name] like '[^TG]%'

--Name start with single character r
select * from tblStudent where [Name] like 'r %'

--Name second character should be m
select * from tblStudent where [Name] like '_m%'

--Name with s
select * from tblStudent where [Name] like '%m'

--Name which are starts with abcdefgh
select * from tblStudent where [Name] like '[a-h]%'

--First name strt g and second name starts with w

select * from tblStudent where [Name] like '[g]% [w]%'

--Name Which not contain any space
select * from tblStudent where [Name] not like '% %'

--Name which contain 2 space
select * from tblStudent where [Name] like '% % %'





