CREATE DATABASE AZBank
GO

USE AZBank
GO

CREATE TABLE Customer(
	CustomerID INT PRIMARY KEY,
	Name NVARCHAR(50),
	City NVARCHAR(50) NULL,
	Country NVARCHAR(50) NULL,
	Phonne NVARCHAR(15) NULL,
	Email NVARCHAR(50) NULL
)
GO

CREATE TABLE CustomerAccount(
	AccountNumber CHAR(9),
	CustomerID INT,
	Balance MONEY,
	MinAccount MONEY NULL,
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
)
GO
CREATE TABLE CustomerTransaction(
	TransactionID INT PRIMARY KEY,
	AccountNumber CHAR(9) NULL,
	TransactionDate SMALLDATETIME NULL,
	Amount MONEY NULL,
	DpositorWithdraw BIT NULL,
	FOREIGN KEY (AccountNumber) REFERENCES CustomerAccount(AccountNumber)
)
GO

INSERT INTO Customer
(
    CustomerID,
    Name,
    City,
    Country,
    Phonne,
    Email
)
VALUES
(   1,   -- CustomerID - int
    N'Nguyễn Kiên', -- Name - nvarchar(50)
    N'Bắc Giang', -- City - nvarchar(50)
    N'Việt Nam', -- Country - nvarchar(50)
    N'09633988556', -- Phonne - nvarchar(15)
    N'Kien123@gmail.com'  -- Email - nvarchar(50)
    ),
(   2,   -- CustomerID - int
    N'Quang Anh', -- Name - nvarchar(50)
    N'Hà Nội', -- City - nvarchar(50)
    N'Việt Nam', -- Country - nvarchar(50)
    N'0523448924', -- Phonne - nvarchar(15)
    N'Qanh@gmail.com'  -- Email - nvarchar(50)
    ),
(   3,   -- CustomerID - int
    N'Vũ Quý', -- Name - nvarchar(50)
    N'New York', -- City - nvarchar(50)
    N'Mỹ', -- Country - nvarchar(50)
    N'0359560031', -- Phonne - nvarchar(15)
    N'Bkhanh@gmail.com'  -- Email - nvarchar(50)
    )

INSERT INTO dbo.CustomerAccount
(
    AccountNumber,
    CustomerID,
    Balance,
    MinAccount
)
VALUES
(   '1021',   -- AccountNumber - char(9)
    1,    -- CustomerID - int
    1000, -- Balance - money
    10000  -- MinAccount - money
    ),
(   '1022',   -- AccountNumber - char(9)
    2,    -- CustomerID - int
    10, -- Balance - money
    100  -- MinAccount - money
    ),
(   '1023',   -- AccountNumber - char(9)
    3,    -- CustomerID - int
    1, -- Balance - money
    10  -- MinAccount - money
    )

INSERT INTO dbo.CustomerTransaction
(
    TransactionID,
    AccountNumber,
    TransactionDate,
    Amount,
    DpositorWithdraw
)
VALUES
(   2,                     -- TransactionID - int
    '1021',                    -- AccountNumber - char(9)
    '2022-01-17 01:54:44', -- TransactionDate - smalldatetime
    34,                  -- Amount - money
    0                  -- DpositorWithdraw - bit
    ),
(   3,                     -- TransactionID - int
    '1022',                    -- AccountNumber - char(9)
    '2022-01-17 01:55:44', -- TransactionDate - smalldatetime
    12,                  -- Amount - money
    1                  -- DpositorWithdraw - bit
    ),
(   4,                     -- TransactionID - int
    '1023',                    -- AccountNumber - char(9)
    '2022-01-17 01:56:44', -- TransactionDate - smalldatetime
    1,                  -- Amount - money
    0                  -- DpositorWithdraw - bit
    )
--4
SELECT City FROM Customer
WHERE City = "Hà Nội";
--5
SELECT Name, Phonne, Email FROM Customer

SELECT AccountNumber, Balance FROM CustomerAccount 
--6
ALTER TABLE CustomerTransaction
ADD CONSTRAINT Amount_check
CHECK (Amount > 0 AND Amount <= 1000000)
--7
CREATE VIEW vCustomerTransactions 
AS
SELECT Name, CustomerAccount.AccountNumber, CustomerTransaction.TransactionDate, CustomerTransaction.Amount,
		CustomerTransaction.DepositorWithdraw FROM Customer
JOIN CustomerAccount
ON CustomerAccount.CustomerID = Customer.CustomerID
JOIN CustomerTransaction
ON CustomerTransaction.AccountNumber = CustomerAccount.AccountNumber
