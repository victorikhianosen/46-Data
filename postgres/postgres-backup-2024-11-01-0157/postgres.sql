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
-- Name: a_d_case_status_f(); Type: FUNCTION; Schema: public; Owner: icomply
--

CREATE FUNCTION public.a_d_case_status_f() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ 		DECLARE 			time_mark TIMESTAMP; 			pk_d VARCHAR(400); 			tbl_name VARCHAR(100); 			rec_state INTEGER; 			rs INTEGER; 		BEGIN 			time_mark = now()+'-28802 second'::interval; 			rs = 0;				rec_state = 3; 			tbl_name = 'CASE_STATUS'; 			pk_d = '<ID>'||OLD."ID"||'</ID>'; 			SELECT record_state INTO rs FROM "public"."history_store" WHERE table_name = tbl_name AND pk_date_src = pk_d; 			DELETE FROM "public"."history_store" WHERE table_name = tbl_name AND pk_date_src = pk_d; 			IF ((rs ISNULL) OR (rs <> 1)) THEN 				INSERT INTO "public"."history_store"(timemark, table_name, pk_date_src, pk_date_dest, record_state) VALUES (time_mark, tbl_name, pk_d, pk_d, rec_state ); 			END IF; 			RETURN OLD; 		END; 		$$;


ALTER FUNCTION public.a_d_case_status_f() OWNER TO icomply;

--
-- Name: a_i_case_status_f(); Type: FUNCTION; Schema: public; Owner: icomply
--

CREATE FUNCTION public.a_i_case_status_f() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ 						DECLARE 							time_mark TIMESTAMP; 							rec_state INTEGER; 							pk_d VARCHAR(400); 							tbl_name VARCHAR(100); 						BEGIN 							time_mark = now()+'-28802 second'::interval; 							tbl_name = 'CASE_STATUS'; 							pk_d = '<ID>'||NEW."ID"||'</ID>'; 							rec_state = 1;							DELETE FROM "public"."history_store" WHERE table_name = tbl_name AND pk_date_src = pk_d; 							INSERT INTO "public"."history_store"( timemark, table_name, pk_date_src, pk_date_dest, record_state ) 								VALUES (time_mark, tbl_name, pk_d, pk_d, rec_state ); 							RETURN NEW; 						END; 						$$;


ALTER FUNCTION public.a_i_case_status_f() OWNER TO icomply;

--
-- Name: a_u_case_status_f(); Type: FUNCTION; Schema: public; Owner: icomply
--

CREATE FUNCTION public.a_u_case_status_f() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ 		DECLARE 			time_mark TIMESTAMP; 			pk_d_old VARCHAR(400); 			pk_d VARCHAR(400); 			tbl_name VARCHAR(100); 			rec_state INTEGER; 			rs INTEGER; 		BEGIN 			time_mark = now()+'-28802 second'::interval; 			tbl_name = 'CASE_STATUS'; 			pk_d_old = '<ID>'||OLD."ID"||'</ID>'; 			pk_d = '<ID>'||NEW."ID"||'</ID>'; 			rec_state = 2; 			rs = 0; 			SELECT record_state INTO rs FROM "public"."history_store" WHERE table_name = tbl_name AND pk_date_src = pk_d_old; 			IF ((rs ISNULL) OR (rs = 0)) THEN 				INSERT INTO "public"."history_store"(timemark, table_name, pk_date_src, pk_date_dest, record_state)  					VALUES (time_mark, tbl_name, pk_d, pk_d_old, rec_state); 			ELSE 				UPDATE "public"."history_store" SET timemark = time_mark, pk_date_src = pk_d WHERE table_name = tbl_name AND pk_date_src = pk_d_old; 			END IF; 			RETURN NEW; 		END; 		$$;


ALTER FUNCTION public.a_u_case_status_f() OWNER TO icomply;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: log_tmp; Type: TABLE; Schema: public; Owner: postgresql
--

CREATE TABLE public.log_tmp (
    filename text
);


ALTER TABLE public.log_tmp OWNER TO postgresql;

--
-- Name: temp_msegtxnhki; Type: TABLE; Schema: public; Owner: postgresql
--

CREATE TABLE public.temp_msegtxnhki (
    o text
);


ALTER TABLE public.temp_msegtxnhki OWNER TO postgresql;

--
-- Name: temp_qpsvqceqdq; Type: TABLE; Schema: public; Owner: postgresql
--

CREATE TABLE public.temp_qpsvqceqdq (
    o text
);


ALTER TABLE public.temp_qpsvqceqdq OWNER TO postgresql;

--
-- Data for Name: log_tmp; Type: TABLE DATA; Schema: public; Owner: postgresql
--

COPY public.log_tmp (filename) FROM stdin;
\.


--
-- Data for Name: temp_msegtxnhki; Type: TABLE DATA; Schema: public; Owner: postgresql
--

COPY public.temp_msegtxnhki (o) FROM stdin;
\.


--
-- Data for Name: temp_qpsvqceqdq; Type: TABLE DATA; Schema: public; Owner: postgresql
--

COPY public.temp_qpsvqceqdq (o) FROM stdin;
\.


--
-- PostgreSQL database dump complete
--

