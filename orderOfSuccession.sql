CREATE PROCEDURE orderOfSuccession()
BEGIN
	SELECT CASE WHEN gender='M' then CONCAT('King',' ',name) else concat('Queen',' ',name) END AS name  FROM Successors order by birthday  ;

END
