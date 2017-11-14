CREATE PROCEDURE placesOfInterest()
BEGIN
select t1.country, sum(adventure_park)as adventure_park,sum(golf)as golf,sum(river_cruise)as river_cruise,sum(kart_racing)as kart_racing
FROM(
select country,
case
when leisure_activity_type='Adventure Park' then number_of_places else 0 end as adventure_park ,
case
when leisure_activity_type='Golf' then number_of_places else 0 end as golf ,
case
when leisure_activity_type='River cruise' then number_of_places else 0 end as river_cruise ,
case
when leisure_activity_type='Kart racing' then number_of_places else 0 end as kart_racing

from countryActivities )t1 GROUP BY t1.country;

END
