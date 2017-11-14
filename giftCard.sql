CREATE PROCEDURE giftCard()
BEGIN
set @var1='a';

CREATE OR REPLACE VIEW T as select T1.name as a,T2.name as b,T3.name as c,(T1.price+T2.price +T3.price) as price_of_items from 	(SELECT * FROM goods  where category like '%books%')T1,

     (SELECT * FROM goods  where category like '%electronics%')T2,
     (SELECT * FROM goods  where category like '%beverages%')T3 order by  ABS(50-price_of_items) limit 1 ;

SELECT a as item from T
UNION
select b as item from T
UNION
select c as item from T
ORDER BY item;
END
