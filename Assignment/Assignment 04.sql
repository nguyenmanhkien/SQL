CREATE DATABASE Assignment04
GO

USE Assignment04
GO

CREATE TABLE Phieusp(
	ProductID CHAR(20) PRIMARY KEY,
	DateSX DATE,
	ProductName NVARCHAR(200),
	Product CHAR(20),
	Namee NVARCHAR(200),
	NameID INT,
)
GO

INSERT INTO dbo.Phieusp
(
    ProductID,
    DateSX,
    ProductName,
    Product,
    Namee,
    NameID
)
VALUES
(   'Z37 111111',        -- ProductID - char(20)
    GETDATE(1-1-2020), -- DateSX - date
    N'Máy tnhs sách tay Z37',       -- ProductName - nvarchar(200)
    'Z37E',        -- Product - char(20)
    N'Nguyễn Văn An',       -- Namee - nvarchar(200)
    987688          -- NameID - int
    ),
	(   'KT123',        -- ProductID - char(20)
    GETDATE(1-5-2020), -- DateSX - date
    N'Máy nghe nhạc',       -- ProductName - nvarchar(200)
    'X300',        -- Product - char(20)
    N'Nguyễn Mạnh Kiên',       -- Namee - nvarchar(200)
    20034          -- NameID - int
    )
-- Liệt kê danh sách sản phẩm của công ty.
SELECT Product FROM Phieusp 

-- Liệt kê danh sách loại sản phẩm của công ty theo thứ tự tăng dần của tên
SELECT ProductNameroduct FROM dbo.Phieusp ORDER BY (ProductName) ASC

-- Liệt kê danh sách người chịu trách nhiệm của công ty theo thứ tự tăng dần của tên.
SELECT Namee FROM dbo.Phieusp ORDER BY (Namee) ASC

--Liệt kê các sản phẩm của loại sản phẩm có mã số là Z37E.
SELECT * FROM Phieusp
WHERE ProductID = 'KT123'

-- Số sản phẩm của từng loại sản phẩm.
SELECT COUNT(*) FROM dbo.Phieusp
WHERE ProductID > 0


