USE Aptech
GO

CREATE TABLE Class(
	 ClassCode varchar(10) PRIMARY KEY,
	 HeadTeacher varchar(30),
	 Room varchar(30),
	 Timeslot CHAR,
	 CloseDate Datetime
)
GO

CREATE TABLE Student(
	RollNo VARCHAR(10),
	ClassCode VARCHAR(10) FOREIGN KEY REFERENCES Class(ClassCode),
	FullName VARCHAR(30),
	Male BIT,
	BirthDate DATETIME,
	Address VARCHAR(30),
	Provice CHAR(2),
	Email VARCHAR(30)
)
GO

CREATE TABLE Subjects(
	SubjectCode VARCHAR(10),
	SubjectName VARCHAR(40),
	WMark BIT,
	PMark BIT,
	WTest_per INT,
	PTest_per INT
)
GO

CREATE TABLE Mark(
	RollNo VARCHAR(10) FOREIGN KEY REFERENCES dbo.Student(RollNo),
	SubjectCode VARCHAR(10) FOREIGN KEY REFERENCES dbo.Subjects(SubjectCode),
	WMark FLOAT,
	PMark FLOAT,
	Mark FLOAT
)
GO

-- 1
INSERT INTO dbo.Class
(
    ClassCode,
    HeadTeacher,
    Room,
    Timeslot,
    CloseDate
)
VALUES
(   'KT03',       -- ClassCode - varchar(10)
    'Dang Kim Thi',       -- HeadTeacher - varchar(30)
    'T2109M',       -- Room - varchar(30)
    'G',       -- Timeslot - char(1)
    GETDATE(2021-12-21) -- CloseDate - datetime
    ),
(   'KT02',       -- ClassCode - varchar(10)
    'Dinh Van Thanh Phuoc Khoa',       -- HeadTeacher - varchar(30)
    'PUBG',       -- Room - varchar(30)
    'L',       -- Timeslot - char(1)
    GETDATE(2021-08-09) -- CloseDate - datetime
    ),
(   'KT01',       -- ClassCode - varchar(10)
    'Nguyen Manh Kien',       -- HeadTeacher - varchar(30)
    'AOV',       -- Room - varchar(30)
    'I',       -- Timeslot - char(1)
    GETDATE(2021-01-29) -- CloseDate - datetime
    ),
(   'KT00',       -- ClassCode - varchar(10)
    'Dinh Quang Anh',       -- HeadTeacher - varchar(30)
    'T2109A',       -- Room - varchar(30)
    'I',       -- Timeslot - char(1)
    GETDATE(2021-02-21) -- CloseDate - datetime
    ),
(   'KT04',       -- ClassCode - varchar(10)
    'Nguyen Dinh Duy',       -- HeadTeacher - varchar(30)
    'T2108M',       -- Room - varchar(30)
    'M',       -- Timeslot - char(1)
    GETDATE(2021-12-01) -- CloseDate - datetime
    )
INSERT INTO dbo.Student
(
    RollNo,
    ClassCode,
    FullName,
    Male,
    BirthDate,
    Address,
    Provice,
    Email
)
VALUES
(   'QUY2003',        -- RollNo - varchar(10)
    'KT01',        -- ClassCode - varchar(10)
    'Vu Viet Quy',        -- FullName - varchar(30)
    NULL,      -- Male - bit
    GETDATE(2003-01-29), -- BirthDate - datetime
    'Thai Binh',        -- Address - varchar(30)
    'TB',        -- Provice - char(2)
    'Vuvietquy@gmail.com'         -- Email - varchar(30)
    ),
(   'LINH2003',        -- RollNo - varchar(10)
    'KT01',        -- ClassCode - varchar(10)
    'Ta Duy Linh',        -- FullName - varchar(30)
    NULL,      -- Male - bit
    GETDATE(2003-12-31), -- BirthDate - datetime
    'Thai Nguyen',        -- Address - varchar(30)
    'TN',        -- Provice - char(2)
    'Taduylinh@gmail.com'         -- Email - varchar(30)
    ),
