 
 ------sub quriess--------

 select * from product_Sold
 select * from Product_details

 --Question 1)getting those details from table which are not matching in other table in common column 
 
 --Using subquery
 select * from product_details where id not in (select ProductId from product_Sold) 
 
 --Using Join
 select product_details.id,ProductName,[Description]
 from product_details
 left join product_Sold
 on product_details.id=product_sold.ProductID
 where product_sold.ProductID is null
 
 --Question 2) Get Total Solditem which are matching in other table
 
 --using correlated quary
 SELECT * FROM (select ProductName, (select sum(QuantitySold) from product_Sold where ProductID=product_details.id) as TotalQuantity from product_details)
 as mytable where Totalquantity is not null
 
 --using join 
 select ProductName, sum(QuantitySold) from product_details left join product_Sold
 on product_details.id=product_Sold.ProductID
 group by ProductName







  