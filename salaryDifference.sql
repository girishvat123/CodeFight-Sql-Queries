CREATE PROCEDURE salaryDifference()
BEGIN
SET @max := (SELECT salary FROM employees ORDER BY salary desc limit 1);
SET @min := (SELECT salary FROM employees order by salary limit 1 );
SET @countmax := (SELECT COUNT(*) FROM employees where salary=@max);
SET @countmin := (SELECT COUNT(*) FROM employees where salary=@min);

SELECT IFNULL((@max*@countmax)-(@min*@countmin),0) AS difference;
END
