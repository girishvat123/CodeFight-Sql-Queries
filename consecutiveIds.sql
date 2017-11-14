CREATE PROCEDURE consecutiveIds()
BEGIN
    set @rno=0;

	select T1.oldId,@rno := @rno+1 as  newId from (select id as oldId from itemIds order by id)T1 ,(select @rno := 0)T2;
END
