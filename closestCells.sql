CREATE PROCEDURE closestCells()
BEGIN
SET @x1 := 0;
SET @y1 := 0;
SET @x2 := 0;
SET @y2 := 0;
SELECT t2.id1 , t2.id2  FROM (SELECT T1.id1, T1.id2,T1.x1,T1.y1,T1.x2,T1.y2,
SQRT( (POWER((x2-x1),2)) + (POWER((y2-y1),2)) ) as distance
FROM
(
select p1.id as id1 , p2.id as id2 ,
p1.x as x1, p1.y as y1, p2.x as x2 ,p2.y as y2
from positions p1 , positions p2 WHERE  p1.id!=p2.id)T1
)t2
JOIN positions p on p.id=t2.id1  ;



END
