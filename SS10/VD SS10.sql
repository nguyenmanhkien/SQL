USE AdventureWorks2019
GO
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
