--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.12
-- Dumped by pg_dump version 9.1.12
-- Started on 2014-03-05 13:33:53 EET

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 209 (class 3079 OID 11681)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2244 (class 0 OID 0)
-- Dependencies: 209
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 211 (class 3079 OID 17840)
-- Dependencies: 5
-- Name: cube; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS cube WITH SCHEMA public;


--
-- TOC entry 2245 (class 0 OID 0)
-- Dependencies: 211
-- Name: EXTENSION cube; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION cube IS 'data type for multidimensional cubes';


--
-- TOC entry 210 (class 3079 OID 17912)
-- Dependencies: 5 211
-- Name: earthdistance; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS earthdistance WITH SCHEMA public;


--
-- TOC entry 2246 (class 0 OID 0)
-- Dependencies: 210
-- Name: EXTENSION earthdistance; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION earthdistance IS 'calculate great-circle distances on the surface of the Earth';


SET search_path = public, pg_catalog;

--
-- TOC entry 275 (class 1255 OID 18278)
-- Dependencies: 5 702
-- Name: init_businesses(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION init_businesses(iter_num integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
$$;


ALTER FUNCTION public.init_businesses(iter_num integer) OWNER TO postgres;

--
-- TOC entry 269 (class 1255 OID 18199)
-- Dependencies: 702 5
-- Name: init_categories(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION init_categories(iter_num integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
declare
last_id_val integer default null;
parent_id_val integer default null;
name_val text;
begin 
while(iter_num > 0) 
loop
-- random text
name_val := substring(md5(random()::text) from 0 for 5);
-- random from existent ids
if last_id_val is not null then
	--parent_id_val := trunc(random() * last_id_val);
	select * from categories where parent_id is null and (random() > 0.5) limit 1 into parent_id_val;
	if parent_id_val is null then 
		--parent_id_val := null;
		name_val := 'Main-' || name_val;
	else
		name_val := 'Sub-' || name_val;
	end if;
end if;
insert into categories values(default, name_val, parent_id_val) RETURNING id INTO last_id_val;
iter_num := iter_num - 1;
end loop;
return;
end;
$$;


ALTER FUNCTION public.init_categories(iter_num integer) OWNER TO postgres;

--
-- TOC entry 270 (class 1255 OID 18239)
-- Dependencies: 5 702
-- Name: init_chaines(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION init_chaines(iter_num integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
$$;


ALTER FUNCTION public.init_chaines(iter_num integer) OWNER TO postgres;

--
-- TOC entry 274 (class 1255 OID 18267)
-- Dependencies: 5 702
-- Name: init_cities(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION init_cities(iter_num integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
$$;


ALTER FUNCTION public.init_cities(iter_num integer) OWNER TO postgres;

--
-- TOC entry 276 (class 1255 OID 18285)
-- Dependencies: 702 5
-- Name: init_cities_postcodes(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION init_cities_postcodes(iter_num integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
$$;


ALTER FUNCTION public.init_cities_postcodes(iter_num integer) OWNER TO postgres;

--
-- TOC entry 268 (class 1255 OID 18268)
-- Dependencies: 702 5
-- Name: init_districts(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION init_districts(iter_num integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
$$;


ALTER FUNCTION public.init_districts(iter_num integer) OWNER TO postgres;

--
-- TOC entry 277 (class 1255 OID 18343)
-- Dependencies: 702 5
-- Name: init_districts_postcodes(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION init_districts_postcodes(iter_num integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
$$;


ALTER FUNCTION public.init_districts_postcodes(iter_num integer) OWNER TO postgres;

--
-- TOC entry 272 (class 1255 OID 18269)
-- Dependencies: 5 702
-- Name: init_postcodes(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION init_postcodes(iter_num integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
$$;


ALTER FUNCTION public.init_postcodes(iter_num integer) OWNER TO postgres;

--
-- TOC entry 271 (class 1255 OID 18240)
-- Dependencies: 5 702
-- Name: init_states(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION init_states(iter_num integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
declare
name_val text;
begin 
while(iter_num > 0) 
loop
-- random text
name_val := 'state-' || substring(md5(random()::text) from 0 for 3);
-- random from existent ids
insert into states values(default, name_val);
iter_num := iter_num - 1;
end loop;
return;
end;
$$;


ALTER FUNCTION public.init_states(iter_num integer) OWNER TO postgres;

--
-- TOC entry 273 (class 1255 OID 18270)
-- Dependencies: 702 5
-- Name: init_streets(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION init_streets(iter_num integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
$$;


ALTER FUNCTION public.init_streets(iter_num integer) OWNER TO postgres;

--
-- TOC entry 278 (class 1255 OID 18357)
-- Dependencies: 5 702
-- Name: init_streets_cities(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION init_streets_cities(iter_num integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
declare
streets_id_val integer;
cities_id_val integer;
code_val text;
begin 
while(iter_num > 0) 
loop
-- random text
code_val := substring(md5(random()::text) from 0 for 5);
-- random from existent ids
select id from streets offset (select random()* count(*) from streets) limit 1 into streets_id_val;
select id from cities offset (select random()* count(*) from cities) limit 1 into cities_id_val;
if streets_id_val is null or cities_id_val is null 
then continue; 
end if;
insert into streets_cities values(default, streets_id_val, cities_id_val);
iter_num := iter_num - 1;
end loop;
return;
end;
$$;


ALTER FUNCTION public.init_streets_cities(iter_num integer) OWNER TO postgres;

--
-- TOC entry 279 (class 1255 OID 18358)
-- Dependencies: 5 702
-- Name: init_streets_cities_districts_postcodes(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION init_streets_cities_districts_postcodes(iter_num integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
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
$$;


ALTER FUNCTION public.init_streets_cities_districts_postcodes(iter_num integer) OWNER TO postgres;

--
-- TOC entry 267 (class 1255 OID 18164)
-- Dependencies: 5 702
-- Name: twin_location(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION twin_location() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
declare
begin
--create from lat, lng fields the _location 
NEW._location := ll_to_earth(NEW.lat, NEW.lng); 
return NEW;
end;
$$;


ALTER FUNCTION public.twin_location() OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 182 (class 1259 OID 17930)
-- Dependencies: 2031 2032 2033 2034 619 5
-- Name: businesses; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE businesses (
    id integer NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    phone text NOT NULL,
    fax text NOT NULL,
    email text NOT NULL,
    website text NOT NULL,
    contact_mode integer NOT NULL,
    close boolean NOT NULL,
    chaines_id integer,
    data text NOT NULL,
    streets_id integer NOT NULL,
    _location earth,
    lat double precision NOT NULL,
    lng double precision NOT NULL,
    CONSTRAINT businesses_lat_check CHECK (((lat >= ((-90))::double precision) AND (lat <= (90)::double precision))),
    CONSTRAINT businesses_lng_check CHECK (((lng >= ((-180))::double precision) AND (lng <= (180)::double precision))),
    CONSTRAINT businesses_name_check CHECK ((char_length(name) <= 50)),
    CONSTRAINT contact_mode_range CHECK ((contact_mode = ANY (ARRAY[1, 2, 3])))
);


ALTER TABLE public.businesses OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 17928)
-- Dependencies: 5 182
-- Name: businesses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE businesses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.businesses_id_seq OWNER TO postgres;

--
-- TOC entry 2247 (class 0 OID 0)
-- Dependencies: 181
-- Name: businesses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE businesses_id_seq OWNED BY businesses.id;


--
-- TOC entry 208 (class 1259 OID 18202)
-- Dependencies: 2050 5
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE categories (
    id integer NOT NULL,
    name text NOT NULL,
    parent_id integer,
    CONSTRAINT categories_name_check CHECK ((char_length(name) < 50))
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 18200)
-- Dependencies: 208 5
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- TOC entry 2248 (class 0 OID 0)
-- Dependencies: 207
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- TOC entry 184 (class 1259 OID 17942)
-- Dependencies: 5
-- Name: chaines; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE chaines (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.chaines OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 17940)
-- Dependencies: 184 5
-- Name: chaines_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE chaines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chaines_id_seq OWNER TO postgres;

--
-- TOC entry 2249 (class 0 OID 0)
-- Dependencies: 183
-- Name: chaines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE chaines_id_seq OWNED BY chaines.id;


--
-- TOC entry 186 (class 1259 OID 17953)
-- Dependencies: 5
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cities (
    id integer NOT NULL,
    states_id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 17951)
-- Dependencies: 5 186
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO postgres;

--
-- TOC entry 2250 (class 0 OID 0)
-- Dependencies: 185
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cities_id_seq OWNED BY cities.id;


--
-- TOC entry 188 (class 1259 OID 17964)
-- Dependencies: 5
-- Name: cities_postcodes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cities_postcodes (
    id integer NOT NULL,
    cities_id integer NOT NULL,
    postcodes_id integer NOT NULL
);


ALTER TABLE public.cities_postcodes OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 17962)
-- Dependencies: 188 5
-- Name: cities_postcodes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cities_postcodes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_postcodes_id_seq OWNER TO postgres;

--
-- TOC entry 2251 (class 0 OID 0)
-- Dependencies: 187
-- Name: cities_postcodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cities_postcodes_id_seq OWNED BY cities_postcodes.id;


--
-- TOC entry 180 (class 1259 OID 17827)
-- Dependencies: 5
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 300
    CACHE 1;


ALTER TABLE public.countries_id_seq OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 17822)
-- Dependencies: 2029 5
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE countries (
    id integer DEFAULT nextval('countries_id_seq'::regclass) NOT NULL,
    cc_fips character(2) NOT NULL,
    cc_iso character(2) NOT NULL,
    name character(100)
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- TOC entry 2252 (class 0 OID 0)
-- Dependencies: 179
-- Name: TABLE countries; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE countries IS 'practical exhaustive list of countries from Earth';


--
-- TOC entry 190 (class 1259 OID 17972)
-- Dependencies: 5
-- Name: districts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE districts (
    id integer NOT NULL,
    cities_id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.districts OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 17970)
-- Dependencies: 190 5
-- Name: districts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE districts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.districts_id_seq OWNER TO postgres;

--
-- TOC entry 2253 (class 0 OID 0)
-- Dependencies: 189
-- Name: districts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE districts_id_seq OWNED BY districts.id;


--
-- TOC entry 192 (class 1259 OID 17983)
-- Dependencies: 5
-- Name: districts_postcodes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE districts_postcodes (
    id integer NOT NULL,
    districts_id integer NOT NULL,
    postcodes_id integer NOT NULL
);


ALTER TABLE public.districts_postcodes OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 17981)
-- Dependencies: 5 192
-- Name: districts_postcodes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE districts_postcodes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.districts_postcodes_id_seq OWNER TO postgres;

--
-- TOC entry 2254 (class 0 OID 0)
-- Dependencies: 191
-- Name: districts_postcodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE districts_postcodes_id_seq OWNED BY districts_postcodes.id;


--
-- TOC entry 162 (class 1259 OID 17671)
-- Dependencies: 2018 5
-- Name: email_confirmations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE email_confirmations (
    id integer NOT NULL,
    "usersId" integer NOT NULL,
    code character(32) NOT NULL,
    "createdAt" integer NOT NULL,
    "modifiedAt" integer,
    confirmed character(1) DEFAULT 'N'::bpchar
);


ALTER TABLE public.email_confirmations OWNER TO postgres;

--
-- TOC entry 161 (class 1259 OID 17669)
-- Dependencies: 5 162
-- Name: email_confirmations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE email_confirmations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_confirmations_id_seq OWNER TO postgres;

--
-- TOC entry 2255 (class 0 OID 0)
-- Dependencies: 161
-- Name: email_confirmations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE email_confirmations_id_seq OWNED BY email_confirmations.id;


--
-- TOC entry 164 (class 1259 OID 17680)
-- Dependencies: 5
-- Name: failed_logins; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE failed_logins (
    id integer NOT NULL,
    "usersId" integer,
    "ipAddress" character(15) NOT NULL,
    attempted integer NOT NULL
);


ALTER TABLE public.failed_logins OWNER TO postgres;

--
-- TOC entry 163 (class 1259 OID 17678)
-- Dependencies: 164 5
-- Name: failed_logins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE failed_logins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_logins_id_seq OWNER TO postgres;

--
-- TOC entry 2256 (class 0 OID 0)
-- Dependencies: 163
-- Name: failed_logins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE failed_logins_id_seq OWNED BY failed_logins.id;


--
-- TOC entry 166 (class 1259 OID 17689)
-- Dependencies: 5
-- Name: password_changes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE password_changes (
    id integer NOT NULL,
    "usersId" integer NOT NULL,
    "ipAddress" character(15) NOT NULL,
    "userAgent" character varying(48) NOT NULL,
    "createdAt" integer NOT NULL
);


ALTER TABLE public.password_changes OWNER TO postgres;

--
-- TOC entry 165 (class 1259 OID 17687)
-- Dependencies: 5 166
-- Name: password_changes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE password_changes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.password_changes_id_seq OWNER TO postgres;

--
-- TOC entry 2257 (class 0 OID 0)
-- Dependencies: 165
-- Name: password_changes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE password_changes_id_seq OWNED BY password_changes.id;


--
-- TOC entry 168 (class 1259 OID 17697)
-- Dependencies: 5
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE permissions (
    id integer NOT NULL,
    "profilesId" integer NOT NULL,
    resource character varying(16) NOT NULL,
    action character varying(16) NOT NULL
);


ALTER TABLE public.permissions OWNER TO postgres;

--
-- TOC entry 167 (class 1259 OID 17695)
-- Dependencies: 168 5
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO postgres;

--
-- TOC entry 2258 (class 0 OID 0)
-- Dependencies: 167
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE permissions_id_seq OWNED BY permissions.id;


--
-- TOC entry 194 (class 1259 OID 17991)
-- Dependencies: 5
-- Name: postcodes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE postcodes (
    id integer NOT NULL,
    code text NOT NULL,
    states_id integer NOT NULL
);


ALTER TABLE public.postcodes OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 17989)
-- Dependencies: 5 194
-- Name: postcodes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE postcodes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.postcodes_id_seq OWNER TO postgres;

--
-- TOC entry 2259 (class 0 OID 0)
-- Dependencies: 193
-- Name: postcodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE postcodes_id_seq OWNED BY postcodes.id;


--
-- TOC entry 170 (class 1259 OID 17706)
-- Dependencies: 5
-- Name: profiles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE profiles (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    active character(1) NOT NULL
);


ALTER TABLE public.profiles OWNER TO postgres;

--
-- TOC entry 169 (class 1259 OID 17704)
-- Dependencies: 170 5
-- Name: profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profiles_id_seq OWNER TO postgres;

--
-- TOC entry 2260 (class 0 OID 0)
-- Dependencies: 169
-- Name: profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE profiles_id_seq OWNED BY profiles.id;


--
-- TOC entry 172 (class 1259 OID 17715)
-- Dependencies: 5
-- Name: remember_tokens; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE remember_tokens (
    id integer NOT NULL,
    "usersId" integer NOT NULL,
    token character(32) NOT NULL,
    "userAgent" character varying(120) NOT NULL,
    "createdAt" integer NOT NULL
);


ALTER TABLE public.remember_tokens OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 17713)
-- Dependencies: 5 172
-- Name: remember_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE remember_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.remember_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 2261 (class 0 OID 0)
-- Dependencies: 171
-- Name: remember_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE remember_tokens_id_seq OWNED BY remember_tokens.id;


--
-- TOC entry 174 (class 1259 OID 17724)
-- Dependencies: 5
-- Name: reset_passwords; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reset_passwords (
    id integer NOT NULL,
    "usersId" integer NOT NULL,
    code character varying(48) NOT NULL,
    "createdAt" integer NOT NULL,
    "modifiedAt" integer,
    reset character(1) NOT NULL
);


ALTER TABLE public.reset_passwords OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 17722)
-- Dependencies: 174 5
-- Name: reset_passwords_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reset_passwords_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reset_passwords_id_seq OWNER TO postgres;

--
-- TOC entry 2262 (class 0 OID 0)
-- Dependencies: 173
-- Name: reset_passwords_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reset_passwords_id_seq OWNED BY reset_passwords.id;


--
-- TOC entry 196 (class 1259 OID 18002)
-- Dependencies: 2042 2043 5
-- Name: schedules; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE schedules (
    id integer NOT NULL,
    week_day integer NOT NULL,
    open time without time zone NOT NULL,
    close time without time zone NOT NULL,
    businesses_id integer NOT NULL,
    same_all_week boolean DEFAULT true NOT NULL,
    CONSTRAINT week_day_range CHECK ((week_day = ANY (ARRAY[0, 1, 2, 3, 4, 5, 6])))
);


ALTER TABLE public.schedules OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 18000)
-- Dependencies: 196 5
-- Name: schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE schedules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.schedules_id_seq OWNER TO postgres;

--
-- TOC entry 2263 (class 0 OID 0)
-- Dependencies: 195
-- Name: schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE schedules_id_seq OWNED BY schedules.id;


--
-- TOC entry 198 (class 1259 OID 18013)
-- Dependencies: 5
-- Name: states; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE states (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.states OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 18011)
-- Dependencies: 198 5
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.states_id_seq OWNER TO postgres;

--
-- TOC entry 2264 (class 0 OID 0)
-- Dependencies: 197
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE states_id_seq OWNED BY states.id;


--
-- TOC entry 200 (class 1259 OID 18024)
-- Dependencies: 5
-- Name: streets; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE streets (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.streets OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 18035)
-- Dependencies: 5
-- Name: streets_cities; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE streets_cities (
    id integer NOT NULL,
    streets_id integer NOT NULL,
    cities_id integer NOT NULL
);


ALTER TABLE public.streets_cities OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 18033)
-- Dependencies: 202 5
-- Name: streets_cities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE streets_cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.streets_cities_id_seq OWNER TO postgres;

--
-- TOC entry 2265 (class 0 OID 0)
-- Dependencies: 201
-- Name: streets_cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE streets_cities_id_seq OWNED BY streets_cities.id;


--
-- TOC entry 204 (class 1259 OID 18043)
-- Dependencies: 5
-- Name: streets_districts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE streets_districts (
    id integer NOT NULL,
    streets_id integer NOT NULL,
    districts_id integer NOT NULL
);


ALTER TABLE public.streets_districts OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 18041)
-- Dependencies: 204 5
-- Name: streets_districts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE streets_districts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.streets_districts_id_seq OWNER TO postgres;

--
-- TOC entry 2266 (class 0 OID 0)
-- Dependencies: 203
-- Name: streets_districts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE streets_districts_id_seq OWNED BY streets_districts.id;


--
-- TOC entry 199 (class 1259 OID 18022)
-- Dependencies: 200 5
-- Name: streets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE streets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.streets_id_seq OWNER TO postgres;

--
-- TOC entry 2267 (class 0 OID 0)
-- Dependencies: 199
-- Name: streets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE streets_id_seq OWNED BY streets.id;


--
-- TOC entry 206 (class 1259 OID 18051)
-- Dependencies: 5
-- Name: streets_postcodes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE streets_postcodes (
    id integer NOT NULL,
    streets_id integer NOT NULL,
    postcodes_id integer NOT NULL
);


ALTER TABLE public.streets_postcodes OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 18049)
-- Dependencies: 5 206
-- Name: streets_postcodes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE streets_postcodes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.streets_postcodes_id_seq OWNER TO postgres;

--
-- TOC entry 2268 (class 0 OID 0)
-- Dependencies: 205
-- Name: streets_postcodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE streets_postcodes_id_seq OWNED BY streets_postcodes.id;


--
-- TOC entry 176 (class 1259 OID 17733)
-- Dependencies: 5
-- Name: success_logins; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE success_logins (
    id integer NOT NULL,
    "usersId" integer NOT NULL,
    "ipAddress" character(15) NOT NULL,
    "userAgent" character varying(120) NOT NULL
);


ALTER TABLE public.success_logins OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 17731)
-- Dependencies: 5 176
-- Name: success_logins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE success_logins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.success_logins_id_seq OWNER TO postgres;

--
-- TOC entry 2269 (class 0 OID 0)
-- Dependencies: 175
-- Name: success_logins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE success_logins_id_seq OWNED BY success_logins.id;


--
-- TOC entry 178 (class 1259 OID 17742)
-- Dependencies: 2027 2028 5
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(32) NOT NULL,
    email character varying(48) NOT NULL,
    password character(60) NOT NULL,
    "mustChangePassword" character(1) DEFAULT NULL::bpchar,
    "profilesId" integer NOT NULL,
    banned character(1) NOT NULL,
    suspended character(1) NOT NULL,
    active character(1) DEFAULT NULL::bpchar,
    "authorID" character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 17740)
-- Dependencies: 178 5
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 2270 (class 0 OID 0)
-- Dependencies: 177
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 2030 (class 2604 OID 17933)
-- Dependencies: 182 181 182
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY businesses ALTER COLUMN id SET DEFAULT nextval('businesses_id_seq'::regclass);


--
-- TOC entry 2049 (class 2604 OID 18205)
-- Dependencies: 207 208 208
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- TOC entry 2035 (class 2604 OID 17945)
-- Dependencies: 184 183 184
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY chaines ALTER COLUMN id SET DEFAULT nextval('chaines_id_seq'::regclass);


--
-- TOC entry 2036 (class 2604 OID 17956)
-- Dependencies: 185 186 186
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cities ALTER COLUMN id SET DEFAULT nextval('cities_id_seq'::regclass);


--
-- TOC entry 2037 (class 2604 OID 17967)
-- Dependencies: 188 187 188
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cities_postcodes ALTER COLUMN id SET DEFAULT nextval('cities_postcodes_id_seq'::regclass);


--
-- TOC entry 2038 (class 2604 OID 17975)
-- Dependencies: 189 190 190
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY districts ALTER COLUMN id SET DEFAULT nextval('districts_id_seq'::regclass);


--
-- TOC entry 2039 (class 2604 OID 17986)
-- Dependencies: 192 191 192
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY districts_postcodes ALTER COLUMN id SET DEFAULT nextval('districts_postcodes_id_seq'::regclass);


--
-- TOC entry 2017 (class 2604 OID 17674)
-- Dependencies: 161 162 162
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY email_confirmations ALTER COLUMN id SET DEFAULT nextval('email_confirmations_id_seq'::regclass);


--
-- TOC entry 2019 (class 2604 OID 17683)
-- Dependencies: 163 164 164
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY failed_logins ALTER COLUMN id SET DEFAULT nextval('failed_logins_id_seq'::regclass);


--
-- TOC entry 2020 (class 2604 OID 17692)
-- Dependencies: 165 166 166
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY password_changes ALTER COLUMN id SET DEFAULT nextval('password_changes_id_seq'::regclass);


--
-- TOC entry 2021 (class 2604 OID 17700)
-- Dependencies: 167 168 168
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permissions ALTER COLUMN id SET DEFAULT nextval('permissions_id_seq'::regclass);


--
-- TOC entry 2040 (class 2604 OID 17994)
-- Dependencies: 194 193 194
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY postcodes ALTER COLUMN id SET DEFAULT nextval('postcodes_id_seq'::regclass);


--
-- TOC entry 2022 (class 2604 OID 17709)
-- Dependencies: 169 170 170
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY profiles ALTER COLUMN id SET DEFAULT nextval('profiles_id_seq'::regclass);


--
-- TOC entry 2023 (class 2604 OID 17718)
-- Dependencies: 171 172 172
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY remember_tokens ALTER COLUMN id SET DEFAULT nextval('remember_tokens_id_seq'::regclass);


--
-- TOC entry 2024 (class 2604 OID 17727)
-- Dependencies: 174 173 174
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reset_passwords ALTER COLUMN id SET DEFAULT nextval('reset_passwords_id_seq'::regclass);


--
-- TOC entry 2041 (class 2604 OID 18005)
-- Dependencies: 195 196 196
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY schedules ALTER COLUMN id SET DEFAULT nextval('schedules_id_seq'::regclass);


--
-- TOC entry 2044 (class 2604 OID 18016)
-- Dependencies: 197 198 198
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY states ALTER COLUMN id SET DEFAULT nextval('states_id_seq'::regclass);


--
-- TOC entry 2045 (class 2604 OID 18027)
-- Dependencies: 199 200 200
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY streets ALTER COLUMN id SET DEFAULT nextval('streets_id_seq'::regclass);


--
-- TOC entry 2046 (class 2604 OID 18038)
-- Dependencies: 202 201 202
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY streets_cities ALTER COLUMN id SET DEFAULT nextval('streets_cities_id_seq'::regclass);


--
-- TOC entry 2047 (class 2604 OID 18046)
-- Dependencies: 203 204 204
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY streets_districts ALTER COLUMN id SET DEFAULT nextval('streets_districts_id_seq'::regclass);


--
-- TOC entry 2048 (class 2604 OID 18054)
-- Dependencies: 205 206 206
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY streets_postcodes ALTER COLUMN id SET DEFAULT nextval('streets_postcodes_id_seq'::regclass);


--
-- TOC entry 2025 (class 2604 OID 17736)
-- Dependencies: 175 176 176
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY success_logins ALTER COLUMN id SET DEFAULT nextval('success_logins_id_seq'::regclass);


--
-- TOC entry 2026 (class 2604 OID 17745)
-- Dependencies: 178 177 178
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2079 (class 2606 OID 17939)
-- Dependencies: 182 182 2238
-- Name: businesses_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY businesses
    ADD CONSTRAINT businesses_pk PRIMARY KEY (id);


--
-- TOC entry 2117 (class 2606 OID 18211)
-- Dependencies: 208 208 2238
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 2081 (class 2606 OID 17950)
-- Dependencies: 184 184 2238
-- Name: chaines_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY chaines
    ADD CONSTRAINT chaines_pk PRIMARY KEY (id);


--
-- TOC entry 2083 (class 2606 OID 17961)
-- Dependencies: 186 186 2238
-- Name: cities_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_pk PRIMARY KEY (id);


--
-- TOC entry 2085 (class 2606 OID 17969)
-- Dependencies: 188 188 2238
-- Name: cities_postcodes_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cities_postcodes
    ADD CONSTRAINT cities_postcodes_pk PRIMARY KEY (id);


--
-- TOC entry 2087 (class 2606 OID 18348)
-- Dependencies: 188 188 188 2238
-- Name: cities_postcodes_unique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cities_postcodes
    ADD CONSTRAINT cities_postcodes_unique UNIQUE (cities_id, postcodes_id);


--
-- TOC entry 2077 (class 2606 OID 17830)
-- Dependencies: 179 179 2238
-- Name: countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- TOC entry 2089 (class 2606 OID 17980)
-- Dependencies: 190 190 2238
-- Name: districts_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY districts
    ADD CONSTRAINT districts_pk PRIMARY KEY (id);


--
-- TOC entry 2091 (class 2606 OID 17988)
-- Dependencies: 192 192 2238
-- Name: districts_postcodes_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY districts_postcodes
    ADD CONSTRAINT districts_postcodes_pk PRIMARY KEY (id);


--
-- TOC entry 2093 (class 2606 OID 18350)
-- Dependencies: 192 192 192 2238
-- Name: districts_postcodes_unique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY districts_postcodes
    ADD CONSTRAINT districts_postcodes_unique UNIQUE (districts_id, postcodes_id);


--
-- TOC entry 2052 (class 2606 OID 17677)
-- Dependencies: 162 162 2238
-- Name: email_confirmations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY email_confirmations
    ADD CONSTRAINT email_confirmations_pkey PRIMARY KEY (id);


--
-- TOC entry 2055 (class 2606 OID 17685)
-- Dependencies: 164 164 2238
-- Name: failed_logins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY failed_logins
    ADD CONSTRAINT failed_logins_pkey PRIMARY KEY (id);


--
-- TOC entry 2057 (class 2606 OID 17694)
-- Dependencies: 166 166 2238
-- Name: password_changes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY password_changes
    ADD CONSTRAINT password_changes_pkey PRIMARY KEY (id);


--
-- TOC entry 2060 (class 2606 OID 17702)
-- Dependencies: 168 168 2238
-- Name: permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2095 (class 2606 OID 17999)
-- Dependencies: 194 194 2238
-- Name: postcodes_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY postcodes
    ADD CONSTRAINT postcodes_pk PRIMARY KEY (id);


--
-- TOC entry 2063 (class 2606 OID 17711)
-- Dependencies: 170 170 2238
-- Name: profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- TOC entry 2066 (class 2606 OID 17720)
-- Dependencies: 172 172 2238
-- Name: remember_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY remember_tokens
    ADD CONSTRAINT remember_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 2069 (class 2606 OID 17729)
-- Dependencies: 174 174 2238
-- Name: reset_passwords_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reset_passwords
    ADD CONSTRAINT reset_passwords_pkey PRIMARY KEY (id);


--
-- TOC entry 2098 (class 2606 OID 18009)
-- Dependencies: 196 196 2238
-- Name: schedules_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY schedules
    ADD CONSTRAINT schedules_pk PRIMARY KEY (id);


--
-- TOC entry 2100 (class 2606 OID 18021)
-- Dependencies: 198 198 2238
-- Name: states_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY states
    ADD CONSTRAINT states_pk PRIMARY KEY (id);


--
-- TOC entry 2104 (class 2606 OID 18040)
-- Dependencies: 202 202 2238
-- Name: streets_cities_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY streets_cities
    ADD CONSTRAINT streets_cities_pk PRIMARY KEY (id);


--
-- TOC entry 2106 (class 2606 OID 18352)
-- Dependencies: 202 202 202 2238
-- Name: streets_cities_unique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY streets_cities
    ADD CONSTRAINT streets_cities_unique UNIQUE (streets_id, cities_id);


--
-- TOC entry 2108 (class 2606 OID 18048)
-- Dependencies: 204 204 2238
-- Name: streets_districts_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY streets_districts
    ADD CONSTRAINT streets_districts_pk PRIMARY KEY (id);


--
-- TOC entry 2110 (class 2606 OID 18354)
-- Dependencies: 204 204 204 2238
-- Name: streets_districts_unique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY streets_districts
    ADD CONSTRAINT streets_districts_unique UNIQUE (streets_id, districts_id);


--
-- TOC entry 2102 (class 2606 OID 18032)
-- Dependencies: 200 200 2238
-- Name: streets_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY streets
    ADD CONSTRAINT streets_pk PRIMARY KEY (id);


--
-- TOC entry 2112 (class 2606 OID 18056)
-- Dependencies: 206 206 2238
-- Name: streets_postcodes_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY streets_postcodes
    ADD CONSTRAINT streets_postcodes_pk PRIMARY KEY (id);


--
-- TOC entry 2114 (class 2606 OID 18356)
-- Dependencies: 206 206 206 2238
-- Name: streets_postcodes_unique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY streets_postcodes
    ADD CONSTRAINT streets_postcodes_unique UNIQUE (streets_id, postcodes_id);


--
-- TOC entry 2072 (class 2606 OID 17738)
-- Dependencies: 176 176 2238
-- Name: success_logins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY success_logins
    ADD CONSTRAINT success_logins_pkey PRIMARY KEY (id);


--
-- TOC entry 2075 (class 2606 OID 17752)
-- Dependencies: 178 178 2238
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2115 (class 1259 OID 18218)
-- Dependencies: 208 208 2238
-- Name: categories_id_parent_id_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX categories_id_parent_id_idx ON categories USING btree (id, parent_id);


--
-- TOC entry 2053 (class 1259 OID 17686)
-- Dependencies: 164 2238
-- Name: failed_logins_key1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX failed_logins_key1 ON failed_logins USING btree ("usersId");


--
-- TOC entry 2096 (class 1259 OID 18010)
-- Dependencies: 196 196 2238
-- Name: idx_1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX idx_1 ON schedules USING btree (businesses_id, week_day);


--
-- TOC entry 2058 (class 1259 OID 17703)
-- Dependencies: 168 2238
-- Name: permissions_key1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX permissions_key1 ON permissions USING btree ("profilesId");


--
-- TOC entry 2061 (class 1259 OID 17712)
-- Dependencies: 170 2238
-- Name: profiles_key1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX profiles_key1 ON profiles USING btree (active);


--
-- TOC entry 2064 (class 1259 OID 17721)
-- Dependencies: 172 2238
-- Name: remember_tokens_key1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX remember_tokens_key1 ON remember_tokens USING btree (token);


--
-- TOC entry 2067 (class 1259 OID 17730)
-- Dependencies: 174 2238
-- Name: reset_passwords_key1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reset_passwords_key1 ON reset_passwords USING btree ("usersId");


--
-- TOC entry 2070 (class 1259 OID 17739)
-- Dependencies: 176 2238
-- Name: success_logins_key1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX success_logins_key1 ON success_logins USING btree ("usersId");


--
-- TOC entry 2073 (class 1259 OID 17753)
-- Dependencies: 178 2238
-- Name: users_key1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX users_key1 ON users USING btree ("profilesId");


--
-- TOC entry 2135 (class 2620 OID 18165)
-- Dependencies: 267 182 182 182 2238
-- Name: set_location; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_location BEFORE INSERT OR UPDATE OF lat, lng ON businesses FOR EACH ROW EXECUTE PROCEDURE twin_location();


--
-- TOC entry 2118 (class 2606 OID 18057)
-- Dependencies: 2080 182 184 2238
-- Name: businesses_chaines; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY businesses
    ADD CONSTRAINT businesses_chaines FOREIGN KEY (chaines_id) REFERENCES chaines(id);


--
-- TOC entry 2119 (class 2606 OID 18062)
-- Dependencies: 2101 200 182 2238
-- Name: businesses_streets; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY businesses
    ADD CONSTRAINT businesses_streets FOREIGN KEY (streets_id) REFERENCES streets(id);


--
-- TOC entry 2134 (class 2606 OID 18212)
-- Dependencies: 208 208 2116 2238
-- Name: categories_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES categories(id);


--
-- TOC entry 2121 (class 2606 OID 18288)
-- Dependencies: 186 2082 188 2238
-- Name: cities_postcodes_cities; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cities_postcodes
    ADD CONSTRAINT cities_postcodes_cities FOREIGN KEY (cities_id) REFERENCES cities(id) ON DELETE CASCADE;


--
-- TOC entry 2122 (class 2606 OID 18293)
-- Dependencies: 188 2094 194 2238
-- Name: cities_postcodes_postcodes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cities_postcodes
    ADD CONSTRAINT cities_postcodes_postcodes FOREIGN KEY (postcodes_id) REFERENCES postcodes(id) ON DELETE CASCADE;


--
-- TOC entry 2120 (class 2606 OID 18077)
-- Dependencies: 2099 198 186 2238
-- Name: cities_states; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_states FOREIGN KEY (states_id) REFERENCES states(id);


--
-- TOC entry 2123 (class 2606 OID 18082)
-- Dependencies: 186 2082 190 2238
-- Name: districts_cities; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY districts
    ADD CONSTRAINT districts_cities FOREIGN KEY (cities_id) REFERENCES cities(id);


--
-- TOC entry 2125 (class 2606 OID 18303)
-- Dependencies: 190 2088 192 2238
-- Name: districts_postcodes_districts; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY districts_postcodes
    ADD CONSTRAINT districts_postcodes_districts FOREIGN KEY (districts_id) REFERENCES districts(id) ON DELETE CASCADE;


--
-- TOC entry 2124 (class 2606 OID 18298)
-- Dependencies: 192 2094 194 2238
-- Name: districts_postcodes_postcodes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY districts_postcodes
    ADD CONSTRAINT districts_postcodes_postcodes FOREIGN KEY (postcodes_id) REFERENCES postcodes(id) ON DELETE CASCADE;


--
-- TOC entry 2126 (class 2606 OID 18097)
-- Dependencies: 198 2099 194 2238
-- Name: postcodes_states; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY postcodes
    ADD CONSTRAINT postcodes_states FOREIGN KEY (states_id) REFERENCES states(id);


--
-- TOC entry 2127 (class 2606 OID 18102)
-- Dependencies: 2078 196 182 2238
-- Name: schedules_businesses; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY schedules
    ADD CONSTRAINT schedules_businesses FOREIGN KEY (businesses_id) REFERENCES businesses(id);


--
-- TOC entry 2128 (class 2606 OID 18308)
-- Dependencies: 186 2082 202 2238
-- Name: streets_cities_cities; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY streets_cities
    ADD CONSTRAINT streets_cities_cities FOREIGN KEY (cities_id) REFERENCES cities(id) ON DELETE CASCADE;


--
-- TOC entry 2129 (class 2606 OID 18313)
-- Dependencies: 200 2101 202 2238
-- Name: streets_cities_streets; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY streets_cities
    ADD CONSTRAINT streets_cities_streets FOREIGN KEY (streets_id) REFERENCES streets(id) ON DELETE CASCADE;


--
-- TOC entry 2130 (class 2606 OID 18323)
-- Dependencies: 190 2088 204 2238
-- Name: streets_districts_districts; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY streets_districts
    ADD CONSTRAINT streets_districts_districts FOREIGN KEY (districts_id) REFERENCES districts(id) ON DELETE CASCADE;


--
-- TOC entry 2131 (class 2606 OID 18328)
-- Dependencies: 204 200 2101 2238
-- Name: streets_districts_streets; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY streets_districts
    ADD CONSTRAINT streets_districts_streets FOREIGN KEY (streets_id) REFERENCES streets(id) ON DELETE CASCADE;


--
-- TOC entry 2132 (class 2606 OID 18333)
-- Dependencies: 206 2094 194 2238
-- Name: streets_postcodes_postcodes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY streets_postcodes
    ADD CONSTRAINT streets_postcodes_postcodes FOREIGN KEY (postcodes_id) REFERENCES postcodes(id) ON DELETE CASCADE;


--
-- TOC entry 2133 (class 2606 OID 18338)
-- Dependencies: 2101 200 206 2238
-- Name: streets_postcodes_streets; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY streets_postcodes
    ADD CONSTRAINT streets_postcodes_streets FOREIGN KEY (streets_id) REFERENCES streets(id) ON DELETE CASCADE;


--
-- TOC entry 2243 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2014-03-05 13:33:53 EET

--
-- PostgreSQL database dump complete
--

