
CREATE PROCEDURE localCalendar()
BEGIN

SELECT e.event_id,CASE WHEN s.hours = '24'

THEN DATE_FORMAT(DATE_ADD(e.date, INTERVAL s.timeshift MINUTE), "%Y-%m-%d %k:%i")
                    WHEN s.hours = '12' THEN DATE_FORMAT(DATE_ADD(e.date, INTERVAL s.timeshift MINUTE), "%Y-%m-%d %h:%i %p")  END as formatted_date

FROM events e  JOIN settings s
 ON s.user_id=e.user_id;


END
