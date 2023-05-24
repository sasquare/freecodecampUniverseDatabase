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
-- Name: comets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comets (
    comets_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer,
    age numeric,
    has_water boolean,
    associated_planet character varying(255)
);


ALTER TABLE public.comets OWNER TO freecodecamp;

--
-- Name: comets_comets_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comets_comets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comets_comets_id_seq OWNER TO freecodecamp;

--
-- Name: comets_comets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comets_comets_id_seq OWNED BY public.comets.comets_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    shape character varying(255),
    description text,
    name character varying(255) NOT NULL,
    dis_from_earth numeric
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
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    has_water boolean NOT NULL,
    planet_id integer NOT NULL,
    diameter numeric,
    color character varying(255)
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
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    lifeform_presence boolean DEFAULT false NOT NULL,
    star_id integer NOT NULL,
    radius integer,
    color character varying(255),
    distance_from_earth numeric
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
    star_id integer NOT NULL,
    radius integer NOT NULL,
    color character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer,
    distance_from_earth integer
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
-- Name: comets comets_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets ALTER COLUMN comets_id SET DEFAULT nextval('public.comets_comets_id_seq'::regclass);


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
-- Data for Name: comets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comets VALUES (1, 'halley', NULL, 16000000, true, NULL);
INSERT INTO public.comets VALUES (2, '67p/churyumov', 6, 4600000000, true, NULL);
INSERT INTO public.comets VALUES (3, 'hale-bopp', NULL, 45000000, true, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, NULL, 'a majestic spiral beauty', 'andromeda13', NULL);
INSERT INTO public.galaxy VALUES (2, NULL, 'our celestial home', 'milkyway', NULL);
INSERT INTO public.galaxy VALUES (3, NULL, 'a cosmic triad of stars', 'tiangulum(m33)', NULL);
INSERT INTO public.galaxy VALUES (4, NULL, 'a nebulous dance of light', 'large magellanic cloud', NULL);
INSERT INTO public.galaxy VALUES (5, NULL, 'a stellar tapestry in the southern skies', 'small magellanic cloud', NULL);
INSERT INTO public.galaxy VALUES (6, NULL, 'a hat of stars and dust', 'sombrero', NULL);
INSERT INTO public.galaxy VALUES (7, NULL, 'spiral grace in celestial whirls', 'whirlpool', NULL);
INSERT INTO public.galaxy VALUES (8, NULL, 'spiraling splendor across the cosmos', 'pinwheel', NULL);
INSERT INTO public.galaxy VALUES (9, NULL, 'a cosmic shiner in the night', 'black eye', NULL);
INSERT INTO public.galaxy VALUES (10, NULL, 'a masterpiece of stellar sculpting', 'sculptor', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', true, 4, 3473, 'grey');
INSERT INTO public.moon VALUES (2, 'phobos', false, 5, 22, 'grey');
INSERT INTO public.moon VALUES (3, 'diemos', false, 5, 13, 'reddish');
INSERT INTO public.moon VALUES (4, 'ganymede', true, 6, 5268, 'grey');
INSERT INTO public.moon VALUES (5, 'callisto', true, 6, 4821, 'brownish');
INSERT INTO public.moon VALUES (6, 'lo', false, 6, 3642, 'yellow');
INSERT INTO public.moon VALUES (7, 'europa', true, 6, 3121, 'white');
INSERT INTO public.moon VALUES (8, 'titan', true, 7, 5150, 'orange');
INSERT INTO public.moon VALUES (9, 'enceladus', true, 7, 504, 'white');
INSERT INTO public.moon VALUES (10, 'rhea', false, 7, 1528, 'gray');
INSERT INTO public.moon VALUES (11, 'mimas', false, 7, 396, 'gray');
INSERT INTO public.moon VALUES (12, 'triton', true, 9, 2706, 'pinkish');
INSERT INTO public.moon VALUES (13, 'charon', false, 10, 1212, 'brown');
INSERT INTO public.moon VALUES (14, 'ariel', false, 8, 1158, 'gray');
INSERT INTO public.moon VALUES (15, 'oberon', false, 8, 1522, 'gray');
INSERT INTO public.moon VALUES (16, 'miranda', false, 8, 472, 'gray');
INSERT INTO public.moon VALUES (17, 'dione', false, 7, 1123, 'white');
INSERT INTO public.moon VALUES (18, 'tethys', false, 7, 1062, 'gray');
INSERT INTO public.moon VALUES (19, 'hyperion', false, 7, 270, 'gray');
INSERT INTO public.moon VALUES (20, 'lapetus', false, 7, 1470, 'brown');
INSERT INTO public.moon VALUES (21, 'phoebe', false, 7, 213, 'redish');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'mercury', false, 11, 2439, 'gray', NULL);
INSERT INTO public.planet VALUES (2, 'venus', false, 11, 6051, 'yellowish_white', NULL);
INSERT INTO public.planet VALUES (4, 'earth', true, 11, 6371, 'blue_green', NULL);
INSERT INTO public.planet VALUES (5, 'mars', false, 11, 3389, 'red', NULL);
INSERT INTO public.planet VALUES (6, 'jupiter', false, 11, 69911, 'orange_white', NULL);
INSERT INTO public.planet VALUES (7, 'saturn', false, 11, 58232, 'yellow_gold', NULL);
INSERT INTO public.planet VALUES (8, 'uranus', false, 11, 25362, 'pale_blue', NULL);
INSERT INTO public.planet VALUES (9, 'neptune', false, 11, 24622, 'deep_blue', NULL);
INSERT INTO public.planet VALUES (10, 'pluto', false, 11, 1188, 'brown_grey', NULL);
INSERT INTO public.planet VALUES (12, 'proxima_b', false, 6, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (13, 'kepler-452b', false, 3, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (14, 'kepler-2b', false, 3, NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1190647, 'blue_white', 'sirius', 2, NULL);
INSERT INTO public.star VALUES (2, 616653900, 'red', 'betelgeuse', 2, NULL);
INSERT INTO public.star VALUES (3, 49421700, 'yellow_white', 'canopus', 2, NULL);
INSERT INTO public.star VALUES (4, 257679000, 'red', 'r_doradus', 4, NULL);
INSERT INTO public.star VALUES (5, 84185700, 'orange_red', 'r_sculptoris', 10, NULL);
INSERT INTO public.star VALUES (6, 853277, 'yellow', 'alpha_centauri', 2, NULL);
INSERT INTO public.star VALUES (7, 54762330, 'blue', 'rigel', 2, NULL);
INSERT INTO public.star VALUES (8, 381400350, 'red', 'antares', 2, NULL);
INSERT INTO public.star VALUES (9, 1642899, 'blue_white', 'vegas', 2, NULL);
INSERT INTO public.star VALUES (10, 26085750, 'yellow', 'polaris', 2, NULL);
INSERT INTO public.star VALUES (11, 695700, 'yellow_white', 'sun', 2, NULL);


--
-- Name: comets_comets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comets_comets_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: comets comets_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets
    ADD CONSTRAINT comets_name_unique UNIQUE (name);


--
-- Name: comets comets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets
    ADD CONSTRAINT comets_pkey PRIMARY KEY (comets_id);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_diameter_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_diameter_key UNIQUE (diameter);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_radius_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_radius_key UNIQUE (radius);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: comets fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comets
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

