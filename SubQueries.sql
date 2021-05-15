/*
	SubQuery/ Inner Query- the query inside another query or the query nested inside Insert, update, delete or select statement.
	The query containing sub-query is called outer query.

	Non-Correlated Subqueries:-	
	Many Transact-SQL statements, the subquery can be evaluated as if it were an independent query. Conceptually, the subquery results are substituted into the outer query.
	Many queries can be evaluated by executing the subquery once and substituting the resulting value or values into the WHERE clause of the outer query.

	Correlated Subqueries/ repeating subqueries:-
	Subqueries that depends on outer query for its values are called correlated subqueries. Means correlated subquery executed repeatedly, once for 
	each row that selected by outer query.
	Correlated subqueries can also include table-valued functions in the FROM clause by referencing columns from a table in the outer query as an argument of the table-valued function. In this case, for each row of the outer query, the table-valued function is evaluated according to the subquery.

SubQuery Rules :-
	1.		Subqueries must be enclosed within parenthesis.
	2.		Subquery must include a regular SELECT Statement and the FROM Clause and optionally WHERE, GROUP, HAVING clause.
	3.		The ntext, text, and image data types cannot be used in the select list of subqueries.
	4.		The DISTINCT keyword cannot be used with subqueries that include GROUP BY.
	5.		The COMPUTE and INTO clauses cannot be specified.
	6.		ORDER BY can only be specified when TOP is also specified.
	7.		A view created by using a subquery cannot be updated.
	8.		The select list of a subquery introduced with EXISTS, by convention, has an asterisk (*) instead of a single column name. The rules for a subquery introduced with EXISTS are the same as those for a standard select list, because a subquery introduced with EXISTS creates an existence test and returns TRUE or FALSE, instead of data.
	9.		If a table appears only in a subquery and not in the outer query, then columns from that table cannot be included in the output (the select list of the outer query).
	10.		If a column is referenced in a subquery that does not exist in the table referenced by the subquery's FROM clause, but exists in a table referenced by the outer query's FROM clause, the query executes without error. SQL Server implicitly qualifies the column in the subquery with the table name in the outer query.

	11.		A subquery can be nested inside the WHERE or HAVING clause of an outer SELECT, INSERT, UPDATE, or DELETE statement, or inside another subquery (upto 32 level of nesting is possible).
				If the WHERE clause of an outer query includes a column name, it must be join-compatible with the column in the subquery select list.
				As comparison operator return a single value, subqueries introduced by an unmodified comparison operator (one not followed by the keyword ANY or ALL) cannot include GROUP BY and HAVING clauses.
				The select list of a subquery introduced in a comparison operator of outer query , can include only one expression or column name (except that EXISTS and IN operate on SELECT * or a list, respectively).
	12.		A subquery can appear anywhere an expression can be used, if it returns a single value.
			Eg.:-
				SELECT Ord.SalesOrderID, Ord.OrderDate,
					(SELECT MAX(OrdDet.UnitPrice)
						FROM Sales.SalesOrderDetail AS OrdDet
						WHERE Ord.SalesOrderID = OrdDet.SalesOrderID) AS MaxUnitPrice
						FROM Sales.SalesOrderHeader AS Ord;


SubQueries as Joins:-
	Many Transact-SQL Statements that include subqueries can be formulated as joins. ( there is no performance difference between statement that includes
	subquery and semantically equivalent version that does not . But in some came where existance must be checked , join yields better performance. Otherwise
	the nested query must be processed for each result of outer query to ensure elimination of duplicates. so, join is better approach.


	*/
use NoblePUblicSchool
	create table #Production
	(
		name nvarchar(100),
		price int
	)
select * from #production
insert into #Production values 
('Bolt',1)	,('Keel',5), ('PechKas',30),('Tester',25)

SELECT Prd1.Name
FROM #Production AS Prd1
     JOIN #Production AS Prd2
       ON (Prd1.price= Prd2.price)
WHERE Prd2.Name = 'Keel';

