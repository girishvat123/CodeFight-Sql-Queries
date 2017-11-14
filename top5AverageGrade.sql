CREATE PROCEDURE top5AverageGrade()
BEGIN
	SELECT AVG(grade) AS average_grade from students order by grade desc limit 5;
END
