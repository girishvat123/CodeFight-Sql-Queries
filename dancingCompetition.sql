CREATE PROCEDURE dancingCompetition()
BEGIN
SET @max1 := (SELECT first_criterion from scores order by first_criterion DESC LIMIT 1);
SET @max2 := (SELECT second_criterion from scores order by second_criterion DESC LIMIT 1);
SET @max3 := (SELECT third_criterion from scores order by third_criterion DESC LIMIT 1);
SET @min1 := (SELECT first_criterion from scores order by first_criterion ASC LIMIT 1);
SET @min2 := (SELECT second_criterion from scores order by second_criterion ASC LIMIT 1);
SET @min3 := (SELECT third_criterion from scores order by third_criterion ASC LIMIT 1);


SELECT S.* FROM (select T1.arbiter_id as id FROM (SELECT arbiter_id, CASE WHEN first_criterion <= @min1 or first_criterion >= @max1 then 1 else 0 end  +
CASE WHEN second_criterion <=@min2 or second_criterion >=@max2 then 1 else 0 END+
CASE WHEN third_criterion <=@min3 or third_criterion >=@max3  then 1 else 0 END  as max_times
                        FROM scores) T1 WHERE T1.max_times<2
) T JOIN scores S on S.arbiter_id=T.id ;

END
