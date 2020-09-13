--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4 (Ubuntu 12.4-1.pgdg20.04+1)
-- Dumped by pg_dump version 12.4 (Ubuntu 12.4-1.pgdg20.04+1)

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
-- Name: answers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.answers (
    id integer NOT NULL,
    question_id integer NOT NULL,
    is_true smallint,
    text text
);


ALTER TABLE public.answers OWNER TO postgres;

--
-- Name: answers_answer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.answers_answer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.answers_answer_id_seq OWNER TO postgres;

--
-- Name: answers_answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.answers_answer_id_seq OWNED BY public.answers.id;


--
-- Name: online; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.online (
    user_id integer NOT NULL,
    token character varying(16),
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.online OWNER TO postgres;

--
-- Name: online_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.online_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.online_user_id_seq OWNER TO postgres;

--
-- Name: online_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.online_user_id_seq OWNED BY public.online.user_id;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questions (
    id integer NOT NULL,
    text text,
    score integer
);


ALTER TABLE public.questions OWNER TO postgres;

--
-- Name: questions_question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.questions_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_question_id_seq OWNER TO postgres;

--
-- Name: questions_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.questions_question_id_seq OWNED BY public.questions.id;


--
-- Name: user_game; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_game (
    game_id integer NOT NULL,
    question_id integer NOT NULL,
    user_id integer,
    answer_id integer
);


ALTER TABLE public.user_game OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username text,
    password character varying(64)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: answers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answers ALTER COLUMN id SET DEFAULT nextval('public.answers_answer_id_seq'::regclass);


--
-- Name: online user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.online ALTER COLUMN user_id SET DEFAULT nextval('public.online_user_id_seq'::regclass);


--
-- Name: questions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions ALTER COLUMN id SET DEFAULT nextval('public.questions_question_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: answers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.answers VALUES (1, 1, 1, 'answer 1.0');
INSERT INTO public.answers VALUES (2, 1, 0, 'answer 1.1');
INSERT INTO public.answers VALUES (3, 1, 0, 'answer 1.2');
INSERT INTO public.answers VALUES (4, 1, 0, 'answer 1.3');
INSERT INTO public.answers VALUES (5, 1, 0, 'answer 1.4');
INSERT INTO public.answers VALUES (6, 2, 1, 'answer 2.0');
INSERT INTO public.answers VALUES (7, 2, 0, 'answer 2.1');
INSERT INTO public.answers VALUES (8, 3, 1, 'answer 3.0');
INSERT INTO public.answers VALUES (9, 3, 0, 'answer 3.1');
INSERT INTO public.answers VALUES (10, 3, 0, 'answer 3.2');
INSERT INTO public.answers VALUES (11, 3, 0, 'answer 3.3');
INSERT INTO public.answers VALUES (12, 4, 1, 'answer 4.0');
INSERT INTO public.answers VALUES (13, 4, 0, 'answer 4.1');
INSERT INTO public.answers VALUES (14, 4, 0, 'answer 4.2');
INSERT INTO public.answers VALUES (15, 4, 0, 'answer 4.3');
INSERT INTO public.answers VALUES (16, 5, 1, 'answer 5.0');
INSERT INTO public.answers VALUES (17, 5, 0, 'answer 5.1');
INSERT INTO public.answers VALUES (18, 5, 0, 'answer 5.2');
INSERT INTO public.answers VALUES (28, 2, 1, 'answer 2.3');


--
-- Data for Name: online; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.questions VALUES (3, 'question 3', 10);
INSERT INTO public.questions VALUES (5, 'question 5', 20);
INSERT INTO public.questions VALUES (4, 'question 4', 15);
INSERT INTO public.questions VALUES (1, 'question 1', 6);
INSERT INTO public.questions VALUES (2, 'question 2', 5);


--
-- Data for Name: user_game; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (1, 'a', 'd');


--
-- Name: answers_answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.answers_answer_id_seq', 28, true);


--
-- Name: online_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.online_user_id_seq', 1, false);


--
-- Name: questions_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questions_question_id_seq', 18, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);


--
-- Name: answers answers_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_pk PRIMARY KEY (id);


--
-- Name: online online_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.online
    ADD CONSTRAINT online_pk PRIMARY KEY (user_id);


--
-- Name: questions questions_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pk PRIMARY KEY (id);


--
-- Name: user_game user_game_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_game
    ADD CONSTRAINT user_game_pk PRIMARY KEY (game_id, question_id);


--
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (user_id);


--
-- Name: answers_answer_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX answers_answer_id_uindex ON public.answers USING btree (id);


--
-- Name: online_user_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX online_user_id_uindex ON public.online USING btree (user_id);


--
-- Name: questions_question_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX questions_question_id_uindex ON public.questions USING btree (id);


--
-- Name: users_user_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_user_id_uindex ON public.users USING btree (user_id);


--
-- Name: users_username_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_username_uindex ON public.users USING btree (username);


--
-- Name: answers answers_questions_question_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_questions_question_id_fk FOREIGN KEY (question_id) REFERENCES public.questions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: online online_users_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.online
    ADD CONSTRAINT online_users_user_id_fk FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_game user_game_answers_answer_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_game
    ADD CONSTRAINT user_game_answers_answer_id_fk FOREIGN KEY (answer_id) REFERENCES public.answers(id);


--
-- Name: user_game user_game_questions_question_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_game
    ADD CONSTRAINT user_game_questions_question_id_fk FOREIGN KEY (question_id) REFERENCES public.questions(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_game user_game_users_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_game
    ADD CONSTRAINT user_game_users_user_id_fk FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

