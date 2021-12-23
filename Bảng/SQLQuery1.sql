-- Kiểm tra xem đã có CSDL QuickTest1 chưa, nếu có thì xoá đi
if exists (select * from sys.databases where name = 'QuickTest1')
	drop database QuickTest1
go
-- Tạo lại CSDL QuickTest1
create database QuickTest1
go
-- Sử dụng CSDL QuickTest1
use QuickTest1
go
-- Tạo bảng Student
create table Student(
	StudentName nvarchar(50),
	Age int,
	DateOfBirth date,
)
go
		-- Thêm, Sửa, Xoá dữ liệu trong bảng Student
-- Thêm
insert into Student(StudentName, Age, DateOfBirth)
	values
		(N'Nguyễn Mạnh Kiên', 18, '20030129')
go
-- Sửa
update Student set DateOfBirth = '20030129' where StudentName = N'Nguyễn Mạnh Kiên'
go
-- Xoá
delete from Student where StudentName = N'Nguyễn Mạnh Kiên'
go 
-- Sửa bảng Student, thêm StudentID và tạo ràng buộc khoá chính cho nó
alter table Student
	add StudentID varchar(20) primary key
go
-- tạo bảng lớp học
create table Class (
	ClassID varchar(10) primary key,
	ClassName varchar(20)
)
go
-- Tạo ràng buộc cho cột ClassID ở bảng Student tới cột ClassID ở bảng Class. 
-- Vì em chưa tạo cột ClassID ở bảng Student nên em phải tạo nó trước
alter table Student
	add ClassID varchar(10)
alter table Student
	add constraint fk_Student_ClassID foreign key (ClassID) references Class(ClassID)
-- Thêm các dữ liệu vào bảng các Student, Class
go
insert into Class(ClassID, ClassName)
	values
		('T09', 'T2109'),
		('T08', 'T2108')
insert into Student(StudentName, Age, DateOfBirth, ClassID, StudentID)
	values
		(N'Nguyễn Mạnh Kiên', 18, '20030129', 'T09', 'TH005'),
		(N'Vũ Viết Quý', 18, '20031210', 'T09', 'TH013'),
		(N'Đinh Quang Anh', 22, '19990811', 'T08', 'TH006')
go
select * from Student
select * from Class