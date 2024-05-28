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
-- Name: cluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.cluster (
    cluster_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size_in_mly integer NOT NULL
);


ALTER TABLE public.cluster OWNER TO freecodecamp;

--
-- Name: clusters_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.clusters_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clusters_cluster_id_seq OWNER TO freecodecamp;

--
-- Name: clusters_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.clusters_cluster_id_seq OWNED BY public.cluster.cluster_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    cluster_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(10) NOT NULL,
    diameter_in_kly numeric(4,1) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxies_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxies_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxies_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    orbital_period_in_days numeric(4,1) NOT NULL,
    diameter_in_km integer NOT NULL,
    tidally_locked boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(30) NOT NULL,
    rotational_period_in_days numeric(4,1),
    orbital_period_in_years numeric(5,2) NOT NULL,
    diameter_in_km integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planets_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planets_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planets_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planets_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planets_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: satellites_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellites_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellites_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellites_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellites_satellite_id_seq OWNED BY public.moon.moon_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    class character(1) NOT NULL,
    color text NOT NULL,
    absolute_magnitude numeric(4,2) NOT NULL,
    diameter_in_mm integer NOT NULL,
    binary_system boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stars_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stars_star_id_seq OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stars_star_id_seq OWNED BY public.star.star_id;


--
-- Name: cluster cluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster ALTER COLUMN cluster_id SET DEFAULT nextval('public.clusters_cluster_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxies_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.satellites_satellite_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planets_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.stars_star_id_seq'::regclass);


--
-- Data for Name: cluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.cluster VALUES (1, 'Local Cluster', 10);
INSERT INTO public.cluster VALUES (2, 'Virgo Cluster', 15);
INSERT INTO public.cluster VALUES (3, 'El Gordo', 20);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 1, 'Milky Way', 'Sprial', 100.0);
INSERT INTO public.galaxy VALUES (2, 1, 'Andromeda', 'Spiral', 152.0);
INSERT INTO public.galaxy VALUES (3, 2, 'M87', 'Elliptical', 980.0);
INSERT INTO public.galaxy VALUES (4, 2, 'NGC 4753', 'Lenticular', 106.0);
INSERT INTO public.galaxy VALUES (5, 1, 'M32', 'Elliptical', 6.5);
INSERT INTO public.galaxy VALUES (6, 1, 'SMC', 'Irregular', 18.9);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Luna', 27.3, 3476, true);
INSERT INTO public.moon VALUES (2, 4, 'Phobos', 0.3, 23, true);
INSERT INTO public.moon VALUES (3, 4, 'Deimos', 1.3, 12, true);
INSERT INTO public.moon VALUES (4, 5, 'Io', 1.8, 3643, false);
INSERT INTO public.moon VALUES (5, 5, 'Europa', 3.6, 3122, false);
INSERT INTO public.moon VALUES (6, 5, 'Ganymede', 7.2, 5268, false);
INSERT INTO public.moon VALUES (7, 5, 'Callisto', 16.7, 4821, false);
INSERT INTO public.moon VALUES (8, 6, 'Mimas', 0.9, 396, false);
INSERT INTO public.moon VALUES (9, 6, 'Enceladus', 1.4, 504, false);
INSERT INTO public.moon VALUES (10, 6, 'Tethys', 1.9, 1066, false);
INSERT INTO public.moon VALUES (11, 6, 'Dione', 2.7, 1123, false);
INSERT INTO public.moon VALUES (12, 6, 'Rhea', 4.5, 1528, false);
INSERT INTO public.moon VALUES (13, 6, 'Titan', 16.0, 5150, false);
INSERT INTO public.moon VALUES (14, 6, 'Phoebe', 550.3, 213, false);
INSERT INTO public.moon VALUES (15, 7, 'Ariel', 2.5, 1158, false);
INSERT INTO public.moon VALUES (16, 7, 'Umbriel', 4.1, 1169, false);
INSERT INTO public.moon VALUES (17, 7, 'Titania', 8.7, 1578, false);
INSERT INTO public.moon VALUES (18, 7, 'Oberon', 13.5, 1523, false);
INSERT INTO public.moon VALUES (19, 7, 'Miranda', 1.4, 472, false);
INSERT INTO public.moon VALUES (20, 8, 'Triton', 5.9, 2707, false);
INSERT INTO public.moon VALUES (21, 8, 'Nereid', 360.1, 340, false);
INSERT INTO public.moon VALUES (22, 9, 'Charon', 6.4, 1212, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 'Rocky', 58.6, 0.24, 4880);
INSERT INTO public.planet VALUES (2, 1, 'Venus', 'Rocky', 243.0, 0.62, 12100);
INSERT INTO public.planet VALUES (3, 1, 'Earth', 'Rocky', 1.0, 1.00, 12735);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 'Rocky', 1.0, 1.88, 6779);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', 'Gas Giant', 0.4, 11.86, 139800);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', 'Gas Giant', 0.4, 29.45, 116460);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', 'Ice Giant', 0.7, 84.02, 50700);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', 'Ice Giant', 0.7, 164.80, 49240);
INSERT INTO public.planet VALUES (9, 1, 'Pluto', 'Dwarf', 6.4, 247.90, 2376);
INSERT INTO public.planet VALUES (10, 5, 'Proxima b', 'Rocky', NULL, 0.03, 13000);
INSERT INTO public.planet VALUES (11, 7, 'Trappist-1d', 'Rocky', NULL, 0.01, 9933);
INSERT INTO public.planet VALUES (12, 7, 'Trappist-1g', 'Rocky', NULL, 0.03, 13980);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sol', 'G', 'Yellow', 4.83, 696, false);
INSERT INTO public.star VALUES (2, 1, 'Betelgeuse', 'M', 'Red', -5.85, 1200000, false);
INSERT INTO public.star VALUES (3, 6, 'AB7', 'O', 'Blue', -6.10, 19480, true);
INSERT INTO public.star VALUES (4, 6, 'AB8', 'O', 'Blue', -6.30, 19480, true);
INSERT INTO public.star VALUES (5, 1, 'Proxima Centauri', 'M', 'Red', 15.60, 215, true);
INSERT INTO public.star VALUES (6, 1, 'Rigel', 'B', 'Blue/White', -7.84, 109780, true);
INSERT INTO public.star VALUES (7, 1, 'Trappist-1', 'M', 'Red', 18.80, 83, false);


--
-- Name: clusters_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.clusters_cluster_id_seq', 3, true);


--
-- Name: galaxies_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxies_galaxy_id_seq', 6, true);


--
-- Name: planets_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planets_planet_id_seq', 12, true);


--
-- Name: satellites_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellites_satellite_id_seq', 22, true);


--
-- Name: stars_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stars_star_id_seq', 7, true);


--
-- Name: cluster cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_name_key UNIQUE (name);


--
-- Name: cluster cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_pkey PRIMARY KEY (cluster_id);


--
-- Name: galaxy galaxies_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxies_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


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
-- Name: galaxy fk_cluster; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT fk_cluster FOREIGN KEY (cluster_id) REFERENCES public.cluster(cluster_id);


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
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

