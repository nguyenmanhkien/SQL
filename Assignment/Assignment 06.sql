CREATE DATABASE Assignment06
GO
USE Assignment06
GO

CREATE TABLE Book(
BookID CHAR(20) PRIMARY KEY,
Booktitle NVARCHAR(200),
Author NVARCHAR(200),
YearXB INT
)
GO

CREATE TABLE In4(
Booktitle NVARCHAR(200) FOREIGN KEY REFERENCES Book(Booktitle),
MainContent NVARCHAR(1000),
Editions INT,
NXB NVARCHAR(200),
AddressXB NVARCHAR(200),
Price INT,
Quantily INT,
KindOfBook NVARCHAR(200)
)
GO

INSERT INTO dbo.Book
(
    BookID,
    Booktitle,
    Author,
    YearXB
)
VALUES
(   'K231',  -- BookID - char(20)
    N'Trí tuệ Do Thái', -- Booktitle - nvarchar(200)
    N'Eran Katz', -- Author - nvarchar(200)
    2010    -- YearXB - int
    ),
(   'KT29',  -- BookID - char(20)
    N'Kiên Kt và những người bạn', -- Booktitle - nvarchar(200)
    N'Kiên Kt', -- Author - nvarchar(200)
    2022    -- YearXB - int
    ),
INSERT INTO dbo.In4
(
    Booktitle,
    MainContent,
    Editions,
    NXB,
    AddressXB,
    Price,
    Quantily,
    KindOfBook
)
VALUES
(   N'Trí tuệ Do Thái', -- Booktitle - nvarchar(200)
    N'Bạn có muốn biết: Người Do Thái sáng tạo ra cái gì và nguồn gốc
trí tuệ của họ xuất phát từ đâu không? Cuốn sách này sẽ dần hé lộ
những bí ẩn về sự thông thái của người Do Thái, của một dân tộc
thông tuệ với những phương pháp và kỹ thuật phát triển tầng lớp trí
thức đã được giữ kín hàng nghìn năm như một bí ẩn mật mang tính
văn hóa.', -- MainContent - nvarchar(1000)
    1,   -- Editions - int
    N'Tri Thức', -- NXB - nvarchar(200)
    N'53 Nguyễn Du, Hai Bà Trưng, Hà Nội', -- AddressXB - nvarchar(200)
    79000,   -- Price - int
    100,   -- Quantily - int
    N'Khoa học xã hội'  -- KindOfBook - nvarchar(200)
    ),
(   N'Kiên Kt và những người bạn', -- Booktitle - nvarchar(200)
    N'Cuốn sách kể về câu chuyện của Kiên Kt cùng với những nhười bạn
	vượt qua những bài tập của cô Thi', -- MainContent - nvarchar(1000)
    1,   -- Editions - int
    N'Nguyễn Mạnh Kiên', -- NXB - nvarchar(200)
    N'ĐỒi Ngô - Lục Nam - Bắc Giang', -- AddressXB - nvarchar(200)
    2000000,   -- Price - int
    10,   -- Quantily - int
    N'Tự truyện'  -- KindOfBook - nvarchar(200)
    ),

-- Liệt kê các cuốn sách có năm xuất bản từ 2008 đến nay
SELECT * FROM dbo.Book
WHERE YearXB > 2008

-- Tìm những cuốn sách có tiêu đề chứa từ “tin học”
SELECT * FROM dbo.Book
WHERE Booktitle LIKE '[tin học]'

-- 