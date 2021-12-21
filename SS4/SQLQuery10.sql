use AdventureWorks2019
go
select productID from Production.Product
intersect
select productID from Production.WorkOrder;