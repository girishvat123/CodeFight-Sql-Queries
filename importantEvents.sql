CREATE PROCEDURE importantEvents()
BEGIN
	select* from events order by WEEKDAY(event_date),participants DESC;
END
