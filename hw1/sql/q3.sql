select * 
from green_trips_data
where lpep_dropoff_datetime >= '2019-10-01'
  and lpep_dropoff_datetime < '2019-11-01'
;

-- Up to 1 mile
select count(*) qty
from green_trips_data
where lpep_pickup_datetime >= '2019-10-01'
  and lpep_dropoff_datetime <= '2019-11-01'
  and trip_distance <= 1
;

--In between 1 (exclusive) and 3 miles (inclusive),
select count(*) qty
from green_trips_data
where lpep_pickup_datetime >= '2019-10-01'
  and lpep_dropoff_datetime <= '2019-11-01'
  and trip_distance > 1
  and trip_distance <= 3
;

-- In between 3 (exclusive) and 7 miles (inclusive),
select count(*) qty
from green_trips_data
where lpep_pickup_datetime >= '2019-10-01'
  and lpep_dropoff_datetime <= '2019-11-01'
  and trip_distance > 3
  and trip_distance <= 7
;

--In between 7 (exclusive) and 10 miles (inclusive),
select count(*) qty
from green_trips_data
where lpep_pickup_datetime >= '2019-10-01'
  and lpep_dropoff_datetime <= '2019-11-01'
  and trip_distance > 7
  and trip_distance <= 10
;

-- Over 10 miles
select count(*) qty
from green_trips_data
where lpep_pickup_datetime >= '2019-10-01'
  and lpep_dropoff_datetime <= '2019-11-01'
  and trip_distance > 10
;

