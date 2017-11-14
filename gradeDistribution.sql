CREATE PROCEDURE gradeDistribution()
BEGIN
select T.name as Name, T.ID as ID from 	(SELECT name, id ,(MIDTERM1*25/100)+ (MIDTERM2*25/100)+(FINAL*50/100) as option1,(MIDTERM1*50/100)+ (MIDTERM2*50/100) as option2 , Final as option3 FROM Grades) as T
where T.option3>T.option2 and T.option3>T.option1
order by left(T.name,3) asc,id asc;
END
