CREATE PROCEDURE dateFormatting()
BEGIN
	select STR_TO_DATE(date_str,'%Y-%m-%d')as date_iso  FROM documents ORDER BY id;
END
