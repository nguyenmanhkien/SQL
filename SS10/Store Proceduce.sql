if exists (select * from sys.databases where name = 'Store_Procedure')
drop database Store_Procedure

CREATE DATABASE Store_Procedure
GO

USE Store_Procedure
GO

CREATE TABLE ToyzUnlimited(
	ProductCode VARCHAR(10) PRIMARY KEY,
	Name VARCHAR(30),
	Category VARCHAR(30),
	Manufacturer VARCHAR(40),
	AgeRange VARCHAR(15),
	UnitPrice MONEY,
	Netweight INT,
	QtyOnHand INT
)
GO

SELECT * FROM ToyzUnlimited
INSERT INTO ToyzUnlimited
(
    ProductCode,
    Name,
    Category,
    Manufacturer,
    AgeRange,
    UnitPrice,
    Netweight,
    QtyOnHand
)
VALUES
(   'MBPL-MB',   -- ProductCode - varchar(5)
    'May bay phan luc',   -- Name - varchar(30)
    'Dieu khien tu xa',   -- Category - varchar(30)
    'Kien Kt',   -- Manufacturer - varchar(40)
    '18',   -- AgeRange - varchar(15)
    NULL, -- UnitPrice - money
    1000,    -- Netweight - int
    100     -- QtyOnHand - int
    ),
(   'MBDD-MB',   -- ProductCode - varchar(5)
    'May bay dan dung',   -- Name - varchar(30)
    'Dieu khien tu xa',   -- Category - varchar(30)
    'Kien Kt',   -- Manufacturer - varchar(40)
    '18',   -- AgeRange - varchar(15)
    NULL, -- UnitPrice - money
    800,    -- Netweight - int
    300     -- QtyOnHand - int
    ),
(   'PC',   -- ProductCode - varchar(5)
    'Porsche',   -- Name - varchar(30)
    'Mo hinh',   -- Category - varchar(30)
    'Luon vui tuoi',   -- Manufacturer - varchar(40)
    '6',   -- AgeRange - varchar(15)
    NULL, -- UnitPrice - money
    500,    -- Netweight - int
    50     -- QtyOnHand - int
    ),
(   'LBGN',   -- ProductCode - varchar(5)
    'Lamborghini',   -- Name - varchar(30)
    'Mo hinh',   -- Category - varchar(30)
    'Luon vui tuoi',   -- Manufacturer - varchar(40)
    '6',   -- AgeRange - varchar(15)
    NULL, -- UnitPrice - money
    700,    -- Netweight - int
    25     -- QtyOnHand - int
    ),
(   'IM-MV',   -- ProductCode - varchar(5)
    'Iron Man',   -- Name - varchar(30)
    'Lego',   -- Category - varchar(30)
    'Marvel',   -- Manufacturer - varchar(40)
    '7',   -- AgeRange - varchar(15)
    NULL, -- UnitPrice - money
    200,    -- Netweight - int
    400     -- QtyOnHand - int
    ),
(   'CP-MV',   -- ProductCode - varchar(5)
    'Captain America',   -- Name - varchar(30)
    'Mo hinh',   -- Category - varchar(30)
    'Marvel',   -- Manufacturer - varchar(40)
    '8',   -- AgeRange - varchar(15)
    NULL, -- UnitPrice - money
    400,    -- Netweight - int
    20     -- QtyOnHand - int
    ),
(   'TF-DC',   -- ProductCode - varchar(5)
    'The Flash',   -- Name - varchar(30)
    'Lego',   -- Category - varchar(30)
    'DC',   -- Manufacturer - varchar(40)
    '5',   -- AgeRange - varchar(15)
    NULL, -- UnitPrice - money
    350,    -- Netweight - int
    50     -- QtyOnHand - int
    ),
(   'SPM-DC',   -- ProductCode - varchar(5)
    'SupperMan',   -- Name - varchar(30)
    'Mo hinh',   -- Category - varchar(30)
    'DC',   -- Manufacturer - varchar(40)
    '7',   -- AgeRange - varchar(15)
    NULL, -- UnitPrice - money
    200,    -- Netweight - int
    400     -- QtyOnHand - int
    ),
(   'M4-Gun',   -- ProductCode - varchar(5)
    'M4A1',   -- Name - varchar(30)
    'Hang nong',   -- Category - varchar(30)
    'Kien Kt',   -- Manufacturer - varchar(40)
    '18',   -- AgeRange - varchar(15)
    NULL, -- UnitPrice - money
    1000,    -- Netweight - int
    70     -- QtyOnHand - int
    ),
(   'AK-Gun',   -- ProductCode - varchar(5)
    'AKM',   -- Name - varchar(30)
    'Hang nong',   -- Category - varchar(30)
    'Kien Kt',   -- Manufacturer - varchar(40)
    '18',   -- AgeRange - varchar(15)
    NULL, -- UnitPrice - money
    1100,    -- Netweight - int
    50     -- QtyOnHand - int
    )

	-- 1
CREATE PROCEDURE HeavyToys
AS
SELECT * FROM dbo.ToyzUnlimited
WHERE Netweight >=40
GO

--3
CREATE PROCEDURE PriceIncrease
AS
UPDATE dbo.ToyzUnlimited
SET UnitPrice += 10
GO

--4
CREATE PROCEDURE QtyOnHand
AS
UPDATE dbo.ToyzUnlimited
SET QtyOnHand -= 5

--5
EXECUTE dbo.HeavyToys
EXECUTE dbo.PriceIncrease
EXECUTE dbo.QtyOnHand