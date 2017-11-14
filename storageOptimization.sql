CREATE PROCEDURE storageOptimization()
BEGIN

CREATE OR REPLACE VIEW temp(id,col_1,col_2,col_3,col_4,col_5,col_6) as SELECT M1.id ,M1.col_1,M1.col_2,M1.col_3,M1.col_4,M1.col_5,M1.col_6 FROM (SELECT id, CASE WHEN name is not null then 'name'
                  END AS col_1,
            CASE
                 WHEN date_of_birth is not null then 'date_of_birth'
                 END AS col_2,
           CASE
             WHEN salary is not null then 'salary' END AS col_3,

          CASE WHEN name is not null then name
                  END AS col_4,
            CASE
                 WHEN date_of_birth is not null then date_of_birth
                 END AS col_5,
           CASE
             WHEN salary is not null then salary END AS col_6


FROM workers_info)M1;

SELECT id,col_1 AS column_name  ,col_4 AS value FROM temp where col_1 is not null  and col_4 is not null
UNION
SELECT id,col_2 AS column_name ,col_5 AS value FROM temp where col_2 is not null  and col_5 is not null
UNION
SELECT id,col_3 AS column_name ,col_6 AS value FROM temp where col_3 is not null  and col_6 is not null ORDER BY id,FIELD(column_name,'name','date_of_birth','salary');



END
