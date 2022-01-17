CREATE DATABASE CityGroup
GO

USE CityGroup
GO

CREATE TABLE Employee(
	EmployeeID INT,
	Name VARCHAR(100),
	Tel CHAR(11),
	Email VARCHAR(30)
)
GO

CREATE TABLE Groupp(
	GroupID INT,
	GroupName VARCHAR(30),
	LeaderID INT,
	ProjectID INT
)
GO

CREATE TABLE Project(
	ProjectID INT,
	ProjectName VARCHAR(30),
	StartDate DATETIME,
	EndDate DATETIME,
	Periodd INT,
	Cost MONEY
)
GO

CREATE TABLE GroupDetail(
	GroupID INT,
	EmployeeID INT,
	Statuss CHAR(20)
)
GO

ALTER TABLE dbo.Employee
ADD PRIMARY KEY (EmployeeID);

ALTER TABLE dbo.Groupp
ADD PRIMARY KEY (GroupID);

ALTER TABLE dbo.Project
ADD FOREIGN KEY (ProjectID) REFERENCES dbo.Groupp(ProjectID);

ALTER TABLE dbo.GroupDetail
ADD FOREIGN KEY (GroupID) REFERENCES dbo.Groupp(GroupID);

ALTER TABLE dbo.GroupDetail
ADD FOREIGN KEY (EmployeeID) REFERENCES dbo.Employee(EmployeeID)
