USE Salary
GO

CREATE TABLE PhongBan(
	MaPB VARCHAR(7) PRIMARY KEY,
	TenPB NVARCHAR(50)
)
GO

CREATE TABLE NhanVien(
	MaNV VARCHAR(7) PRIMARY KEY,
	TenNV NVARCHAR(50),
	NgaySinh DATETIME,
	SoCMND CHAR(9),
	GioiTinh CHAR(1) DEFAULT 'M',
	DiaChi NVARCHAR(100),
	NgayVaoLam DATETIME CHECK (NgaySinh >= 2001),
	MaPB VARCHAR(7) FOREIGN KEY REFERENCES PhongBan(MaPB)
)
GO
CREATE TABLE LuongDA(
	MaDA VARCHAR(8),
	MaNV VARCHAR(7) FOREIGN KEY,
	NgayNhan DATETIME,
	SoTien MONEY CHECK( SoTien>0),
	PRIMARY KEY (MaDA,MaNV)
);
GO
INSERT INTO dbo.PhongBan
(
    MaPB,
    TenPB
)
VALUES
(   '12A', -- MaPB - varchar(7)
    N'Quản lí' -- TenPB - nvarchar(50)
    )
	(   '12B', -- MaPB - varchar(7)
    N'Kế toán' -- TenPB - nvarchar(50)
    )
	(   '12C', -- MaPB - varchar(7)
    N'Nhân sự' -- TenPB - nvarchar(50)
    )
	(   '12D', -- MaPB - varchar(7)
    N'Kế hoạch' -- TenPB - nvarchar(50)
    )
	(   '12E', -- MaPB - varchar(7)
    N'Phát triển' -- TenPB - nvarchar(50)
    )
	INSERT INTO dbo.NhanVien
	(
	    MaNV,
	    TenNV,
	    NgaySinh,
	    SoCMND,
	    GioiTinh,
	    DiaChi,
	    NgayVaoLam,
	    MaPB
	)
	VALUES
	(   'T1',        -- MaNV - varchar(7)
	    N'Nguyễn Mạnh Kiên',       -- TenNV - nvarchar(50)
	    GETDATE(29-01-2003), -- NgaySinh - datetime
	    '122443377',        -- SoCMND - char(9)
	    'M',        -- GioiTinh - char(1)
	    N'Bắc Giang',       -- DiaChi - nvarchar(100)
	    GETDATE(01-01-2021), -- NgayVaoLam - datetime
	    '12A'         -- MaPB - varchar(7)
	    ),
	(   'T2',        -- MaNV - varchar(7)
	    N'Đinh Quang Anh',       -- TenNV - nvarchar(50)
	    GETDATE(11-8-1999), -- NgaySinh - datetime
	    '123456789',        -- SoCMND - char(9)
	    'F',        -- GioiTinh - char(1)
	    N'Ninh Bình',       -- DiaChi - nvarchar(100)
	    GETDATE(2-2-2019), -- NgayVaoLam - datetime
	    '12E'         -- MaPB - varchar(7)
	    ),
		(   'T3',        -- MaNV - varchar(7)
	    N'Tạ Văn Minh',       -- TenNV - nvarchar(50)
	    GETDATE(26-4-1980), -- NgaySinh - datetime
	    '123456798',        -- SoCMND - char(9)
	    'M',        -- GioiTinh - char(1)
	    N'Thanh Hoá',       -- DiaChi - nvarchar(100)
	    GETDATE(21-12-2003), -- NgayVaoLam - datetime
	    '12B'         -- MaPB - varchar(7)
	    ),
		(   'T4',        -- MaNV - varchar(7)
	    N'Nguyễn Bá Khánh',       -- TenNV - nvarchar(50)
	    GETDATE(23-3-1970), -- NgaySinh - datetime
	    '123456987',        -- SoCMND - char(9)
	    'F',        -- GioiTinh - char(1)
	    N'Hà Nội',       -- DiaChi - nvarchar(100)
	    GETDATE(13-6-2003), -- NgayVaoLam - datetime
	    '12C'         -- MaPB - varchar(7)
	    ),
		(   'T5',        -- MaNV - varchar(7)
	    N'Lương Viết Hoàng',       -- TenNV - nvarchar(50)
	    GETDATE(13-4-1960), -- NgaySinh - datetime
	    '123459876',        -- SoCMND - char(9)
	    'F',        -- GioiTinh - char(1)
	    N'Hà Nội',       -- DiaChi - nvarchar(100)
	    GETDATE(29-1-2004), -- NgayVaoLam - datetime
	    '12D'         -- MaPB - varchar(7)
	    )
INSERT INTO dbo.LuongDA
(
    MaDA,
    MaNV,
    NgayNhan,
    SoTien
)
VALUES
(   'T2109M',        -- MaDA - varchar(8)
    'T1',        -- MaNV - varchar(7)
    GETDATE(12-12-2021), -- NgayNhan - datetime
    NULL       -- SoTien - money
    ),
	(   'T2109A',        -- MaDA - varchar(8)
    'T2',        -- MaNV - varchar(7)
    GETDATE(1-12-2021), -- NgayNhan - datetime
    NULL       -- SoTien - money
    ),
	(   'T2109B',        -- MaDA - varchar(8)
    'T3',        -- MaNV - varchar(7)
    GETDATE(2-12-2021), -- NgayNhan - datetime
    NULL       -- SoTien - money
    ),
	(   'T2109C',        -- MaDA - varchar(8)
    'T4',        -- MaNV - varchar(7)
    GETDATE(12-1-2021), -- NgayNhan - datetime
    NULL       -- SoTien - money
    ),
	(   'T2109D',        -- MaDA - varchar(8)
    'T5',        -- MaNV - varchar(7)
    GETDATE(2-1-2021), -- NgayNhan - datetime
    NULL       -- SoTien - money
    )
-- Query để hiển thị thông tin về các bảng
SELECT *FROM dbo.PhongBan
SELECT *FROM dbo.NhanVien
SELECT *FROM dbo.LuongDA

-- Query để hiển thị những NV có giới tính là F
SELECT * FROM dbo.NhanVien
WHERE GioiTinh LIKE '%F'

--Hiển thị tổng lương của từng nhân viên
