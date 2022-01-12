USE AdventureWorks2019
GO
-- SS10
-- 1:
CREATE VIEW vwProductInfo AS
SELECT ProductID, ProductNumber, Name ,SafetyStockLevel 
FROM Production. Product;
GO

-- 2:
| SELECT * FROM vwProductInfo

-- 3:
CREATE VIEW wwPersonDetails AS
SELECT 
p.Title
,p.[FirstName]
,p.[MiddleName]
,p.[LastName]
,e.[JobTitle]
FROM[HumanResources].[Employee]e
	INNER JOIN [Person].[Person]p
	ON p.[BusinessEntityID] = e.[BusinessEntityID]
GO

-- 4:
| SELECT * FROM vwPersonDetails

-- 5:
CREATE VIEW wwPersonDetailsNew
AS
SELECT 
COALESCE(p.MiddleName,' ')AS  Title
,p.[FirstName]
 ,COALESCE(p.MiddleName,' ')ASMiddleName
 ,p.[LastName]
 ,e.[JobTitle]
 FROM[HumanResources].[Employee]e
	INNER JOIN [Person].[Person]p
	ON p.[BusinessEntityID] = e.[BusinessEntityID]
GO

-- 6:
CREATE VIEW wwSortedPersonDetails AS
SELECT TOP 10 COALESCE(p.Title,'') AS Title
,p.[FirstName]
COALESCE(p.MiddleName,' ')AS  Title
,p.[FirstName]
 ,e.[JobTitle]
 FROM [HumanResources].[Employee] e INNER JOIN [Person].[Person] p
 ON p.[BusinessEntityID] = e.[BusinessEntityID] ORDER BY p.FirstName
 GO
 
 SELECT * FROM  wwSortedPersonDetails

 -- 7:
 CREATE TABLE Employee_Personal_Details(
 EmpID int NOT NULL,
 FirstName varchar(30)NOT NULL,
 lastName varchar(30)NOT NULL, Address
 varchar (30)
 )

 -- 8:
CREATE TABLE Employee_Salary_Details(
EmpID
int NOT NULL,
Designation varchar(30),
Salary int NOT NULL
)
-- 9
CREATE VIEW vwEmployee_Personal_Details
AS
SELECT e1.EmpID, FirstName, LastName, Designation, Salary
FROM Employee_Personal_Details e1
JOIN Employee_Salary_Details e2
ON e1.EmpID=e2.EmpID
-- 10
INSERT INTO vwEmployee_Personal_Details VALUES (2,'Jack','Wilson','Software
Developer',16000)
-- 11
CREATE VIEW vwEmpDetails AS
SELECT FirstName, Address
FROM Employee_Personal_Details
-- 12
INSERT INTO vwEmpDetails VALUES ('Jack', 'NYC')
-- 13
CREATE TABLE Product_Details (
ProductID int, ProductName
varchar(30), Rate money
)
-- 14
CREATE VIEW vwProduct_Details
AS
SELECT ProductName, Rate FROM Product_Details
-- 15
UPDATE vwProduct_Details
SET Rate=3000
WHERE ProductName='DVD Writer'

--16
CREATE VIEW vwProduct_Details
AS
SELECT
ProductName,
Description,
Rate FROM Product_Details

--17
UPDATE vwProduct_Details
SET DESCRIPTION .WRITE(N'Ex',0,2)
WHERE ProductName='PortableHardDrive'

--18
DELETE FROM vwCustDetails WHERE CustID = 'C004'

-- 19
ALTER VIEW vwProductInfo AS
SELECT ProductID, ProductNumber, NAME, SafetyStockLevel, ReOrderPoint
FROM Production.Product;
GO

-- 20
DROP VIEW vwProductInfo

--21
EXEC sp_helptext vwProductPrice


-- 22
CREATE VIEW vwProduct_Details
AS
SELECT
ProductName,
AVG(Rate) AS AverageRate
FROM Product_Details
GROUP BY ProductName

--23
CREATE VIEW vwProductInfo AS
SELECT ProductID, ProductNumber, Name,SafetyStockLevel, ReOderPoint
FROM Production.Product
WHERE SafetyStockLevel<=1000
WITH CHECK OPTION;
GO

-- 24
UPDATE vwProductInfo SET SafetyStockLevel =2500
WHERE ProductID=321

-- 25
create view vwNewProductInfo with schemabinding as 
select ProductID, ProductNumber, Name, SafetyStockLevel 
from Production.Product;
go

-- 26
create table vwCustomers
(
CustID int,
CustName varchar(50),
Address varchar(60)
)

-- 27
create view viewCustomers
as
select * from vwCustomers 

-- 28
select * from vwCustomers

-- 29
alter table vwCustomers ADD Age int

-- 30
select * from vwCustomers

-- 31
EXEC sp_refreshview 'vwCustomers'

-- 32 
alter table Production.Product alter column ProductID varchar(7)

-- SS11
-- 1
USE CUST_DB
CREATE INDEX IX_Country ON Customer_Details(Country);
GO

--2 
USE CUST_DB
CREATE CLUSTERED INDEX IX_CustID ON Customer_Details(CustID)
GO

--3
USE CUST_DB
CREATE NONCLUSTERED INDEX IX_State ON Customer_Details(State)
GO

--4
CREATE NONCLUSTERED COLUMNSTORE INDEX [csindx_ResellerSalesPtnd]
ON [ResellerSalesPtnd]
(
[ProductKey],
[OrderDateKey],
[DueDateKey],
[ShipDateKey],
[CustomerKey],
[EmployeeKey],
[PromotionKey],
[CurrencyKey],
[SalesTerritoryKey],
[SalesOrderNumber],
[SalesOrderLineNumber],
[RevisionNumber],
[OrderQuantity],
[JnitPrice],
[ExtendedAmount],
[UnitPriceDiscountPct],
[DiscountAmount],
[ProductStandardCost],
[TotalProductCost],
[SaleAmount],
[TaxAmt],
[Freight],
[CarrierTrackingNumber],
[CustomerPONumber],
[OrderDate],
[DueDate],
[ShipDate]
);

-- 5
DROP INDEX IX_SuppID ON Supplier_Details
WITH (MOVE TO'default')

--6
DROP INDEX IX_SuooID ON Supplier_Details
WITH(MOVE TO FGCountry)

--7
CREATE PRIMARY XML INDEX PXML_ProductModel_CatalogDescription
ON Production.ProductModel (CatalogDescription);
GO

--8
CREATE INDEX IXML_ProductModel_CatalogDescription_Path
ON Production.ProductModel (CatalogDescription)
USING XML INDEX PXML_ProductModel_CatalogDescription FOR PATH;
GO

--9 
USE CUST_DB
CREATE selective XML INDEX SXI_index
ON BooksBilling(BookDetails)
FOR
(
pathTitle = '/book/title/text()' AS XQuery 'xs:string',
pathAuthors='/book/authors' AS XQUERY 'node()',
pathId='/book/id' AS SQL NVARCHAR(100)
)
GO

--10
ALTER INDEX PXML_DocumentStore ON XML DOCUMENT REBUILD 

--11
DROP INDEX PXML_DocumentStore ON XML DOCUMENT

--12

