-- Function: public.init_categories(integer)

-- DROP FUNCTION public.init_categories(integer);

CREATE OR REPLACE FUNCTION public.init_chaines(iter_num integer)
  RETURNS void AS
$BODY$
declare
name_val text;
begin 
while(iter_num > 0) 
loop
-- random text
name_val := substring(md5(random()::text) from 0 for 5);
-- random from existent ids
insert into chaines values(default, name_val);
iter_num := iter_num - 1;
end loop;
return;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.init_chaines(integer)
  OWNER TO postgres;

CREATE OR REPLACE FUNCTION public.init_states(iter_num integer)
  RETURNS void AS
$BODY$
declare
name_val text;
begin 
while(iter_num > 0) 
loop
-- random text
name_val := 'state-' || substring(md5(random()::text) from 0 for 2);
-- random from existent ids
insert into states values(default, name_val);
iter_num := iter_num - 1;
end loop;
return;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.init_states(integer)
  OWNER TO postgres;


CREATE OR REPLACE FUNCTION public.init_cities(iter_num integer)
  RETURNS void AS
$BODY$
declare
states_id_val integer;
name_val text;
begin 
while(iter_num > 0) 
loop
-- random text
name_val := 'city-' || substring(md5(random()::text) from 0 for 10);
-- random from existent ids
select id from states offset (select random()* count(*) from states) limit 1 into states_id_val;
if states_id_val is null 
then continue; 
end if;
insert into cities values(default, states_id_val, name_val);
iter_num := iter_num - 1;
end loop;
return;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.init_cities(integer)
  OWNER TO postgres;

CREATE OR REPLACE FUNCTION public.init_districts(iter_num integer)
  RETURNS void AS
$BODY$
declare
cities_id_val integer;
name_val text;
begin 
while(iter_num > 0) 
loop
-- random text
name_val := 'district-' || substring(md5(random()::text) from 0 for 10);
-- random from existent ids
select id from cities offset (select random()* count(*) from cities) limit 1 into cities_id_val;
if cities_id_val is null 
then continue; 
end if;
insert into districts values(default, cities_id_val, name_val);
iter_num := iter_num - 1;
end loop;
return;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.init_districts(integer)
  OWNER TO postgres;

CREATE OR REPLACE FUNCTION public.init_postcodes(iter_num integer)
  RETURNS void AS
$BODY$
declare
states_id_val integer;
code_val text;
begin 
while(iter_num > 0) 
loop
-- random text
code_val := substring(md5(random()::text) from 0 for 5);
-- random from existent ids
select id from states offset (select random()* count(*) from states) limit 1 into states_id_val;
if states_id_val is null 
then continue; 
end if;
insert into postcodes values(default, code_val, states_id_val);
iter_num := iter_num - 1;
end loop;
return;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.init_postcodes(integer)
  OWNER TO postgres;

CREATE OR REPLACE FUNCTION public.init_streets(iter_num integer)
  RETURNS void AS
$BODY$
declare
name_val text;
begin 
while(iter_num > 0) 
loop
-- random text
name_val := 'Street-' || substring(md5(random()::text) from 0 for 10);
-- random from existent ids
insert into streets values(default, name_val);
iter_num := iter_num - 1;
end loop;
return;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.init_streets(integer)
  OWNER TO postgres;




CREATE OR REPLACE FUNCTION public.init_businesses(iter_num integer)
  RETURNS void AS
$BODY$
declare
name_val text;
description_val text;
phone_val text;
fax_val text;
email_val text;
website_val text;
contact_mode_val integer;
close_val boolean;
chaines_id_val integer;
data_val text;
streets_id_val integer;
lat_val double precision;
lng_val double precision;
contact_mode_val_flag numeric;
begin 
while(iter_num > 0) 
loop
-- random text
name_val := 'Bus-' || substring(md5(random()::text) from 0 for 5);
description_val := md5(random()::text);
phone_val := round(random()*10000000)::text;
fax_val := '0' || round(random()*10000000)::text;
email_val := substring(md5(random()::text) from 0 for 10) || '@' || substring(md5(random()::text) from 0 for 7) || '.' || substring(md5(random()::text) from 0 for 4);
website_val := 'http://' || substring(md5(random()::text) from 0 for 10) || '.' || substring(md5(random()::text) from 0 for 4);
contact_mode_val_flag := random();
if contact_mode_val_flag < 0.3 then
	contact_mode_val := 1;
elsif contact_mode_val_flag < 0.6 then
	contact_mode_val := 2;
else
	contact_mode_val := 3;
end if;

