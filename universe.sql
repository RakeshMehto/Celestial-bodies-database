--
-- PostgreSQL database dump
--
-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;
DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--
CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';
ALTER DATABASE universe OWNER TO freecodecamp;
\ connect universe
SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;
SET default_tablespace = '';
SET default_table_access_method = heap;
--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    year_discovered integer,
    no_of_stars integer
);
ALTER TABLE public.galaxy OWNER TO freecodecamp;
--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.galaxy_galaxy_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;
--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;
--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    year_discovered integer NOT NULL,
    diameter integer NOT NULL,
    has_atmosphere boolean NOT NULL,
    planet_id integer
);
ALTER TABLE public.moon OWNER TO freecodecamp;
--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.moon_moon_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;
--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;
--
-- Name: other_object; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.other_object (
    other_object_id integer NOT NULL,
    name character varying NOT NULL,
    type character varying NOT NULL
);
ALTER TABLE public.other_object OWNER TO freecodecamp;
--
-- Name: other_object_other_object_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.other_object_other_object_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.other_object_other_object_id_seq OWNER TO freecodecamp;
--
-- Name: other_object_other_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.other_object_other_object_id_seq OWNED BY public.other_object.other_object_id;
--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    year_discovered integer NOT NULL,
    diameter numeric NOT NULL,
    has_moon boolean NOT NULL,
    star_id integer
);
ALTER TABLE public.planet OWNER TO freecodecamp;
--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.planet_planet_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;
--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;
--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    year_discovered integer NOT NULL,
    diameter integer NOT NULL,
    galaxy_id integer
);
ALTER TABLE public.star OWNER TO freecodecamp;
--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.star_star_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;
ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;
--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;
--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.galaxy
ALTER COLUMN galaxy_id
SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);
--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.moon
ALTER COLUMN moon_id
SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);
--
-- Name: other_object other_object_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.other_object
ALTER COLUMN other_object_id
SET DEFAULT nextval(
        'public.other_object_other_object_id_seq'::regclass
    );
--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.planet
ALTER COLUMN planet_id
SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);
--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.star
ALTER COLUMN star_id
SET DEFAULT nextval('public.star_star_id_seq'::regclass);
--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO public.galaxy
VALUES (
        1,
        'Andromeda',
        'Spiral galaxy approximately 2.5 million light-years away from Earth',
        1764,
        1000000000
    );
INSERT INTO public.galaxy
VALUES (
        2,
        'Milky Way',
        'Barred spiral galaxy containing our solar system',
        1610,
        100000000
    );
INSERT INTO public.galaxy
VALUES (
        3,
        'Triangulum',
        'Small spiral galaxy located approximately 3 million light-years away from Earth',
        1784,
        400000000
    );
INSERT INTO public.galaxy
VALUES (
        4,
        'Sombrero',
        'Unusual looking spiral galaxy located approximately 28 million light-years away from Earth',
        1781,
        100000000
    );
INSERT INTO public.galaxy
VALUES (
        5,
        'Black Eye',
        'Galaxy located approximately 24 million light-years away from Earth',
        1779,
        40000000
    );
INSERT INTO public.galaxy
VALUES (
        6,
        'Whirlpool',
        'Spiral galaxy located approximately 31 million light-years away from Earth',
        1773,
        80000000
    );
INSERT INTO public.galaxy
VALUES (
        7,
        'Pinwheel',
        'Spiral galaxy located approximately 21 million light-years away from Earth',
        1781,
        50000000
    );
INSERT INTO public.galaxy
VALUES (
        8,
        'Cartwheel',
        'Unusual looking galaxy located approximately 500 million light-years away from Earth',
        1941,
        1000000000
    );
INSERT INTO public.galaxy
VALUES (
        9,
        'Tadpole',
        'Galaxy with a long tail of stars located approximately 420 million light-years away from Earth',
        2001,
        250000000
    );
INSERT INTO public.galaxy
VALUES (
        10,
        'Sunflower',
        'Spiral galaxy located approximately 30 million light-years away from Earth',
        1779,
        100000000
    );
INSERT INTO public.galaxy
VALUES (
        11,
        'Cigar',
        'Galaxy located approximately 12 million light-years away from Earth',
        1801,
        100000000
    );
