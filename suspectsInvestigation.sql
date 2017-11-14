CREATE PROCEDURE suspectsInvestigation()
BEGIN
SELECT id, name, surname
    FROM Suspect
    where height <= 170 and upper(name) LIKE 'b%' AND upper(surname) like 'gre_n'
    order by id;
END
