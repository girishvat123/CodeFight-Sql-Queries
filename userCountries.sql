CREATE PROCEDURE userCountries()
BEGIN

select users.id, ifnull(cities.country,'unknown') as country from users left join cities on users.city=cities.city;
END
