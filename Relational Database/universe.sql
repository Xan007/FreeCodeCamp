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

\connect universe

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    number_of_stars integer NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years numeric(4,2) NOT NULL,
    distance_from_earth integer NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric(4,2) NOT NULL,
    distance_from_earth integer NOT NULL,
    moon_id integer NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric(4,2) NOT NULL,
    distance_from_earth integer NOT NULL,
    star_id integer NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean,
    age_in_millions_of_years numeric(4,2) NOT NULL,
    distance_from_earth integer NOT NULL,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 'The constellation of the hunter', 80);
INSERT INTO public.constellation VALUES (2, 'Scorpius', 'The constellation of the scorpion', 30);
INSERT INTO public.constellation VALUES (3, 'Aquarius', 'The constellation of the water-bearer', 100);
INSERT INTO public.constellation VALUES (4, 'Virgo', 'The constellation of the virgin', 110);
INSERT INTO public.constellation VALUES (5, 'Cancer', 'The constellation of the crab', 50);
INSERT INTO public.constellation VALUES (6, 'Lyra', 'The constellation of the lyre', 35);
INSERT INTO public.constellation VALUES (7, 'Gemini', 'The constellation of the twins', 85);
INSERT INTO public.constellation VALUES (8, 'Leo', 'The constellation of the lion', 90);
INSERT INTO public.constellation VALUES (9, 'Sagittarius', 'The constellation of the archer', 120);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 'The Milky Way is a barred spiral galaxy that is the galaxy that contains Earth and the solar system.', 13.51, 25000, 1);
INSERT INTO public.galaxy VALUES ('Andromeda', NULL, 9.00, 2500000, 2);
INSERT INTO public.galaxy VALUES ('Triangulum', NULL, 10.00, 3000000, 3);
INSERT INTO public.galaxy VALUES ('Whirlpool', NULL, 10.00, 31000000, 4);
INSERT INTO public.galaxy VALUES ('Sombrero', NULL, 13.50, 50000000, 5);
INSERT INTO public.galaxy VALUES ('Cigar', NULL, 12.00, 12000000, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 'Natural satellite of Earth', false, true, 4.50, 384400, 1, 3);
INSERT INTO public.moon VALUES ('Phobos', 'Irregularly shaped moon', false, true, 4.50, 35, 2, 4);
INSERT INTO public.moon VALUES ('Deimos', 'Small, irregularly shaped moon', false, true, 4.50, 35, 3, 4);
INSERT INTO public.moon VALUES ('Io', 'Volcanic moon with active volcanoes', false, true, 4.50, 365000000, 4, 5);
INSERT INTO public.moon VALUES ('Europa', 'Icy moon with a subsurface ocean', false, true, 4.50, 365000000, 5, 5);
INSERT INTO public.moon VALUES ('Ganymede', 'Largest moon in the solar system', false, true, 4.50, 365000000, 6, 5);
INSERT INTO public.moon VALUES ('Callisto', 'Heavily cratered and icy moon', false, true, 4.50, 365000000, 7, 5);
INSERT INTO public.moon VALUES ('Titan', 'Largest moon of Saturn', false, true, 4.50, 746000000, 8, 6);
INSERT INTO public.moon VALUES ('Rhea', 'Icy moon with a heavily cratered surface', false, true, 4.50, 746000000, 9, 6);
INSERT INTO public.moon VALUES ('Lapetus', 'Two-toned moon with a heavily cratered surface', false, true, 4.50, 746000000, 10, 6);
INSERT INTO public.moon VALUES ('Dione', 'Icy moon with a heavily cratered surface', false, true, 4.50, 746000000, 11, 6);
INSERT INTO public.moon VALUES ('Tethys', 'Icy moon with a heavily cratered surface', false, true, 4.50, 746000000, 12, 6);
INSERT INTO public.moon VALUES ('Enceladus', 'Icy moon with geysers', false, true, 4.50, 746000000, 13, 6);
INSERT INTO public.moon VALUES ('Mimas', 'Icy moon with a heavily cratered surface', false, true, 4.50, 746000000, 14, 6);
INSERT INTO public.moon VALUES ('Hyperion', 'Irregularly shaped moon', false, true, 4.50, 746000000, 15, 6);
INSERT INTO public.moon VALUES ('Phoebe', 'Irregularly shaped moon', false, true, 4.50, 746000000, 16, 6);
INSERT INTO public.moon VALUES ('Miranda', 'Icy moon with a heavily cratered surface', false, true, 4.50, 170000000, 17, 7);
INSERT INTO public.moon VALUES ('Ariel', 'Icy moon with a heavily cratered surface', false, true, 4.50, 170000000, 18, 7);
INSERT INTO public.moon VALUES ('Umbriel', 'Icy moon with a heavily cratered surface', false, true, 4.50, 170000000, 19, 7);
INSERT INTO public.moon VALUES ('Oberon', 'Icy moon with a heavily cratered surface', false, true, 4.50, 170000000, 20, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 'A small rocky planet closest to the sun', false, true, 4.50, 77000000, 1, 1);
INSERT INTO public.planet VALUES ('Venus', 'A rocky planet with thick clouds of sulfuric acid', false, true, 4.50, 25000000, 1, 2);
INSERT INTO public.planet VALUES ('Earth', 'A rocky planet with abundant liquid water and life', true, true, 4.50, 0, 1, 3);
INSERT INTO public.planet VALUES ('Mars', 'A rocky planet with a this atmosphere', false, true, 4.50, 249000000, 1, 4);
INSERT INTO public.planet VALUES ('Jupiter', 'A gas giant, the largest planet in the solar system', false, true, 4.50, 470000000, 1, 5);
INSERT INTO public.planet VALUES ('Saturn', 'A gas giant with rings', false, true, 4.50, 746000000, 1, 6);
INSERT INTO public.planet VALUES ('Uranus', 'A gas giant with tilted axis and rings', false, true, 4.50, 1700000000, 1, 7);
INSERT INTO public.planet VALUES ('Neptune', 'A gas giant with a powerful wind', false, true, 4.50, 450000000, 1, 8);
INSERT INTO public.planet VALUES ('Plato', 'A dwarf planet with a highly elliptical orbit', false, true, 4.50, 470000000, 1, 9);
INSERT INTO public.planet VALUES ('Kepler-438b', 'A exo planet located in the Kepler-438 star system', false, true, 5.00, 640, 1, 11);
INSERT INTO public.planet VALUES ('Kepler-62f', 'A exo planet located in the Kepler-62 star system', false, true, 80.00, 1200, 1, 12);
INSERT INTO public.planet VALUES ('Kepler-438c', 'A exo planet located in the Kepler-438 star system', false, true, 5.00, 640, 1, 13);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 'The Sun is a star located at the center of the Solar System', true, 4.60, 150, 1, 1);
INSERT INTO public.star VALUES ('Alpheratz', NULL, NULL, 9.00, 2500000, 2, 2);
INSERT INTO public.star VALUES ('M33X-7', NULL, NULL, 50.00, 3000000, 3, 3);
INSERT INTO public.star VALUES ('SN 2005cs', NULL, NULL, 2.01, 31000000, 4, 4);
INSERT INTO public.star VALUES ('G1', NULL, NULL, 12.00, 50000000, 5, 5);
INSERT INTO public.star VALUES ('M82 X-1', NULL, NULL, 10.00, 12000000, 6, 6);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 9, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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

