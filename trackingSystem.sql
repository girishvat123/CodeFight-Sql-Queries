CREATE PROCEDURE trackingSystem()
BEGIN

SELECT MT1.anonymous_id AS anonym_id, MT1.event_name as last_null , MT2.event_name as first_notnull FROM (SELECT T1.anonymous_id ,T1.event_name,M1.received_at FROM

(SELECT anonymous_id,MAX(received_at)as received_at FROM tracks  where user_id is null
                                        GROUP BY anonymous_id)M1
JOIN tracks T1 on M1.received_at= T1.received_at
)MT1
LEFT JOIN
(SELECT T2.anonymous_id ,T2.event_name,M2.received_at
FROM  (SELECT anonymous_id,MIN(received_at)as received_at FROM tracks  where user_id is not null
                                        GROUP BY anonymous_id)M2
JOIN tracks T2 on M2.received_at= T2.received_at)MT2 ON MT1.anonymous_id=MT2.anonymous_id ;


END





CREATE OR REPLACE VIEW temp (id,col_1,col_2,col_3,name) as select T1.id, T1.col_1,T1.col_2,T1.col_3,T1.name FROM	(SELECT id, CASE WHEN name is not null then 'name'
                  END AS col_1,
            CASE
                 WHEN date_of_birth is not null then 'date_of_birth'
                 END AS col_2,
           CASE
             WHEN salary is not null then 'salary' END AS col_3,name


FROM workers_info)T1  ;
SELECT id , col_1 AS column_name  from temp where col_1 is not null
UNION
SELECT id , col_2 as column_name  from temp where col_2 is not null
UNION
SELECT id , col_3 as column_name  from temp where col_3 is not null  order by id ;
