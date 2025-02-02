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
-- Name: ir_sequence_002_011; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_002_011
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_002_011 OWNER TO odoo;

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
-- Name: ir_sequence_015; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_015
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_015 OWNER TO odoo;

--
-- Name: ir_sequence_016; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_016
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_016 OWNER TO odoo;

--
-- Name: ir_sequence_017; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_017
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_017 OWNER TO odoo;

--
-- Name: ir_sequence_018; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_018
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_018 OWNER TO odoo;

--
-- Name: ir_sequence_019; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_019
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_019 OWNER TO odoo;

--
-- Name: ir_sequence_020; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_020
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_020 OWNER TO odoo;

--
-- Name: ir_sequence_021; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_021
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_021 OWNER TO odoo;

--
-- Name: ir_sequence_022; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_022
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_022 OWNER TO odoo;

--
-- Name: ir_sequence_023; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_023
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_023 OWNER TO odoo;

--
-- Name: ir_sequence_024; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_024
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_024 OWNER TO odoo;

--
-- Name: ir_sequence_025; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_025
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_025 OWNER TO odoo;

--
-- Name: ir_sequence_026; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_026
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_026 OWNER TO odoo;

--
-- Name: ir_sequence_028; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_028
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_028 OWNER TO odoo;

--
-- Name: ir_sequence_029; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_029
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_029 OWNER TO odoo;

--
-- Name: ir_sequence_030; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_030
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_030 OWNER TO odoo;

--
-- Name: ir_sequence_031; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_031
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_031 OWNER TO odoo;

--
-- Name: ir_sequence_032; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_032
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_032 OWNER TO odoo;

--
-- Name: ir_sequence_033; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_033
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_033 OWNER TO odoo;

--
-- Name: ir_sequence_034; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_034
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_034 OWNER TO odoo;

--
-- Name: ir_sequence_035; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_035
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_035 OWNER TO odoo;

--
-- Name: ir_sequence_036; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_036
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_036 OWNER TO odoo;

--
-- Name: ir_sequence_037; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_037
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_037 OWNER TO odoo;

--
-- Name: ir_sequence_038; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_038
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_038 OWNER TO odoo;

--
-- Name: ir_sequence_039; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_039
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_039 OWNER TO odoo;

--
-- Name: ir_sequence_040; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_040
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_040 OWNER TO odoo;

--
-- Name: ir_sequence_041; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_041
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_041 OWNER TO odoo;

--
-- Name: ir_sequence_042; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_042
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_042 OWNER TO odoo;

--
-- Name: ir_sequence_043; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_043
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_043 OWNER TO odoo;

--
-- Name: ir_sequence_044; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_044
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_044 OWNER TO odoo;

--
-- Name: ir_sequence_046; Type: SEQUENCE; Schema: public; Owner: odoo
--

CREATE SEQUENCE public.ir_sequence_046
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ir_sequence_046 OWNER TO odoo;

--
-- Name: base_cache_signaling; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.base_cache_signaling', 29965, true);


--
-- Name: base_registry_signaling; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.base_registry_signaling', 57, true);


--
-- Name: ir_sequence_001; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_001', 1, false);


--
-- Name: ir_sequence_002; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_002', 1, false);


--
-- Name: ir_sequence_002_011; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_002_011', 1, true);


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
-- Name: ir_sequence_015; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_015', 1, false);


--
-- Name: ir_sequence_016; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_016', 1, false);


--
-- Name: ir_sequence_017; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_017', 1, false);


--
-- Name: ir_sequence_018; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_018', 1, false);


--
-- Name: ir_sequence_019; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_019', 1, false);


--
-- Name: ir_sequence_020; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_020', 1, false);


--
-- Name: ir_sequence_021; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_021', 1, false);


--
-- Name: ir_sequence_022; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_022', 1, false);


--
-- Name: ir_sequence_023; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_023', 1, false);


--
-- Name: ir_sequence_024; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_024', 1, false);


--
-- Name: ir_sequence_025; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_025', 1, false);


--
-- Name: ir_sequence_026; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_026', 1, false);


--
-- Name: ir_sequence_028; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_028', 2, true);


--
-- Name: ir_sequence_029; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_029', 1, false);


--
-- Name: ir_sequence_030; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_030', 1, false);


--
-- Name: ir_sequence_031; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_031', 1, false);


--
-- Name: ir_sequence_032; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_032', 1, false);


--
-- Name: ir_sequence_033; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_033', 1, false);


--
-- Name: ir_sequence_034; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_034', 1, false);


--
-- Name: ir_sequence_035; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_035', 1, false);


--
-- Name: ir_sequence_036; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_036', 2, true);


--
-- Name: ir_sequence_037; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_037', 1, false);


--
-- Name: ir_sequence_038; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_038', 1, false);


--
-- Name: ir_sequence_039; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_039', 1, false);


--
-- Name: ir_sequence_040; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_040', 1, false);


--
-- Name: ir_sequence_041; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_041', 1, false);


--
-- Name: ir_sequence_042; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_042', 1, false);


--
-- Name: ir_sequence_043; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_043', 1, false);


--
-- Name: ir_sequence_044; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_044', 1, false);


--
-- Name: ir_sequence_046; Type: SEQUENCE SET; Schema: public; Owner: odoo
--

SELECT pg_catalog.setval('public.ir_sequence_046', 6, true);


--
-- PostgreSQL database dump complete
--

