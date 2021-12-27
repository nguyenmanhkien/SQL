CREATE DATABASE Map
GO

USE Map
GO

CREATE TABLE Tinh(
	Ma_tinh INT PRIMARY KEY,
	Ten_tinh NVARCHAR(100)
)
GO

CREATE TABLE Huyen(
	Ma_huyen INT PRIMARY KEY,
	Ten_huyen NVARCHAR(100),
	Ma_tinh INT FOREIGN KEY REFERENCES Tinh(Ma_tinh)
)
GO
CREATE TABLE tienich(
	Ma_tienich INT PRIMARY KEY,
	Ten_tienich NVARCHAR(100)
)
GO
CREATE TABLE Coffee(
	Ten_quan NVARCHAR(300) PRIMARY KEY,
	Ma_tinh INT FOREIGN KEY REFERENCES Tinh(Ma_tinh),
	Ma_huyen INT FOREIGN KEY REFERENCES Huyen(Ma_huyen),
	Ma_tienich INT FOREIGN KEY REFERENCES tienich(Ma_tienich)
)
GO
INSERT INTO dbo.Tinh
(
    Ma_tinh,
    Ten_tinh
)
VALUES
(   98,  -- Ma_tinh - int
    N'Bắc Giang' -- Ten_tinh - nvarchar(100)
    )
(   29,  -- Ma_tinh - int
    N'Hà Nội' -- Ten_tinh - nvarchar(100)
    )
SELECT * FROM dbo.Tinh
INSERT INTO dbo.Huyen
(
    Ma_huyen,
    Ten_huyen,
    Ma_tinh
)
VALUES
(   12,   -- Ma_huyen - int
    N'Lục Nam', -- Ten_huyen - nvarchar(100)
    98    -- Ma_tinh - int
    )
(   13,   -- Ma_huyen - int
    N'Lục Ngạn', -- Ten_huyen - nvarchar(100)
    98    -- Ma_tinh - int
    )
(   14,   -- Ma_huyen - int
    N'Yên Thế', -- Ten_huyen - nvarchar(100)
    98    -- Ma_tinh - int
    )
(   15,   -- Ma_huyen - int
    N'Cầu Giấy', -- Ten_huyen - nvarchar(100)
    29    -- Ma_tinh - int
    )
(   16,   -- Ma_huyen - int
    N'Dịch Vọng', -- Ten_huyen - nvarchar(100)
    29    -- Ma_tinh - int
    )
(   17,   -- Ma_huyen - int
    N'Kim Mã', -- Ten_huyen - nvarchar(100)
    29    -- Ma_tinh - int
    )
	SELECT * FROM dbo.Huyen
INSERT INTO dbo.tienich
	(
	    Ma_tienich,
	    Ten_tienich
	)
	VALUES
	(   1,  -- Ma_tienich - int
	    N'Wifi free' -- Ten_tienich - nvarchar(100)
	    )
	(   2,  -- Ma_tienich - int
	    N'Thanh toán bằng thẻ' -- Ten_tienich - nvarchar(100)
	    )
SELECT * FROM dbo.tienich
INSERT INTO dbo.Coffee
(
    Ten_quan,
    Ma_tinh,
    Ma_huyen,
    Ma_tienich
)
VALUES
(   N'Kiên Kt và những người bạn', -- Ten_quan - nvarchar(300)
    98,   -- Ma_tinh - int
    12,   -- Ma_huyen - int
    1    -- Ma_tienich - int
    )
(   N'Kiên Kt và những người anh em', -- Ten_quan - nvarchar(300)
    98,   -- Ma_tinh - int
    13,   -- Ma_huyen - int
    2    -- Ma_tienich - int
    )
(   N'Kiên Kt và những người pằng hữu', -- Ten_quan - nvarchar(300)
    98,   -- Ma_tinh - int
    14,   -- Ma_huyen - int
    2    -- Ma_tienich - int
    )
(   N'Kiên Kt và những huynh đệ', -- Ten_quan - nvarchar(300)
    29,   -- Ma_tinh - int
    15,   -- Ma_huyen - int
    1    -- Ma_tienich - int
    )
(   N'Kiên Kt và những ông trùm', -- Ten_quan - nvarchar(300)
    29,   -- Ma_tinh - int
    16,   -- Ma_huyen - int
    1    -- Ma_tienich - int
    )
(   N'Kiên Kt và những anh em kết nghĩa', -- Ten_quan - nvarchar(300)
    29,   -- Ma_tinh - int
    17,   -- Ma_huyen - int
    2    -- Ma_tienich - int
    )
	SELECT * FROM dbo.Coffee