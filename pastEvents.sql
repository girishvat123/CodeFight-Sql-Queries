CREATE PROCEDURE pastEvents()

BEGIN
  SET @var2 = '2017-11-27';
  SET @var2 = (SELECT MAX(event_date) from Events);

  SET @var1= DATE_SUB(@var2 , INTERVAL 7 DAY);

	select name, event_date FROM Events
                 WHERE event_date >= @var1 and event_date < @var2
    ORDER BY event_date DESC;
END
