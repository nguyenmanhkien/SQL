CREATE DATABASE Aptech
GO

USE Aptech
GO

CREATE TABLE Classes(
	ClassName CHAR(6),
	Teacher VARCHAR(30),
	TimeSlot VARCHAR(30),
	Class INT,
	Lab INT 
)
GO
-- 1
CREATE UNIQUE CLUSTERED INDEX MyClusteredIndex ON dbo.Classes(ClassName) WITH (PAD_INDEX=ON, FILLFACTOR=70, IGNORE_DUP_KEY=ON)

-- 2
CREATE NONCLUSTERED INDEX TeacherIndex ON dbo.Classes(Teacher)

-- 3
DROP INDEX TeacherIndex ON dbo.Classes

-- 4
CREATE INDEX ClassLabIndex ON dbo.Classes(Class,Lab)
