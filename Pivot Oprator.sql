

						---------pivot oprator-------


----select Pivot Column do You Want 
----From SourceData
----pivot
----(aggregatefunction(--) for (sourceData ki vo column jisme pivot ke headers hai) in (IND,US,UK)
----Note:-jis table ka pivot bna rhe ho, usme unique column ko apni pivot m na looo

select [Sales Agent],IND,US,UK from  (select [Sales Agent],SalesCountry,SalesAmount from Sheet2$) as myTable
pivot
(sum(SalesAmount) for SalesCountry in ([IND],[US],[UK]))
AS PivotTable--ALIAS NAME
order by [Sales Agent]