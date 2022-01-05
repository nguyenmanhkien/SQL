CREATE DATABASE Masterr
GO

USE Masterr
GO

CREATE TABLE Classes (
	ClassID INT IDENTITY,
	ClassName NVARCHAR(10),
	CONSTRAINT PK_Classes PRIMARY KEY(ClassID),
	CONSTRAINT UQ_ClassesClassName UNIQUE(ClassName)
)
CREATE TABLE Students(
	RollNo VARCHAR(6) CONSTRAINT PK_Students PRIMARY KEY,
	FullName NVARCHAR(50) NOT NULL,
	Email VARCHAR(100) CONSTRAINT UQ_StudentsEmail UNIQUE,
	ClassName NVARCHAR(10) CONSTRAINT FK_Students_Classes FOREIGN KEY REFERENCES Classes(ClassName) ON UPDATE CASCADE
)
GO
CREATE INDEX IX_Email ON Students(Email)

-- Taoj bangr Subjects
CREATE TABLE Subjects(
	SubjectID INT,
	SubjectName NVARCHAR(100)
)

-- Tạo chỉ mục Clustered
CREATE CLUSTERED INDEX IX_SubjectID
ON dbo.Subjects(SubjectID)

-- Tạo chỉ mục Nonclustered
CREATE NONCLUSTERED INDEX IX_SubjectName
ON dbo.Subjects(SubjectName)

-- Tạo chỉ mục duy nhất
CREATE UNIQUE INDEX IX_UQ_SubjectName ON dbo.Subjects(SubjectName)

-- Tạo chỉ mục kết hợp
CREATE INDEX IX_Name_Email ON dbo.Students(FullName,Email)

GO

-- Xoá chỉ mục IX_SubjectID
DROP INDEX IX_SubjectID ON dbo.Subjects
GO

-- Tạo chỉ mục IX_SubjectID mới với tuỳ chọn FillFator
CREATE CLUSTERED INDEX IX_SubjectID ON dbo.Subjects(SubjectID) WITH (FILLFACTOR = 60)

-- Xoá chỉ mục IX_SubjectID
DROP INDEX IX_SubjectID ON dbo.Subjects
GO

-- Tạo chỉ mục IX_SubjectID mới với tuỳ chọn PAD_INDEX và FILLFACTOR
CREATE CLUSTERED INDEX IX_SubjectID ON dbo.Subjects(SubjectID) WITH (PAD_INDEX =ON, FILLFACTOR=60)
GO

-- Xem định nghĩa chỉ mục dùng sp_helptext
EXEC sp_helpindex 'Subjects'
-- hoặc
EXECUTE sp_helpindex 'Subjects'
GO

-- Xây dựng lại chỉ mục IX_SubjectName
ALTER INDEX IX_SubjectName ON dbo.Subjects REBUILD

-- Xây dựng lại chỉ mục IX_SubjectName với tuỳ chọn FILLFACTOR
ALTER INDEX IX_SubjectName ON dbo.Subjects REBUILD WITH(FILLFACTOR=60)

-- Vô hiệu hoá chỉ mục IX_SubjectName
ALTER INDEX IX_SubjectName ON dbo.Subjects DISABLE

-- Xây dựng  lại chỉ mục IX_SubjectName tương đương làm cho chỉ mục có hiệu lực
ALTER INDEX IX_SubjectName ON dbo.Subjects REBUILD

-- Làm chỉ mục IX_SubjectName tổ chức lại
ALTER INDEX IX_SubjectName ON dbo.Subjects REORGANIZE

-- Thay đổi chỉ mục IX_SubjectName thành ONLINE chỉ áp dụng trên bản Enterprise
ALTER INDEX IX_SubjectName ON dbo.Subjects REBUILD WITH(ONLINE=ON)

-- Thao tác với chỉ mục song song
ALTER INDEX IX_SubjectName ON dbo.Subjects REBUILD WITH(MAXDOP=4)

-- Chỉ mục với nhiều cột
CREATE INDEX IX_FullName ON dbo.Students(FullName) INCLUDE(Email,ClassName)

-- Truy vấn sau sẽ sử dụng chỉ mục IX_FullName_Include
SELECT FullName, Email, ClassName FROM dbo.Students WHERE FullName LIKE '%a%'

-- Xoá chỉ mục 
DROP INDEX IX_FullName_Include ON dbo.Students

-- Tạo thống kê chỉ mục 
CREATE STATISTICS Statictics_Subjects ON dbo.Subjects(SubjectID)

-- Cập nhật thống kê chỉ mục
UPDATE STATISTICS Subjects Statictics_Subjects

-- Xem thống kê chỉ mục
DBCC SHOW_STATISTICS(Subjects, Statictics_Subjects)