if (random() > 0.5) then
	close_val := true;
else
	close_val := false;
end if;
select id from chaines offset (select random()* count(*) from chaines) limit 1 into chaines_id_val;
data_val := substring(md5(random()::text) from 0 for 4);
-- random from existent ids
select id from streets offset (select random()* count(*) from streets) limit 1 into streets_id_val;
if streets_id_val is null 
then continue; 
end if;
lat_val := random()*90;
lng_val := random()*180;
insert into businesses 
(id,
name,
description, 
phone,
fax,
email,
website,
contact_mode,
close,
chaines_id,
data,
streets_id,
lat,
lng ) 
values(default, 
name_val,
description_val, 
phone_val,
fax_val,
email_val,
website_val,
contact_mode_val,
close_val,
chaines_id_val,
data_val,
streets_id_val,
lat_val,
lng_val);
iter_num := iter_num - 1;
end loop;
return;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.init_businesses(integer)
  OWNER TO postgres;


CREATE OR REPLACE FUNCTION public.init_cities_postcodes(iter_num integer)
  RETURNS void AS
$BODY$
declare
cities_id_val integer;
postcodes_id_val integer;
code_val text;
begin 
while(iter_num > 0) 
loop
-- random text
code_val := substring(md5(random()::text) from 0 for 5);
-- random from existent ids
select id from cities offset (select random()* count(*) from cities) limit 1 into cities_id_val;
select id from postcodes offset (select random()* count(*) from postcodes) limit 1 into postcodes_id_val;
if cities_id_val is null or postcodes_id_val is null 
then continue; 
end if;
insert into cities_postcodes values(default, cities_id_val, postcodes_id_val);
iter_num := iter_num - 1;
end loop;
return;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.init_cities_postcodes(integer)
  OWNER TO postgres;


CREATE OR REPLACE FUNCTION public.init_districts_postcodes(iter_num integer)
  RETURNS void AS
$BODY$
declare
districts_id_val integer;
postcodes_id_val integer;
code_val text;
begin 
while(iter_num > 0) 
loop
-- random text
code_val := substring(md5(random()::text) from 0 for 5);
-- random from existent ids
select id from districts offset (select random()* count(*) from districts) limit 1 into districts_id_val;
select id from postcodes offset (select random()* count(*) from postcodes) limit 1 into postcodes_id_val;
if districts_id_val is null or postcodes_id_val is null 
then continue; 
end if;
insert into districts_postcodes values(default, districts_id_val, postcodes_id_val);
iter_num := iter_num - 1;
end loop;
return;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.init_districts_postcodes(integer)
  OWNER TO postgres;


CREATE OR REPLACE FUNCTION public.init_streets_cities_districts_postcodes(iter_num integer)
  RETURNS void AS
$BODY$
declare
streets_id_val integer;
districts_id_val integer;
postcodes_id_val integer;
cities_id_val integer;
code_val text;
begin 
while(iter_num > 0) 
loop
-- random text
code_val := substring(md5(random()::text) from 0 for 5);
-- random from existent ids
select id from streets offset (select random()* count(*) from streets) limit 1 into streets_id_val;
select id from districts offset (select random()* count(*) from districts) limit 1 into districts_id_val;
select id from postcodes offset (select random()* count(*) from postcodes) limit 1 into postcodes_id_val;
select id from cities offset (select random()* count(*) from cities) limit 1 into cities_id_val;
if streets_id_val is null or cities_id_val is null 
then continue; 
end if;
insert into streets_cities values(default, streets_id_val, cities_id_val);
insert into streets_districts values(default, streets_id_val, districts_id_val);
insert into streets_postcodes values(default, streets_id_val, postcodes_id_val);
iter_num := iter_num - 1;
end loop;
return;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.init_streets_cities(integer)
  OWNER TO postgres;

CREATE OR REPLACE FUNCTION public.init_streets_cities_districts_postcodes(iter_num integer)
  RETURNS void AS
$BODY$
declare
streets_id_val integer;
districts_id_val integer;
postcodes_id_val integer;
cities_id_val integer;
code_val text;
begin 
while(iter_num > 0) 
loop
-- random text
code_val := substring(md5(random()::text) from 0 for 5);
-- random from existent ids
select id from streets offset (select random()* count(*) from streets) limit 1 into streets_id_val;
select id from districts offset (select random()* count(*) from districts) limit 1 into districts_id_val;
select id from postcodes offset (select random()* count(*) from postcodes) limit 1 into postcodes_id_val;
select id from cities offset (select random()* count(*) from cities) limit 1 into cities_id_val;
if streets_id_val is null or districts_id_val is null or postcodes_id_val is null or cities_id_val is null 
then continue; 
end if;
begin
insert into streets_cities values(default, streets_id_val, cities_id_val);
insert into streets_districts values(default, streets_id_val, districts_id_val);
insert into streets_postcodes values(default, streets_id_val, postcodes_id_val);
iter_num := iter_num - 1;
exception
when unique_violation then 
--SQLSTATE '23505'
end;
end loop;
return;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.init_streets_cities(integer)
  OWNER TO postgres;

