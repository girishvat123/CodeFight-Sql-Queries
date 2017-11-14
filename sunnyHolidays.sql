CREATE PROCEDURE sunnyHolidays()
BEGIN
	SELECT holiday_date as ski_date FROM holidays
            WHERE EXISTS

(  SELECT * FROM weather where weather.sunny_date=holidays.holiday_date   );
END
