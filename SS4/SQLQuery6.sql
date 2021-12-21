if DATENAME(weekday, GETDATE()) in (N'Saturday', N'Sunday')
	select 'It is a weekend';
else
	select 'It is weekday';