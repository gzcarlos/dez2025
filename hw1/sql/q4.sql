select *
from green_trips_data
;

select max(lpep_pickup_datetime)
from green_trips_data
where trip_distance = (
	select max(trip_distance)
	from green_trips_data
)