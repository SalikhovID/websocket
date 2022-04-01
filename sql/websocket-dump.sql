--
-- PostgreSQL database dump
--

-- Dumped from database version 13.6 (Ubuntu 13.6-0ubuntu0.21.10.1)
-- Dumped by pg_dump version 14.0 (Ubuntu 14.0-1.pgdg21.04+1)

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

DROP INDEX public.user_messages_id_uindex;
ALTER TABLE ONLY public.user_messages DROP CONSTRAINT user_messages_pk;
ALTER TABLE public.user_messages ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.test ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.chats ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.user_messages_id_seq;
DROP TABLE public.user_messages;
DROP SEQUENCE public.test_id_seq;
DROP TABLE public.test;
DROP SEQUENCE public.chats_id_seq;
DROP TABLE public.chats;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: chats; Type: TABLE; Schema: public; Owner: adminworkly
--

CREATE TABLE public.chats (
    id integer NOT NULL,
    remote_ip text NOT NULL
);


ALTER TABLE public.chats OWNER TO adminworkly;

--
-- Name: chats_id_seq; Type: SEQUENCE; Schema: public; Owner: adminworkly
--

CREATE SEQUENCE public.chats_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chats_id_seq OWNER TO adminworkly;

--
-- Name: chats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adminworkly
--

ALTER SEQUENCE public.chats_id_seq OWNED BY public.chats.id;


--
-- Name: test; Type: TABLE; Schema: public; Owner: adminworkly
--

CREATE TABLE public.test (
    id integer NOT NULL,
    text text
);


ALTER TABLE public.test OWNER TO adminworkly;

--
-- Name: test_id_seq; Type: SEQUENCE; Schema: public; Owner: adminworkly
--

CREATE SEQUENCE public.test_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_id_seq OWNER TO adminworkly;

--
-- Name: test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adminworkly
--

ALTER SEQUENCE public.test_id_seq OWNED BY public.test.id;


--
-- Name: user_messages; Type: TABLE; Schema: public; Owner: adminworkly
--

CREATE TABLE public.user_messages (
    id integer NOT NULL,
    message text,
    remote_ip text,
    user_id integer
);


ALTER TABLE public.user_messages OWNER TO adminworkly;

--
-- Name: user_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: adminworkly
--

CREATE SEQUENCE public.user_messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_messages_id_seq OWNER TO adminworkly;

--
-- Name: user_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: adminworkly
--

ALTER SEQUENCE public.user_messages_id_seq OWNED BY public.user_messages.id;


--
-- Name: chats id; Type: DEFAULT; Schema: public; Owner: adminworkly
--

ALTER TABLE ONLY public.chats ALTER COLUMN id SET DEFAULT nextval('public.chats_id_seq'::regclass);


--
-- Name: test id; Type: DEFAULT; Schema: public; Owner: adminworkly
--

ALTER TABLE ONLY public.test ALTER COLUMN id SET DEFAULT nextval('public.test_id_seq'::regclass);


--
-- Name: user_messages id; Type: DEFAULT; Schema: public; Owner: adminworkly
--

ALTER TABLE ONLY public.user_messages ALTER COLUMN id SET DEFAULT nextval('public.user_messages_id_seq'::regclass);


--
-- Data for Name: chats; Type: TABLE DATA; Schema: public; Owner: adminworkly
--

COPY public.chats (id, remote_ip) FROM stdin;
\.


--
-- Data for Name: test; Type: TABLE DATA; Schema: public; Owner: adminworkly
--

COPY public.test (id, text) FROM stdin;
1	dsad
\.


--
-- Data for Name: user_messages; Type: TABLE DATA; Schema: public; Owner: adminworkly
--

COPY public.user_messages (id, message, remote_ip, user_id) FROM stdin;
\.


--
-- Name: chats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adminworkly
--

SELECT pg_catalog.setval('public.chats_id_seq', 9, true);


--
-- Name: test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adminworkly
--

SELECT pg_catalog.setval('public.test_id_seq', 3, true);


--
-- Name: user_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: adminworkly
--

SELECT pg_catalog.setval('public.user_messages_id_seq', 27, true);


--
-- Name: user_messages user_messages_pk; Type: CONSTRAINT; Schema: public; Owner: adminworkly
--

ALTER TABLE ONLY public.user_messages
    ADD CONSTRAINT user_messages_pk PRIMARY KEY (id);


--
-- Name: user_messages_id_uindex; Type: INDEX; Schema: public; Owner: adminworkly
--

CREATE UNIQUE INDEX user_messages_id_uindex ON public.user_messages USING btree (id);


--
-- PostgreSQL database dump complete
--