update businesses set category_id = (select id from categories offset (select random()* count(*) from categories) limit 1)



select b.id, b.name, sdc.streets_id, sdc.districts_id, sdc.districts_name, sdc.cities_id, sdc.cities_name 
from businesses as b join
(
  -- streets of districts
  select 
  sd.streets_id, sd.districts_id, dc.districts_name, dc.cities_id, dc.cities_name
  from streets_districts as sd 
  join
  --dc
  ( -- districts of a city
    select 
    c.id as cities_id, 
    c.name as cities_name, 
    d.id as districts_id, 
    d.name as districts_name 
    from cities c join districts d on (c.id = d.cities_id) 
    where c.id = 1271
  ) as dc --dc
  on (sd.districts_id = dc.districts_id) 
) as sdc
on(b.streets_id = sdc.streets_id)


select count(f.id) as businesses_per_district, districts_id, districts_name from
(
-- businesses of streets
select b.id, b.name, sdc.streets_id, sdc.districts_id, sdc.districts_name, sdc.cities_id, sdc.cities_name   
from businesses as b join
(
  -- streets of districts
  select 
  sd.streets_id, sd.districts_id, dc.districts_name, dc.cities_id, dc.cities_name
  from streets_districts as sd 
  join
  --dc
  ( -- districts of a city
    select 
    c.id as cities_id, 
    c.name as cities_name, 
    d.id as districts_id, 
    d.name as districts_name 
    from cities c join districts d on (c.id = d.cities_id) 
    where c.id = 1271
  ) as dc --dc
  on (sd.districts_id = dc.districts_id) 
) as sdc
on(b.streets_id = sdc.streets_id)
) as f
group by f.districts_id


CREATE OR REPLACE FUNCTION public.update_business(iter_num integer)
  RETURNS void AS
$BODY$
declare
categories_id_val integer;
r businesses%rowtype;
begin 
for r in select * from businesses where id < iter_num
loop
-- random from existent ids
select id from categories offset (select random()* count(*) from categories) limit 1 into categories_id_val;
if categories_id_val is null 
then continue; 
end if;
update businesses set categories_id = categories_id_val where id = r.id;
--RETURN NEXT r;
end loop;
return;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.update_business(integer)
  OWNER TO postgres;


CREATE OR REPLACE FUNCTION public.germanize_locations(iter_num integer)
  RETURNS void AS
$BODY$
declare
lat_val double precision;
lng_val double precision;
r businesses%rowtype;
begin 
for r in select * from businesses where id < iter_num
loop
-- random german points
lat_val := 47 + random()*(55 - 47);
lng_val := 5.8 + random()*(15 - 5.8);
update businesses set lat = lat_val, lng = lng_val where id = r.id;
--RETURN NEXT r;
RAISE NOTICE '%, %',lat_val, lng_val;
end loop;
return;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.update_business(integer)
  OWNER TO postgres


--GEM
-- select nth row from a grouped selection
  select id, inx, cities_id from 
(select s.id, sc.cities_id, 
row_number() over(partition by s.id) as inx
from streets s join streets_cities sc
on s.id = sc.streets_id
group by s.id, sc.cities_id) t
where inx = 1
-- generate randoms from interval
SELECT * FROM generate_series(1270, 1280) order by random() limit 1

-- categorised num businesses per city
with datum as (select 
count(b.id) num_buss, b.cities_id, b.categories_id,
 b.categories_parent_id, c.name 
from businesses b join categories c
on c.id = b.categories_id
where b.cities_id = $1/*in(select cities.id from cities where cities._main = true)*/ -- all cities returned by subquery
group by b.cities_id, b.categories_id, b.categories_parent_id, c.name 
)
,resume as (
select d.categories_id, d.num_buss, d.name from datum as d where d.categories_parent_id is null
union  
select p.categories_id, sum(c.num_buss), p.name from datum as p join datum as c
on p.categories_id = c.categories_parent_id 
group by p.categories_id, p.name
)
select r.categories_id, cast(sum(r.num_buss) as integer), r.name from resume r group by r.categories_id, r.name
