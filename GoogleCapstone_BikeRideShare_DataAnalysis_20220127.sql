/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [id]
      ,[member_type]
      ,[ride_length]
      ,[day_of_week]
      ,[rideable_type]
      ,[Month]
      ,[started_at]
      ,[ended_at]
      ,[start_station]
      ,[end_station]
      ,[start_lat]
      ,[start_lng]
      ,[end_lat]
      ,[end_lng]
  FROM [Cyclistic_2021_BikeRide].[dbo].[divvytripdata_2021]

 ---Find member type distinct population---

select count(distinct(id))
from divvytripdata_2021
where member_type like '%member%';

select count(distinct(id))
from divvytripdata_2021
where member_type like '%casual%';

/*finding duplicate IDs*/
select id, count(1) as id_count
from divvytripdata_2021
group by id
having count(1) > 1;



  ---Find or confirm data errors---
select
min (end_lng),
max(end_lng),
min (end_lat),
max(end_lat),
min (start_lng),
max(start_lng),
min (start_lat),
max(start_lat)
from divvytripdata_2021;

select *
from divvytripdata_2021
where started_at is null and ended_at is null;

select *
from [Cyclistic_2021_BikeRide].[dbo].[divvytripdata_2021]
where member_type is null;
/*there are no null values*/

select *
from [Cyclistic_2021_BikeRide].[dbo].[divvytripdata_2021]
where rideable_type is null;
/*there are no null values*/

select  id, started_at, ended_at,
from divvytripdata_2021
where started_at >= ended_at;
/* there are 3017 records*/

---add columns or edit columns to exclude data with anomalies----------------------------

/*alter table divvytripdata_2021
drop column False_starts;*/

alter table divvytripdata_2021
add False_starts varchar (255) Null,
	trip_length int  Null,
	False_station varchar (255) Null,
	False_stations varchar (255) Null;

---Identify cases where start time is greater than end time & dock stations are null---
update divvytripdata_2021
set False_starts = 'Y'
where started_at >= ended_at;

alter table divvytripdata_2021
drop column False_station;

update divvytripdata_2021
set False_stations = 'Y'
where start_station is null and
	end_station is null;

---Exclude cases where False_starts contains Y & Tranfer data with null for dock stations---

delete
from divvytripdata_2021
where False_starts like '%Y%';

select count(* )
from divvytripdata_2021
where start_station is null and end_station is null;

select *
into BikeRide_NoLogStation
from (select *
from divvytripdata_2021
where start_station is null and end_station is null)a

delete
from divvytripdata_2021
where start_station is null and end_station is null;

select count(*)
from divvytripdata_2021;

update divvytripdata_2021
set trip_length = datediff(minute, started_at, ended_at);

--- Statistical analysis & findings---

select avg(trip_length) as avg_trip_length, member_type, count(member_type)
from divvytripdata_2021
group by member_type;

select avg(trip_length) as avg_trip_length, day_of_week
from divvytripdata_2021
group by day_of_week;

select max(trip_length) as max_trip_length, day_of_week, member_type
from divvytripdata_2021
group by day_of_week, member_type
order by max_trip_length desc;

select min(trip_length) as min_trip_length, day_of_week
from divvytripdata_2021
group by day_of_week;

select avg(trip_length) as avg_trip_length_per_month, count(distinct(id)) as Monthly_riders, Month
from divvytripdata_2021
group by Month
order by avg_trip_length_per_month desc;

select max(trip_length) as max_trip_length_per_month, count(distinct(id)) as Monthly_riders, Month, member_type
from divvytripdata_2021
group by Month, member_type
order by Monthly_riders desc;

select min(trip_length) as min_trip_length_per_month, count(distinct(id)) as Monthly_riders, Month
from divvytripdata_2021
group by Month
order by Monthly_riders desc;

select count(member_type), month, member_type
from divvytripdata_2021
group by Month, member_type;

select end_station, count(1) as frequented_stop
from divvytripdata_2021
where end_station is not null
group by end_station
order by frequented_stop desc;

select start_station, count(1) as frequented_start
from divvytripdata_2021
where start_station is not null
group by start_station
order by frequented_start desc;

select member_type, rideable_type, count(1) as preferred_bike
from divvytripdata_2021
group by rideable_type, member_type;
