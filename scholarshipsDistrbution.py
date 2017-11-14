CREATE PROCEDURE scholarshipsDistribution()
BEGIN
	select candidate_id as student_id from candidates
	where candidate_id not in (select student_id from detentions);
END
