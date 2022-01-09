USE AdventureWorks2019
GO

-- Tạo 1 thủ tục lưu trũ lấy ra toàn bộ nhân viên vào làm theo năm có tham số đầu vào là 1 năm
CREATE PROCEDURE sp_DisplayEmployeesHireYear
	@HireYear INT
AS
SELECT * FROM HumanResources.Employee
WHERE DATEPART(YY, HireDate)=@HireYear
GO

-- Để chạy thủ tục này cần phải truyền tham số vào là năm nhân viên vào làm
EXECUTE sp_DisplayEmployeesHireYear 2003
GO

-- Tạo thủ tục lưu trữ đếm số người vào làm trong 1 năm xác định có tham số đầu vào là 1 nă, tham số đầu ra là số người làm trong 1 năm 
CREATE PROCEDURE sp_EmployeesHireYearCount
@HireYear INT,
@Count INT OUTPUT
AS
SELECT @Count=COUNT(*) FROM HumanResources.Employee
WHERE DATEPART(YY, @HireYear)=@HireYear
GO

-- Chạy thủ tục lưu trữ cần phải truyền vào 1 tham số đầu vào và 1 tham số đầu ra
DECLARE @Number INT
EXECUTE sp_EmployeesHireYearCount 2003, @Number OUTPUT
PRINT @Number
GO

-- Tạo thủ tục lưu trữ đếm số người vào làm trong 1 năm xác định có tham số đầu vào là 1 năm, hàm trả về số người vào làm năm đó
CREATE PROCEDURE sp_EmployeesHireYearCount2
	@HireYear INT
AS
DECLARE @Count INT
SELECT @Count=COUNT(*) FROM HumanResources.Employee
WHERE DATEPART(YY, @HireYear)=@HireYear
RETURN @Count
GO

-- Chạy thủ tục lưu trữ thì phải truyền vào 1 tham số đầu và lấy về số người làm trong năm đó
DECLARE @Number INT
EXECUTE @Number = dbo.sp_EmployeesHireYearCount2 2003
PRINT @Number
GO
------------------------------------------------------
-- Tạo bảng tạm student
CREATE TABLE #Students(
	RollNo VARCHAR(6) CONSTRAINT PK_Students PRIMARY KEY,
	FullName NVARCHAR(100),
	Birthday DATETIME CONSTRAINT DF_StudentsBirthday DEFAULT DATEADD(yy, -18,GETDATE())
)
GO

-- tạo thue tục lưu trữ tạm đẻ chèn giữ liệu vào bảng tạm
CREATE PROCEDURE #spInsertStudent
	@rollNo VARCHAR(6),
	@fullName NVARCHAR(100)
	@birthDay DATETIME
AS BEGIN
	IF (@birthDay IS NULL)
		SET @birthDay=DATEADD(YY, -18, GETDATE())
		INSERT INTO #Students
		(
		    RollNo,
		    FullName,
		    Birthday
		)
		VALUES
		(   @rollNo,       -- RollNo - varchar(6)
		    @fullName,      -- FullName - nvarchar(100)
		    @birthDay -- Birthday - datetime
		    )
END
GO

-- Sử dụng thủ tục lưu trữ để chèn dữ liệu vào bảng tạm
EXEC #spStudents 'A12345', 'abc', NULL
EXEC #spStudents 'A54321', 'abc', '12/24/2011'
SELECT * FROM #Students

-- Tạo thủ tực lưu trữ tạm để xoá dữ liệu từ bảng tạm theo RollNo
CREATE PROCEDURE #spDeleteStudents
	@rollNo VARCHAR(6)
AS BEGIN 
	DELETE FROM #Students WHERE RollNo=@rollNo
END

-- Xoá dữ liệu sử dụng thủ tục lưu trữ
EXECUTE #spDeleteStudents 'A12345'
GO

-- Tạo 1 thủ tục lưu trữ sử dụng lệnh RETURN để trả về 1 số nguyên
CREATE PROCEDURE Cal_Square @num INT=0 AS
BEGIN 
	RETURN(@num * @num)
END
GO

-- Chạy thủ tục lưu trữ
DECLARE @square INT;
EXEC @square = Cal_Square 10;
PRINT @square;
GO

----------------------------------------------
-- Xem định nghĩa thủ tục lưu trữ bằng hàm OBJECT_DEFINITION
SELECT OBJECT_DEFINITION(OBJECT_ID('HumanResources.uspUpdateEmployeePersonalInfo')) AS Definition

-- Xem đinh nghĩa thủ tục lưu trữ bằng
SELECT definition FROM sys.sql_modules
WHERE object_id=OBJECT_ID('HumanResources.uspUpdateEmployeePersonalInfo')
GO

-- Thủ tục lưu trữ hệ thống xem các thành phần mà thủ tục lưu trữ phụ thuộc
sp_depends 'HumanResources.uspUpdateEmployeePersonalInfo'
GO

USE AdventureWorks2019
GO

-- Tạo thủ tục lưu trữ sp_DisplayEmployees
CREATE PROCEDURE sp_DisplayEmployees AS
SELECT * FROM HumanResources.Employee
GO

-- Thay đổi thủ tục lưu trữ sp_DisplayEmployees
ALTER PROCEDURE sp_DisplayEmployees AS
SELECT * FROM HumanResources.Employee
WHERE Gender='F'
GO

-- Chạy thủ tục lưu trữ sp_DisplayEmployees
EXEC sp_DisplayEmployees
GO

-- Xoá 1 thủ tục lưu trữ
DROP PROCEDURE dbo.sp_DisplayEmployees
GO