(   'QAnh1999',        -- RollNo - varchar(10)
    'KT03',        -- ClassCode - varchar(10)
    'Dinh Quang Anh',        -- FullName - varchar(30)
    NULL,      -- Male - bit
    GETDATE(1999-01-01), -- BirthDate - datetime
    'Ninh Binh',        -- Address - varchar(30)
    'NB',        -- Provice - char(2)
    'Dinhquanganh@gmail.com'         -- Email - varchar(30)
    ),
(   'KIEN2003',        -- RollNo - varchar(10)
    'KT02',        -- ClassCode - varchar(10)
    'Nguyen Manh Kien',        -- FullName - varchar(30)
    NULL,      -- Male - bit
    GETDATE(2003-01-29), -- BirthDate - datetime
    'Bac Giang',        -- Address - varchar(30)
    'BG',        -- Provice - char(2)
    'Nguyenmanhkien@gmail.com'         -- Email - varchar(30)
    ),
(   'NHAT2003',        -- RollNo - varchar(10)
    'KT04',        -- ClassCode - varchar(10)
    'Nguyen Tien Nhat',        -- FullName - varchar(30)
    NULL,      -- Male - bit
    GETDATE(2003-05-24), -- BirthDate - datetime
    'Bac Giang',        -- Address - varchar(30)
    'BG',        -- Provice - char(2)
    'Nguyentiennhat@gmail.com'         -- Email - varchar(30)
    )

INSERT INTO dbo.Subjects
(
    SubjectCode,
    SubjectName,
    WMark,
    PMark,
    WTest_per,
    PTest_per
)
VALUES
(   'JAVA',   -- SubjectCode - varchar(10)
    'Javascript',   -- SubjectName - varchar(40)
    NULL, -- WMark - bit
    NULL, -- PMark - bit
    2,    -- WTest_per - int
    3     -- PTest_per - int
    ),
(   'C',   -- SubjectCode - varchar(10)
    'Ngon ngu C',   -- SubjectName - varchar(40)
    NULL, -- WMark - bit
    NULL, -- PMark - bit
    1,    -- WTest_per - int
    2     -- PTest_per - int
    ),
(   'HTML',   -- SubjectCode - varchar(10)
    'HTML',   -- SubjectName - varchar(40)
    NULL, -- WMark - bit
    NULL, -- PMark - bit
    2,    -- WTest_per - int
    3     -- PTest_per - int
    ),
(   'CSS',   -- SubjectCode - varchar(10)
    'CSS',   -- SubjectName - varchar(40)
    NULL, -- WMark - bit
    NULL, -- PMark - bit
    3,    -- WTest_per - int
    4     -- PTest_per - int
    ),
(   'AngularJS',   -- SubjectCode - varchar(10)
    'AngularJS',   -- SubjectName - varchar(40)
    NULL, -- WMark - bit
    NULL, -- PMark - bit
    1,    -- WTest_per - int
    2     -- PTest_per - int
    )

INSERT INTO dbo.Mark
(
    RollNo,
    SubjectCode,
    WMark,
    PMark,
    Mark
)
VALUES
(   'KIEN2003',  -- RollNo - varchar(10)
    'JAVA',  -- SubjectCode - varchar(10)
    10.0, -- WMark - float
    10.0, -- PMark - float
    10.0  -- Mark - float
    ),
(   'QUY2003',  -- RollNo - varchar(10)
    'CSS',  -- SubjectCode - varchar(10)
    3.0, -- WMark - float
    4.0, -- PMark - float
    5.0  -- Mark - float
    ),
(   'LINH2003',  -- RollNo - varchar(10)
    'HTML',  -- SubjectCode - varchar(10)
    1.0, -- WMark - float
    1.0, -- PMark - float
    0.05  -- Mark - float
    ),
(   'QANH1999',  -- RollNo - varchar(10)
    'C',  -- SubjectCode - varchar(10)
    10.0, -- WMark - float
    10.0, -- PMark - float
    10.0  -- Mark - float
    ),
(   'NHAT2003',  -- RollNo - varchar(10)
    'AngularJS',  -- SubjectCode - varchar(10)
    9.0, -- WMark - float
    8.0, -- PMark - float
    10.0  -- Mark - float
    )

-- Tạo một khung nhìn chứa danh sách các sinh viên đã có ít nhất 2 bài thi (2 môn học khác nhau).
CREATE VIEW V_Student AS
SELECT FullName, Address
FROM Student
GO