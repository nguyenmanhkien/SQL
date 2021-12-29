USE class
GO

CREATE TABLE StudentId(
	StudentID INT IDENTITY PRIMARY KEY,
	StudentName NVARCHAR(200),

)
GO

CREATE TABLE class_ID(
	Classid INT IDENTITY PRIMARY KEY,
	classname NVARCHAR(200)
)
GO

CREATE TABLE subjects(
	subjectid INT IDENTITY PRIMARY KEY,
	subjectname NVARCHAR(200)
)
GO
CREATE TABLE studentclass(
	StudentID INT FOREIGN KEY REFERENCES StudentId(StudentID),
	Classid INT FOREIGN KEY REFERENCES class_ID(Classid)
)
GO
CREATE TABLE studentsubjects(
	StudentID INT FOREIGN KEY REFERENCES StudentId(StudentID),
	subjectid INT FOREIGN KEY REFERENCES subjects(subjectid)
)
GO
INSERT INTO dbo.StudentId
(
    StudentName
)
VALUES
(N'Nguyễn Mạnh Kiên' -- StudentName - nvarchar(200)
    ),
	(N'Đinh Quang Anh' -- StudentName - nvarchar(200)
    ),
	(N'Vũ Viết Quý' -- StudentName - nvarchar(200)
    ),
	(N'Tạ Duy Linh' -- StudentName - nvarchar(200)
    ),
	(N'Nguyễn Bá Khánh' -- StudentName - nvarchar(200)
    ),
	(N'Tạ Văn Minh' -- StudentName - nvarchar(200)
    ),
	(N'Lươn Viết Hoàng' -- StudentName - nvarchar(200)
    )
INSERT INTO dbo.class_ID
(
    classname
)
VALUES
(N'T2109M' -- classname - nvarchar(200)
    ),
	(N'T2108M' -- classname - nvarchar(200)
    ),
	(N'T2107M' -- classname - nvarchar(200)
    ),
	(N'T2106M' -- classname - nvarchar(200)
    ),
	(N'T2105M' -- classname - nvarchar(200)
    ),
	(N'T2104M' -- classname - nvarchar(200)
    )
INSERT INTO dbo.subjects
(
    subjectname
)
VALUES
(N'CSS' -- subjectname - nvarchar(200)
    ),
	(N'HTML' -- subjectname - nvarchar(200)
    ),
	(N'AngularJS' -- subjectname - nvarchar(200)
    ),
	(N'Javascript' -- subjectname - nvarchar(200)
    ),
	(N'SQL' -- subjectname - nvarchar(200)
    )
INSERT INTO dbo.studentclass
(
    StudentID,
    Classid
)
VALUES
(   2, -- StudentID - int
    3  -- Classid - int
    ),
	(   2, -- StudentID - int
    4  -- Classid - int
    ),
	(   3, -- StudentID - int
    2  -- Classid - int
    ),
	(   4, -- StudentID - int
    3  -- Classid - int
    ),
	(   3, -- StudentID - int
    5  -- Classid - int
    )
INSERT INTO dbo.studentsubjects
(
    StudentID,
    subjectid
)
VALUES
(   3, -- StudentID - int
    2  -- subjectid - int
    ),
	(   3, -- StudentID - int
    1  -- subjectid - int
    ),
	(   1, -- StudentID - int
    2  -- subjectid - int
    ),
	(   1, -- StudentID - int
    1  -- subjectid - int
    ),
	(   2, -- StudentID - int
    3  -- subjectid - int
	),
	(   2, -- StudentID - int
    1  -- subjectid - int
    )
