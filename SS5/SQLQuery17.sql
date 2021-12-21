use cust_DB
alter database cust_DB
add file (name = 'cust_DB1', filename = 'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\cust_DB1.ndf')
to filegroup FG_ReadOnly alter database cust_DB
modify filegroup FG_ReadOnly default