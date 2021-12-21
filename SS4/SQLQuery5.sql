use AdventureWorks2019
select SalesOrderID, CustomerID, SalesPersonID, TerritoryID,
YEAR(OrderDate) as currentYear, YEAR(OrderDate) + 1 as nextYear 
from Sales.SalesOrderHeader