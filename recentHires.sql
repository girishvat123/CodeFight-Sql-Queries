CREATE PROCEDURE recentHires()
BEGIN
SET @rno :=0;
SET @rno2 :=0;
SET @rno3 :=0;

 CREATE OR REPLACE VIEW temp1 as select T3.names from(select  name as names from pr_department where exists( select * from pr_department order by date_joined desc limit 5)
 )T3;

CREATE OR REPLACE VIEW temp2 as select T2.names FROM
(select  name as names from it_department where exists( select * from it_department order by date_joined desc limit 5)
  )T2;
CREATE OR REPLACE VIEW temp3 as select T1.names from(select  name as names from sales_department where exists( select * from sales_department order by date_joined desc limit 5)
)T1
 ;

select T1.rank, T1.names ,T2.names,T3.names from  (select @rno :=@rno+1 as rank,names from temp1)T1
 join
(select @rno2 := @rno2+1 as rank ,names from temp2)T2
on T1.rank= T2.rank
LEFT JOIN
(SELECT @rno3 :=@rno3+1 as rank ,names from temp3)T3;
END
