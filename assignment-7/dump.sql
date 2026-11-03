--
-- PostgreSQL database dump
--

\restrict 28R6kjzKu86OhMKEcUGehmgspg1PNMJCoWI1RMIxGV7dRkuQCVZnOF80moZD5Jj

-- Dumped from database version 16.10 (Debian 16.10-1.pgdg13+1)
-- Dumped by pg_dump version 16.10 (Debian 16.10-1.pgdg13+1)

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
-- Name: channels; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.channels (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.channels OWNER TO postgres;

--
-- Name: channels_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.channels ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.channels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messages (
    id bigint NOT NULL,
    channel_id integer NOT NULL,
    user_id bigint NOT NULL,
    body text NOT NULL,
    sent_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.messages OWNER TO postgres;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.messages ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    username character varying(32) NOT NULL,
    country character(2) NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: channels; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.channels (id, name) FROM stdin;
1	general
2	homework
3	games
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.messages (id, channel_id, user_id, body, sent_at) FROM stdin;
1	1	2	General message number 1	2026-10-01 10:01:00+00
2	1	3	General message number 2	2026-10-01 10:02:00+00
3	1	1	General message number 3	2026-10-01 10:03:00+00
4	1	2	General message number 4	2026-10-01 10:04:00+00
5	1	3	General message number 5	2026-10-01 10:05:00+00
6	1	1	General message number 6	2026-10-01 10:06:00+00
7	1	2	General message number 7	2026-10-01 10:07:00+00
8	1	3	General message number 8	2026-10-01 10:08:00+00
9	1	1	General message number 9	2026-10-01 10:09:00+00
10	1	2	General message number 10	2026-10-01 10:10:00+00
11	1	3	General message number 11	2026-10-01 10:11:00+00
12	1	1	General message number 12	2026-10-01 10:12:00+00
13	1	2	General message number 13	2026-10-01 10:13:00+00
14	1	3	General message number 14	2026-10-01 10:14:00+00
15	1	1	General message number 15	2026-10-01 10:15:00+00
16	1	2	General message number 16	2026-10-01 10:16:00+00
17	1	3	General message number 17	2026-10-01 10:17:00+00
18	1	1	General message number 18	2026-10-01 10:18:00+00
19	1	2	General message number 19	2026-10-01 10:19:00+00
20	1	3	General message number 20	2026-10-01 10:20:00+00
21	1	1	General message number 21	2026-10-01 10:21:00+00
22	1	2	General message number 22	2026-10-01 10:22:00+00
23	1	3	General message number 23	2026-10-01 10:23:00+00
24	1	1	General message number 24	2026-10-01 10:24:00+00
25	1	2	General message number 25	2026-10-01 10:25:00+00
26	2	1	Anyone done assignment 7?	2026-10-02 09:00:00+00
27	2	2	Working on it now.	2026-10-02 09:05:00+00
28	3	3	Game night on Friday?	2026-10-02 18:00:00+00
29	3	1	I am in.	2026-10-02 18:03:00+00
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, country, created_at) FROM stdin;
1	maria	BG	2026-11-03 16:56:03.250542+00
2	jonas	DE	2026-11-03 16:56:03.250542+00
3	akira	JP	2026-11-03 16:56:03.250542+00
4	lurker	US	2026-11-03 16:56:03.250542+00
\.


--
-- Name: channels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.channels_id_seq', 3, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.messages_id_seq', 30, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: channels channels_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channels
    ADD CONSTRAINT channels_name_key UNIQUE (name);


--
-- Name: channels channels_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.channels
    ADD CONSTRAINT channels_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: idx_messages_channel_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_messages_channel_time ON public.messages USING btree (channel_id, sent_at DESC);


--
-- Name: messages messages_channel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_channel_id_fkey FOREIGN KEY (channel_id) REFERENCES public.channels(id);


--
-- Name: messages messages_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

\unrestrict 28R6kjzKu86OhMKEcUGehmgspg1PNMJCoWI1RMIxGV7dRkuQCVZnOF80moZD5Jj

