CREATE DATABASE Assignment03
GO

USE Assignment03
GO

CREATE TABLE Thongtin(
	Namee NVARCHAR(200) PRIMARY KEY,
	CMND INT,
	Addresss NVARCHAR(200),
	Phone INT,
	Typee NVARCHAR(100),
	DK DATE
)
GO
INSERT INTO dbo.Thongtin
(
    Namee,
    CMND,
    Addresss,
    Phone,
    Typee,
    DK
)
VALUES
(   N'Nguyễn Mạnh Kiên',      -- Namee - nvarchar(200)
    122443377,        -- CMND - int
    N'Bắc Giang',      -- Addresss - nvarchar(200)
    0963398856,        -- Phone - int
    N'Trả trước',      -- Typee - nvarchar(100)
    GETDATE() -- DK - date
    ),
(   N'Đinh Quang Anh',      -- Namee - nvarchar(200)
    122453377,        -- CMND - int
    N'Bắc Giang',      -- Addresss - nvarchar(200)
    0963398856,        -- Phone - int
    N'Trả trước',      -- Typee - nvarchar(100)
    GETDATE() -- DK - date
    )
SELECT * FROM dbo.Thongtin
SELECT Phone FROM dbo.Thongtin

-- Hiển thị toàn bộ thông tin của thuê bao có số:0963398856
SELECT * FROM dbo.Thongtin
WHERE Phone = 0963398856

-- Hiển thị thông tin về khách hàng có số CMTND 122443377
SELECT * FROM dbo.Thongtin
WHERE CMND = 122443377

--Liệt kê các thuê bao đăng ký vào ngày 31-12-2021
SELECT * FROM dbo.Thongtin
WHERE DK = '2021-12-31'

-- Tổng số khách hàng của công ty.
SELECT COUNT(namee) FROM dbo.Thongtin

-- Tổng số thuê bao của công ty.
SELECT COUNT(phone) FROM dbo.Thongtin

-- Viết câu lệnh để thay đổi trường ngày đăng ký là not null.
ALTER TABLE dbo.Thongtin
ALTER COLUMN DK datetime NOT NULL
GO

-- Viết câu lệnh để thay đổi trường ngày đăng ký là trước hoặc bằng ngày hiện tại
ALTER TABLE dbo.Thongtin
ADD CONSTRAINT DK CHECK (DK >= getdate())
GO

-- Viết câu lệnh để thay đổi số điện thoại phải bắt đầu 09
ALTER TABLE Thongtin
ADD CONSTRAINT Phone CHECK (Phone LIKE '09%')
GO

--Viết câu lệnh để thêm trường số điểm thưởng cho mỗi số thuê bao.
ALTER TABLE dbo.Thongtin
ADD Point int
GO

-- Đặt chỉ mục (Index) cho cột Tên khách hàng của bảng chứa thông tin khách hàng
CREATE CLUSTERED INDEX IX_Namee
ON Thongtin(Namee)

-- View
CREATE VIEW V_Khachhang AS
SELECT Namee,Addresss
FROM Thongtin
GO
SELECT * FROM V_Khachhang