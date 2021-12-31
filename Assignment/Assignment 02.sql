CREATE DATABASE Assignment02
GO

USE Assignment02
GO

CREATE TABLE theohang(
	BrandID INT PRIMARY KEY,
	BrandName VARCHAR(20),
	Addresss VARCHAR(40),
	Tel INT
)
GO

CREATE TABLE sanpham(
	ID INT IDENTITY PRIMARY KEY,
	Product NVARCHAR(100),
	ProductDescription NVARCHAR(100),
	Unit VARCHAR(20),
	Price INT,
	Quantily INT,
)
GO

INSERT INTO dbo.theohang
(
    BrandID,
    BrandName,
    Addresss,
    Tel
)
VALUES
(   123,  -- BrandID - int
    'Asus', -- BrandName - varchar(20)
    'USA', -- Addresss - varchar(40)
    983232   -- Tel - int
    )
INSERT INTO dbo.sanpham
(
    Product,
    ProductDescription,
    Unit,
    Price,
    Quantily
)
VALUES
(   N'Máy Tính T450', -- Product - nvarchar(100)
    N'Máy nhập cũ', -- ProductDescription - nvarchar(100)
    'Chiec',  -- Unit - varchar(20)
    1000,   -- Price - int
    10    -- Quantily - int
    ),
(   N'Điện Thoại Nokia5670', -- Product - nvarchar(100)
    N'Điện thoại đang hot', -- ProductDescription - nvarchar(100)
    'Chiec',  -- Unit - varchar(20)
    200,   -- Price - int
    200    -- Quantily - int
    ),
(   N'Máy In Samsung 450', -- Product - nvarchar(100)
    N'Máy in đang loại bình', -- ProductDescription - nvarchar(100)
    'Chiec',  -- Unit - varchar(20)
    100,   -- Price - int
    10    -- Quantily - int
    )
-- Hiển thị các hãng sản xuất và các sản phẩm
SELECT * FROM dbo.theohang
SELECT * FROM dbo.sanpham

-- Liệt kê danh sách hãng ngược vs alphabet của tên
SELECT * FROM dbo.theohang ORDER BY (BrandName)

-- Liệt kê danh sách sản phẩm của cửa hàng theo thứ thự giá giảm dần.
SELECT ID FROM dbo.sanpham ORDER BY (ID) DESC

--Hiển thị thông tin của hãng Asus.
SELECT *FROM dbo.theohang WHERE BrandName LIKE 'Asus'

-- Liệt kê danh sách sản phẩm còn ít hơn 11 chiếc trong kho
SELECT Quantily FROM dbo.sanpham WHERE Quantily < 11

-- Số hãng sản phẩm mà cửa hàng có.
SELECT COUNT(BrandName) FROM dbo.theohang

--Số mặt hàng mà cửa hàng bán.
SELECT COUNT(Product) FROM dbo.sanpham

-- Tổng số đầu sản phẩm của toàn cửa hàng
SELECT COUNT(Quantily) FROM dbo.sanpham

-- Viết câu lệnh để thay đổi trường giá tiền của từng mặt hàng là dương(>0).
ALTER TABLE dbo.sanpham
ADD CONSTRAINT rp_Price CHECK (Price>0)
GO

-- Viết câu lệnh để thay đổi số điện thoại phải bắt đầu bằng 0.
ALTER TABLE dbo.theohang
ADD CONSTRAINT Tel CHECK (Tel LIKE '0%')
GO