--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO public.moon
VALUES (1, 'Moon', 1609, 3474, false, 3);
INSERT INTO public.moon
VALUES (2, 'Phobos', 1877, 22, false, 4);
INSERT INTO public.moon
VALUES (3, 'Deimos', 1877, 12, false, 4);
INSERT INTO public.moon
VALUES (4, 'Ganymede', 1610, 5262, true, 5);
INSERT INTO public.moon
VALUES (5, 'Europa', 1610, 3122, true, 5);
INSERT INTO public.moon
VALUES (6, 'Io', 1610, 3643, true, 5);
INSERT INTO public.moon
VALUES (7, 'Callisto', 1610, 4821, true, 5);
INSERT INTO public.moon
VALUES (8, 'Titan', 1655, 5150, true, 6);
INSERT INTO public.moon
VALUES (9, 'Enceladus', 1789, 504, true, 6);
INSERT INTO public.moon
VALUES (10, 'Mimas', 1789, 396, false, 6);
INSERT INTO public.moon
VALUES (11, 'Rhea', 1672, 1528, false, 6);
INSERT INTO public.moon
VALUES (12, 'Iapetus', 1671, 1469, false, 6);
INSERT INTO public.moon
VALUES (13, 'Tethys', 1684, 1062, false, 6);
INSERT INTO public.moon
VALUES (14, 'Dione', 1684, 1123, false, 6);
INSERT INTO public.moon
VALUES (15, 'Miranda', 1948, 471, false, 7);
INSERT INTO public.moon
VALUES (16, 'Ariel', 1851, 1162, false, 7);
INSERT INTO public.moon
VALUES (17, 'Umbriel', 1851, 1190, false, 7);
INSERT INTO public.moon
VALUES (18, 'Titania', 1787, 1578, false, 7);
INSERT INTO public.moon
VALUES (19, 'Oberon', 1787, 1523, false, 7);
INSERT INTO public.moon
VALUES (20, 'Charon', 1978, 1208, false, 8);
--
-- Data for Name: other_object; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO public.other_object
VALUES (1, 'Comet Halley', 'Comet');
INSERT INTO public.other_object
VALUES (2, 'C/2019 Q4 (Borisov)', 'Interstellar Comet');
INSERT INTO public.other_object
VALUES (3, 'NGC 5128', 'Galaxy');
INSERT INTO public.other_object
VALUES (4, 'PSR B1257+12', 'Pulsar');
INSERT INTO public.other_object
VALUES (5, 'Sagittarius A*', 'Supermassive Black Hole');
--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO public.planet
VALUES (1, 'Mercury', 1631, 4879, false, 1);
INSERT INTO public.planet
VALUES (2, 'Venus', 1610, 12104, false, 1);
INSERT INTO public.planet
VALUES (3, 'Earth', 0, 12756, true, 1);
INSERT INTO public.planet
VALUES (4, 'Mars', 1659, 6792, true, 1);
INSERT INTO public.planet
VALUES (5, 'Jupiter', 1610, 142984, true, 2);
INSERT INTO public.planet
VALUES (6, 'Saturn', 1610, 120536, true, 2);
INSERT INTO public.planet
VALUES (7, 'Uranus', 1781, 51118, true, 2);
INSERT INTO public.planet
VALUES (8, 'Neptune', 1846, 49528, true, 2);
INSERT INTO public.planet
VALUES (9, 'Pluto', 1930, 2370, true, 3);
INSERT INTO public.planet
VALUES (10, 'Kepler-438b', 2015, 6719, true, 4);
INSERT INTO public.planet
VALUES (11, 'Kepler-186f', 2014, 11070, false, 4);
INSERT INTO public.planet
VALUES (12, 'Gliese 581g', 2010, 12420, true, 5);
INSERT INTO public.planet
VALUES (13, 'Proxima Centauri b', 2016, 7641, false, 4);
--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO public.star
VALUES (1, 'Sun', 1610, 1392000, 2);
INSERT INTO public.star
VALUES (2, 'Betelgeuse', 1839, 936000000, 2);
INSERT INTO public.star
VALUES (3, 'Sirius', 1844, 1983000, 2);
INSERT INTO public.star
VALUES (4, 'Proxima Centauri', 1915, 201630, 2);
INSERT INTO public.star
VALUES (5, 'Alpha Centauri A', 1689, 1909000, 2);
INSERT INTO public.star
VALUES (6, 'Alpha Centauri B', 1689, 1439000, 2);
INSERT INTO public.star
VALUES (7, 'Vega', 1850, 2272900, 1);
INSERT INTO public.star
VALUES (8, 'Polaris', 1580, 6300000, 1);
INSERT INTO public.star
VALUES (9, 'Antares', 1689, 888000000, 1);
INSERT INTO public.star
VALUES (10, 'Arcturus', 1700, 261000000, 1);
INSERT INTO public.star
VALUES (11, 'Rigel', 1855, 78000000, 2);
--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 11, true);
--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);
--
-- Name: other_object_other_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT pg_catalog.setval(
        'public.other_object_other_object_id_seq',
        5,
        true
    );
--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);
--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);
--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.galaxy
ADD CONSTRAINT galaxy_name_key UNIQUE (name);
--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.galaxy
ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);
--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.moon
ADD CONSTRAINT moon_name_key UNIQUE (name);
--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.moon
ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);
--
-- Name: other_object other_object_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.other_object
ADD CONSTRAINT other_object_name_key UNIQUE (name);
--
-- Name: other_object other_object_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.other_object
ADD CONSTRAINT other_object_pkey PRIMARY KEY (other_object_id);
--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.planet
ADD CONSTRAINT planet_name_key UNIQUE (name);
--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.planet
ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);
--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.star
ADD CONSTRAINT star_name_key UNIQUE (name);
--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.star
ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);
--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.moon
ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);
--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.planet
ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);
--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE ONLY public.star
ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);
--
-- PostgreSQL database dump complete
--