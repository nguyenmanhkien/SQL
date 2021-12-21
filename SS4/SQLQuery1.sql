use AdventureWorks2019
select SalesPersonID, YEAR(OrderDate) as orderYear from Sales.SalesOrderHeader
where CustomerID = 30084
group by SalesPersonID, YEAR(OrderDate)
having COUNT(*) > 1
order by SalesPersonID, orderYear