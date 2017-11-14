CREATE PROCEDURE alarmClocks()
BEGIN
DROP TABLE IF exists tmp_date;
CREATE TABLE if not exists tmp_date( alarm_date datetime);

SET @start_date := (SELECT input_date from userInput);
SET @end_date := (SELECT YEAR(input_date) from userInput);

while (@start_date) <= @end_date DO
    INSERT INTO tmp_date VALUES(@start_date);
    SET @start_date = date_add(@start_date,INTERVAL 7 DAY);
END WHILE;
select * from tmp_date;

END
