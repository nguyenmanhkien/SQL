-- Bảng đơn hàng
CREATE TABLE dondathang(
Madonhang VARCHAR(50) int PRIMARY KEY,
Makhachhang VARCHAR(100),
Ngaydathang DATE,
Tinhtrangdonhang NVARCHAR(100)
)
GO
-- Thông tin của sản phẩm
CREATE TABLE thongtinhang(
Madonhang VARCHAR(100),
Tenhang VARCHAR(100),
Donvi INT,
Gia INT,
Soluong INT
)
-- Thông tin người đặt hàng
CREATE TABLE nguoidathang(
Makhachhang CHAR(100) FOREIGN KEY REFERENCES dondathang(Makhachhang),
Tenkhachhang NVARCHAR(100),
Diachi VARCHAR(200),
Sodienthoai VARCHAR(100)
)
GO
CREATE TABLE Chitietdonhang (
Makhachhang VARCHAR(100) FOREIGN KEY REFERENCES dondathang(Makhachhang),
Madonhang VARCHAR(100) FOREIGN KEY REFERENCES thongtinhang(Madonhang),
Gia MONEY,
Soluong int
)
INSERT INTO dbo.dondathang
(
    Madonhang,
    Makhachhang,
    Ngaydathang,
    Tinhtrangdonhang
)
VALUES
(   'IP12',        -- Madonhang - varchar(50)
    'KT2003',        -- Makhachhang - varchar(50)
    GETDATE(), -- Ngaydathang - date
    N'Đã tiếp nhận'        -- Tinhtrangdonhang - nvarchar(30)
    )
	INSERT INTO dbo.thongtinhang
	(
	    Madonhang,
	    Tenhang,
	    Donvi,
	    Gia,
	    Soluong
	)
	VALUES
	(   'IP12', -- Madonhang - varchar(50)
	    'IP12pr', -- Tenhang - varchar(100)
	    'cái',  -- Donvi - int
	    12000000,  -- Gia - int
	    2   -- Soluong - int
	    )