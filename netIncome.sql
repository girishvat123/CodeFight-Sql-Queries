CREATE PROCEDURE netIncome()
BEGIN
	select year,quarter, sum(profit)-sum(loss) as net_profit from(select year(date) as year,quarter(date) as quarter,profit,loss from accounting where profit!=0 or loss!=0)T1
GROUP BY  T1.year,T1.quarter;
END
