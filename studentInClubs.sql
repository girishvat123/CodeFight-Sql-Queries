CREATE PROCEDURE studentsInClubs()
    SELECT * FROM students
    WHERE EXISTS (
            SELECT * from clubs where clubs.id=students.club_id

    )
    ORDER BY students.id;
