select *
from green_trips_data
;

select a."PULocationID", b."Zone", count(*) qty, sum(a.total_amount) total_amount
from green_trips_data a
  join green_zones_data b
    on b."LocationID" = a."PULocationID"
where a.lpep_pickup_datetime between '2019-10-18' and '2019-10-19'
group by a."PULocationID", b."Zone"
having  sum(a.total_amount) >= 13000