USE AdventureWorks2019
GO

-- Tạo khung nhìn lấy ra thông tin cưo bản trong bảng Péon.Contact
CREATE VIEW V_Contact_Ìno AS
SELECT FirstName, MiddleName, LastName
FROM Person.Person
GO

-- Tạo khung nhìn lấy ra thông tin từ nhân viên
CREATE VIEW V_Employee_Contact AS
SELECT p.FirstName, p.LastName, e.BusinessEntityID, e.HireDate
FROM HumanResources.Employee e 
JOIN Person.Person AS p ON e.BusinessEntityID * p.BusinessEntityID;
GO

-- Xem 1 khung nhìn
SELECT * FROM dbo.V_Employee_Contact
GO

-- Thay đổi khung nhìn V_Employee_Contact bằng việt thêm cột Birthdate
ALTER VIEW dbo.V_Employee_Contact AS
SELECT p.FirstName, p.LastName, e.BusinessEntityID, e.HireDate
FROM HumanResources.Employee e
JOIN Person.Person AS p ON p.BusinessEntityID = e.BusinessEntityID
WHERE p.FirstName LIKE '%B%'
GO 

-- Xoá 1 khung nhìn
DROP VIEW dbo.V_Contact_Ìno
GO

-- Xem định nghĩa khung nhìn V_Employee_Contact
sp_helptext 'V_Employee_Contact'
GO

-- Xem các thành phần mà khung nhìn phụ thuộc
sp_dêpnds 'V_Employee_Contact'
GO

-- Tạo khung nhìn ẩn mà định nghĩa bị ẩn đi ( Không xem được định nghĩa khung nhìn)
CREATE VIEW OrderRejects
WITH ENCRYPTION
AS
SELECT PurchaseOrderID, ReceivedQty, RejectedQty,
RejectedQty / ReceivedQty AS RejectRatio, DueDate
FROM Purchasing.PurchaseOrderDetail
WHERE RejectedQty / ReceivedQty > 0
AND DueDate > CONVERT(DATETIME,'20010630',101);

-- Không xem được định nghĩa khung nhìn V_Contact_Info
sp_helptext 'OrderRejects'
GO

-- Thay đổi khung nhing tuỳ chọn CHECK OPTION
ALTER VIEW V_Employee_Contact AS
SELECT p.FirstName, p.LastName, e.BusinessEntityID, e.HireDate
FROM HumanResources.Employee e
JOIN Person.Person AS p ON p.BusinessEntityID = e.BusinessEntityID
WHERE p.FirstName LIKE 'A%'
WITH CHECK OPTION 
GO
SELECT * FROM V_Employee_Contact

-- Cập nhật được khung nhìn khi LastName bắt đầu bằng kí tự 'A'
UPDATE V_Employee_Contact SET FirstName = 'Atest' WHERE LastName= 'Amy'

-- Không cập nhật được khung nhìn khi LastName bắt đầu bằng kí tự khác 'A'
UPDATE V_Employee_Contact SET FirstName='BCD' WHERE LastName='Atest'
GO

-- Phải xoá khung nhìn trước
DROP VIEW V_Contact_Info
GO

-- Tạo khung nhìn có giản đồ
CREATE VIEW V_Contact_Info WITH SCHEMABINDING AS
SELECT FirstName, MiddleName, LastName, EmailAddress
FROM Person.Contact
GO

-- Không thể truy vấn được khung nhìn có tên là V_Contact_Info
SELECT * FROM V_Contact_Info
GO

-- Tạo chỉ mục duy nhất trên cột EmailAddress trên khung nhìn V_Contact_Info
CREATE UNIQUE CLUSTERED INDEX IX_Contact_Email
ON V_Contact_Inf(EmailAddress)

-- Thực hiện đổi tên khung nhìn
EXEC sp_rename V_Contact_Info, V_Contact_Infomation

-- Truy vấn khung nhìn
SELECT * FROM V_Contact_Infomation VALUES ('ABC', 'EDF', 'GHI', 'abc@yahoo.com')

-- Không thể xoá bản ghi của khung nhìn V_Contact_Infomation vì bảng Person.Contact còn có các khoá ngoại
DELETE FROM V_Contact_Infomation WHERE LastName='Gilbert' AND FirrstName='Guy'
