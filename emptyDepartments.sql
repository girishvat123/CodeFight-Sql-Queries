CREATE PROCEDURE emptyDepartments()
BEGIN
	SELECT dep_name FROM departments

    WHERE NOT EXISTS (
        SELECT * FROM employees where departments.id=employees.department
    );
END
