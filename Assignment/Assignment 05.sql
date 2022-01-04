CREATE DATABASE Assignment05
GO

USE Assignment05
GO
 
CREATE TABLE Phonebook(
Namee NVARCHAR(200),
Addresss NVARCHAR(300),
Phone CHAR(20),
Dateofbirth DATETIME
)
GO

INSERT INTO dbo.Phonebook
(
    Namee,
    Addresss,
    Phone,
    Dateofbirth
)
VALUES
(   N'Nguyễn Mạnh Kiên',      -- Namee - nvarchar(200)
    N'Đồi Ngô, Lục Nam, Bắc Giang',      -- Addresss - nvarchar(300)
    '0963398856',       -- Phone - char(20)
    GETDATE(2003-01-29) -- Dateofbirth - datetime
    ),
(   N'Nguyễn Đình Duy',      -- Namee - nvarchar(200)
    N'Nghĩa Phương, Lục Nam, Bắc Giang',      -- Addresss - nvarchar(300)
    '0129382439',       -- Phone - char(20)
    GETDATE(2003-01-15) -- Dateofbirth - datetime
    )
-- Liệt kê danh sách những người trong danh bạ
SELECT * FROM Phonebook

-- Liệt kê danh sách số điện thoại có trong danh bạ
SELECT phone FROM dbo.Phonebook

-- Liệt kê danh sách người trong danh bạ theo thứ thự alphabet.
SELECT * FROM dbo.Phonebook
ORDER BY Namee ASC

-- Liệt kê các số điện thoại của người có thên là Nguyễn Văn An.
SELECT phone FROM dbo.Phonebook
WHERE Namee = 'Nguyễn Mạnh Kiên'

-- Liệt kê những người có ngày sinh là 29/01/2003
SELECT * FROM dbo.Phonebook
WHERE Dateofbirth = '2003-29-01'

-- Hiển thị toàn bộ thông tin về người, của số điện thoại 0963398856
 SELECT * FROM dbo.Phonebook
 WHERE Phone = '0963398856'