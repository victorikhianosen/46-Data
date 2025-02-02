--
-- PostgreSQL database dump
--

-- Dumped from database version 12.20 (Ubuntu 12.20-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.20 (Ubuntu 12.20-0ubuntu0.20.04.1)

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
-- Name: readme; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.readme (
    text_field character varying(255)
);


ALTER TABLE public.readme OWNER TO postgres;

--
-- Data for Name: readme; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.readme (text_field) FROM stdin;
All your data is backed up. You must pay 0.01 BTC to 18224LViuRGEhqrUzeRLE9Y9ggogcdkNn5 In 48 hours, your data will be publicly disclosed and deleted. (more information: go to http://iplis.ru/data3)
After paying send mail to us: rambler+3mvn@onionmail.org and we will provide a link for you to download your data. Your DBCODE is: 3MVN
\.


--
-- PostgreSQL database dump complete
--

