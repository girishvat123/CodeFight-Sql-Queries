CREATE PROCEDURE checkExpenditure()
BEGIN
SET @loss := 0;
SELECT id, CASE WHEN  SUM(T1.calc) < T1.value then 0
                ELSE  SUM(T1.calc)- T1.value END AS loss
FROM (SELECT WEEK(monday_date) as week, id,expenditure_sum, left_bound,right_bound ,value, case when WEEK(monday_date) between left_bound and right_bound then expenditure_sum else 0 end as calc from expenditure_plan,allowable_expenditure order by id)T1 GROUP BY T1.id  ;
END
