CREATE PROCEDURE mostExpensive()
BEGIN
select name from (select name , price*quantity as total from Products  order by total desc, name asc limit 1) as answer;
END
