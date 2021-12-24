CREATE TABLE don_dat_hang(
Madonhang CHAR(5) PRIMARY KEY,
Makhachhang CHAR(20),
Ngaydathang DATE,
Tinhtrangdonhang VARCHAR(30)
)
GO
CREATE TABLE nguoi_dat_hang(
Makhachhang CHAR(20) PRIMARY KEY,
Tenkhachhang VARCHAR(30),
Diachi VARCHAR(50),
Sodienthoai CHAR(20),
CONSTRAINT FOREIGN KEY Makhachhang  REFERENCES don_dat_hang(Makhachhang)
)
GO
INSERT INTO dbo.don_dat_hang
(
    Madonhang,
    Makhachhang,
    Ngaydathang,
    Tinhtrangdonhang
)
VALUES
(   '123',        -- Madonhang - char(5)
    'KT12',        -- Makhachhang - char(20)
    GETDATE(20211204), -- Ngaydathang - date
    'Đã tiếp nhận'         -- Tinhtrangdonhang - varchar(30)
    )

SELECT * FROM don_dat_hang
SELECT * FROM nguoi_dat_hang

