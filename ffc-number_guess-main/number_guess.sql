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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games_info (
    game_id integer NOT NULL,
    player_id integer NOT NULL,
    guesses integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.games_info OWNER TO freecodecamp;

--
-- Name: games_info_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_info_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_info_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_info_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_info_game_id_seq OWNED BY public.games_info.game_id;


--
-- Name: info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.info (
    player_id integer NOT NULL,
    username character varying(22),
    games_played integer,
    best_game integer
);


ALTER TABLE public.info OWNER TO freecodecamp;

--
-- Name: info_player_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.info_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.info_player_id_seq OWNER TO freecodecamp;

--
-- Name: info_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.info_player_id_seq OWNED BY public.info.player_id;


--
-- Name: games_info game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games_info ALTER COLUMN game_id SET DEFAULT nextval('public.games_info_game_id_seq'::regclass);


--
-- Name: info player_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.info ALTER COLUMN player_id SET DEFAULT nextval('public.info_player_id_seq'::regclass);


--
-- Data for Name: games_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games_info VALUES (119, 56, 821);
INSERT INTO public.games_info VALUES (120, 56, 337);
INSERT INTO public.games_info VALUES (121, 57, 730);
INSERT INTO public.games_info VALUES (122, 57, 897);
INSERT INTO public.games_info VALUES (123, 56, 131);
INSERT INTO public.games_info VALUES (124, 56, 536);
INSERT INTO public.games_info VALUES (125, 56, 338);
INSERT INTO public.games_info VALUES (126, 58, 259);
INSERT INTO public.games_info VALUES (127, 58, 637);
INSERT INTO public.games_info VALUES (128, 59, 924);
INSERT INTO public.games_info VALUES (129, 59, 504);
INSERT INTO public.games_info VALUES (130, 58, 953);
INSERT INTO public.games_info VALUES (131, 58, 619);
INSERT INTO public.games_info VALUES (132, 58, 697);
INSERT INTO public.games_info VALUES (133, 60, 543);
INSERT INTO public.games_info VALUES (134, 60, 482);
INSERT INTO public.games_info VALUES (135, 61, 944);
INSERT INTO public.games_info VALUES (136, 61, 785);
INSERT INTO public.games_info VALUES (137, 60, 260);
INSERT INTO public.games_info VALUES (138, 60, 303);
INSERT INTO public.games_info VALUES (139, 60, 886);
INSERT INTO public.games_info VALUES (140, 62, 484);
INSERT INTO public.games_info VALUES (141, 62, 416);
INSERT INTO public.games_info VALUES (142, 63, 538);
INSERT INTO public.games_info VALUES (143, 63, 810);
INSERT INTO public.games_info VALUES (144, 62, 416);
INSERT INTO public.games_info VALUES (145, 62, 332);
INSERT INTO public.games_info VALUES (146, 62, 384);
INSERT INTO public.games_info VALUES (147, 64, 44);
INSERT INTO public.games_info VALUES (148, 64, 853);
INSERT INTO public.games_info VALUES (149, 65, 482);
INSERT INTO public.games_info VALUES (150, 65, 313);
INSERT INTO public.games_info VALUES (151, 64, 529);
INSERT INTO public.games_info VALUES (152, 64, 256);
INSERT INTO public.games_info VALUES (153, 64, 176);
INSERT INTO public.games_info VALUES (154, 66, 389);
INSERT INTO public.games_info VALUES (155, 66, 379);
INSERT INTO public.games_info VALUES (156, 67, 979);
INSERT INTO public.games_info VALUES (157, 67, 643);
INSERT INTO public.games_info VALUES (158, 66, 315);
INSERT INTO public.games_info VALUES (159, 66, 863);
INSERT INTO public.games_info VALUES (160, 66, 486);
INSERT INTO public.games_info VALUES (161, 68, 478);
INSERT INTO public.games_info VALUES (162, 68, 605);
INSERT INTO public.games_info VALUES (163, 69, 360);
INSERT INTO public.games_info VALUES (164, 69, 989);
INSERT INTO public.games_info VALUES (165, 68, 873);
INSERT INTO public.games_info VALUES (166, 68, 737);
INSERT INTO public.games_info VALUES (167, 68, 906);
INSERT INTO public.games_info VALUES (168, 70, 754);
INSERT INTO public.games_info VALUES (169, 70, 583);
INSERT INTO public.games_info VALUES (170, 71, 273);
INSERT INTO public.games_info VALUES (171, 71, 118);
INSERT INTO public.games_info VALUES (172, 70, 842);
INSERT INTO public.games_info VALUES (173, 70, 931);
INSERT INTO public.games_info VALUES (174, 70, 136);
INSERT INTO public.games_info VALUES (175, 72, 122);
INSERT INTO public.games_info VALUES (176, 72, 555);
INSERT INTO public.games_info VALUES (177, 73, 79);
INSERT INTO public.games_info VALUES (178, 73, 377);
INSERT INTO public.games_info VALUES (179, 72, 994);
INSERT INTO public.games_info VALUES (180, 72, 23);
INSERT INTO public.games_info VALUES (181, 72, 449);
INSERT INTO public.games_info VALUES (182, 74, 85);
INSERT INTO public.games_info VALUES (183, 74, 706);
INSERT INTO public.games_info VALUES (184, 75, 836);
INSERT INTO public.games_info VALUES (185, 75, 516);
INSERT INTO public.games_info VALUES (186, 74, 164);
INSERT INTO public.games_info VALUES (187, 74, 953);
INSERT INTO public.games_info VALUES (188, 74, 881);
INSERT INTO public.games_info VALUES (189, 76, 451);
INSERT INTO public.games_info VALUES (190, 76, 500);
INSERT INTO public.games_info VALUES (191, 77, 92);
INSERT INTO public.games_info VALUES (192, 77, 621);
INSERT INTO public.games_info VALUES (193, 76, 592);
INSERT INTO public.games_info VALUES (194, 76, 931);
INSERT INTO public.games_info VALUES (195, 76, 46);
INSERT INTO public.games_info VALUES (196, 78, 26);
INSERT INTO public.games_info VALUES (197, 78, 431);
INSERT INTO public.games_info VALUES (198, 79, 881);
INSERT INTO public.games_info VALUES (199, 79, 85);
INSERT INTO public.games_info VALUES (200, 78, 865);
INSERT INTO public.games_info VALUES (201, 78, 318);
INSERT INTO public.games_info VALUES (202, 78, 130);
INSERT INTO public.games_info VALUES (203, 80, 979);
INSERT INTO public.games_info VALUES (204, 80, 264);
INSERT INTO public.games_info VALUES (205, 81, 896);
INSERT INTO public.games_info VALUES (206, 81, 798);
INSERT INTO public.games_info VALUES (207, 80, 521);
INSERT INTO public.games_info VALUES (208, 80, 122);
INSERT INTO public.games_info VALUES (209, 80, 247);
INSERT INTO public.games_info VALUES (210, 82, 728);
INSERT INTO public.games_info VALUES (211, 82, 232);
INSERT INTO public.games_info VALUES (212, 83, 236);
INSERT INTO public.games_info VALUES (213, 83, 648);
INSERT INTO public.games_info VALUES (214, 82, 464);
INSERT INTO public.games_info VALUES (215, 82, 478);
INSERT INTO public.games_info VALUES (216, 82, 658);
INSERT INTO public.games_info VALUES (217, 84, 769);
INSERT INTO public.games_info VALUES (218, 84, 647);
INSERT INTO public.games_info VALUES (219, 85, 27);
INSERT INTO public.games_info VALUES (220, 85, 195);
INSERT INTO public.games_info VALUES (221, 84, 987);
INSERT INTO public.games_info VALUES (222, 84, 814);
INSERT INTO public.games_info VALUES (223, 84, 608);


--
-- Data for Name: info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.info VALUES (57, 'user_1687457686818', 2, 730);
INSERT INTO public.info VALUES (69, 'user_1687458172190', 2, 360);
INSERT INTO public.info VALUES (56, 'user_1687457686819', 5, 337);
INSERT INTO public.info VALUES (68, 'user_1687458172191', 5, 478);
INSERT INTO public.info VALUES (59, 'user_1687457696785', 2, 504);
INSERT INTO public.info VALUES (81, 'user_1687458643791', 2, 798);
INSERT INTO public.info VALUES (58, 'user_1687457696786', 5, 259);
INSERT INTO public.info VALUES (80, 'user_1687458643792', 5, 264);
INSERT INTO public.info VALUES (71, 'user_1687458234180', 2, 118);
INSERT INTO public.info VALUES (61, 'user_1687457702765', 2, 785);
INSERT INTO public.info VALUES (70, 'user_1687458234181', 5, 583);
INSERT INTO public.info VALUES (60, 'user_1687457702766', 5, 482);
INSERT INTO public.info VALUES (63, 'user_1687457707932', 2, 538);
INSERT INTO public.info VALUES (73, 'user_1687458388144', 2, 79);
INSERT INTO public.info VALUES (83, 'user_1687458865660', 2, 236);
INSERT INTO public.info VALUES (62, 'user_1687457707933', 5, 416);
INSERT INTO public.info VALUES (72, 'user_1687458388145', 5, 122);
INSERT INTO public.info VALUES (82, 'user_1687458865661', 5, 232);
INSERT INTO public.info VALUES (65, 'user_1687457937198', 2, 313);
INSERT INTO public.info VALUES (64, 'user_1687457937200', 5, 44);
INSERT INTO public.info VALUES (75, 'user_1687458400088', 2, 516);
INSERT INTO public.info VALUES (74, 'user_1687458400089', 5, 85);
INSERT INTO public.info VALUES (67, 'user_1687457963663', 2, 643);
INSERT INTO public.info VALUES (66, 'user_1687457963664', 5, 379);
INSERT INTO public.info VALUES (85, 'user_1687458981210', 2, 27);
INSERT INTO public.info VALUES (77, 'user_1687458529998', 2, 92);
INSERT INTO public.info VALUES (84, 'user_1687458981211', 5, 647);
INSERT INTO public.info VALUES (76, 'user_1687458529999', 5, 451);
INSERT INTO public.info VALUES (79, 'user_1687458564257', 2, 85);
INSERT INTO public.info VALUES (78, 'user_1687458564258', 5, 26);


--
-- Name: games_info_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_info_game_id_seq', 223, true);


--
-- Name: info_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.info_player_id_seq', 85, true);


--
-- Name: games_info games_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games_info
    ADD CONSTRAINT games_info_pkey PRIMARY KEY (game_id);


--
-- Name: info info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.info
    ADD CONSTRAINT info_pkey PRIMARY KEY (player_id);


--
-- Name: info unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.info
    ADD CONSTRAINT unique_name UNIQUE (username);


--
-- Name: games_info games_info_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games_info
    ADD CONSTRAINT games_info_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.info(player_id);


--
-- PostgreSQL database dump complete
--

