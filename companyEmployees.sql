CREATE PROCEDURE companyEmployees()
BEGIN
	select * from departments,employees order by dep_name,emp_name;
END
