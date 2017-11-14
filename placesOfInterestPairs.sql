CREATE PROCEDURE placesOfInterestPairs()
BEGIN

select T1.place1 ,T1.place2 from (SELECT s1.name as place1,s2.name as place2,s1.x as x1,s1.y as y1,s2.x as x2,s2.y as y2 FROM sights s1 cross join sights s2)T1 where

sqrt( power(T1.y2-T1.y1,2) + power(T1.x2-T1.x1,2)) <5  and T1.place1 < T1.place2
and sqrt( power(T1.y2-T1.y1,2) + power(T1.x2-T1.x1,2)) !=0 order by T1.place1,T1.place2 ;


END
