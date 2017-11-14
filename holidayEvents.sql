CREATE PROCEDURE holidayEvent()
BEGIN
    SET @rno :=0 ;
	SELECT DISTINCT T1.buyer_name as winners  FROM(SELECT @rno := @rno+1 as rank, buyer_name from purchases  )T1 WHERE T1.rank mod 4=0 order by T1. buyer_name;
END
