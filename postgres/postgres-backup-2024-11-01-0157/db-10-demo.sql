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

--
-- Name: base_cache_signaling; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.base_cache_signaling
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_cache_signaling OWNER TO odoo;

--
-- Name: base_registry_signaling; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.base_registry_signaling
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_registry_signaling OWNER TO odoo;

--
-- Name: ir_sequence_001; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_001
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_001 OWNER TO odoo;

--
-- Name: ir_sequence_002; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_002
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_002 OWNER TO odoo;

--
-- Name: ir_sequence_003; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_003
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_003 OWNER TO odoo;

--
-- Name: ir_sequence_004; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_004
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_004 OWNER TO odoo;

--
-- Name: ir_sequence_005; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_005
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_005 OWNER TO odoo;

--
-- Name: ir_sequence_006; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_006
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_006 OWNER TO odoo;

--
-- Name: ir_sequence_007; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_007
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_007 OWNER TO odoo;

--
-- Name: base_cache_signaling; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.base_cache_signaling', 5, true);


--
-- Name: base_registry_signaling; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.base_registry_signaling', 4, true);


--
-- Name: ir_sequence_001; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_001', 1, false);


--
-- Name: ir_sequence_002; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_002', 1, false);


--
-- Name: ir_sequence_003; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_003', 1, false);


--
-- Name: ir_sequence_004; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_004', 1, false);


--
-- Name: ir_sequence_005; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_005', 1, false);


--
-- Name: ir_sequence_006; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_006', 1, false);


--
-- Name: ir_sequence_007; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_007', 1, false);


--
-- PostgreSQL database dump complete
--

