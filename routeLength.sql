CREATE PROCEDURE routeLength()
BEGIN

 SET @x1 := 0;
 SET @y1 := 0;
 SET @x2 := 0;
 SET @y2 := 0;
SET @ctn := 1;
SET @result := 0;
SET @len := (select count(distinct id) from cities);
WHILE  @ctn < @len DO

SET  @x1 := (select x from cities where id=@ctn);
SET  @y1 := (select y from cities where id=@ctn);
SET @x2 := (select x from cities where id= @ctn+1);
SET  @y2 := (select y from cities where id =@ctn+1);

SET @result := @result +  sqrt( (power((@x2-@x1),2)) +  (power((@y2-@y1),2))  );

SET @ctn := @ctn+1;
END WHILE;

SELECT ROUND(@result,9) AS total;

END
