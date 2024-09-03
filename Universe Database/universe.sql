--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions integer,
    in_milky_way boolean,
    galaxy_id integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroids_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroids_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroids_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions integer,
    shape character varying(15),
    width_in_lightyears numeric(14,2)
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
    name character varying(30) NOT NULL,
    description text,
    age_in_millions integer,
    in_milky_way boolean,
    planet_id integer
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
    name character varying(30) NOT NULL,
    description text,
    age_in_millions integer,
    in_milky_way boolean,
    star_id integer
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
    name character varying(30) NOT NULL,
    description text,
    age_in_millions integer,
    in_milky_way boolean,
    galaxy_id integer
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroids_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Asteroid1', NULL, 4600, true, 1);
INSERT INTO public.asteroid VALUES (2, 'Asteroid2', NULL, 4600, true, 1);
INSERT INTO public.asteroid VALUES (3, 'Asteroid3', NULL, 4600, true, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy containing the Sun and its Solar System, and therefore Earth', 13600, 'spiral', 105700.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Closest big galaxy to the Milky Way and expected to collide with it 4.5 billion years from now to form the Milkdromeda Galaxy', 10010, 'spiral', 220000.00);
INSERT INTO public.galaxy VALUES (3, 'Bode', 'AKA Messier 81 is the largest galaxy in the M81 Group and it harbors a supermassive black hole 70 million times the mass of the Sun', 13310, 'spiral', 90000.00);
INSERT INTO public.galaxy VALUES (4, 'Grasshopper', 'The result of two colliding galaxies', NULL, 'grasshopper', NULL);
INSERT INTO public.galaxy VALUES (5, 'Peekaboo', 'Relatively nearby galaxy which is the most metal and chemically poor galaxies known', NULL, 'x-shape', 1200.00);
INSERT INTO public.galaxy VALUES (6, 'Tadpole', 'Its unique shape can be attributed from tidal interaction which drew out the tidal tail', 100, 'tidal/distorted', 390000.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Our personal satellite', 4600, true, 1);
INSERT INTO public.moon VALUES (2, 'Moon2', 'LALV', 4600, true, 1);
INSERT INTO public.moon VALUES (3, 'Moon3', 'LALV', 4600, true, 1);
INSERT INTO public.moon VALUES (4, 'Moon4', 'LALV', 4600, true, 1);
INSERT INTO public.moon VALUES (5, 'Moon5', 'LALV', 4600, true, 1);
INSERT INTO public.moon VALUES (6, 'Moon6', NULL, 4600, true, 1);
INSERT INTO public.moon VALUES (7, 'Moon7', NULL, 4600, true, 1);
INSERT INTO public.moon VALUES (8, 'Moon8', NULL, 4600, true, 1);
INSERT INTO public.moon VALUES (9, 'Moon9', NULL, 4600, true, 1);
INSERT INTO public.moon VALUES (10, 'Moon10', NULL, 4600, true, 1);
INSERT INTO public.moon VALUES (11, 'Moon11', NULL, 4600, true, 1);
INSERT INTO public.moon VALUES (12, 'Moon12', NULL, 4600, true, 1);
INSERT INTO public.moon VALUES (13, 'Moon13', NULL, 4600, true, 1);
INSERT INTO public.moon VALUES (15, 'Moon14', NULL, 4600, true, 1);
INSERT INTO public.moon VALUES (16, 'Moon15', NULL, 4600, true, 1);
INSERT INTO public.moon VALUES (17, 'Moon16', NULL, 4600, true, 1);
INSERT INTO public.moon VALUES (18, 'Moon17', NULL, 4600, true, 1);
INSERT INTO public.moon VALUES (19, 'Moon18', NULL, 4600, true, 1);
INSERT INTO public.moon VALUES (20, 'Moon19', NULL, 4600, true, 1);
INSERT INTO public.moon VALUES (21, 'Moon20', NULL, 4600, true, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Closest planet to Sun and therefore warmest too', 4600, true, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Closest in mass and size to the earth and has the densest atmosphere', 4600, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'The only known habitable planet supporting intelligent lifeforms', 4600, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'The orange exterior is a result of Iron Oxide dust and seems like the next best option to support lifeforms', 4600, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Largest planet in our solar system and is a gas giant', 4600, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Known for its rings but not really know that those rings are made of ice and rocks', 4600, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'First of the ice giants which is made of hot dense fluid mix of water methane and ammonia', 4600, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'The furthest planet orbiting the sun is constantly dark, cold and whipped by supersonic winds', 4600, true, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Was once considered a real planet has since been denoted as a dwarf planet', 4600, true, 1);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 'Considered the next most habitable planets as it lies within the habitable zone', 4600, true, 2);
INSERT INTO public.planet VALUES (11, 'Gliese 667Cc', 'Although 4.5 times the size of the Earth, it has a red dwarf star that is considerably cooler', 4600, true, 3);
INSERT INTO public.planet VALUES (12, 'Rancaleation', 'The planet I will own', 4600, true, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Located about 25000 lightyears away from th ecenter of the the Milky Way, it provides life to the inhabitants of Earth', 4603, true, 1);
INSERT INTO public.star VALUES (2, 'Alpheratz', 'Brightest mercury-manganese star in the sky and very chemically rich', 60, false, 2);
INSERT INTO public.star VALUES (3, 'Ursa Major', 'The constellation within the Bode Galaxy', NULL, false, 3);
INSERT INTO public.star VALUES (4, 'Lynx', 'The constellation within the Grasshopper Galaxy', NULL, false, 4);
INSERT INTO public.star VALUES (5, 'TYC 7215-199-1', 'Star in between Peekaboo and us', NULL, false, 5);
INSERT INTO public.star VALUES (6, 'Bright Blue', 'This galaxy is filled with plenty of bright blue stars', NULL, false, 6);


--
-- Name: asteroids_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroids_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroids_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroids_name_key UNIQUE (name);


--
-- Name: asteroid asteroids_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroids_pkey PRIMARY KEY (asteroid_id);


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
-- Name: star galaxy_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_fk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: asteroid galaxy_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT galaxy_fk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