--correlated sub query
SELECT DISTINCT c.LastName, c.FirstName, e.BusinessEntityID 
FROM Person.Person AS c JOIN HumanResources.Employee AS e
ON e.BusinessEntityID = c.BusinessEntityID 
WHERE 5000.00 IN
    (SELECT Bonus
    FROM Sales.SalesPerson sp
    WHERE e.BusinessEntityID = sp.BusinessEntityID)


--subqueries with In
SELECT Name
FROM Production.Product
WHERE ProductSubcategoryID IN
    (SELECT ProductSubcategoryID
     FROM Production.ProductSubcategory
     WHERE Name = 'Wheels');



SELECT Name
FROM Purchasing.Vendor
WHERE CreditRating = 1
AND BusinessEntityID IN
    (SELECT BusinessEntityID
     FROM Purchasing.ProductVendor
     WHERE MinOrderQty >= 20
     AND AverageLeadTime < 16);


SELECT DISTINCT Name
FROM Purchasing.Vendor v
INNER JOIN Purchasing.ProductVendor p
ON v.BusinessEntityID = p.BusinessEntityID
WHERE CreditRating = 1
  AND MinOrderQty >= 20
  AND AverageLeadTime < 16;



--subquery update
UPDATE Production.Product
SET ListPrice = ListPrice * 2
WHERE ProductID IN
    (SELECT ProductID 
     FROM Purchasing.ProductVendor
     WHERE BusinessEntityID = 1540);

UPDATE Production.Product
SET ListPrice = ListPrice * 2
FROM Production.Product AS p
INNER JOIN Purchasing.ProductVendor AS pv
    ON p.ProductID = pv.ProductID AND BusinessEntityID = 1540;


--subqueries with comparison
SELECT CustomerID
FROM Sales.Customer
WHERE TerritoryID =
    (SELECT TerritoryID
     FROM Sales.SalesPerson
     WHERE BusinessEntityID = 276);

SELECT Name
FROM Production.Product
WHERE ListPrice >
    (SELECT AVG (ListPrice)
     FROM Production.Product);

--Because subqueries introduced with unmodified comparison operators must return a single value, they cannot include GROUP BY or HAVING clauses unless you know the GROUP BY or HAVING clause itself returns a single value. 
SELECT Name
FROM Production.Product
WHERE ListPrice >
    (SELECT MIN (ListPrice)
     FROM Production.Product
     GROUP BY ProductSubcategoryID
     HAVING ProductSubcategoryID = 14);


--comparion operators modified by any, some and all.
SELECT Name
FROM Production.Product
WHERE ListPrice >= ANY
    (SELECT MAX (ListPrice)
     FROM Production.Product
     GROUP BY ProductSubcategoryID);


--Using =ANY
USE AdventureWorks2016;
GO
SELECT Name
FROM Production.Product
WHERE ProductSubcategoryID =ANY
    (SELECT ProductSubcategoryID
     FROM Production.ProductSubcategory
     WHERE Name = 'Wheels');


SELECT CustomerID
FROM Sales.Customer
WHERE TerritoryID <> ANY
    (SELECT TerritoryID
     FROM Sales.SalesPerson);

--subquereis with exists keyword
SELECT Name
FROM Production.Product
WHERE ProductSubcategoryID IN
    (SELECT ProductSubcategoryID
     FROM Production.ProductSubcategory
     WHERE Name = 'Wheels');

SELECT Name
FROM Production.Product
WHERE EXISTS
    (SELECT * 
     FROM Production.ProductSubcategory
     WHERE ProductSubcategoryID = 
            Production.Product.ProductSubcategoryID
        AND Name = 'Wheels');

--subqueries with not exists
SELECT Name
FROM Production.Product
WHERE NOT EXISTS
    (SELECT * 
     FROM Production.ProductSubcategory
     WHERE ProductSubcategoryID = 
            Production.Product.ProductSubcategoryID
        AND Name = 'Wheels');
--subqueries in place of expression
SELECT Name, ListPrice, 
(SELECT AVG(ListPrice) FROM Production.Product) AS Average, 
    ListPrice - (SELECT AVG(ListPrice) FROM Production.Product)
    AS Difference
FROM Production.Product
WHERE ProductSubcategoryID = 1;