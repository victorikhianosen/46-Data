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
-- Name: alert; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.alert (
    id integer NOT NULL,
    alert_name character varying,
    status_id integer,
    user_id integer,
    alert_description text,
    rule_id character varying(30),
    alert_frequency_id character varying(30),
    alert_action character varying(255),
    team_id integer,
    exception_process_id integer,
    mail_to text,
    mail_cc character varying,
    alert_subject character varying(255),
    created_at character varying(31) DEFAULT now() NOT NULL,
    updated_at character varying(31),
    event_date character varying(31)
);


ALTER TABLE public.alert OWNER TO icomply;

--
-- Name: alert_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.alert_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alert_id_seq OWNER TO icomply;

--
-- Name: alert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: icomply
--

ALTER SEQUENCE public.alert_id_seq OWNED BY public.alert.id;


--
-- Name: am_account_type; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.am_account_type (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.am_account_type OWNER TO icomply;

--
-- Name: am_account_type_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.am_account_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.am_account_type_id_seq OWNER TO icomply;

--
-- Name: am_account_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: icomply
--

ALTER SEQUENCE public.am_account_type_id_seq OWNED BY public.am_account_type.id;


--
-- Name: am_approvers; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.am_approvers (
    id character varying,
    mdp character varying,
    name character varying NOT NULL,
    cimp character varying NOT NULL,
    nif integer NOT NULL,
    date_created character varying NOT NULL,
    branch_code integer,
    last_updated character varying,
    customer_id character varying,
    puti character varying,
    port integer,
    ddlv character varying
);


ALTER TABLE public.am_approvers OWNER TO icomply;

--
-- Name: am_branches; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.am_branches (
    branch_code character varying(500),
    branch_name character varying(500)
);


ALTER TABLE public.am_branches OWNER TO icomply;

--
-- Name: am_compliance_exceptions_found; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.am_compliance_exceptions_found (
    report_id numeric,
    exceptions_found text
);


ALTER TABLE public.am_compliance_exceptions_found OWNER TO icomply;

--
-- Name: am_currency; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.am_currency (
    currency_id integer,
    currency_name character varying(50),
    narration character varying(50)
);


ALTER TABLE public.am_currency OWNER TO icomply;

--
-- Name: am_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.am_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.am_customer_id_seq OWNER TO icomply;

--
-- Name: am_customer; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.am_customer (
    row_id character varying(255) DEFAULT nextval('public.am_customer_id_seq'::regclass),
    account_officer_id numeric,
    title_code character varying(11),
    id_number character varying(30),
    customer_id numeric NOT NULL,
    tier_id numeric,
    category_id numeric,
    lang_id numeric,
    lastname character varying(32),
    firstname character varying(32),
    sex character varying(6),
    dob character varying(11),
    town character varying(25),
    state character varying(25),
    payn character varying(30),
    sector_id numeric,
    nat_id character varying(8),
    company_name character varying(64),
    rc_num character varying(9),
    tax_id character varying(30),
    individual_profile numeric,
    branch_code character varying(9),
    age_group character varying(30),
    education_level character varying(30),
    transaction_profile character varying(30),
    bank_code character varying(30),
    othername character varying(30),
    reg_date character varying(30),
    middlename character varying(30),
    full_name character varying(64)
);


ALTER TABLE public.am_customer OWNER TO icomply;

--
-- Name: am_customer_account_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.am_customer_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.am_customer_account_id_seq OWNER TO icomply;

--
-- Name: am_customer_account; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.am_customer_account (
    id integer DEFAULT nextval('public.am_customer_account_id_seq'::regclass) NOT NULL,
    ext_rowid character varying(18) NOT NULL,
    account_number integer NOT NULL,
    product_name character varying(22) NOT NULL,
    branch_code integer NOT NULL,
    currency_code integer NOT NULL,
    account_name character varying(10) NOT NULL,
    customer_id integer NOT NULL,
    risk_rating character varying(30),
    date_created character varying(11) NOT NULL,
    product_code integer NOT NULL,
    gl_code integer NOT NULL,
    gl_code_id integer NOT NULL,
    gl_code_category_id integer NOT NULL,
    closure_status character varying(1) NOT NULL,
    account_type_id integer NOT NULL,
    balance numeric(12,2) NOT NULL
);


ALTER TABLE public.am_customer_account OWNER TO icomply;

--
-- Name: am_customer_bvn; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.am_customer_bvn (
    customer_id integer NOT NULL,
    bvn character varying(47) NOT NULL
);


ALTER TABLE public.am_customer_bvn OWNER TO icomply;

--
-- Name: am_customer_education_level; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.am_customer_education_level (
    id integer NOT NULL,
    name character varying(17) NOT NULL,
    category_code integer NOT NULL
);


ALTER TABLE public.am_customer_education_level OWNER TO icomply;

--
-- Name: am_customer_email; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.am_customer_email (
    customer_id integer NOT NULL,
    email_address character varying(47) NOT NULL
);


ALTER TABLE public.am_customer_email OWNER TO icomply;

--
-- Name: am_customer_individual_profile; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.am_customer_individual_profile (
    id integer NOT NULL,
    name text NOT NULL,
    category_code integer
);


ALTER TABLE public.am_customer_individual_profile OWNER TO icomply;

--
-- Name: am_customer_language; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.am_customer_language (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    category_code integer
);


ALTER TABLE public.am_customer_language OWNER TO icomply;

--
-- Name: am_customer_phone; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.am_customer_phone (
    row_id character varying(18) NOT NULL,
    customer_id integer NOT NULL,
    phone_number numeric NOT NULL,
    prefix character varying(3) NOT NULL,
    categ integer NOT NULL
);


ALTER TABLE public.am_customer_phone OWNER TO icomply;

--
-- Name: am_customer_priority; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.am_customer_priority (
    customer_id integer NOT NULL,
    name character varying NOT NULL,
    profile_date character varying(11) NOT NULL
);


ALTER TABLE public.am_customer_priority OWNER TO icomply;

--
-- Name: am_customer_profile_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.am_customer_profile_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.am_customer_profile_customer_id_seq OWNER TO icomply;

--
-- Name: am_customer_profile; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.am_customer_profile (
    customer_id integer DEFAULT nextval('public.am_customer_profile_customer_id_seq'::regclass) NOT NULL,
    profile_id integer NOT NULL,
    profile_date character varying(11) NOT NULL
);


ALTER TABLE public.am_customer_profile OWNER TO icomply;

--
-- Name: am_customer_tier; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.am_customer_tier (
    tier_id integer NOT NULL,
    name character varying(19) NOT NULL
);


ALTER TABLE public.am_customer_tier OWNER TO icomply;

--
-- Name: am_customer_transaction_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.am_customer_transaction_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.am_customer_transaction_profile_id_seq OWNER TO icomply;

--
-- Name: am_customer_transaction_profile; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.am_customer_transaction_profile (
    id integer DEFAULT nextval('public.am_customer_transaction_profile_id_seq'::regclass) NOT NULL,
    name character varying(20) NOT NULL,
    category_code integer NOT NULL
);


ALTER TABLE public.am_customer_transaction_profile OWNER TO icomply;

--
-- Name: am_dormant_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.am_dormant_accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.am_dormant_accounts_id_seq OWNER TO icomply;

--
-- Name: am_dormant_accounts; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.am_dormant_accounts (
    id integer DEFAULT nextval('public.am_dormant_accounts_id_seq'::regclass) NOT NULL,
    branch_code integer NOT NULL,
    branch_name character varying(24) NOT NULL,
    account_number integer NOT NULL,
    account_name character varying(11) NOT NULL,
    current_balance numeric(11,2) NOT NULL,
    dormancy_date character varying(11) NOT NULL,
    stoppage character varying(15) NOT NULL,
    account_type character varying(7) NOT NULL,
    date_opened character varying(11) NOT NULL,
    tin_number character varying(15),
    bvn numeric NOT NULL,
    closure_status character varying(4) NOT NULL
);


ALTER TABLE public.am_dormant_accounts OWNER TO icomply;

--
-- Name: am_internal_accounts; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.am_internal_accounts (
    id numeric,
    gl_code numeric,
    gl_name character varying
);


ALTER TABLE public.am_internal_accounts OWNER TO icomply;

--
-- Name: am_ledger; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.am_ledger (
    branch_code numeric,
    gl_code_id numeric,
    gl_code numeric,
    category_id numeric,
    "NAME" character varying(50),
    currency_name character varying(50),
    created_at date,
    last_updated character varying
);


ALTER TABLE public.am_ledger OWNER TO icomply;

--
-- Name: am_names; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.am_names (
    id character varying,
    name character varying(30) NOT NULL
);


ALTER TABLE public.am_names OWNER TO icomply;

--
-- Name: am_overdue_cases; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.am_overdue_cases (
    title character varying(59) NOT NULL,
    category character varying(42) NOT NULL,
    days_overdue integer NOT NULL,
    since character varying(12) NOT NULL,
    status character varying(4) NOT NULL,
    staff_responsible character varying(11) NOT NULL,
    rating character varying(8) NOT NULL
);


ALTER TABLE public.am_overdue_cases OWNER TO icomply;

--
-- Name: am_staff; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.am_staff (
    id integer NOT NULL,
    staff_name character varying NOT NULL,
    department character varying NOT NULL,
    email character varying NOT NULL,
    dept_email character varying,
    staff_id character varying NOT NULL,
    user_id integer,
    os_user character varying(7)
);


ALTER TABLE public.am_staff OWNER TO icomply;

--
-- Name: am_staff_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.am_staff_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.am_staff_id_seq OWNER TO icomply;

--
-- Name: am_staff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: icomply
--

ALTER SEQUENCE public.am_staff_id_seq OWNED BY public.am_staff.id;


--
-- Name: aml_report; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.aml_report (
    id integer NOT NULL,
    name character varying(100),
    download_url character varying(100),
    user_id integer,
    report_type_id integer,
    created_at timestamp(6) without time zone,
    status numeric,
    category character varying(200),
    xml_data text,
    error_msg character varying(500),
    date_from date,
    date_to date
);


ALTER TABLE public.aml_report OWNER TO icomply;

--
-- Name: aml_report_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.aml_report_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aml_report_id_seq OWNER TO icomply;

--
-- Name: aml_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: icomply
--

ALTER SEQUENCE public.aml_report_id_seq OWNED BY public.aml_report.id;


--
-- Name: app_config; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.app_config (
    id bigint,
    name character varying,
    val character varying,
    description character varying
);


ALTER TABLE public.app_config OWNER TO icomply;

--
-- Name: app_pep_accounts; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.app_pep_accounts (
    id integer NOT NULL,
    branch_code integer NOT NULL,
    customer_id integer NOT NULL,
    debited numeric(13,2) NOT NULL,
    credited numeric(13,2) NOT NULL,
    date_opened character varying(11) NOT NULL,
    account_officer_id character varying NOT NULL
);


ALTER TABLE public.app_pep_accounts OWNER TO icomply;

--
-- Name: app_pep_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.app_pep_accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_pep_accounts_id_seq OWNER TO icomply;

--
-- Name: app_pep_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: icomply
--

ALTER SEQUENCE public.app_pep_accounts_id_seq OWNED BY public.app_pep_accounts.id;


--
-- Name: app_views; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.app_views (
    view_name character varying,
    sql_query text
);


ALTER TABLE public.app_views OWNER TO icomply;

--
-- Name: cache; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO icomply;

--
-- Name: case_management; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.case_management (
    id bigint NOT NULL,
    user_id bigint,
    case_status_id bigint,
    priority_level_id bigint,
    description character varying(255),
    reason_for_close character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    assigned_user bigint,
    case_action character varying(255),
    department_id bigint,
    process_id bigint,
    process_categoryid bigint,
    assigned_user_response character varying(255),
    alert_id bigint,
    supervisor_1 bigint,
    supervisor_2 bigint,
    supervisor_3 bigint,
    event_date timestamp(0) without time zone,
    title character varying(255),
    exception_process_id bigint,
    exception_log_id bigint[]
);


ALTER TABLE public.case_management OWNER TO icomply;

--
-- Name: case_management_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.case_management_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.case_management_id_seq OWNER TO icomply;

--
-- Name: case_management_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: icomply
--

ALTER SEQUENCE public.case_management_id_seq OWNED BY public.case_management.id;


--
-- Name: case_status; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.case_status (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.case_status OWNER TO icomply;

--
-- Name: case_status_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.case_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.case_status_id_seq OWNER TO icomply;

--
-- Name: case_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: icomply
--

ALTER SEQUENCE public.case_status_id_seq OWNED BY public.case_status.id;


--
-- Name: cases; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.cases (
    id integer NOT NULL,
    title character varying,
    cases_description character varying,
    created_at character varying,
    updated_at character varying,
    status_id integer,
    alert_id integer,
    team_id integer,
    staff_id integer,
    cases_action character varying,
    user_id integer,
    event_date character varying,
    rating_id integer,
    exception_process_id integer,
    response_note character varying,
    responses jsonb
);


ALTER TABLE public.cases OWNER TO icomply;

--
-- Name: cases_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.cases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cases_id_seq OWNER TO icomply;

--
-- Name: cases_id_seq1; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.cases_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cases_id_seq1 OWNER TO icomply;

--
-- Name: cases_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: icomply
--

ALTER SEQUENCE public.cases_id_seq1 OWNED BY public.cases.id;


--
-- Name: compliance_checklist; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.compliance_checklist (
    id integer NOT NULL,
    name character varying,
    implications character varying,
    report_type_id integer,
    user_id character varying,
    created_at character varying DEFAULT now() NOT NULL,
    status integer,
    scope_id integer,
    key character varying,
    timeline character varying,
    exception_details character varying,
    exception_status character varying,
    was_carried_out character varying,
    recommendation character varying NOT NULL,
    branches_involved character varying,
    action_taken character varying,
    review_description character varying,
    description character varying,
    exception_noted character varying,
    created_by integer,
    weightage integer NOT NULL,
    product character varying
);


ALTER TABLE public.compliance_checklist OWNER TO icomply;

--
-- Name: compliance_checklist_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.compliance_checklist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compliance_checklist_id_seq OWNER TO icomply;

--
-- Name: compliance_checklist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: icomply
--

ALTER SEQUENCE public.compliance_checklist_id_seq OWNED BY public.compliance_checklist.id;


--
-- Name: compliance_report; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.compliance_report (
    id numeric,
    report_name character varying(50),
    narration character varying(50),
    report_type_id numeric,
    user_id numeric,
    date_from date,
    date_to date,
    account_number character varying(50),
    branch_code character varying(50),
    gl_code character varying(50),
    status character varying(50),
    created_at character varying(50),
    "KEY" character varying(50),
    recommendation character varying(50),
    "SCOPE" character varying(50),
    supervisor_comment character varying(50),
    new_created_at timestamp without time zone
);


ALTER TABLE public.compliance_report OWNER TO icomply;

--
-- Name: compliance_report_line; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.compliance_report_line (
    id numeric,
    report_id numeric,
    checklist_id numeric,
    response character varying(50),
    created_at date,
    user_id numeric,
    recommendation character varying(50),
    branches character varying(50),
    action_taken character varying(50),
    exception_noted character varying(50),
    review_desc character varying(50)
);


ALTER TABLE public.compliance_report_line OWNER TO icomply;

--
-- Name: compliance_report_type; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.compliance_report_type (
    id numeric,
    "NAME" character varying(50),
    user_id numeric,
    created_at date,
    description character varying(50),
    slug character varying(50),
    category character varying(50)
);


ALTER TABLE public.compliance_report_type OWNER TO icomply;

--
-- Name: compliance_stat_categ_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.compliance_stat_categ_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compliance_stat_categ_id_seq OWNER TO icomply;

--
-- Name: compliance_stat_categ; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.compliance_stat_categ (
    id integer DEFAULT nextval('public.compliance_stat_categ_id_seq'::regclass) NOT NULL,
    name character varying(21) NOT NULL,
    slug character varying(19) NOT NULL,
    created_at character varying(31)
);


ALTER TABLE public.compliance_stat_categ OWNER TO icomply;

--
-- Name: compliance_statistics; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.compliance_statistics (
    name character varying,
    sql_query character varying(512),
    val character varying(50),
    created_at character varying(50),
    last_updated character varying(50),
    slug character varying(50),
    status character varying(50),
    process_order numeric,
    char_format character varying(50),
    categ character varying(50),
    branch_code character varying,
    download_query character varying(512),
    update_mode character varying(50),
    icon character varying(50),
    url character varying(128),
    description character varying(128),
    url_request character varying(50),
    request_parameters character varying(50),
    risk_score numeric,
    risk_assessment_id numeric,
    risk_univ_id numeric,
    id numeric NOT NULL
);


ALTER TABLE public.compliance_statistics OWNER TO icomply;

--
-- Name: compliance_statistics_new_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.compliance_statistics_new_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compliance_statistics_new_id_seq OWNER TO icomply;

--
-- Name: compliance_statistics_new_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: icomply
--

ALTER SEQUENCE public.compliance_statistics_new_id_seq OWNED BY public.compliance_statistics.id;


--
-- Name: compliance_statisticss; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.compliance_statisticss (
    id integer NOT NULL,
    name character varying(37) NOT NULL,
    sql_query character varying(308),
    val numeric(8,2),
    created_at character varying(31),
    last_updated character varying(31),
    slug character varying(46) NOT NULL,
    status character varying(8),
    process_order integer,
    char_format character varying(15) NOT NULL,
    categ character varying(26),
    branch_code integer,
    download_query character varying(258),
    update_mode character varying(9),
    icon character varying(12),
    url character varying(93),
    description character varying(87),
    url_request character varying(30),
    request_parameters character varying(30),
    risk_score numeric(4,1) NOT NULL,
    risk_assessment_id integer,
    risk_univ_id integer
);


ALTER TABLE public.compliance_statisticss OWNER TO icomply;

--
-- Name: comply; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.comply (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.comply OWNER TO icomply;

--
-- Name: comply_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.comply_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comply_id_seq OWNER TO icomply;

--
-- Name: comply_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: icomply
--

ALTER SEQUENCE public.comply_id_seq OWNED BY public.comply.id;


--
-- Name: ctl_account; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.ctl_account (
    account_number character varying,
    branch_code character varying,
    currency_code character varying,
    gl_code character varying,
    customer_id character varying,
    name character varying,
    date_created date
);


ALTER TABLE public.ctl_account OWNER TO icomply;

--
-- Name: ctl_alert_group_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.ctl_alert_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ctl_alert_group_id_seq OWNER TO icomply;

--
-- Name: ctl_alert_group; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.ctl_alert_group (
    id integer DEFAULT nextval('public.ctl_alert_group_id_seq'::regclass) NOT NULL,
    name character varying(29) NOT NULL,
    created_at character varying(31) NOT NULL,
    email character varying(63) NOT NULL,
    email_cc character varying(42),
    state character varying(6) NOT NULL,
    tag character varying(11) NOT NULL
);


ALTER TABLE public.ctl_alert_group OWNER TO icomply;

--
-- Name: ctl_branch; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.ctl_branch (
    branch_code integer NOT NULL,
    branch_name character varying(30) NOT NULL
);


ALTER TABLE public.ctl_branch OWNER TO icomply;

--
-- Name: ctl_collections; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.ctl_collections (
    id integer NOT NULL,
    name character varying NOT NULL,
    val1 character varying NOT NULL,
    val2 character varying NOT NULL,
    val3 character varying
);


ALTER TABLE public.ctl_collections OWNER TO icomply;

--
-- Name: ctl_collections_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.ctl_collections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ctl_collections_id_seq OWNER TO icomply;

--
-- Name: ctl_collections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: icomply
--

ALTER SEQUENCE public.ctl_collections_id_seq OWNED BY public.ctl_collections.id;


--
-- Name: ctl_control_officer; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.ctl_control_officer (
    id integer NOT NULL,
    branch_code character varying(9) NOT NULL,
    alert_group_id integer NOT NULL,
    employee_id integer NOT NULL,
    created_at character varying NOT NULL
);


ALTER TABLE public.ctl_control_officer OWNER TO icomply;

--
-- Name: ctl_currency; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.ctl_currency (
    currency_id integer NOT NULL,
    currency_name character varying(3) NOT NULL,
    narration character varying(30) NOT NULL
);


ALTER TABLE public.ctl_currency OWNER TO icomply;

--
-- Name: ctl_document_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.ctl_document_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ctl_document_id_seq OWNER TO icomply;

--
-- Name: ctl_document; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.ctl_document (
    id integer DEFAULT nextval('public.ctl_document_id_seq'::regclass) NOT NULL,
    file_name character varying(48),
    user_id numeric NOT NULL,
    mime_type character varying(15),
    document_type_id numeric,
    created_at character varying(31),
    updated_at character varying(30),
    source_file character varying,
    charset character varying(30),
    name character varying(22) NOT NULL,
    description character varying(20),
    ref_number character varying(7),
    exception_process_id numeric,
    first_owner_id numeric,
    second_owner_id numeric,
    alert_rule_id character varying(30),
    approver_id numeric,
    approved_at character varying(31),
    status character varying(8)
);


ALTER TABLE public.ctl_document OWNER TO icomply;

--
-- Name: ctl_document_type; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.ctl_document_type (
    id integer NOT NULL,
    name character varying(9) NOT NULL,
    status character varying(30),
    created_at character varying(31) NOT NULL,
    updated_at character varying(30)
);


ALTER TABLE public.ctl_document_type OWNER TO icomply;

--
-- Name: ctl_general_ledger_hist; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.ctl_general_ledger_hist (
    id integer,
    branch_code numeric,
    account_number numeric,
    gl_code numeric,
    currency_code character varying(50),
    account_name character varying(50),
    prev_bal numeric,
    cur_bal numeric,
    bal numeric,
    cur_date character varying(50),
    prev_date character varying(50),
    created_at character varying(50),
    exchange_rate real,
    debited numeric,
    credited numeric
);


ALTER TABLE public.ctl_general_ledger_hist OWNER TO icomply;

--
-- Name: ctl_overdrawn_accounts; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.ctl_overdrawn_accounts (
    customer_name character varying(67),
    account_number numeric NOT NULL,
    branch_code integer NOT NULL,
    trans_date character varying(11) NOT NULL,
    currency_code character varying(3) NOT NULL,
    currency_id integer NOT NULL,
    balance numeric(13,2) NOT NULL,
    product_code integer,
    product_name character varying(30) NOT NULL,
    current_balance numeric(13,2) NOT NULL,
    account_officer_name character varying(20) NOT NULL,
    account_officer_id character varying(3) NOT NULL,
    customer_id integer NOT NULL,
    inti character varying(30) NOT NULL,
    email character varying(58),
    phone_number numeric NOT NULL,
    gl_code integer
);


ALTER TABLE public.ctl_overdrawn_accounts OWNER TO icomply;

--
-- Name: ctl_system_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.ctl_system_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ctl_system_id_seq OWNER TO icomply;

--
-- Name: ctl_system; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.ctl_system (
    id integer DEFAULT nextval('public.ctl_system_id_seq'::regclass) NOT NULL,
    model_number character varying(255),
    owner_1 numeric,
    owner_2 numeric,
    created_at character varying(38) NOT NULL,
    owner character varying,
    approver_id character varying,
    process_category character varying NOT NULL,
    exception_process_id character varying NOT NULL,
    additional_comment character varying,
    approved_at character varying(30),
    reference_number character varying,
    name character varying(255) NOT NULL,
    category_id numeric NOT NULL
);


ALTER TABLE public.ctl_system OWNER TO icomply;

--
-- Name: ctl_system_allocation_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.ctl_system_allocation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ctl_system_allocation_id_seq OWNER TO icomply;

--
-- Name: ctl_system_allocation; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.ctl_system_allocation (
    created_at character varying,
    user_id numeric NOT NULL,
    reference_number character varying,
    status character varying NOT NULL,
    category_id numeric NOT NULL,
    system_id character varying,
    approved_at character varying(38),
    description character varying,
    responsible_id numeric NOT NULL,
    id integer DEFAULT nextval('public.ctl_system_allocation_id_seq'::regclass) NOT NULL,
    approver_id numeric
);


ALTER TABLE public.ctl_system_allocation OWNER TO icomply;

--
-- Name: ctl_system_category_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.ctl_system_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ctl_system_category_id_seq OWNER TO icomply;

--
-- Name: ctl_system_category; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.ctl_system_category (
    id integer DEFAULT nextval('public.ctl_system_category_id_seq'::regclass) NOT NULL,
    name character varying(16) NOT NULL,
    created_at character varying NOT NULL,
    category_id character varying
);


ALTER TABLE public.ctl_system_category OWNER TO icomply;

--
-- Name: ctr_report_types_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.ctr_report_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ctr_report_types_id_seq OWNER TO icomply;

--
-- Name: ctr_report_types; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.ctr_report_types (
    id integer DEFAULT nextval('public.ctr_report_types_id_seq'::regclass) NOT NULL,
    name character varying(23) NOT NULL,
    slug character varying(18) NOT NULL
);


ALTER TABLE public.ctr_report_types OWNER TO icomply;

--
-- Name: ctr_transactions; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.ctr_transactions (
    id integer NOT NULL,
    t_account_number numeric,
    t_trans_number character varying NOT NULL,
    t_location character varying(30) NOT NULL,
    transaction_description character varying(100),
    t_teller character varying NOT NULL,
    t_authorized character varying NOT NULL,
    t_late_deposit numeric NOT NULL,
    t_transmode_code character varying NOT NULL,
    t_amount_local numeric NOT NULL,
    t_source_client_type character varying(30),
    t_source_type character varying(30),
    t_source_funds_code character varying NOT NULL,
    t_source_currency_code character varying NOT NULL,
    t_source_foreign_amount numeric,
    t_source_exchange_rate numeric,
    t_source_country character varying(2) NOT NULL,
    t_source_institution_code numeric,
    t_source_institution_name character varying(30) NOT NULL,
    t_source_account_number numeric,
    t_source_account_name character varying(61),
    t_source_person_first_name character varying(30),
    t_source_person_last_name character varying(30),
    t_source_entity_name character varying(30),
    t_dest_client_type character varying(30),
    t_dest_type character varying(30),
    t_dest_funds_code character varying(1) NOT NULL,
    t_dest_currency_code character varying(3) NOT NULL,
    t_dest_foreign_amount numeric,
    t_dest_exchange_rate numeric,
    t_dest_country character varying NOT NULL,
    t_dest_institution_code numeric,
    t_dest_institution_name character varying(25) NOT NULL,
    t_dest_account_number numeric,
    t_dest_account_name character varying(50),
    t_dest_person_first_name character varying(30),
    t_dest_person_last_name character varying(30),
    t_dest_entity_name character varying(30),
    tran_type character varying NOT NULL,
    created_at character varying(31) NOT NULL,
    t_date_posting character varying(31) NOT NULL,
    t_value_date character varying(31) NOT NULL,
    t_date character varying(31) NOT NULL,
    t_client_number numeric,
    t_gender character varying(1),
    t_title character varying(30) NOT NULL,
    t_firstname character varying(30),
    t_lastname character varying(41) NOT NULL,
    t_dob character varying(31) NOT NULL,
    t_phone numeric NOT NULL,
    t_address character varying NOT NULL,
    t_city character varying(30),
    t_state character varying(30),
    t_idnumber character varying(20),
    t_idregdate character varying NOT NULL,
    t_taxno character varying,
    t_taxregdate character varying,
    t_acctopndate character varying(31) NOT NULL,
    t_balance numeric NOT NULL,
    row_ref character varying NOT NULL
);


ALTER TABLE public.ctr_transactions OWNER TO icomply;

--
-- Name: department; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.department (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255),
    created_at timestamp(0) without time zone DEFAULT '2023-08-23 16:49:12'::timestamp without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT '2023-08-23 16:49:12'::timestamp without time zone NOT NULL
);


ALTER TABLE public.department OWNER TO icomply;

--
-- Name: department_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.department_id_seq OWNER TO icomply;

--
-- Name: department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: icomply
--

ALTER SEQUENCE public.department_id_seq OWNED BY public.department.id;


--
-- Name: download_notifier; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.download_notifier (
    id bigint NOT NULL,
    temp_dir character varying(255) NOT NULL,
    ip_address character varying(255),
    download_status character varying(255),
    file_size character varying(255),
    created_at timestamp(0) without time zone DEFAULT '2023-11-26 22:53:13'::timestamp without time zone
);


ALTER TABLE public.download_notifier OWNER TO icomply;

--
-- Name: download_notifier_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.download_notifier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.download_notifier_id_seq OWNER TO icomply;

--
-- Name: download_notifier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: icomply
--

ALTER SEQUENCE public.download_notifier_id_seq OWNED BY public.download_notifier.id;


--
-- Name: download_queue; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.download_queue (
    id bigint NOT NULL,
    user_id integer,
    ip_address character varying(255),
    file_name character varying(255),
    file_size character varying(255),
    temp_directory character varying(255),
    query_string character varying(255),
    download_status character varying(255),
    downloaded_at character varying(255),
    created_at timestamp(0) without time zone DEFAULT '2023-11-26 22:09:17'::timestamp without time zone
);


ALTER TABLE public.download_queue OWNER TO icomply;

--
-- Name: download_queue_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.download_queue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.download_queue_id_seq OWNER TO icomply;

--
-- Name: download_queue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: icomply
--

ALTER SEQUENCE public.download_queue_id_seq OWNED BY public.download_queue.id;


--
-- Name: exception_category; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.exception_category (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT '2023-09-06 13:01:29'::timestamp without time zone NOT NULL
);


ALTER TABLE public.exception_category OWNER TO icomply;

--
-- Name: exception_category_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.exception_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exception_category_id_seq OWNER TO icomply;

--
-- Name: exception_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: icomply
--

ALTER SEQUENCE public.exception_category_id_seq OWNED BY public.exception_category.id;


--
-- Name: exception_frequency; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.exception_frequency (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT '2023-09-06 12:45:40'::timestamp without time zone NOT NULL
);


ALTER TABLE public.exception_frequency OWNER TO icomply;

--
-- Name: exception_frequency_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.exception_frequency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exception_frequency_id_seq OWNER TO icomply;

--
-- Name: exception_frequency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: icomply
--

ALTER SEQUENCE public.exception_frequency_id_seq OWNED BY public.exception_frequency.id;


--
-- Name: exceptions_logs; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.exceptions_logs (
    id integer NOT NULL,
    user_id integer,
    title character varying(69),
    rating_id integer NOT NULL,
    event_date character varying(31) NOT NULL,
    category_id integer NOT NULL,
    status_id integer NOT NULL,
    cases_action character varying(49),
    created_at character varying(31),
    rule_id integer,
    transaction_id integer,
    process_id integer,
    staff_id integer,
    team_id integer,
    alert_id integer,
    closed_date character varying(31),
    direct_supervisor integer,
    group_head integer,
    divisional_head integer,
    close_remarks character varying(71),
    attachment character varying(23) NOT NULL,
    attachment_mime_type character varying(39),
    attachment_last_updated character varying(30),
    attachment_filename character varying(68),
    attachment_charset character varying(30),
    response_note character varying(86),
    customer_id integer,
    exception_process_id character varying(30),
    cases_description character varying(378),
    tran_id character varying(18)
);


ALTER TABLE public.exceptions_logs OWNER TO icomply;

--
-- Name: exception_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.exception_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exception_logs_id_seq OWNER TO icomply;

--
-- Name: exception_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: icomply
--

ALTER SEQUENCE public.exception_logs_id_seq OWNED BY public.exceptions_logs.id;


--
-- Name: exception_process; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.exception_process (
    id numeric NOT NULL,
    name character varying(255) NOT NULL,
    sql_text text,
    frequency character varying(10),
    category_id numeric,
    email_to character varying(255),
    state character varying(255),
    alert_group_id numeric,
    branch_code character varying,
    type_id numeric,
    risk_rating_id numeric,
    first_line_owner numeric,
    second_line_owner numeric,
    first_owner_id numeric,
    policy_id numeric,
    second_owner_id numeric,
    approver_id numeric,
    approved_at character varying(255),
    user_id numeric,
    created_at character varying(255),
    narration text
);


ALTER TABLE public.exception_process OWNER TO icomply;

--
-- Name: exception_process_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.exception_process_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exception_process_id_seq OWNER TO icomply;

--
-- Name: exception_process_; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.exception_process_ (
    id integer DEFAULT nextval('public.exception_process_id_seq'::regclass) NOT NULL,
    name character varying(73) NOT NULL,
    sql_text text,
    frequency character varying(3),
    email_to text,
    state character varying(8) NOT NULL,
    alert_group_id integer,
    branch_code integer NOT NULL,
    process_id integer,
    risk_rating_id character varying(30),
    first_line_owner character varying(30),
    second_line_owner character varying(30),
    first_owner_id character varying(30),
    policy_id character varying(30),
    second_owner_id character varying(30),
    approver_id character varying(30),
    approved_at character varying(31) NOT NULL,
    user_id integer NOT NULL,
    created_at character varying(31) NOT NULL,
    narration character varying NOT NULL,
    type_id numeric
);


ALTER TABLE public.exception_process_ OWNER TO icomply;

--
-- Name: exception_process_id_seq1; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.exception_process_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exception_process_id_seq1 OWNER TO icomply;

--
-- Name: exception_process_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: icomply
--

ALTER SEQUENCE public.exception_process_id_seq1 OWNED BY public.exception_process.id;


--
-- Name: exception_process_status_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.exception_process_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exception_process_status_id_seq OWNER TO icomply;

--
-- Name: exception_process_status; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.exception_process_status (
    id bigint DEFAULT nextval('public.exception_process_status_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT '2023-09-06 12:34:42'::timestamp without time zone NOT NULL
);


ALTER TABLE public.exception_process_status OWNER TO icomply;

--
-- Name: exception_process_type_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.exception_process_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exception_process_type_id_seq OWNER TO icomply;

--
-- Name: exception_process_type; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.exception_process_type (
    id integer DEFAULT nextval('public.exception_process_type_id_seq'::regclass) NOT NULL,
    name character varying(117) NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.exception_process_type OWNER TO icomply;

--
-- Name: exception_status; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.exception_status (
    id integer NOT NULL,
    name character varying(5) NOT NULL,
    description character varying(6) NOT NULL
);


ALTER TABLE public.exception_status OWNER TO icomply;

--
-- Name: exception_status_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.exception_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exception_status_id_seq OWNER TO icomply;

--
-- Name: exception_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: icomply
--

ALTER SEQUENCE public.exception_status_id_seq OWNED BY public.exception_status.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO icomply;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.failed_jobs_id_seq OWNER TO icomply;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: icomply
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: jobs; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO icomply;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.jobs_id_seq OWNER TO icomply;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: icomply
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO icomply;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO icomply;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: icomply
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: overdrawn_accounts; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.overdrawn_accounts (
    customer_name character varying(67) NOT NULL,
    account_number integer NOT NULL,
    branch_code numeric NOT NULL,
    trans_date character varying(11) NOT NULL,
    currency_code character varying(3) NOT NULL,
    currency_id integer NOT NULL,
    balance character varying NOT NULL,
    product_code integer,
    product_name character varying(30) NOT NULL,
    current_balance numeric(13,2) NOT NULL,
    account_officer_name character varying(20) NOT NULL,
    account_officer_id character varying(3) NOT NULL,
    customer_id integer NOT NULL,
    inti character varying(30) NOT NULL,
    email character varying(58),
    phone_number numeric NOT NULL,
    gl_code numeric NOT NULL
);


ALTER TABLE public.overdrawn_accounts OWNER TO icomply;

--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_resets OWNER TO icomply;

--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO icomply;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO icomply;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: icomply
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: priority_level; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.priority_level (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    description character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.priority_level OWNER TO icomply;

--
-- Name: priority_level_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.priority_level_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.priority_level_id_seq OWNER TO icomply;

--
-- Name: priority_level_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: icomply
--

ALTER SEQUENCE public.priority_level_id_seq OWNED BY public.priority_level.id;


--
-- Name: report; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.report (
    id numeric,
    "NAME" character varying(50),
    sql_query character varying(512),
    val character varying(50),
    created_at character varying(50),
    last_updated character varying(50),
    slug character varying(50),
    status character varying(50),
    process_order numeric,
    char_format character varying(50),
    categ character varying(50),
    branch_code character varying(50),
    download_query character varying(512),
    update_mode character varying(50),
    icon character varying(50),
    url character varying(128),
    description character varying(128),
    url_request character varying(50),
    request_parameters character varying(50),
    risk_score numeric,
    risk_assessment_id numeric,
    risk_univ_id numeric
);


ALTER TABLE public.report OWNER TO icomply;

--
-- Name: st_customers; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.st_customers (
    customer_code character varying(500),
    mnemonic character varying(500),
    short_name character varying(500),
    address character varying(500),
    town_country character varying(500),
    country character varying(500),
    sector numeric,
    street character varying(500),
    account_officer character varying(500),
    post_code character varying(500),
    industry character varying(500),
    legal_id character varying(500),
    legal_doc_name character varying(500),
    legal_holder_name character varying(500),
    legal_iss_auth character varying(500),
    legal_iss_date date,
    legal_exp_date date,
    customer_rating character varying(500),
    cr_profile_type character varying(500),
    cr_profile character varying(500),
    title character varying(500),
    given_names character varying(500),
    family_name character varying(500),
    gender character varying(500),
    date_of_birth character varying(500),
    marital_status character varying(500),
    sms_1 character varying(500),
    email_1 character varying(500),
    customer_currency character varying(500),
    salary character varying(500)
);


ALTER TABLE public.st_customers OWNER TO icomply;

--
-- Name: st_stmt_entry; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.st_stmt_entry (
    id integer NOT NULL,
    stmt_entry_id character varying NOT NULL,
    account_number integer NOT NULL,
    company_code character varying NOT NULL,
    amt_lcy numeric NOT NULL,
    transaction_code integer NOT NULL,
    their_reference character varying,
    narrative character varying NOT NULL,
    pl_category character varying,
    customer_id integer,
    account_officer integer NOT NULL,
    product_category integer NOT NULL,
    value_date character varying NOT NULL,
    currency character varying NOT NULL,
    amount_fcy character varying,
    exchange_rate numeric,
    negotiated_ref_num character varying,
    position_type character varying,
    our_reference character varying,
    reversal_marker character varying,
    exposure_date date,
    currency_market integer NOT NULL,
    department_code integer,
    trans_reference character varying NOT NULL,
    system_id character varying NOT NULL,
    booking_date character varying NOT NULL,
    stmt_no character varying NOT NULL,
    override character varying,
    record_status character varying,
    curr_no integer,
    inputter character varying NOT NULL,
    date_time character varying NOT NULL,
    authoriser character varying NOT NULL,
    suspense_category character varying,
    suspnse_value_date character varying,
    suppress_position character varying,
    crf_type character varying,
    crf_txn_code character varying,
    crf_currency character varying,
    consol_key character varying,
    crf_mat_date character varying,
    crf_prod_cat character varying,
    pm_type character varying,
    dealer_desk integer,
    counterparty character varying,
    liquidation_mode character varying,
    repayment_date character varying,
    repayment_type character varying,
    repayment_amt character varying,
    outstanding_bal character varying,
    contract_int_rate character varying,
    contract_int_key character varying,
    cycle_forward date,
    orig_local_equiv character varying,
    original_amount character varying,
    original_ccy character varying,
    original_acct character varying,
    original_exch_rate character varying,
    exp_split_date character varying,
    exp_split_amt character varying,
    orig_amount_lcy character varying,
    bank_sort_cde character varying,
    cheque_number integer,
    chq_coll_id integer,
    drawn_account character varying,
    accounting_date character varying,
    pc_period_end character varying,
    pc_applied character varying,
    process_forward character varying,
    aa_suspense_ref character varying,
    pos_exp_date character varying,
    rc_detail_id character varying,
    tax_data character varying,
    cus_pl_account character varying,
    reserved_7 character varying,
    reserved_8 character varying,
    reserved_9 character varying,
    reserved_10 character varying,
    reserved_11 character varying,
    reserved_12 character varying,
    reserved_13 character varying,
    reserved_14 character varying,
    amount_deal_ccy character varying,
    deal_ccy character varying,
    deal_exch_rate character varying,
    mask_print character varying,
    mask_narrative character varying,
    stmt1_date character varying,
    stmt2_date character varying,
    chq_type character varying,
    tax_exch_rate character varying,
    net_param character varying,
    master_account character varying,
    addl_trans_ref character varying,
    interest_rate character varying,
    dd_mandate_ref character varying,
    dd_item_ref character varying,
    dd_mandate_date character varying,
    contract_bal_id integer,
    trade_date integer,
    processing_date date,
    balance_type character varying NOT NULL,
    aa_item_ref character varying,
    accrual_data character varying,
    orig_ccy_market integer,
    card_number integer,
    card_txn_detail character varying,
    draft_payee_name character varying,
    t24_load_date character varying,
    efz_load_date character varying NOT NULL,
    efz_co_code character varying NOT NULL,
    business_date character varying NOT NULL,
    date_time_custom character varying,
    column_ character varying,
    status character varying NOT NULL,
    user_id numeric,
    updated_at character varying
);


ALTER TABLE public.st_stmt_entry OWNER TO icomply;

--
-- Name: st_stmt_entry_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.st_stmt_entry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.st_stmt_entry_id_seq OWNER TO icomply;

--
-- Name: staffs; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.staffs (
    id integer NOT NULL,
    staff_name character varying NOT NULL,
    department character varying NOT NULL,
    email character varying NOT NULL,
    dept_email character varying,
    staff_id character varying NOT NULL,
    user_id character varying,
    os_user character varying
);


ALTER TABLE public.staffs OWNER TO icomply;

--
-- Name: staffs_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.staffs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.staffs_id_seq OWNER TO icomply;

--
-- Name: staffs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: icomply
--

ALTER SEQUENCE public.staffs_id_seq OWNED BY public.staffs.id;


--
-- Name: str_transactions; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.str_transactions (
    id integer NOT NULL,
    t_account_number integer,
    t_trans_number character varying NOT NULL,
    t_location character varying NOT NULL,
    transaction_description character varying,
    t_teller character varying,
    t_authorized character varying NOT NULL,
    t_late_deposit numeric NOT NULL,
    t_transmode_code character varying NOT NULL,
    t_amount_local numeric,
    t_source_client_type character varying,
    t_source_type character varying,
    t_source_funds_code character varying NOT NULL,
    t_source_currency_code character varying NOT NULL,
    t_source_foreign_amount numeric,
    t_source_exchange_rate numeric,
    t_source_country character varying,
    t_source_institution_code numeric,
    t_source_institution_name character varying,
    t_source_account_number numeric,
    t_source_account_name character varying(61),
    t_source_person_first_name character varying(30),
    t_source_person_last_name character varying(30),
    t_source_entity_name character varying(30),
    t_dest_client_type character varying(30),
    t_dest_type character varying,
    t_dest_funds_code character varying,
    t_dest_currency_code character varying,
    t_dest_foreign_amount numeric,
    t_dest_exchange_rate numeric,
    t_dest_country character varying NOT NULL,
    t_dest_institution_code integer,
    t_dest_institution_name character varying,
    t_dest_account_number numeric,
    t_dest_account_name character varying(50),
    t_dest_person_first_name character varying(30),
    t_dest_person_last_name character varying(30),
    t_dest_entity_name character varying(30),
    tran_type character varying(18) NOT NULL,
    created_at character varying NOT NULL,
    t_date_posting character varying(31) NOT NULL,
    t_value_date character varying(31) NOT NULL,
    t_date character varying(31) NOT NULL,
    t_client_number numeric,
    t_gender character varying,
    t_title character varying(30) NOT NULL,
    t_firstname character varying(30),
    t_lastname character varying(41) NOT NULL,
    t_dob character varying(31) NOT NULL,
    t_phone numeric NOT NULL,
    t_address character varying(97) NOT NULL,
    t_city character varying(30),
    t_state character varying,
    t_idnumber character varying,
    t_idregdate character varying(31) NOT NULL,
    t_taxno character varying(20),
    t_taxregdate character varying(20),
    t_acctopndate character varying(31) NOT NULL,
    t_balance numeric,
    row_ref character varying NOT NULL,
    status numeric,
    rule_id numeric,
    reviewer numeric,
    download_link character varying,
    updated_at character varying,
    encrypted_query character varying
);


ALTER TABLE public.str_transactions OWNER TO icomply;

--
-- Name: str_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.str_transactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.str_transactions_id_seq OWNER TO icomply;

--
-- Name: str_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: icomply
--

ALTER SEQUENCE public.str_transactions_id_seq OWNED BY public.str_transactions.id;


--
-- Name: team; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.team (
    id integer NOT NULL,
    name character varying,
    email character varying,
    staff_id character varying,
    created_at character varying,
    updated_at character varying
);


ALTER TABLE public.team OWNER TO icomply;

--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.teams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_id_seq OWNER TO icomply;

--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: icomply
--

ALTER SEQUENCE public.teams_id_seq OWNED BY public.team.id;


--
-- Name: testest; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.testest (
    name character varying(20)
);


ALTER TABLE public.testest OWNER TO icomply;

--
-- Name: users; Type: TABLE; Schema: public; Owner: icomply
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying,
    firstname character varying,
    lastname character varying,
    password character varying,
    username character varying,
    created_at character varying DEFAULT now(),
    roles character varying,
    status character varying,
    phone numeric,
    group_id integer,
    failed_login_attempts character varying,
    team_id integer,
    branch_access character varying,
    report_access character varying,
    app_id character varying,
    os_user character varying
);


ALTER TABLE public.users OWNER TO icomply;

--
-- Name: users_id_seq1; Type: SEQUENCE; Schema: public; Owner: icomply
--

CREATE SEQUENCE public.users_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq1 OWNER TO icomply;

--
-- Name: users_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: icomply
--

ALTER SEQUENCE public.users_id_seq1 OWNED BY public.users.id;


--
-- Name: alert id; Type: DEFAULT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.alert ALTER COLUMN id SET DEFAULT nextval('public.alert_id_seq'::regclass);


--
-- Name: am_account_type id; Type: DEFAULT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.am_account_type ALTER COLUMN id SET DEFAULT nextval('public.am_account_type_id_seq'::regclass);


--
-- Name: am_staff id; Type: DEFAULT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.am_staff ALTER COLUMN id SET DEFAULT nextval('public.am_staff_id_seq'::regclass);


--
-- Name: aml_report id; Type: DEFAULT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.aml_report ALTER COLUMN id SET DEFAULT nextval('public.aml_report_id_seq'::regclass);


--
-- Name: app_pep_accounts id; Type: DEFAULT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.app_pep_accounts ALTER COLUMN id SET DEFAULT nextval('public.app_pep_accounts_id_seq'::regclass);


--
-- Name: case_management id; Type: DEFAULT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.case_management ALTER COLUMN id SET DEFAULT nextval('public.case_management_id_seq'::regclass);


--
-- Name: case_status id; Type: DEFAULT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.case_status ALTER COLUMN id SET DEFAULT nextval('public.case_status_id_seq'::regclass);


--
-- Name: cases id; Type: DEFAULT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.cases ALTER COLUMN id SET DEFAULT nextval('public.cases_id_seq1'::regclass);


--
-- Name: compliance_checklist id; Type: DEFAULT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.compliance_checklist ALTER COLUMN id SET DEFAULT nextval('public.compliance_checklist_id_seq'::regclass);


--
-- Name: compliance_statistics id; Type: DEFAULT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.compliance_statistics ALTER COLUMN id SET DEFAULT nextval('public.compliance_statistics_new_id_seq'::regclass);


--
-- Name: comply id; Type: DEFAULT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.comply ALTER COLUMN id SET DEFAULT nextval('public.comply_id_seq'::regclass);


--
-- Name: ctl_collections id; Type: DEFAULT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.ctl_collections ALTER COLUMN id SET DEFAULT nextval('public.ctl_collections_id_seq'::regclass);


--
-- Name: department id; Type: DEFAULT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.department ALTER COLUMN id SET DEFAULT nextval('public.department_id_seq'::regclass);


--
-- Name: download_notifier id; Type: DEFAULT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.download_notifier ALTER COLUMN id SET DEFAULT nextval('public.download_notifier_id_seq'::regclass);


--
-- Name: download_queue id; Type: DEFAULT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.download_queue ALTER COLUMN id SET DEFAULT nextval('public.download_queue_id_seq'::regclass);


--
-- Name: exception_category id; Type: DEFAULT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.exception_category ALTER COLUMN id SET DEFAULT nextval('public.exception_category_id_seq'::regclass);


--
-- Name: exception_frequency id; Type: DEFAULT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.exception_frequency ALTER COLUMN id SET DEFAULT nextval('public.exception_frequency_id_seq'::regclass);


--
-- Name: exception_process id; Type: DEFAULT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.exception_process ALTER COLUMN id SET DEFAULT nextval('public.exception_process_id_seq1'::regclass);


--
-- Name: exception_status id; Type: DEFAULT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.exception_status ALTER COLUMN id SET DEFAULT nextval('public.exception_status_id_seq'::regclass);


--
-- Name: exceptions_logs id; Type: DEFAULT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.exceptions_logs ALTER COLUMN id SET DEFAULT nextval('public.exception_logs_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: priority_level id; Type: DEFAULT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.priority_level ALTER COLUMN id SET DEFAULT nextval('public.priority_level_id_seq'::regclass);


--
-- Name: staffs id; Type: DEFAULT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.staffs ALTER COLUMN id SET DEFAULT nextval('public.staffs_id_seq'::regclass);


--
-- Name: str_transactions id; Type: DEFAULT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.str_transactions ALTER COLUMN id SET DEFAULT nextval('public.str_transactions_id_seq'::regclass);


--
-- Name: team id; Type: DEFAULT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.team ALTER COLUMN id SET DEFAULT nextval('public.teams_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq1'::regclass);


--
-- Data for Name: alert; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.alert (id, alert_name, status_id, user_id, alert_description, rule_id, alert_frequency_id, alert_action, team_id, exception_process_id, mail_to, mail_cc, alert_subject, created_at, updated_at, event_date) FROM stdin;
760	ALERT2023190412362226198	2	43	Check compliance	\N	\N	Please review and ensure compliance on process	44	17494	[NULL]	[NULL]	\N	19-APR-23 12.38.33.227000000 PM	19-APR-23 12.38.33.227000000 PM	19-APR-23 12.38.33.227000000 PM
779	Multiple Bill Payment transactions same day - ALERT2023190415271615437	1	\N	Multiple Bill Payment transactions same day	\N	\N	Check report and attach support documents	\N	7081	jonathan.o@novajii.com,chizo.o@novajii.com,hanson.e@novajii.com,tech-support@novajii.com	jonathan.o@novajii.com,chizo.o@novajii.com,hanson.e@novajii.com,tech-support@novajii.com,operations@novajii.com	Multiple Bill Payment transactions same day - ALERT2023190415271615437	18-APR-23 11.00.00.000000000 PM	19-APR-23 03.27.17.289000000 PM	19-APR-23 03.27.17.289000000 PM
478	ALERT2023220313392455399	1	43	Treat as urgent	\N	\N	Please crosscheck and revert	101	\N	[NULL]	[NULL]	\N	22-MAR-23 01.41.31.046000000 PM	22-MAR-23 01.41.31.046000000 PM	22-MAR-23 01.41.31.046000000 PM
582	ALERT2023130408542319460	1	43	Please treat urgently. Just testing	\N	\N	Please review and ensure compliance	\N	18146	[NULL]	[NULL]	\N	13-APR-23 08.55.13.428000000 AM	13-APR-23 08.55.13.428000000 AM	13-APR-23 08.55.13.428000000 AM
584	ALERT2023130408553480726	1	43	Please treat urgently. Just testing	\N	\N	Please review and ensure compliance	101	18173	[NULL]	[NULL]	\N	13-APR-23 08.56.19.944000000 AM	13-APR-23 08.56.19.944000000 AM	13-APR-23 08.56.19.944000000 AM
586	ALERT2023130408565943552	1	43	Clear this always	\N	\N	Please review and ensure compliance	\N	17394	[NULL]	[NULL]	\N	13-APR-23 08.58.43.484000000 AM	13-APR-23 08.58.43.484000000 AM	13-APR-23 08.58.43.484000000 AM
640	ALERT2023170416022993610	1	43	Kindly confirm teller status	\N	\N	Please review and ensure compliance	44	17246	[NULL]	[NULL]	\N	17-APR-23 04.03.26.834000000 PM	17-APR-23 04.03.26.834000000 PM	17-APR-23 04.03.26.834000000 PM
659	ALERT2023170418223996269	2	43	CHECK CARD STATUS	\N	\N	Please review and ensure compliance	44	17398	[NULL]	[NULL]	\N	17-APR-23 06.23.54.109000000 PM	17-APR-23 06.23.54.109000000 PM	17-APR-23 06.23.54.109000000 PM
703	ALERT2023180413455580287	2	43	Transaction Details:&nbsp,\\nTrans. Ref:&nbsp,\\nCustomer Credited:&nbsp,\\nAccount Credited:&nbsp,\\nCustomer Debited:&nbsp,\\nAccount Debited:&nbsp,\\nTran. Date:&nbsp,\\nTran. Amt:&nbsp,\\nNarration:	\N	\N	Please review and ensure compliance	60	7061	[NULL]	[NULL]	\N	18-APR-23 01.52.03.526000000 PM	18-APR-23 01.52.03.526000000 PM	18-APR-23 01.52.03.526000000 PM
718	ALERT2023180417190771449	1	43	please revert	\N	\N	Please review and ensure compliance	60	17050	[NULL]	[NULL]	\N	18-APR-23 05.20.32.264000000 PM	18-APR-23 05.20.32.264000000 PM	18-APR-23 05.20.32.264000000 PM
498	ALERT2023230312563646324	2	43	\N	\N	\N	Please address this issue	101	\N	[NULL]	[NULL]	\N	23-MAR-23 01.08.14.453000000 PM	23-MAR-23 01.08.14.453000000 PM	23-MAR-23 01.08.14.453000000 PM
518	ALERT2023230315043587288	2	43	\N	\N	\N	Please treat	101	\N	[NULL]	[NULL]	\N	23-MAR-23 03.05.49.462000000 PM	23-MAR-23 03.05.49.462000000 PM	23-MAR-23 03.05.49.462000000 PM
599	ALERT2023130413174684568	1	43	\N	\N	\N	Please review and ensure compliance	104	7061	[NULL]	[NULL]	\N	13-APR-23 01.18.41.505000000 PM	13-APR-23 01.18.41.505000000 PM	13-APR-23 01.18.41.505000000 PM
618	ALERT2023140413051857576	2	43	Transaction Details:&nbsp,\\nTrans. Ref:000004&nbsp,\\nCustomer Credited:&nbsp,\\nAccount Credited:&nbsp,\\nCustomer Debited: GREEN WYLIE&nbsp,\\nAccount Debited:&nbsp,\\nTran. Date: 25-SEP-2019&nbsp,\\nTran. Amt:&nbsp,\\nNarration: Online Payment|AAAxaJAAJAAAA0nAAB	\N	\N	Please review and ensure compliance	101	17048	[NULL]	[NULL]	\N	14-APR-23 01.07.39.696000000 PM	14-APR-23 01.07.39.696000000 PM	14-APR-23 01.07.39.696000000 PM
679	ALERT2023170421370221207	1	43	testing link	\N	\N	Please review and ensure compliance	62	17025	[NULL]	[NULL]	\N	17-APR-23 09.37.50.128000000 PM	17-APR-23 09.37.50.128000000 PM	17-APR-23 09.37.50.128000000 PM
1058	Transactions Structured To Avoid Detection - ALERT2023260402000544305	2	43	Transactions Structured To Avoid Detection	\N	\N	Check report and attach support documents	\N	7101	jonathan.o@novajii.com,chizo.o@novajii.com,favour.e@novajii.com,hanson.e@novajii.com,charles.e@novajii.com,augustine.e@novajii.com	jonathan.o@novajii.com,chizo.o@novajii.com,favour.e@novajii.com,hanson.e@novajii.com,charles.e@novajii.com,augustine.e@novajii.com,augustine.e@novajii.com	Transactions Structured To Avoid Detection - ALERT2023260402000544305	26-APR-23 12.00.00.000000000 AM	26-APR-23 02.00.07.949000000 AM	26-APR-23 02.00.07.949000000 AM
1059	Customers with expired means of ID - ALERT2023260402001881493	2	43	Customers with expired means of ID	\N	\N	Check report and attach support documents	\N	7082	jonathan.o@novajii.com,charles.e@novajii.com,favour.e@novajii.com,chizo.o@novajii.com,operations@novajii.com	jonathan.o@novajii.com,charles.e@novajii.com,favour.e@novajii.com,chizo.o@novajii.com,operations@novajii.com,ceo@novajii.com	Customers with expired means of ID - ALERT2023260402001881493	26-APR-23 12.00.00.000000000 AM	26-APR-23 02.00.18.712000000 AM	26-APR-23 02.00.18.712000000 AM
1060	Multiple Bill Payment transactions same day - ALERT2023260402001811783	2	43	Multiple Bill Payment transactions same day	\N	\N	Check report and attach support documents	\N	7081	jonathan.o@novajii.com,chizo.o@novajii.com,hanson.e@novajii.com,tech-support@novajii.com	jonathan.o@novajii.com,chizo.o@novajii.com,hanson.e@novajii.com,tech-support@novajii.com,operations@novajii.com	Multiple Bill Payment transactions same day - ALERT2023260402001811783	26-APR-23 12.00.00.000000000 AM	26-APR-23 02.00.19.891000000 AM	26-APR-23 02.00.19.891000000 AM
780	ALERT2023190415404410615	1	43	&nbsp,Check compliance	\N	\N	Please review and ensure compliance	44	17246	[NULL]	[NULL]	\N	19-APR-23 03.42.43.767000000 PM	19-APR-23 03.42.43.767000000 PM	19-APR-23 03.42.43.767000000 PM
798	TRANSACTIONS STRUCTURED TO AVOID DETECTION - ALERT2023200402000521421	1	43	TRANSACTIONS STRUCTURED TO AVOID DETECTION	\N	\N	Check report and attach support documents	\N	7101	jonathan.o@novajii.com,chizo.o@novajii.com,favour.e@novajii.com,hanson.e@novajii.com,charles.e@novajii.com,augustine.e@novajii.com	jonathan.o@novajii.com,chizo.o@novajii.com,favour.e@novajii.com,hanson.e@novajii.com,charles.e@novajii.com,augustine.e@novajii.com,augustine.e@novajii.com	TRANSACTIONS STRUCTURED TO AVOID DETECTION - ALERT2023200402000521421	20-APR-23 12.00.00.000000000 AM	20-APR-23 02.00.08.281000000 AM	20-APR-23 02.00.08.281000000 AM
578	ALERT2023130408335813573	1	43	Just testing this	\N	\N	Please review and ensure compliance extendable	\N	18146	[NULL]	[NULL]	\N	13-APR-23 08.41.55.187000000 AM	13-APR-23 08.41.55.187000000 AM	13-APR-23 08.41.55.187000000 AM
579	ALERT2023130408514313242	1	43	Please treat&nbsp,	\N	\N	Please review and ensure compliance	101	18173	[NULL]	[NULL]	\N	13-APR-23 08.52.14.964000000 AM	13-APR-23 08.52.14.964000000 AM	13-APR-23 08.52.14.964000000 AM
580	ALERT2023130408532430418	1	43	Please treat urgently	\N	\N	Please review and ensure compliance	\N	17367	[NULL]	[NULL]	\N	13-APR-23 08.54.03.914000000 AM	13-APR-23 08.54.03.914000000 AM	13-APR-23 08.54.03.914000000 AM
638	ALERT2023170411475419818	1	43	The numbers are not matching the report submitted	\N	\N	Please review and provide update	44	17517	[NULL]	[NULL]	\N	17-APR-23 11.50.42.899000000 AM	17-APR-23 11.50.42.899000000 AM	17-APR-23 11.50.42.899000000 AM
641	ALERT2023170416124776562	2	43	Kindly handle	\N	\N	Please review and ensure compliance	102	17517	[NULL]	[NULL]	\N	17-APR-23 04.15.11.230000000 PM	17-APR-23 04.15.11.230000000 PM	17-APR-23 04.15.11.230000000 PM
642	ALERT2023170416451092454	2	43	Kindly confirm and revert	\N	\N	Please review and ensure compliance	44	17494	[NULL]	[NULL]	\N	17-APR-23 04.46.24.398000000 PM	17-APR-23 04.46.24.398000000 PM	17-APR-23 04.46.24.398000000 PM
699	ALERT2023180409065251169	2	43	Please treat	\N	\N	Please review and ensure compliance	101	17246	[NULL]	[NULL]	\N	18-APR-23 09.07.43.884000000 AM	18-APR-23 09.07.43.884000000 AM	18-APR-23 09.07.43.884000000 AM
701	ALERT2023180409423471123	2	43	Please treat	\N	\N	Please review and ensure compliance	60	17246	[NULL]	[NULL]	\N	18-APR-23 09.43.01.624000000 AM	18-APR-23 09.43.01.624000000 AM	18-APR-23 09.43.01.624000000 AM
702	ALERT2023180409501036986	2	43	Please treat&nbsp,	\N	\N	Please review and ensure compliance	101	17146	[NULL]	[NULL]	\N	18-APR-23 09.50.56.316000000 AM	18-APR-23 09.50.56.316000000 AM	18-APR-23 09.50.56.316000000 AM
392	ALERT2022210912110317528	2	43	\N	\N	\N	Two laptops are faulty in the IT department	94	\N	[NULL]	[NULL]	\N	21-SEP-22 01.14.15.269000000 PM	21-SEP-22 01.14.15.269000000 PM	21-SEP-22 01.14.15.269000000 PM
439	ALERT2022111117223934663	1	43	Faulty Laptop	\N	\N	\N	44	\N	[NULL]	[NULL]	\N	11-NOV-22 06.23.30.190000000 PM	11-NOV-22 06.23.30.190000000 PM	11-NOV-22 06.23.30.190000000 PM
459	ALERT2023030210342155109	2	43	\N	\N	\N	Kindly treat	43	\N	[NULL]	[NULL]	\N	03-FEB-23 11.35.52.700000000 AM	03-FEB-23 11.35.52.700000000 AM	03-FEB-23 11.35.52.700000000 AM
386	ALERT2022210908334163586	1	43	\N	\N	\N	Please provide evidence of complete documentation	71	\N	[NULL]	[NULL]	\N	19-SEP-22 09.41.18.045000000 AM	19-SEP-22 09.41.18.045000000 AM	19-SEP-22 09.41.18.045000000 AM
391	ALERT2022210912001541565	1	43	Please treat as urgent	\N	\N	A PEP customer has an account with no KYC	\N	\N	[NULL]	[NULL]	\N	21-SEP-22 01.01.02.188000000 PM	21-SEP-22 01.01.02.188000000 PM	21-SEP-22 01.01.02.188000000 PM
401	ALERT2022280911173463056	2	43	Please provide additional details	\N	\N	Please provide details	44	\N	[NULL]	[NULL]	\N	28-SEP-22 12.19.32.747000000 PM	28-SEP-22 12.19.32.747000000 PM	28-SEP-22 12.19.32.747000000 PM
402	ALERT2022280912215685212	2	43	Please provide additional details	\N	\N	Test action	43	\N	[NULL]	[NULL]	\N	28-SEP-22 01.23.17.849000000 PM	28-SEP-22 01.23.17.849000000 PM	28-SEP-22 01.23.17.849000000 PM
403	ALERT2022280912481530331	1	43	\N	\N	\N	Please provide evidence of full compliance	\N	\N	[NULL]	[NULL]	\N	28-SEP-22 01.50.57.468000000 PM	28-SEP-22 01.50.57.468000000 PM	28-SEP-22 01.50.57.468000000 PM
438	ALERT2022111117214798924	2	43	Faulty Fan	\N	\N	\N	43	\N	[NULL]	[NULL]	\N	11-NOV-22 06.22.20.639000000 PM	11-NOV-22 06.22.20.639000000 PM	11-NOV-22 06.22.20.639000000 PM
440	ALERT2022111117250483102	1	43	Faulty Air conditioner	\N	\N	\N	\N	\N	[NULL]	[NULL]	\N	11-NOV-22 06.26.17.385000000 PM	11-NOV-22 06.26.17.385000000 PM	11-NOV-22 06.26.17.385000000 PM
458	ALERT2023030210183924021	2	43	\N	\N	\N	PLEASE TREAT	102	\N	[NULL]	[NULL]	\N	03-FEB-23 11.19.55.497000000 AM	03-FEB-23 11.19.55.497000000 AM	03-FEB-23 11.19.55.497000000 AM
388	ALERT2022210911521092366	2	43	Pleae check for correctness	\N	\N	Kindly review	\N	\N	[NULL]	[NULL]	\N	21-SEP-22 12.53.49.613000000 PM	21-SEP-22 12.53.49.613000000 PM	21-SEP-22 12.53.49.613000000 PM
390	ALERT2022210911573345425	2	43	Please treat as urgent	\N	\N	The AC on the second floor, wing C	41	\N	[NULL]	[NULL]	\N	21-SEP-22 12.59.56.673000000 PM	21-SEP-22 12.59.56.673000000 PM	21-SEP-22 12.59.56.673000000 PM
394	ALERT2022210914022449152	1	43	Pleae check for correctness	\N	\N	Kindly treat	71	\N	[NULL]	[NULL]	\N	21-SEP-22 03.04.55.428000000 PM	21-SEP-22 03.04.55.428000000 PM	21-SEP-22 03.04.55.428000000 PM
395	ALERT2022270916470124795	2	43	Kindly provide details	\N	\N	Kindly provide details	43	\N	[NULL]	[NULL]	\N	27-SEP-22 05.48.46.742000000 PM	27-SEP-22 05.48.46.742000000 PM	27-SEP-22 05.48.46.742000000 PM
397	ALERT2022270918525762985	1	43	Kindly provide details	\N	\N	Kindly provide response	43	\N	[NULL]	[NULL]	\N	27-SEP-22 07.54.21.491000000 PM	27-SEP-22 07.54.21.491000000 PM	27-SEP-22 07.54.21.491000000 PM
400	ALERT2022270919125848947	2	43	Please explain further	\N	\N	Please treat	\N	\N	[NULL]	[NULL]	\N	27-SEP-22 08.13.32.886000000 PM	27-SEP-22 08.13.32.886000000 PM	27-SEP-22 08.13.32.886000000 PM
387	ALERT2022210911490372782	1	43	Pleae check for correctness	\N	\N	Documentation needs to be updated	62	\N	[NULL]	[NULL]	\N	20-SEP-22 12.51.45.066000000 PM	20-SEP-22 12.51.45.066000000 PM	20-SEP-22 12.51.45.066000000 PM
393	ALERT2022210912191784878	1	43	Pleae check for correctness	\N	\N	Please review and revert	\N	\N	[NULL]	[NULL]	\N	21-SEP-22 01.24.45.131000000 PM	21-SEP-22 01.24.45.131000000 PM	21-SEP-22 01.24.45.131000000 PM
396	ALERT2022270918412681992	1	43	Kindly provide details	\N	\N	Kindly treat	60	\N	[NULL]	[NULL]	\N	27-SEP-22 07.43.12.659000000 PM	27-SEP-22 07.43.12.659000000 PM	27-SEP-22 07.43.12.659000000 PM
418	ALERT2022101113430380919	2	43	Urgently	\N	\N	Faulty chairs	104	\N	[NULL]	[NULL]	\N	10-NOV-22 02.45.26.758000000 PM	10-NOV-22 02.45.26.758000000 PM	10-NOV-22 02.45.26.758000000 PM
519	ALERT2023230316091089093	2	43	\N	\N	\N	Kindly handle	41	\N	[NULL]	[NULL]	\N	23-MAR-23 04.13.31.240000000 PM	23-MAR-23 04.13.31.240000000 PM	23-MAR-23 04.13.31.240000000 PM
639	ALERT2023170415554651451	1	43	Check Audit	\N	\N	Please review and ensure compliance	\N	17048	[NULL]	[NULL]	\N	17-APR-23 03.57.27.012000000 PM	17-APR-23 03.57.27.012000000 PM	17-APR-23 03.57.27.012000000 PM
698	ALERT2023180408585421696	2	43	Please treat	\N	\N	Please review and ensure compliance	101	17034	[NULL]	[NULL]	\N	18-APR-23 09.00.17.166000000 AM	18-APR-23 09.00.17.166000000 AM	18-APR-23 09.00.17.166000000 AM
700	ALERT2023180409401831662	2	43	Please treat	\N	\N	Please review and ensure compliance	101	17048	[NULL]	[NULL]	\N	18-APR-23 09.40.50.939000000 AM	18-APR-23 09.40.50.939000000 AM	18-APR-23 09.40.50.939000000 AM
739	ALERT2023180423322847812	1	43	To be checked	\N	\N	Please review and ensure compliance	60	17048	[NULL]	[NULL]	\N	18-APR-23 11.33.28.565000000 PM	18-APR-23 11.33.28.565000000 PM	18-APR-23 11.33.28.565000000 PM
539	ALERT2023240318072530187	2	43	\N	\N	\N	Please review and ensure compliance	101	17246	[NULL]	[NULL]	\N	24-MAR-23 06.09.41.436000000 PM	24-MAR-23 06.09.41.436000000 PM	24-MAR-23 06.09.41.436000000 PM
558	ALERT2023250311392481139	1	43	Kindly treat	\N	\N	Please review and ensure compliance	101	19222	[NULL]	[NULL]	\N	25-MAR-23 11.40.45.065000000 AM	25-MAR-23 11.40.45.065000000 AM	25-MAR-23 11.40.45.065000000 AM
587	ALERT2023130409411825153	2	43	Transaction Details:&nbsp,\\nTrans. Ref:000004&nbsp,\\nCustomer Credited:&nbsp,\\nAccount Credited:&nbsp,\\nCustomer Debited: GREEN WYLIE&nbsp,\\nAccount Debited:&nbsp,\\nTran. Date: 25-SEP-2019&nbsp,\\nTran. Amt: 8,000,000.00\\nNarration: Online Payment|AAAxaJAAJAAAA0nAAB	\N	\N	Please review and ensure compliance	\N	7061	[NULL]	[NULL]	\N	13-APR-23 10.00.46.595000000 AM	13-APR-23 10.00.46.595000000 AM	13-APR-23 10.00.46.595000000 AM
598	ALERT2023130412543290716	1	43	Just Testing	\N	\N	Please review and ensure compliance	60	19603	[NULL]	[NULL]	\N	13-APR-23 12.57.16.663000000 PM	13-APR-23 12.57.16.663000000 PM	13-APR-23 12.57.16.663000000 PM
658	ALERT2023170418013356534	2	43	Check card status and respond	\N	\N	Please review and ensure compliance	94	17543	[NULL]	[NULL]	\N	17-APR-23 06.03.58.653000000 PM	17-APR-23 06.03.58.653000000 PM	17-APR-23 06.03.58.653000000 PM
1061	PEP Customers Bank-Wide - ALERT2023260402001920581	2	43	PEP Customers Bank-Wide	\N	\N	Check report and attach support documents	\N	7141	jonathan.o@novajii.com,chizo.o@novajii.com,charles.e@novajii.com	jonathan.o@novajii.com,chizo.o@novajii.com,charles.e@novajii.com,hanson.e@novajii.com	PEP Customers Bank-Wide - ALERT2023260402001920581	26-APR-23 12.00.00.000000000 AM	26-APR-23 02.00.20.130000000 AM	26-APR-23 02.00.20.130000000 AM
1062	ALERT2023260405394289383	1	101	checking buttons	\N	\N	Please review and ensure compliance	43	17246	[NULL]	[NULL]	\N	26-APR-23 05.40.26.151000000 AM	26-APR-23 05.40.26.151000000 AM	26-APR-23 05.40.26.151000000 AM
1079	ALERT2023260412383724395	2	43	Pleae respond	\N	\N	Please review and ensure compliance	101	17048	[NULL]	[NULL]	\N	26-APR-23 12.39.07.167000000 PM	26-APR-23 12.39.07.167000000 PM	26-APR-23 12.39.07.167000000 PM
1178	Transactions Structured To Avoid Detection - ALERT2023010502000580933	1	43	Transactions Structured To Avoid Detection	\N	\N	Check report and attach support documents	\N	7101	jonathan.o@novajii.com,chizo.o@novajii.com,favour.e@novajii.com,hanson.e@novajii.com,charles.e@novajii.com,augustine.e@novajii.com	jonathan.o@novajii.com,chizo.o@novajii.com,favour.e@novajii.com,hanson.e@novajii.com,charles.e@novajii.com,augustine.e@novajii.com,augustine.e@novajii.com	Transactions Structured To Avoid Detection - ALERT2023010502000580933	01-MAY-23 12.00.00.000000000 AM	01-MAY-23 02.00.06.591000000 AM	01-MAY-23 02.00.06.591000000 AM
1179	Customers with expired means of ID - ALERT2023010502001513897	1	43	Customers with expired means of ID	\N	\N	Check report and attach support documents	\N	7082	jonathan.o@novajii.com,charles.e@novajii.com,favour.e@novajii.com,chizo.o@novajii.com,oluwatobi.obademi@sterling.ng,operations@novajii.com	jonathan.o@novajii.com,charles.e@novajii.com,favour.e@novajii.com,chizo.o@novajii.com,oluwatobi.obademi@sterling.ng,operations@novajii.com,ceo@novajii.com	Customers with expired means of ID - ALERT2023010502001513897	01-MAY-23 12.00.00.000000000 AM	01-MAY-23 02.00.15.518000000 AM	01-MAY-23 02.00.15.518000000 AM
1180	Multiple Bill Payment transactions same day - ALERT2023010502001533593	1	43	Multiple Bill Payment transactions same day	\N	\N	Check report and attach support documents	\N	7081	jonathan.o@novajii.com,chizo.o@novajii.com,hanson.e@novajii.com,tech-support@novajii.com	jonathan.o@novajii.com,chizo.o@novajii.com,hanson.e@novajii.com,tech-support@novajii.com,operations@novajii.com	Multiple Bill Payment transactions same day - ALERT2023010502001533593	01-MAY-23 12.00.00.000000000 AM	01-MAY-23 02.00.16.551000000 AM	01-MAY-23 02.00.16.551000000 AM
1181	PEP Customers Bank-Wide - ALERT2023010502001646654	1	43	PEP Customers Bank-Wide	\N	\N	Check report and attach support documents	\N	7141	jonathan.o@novajii.com,chizo.o@novajii.com,oluwatobi.obademi@sterling.ng	jonathan.o@novajii.com,chizo.o@novajii.com,oluwatobi.obademi@sterling.ng,hanson.e@novajii.com	PEP Customers Bank-Wide - ALERT2023010502001646654	01-MAY-23 12.00.00.000000000 AM	01-MAY-23 02.00.16.742000000 AM	01-MAY-23 02.00.16.742000000 AM
1218	ALERT2023020523394871698	1	43	public alert mail check	\N	\N	Please review and ensure compliance	\N	17246	[NULL]	[NULL]	\N	02-MAY-23 11.40.59.691000000 PM	02-MAY-23 11.40.59.691000000 PM	02-MAY-23 11.40.59.691000000 PM
941	PEP Customers Bank-Wide - ALERT2023240411120192616	2	43	PEP Customers Bank-Wide	\N	\N	Check report and attach support documents	\N	7141	jonathan.o@novajii.com,chizo.o@novajii.com,charles.e@novajii.com	jonathan.o@novajii.com,chizo.o@novajii.com,charles.e@novajii.com,hanson.e@novajii.com	PEP Customers Bank-Wide - ALERT2023240411120192616	24-APR-23 12.00.00.000000000 AM	24-APR-23 11.12.01.857000000 AM	24-APR-23 11.12.01.857000000 AM
978	ALERT2023250409455328642	2	101	Check and confirm	\N	\N	Please review and ensure compliance	44	17025	[NULL]	[NULL]	\N	25-APR-23 09.47.10.479000000 AM	25-APR-23 09.47.10.479000000 AM	25-APR-23 09.47.10.479000000 AM
1065	ALERT2023260409134940636	1	43	Confirm	\N	\N	Please review and ensure compliance	\N	17048	[NULL]	[NULL]	\N	26-APR-23 09.14.30.104000000 AM	26-APR-23 09.14.30.104000000 AM	26-APR-23 09.14.30.104000000 AM
1070	ALERT2023260411064069731	2	43	Kindly treat immediately	\N	\N	Please review and ensure compliance	44	19287	[NULL]	[NULL]	\N	26-APR-23 11.13.48.896000000 AM	26-APR-23 11.13.48.896000000 AM	26-APR-23 11.13.48.896000000 AM
1071	ALERT2023260411312286264	1	43	Kindly treat immediately	\N	\N	Please review and resolved	98	18093	[NULL]	[NULL]	\N	26-APR-23 11.38.20.038000000 AM	26-APR-23 11.38.20.038000000 AM	26-APR-23 11.38.20.038000000 AM
1072	ALERT2023260411383315026	1	43	Kindly treat immediately	\N	\N	Please review and ensure compliance	44	17048	[NULL]	[NULL]	\N	26-APR-23 11.39.08.939000000 AM	26-APR-23 11.39.08.939000000 AM	26-APR-23 11.39.08.939000000 AM
1198	ALERT2023020509465536048	1	43	Please respond	\N	\N	Please review and ensure compliance	62	17048	[NULL]	[NULL]	\N	02-MAY-23 09.48.38.842000000 AM	02-MAY-23 09.48.38.842000000 AM	02-MAY-23 09.48.38.842000000 AM
1238	Transactions Structured To Avoid Detection - ALERT2023040502000565799	1	43	Transactions Structured To Avoid Detection	\N	\N	Check report and attach support documents	\N	7101	jonathan.o@novajii.com,chizo.o@novajii.com,favour.e@novajii.com,hanson.e@novajii.com,charles.e@novajii.com,oluwatobi.obademi@sterling.ng,augustine.e@novajii.com	jonathan.o@novajii.com,chizo.o@novajii.com,favour.e@novajii.com,hanson.e@novajii.com,charles.e@novajii.com,oluwatobi.obademi@sterling.ng,augustine.e@novajii.com,augustine.e@novajii.com	Transactions Structured To Avoid Detection - ALERT2023040502000565799	04-MAY-23 12.00.00.000000000 AM	04-MAY-23 02.00.07.252000000 AM	04-MAY-23 02.00.07.252000000 AM
6	ALERT2618858031	1	9	\N	\N	\N	extremly urgent	40	4	[["lebechiuchey@gmail.com","operations@mail.com"]]	\N	\N	2023-09-12 00:11:58	2023-09-12 00:11:58	\N
7	ALERT5137755594	1	9	\N	\N	\N	extremly urgent	40	4	[["lebechiuchey@gmail.com","operations@mail.com"]]	\N	\N	2023-09-12 00:14:15	2023-09-12 00:14:15	\N
8	ALERT7455188607	2	9	\N	\N	\N	This is to notify you that a process was created	\N	333	["charles.e@novajii.com","lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-12 03:05:22	2023-09-12 03:05:22	\N
155	ALERT6251505600	2	2	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-03 00:44:10	2023-10-03 00:44:10	\N
9	ALERT4714317196	2	9	\N	\N	\N	This is to notify you that a process was created	\N	333	["charles.e@novajii.com","lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-12 03:07:58	2023-09-12 03:07:58	\N
10	ALERT5221352882	2	9	\N	\N	\N	This is to notify you that a process was created	\N	333	["charles.e@novajii.com","lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-12 03:13:08	2023-09-12 03:13:08	\N
11	ALERT6957961983	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	["lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-12 03:53:32	2023-09-12 03:53:32	\N
12	ALERT6933856876	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	["lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-12 03:54:52	2023-09-12 03:54:52	\N
13	ALERT2373176081	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	["lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-12 03:55:38	2023-09-12 03:55:38	\N
14	ALERT3021362917	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	["lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-12 03:56:24	2023-09-12 03:56:24	\N
15	ALERT7156618843	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	["lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-12 03:59:52	2023-09-12 03:59:52	\N
16	ALERT521376283	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	["lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-12 04:01:45	2023-09-12 04:01:45	\N
17	ALERT9267457290	2	9	\N	\N	\N	This is to notify you that a process was created	\N	333	["charles.e@novajii.com","lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-12 04:04:45	2023-09-12 04:04:45	\N
18	ALERT5444076168	2	9	\N	\N	\N	This is to notify you that a process was created	\N	333	["charles.e@novajii.com","lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-12 04:05:07	2023-09-12 04:05:07	\N
19	ALERT758228259	2	9	\N	\N	\N	This is to notify you that a process was created	\N	333	["charles.e@novajii.com","lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-12 04:05:49	2023-09-12 04:05:49	\N
20	ALERT5600231008	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	["lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-12 04:06:58	2023-09-12 04:06:58	\N
21	ALERT5079211796	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	["lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-12 04:07:04	2023-09-12 04:07:04	\N
22	ALERT4074129337	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	["lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-12 04:10:51	2023-09-12 04:10:51	\N
23	ALERT6901107314	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	["lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-12 04:11:10	2023-09-12 04:11:10	\N
24	ALERT2460573745	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	["lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-12 04:12:08	2023-09-12 04:12:08	\N
25	ALERT6724151108	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	["lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-12 04:14:26	2023-09-12 04:14:26	\N
26	ALERT946058924	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	["lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-12 04:17:16	2023-09-12 04:17:16	\N
27	ALERT6973326377	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	["lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-12 04:18:12	2023-09-12 04:18:12	\N
28	ALERT2179847385	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	["lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-12 04:19:24	2023-09-12 04:19:24	\N
29	ALERT3758162596	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	["lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-12 04:22:45	2023-09-12 04:22:45	\N
30	ALERT2404108985	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	["lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-12 04:24:03	2023-09-12 04:24:03	\N
31	ALERT120201287	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	["lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-12 04:26:04	2023-09-12 04:26:04	\N
33	ALERT7955762120	\N	\N	\N	\N	\N	\N	\N	\N	[]	\N	\N	2023-09-12 04:58:19	2023-09-12 04:58:19	\N
34	ALERT3254585418	\N	8	\N	\N	\N	This Is To Notify You That a New System Was Allocated	\N	\N	["charles.e@novajii.com","leonell4fame@gmail.com"]	\N	\N	2023-09-12 05:26:25	2023-09-12 05:26:25	\N
35	ALERT7474994616	\N	\N	\N	\N	\N	\N	\N	\N	[]	\N	\N	2023-09-12 05:30:04	2023-09-12 05:30:04	\N
36	ALERT9304247204	\N	\N	\N	\N	\N	\N	\N	\N	[]	\N	\N	2023-09-12 05:37:27	2023-09-12 05:37:27	\N
37	ALERT7604353421	\N	\N	\N	\N	\N	good to go	\N	\N	["charles.e@novajii.com","leonell4fame@gmail.com"]	\N	\N	2023-09-12 05:49:09	2023-09-12 05:49:09	\N
38	ALERT6234166202	\N	8	\N	\N	\N	an additional comment	\N	\N	["charles.e@novajii.com","lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-12 06:00:18	2023-09-12 06:00:18	\N
39	ALERT349506440	1	9	\N	\N	\N	respond to case	60	4	"leonell4fame@gmail.com"	\N	\N	2023-09-25 13:19:10	2023-09-25 13:19:10	\N
40	ALERT8136152317	1	9	\N	\N	\N	respond to case	60	4	"leonell4fame@gmail.com"	\N	\N	2023-09-25 13:22:49	2023-09-25 13:22:49	\N
41	ALERT6770445826	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	["lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-25 16:55:14	2023-09-25 16:55:14	\N
42	ALERT968855128	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	["lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-25 16:57:58	2023-09-25 16:57:58	\N
43	ALERT2481066783	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	["lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-25 17:02:16	2023-09-25 17:02:16	\N
44	ALERT1364571366	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	["lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-25 17:06:52	2023-09-25 17:06:52	\N
45	ALERT5222714975	1	8	\N	\N	\N	Check balance immediately	72	19891	"leonell4fame@gmail.com"	\N	\N	2023-09-25 17:09:05	2023-09-25 17:09:05	\N
46	ALERT6058173107	1	8	\N	\N	\N	Check balance immediately	72	19891	"leonell4fame@gmail.com"	\N	\N	2023-09-25 17:24:11	2023-09-25 17:24:11	\N
47	ALERT4004348833	1	8	\N	\N	\N	Check balance immediately	72	19891	"leonell4fame@gmail.com"	\N	\N	2023-09-25 17:28:03	2023-09-25 17:28:03	\N
48	ALERT9887588580	1	8	\N	\N	\N	confirm account details	50	19833	"leonell4fame@gmail.com"	\N	\N	2023-09-25 18:02:21	2023-09-25 18:02:21	\N
49	ALERT2579126562	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	["lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-25 19:23:21	2023-09-25 19:23:21	\N
50	ALERT7495003456	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	["lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-25 19:30:30	2023-09-25 19:30:30	\N
51	ALERT7014283719	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	["lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-25 20:00:59	2023-09-25 20:00:59	\N
52	ALERT8313457555	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	["lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-25 20:02:41	2023-09-25 20:02:41	\N
53	ALERT7446737344	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	["lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-25 20:51:36	2023-09-25 20:51:36	\N
54	ALERT8106640946	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	["lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-25 20:53:00	2023-09-25 20:53:00	\N
55	ALERT7108447492	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	["lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-25 20:56:14	2023-09-25 20:56:14	\N
56	ALERT5436875599	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	["lebechiuchey@gmail.com","leonell4fame@gmail.com"]	\N	\N	2023-09-25 20:56:37	2023-09-25 20:56:37	\N
57	ALERT337526806	1	8	\N	\N	\N	Check balance immediately	72	19891	[["charles.e@novajii.com"]]	\N	\N	2023-09-26 05:15:45	2023-09-26 05:15:45	\N
58	ALERT8207098126	3	8	\N	\N	\N	confirm account details	50	19833	[["charles.e@novajii.com"]]	\N	\N	2023-09-26 08:13:08	2023-09-26 08:13:08	\N
59	ALERT2661906695	3	8	\N	\N	\N	confirm account details	50	19833	[["charles.e@novajii.com"]]	\N	\N	2023-09-26 08:16:32	2023-09-26 08:16:32	\N
60	ALERT8508191506	3	8	\N	\N	\N	confirm account details	50	19833	[[]]	\N	\N	2023-09-26 09:03:20	2023-09-26 09:03:20	\N
61	ALERT6372715787	9	9	\N	\N	\N	9	9	9	[[":p_email"]]	\N	\N	2023-09-26 09:17:49	2023-09-26 09:17:49	\N
62	ALERT5914033083	9	9	\N	\N	\N	9	9	9	[[":p_email"]]	\N	\N	2023-09-26 09:17:58	2023-09-26 09:17:58	\N
63	ALERT8894392949	3	8	\N	\N	\N	confirm account details	50	19833	[[]]	\N	\N	2023-09-26 09:53:01	2023-09-26 09:53:01	\N
64	ALERT8033959914	3	8	\N	\N	\N	confirm account details	50	19833	[[]]	\N	\N	2023-09-26 10:14:11	2023-09-26 10:14:11	\N
65	ALERT5307392845	2	8	\N	\N	\N	confirm account details	50	19833	[[]]	\N	\N	2023-09-26 13:07:14	2023-09-26 13:07:14	\N
66	ALERT7144451309	2	9	\N	\N	\N	Credential seems missing	55	19891	[[]]	\N	\N	2023-09-26 14:38:13	2023-09-26 14:38:13	\N
67	ALERT7053576713	3	10	\N	\N	\N	check quality	45	19891	[[]]	\N	\N	2023-09-26 15:03:14	2023-09-26 15:03:14	\N
68	ALERT4831797183	3	101	\N	\N	\N	Contact customer	60	336	[["charles.e@novajii.com","appdev@gmail.com"]]	\N	\N	2023-09-27 17:24:44	2023-09-27 17:24:44	\N
69	ALERT692009047	1	61	\N	\N	\N	forged	67	336	[["test@domian.com"]]	\N	\N	2023-09-27 17:51:19	2023-09-27 17:51:19	\N
70	ALERT7934976480	1	61	\N	\N	\N	fixed	67	336	[["test@domian.com"]]	\N	\N	2023-09-27 18:00:25	2023-09-27 18:00:25	\N
71	ALERT1912786471	1	61	\N	\N	\N	fixed	67	336	[["test@domian.com"]]	\N	\N	2023-09-27 18:01:06	2023-09-27 18:01:06	\N
72	ALERT3211886468	1	61	\N	\N	\N	fix	67	336	[["test@domian.com"]]	\N	\N	2023-09-27 18:03:11	2023-09-27 18:03:11	\N
73	ALERT5353814321	1	61	\N	\N	\N	fix	67	336	[["test@domian.com"]]	\N	\N	2023-09-27 18:25:13	2023-09-27 18:25:13	\N
74	ALERT5684594164	1	61	\N	\N	\N	fix	67	336	[["test@domian.com"]]	\N	\N	2023-09-27 18:27:09	2023-09-27 18:27:09	\N
75	ALERT2023270923520721689	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-09-27 23:53:05.043474+00	\N	\N
76	ALERT7340611250	2	9	\N	\N	\N	rate	67	336	[[]]	\N	\N	2023-09-28 00:51:17	2023-09-28 00:51:17	\N
77	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	title	2023-09-28 01:42:44.222659+00	\N	\N
78	ALERT2023280910490080472	1	43	<p>insert alert</p>	\N	\N	insert alert	104	19824	\N	\N	\N	2023-09-28 10:49:55.499022+00	\N	\N
79	1871	1	43	<p>insert alert</p>	\N	\N	insert alert	104	19824	\N	\N	\N	2023-09-28 10:49:55.554508+00	\N	\N
80	ALERT2023280910490080472	1	43	<p>all insert</p>	\N	\N	all insert	104	19824	\N	\N	\N	2023-09-28 10:53:57.205918+00	\N	\N
81	ALERT2023280912085265314	1	43	<p>check exception</p>	\N	\N	check exception	72	19824	\N	\N	\N	2023-09-28 12:10:03.437948+00	\N	\N
82	ALERT2023280912140271857	1	43	<p>check exception</p>	\N	\N	check exception	104	19824	\N	\N	\N	2023-09-28 12:14:50.373247+00	\N	\N
83	ALERT2023280912190428153	1	43	<p>WRONG FD TENOR</p>	\N	\N	WRONG FD TENOR	48	19820	\N	\N	\N	2023-09-28 12:19:50.273243+00	\N	\N
84	ALERT2023280912221467869	1	43	<p>search</p>	\N	\N	search	102	19817	\N	\N	\N	2023-09-28 12:23:07.667684+00	\N	\N
85	ALERT2023280912221467869	1	43	<p>search</p>	\N	\N	search	102	19817	\N	\N	\N	2023-09-28 12:24:55.197331+00	\N	\N
86	ALERT2023280912292813848	1	43	<p>keeper</p>	\N	\N	keeper	60	19820	\N	\N	\N	2023-09-28 12:30:06.853111+00	\N	\N
87	ALERT2023280917434767564	1	43	<p>private</p>	\N	\N	private	60	19820	\N	\N	\N	2023-09-28 17:44:39.704462+00	\N	\N
88	ALERT2023280918320143811	1	43	<p>rush</p>	\N	\N	rush	66	19824	\N	\N	\N	2023-09-28 18:32:49.587482+00	\N	\N
89	ALERT2023280918443593714	1	43	<p>temperature</p>	\N	\N	temperature	7	19824	\N	\N	\N	2023-09-28 18:45:28.765323+00	\N	\N
90	ALERT2023280918443593714	1	43	<p>temperature</p>	\N	\N	temperature	7	19824	\N	\N	\N	2023-09-28 18:48:19.255195+00	\N	\N
91	ALERT2023280919330345911	1	43	<p>report</p>	\N	\N	report	43	19906	\N	\N	\N	2023-09-28 19:33:46.861651+00	\N	\N
92	ALERT2023280919345193319	1	43	<p>carding</p>	\N	\N	carding	60	19738	\N	\N	\N	2023-09-28 19:37:28.584474+00	\N	\N
93	ALERT2023280919383618438	1	43	<p>amb</p>	\N	\N	amb	43	19742	\N	\N	\N	2023-09-28 19:39:31.091541+00	\N	\N
94	ALERT2023280919383618438	1	43	<p>amb</p>	\N	\N	amb	43	19742	\N	\N	\N	2023-09-28 19:58:59.462184+00	\N	\N
95	ALERT2023280920572879889	1	43	<p>compliance</p>	\N	\N	compliance	100	19742	\N	\N	\N	2023-09-28 20:58:43.553615+00	\N	\N
96	ALERT2023280920572879889	1	43	<p>compliance</p>	\N	\N	compliance	100	19742	\N	\N	\N	2023-09-28 21:03:39.009865+00	\N	\N
97	ALERT2023280921034654549	1	43	<p>charlie</p>	\N	\N	Please review and ensure compliance	60	19742	\N	\N	\N	2023-09-28 21:04:20.530358+00	\N	\N
98	ALERT2023280921103350228	1	43		\N	\N	Please review and ensure compliance	60	19787	\N	\N	\N	2023-09-28 21:11:09.131548+00	\N	\N
99	ALERT2023280921121543587	1	43	<p>bin card</p>	\N	\N	bin card	104	19738	\N	\N	\N	2023-09-28 21:13:01.544354+00	\N	\N
100	ALERT2023280921152811185	1	43	<p>CHARGES NOT TAKEN</p>	\N	\N	CHARGES NOT TAKEN	60	19724	\N	\N	\N	2023-09-28 21:16:19.459113+00	\N	\N
101	ALERT2023290905354480159	1	43	<p>Check for valid documentation</p>	\N	\N	Please review compliance status	44	19863	\N	\N	\N	2023-09-29 05:37:29.667311+00	\N	\N
102	ALERT2023290905354480159	1	43	<p>Check for valid documentation</p>	\N	\N	Please review compliance status	44	19863	\N	\N	\N	2023-09-29 05:37:29.672073+00	\N	\N
103	ALERT2023290905354480159	1	43	<p>Check for valid documentation</p>	\N	\N	Please review compliance status	44	19863	\N	\N	\N	2023-09-29 05:37:30.269745+00	\N	\N
104	ALERT2023290905354480159	1	43	<p>Check for valid documentation</p>	\N	\N	Please review compliance status	44	19863	\N	\N	\N	2023-09-29 05:37:30.366688+00	\N	\N
105	ALERT2023290905391799169	1	43	<p>Check for proofs of expense</p>	\N	\N	Provide Receipts	48	19784	\N	\N	\N	2023-09-29 05:41:27.533069+00	\N	\N
106	ALERT2023290905420435083	1	43	<p>BVN, Phone and Address of the NOK is required for full confirmation</p>	\N	\N	Provide next of kin	44	19891	\N	\N	\N	2023-09-29 05:43:50.133269+00	\N	\N
107	ALERT2023290905442568853	1	43	<p>Documents needed for processing</p>	\N	\N	Confirm date of creation	44	19906	\N	\N	\N	2023-09-29 05:45:57.048006+00	\N	\N
108	ALERT2023290905470979254	1	43	<p>Annual</p>	\N	\N	Annual check	71	19744	\N	\N	\N	2023-09-29 05:49:31.854277+00	\N	\N
109	ALERT2023290907024754224	1	43	<p>check status</p>	\N	\N	Please review and ensure compliance	60	19906	\N	\N	\N	2023-09-29 07:03:19.720206+00	\N	\N
110	ALERT2023290909563810546	1	101	<p>Strap all</p>	\N	\N	Strap it	97	19925	\N	\N	\N	2023-09-29 09:58:00.830052+00	\N	\N
111	ALERT7302230608	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-09-29 11:00:29	2023-09-29 11:00:29	\N
112	ALERT2023290912143723408	1	101	<p>confirm mail</p>	\N	\N	Please review and ensure compliance	104	19906	\N	\N	\N	2023-09-29 12:15:26.367534+00	\N	\N
113	ALERT2023290912162218105	1	101	<p>virtural</p>	\N	\N	Please review and ensure compliance	43	19906	\N	\N	\N	2023-09-29 12:17:43.111459+00	\N	\N
114	ALERT2023290912193498128	1	101	<p>progression</p>	\N	\N	progression	101	19925	\N	\N	\N	2023-09-29 12:20:23.983336+00	\N	\N
115	ALERT2023290913040055979	1	101	<p>compliance</p>	\N	\N	compliance	102	19906	\N	\N	\N	2023-09-29 13:04:46.625213+00	\N	\N
116	ALERT2023290913060951097	1	101	<p>card update</p>	\N	\N	card update	62	19738	\N	\N	\N	2023-09-29 13:06:57.582155+00	\N	\N
117	ALERT3173822219	1	10	\N	\N	\N	email check	60	19891	[["appdev@gmail.com"]]	\N	\N	2023-09-29 13:46:29	2023-09-29 13:46:29	\N
118	ALERT6280402180	1	10	\N	\N	\N	email check	60	19891	[["appdev@gmail.com"]]	\N	\N	2023-09-29 13:52:19	2023-09-29 13:52:19	\N
119	ALERT2023290913533270913	1	101	<p>inbound</p>	\N	\N	inbound	66	17148	\N	\N	\N	2023-09-29 13:54:21.538035+00	\N	\N
120	ALERT2023290913551736266	1	101	<p>Mismatching</p>	\N	\N	Mismatch	42	17146	\N	\N	\N	2023-09-29 13:56:13.642958+00	\N	\N
121	ALERT2023290913571494967	2	101	<p>cashers</p>	\N	\N	cashing	104	17249	\N	\N	\N	2023-09-29 13:58:03.655862+00	\N	\N
122	ALERT2023290913571494967	2	101	<p>cashers</p>	\N	\N	cashing	104	17249	\N	\N	\N	2023-09-29 13:58:29.517165+00	\N	\N
123	ALERT2023290913571494967	2	101	<p>cashers</p>	\N	\N	cashing	104	17249	\N	\N	\N	2023-09-29 13:59:16.708912+00	\N	\N
124	ALERT2023011015323969524	1	43	<p>first description</p>	\N	\N	Please review	92	17368	\N	\N	\N	2023-10-01 15:33:47.923101+00	\N	\N
125	ALERT2023021009182781507	1	43	<p>DOCUMENT</p>	\N	\N	DOCUMENT	43	17048	\N	\N	\N	2023-10-02 09:19:06.849429+00	\N	\N
126	ALERT2023021009193436671	1	43	<p>DOCUMENT</p>	\N	\N	DOCUMENT	104	17048	\N	\N	\N	2023-10-02 09:20:08.723437+00	\N	\N
127	ALERT2023021011272096321	1	43	<p>instrumentation</p>	\N	\N	instrumentation	60	17248	\N	\N	\N	2023-10-02 11:27:55.156642+00	\N	\N
128	ALERT2023021013253932497	1	43	<p>internal</p>	\N	\N	internal	42	17251	\N	\N	\N	2023-10-02 13:26:30.955477+00	\N	\N
129	ALERT2023021014124026325	1	43	<p>victor</p>	\N	\N		43	17251	\N	\N	\N	2023-10-02 14:13:24.265142+00	\N	\N
130	ALERT2023021014450762087	1	43	<p>instrument</p>	\N	\N	instrument	104	17249	\N	\N	\N	2023-10-02 14:46:16.928907+00	\N	\N
131	ALERT2023021019082168427	1	43	<p>fake stamps</p>	\N	\N	fake stamps	104	17393	\N	\N	\N	2023-10-02 19:09:10.325768+00	\N	\N
132	ALERT2023021019170012987	1	43	<p>DOCUMENT INCORRECT</p>	\N	\N	DOCUMENT INCORRECT	43	17025	\N	\N	\N	2023-10-02 19:18:09.471974+00	\N	\N
133	Sample Alert	1	43	Sample Description	\N	\N	Sample Action	40	19891	\N	\N	\N	2023-10-02 20:45:00.58559+00	\N	\N
134	Sample Alert	1	43	\N	\N	\N	Sample Action	40	19891	\N	\N	\N	2023-10-02 20:51:04.179503+00	\N	\N
135	ALERT2023021022263141496	1	43	<p>pending balance</p>	\N	\N	pending balance	71	17257	\N	\N	\N	2023-10-02 22:40:47.523656+00	\N	\N
136	ALERT2023021022463775957	1	43	<p>internal error</p>	\N	\N	internal error	60	17050	\N	\N	\N	2023-10-02 22:47:52.500709+00	\N	\N
137	ALERT5365681470	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-02 22:56:03	2023-10-02 22:56:03	\N
138	ALERT2023021023074753089	1	43	<p>check mail</p>	\N	\N	check mail	60	17026	\N	\N	\N	2023-10-02 23:08:40.852129+00	\N	\N
139	ALERT5430995050	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-02 23:13:24	2023-10-02 23:13:24	\N
140	ALERT2023021023115259117	1	43	<p>dating value</p>	\N	\N	dating value	60	17148	\N	\N	\N	2023-10-02 23:13:27.571634+00	\N	\N
141	ALERT4053225542	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-02 23:16:09	2023-10-02 23:16:09	\N
142	ALERT2023021023145737956	1	43	<p>documentation error</p>	\N	\N	documentation error	60	17050	\N	\N	\N	2023-10-02 23:16:11.92655+00	\N	\N
143	ALERT2023021023145737956	1	43	<p>documentation error</p>	\N	\N	documentation error	60	17050	\N	\N	\N	2023-10-02 23:16:39.244188+00	\N	\N
144	ALERT2023021023164750749	1	43	<p>documentation error</p>	\N	\N		60	17146	\N	\N	\N	2023-10-02 23:17:28.397256+00	\N	\N
145	ALERT2023021023164750749	1	43	<p>documentation error</p>	\N	\N		60	17146	\N	\N	\N	2023-10-02 23:18:19.56978+00	\N	\N
146	ALERT2023021023240713436	1	43	<p>VALUE DATING DOC</p>	\N	\N	VALUE DATING DOC	43	17148	\N	\N	\N	2023-10-02 23:25:02.420641+00	\N	\N
147	ALERT2023021023343316269	1	43	<p>cash issue</p>	\N	\N	cash issue	102	17249	\N	\N	\N	2023-10-02 23:35:26.734859+00	\N	\N
148	ALERT2023021023343316269	1	43	<p>cash issue</p>	\N	\N	cash issue	102	17249	\N	\N	\N	2023-10-02 23:36:22.80745+00	\N	\N
149	ALERT2023021023364525065	1	43	<p>charger</p>	\N	\N	charger	104	17367	\N	\N	\N	2023-10-02 23:37:39.824814+00	\N	\N
150	ALERT2023021023391290482	1	43	<p>charger</p>	\N	\N	charger	102	17249	\N	\N	\N	2023-10-02 23:39:55.746935+00	\N	\N
151	ALERT1343786581	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-03 00:08:39	2023-10-03 00:08:39	\N
152	ALERT9479467184	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-03 00:09:56	2023-10-03 00:09:56	\N
153	ALERT525639194	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-03 00:11:32	2023-10-03 00:11:32	\N
154	ALERT3813455144	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-03 00:12:57	2023-10-03 00:12:57	\N
156	ALERT9067310329	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-04 10:58:43	2023-10-04 10:58:43	\N
157	ALERT2184718058	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-04 11:05:16	2023-10-04 11:05:16	\N
158	ALERT6017064956	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-04 11:06:21	2023-10-04 11:06:21	\N
159	ALERT7955733198	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-04 11:07:30	2023-10-04 11:07:30	\N
160	ALERT1407329651	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-04 11:10:36	2023-10-04 11:10:36	\N
161	ALERT6690270468	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-04 11:13:01	2023-10-04 11:13:01	\N
162	ALERT2023041011152667030	1	101	<p>DOCUMENTATION NOT FOLLOWED THROUGH</p>	\N	\N	DOCUMENTATION NOT FOLLOWED THROUGH	102	17050	\N	\N	\N	2023-10-04 11:16:25.84719+00	\N	\N
163	ALERT294471051	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-04 11:19:04	2023-10-04 11:19:04	\N
164	ALERT3059045923	1	222	\N	\N	\N	\N	44	19716	[["lebechiuchey@gmail.com "],["uche.l@novajii.com"]]	\N	\N	2023-10-04 13:09:16	2023-10-04 13:09:16	\N
165	ALERT3418408497	1	222	\N	\N	\N	\N	44	19716	[["lebechiuchey@gmail.com "],["uche.l@novajii.com"]]	\N	\N	2023-10-04 13:11:57	2023-10-04 13:11:57	\N
166	ALERT2971809386	1	222	\N	\N	\N	\N	44	19716	[["lebechiuchey@gmail.com"],["uche.l@novajii.com"]]	\N	\N	2023-10-04 13:14:34	2023-10-04 13:14:34	\N
167	ALERT9025184901	1	222	\N	\N	\N	\N	44	19716	[["lebechiuchey@gmail.com"],["uche.l@novajii.com"]]	\N	\N	2023-10-04 13:53:05	2023-10-04 13:53:05	\N
168	ALERT2023041014161241243	1	101	<p>VALUE DATING DETECTED</p>	\N	\N	VALUE DATING DETECTED	60	17148	\N	\N	\N	2023-10-04 14:16:57.41549+00	\N	\N
169	ALERT2023041014195495462	1	101	<p>WRONG CHARGES TAKEN FROM INCEPTION</p>	\N	\N	WRONG CHARGES TAKEN FROM INCEPTION	43	17048	\N	\N	\N	2023-10-04 14:20:51.483346+00	\N	\N
170	ALERT2023041014283086998	1	101	<p>INSTRUCTION MISSING</p>	\N	\N	INSTRUCTION MISSING	60	17249	\N	\N	\N	2023-10-04 14:29:12.24101+00	\N	\N
171	ALERT2023041014291355307	2	101	<p>ATM STOCK &nbsp;CLOSED</p>	\N	\N	ATM STOCK  CLOSED	67	17392	\N	\N	\N	2023-10-04 14:31:03.24035+00	\N	\N
172	ALERT2023041014404320204	1	101	<p>INVALID CHEQUE PENDING REMOVAL</p>	\N	\N	INVALID CHEQUE PENDING	104	17253	\N	\N	\N	2023-10-04 14:41:44.217052+00	\N	\N
173	ALERT2023041015253578649	1	101	<p>CHEQUE PAID BUT NOT CONFIRMED EARLIER</p>	\N	\N	CHEQUE PAID BUT NOT CONFIRMED EARLIER	92	17034	\N	\N	\N	2023-10-04 15:26:39.80178+00	\N	\N
174	ALERT2023041015431751956	1	101	<p>CHARGES NOT TAKEN IN REALTIME</p>	\N	\N	CHARGES NOT TAKEN IN REALTIME	91	17026	\N	\N	\N	2023-10-04 15:44:27.235936+00	\N	\N
175	ALERT186988909	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-04 17:09:13	2023-10-04 17:09:13	\N
176	ALERT1504709307	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-04 17:12:10	2023-10-04 17:12:10	\N
177	ALERT9536988839	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-04 17:15:47	2023-10-04 17:15:47	\N
178	ALERT3947694090	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-04 17:20:17	2023-10-04 17:20:17	\N
179	ALERT4715301191	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-04 17:27:18	2023-10-04 17:27:18	\N
180	ALERT1776870452	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-04 17:31:51	2023-10-04 17:31:51	\N
181	ALERT6371897061	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-04 17:33:34	2023-10-04 17:33:34	\N
182	ALERT9657266818	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-04 17:38:04	2023-10-04 17:38:04	\N
183	ALERT8781875770	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-04 17:40:18	2023-10-04 17:40:18	\N
184	ALERT2023041019215372878	1	101	<p>CHARGES NOT TAKEN ON WEEKENDS</p>	\N	\N	CHARGES NOT TAKEN ON WEEKENDS	43	17026	\N	\N	\N	2023-10-04 19:22:43.81654+00	\N	\N
185	ALERT2023041021582927511	1	101	<p>All form fields arecompulsory</p>	\N	\N	check the form	99	17147	\N	\N	\N	2023-10-04 22:00:32.796089+00	\N	\N
186	ALERT8553011785	2	\N	\N	\N	\N	This is to notify you that a process was created	\N	\N	[]	\N	\N	2023-10-04 23:22:14	2023-10-04 23:22:14	\N
187	ALERT9897642882	2	\N	\N	\N	\N	This is to notify you that a process was created	\N	\N	[]	\N	\N	2023-10-04 23:25:19	2023-10-04 23:25:19	\N
188	ALERT9611977729	2	9	\N	\N	\N	This is to notify you that a process was created	\N	\N	[]	\N	\N	2023-10-04 23:28:08	2023-10-04 23:28:08	\N
189	ALERT527816473	2	9	\N	\N	\N	This is to notify you that a process was created	\N	\N	[]	\N	\N	2023-10-04 23:32:30	2023-10-04 23:32:30	\N
190	ALERT2083663668	2	43	\N	\N	\N	This is to notify you that a process was created	\N	\N	["tech-support@novajii.com"]	\N	\N	2023-10-04 23:36:50	2023-10-04 23:36:50	\N
191	ALERT4432552899	2	9	\N	\N	\N	This is to notify you that a process was created	\N	\N	[]	\N	\N	2023-10-05 00:02:46	2023-10-05 00:02:46	\N
192	ALERT7443795970	2	9	\N	\N	\N	This is to notify you that a process was created	\N	\N	[]	\N	\N	2023-10-05 00:13:15	2023-10-05 00:13:15	\N
193	ALERT6915587118	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-05 08:10:40	2023-10-05 08:10:40	\N
194	ALERT6637194314	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-05 08:16:59	2023-10-05 08:16:59	\N
195	ALERT6510266882	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-05 08:18:34	2023-10-05 08:18:34	\N
196	ALERT8902891407	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-05 08:21:11	2023-10-05 08:21:11	\N
197	ALERT9201823081	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-05 08:23:04	2023-10-05 08:23:04	\N
198	ALERT4252556681	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-05 08:24:10	2023-10-05 08:24:10	\N
199	ALERT134770037	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-05 08:43:57	2023-10-05 08:43:57	\N
200	ALERT4275038168	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-05 08:49:39	2023-10-05 08:49:39	\N
201	ALERT2665947643	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-05 09:51:36	2023-10-05 09:51:36	\N
202	ALERT530209254	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-05 09:56:41	2023-10-05 09:56:41	\N
203	ALERT6015268463	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-05 09:58:27	2023-10-05 09:58:27	\N
204	ALERT1234021253	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-05 09:58:55	2023-10-05 09:58:55	\N
205	ALERT5859389624	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-05 10:03:45	2023-10-05 10:03:45	\N
206	ALERT6134612420	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-05 10:04:29	2023-10-05 10:04:29	\N
207	ALERT8837772536	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-05 10:05:00	2023-10-05 10:05:00	\N
208	ALERT1176967102	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-05 10:05:58	2023-10-05 10:05:58	\N
209	ALERT4287833686	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-05 10:06:57	2023-10-05 10:06:57	\N
210	ALERT9458582276	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-05 10:07:41	2023-10-05 10:07:41	\N
211	ALERT3849254336	2	43	\N	\N	\N	\N	101	17034	[["tech-support@novajii.com"],["oluwatobi.obademi@sterling.ng"]]	\N	\N	2023-10-05 10:14:11	2023-10-05 10:14:11	\N
212	ALERT1148089871	2	43	\N	\N	\N	\N	101	17034	[["tech-support@novajii.com"],["oluwatobi.obademi@sterling.ng"]]	\N	\N	2023-10-05 10:16:39	2023-10-05 10:16:39	\N
213	ALERT8533736405	2	43	\N	\N	\N	\N	101	17034	[["tech-support@novajii.com"],["oluwatobi.obademi@sterling.ng"]]	\N	\N	2023-10-05 10:20:19	2023-10-05 10:20:19	\N
214	ALERT550728977	2	43	\N	\N	\N	\N	101	17034	[["tech-support@novajii.com"],["oluwatobi.obademi@sterling.ng"]]	\N	\N	2023-10-05 10:20:58	2023-10-05 10:20:58	\N
215	ALERT4894230674	2	43	\N	\N	\N	\N	101	17034	[["tech-support@novajii.com"],["oluwatobi.obademi@sterling.ng"]]	\N	\N	2023-10-05 10:37:56	2023-10-05 10:37:56	\N
216	ALERT2023051011232523586	1	101	<p>primary action</p>	\N	\N	primary action	102	17252	\N	\N	\N	2023-10-05 11:24:14.318365+00	\N	\N
217	ALERT2023051011330777928	1	101	<p>STORE REGISTER NOT UPDATED LATE</p>	\N	\N	STORE REGISTER NOT UPDATED LATE	104	17246	\N	\N	\N	2023-10-05 11:33:38.419648+00	\N	\N
218	ALERT9353138671	1	101	\N	\N	\N	\N	104	17246	[["charles.e@novajii.com"],["favour.e@novajii.com"]]	\N	\N	2023-10-05 11:33:38	2023-10-05 11:33:38	\N
219	ALERT6939320637	1	222	\N	\N	\N	\N	44	19716	[["lebechiuchey@gmail.com"],["uche.l@novajii.com"]]	\N	\N	2023-10-05 11:34:30	2023-10-05 11:34:30	\N
220	ALERT6836623876	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-05 11:40:18	2023-10-05 11:40:18	\N
221	ALERT5775382358	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-05 11:43:59	2023-10-05 11:43:59	\N
222	ALERT894133524	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-05 11:51:21	2023-10-05 11:51:21	\N
223	ALERT3748981687	2	9	\N	\N	\N	This is to notify you that a new document was created	\N	\N	[]	\N	\N	2023-10-05 11:52:26	2023-10-05 11:52:26	\N
224	ALERT3638300303	2	43	\N	\N	\N	\N	41	\N	[["tech-support@novajii.com"],["oluwatobi.obademi@sterling.ng"]]	\N	\N	2023-10-05 11:58:07	2023-10-05 11:58:07	\N
225	ALERT2023051012075115311	1	101	<p>CREDIT CARD CONTRACTORS</p>	\N	\N	CREDIT CARD CONTRACTORS	77	17368	\N	\N	\N	2023-10-05 12:09:34.581136+00	\N	\N
226	ALERT7339684786	1	101	\N	\N	\N	\N	77	17368	[["charles.e@novajii.com"],["hanson.e@novajii.com"]]	\N	\N	2023-10-05 12:09:34	2023-10-05 12:09:34	\N
227	ALERT9188896489	1	43	\N	\N	\N	\N	\N	17048	[["tech-support@novajii.com"],["oluwatobi.obademi@sterling.ng"]]	\N	\N	2023-10-05 12:12:47	2023-10-05 12:12:47	\N
228	ALERT2023051012174049869	1	101	<p>Response delayed</p>	\N	\N	Response delayed	104	17049	\N	\N	\N	2023-10-05 12:20:57.144731+00	\N	\N
229	ALERT5233471136	1	101	\N	\N	\N	\N	104	17049	[["charles.e@novajii.com"],["charles.e@novajii.com"]]	\N	\N	2023-10-05 12:20:57	2023-10-05 12:20:57	\N
230	ALERT8386532913	2	43	\N	\N	\N	This is to notify you that a process was created	\N	\N	["tech-support@novajii.com"]	\N	\N	2023-10-05 13:05:18	2023-10-05 13:05:18	\N
231	ALERT6755171004	2	43	\N	\N	\N	This is to notify you that a process was created	\N	\N	["tech-support@novajii.com"]	\N	\N	2023-10-05 13:05:20	2023-10-05 13:05:20	\N
232	ALERT9396887977	2	43	\N	\N	\N	This is to notify you that a process was created	\N	\N	["tech-support@novajii.com"]	\N	\N	2023-10-05 13:13:43	2023-10-05 13:13:43	\N
233	ALERT3971540838	2	43	\N	\N	\N	This is to notify you that a process was created	\N	\N	["tech-support@novajii.com"]	\N	\N	2023-10-05 13:13:44	2023-10-05 13:13:44	\N
234	ALERT2204961100	2	43	\N	\N	\N	This is to notify you that a process was created	\N	\N	["tech-support@novajii.com"]	\N	\N	2023-10-05 13:15:45	2023-10-05 13:15:45	\N
235	ALERT2023051013581765824	1	101	<p>INVALID CHEQUE OBSERVED ON WEEKENDS</p>	\N	\N	INVALID CHEQUE OBSERVED	46	17253	\N	\N	\N	2023-10-05 14:01:04.196365+00	\N	\N
236	ALERT6152367961	1	101	\N	\N	\N	\N	46	17253	[["charles.e@novajii.com"],["hanson.e@novajii.com"]]	\N	\N	2023-10-05 14:01:04	2023-10-05 14:01:04	\N
237	ALERT3206299085	1	43	\N	\N	\N	\N	\N	17048	[["tech-support@novajii.com"],["oluwatobi.obademi@sterling.ng"]]	\N	\N	2023-10-05 14:10:49	2023-10-05 14:10:49	\N
238	ALERT4004834565	1	43	\N	\N	\N	\N	\N	17048	[["tech-support@novajii.com"],["oluwatobi.obademi@sterling.ng"]]	\N	\N	2023-10-05 14:11:29	2023-10-05 14:11:29	\N
239	ALERT2117722024	1	43	\N	\N	\N	\N	\N	17048	[["tech-support@novajii.com"],["oluwatobi.obademi@sterling.ng"]]	\N	\N	2023-10-05 14:13:05	2023-10-05 14:13:05	\N
240	ALERT1522779189	1	43	\N	\N	\N	\N	\N	17048	[["tech-support@novajii.com"],["oluwatobi.obademi@sterling.ng"]]	\N	\N	2023-10-05 14:13:30	2023-10-05 14:13:30	\N
\.


--
-- Data for Name: am_account_type; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.am_account_type (id, name) FROM stdin;
110	PUBLIC TREASURY
111	POST OFFICE CHEQUES
112	BANKS AND CORRESPONDENTS
113	FINANCIAL INSTITUTIONS
114	INTERNATIONAL FINANCIAL INSTIT
200	CURRENT ACCOUNT INDIVIDUALS
201	CURRENT ACCOUNT SOLE PROPRIETO
202	CURRENT ACCOUNT SME
203	CURRENT ACCOUNT LARGE COMPANY
204	CURRENT ACCOUNT STATE CORPORAT
205	CURRENT ACCOUNT NGO INSTITUTIO
206	CURRENT ACCOUNT COOPERATIVES A
207	CURRENT ACCOUNT OTHER ECONOMIC
300	SAVINGS ACCOUNTS
310	SPECIAL SAVINGS ACCOUNTS
100	INTERNAL ACCOUNT
\.


--
-- Data for Name: am_approvers; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.am_approvers (id, mdp, name, cimp, nif, date_created, branch_code, last_updated, customer_id, puti, port, ddlv) FROM stdin;
AKELOUTE	169340	BURT	AMPLPRINT	9	27-JAN-2014	1	10-SEP-2018	\N	CONE	\N	\N
AOUCHANI	562427	SANDY	AMPLPRINT	0	27-JAN-2014	99999	\N	\N	CONE	\N	\N
PTALOM	562427	ELLIS	AMPLPRINT	0	27-JAN-2014	99999	\N	\N	CONE	\N	\N
PCHILIEBOU	CDDPMC	HOWARD	AMPLPRINT	0	27-JAN-2014	99999	10-SEP-2018	\N	CONE	\N	\N
KRAKHIF	169340	TIMOTHY	AMPLPRINT	9	27-JAN-2014	1	12-SEP-2018	\N	CONE	\N	\N
BMBAYE	XPUUWY	BAYARD	AMPLPRINT	0	27-JAN-2014	99999	\N	\N	CONE	\N	\N
SNJIMEFO	444700	FORREST	AMPLPRINT	9	27-JAN-2014	1	10-SEP-2018	\N	SI01	\N	\N
RNYA	MTOOOC	HOLLIS	AMPLPRINT	9	27-JAN-2014	99999	\N	\N	CONE	\N	\N
HBENKHAYAT	562427	LAWSON	AMPLPRINT	0	27-JAN-2014	99999	\N	\N	CONE	\N	\N
DPOKEM	SVYBJG	BILL	AMPLPRINT	8	27-JAN-2014	99999	10-SEP-2018	\N	CONE	\N	\N
HJP0001	198085	IRVIN	AMPLPRINT	0	27-JAN-2014	99999	27-SEP-2019	\N	\N	\N	\N
SIP0002	169340	RICH	AMPLPRINT	0	27-JAN-2014	99999	27-SEP-2019	\N	\N	\N	\N
YAP0004	198085	LINCOLN	AMPLPRINT	0	27-JAN-2014	99999	27-SEP-2019	\N	\N	\N	\N
BOP0018	089194	NEWTON	AMPLPRINT	9	10-FEB-2020	1	16-SEP-2020	\N	FC02	8253	\N
JOP0006	198085	STUART	AMPLPRINT	8	27-JAN-2014	1	26-JUL-2022	\N	AG15	\N	06-APR-2022
TOP0007	198085	HOSEA	AMPLPRINT	7	27-JAN-2014	2	03-JUN-2021	\N	AG10	\N	03-JUN-2021
DAP0008	198085	PARKER	AMPLPRINT	0	27-JAN-2014	99999	27-SEP-2019	\N	\N	\N	\N
SBP0010	198085	STEWART	AMPLPRINT	7	27-JAN-2014	99999	26-JUL-2022	\N	RQ07	\N	26-MAR-2020
AAP0011	198085	WATT	AMPLPRINT	0	27-JAN-2014	1	02-MAR-2021	\N	AG02	\N	16-JAN-2020
AUP0012	198085	WEBSTER	AMPLPRINT	5	27-JAN-2014	3	26-JUL-2022	\N	CONE	\N	\N
MAP0013	LDFIEK	HARVE	AMPLPRINT	9	27-JAN-2014	1	21-MAR-2022	\N	SI01	\N	16-APR-2019
HBP0014	198085	ADOLF	AMPLPRINT	0	27-JAN-2014	1	07-JUL-2022	\N	\N	\N	\N
AOP0029	301719	SEABORN	AMPLPRINT	0	18-FEB-2020	1	06-JUL-2022	\N	AG02	8255	22-MAR-2022
TAP0017	198085	ADEN	AMPLPRINT	4	27-JAN-2014	1	01-SEP-2021	\N	RQ05	\N	27-JUL-2020
MOP0154	273630	CECIL	AMPLPRINT	6	21-FEB-2020	2	28-SEP-2021	\N	FC08	8256	24-JUL-2020
ISP0019	198085	ANANIAS	AMPLPRINT	0	27-JAN-2014	1	24-AUG-2021	\N	AC04	\N	23-JUN-2020
IAP0020	198085	LINDSAY	AMPLPRINT	6	27-JAN-2014	1	26-JUL-2022	\N	\N	\N	09-JAN-2020
SBILODEAU	444700	CLARENCE	AMPLPRINT	9	27-JAN-2014	1	12-SEP-2018	\N	CONE	\N	\N
RONNY	198085	WILEY	AMPLPRINT	9	10-SEP-2018	99999	\N	\N	CONE	8129	\N
JOP0007	198085	ELMORE	AMPLPRINT	0	10-SEP-2018	1	27-SEP-2019	\N	\N	8132	\N
CJAY	637271	NORRIS	AMPLPRINT	9	11-SEP-2018	1	11-SEP-2018	\N	CONE	8136	\N
CJP0009	198085	ORIN	AMPLPRINT	0	10-SEP-2018	99999	\N	\N	CONE	8134	\N
UGO001	198085	HURLEY	AMPLPRINT	9	10-SEP-2018	1	12-SEP-2018	\N	CONE	8131	\N
IAP0022	198085	TOY	AMPLPRINT	0	10-SEP-2018	1	27-SEP-2019	\N	\N	8133	\N
MMARTIAL	198085	CURT	AMPLPRINT	9	10-SEP-2018	99999	16-APR-2019	\N	CONE	8135	16-APR-2019
KELOUTEA	426563	ARCHIE	AMPLPRINT	9	16-APR-2019	1	\N	\N	CONE	8146	\N
ELECALVEZ	426563	HORACE	AMPLSTRS	9	16-APR-2019	99999	\N	\N	CONE	8151	\N
TJABONG	426563	ALOYSIUS	AMPLSTRS	9	16-APR-2019	99999	\N	\N	CONE	8152	\N
SBOUTEBAVA	426563	PLEASANT	AMPLSTRS	9	16-APR-2019	99999	\N	\N	CONE	8150	\N
PACOCHI	426563	ROLAND	AMPLSTRS	9	16-APR-2019	99999	\N	\N	CONE	8153	\N
HAMZA	426563	IRVIN	AMPLPRINT	9	16-APR-2019	1	\N	\N	CONE	8141	\N
SEP0013	301719	CAL	AMPLPRINT	4	15-APR-2019	1	27-SEP-2019	\N	\N	8138	\N
SEP0003	301719	BOYD	AMPLPRINT	7	15-APR-2019	1	12-MAY-2022	\N	CONE	8137	10-DEC-2019
AAP0044	426563	WAYMAN	AMPLPRINT	0	16-APR-2019	99999	26-MAR-2020	\N	\N	8156	26-MAR-2020
\.


--
-- Data for Name: am_branches; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.am_branches (branch_code, branch_name) FROM stdin;
NG0010001	National Bank Plc-BNK
NG0020001	T24PROD-SBN
NG0020002	67 MARINA
NG0020003	IDUMOTA
NG0020004	BROAD STREET
NG0020005	IGBOSERE
NG0020006	HEAD OFFICE BRANCH
NG0020007	MARTINS
NG0020008	JOHN STREET
NG0020009	IDUMAGBO
NG0020010	SURA
NG0020011	DOCEMO
NG0020012	ISSA WILLIAMS
NG0020013	ALAKORO
NG0020014	SANGROUSE (LAFIAJI)
NG0020015	30 ADETOKUNBO ADEMOLA
NG0020016	228A AWOLOWO ROAD-IKY
NG0020017	BAKKY PLAZA - LEKKI
NG0020018	ADEOLA HOPEWELL
NG0020019	IKOTA SHOPPING COMPLEX
NG0020020	114 AWOLOWO ROAD - IKY
NG0020021	62 ADETOKUNBO ADEMOLA
NG0020022	ADEOLA ODEKU
NG0020023	RETAIL
NG0020024	SAKA TINUBU
NG0020025	COKER
NG0020026	WHARF ROAD
NG0020027	TINCAN
NG0020028	1 CREEK ROAD (NNEWI BU
NG0020029	LASU
NG0020030	KIRIKIRI ROAD
NG0020031	26B CREEK ROAD
NG0020032	COMMERCIAL ROAD
NG0020033	IBRU JETTY - APAPA
NG0020034	Festac
NG0020035	TRADE FAIR
NG0020036	ALABA
NG0020037	MOBIL ROAD - AJEGUNLE
NG0020038	AROMIRE
NG0020039	ILUPEJU
NG0020040	ADEBOLA HOUSE
NG0020041	2B OPEBI
NG0020042	AWOLOWO WAY - IKJ
NG0020043	68 OPEBI
NG0020044	IKORODU
NG0020045	ALLEN
NG0020046	CONOIL STATION - IKEJA
NG0020047	KETU
NG0020048	FADEYI
NG0020049	OGUDU
NG0020050	OGIJO
NG0020051	IJU ROAD - IFAKO
NG0020052	IDIMU
NG0020053	IYANA-IPAJA
NG0020054	SHASHA ROAD - DOPEMU
NG0020055	OBA AKRAN
NG0020056	OGBA
NG0020057	EJIGBO - NNPC
NG0020058	ADENIRAN OGUNSANYA
NG0020059	WILLOUGHBY- EBUTE
NG0020060	IDDO
NG0020061	OGUNLANA DRIVE- SURULE
NG0020062	HERBERT MACAULAY- YABA
NG0020063	MUSHIN
NG0020064	AIRPORT ROAD - IKJ
NG0020065	DALEKO
NG0020066	MATORI
NG0020067	IRE-AKARI - ISOLO
NG0020068	OKOTA ROAD
NG0020069	ITIRE
NG0020070	OSHODI
NG0020071	IWO ROAD - IBADAN
NG0020072	DUGBE
NG0020073	ABEOKUTA
NG0020074	IJEBU-ODE
NG0020075	APATA - IBADAN
NG0020076	RING ROAD BRANCH
NG0020077	SECRETARIAT - IBADAN
NG0020078	JERICHO - IBADAN
NG0020079	GBAGI - IBADAN
NG0020080	OKE-ADO - IBADAN
NG0020081	OTA
NG0020082	ORE
NG0020083	MM WAY
NG0020084	OSHOGBO
NG0020085	BOWEN UNIVERSITY
NG0020086	IBRAHIM TAIWO - ILORIN
NG0020087	ADO EKITI
NG0020088	AKURE
NG0020089	DOUGLAS RD - OWERRI
NG0020090	EZIUKWU RD - ABA
NG0020091	AZIKIWE RD - ABA
NG0020092	LIBRARY AVENUE - UMUAH
NG0020093	ORON RD - UYO
NG0020094	CLEMENT EBRI - CALABAR
NG0020095	ABAK RD - UYO
NG0020096	NEW MARKET RD - ONITS
NG0020097	MARKET RD - ENUGU
NG0020098	PORTHARCOURT ROAD ONIT
NG0020099	ZIK AVENUE- AWKA
NG0020100	OKPARA AVENUE - ENUGU
NG0020101	UGA BRIDGE HEAD ONITSH
NG0020102	NOTTIDGE - ONITSHA
NG0020103	AKPAKPAVA
NG0020104	ASABA 1
NG0020105	ODIBO
NG0020106	ASABA 2
NG0020107	ADESUWA ROAD
NG0020108	MISSION ROAD
NG0020109	SAPELE ROAD
NG0020110	IKPOBA HILL
NG0020111	OKADA
NG0020112	WARRI
NG0020113	EFFURUN
NG0020114	ENERHEN JUNCTION
NG0020115	13 TRANS AMADI
NG0020116	59 TRANS AMADI
NG0020117	MBIAMA RD - YENAGOA
NG0020118	OLU OBASANJO - PH
NG0020119	WOJI RD - PH
NG0020120	UPTH
NG0020121	115 TRANS AMADI
NG0020122	204 ABA ROAD
NG0020123	87 RUMUOLA
NG0020124	OGBUNABALI - PH
NG0020125	AGGREY RD - PH
NG0020126	MELFORD OKILO ROAD
NG0020127	PORT-HARCOURT REFINERY
NG0020128	ONNE
NG0020129	RUMUIBEKWE
NG0020130	MAMMAN KONTAGORA CLOSE
NG0020131	National BOULEVARD
NG0020132	LADOKE AKINTOLA - GARK
NG0020133	SEDA CLOSE - AREA 8
NG0020134	NATIONAL ASSEMBLY
NG0020135	ADEMOLA ADETOKUNBO - W
NG0020136	EMEKA ANYAOKU - AREA
NG0020137	KASHIM IBRAHIM - WUS
NG0020138	GATEWAY PLAZA - CBD
NG0020139	CONOIL - KADO
NG0020140	CONOIL - UTAKO
NG0020141	ALI AKILU - KADUNA
NG0020142	KACHIA ROAD - KADUNA
NG0020143	MINNA
NG0020144	KADUNA REFINERY
NG0020145	AHMADU BELLO WAY - KAD
NG0020146	MAKURDI
NG0020147	LOKOJA
NG0020148	SANI ABACHA WAY - KANO
NG0020149	MM WAY - KANO
NG0020150	DUTSE
NG0020151	KWARI MARKET - KANO
NG0020152	NIGER STREET - KANO
NG0020153	KOFAR RUWA - KANO
NG0020154	BAYERO UNIVERSITY - KA
NG0020155	SOKOTO
NG0020156	KATSINA
NG0020157	Kebbi
NG0020158	GUSAU - ZAMFARA
NG0020159	MAIDUGURI
NG0020160	BAUCHI
NG0020161	TERMINUS HOUSE - JOS
NG0020162	JINGIRI RD - JOS
NG0020163	JIMETA
NG0020164	GOMBE
NG0020165	MAGBORO BRANCH
NG0020166	ABULE EGBA BRANCH
NG0020167	AKUTE BRANCH
NG0020168	IKOTUN BRANCH
NG0020169	INDEPENDENCE WAY
NG0020170	KAGORO BRANCH
NG0020171	ZARIA BRANCH
NG0020172	SAGAMU BRANCH
NG0020173	OJUWOYE BRANCH
NG0020174	YENAGOA3 BRANCH
NG0020175	IKOYI3 902
NG0020176	ORILE IGANMU
NG0020177	EKEOHA BRANCH
NG0020178	DAMATURU BRANCH
NG0020179	JALINGO BRANCH
NG0020180	ABAKALIKI
NG0020555	VIRTUAL BRANCH
NG0020556	SWITCH BRANCH
NG0020557	GOMONEY BRANCH
\.


--
-- Data for Name: am_compliance_exceptions_found; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.am_compliance_exceptions_found (report_id, exceptions_found) FROM stdin;
3348	[Vault Cash Registers-Secured, Balanced (check amount in words & figures) & Alterations Signed off, Cash Strapped & Wrappers stamped and signed]
3398	[Validating postage stamp and postage stamp canceled], [Customers documents (BVN, ID etc.) fully validated from independently sourced data], [Resident Permit (Green Card) or CERPAC for foreigners (Section 8 Immigration Act 2015)]
3617	[Good quality photograph or picture]
3699	[Validating postage stamp and postage stamp canceled], [Gender]
3734	[Good quality photograph or picture], [Account scheme differs from that selected by customer], [Address on UB, CAC and/or account package KYC/VR identical], [Account operated by an unauthorized persons (including accounts of minors) or signatory]
3774	[Display of acceptance mark of the cards usable on the ATMs e.g. Visa, Mastercard], [Display of mirror to determine the locations of persons in their immediate visibility.]
3813	[Information on CBA is same with documentation], [Account scheme differs from that selected by customer], [BVN bio-data details of account holder/signatory/director/shareholder in agreement with customer�s details on account package], [Signatures of directors/trustees on Board resolution identical with that on CAC and/or CBA and/or Account Mandate]
3835	[Validating postage stamp and postage stamp canceled]
3852	[Vault Cash Registers-Secured, Balanced (check amount in words & figures) & Alterations Signed off, Cash Strapped & Wrappers stamped and signed]
3892	[Beneficial ownership obtained and identical with known to the Bank], [Good quality photograph or picture], [Alert linked to mobile and/or indemnity in place]
3926	[Total Number of Bank wide PEPs?], [Number of Bank-wide BDC/NGO or DNFBPs?]
3974	[Validating postage stamp and postage stamp canceled]
\.


--
-- Data for Name: am_currency; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.am_currency (currency_id, currency_name, narration) FROM stdin;
784	AED	United Arab Emirates Dirhams
36	AUD	Australian Dollars
56	BEF	Belgian Franc
124	CAD	Canadian Dollar
756	CHF	Swiss Franc
156	CNY	Yuan Renminbi
208	DKK	Danish Krone
978	EUR	Euro
826	GBP	Pound Sterling
400	JOD	Jordanian Dinar
392	JPY	Japanese Yen
566	NGN	Naira
512	OMR	Omani Rial
682	SAR	Saudi Riyal
840	USD	US Dollar
952	XOF	CFA FRANCS (BCEAO)
710	ZAR	South African Rand
\.


--
-- Data for Name: am_customer; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.am_customer (row_id, account_officer_id, title_code, id_number, customer_id, tier_id, category_id, lang_id, lastname, firstname, sex, dob, town, state, payn, sector_id, nat_id, company_name, rc_num, tax_id, individual_profile, branch_code, age_group, education_level, transaction_profile, bank_code, othername, reg_date, middlename, full_name) FROM stdin;
CUS0022768	777	\N	\N	22768	1	6005	1	H.Q.M.NIGERIA LTD	H.Q.M.NIGERIA LTD	\N	29-NOV-2001	LAGOS	LAGOS	\N	6000	\N	H.Q.M.NIGERIA LTD	\N	\N	14	NG0020001	\N	\N	\N	\N	\N	\N	\N	H.Q.M.NIGERIA LTD
CUS0023565	777	\N	\N	23565	1	4906	1	VIGOR OIL LIMITED	VIGOR OIL LIMITED	\N	\N	\N	\N	\N	4900	\N	VIGOR OIL LIMITED	\N	\N	14	NG0020001	\N	\N	\N	\N	\N	\N	\N	VIGOR OIL LIMITED
CUS0023887	777	MR	A5632632	23887	1	6212	1	ANEGBODE	MIKE	MALE	23-JUN-1969	LAGOS	LAGOS	\N	6200	\N	MIKE  ANEGBODE	\N	\N	11	NG0020001	\N	\N	\N	\N	\N	\N	\N	MIKE  ANEGBODE
CUS0024034	777	MRS	10112004	24034	1	4207	1	WILFRED	VICTORIA	FEMALE	10-OCT-1962	LAGOS	LAGOS	\N	4200	\N	VICTORIA  WILFRED	\N	\N	12	NG0020001	\N	\N	\N	\N	\N	\N	\N	VICTORIA  WILFRED
CUS0024327	777	MR	\N	24327	1	4806	1	ADEFOPE	ADELEKE	MALE	\N	\N	\N	\N	4800	\N	ADELEKE  ADEFOPE	\N	\N	11	NG0020001	\N	\N	\N	\N	\N	\N	\N	ADELEKE  ADEFOPE
CUS0024333	777	MR	\N	24333	1	6005	1	KENMOS LTD	\N	MALE	07-JUL-2005	\N	\N	\N	6000	\N	KENMOS LTD	\N	\N	14	NG0020001	\N	\N	\N	\N	\N	\N	\N	KENMOS LTD
CUS0025178	555	MRS	AG00265AA	25178	1	4902	1	AYENI	YEJIDE	FEMALE	17-JUN-1968	LAGOS	LAGOS	\N	4900	NIGERIA	YEJIDE VIRGINIA AYENI	\N	\N	11	NG0020001	\N	\N	\N	\N	\N	\N	\N	YEJIDE VIRGINIA AYENI
CUS0025582	777	\N	\N	25582	1	4304	1	ADAMS	ABDULLAHI HAMZE	MALE	\N	\N	\N	\N	4300	\N	ABDULLAHI HAMZE  ADAMS	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	ABDULLAHI HAMZE  ADAMS
CUS0025963	777	\N	\N	25963	1	5905	1	ATOBATELE	YEWANDE	MALE	\N	\N	\N	\N	5900	\N	YEWANDE  ATOBATELE	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	YEWANDE  ATOBATELE
CUS0025991	500554	\N	\N	25991	1	4304	1	IJIE	DORA ONOMEN	MALE	\N	\N	\N	\N	4300	\N	DORA ONOMEN  IJIE	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	DORA ONOMEN  IJIE
CUS0026472	777	MR	\N	26472	1	5905	1	AYANNIYI	TUNDE	MALE	25-JUN-1980	LAGOS	LAGOS	\N	5900	\N	TUNDE  AYANNIYI	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	TUNDE  AYANNIYI
CUS0027244	777	\N	\N	27244	1	6005	1	SEABREEZE GLOBAL INT L LTD	SEABREEZE GLOBAL INT L LTD	\N	\N	LAGOS	LAGOS	\N	6000	NIGERIA	SEABREEZE GLOBAL INT L LTD SEABREEZ	RC 16165	\N	14	NG0020001	\N	\N	\N	\N	\N	\N	\N	SEABREEZE GLOBAL INT L LTD SEABREEZ
CUS0027331	500544	MR	NEG6761AA1	27331	1	4304	1	NARINEDA NIGERIA LIMITED	NARINEDA NIGERIA LIMITED	MALE	06-FEB-1971	LAGOS	LAGOS	\N	4300	\N	NARINEDA NIGERIA LIMITED NARINEDA N	\N	\N	14	NG0020001	\N	\N	\N	\N	\N	\N	\N	NARINEDA NIGERIA LIMITED NARINEDA N
CUS0027369	777	MESSRS	\N	27369	1	4304	1	POLYFLOYD INVESTMENTS LIMITED	INVESTMENTS LIMITED	MALE	\N	\N	\N	\N	4300	\N	POLYFLOYD INVESTMENTS LIMITED INVES	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	POLYFLOYD INVESTMENTS LIMITED INVES
CUS0027777	777	MR	A2923670A	27777	1	5204	1	BAKARE	AYODELE	MALE	20-MAR-1960	LAGOS	LAGOS	\N	5200	NIGERIA	AYODELE  BAKARE	\N	\N	11	NG0020001	\N	\N	\N	\N	\N	\N	\N	AYODELE  BAKARE
CUS0028961	501721	MRS	OD349267959	28961	1	5004	1	AYANSOGA	FELICIA ABOSEDE	FEMALE	14-APR-1974	LAGOS	LAGOS	\N	5000	\N	FELICIA ABOSEDE  AYANSOGA	\N	\N	11	NG0020001	\N	\N	\N	\N	\N	\N	\N	FELICIA ABOSEDE  AYANSOGA
CUS0029157	777	MR	\N	29157	1	4803	1	IZUOGU	CHUKWUEBUKA	MALE	13-JUL-1959	LAGOS	LAGOS	\N	4800	\N	CHUKWUEBUKA  IZUOGU	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	CHUKWUEBUKA  IZUOGU
CUS0029627	508754	MR	APP25256AA2	29627	1	4803	1	OKPOKO	JOHN	MALE	13-SEP-1968	LAGOS	LAGOS	\N	4800	NG	JOHN  OKPOKO	\N	\N	11	NG0020001	\N	\N	\N	\N	\N	\N	\N	JOHN  OKPOKO
CUS0029831	555	MR	APP3598AB	29831	1	4803	1	AGU	ROMANUS CHUKWUEMEKA	MALE	26-FEB-1947	LAGOS	LAGOS	\N	4800	\N	ROMANUS CHUKWUEMEKA  AGU	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	ROMANUS CHUKWUEMEKA  AGU
CUS0030161	555	MR	AAA1612AB	30161	1	4803	1	DANFARI	EZEKIEL	MALE	07-MAY-1966	LAGOS	LAGOS	\N	4800	\N	EZEKIEL  DANFARI	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	EZEKIEL  DANFARI
CUS0030455	777	MR	\N	30455	1	4803	1	USHI	JUSTINE	MALE	\N	LAGOS	LAGOS	\N	4800	\N	JUSTINE  USHI	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	JUSTINE  USHI
CUS0030762	777	MR	\N	30762	1	4901	1	ARE	WASIU	MALE	\N	LAGOS	LAGOS	\N	4900	\N	WASIU  ARE	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	WASIU  ARE
CUS0030982	777	\N	\N	30982	1	5503	1	CARIX SHIPPING CO. LTD	CARIX SHIPPING CO. LTD	\N	20-FEB-1997	LAGOS	LAGOS	\N	5500	\N	CARIX SHIPPING CO. LTD	\N	\N	14	NG0020001	\N	\N	\N	\N	\N	\N	\N	CARIX SHIPPING CO. LTD
CUS0031576	777	MR	IM215454578	31576	1	4803	1	OFOELE	MOSES IKECHUKWU	MALE	02-APR-1974	LAGOS	LAGOS	\N	4800	\N	MOSES IKECHUKWU  OFOELE	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	MOSES IKECHUKWU  OFOELE
CUS0033096	777	\N	A00178590	33096	1	4207	1	SOBAB INTERNATIONAL LTD	SOBAB INTERNATIONAL LTD	\N	\N	LAGOS	LAGOS	\N	4200	\N	SOBAB INTERNATIONAL LTD	187393	\N	14	NG0020001	\N	\N	\N	\N	\N	\N	\N	SOBAB INTERNATIONAL LTD
CUS0034234	777	MR	OS500069343	34234	1	4803	1	LINLEY	TONY	MALE	24-JUL-1946	LAGOS	LAGOS	\N	4800	\N	TONY  LINLEY	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	TONY  LINLEY
CUS0034386	777	MR	WKR137DAA	34386	1	4803	1	IDOKO	ANTHONY AGBO	MALE	13-MAY-1973	LAGOS	LAGOS	\N	4800	\N	ANTHONY AGBO  IDOKO	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	ANTHONY AGBO  IDOKO
CUS0034425	777	MRS	\N	34425	1	5905	1	OSIBOGUN	OSIYOSOLA	FEMALE	23-JAN-1957	LAGOS	LAGOS	\N	5900	\N	OSIYOSOLA  OSIBOGUN	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	OSIYOSOLA  OSIBOGUN
CUS0034876	777	MR	\N	34876	1	4803	1	ACHIAGBA	EMMANUEL	MALE	01-JAN-1975	LAGOS	LAGOS	\N	4800	\N	EMMANUEL  ACHIAGBA	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	EMMANUEL  ACHIAGBA
CUS0035087	777	\N	\N	35087	1	5505	1	FAGSON ENGINEERING LTD	FAGSON ENGINEERING LTD	\N	\N	LAGOS	LAGOS	\N	5500	\N	FAGSON ENGINEERING LTD	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	FAGSON ENGINEERING LTD
CUS0035110	506035	\N	\N	35110	1	4817	1	JABBAR GANI AND SONS LTD	JABBAR GANI AND SONS CO.	MALE	\N	LAGOS	LAGOS	\N	4800	\N	JABBAR GANI AND SONS LTD JABBAR GAN	\N	\N	14	NG0020001	\N	\N	\N	\N	\N	\N	\N	JABBAR GANI AND SONS LTD JABBAR GAN
CUS0035200	777	\N	\N	35200	1	6001	1	VENTURES.TRAVEL	UNITED	\N	\N	LAGOS	LAGOS	\N	6000	\N	UNITED HAMMOUD VENTURES.TRAVEL	\N	\N	13	NG0020001	\N	\N	\N	\N	\N	\N	\N	UNITED HAMMOUD VENTURES.TRAVEL
CUS0035209	777	\N	ODO15987533	35209	1	6202	1	QUAYS LINK NIGERIA LTD	QUAYS LINK NIGERIA LTD	\N	25-JAN-1994	LAGOS	LAGOS	\N	6200	\N	QUAYS LINK NIGERIA LTD	\N	\N	13	NG0020001	\N	\N	\N	\N	\N	\N	\N	QUAYS LINK NIGERIA LTD
CUS0035330	777	\N	\N	35330	1	4817	1	SARO TRANSCONTINENTAL LTD	SARO TRANSCONTINENTAL LTD	\N	\N	LAGOS	LAGOS	\N	4800	\N	SARO TRANSCONTINENTAL LTD	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	SARO TRANSCONTINENTAL LTD
CUS0035370	777	\N	\N	35370	1	4921	1	MOHANDI ENTERPRISES	MOHANDI ENTERPRISES	\N	\N	LAGOS	LAGOS	\N	4900	\N	MOHANDI ENTERPRISES	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	MOHANDI ENTERPRISES
CUS0035707	777	MRS	EPE04422AA6	35707	1	4803	1	OYEWO	OLAIDE	FEMALE	02-MAY-1976	LAGOS	LAGOS	\N	4800	NIGERIA	OLAIDE  OYEWO	\N	\N	11	NG0020001	\N	\N	\N	\N	\N	\N	\N	OLAIDE  OYEWO
CUS0036650	777	MISS	\N	36650	1	5904	1	GIWA	ADETOUN ADIJAT	FEMALE	22-JUN-1967	LAGOS	LAGOS	\N	5900	\N	ADETOUN ADIJAT  GIWA	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	ADETOUN ADIJAT  GIWA
CUS0037094	777	\N	\N	37094	1	5324	1	ENTERPRISES	FAOLISH	\N	\N	LAGOS	LAGOS	\N	5300	\N	FAOLISH CONCEPT ENTERPRISES	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	FAOLISH CONCEPT ENTERPRISES
CUS0037121	777	\N	\N	37121	1	5904	1	FOA BASH NIG.LTD	FOA BASH NIG.LTD	\N	\N	LAGOS	LAGOS	\N	5900	\N	FOA BASH NIG.LTD	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	FOA BASH NIG.LTD
CUS0037359	777	MRS	\N	37359	1	4204	1	OLUWAKOTANMI	DEBORAH	FEMALE	22-FEB-1968	LAGOS	LAGOS	\N	4200	\N	DEBORAH  OLUWAKOTANMI	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	DEBORAH  OLUWAKOTANMI
CUS0037397	777	MRS	\N	37397	1	4921	1	ADEYEMO	SAODAT IFEDOLAPO	FEMALE	\N	\N	\N	\N	4900	\N	SAODAT IFEDOLAPO  ADEYEMO	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	SAODAT IFEDOLAPO  ADEYEMO
CUS0038157	507492	MR	CAL4081AC]CAL4081AC	38157	1	4803	1	FARINTO	ISAIAH	MALE	07-DEC-1945	LAGOS.	LAGOS.	\N	4800	\N	ISAIAH  FARINTO	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	ISAIAH  FARINTO
CUS0038842	500565	\N	\N	38842	1	4817	1	HAFEECON ENGINEERING NIG. LTD	HAFEECON ENGINEERING NIG. LTD	MALE	\N	LAGOS	LAGOS	\N	4800	\N	HAFEECON ENGINEERING NIG. LTD HAFEE	RC38842	\N	14	NG0020001	\N	\N	\N	\N	\N	\N	\N	HAFEECON ENGINEERING NIG. LTD HAFEE
CUS0038988	507492	ALHAJI	\N	38988	1	6401	1	THE DUKE MEDICAL	THE DUKE MEDICAL	MALE	01-JAN-1991	LAGOS	LAGOS	\N	6400	NIGERIA	THE DUKE MEDICAL THE DUKE MEDICAL	RC38988	\N	14	NG0020001	\N	\N	\N	\N	\N	\N	\N	THE DUKE MEDICAL THE DUKE MEDICAL
CUS0039561	507492	\N	\N	39561	1	4202	1	ADEMOLA	SHAMSONDEEN	MALE	\N	\N	\N	\N	4200	\N	SHAMSONDEEN  ADEMOLA	\N	\N	11	NG0020001	\N	\N	\N	\N	\N	\N	\N	SHAMSONDEEN  ADEMOLA
CUS0040041	777	MR	DL-BDG50121A	40041	1	5703	1	OBI	OSITA	MALE	05-FEB-1974	LAGOS	LAGOS	\N	5700	\N	OSITA  OBI	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	OSITA  OBI
CUS0040047	777	MR	\N	40047	1	5703	1	NWOSU	KINGSLEY C.	MALE	07-MAY-1972	LAGOS	LAGOS	\N	5700	\N	KINGSLEY C.  NWOSU	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	KINGSLEY C.  NWOSU
CUS0041054	777	MR	OG064302338	41054	1	4803	1	CHIBUOKE	CALLISTUS	MALE	12-MAY-1975	\N	\N	\N	4800	\N	CALLISTUS  CHIBUOKE	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	CALLISTUS  CHIBUOKE
CUS0042014	777	MR	EK058606189	42014	1	4803	1	ADODOH	ANTHONY	MALE	22-JUN-1963	LAGOS	LAGOS	\N	4800	\N	ANTHONY  ADODOH	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	ANTHONY  ADODOH
CUS0042298	777	MR	AK056140345	42298	1	4803	1	WILLIE	IFIOK	MALE	17-JUL-1969	LAGOS	LAGOS	\N	4800	NG	IFIOK OKON WILLIE	\N	\N	11	NG0020001	\N	\N	\N	\N	\N	\N	\N	IFIOK OKON WILLIE
CUS0043688	777	MR	A1465611	43688	1	4207	1	AJENIPA	MUFUTAU	MALE	26-NOV-1974	LAGOS	LAGOS	\N	4200	\N	MUFUTAU  AJENIPA	\N	\N	11	NG0020001	\N	\N	\N	\N	\N	\N	\N	MUFUTAU  AJENIPA
CUS0043725	777	\N	\N	43725	1	5905	1	OYEGOKE	EMMANUEL	MALE	\N	\N	\N	\N	5900	\N	EMMANUEL  OYEGOKE	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	EMMANUEL  OYEGOKE
CUS0044927	777	MR	PHC44932A1	44927	1	4207	1	JIMOH	SAKA	MALE	23-MAY-1978	FEDERAL CAPITAL TERRITORY	FEDERAL CAPITAL TERRITORY	\N	4200	\N	SAKA  JIMOH	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	SAKA  JIMOH
CUS0045683	777	MR	\N	45683	1	4803	1	APEH	YUNISA	MALE	01-JUN-1965	FEDERAL CAPITAL TERRITORY	FEDERAL CAPITAL TERRITORY	\N	4800	\N	YUNISA  APEH	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	YUNISA  APEH
CUS0046105	777	\N	119258278	46105	1	5501	1	SYMBAR INVESTMENTS LTD	SYMBAR INVESTMENTS LTD	\N	02-MAR-2000	FEDERAL CAPITAL TERRITORY	FEDERAL CAPITAL TERRITORY	\N	5500	\N	SYMBAR INVESTMENTS LTD	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	SYMBAR INVESTMENTS LTD
CUS0046550	777	\N	\N	46550	1	5004	1	ENRICH SYSTEMS LIMITED	ENRICH SYSTEMS LIMITED	MALE	\N	FCT	FCT	\N	5000	\N	ENRICH SYSTEMS LIMITED	\N	\N	11	NG0020001	\N	\N	\N	\N	\N	\N	\N	ENRICH SYSTEMS LIMITED
CUS0046737	777	\N	\N	46737	1	4207	1	SHADA	ILIYA	MALE	\N	\N	\N	\N	4200	\N	ILIYA  SHADA	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	ILIYA  SHADA
CUS0046800	777	MR	\N	46800	1	4803	1	ONWUANUOKWU	UCHE	MALE	\N	FEDERAL CAPITAL TERRITORY	FEDERAL CAPITAL TERRITORY	\N	4800	\N	UCHE  ONWUANUOKWU	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	UCHE  ONWUANUOKWU
CUS0046991	500803	MR	\N	46991	1	4207	1	ALKALI	JOHN	MALE	01-JAN-1900	FEDERAL CAPITAL TERRITORY	FEDERAL CAPITAL TERRITORY	\N	4200	\N	JOHN  ALKALI	\N	\N	11	NG0020001	\N	\N	\N	\N	\N	\N	\N	JOHN  ALKALI
CUS0047961	777	MR	\N	47961	1	4207	1	PAUL	ONUORAH OKOYE	MALE	01-DEC-2016	KADUNA	KADUNA	\N	4200	\N	ONUORAH OKOYE  PAUL	\N	\N	11	NG0020001	\N	\N	\N	\N	\N	\N	\N	ONUORAH OKOYE  PAUL
CUS0048401	777	MR	\N	48401	1	4207	1	AUDU-SUNDAY	KINGSLEY	MALE	\N	KADUNA	KADUNA	\N	4200	\N	KINGSLEY  AUDU-SUNDAY	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	KINGSLEY  AUDU-SUNDAY
CUS0049514	777	\N	\N	49514	1	4207	1	SAEED	BERJAWI	MALE	\N	\N	\N	\N	4200	\N	BERJAWI  SAEED	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	BERJAWI  SAEED
CUS0050594	777	MR	OS526662523	50594	1	4207	1	OLADIMEJI	KOLAWOLE	MALE	13-APR-1945	ILESA	ILESA	\N	4200	\N	KOLAWOLE  OLADIMEJI	\N	\N	\N	NG0020001	\N	\N	\N	\N	\N	\N	\N	KOLAWOLE  OLADIMEJI
CUS0052442	777	\N	\N	52442	1	5004	1	AKURE BRANCH LOAN RECOVERY FUN	AKURE BRANCH LOAN RECOVERY FUN	MALE	\N	AKURE	AKURE	\N	5000	\N	AKURE BRANCH LOAN RECOVERY FUN	\N	\N	11	NG0020001	\N	\N	\N	\N	\N	\N	\N	AKURE BRANCH LOAN RECOVERY FUN
\.


--
-- Data for Name: am_customer_account; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.am_customer_account (id, ext_rowid, account_number, product_name, branch_code, currency_code, account_name, customer_id, risk_rating, date_created, product_code, gl_code, gl_code_id, gl_code_category_id, closure_status, account_type_id, balance) FROM stdin;
1	AAAxeZABGAADFTWAAN	3525	SAVING	1	566	NEIL	80	\N	11-OCT-2019	321	202008	202	8	N	100	50.00
2	AAAxeZABGAADFTWAAO	3587	INDIVIDUAL-CURRENT	1	566	ESTES	87	\N	11-OCT-2019	401	201004	201	4	N	100	9568.75
3	AAAxeZABGAADFTWAAP	4010	CORP CURRENT	1	566	MORGAN	107	\N	15-OCT-2019	501	201005	201	5	N	100	1130458.84
4	AAAxeZABGAADFTXAAH	5024	DOMICILIARY-CORPORATE	1	840	DAWSON	161	\N	28-OCT-2019	121	201006	201	6	N	200	9.98
5	AAAxeZABGAADFTXAAI	5086	DOMICILIARY-CORPORATE	1	840	TILLMAN	180	\N	28-OCT-2019	121	201006	201	6	N	200	10.00
6	AAAxeZABGAADFTXAAJ	5093	DOMICILIARY-CORPORATE	1	826	WILMER	180	\N	28-OCT-2019	121	201006	201	6	N	200	10.00
7	AAAxeZABGAADFTXAAK	5134	SAVINGS	1	566	NOBLE	173	\N	28-OCT-2019	321	202008	202	8	N	100	5.36
8	AAAxeZABGAADFTXAAM	5354	SAVINGS	1	566	RUDOLPH	189	\N	29-OCT-2019	321	202008	202	8	N	100	2859461.67
9	AAAxeZABGAADFTXAAP	2834	STAFF SAVINGS	1	566	LOGAN	28	\N	08-OCT-2019	361	202008	202	8	N	100	60.82
10	AAAxeZABGAADFTXAAQ	2889	STAFF SAVINGS	1	566	LAWRENCE	45	\N	08-OCT-2019	361	202008	202	8	N	100	51.54
11	AAAxeZABGAADFTYAAA	2913	STAFF SAVINGS	1	566	EPHRAIM	18	\N	08-OCT-2019	361	202008	202	8	N	100	12343.18
12	AAAxeZABGAADFTYAAB	3783	DOMICILIARY-INDIVIDUAL	1	978	DOLPHUS	106	\N	15-OCT-2019	111	201007	201	7	O	100	0.00
13	AAAxeZABGAADFTYAAC	3848	SAVINGS	1	566	TOMAS	100	\N	15-OCT-2019	321	202008	202	8	N	100	22833.02
14	AAAxeZABGAADFTYAAD	4106	SAVINGS	1	566	DAVE	118	\N	17-OCT-2019	321	202008	202	8	N	100	308.13
15	AAAxeZABGAADFTYAAH	5017	CORP CURRENT	1	566	GARLAND	161	\N	28-OCT-2019	501	201005	201	5	N	100	9561.25
16	AAAxeZABGAADFTYAAI	5275	CORP CURRENT	1	566	ALONZA	184	\N	29-OCT-2019	501	201005	201	5	N	100	5472809.89
17	AAAxeZABGAADFTYAAJ	5282	DOMICILIARY-CORPORATE	1	840	HOLLIS	184	\N	29-OCT-2019	121	201006	201	6	O	200	0.00
18	AAAxeZABGAADFTYAAK	5309	DOMICILIARY-CORPORATE	1	826	NICHOLAS	184	\N	29-OCT-2019	121	201006	201	6	O	200	0.00
19	AAAxeZABGAADFTYAAL	5361	SAVINGS ACCT(T1)-	1	566	LIONEL	191	\N	29-OCT-2019	821	202010	202	10	N	300	12.00
20	AAAxeZABGAADFTZAAC	2566	CORP CURRENT	1	566	ISAAC	34	\N	04-OCT-2019	501	201005	201	5	N	100	70031695.97
21	AAAxeZABGAADFTZAAD	3769	INDIVIDUAL-CURRENT	1	566	JEROME	106	\N	15-OCT-2019	401	201004	201	4	N	100	8.00
22	AAAxeZABGAADFTZAAE	4216	INDIVIDUAL-CURRENT	1	566	EWELL	125	\N	18-OCT-2019	401	201004	201	4	N	100	4250.02
23	AAAxeZABGAADFTZAAF	4230	SAVINGS	1	566	STEWART	125	\N	18-OCT-2019	321	202008	202	8	N	100	489.50
24	AAAxeZABGAADFTZAAG	4247	INDIVIDUAL-CURRENT	1	566	ROSS	126	\N	18-OCT-2019	401	201004	201	4	N	100	20.00
25	AAAxeZABGAADFTZAAH	4254	DOMICILIARY-INDIVIDUAL	1	978	MARIE	126	\N	18-OCT-2019	111	201007	201	7	O	100	0.00
26	AAAxeZABGAADFTZAAI	4261	DOMICILIARY-INDIVIDUAL	1	840	JULIAN	126	\N	18-OCT-2019	111	201007	201	7	O	100	0.00
27	AAAxeZABGAADFTZAAJ	4890	SAVINGS	1	566	IRVIN	167	\N	28-OCT-2019	321	202008	202	8	N	100	45.00
28	AAAxeZABGAADFTZAAK	5505	PB CURRENT CORPORATE	1	566	SQUIRE	206	\N	31-OCT-2019	231	201005	201	5	N	100	124645.00
29	AAAxeZABGAADFTZAAL	6083	SAVINGS	1	566	CLEVELAND	251	\N	07-NOV-2019	321	202008	202	8	N	100	2228.33
30	AAAxeZABGAADFTZAAM	6629	SAVINGS	1	566	JOSE	292	\N	14-NOV-2019	321	202008	202	8	N	100	5441115.21
32	AAAxeZABGAADFTaAAA	4883	INDIVIDUAL-CURRENT	1	566	OSCAR	167	\N	28-OCT-2019	401	201004	201	4	N	100	1.00
33	AAAxeZABGAADFTaAAB	5316	PB CURRENT CORPORATE	1	566	CLARA	190	\N	29-OCT-2019	231	201005	201	5	O	100	0.00
34	AAAxeZABGAADFTaAAC	5323	PB CURRENT CORPORATE	1	566	JULIA	192	\N	29-OCT-2019	231	201005	201	5	O	100	0.00
35	AAAxeZABGAADFTaAAD	5897	SAVINGS	1	566	BENTON	232	\N	04-NOV-2019	321	202008	202	8	N	100	3454.62
36	AAAxeZABGAADFTaAAH	6320	SAVINGS	1	566	LUCIEN	266	\N	12-NOV-2019	321	202008	202	8	N	100	11459.42
37	AAAxeZABGAADFTaAAI	6368	PB CURRENT CORPORATE	1	566	ISSAC	269	\N	12-NOV-2019	231	201005	201	5	N	100	445329.12
38	AAAxeZABGAADFTaAAJ	6478	SAVINGS ACCT(T2)-	1	566	KNOX	281	\N	13-NOV-2019	851	202011	202	11	N	100	100.00
39	AAAxeZABGAADFTaAAK	6485	SAVINGS ACCT(T2)-	1	566	RUBIN	280	\N	13-NOV-2019	851	202011	202	11	N	100	78.12
40	AAAxeZABGAADFTaAAL	6492	SAVINGS ACCOUNT	1	566	WILMER	279	\N	13-NOV-2019	325	202001	202	1	N	100	113550.26
41	AAAxeZABGAADFTaAAN	7183	SAVINGS ACCT(T2)-	1	566	GILMAN	325	\N	18-NOV-2019	851	202011	202	11	N	100	38.42
42	AAAxeZABGAADFTbAAA	3886	INDIVIDUAL-CURRENT	1	566	CELESTINO	103	\N	15-OCT-2019	401	201004	201	4	O	100	0.00
43	AAAxeZABGAADFTbAAB	3893	SAVINGS	1	566	BRADY	103	\N	15-OCT-2019	321	202008	202	8	N	100	1100.00
44	AAAxeZABGAADFTbAAC	3903	DOMICILIARY-INDIVIDUAL	1	840	NAT	103	\N	15-OCT-2019	111	201007	201	7	O	100	0.00
46	AAAxeZABGAADFTbAAE	3927	DOMICILIARY-INDIVIDUAL	1	840	LILLIE	108	\N	15-OCT-2019	111	201007	201	7	O	100	0.00
47	AAAxeZABGAADFTbAAF	3941	PB CURRENT INDIVIDUAL	1	566	OTTIS	109	\N	15-OCT-2019	221	201004	201	4	N	100	344084.28
48	AAAxeZABGAADFTbAAG	4395	STAFF SAVINGS	1	566	FRANCIS	138	\N	22-OCT-2019	361	202008	202	8	N	100	2015.61
49	AAAxeZABGAADFTbAAH	4508	SAVINGS	1	566	MATT	145	\N	22-OCT-2019	321	202008	202	8	N	100	250.00
50	AAAxeZABGAADFTbAAI	4663	STAFF SAVINGS	1	566	RUTHERFORD	151	\N	23-OCT-2019	361	202008	202	8	N	100	6046.06
51	AAAxeZABGAADFTbAAJ	4687	STAFF SAVINGS	1	566	ELIAS	154	\N	23-OCT-2019	361	202008	202	8	N	100	110198.11
52	AAAxeZABGAADFTbAAN	5464	CORP CURRENT	1	566	RALPH	204	\N	30-OCT-2019	501	201005	201	5	N	100	37790877.97
53	AAAxeZABGAADFTbAAO	5646	SAVINGS	1	566	MAY	212	\N	01-NOV-2019	321	202008	202	8	N	100	16.00
54	AAAxeZABGAADFTbAAP	5653	SAVINGS	1	566	THEODORE	213	\N	01-NOV-2019	321	202008	202	8	N	100	16.00
55	AAAxeZABGAADFTcAAC	2793	STAFF SAVINGS	1	566	ELON	35	\N	08-OCT-2019	361	202008	202	8	N	100	93102.64
57	AAAxeZABGAADFTcAAF	4041	STAFF SAVINGS	1	566	GARRETT	112	\N	16-OCT-2019	321	202008	202	8	N	100	339.06
58	AAAxeZABGAADFTcAAG	4137	INDIVIDUAL-CURRENT	1	566	NELS	119	\N	17-OCT-2019	401	201004	201	4	N	100	331450.00
59	AAAxeZABGAADFTcAAH	4931	SAVINGS	1	566	JAKE	162	\N	28-OCT-2019	321	202008	202	8	N	100	16.00
60	AAAxeZABGAADFTcAAI	5079	CORP CURRENT	1	566	EVERETT	180	\N	28-OCT-2019	501	201005	201	5	N	100	8115.00
61	AAAxeZABGAADFTcAAJ	5268	DOMICILIARY-CORPORATE	1	826	GILES	183	\N	29-OCT-2019	121	201006	201	6	O	200	0.00
62	AAAxeZABGAADFTcAAK	5419	CORP CURRENT	1	566	ANGELO	185	\N	30-OCT-2019	501	201005	201	5	N	100	160926998.38
63	AAAxeZABGAADFTcAAL	6928	CORP CURRENT	1	566	GRAY	309	\N	15-NOV-2019	501	201005	201	5	N	100	16000.87
64	AAAxeZABGAADFTdAAC	2339	CORP CURRENT	1	566	WEBSTER	20	\N	02-OCT-2019	24	201005	201	5	N	100	3281740.55
65	AAAxeZABGAADFTdAAD	2841	STAFF SAVINGS	1	566	BRYANT	32	\N	08-OCT-2019	361	202008	202	8	N	100	639.37
66	AAAxeZABGAADFTdAAF	3628	INDIVIDUAL-CURRENT	1	566	COOPER	90	\N	14-OCT-2019	401	201004	201	4	N	100	1150595.25
67	AAAxeZABGAADFTdAAG	3707	STAFF SAVINGS	1	566	HANS	93	\N	14-OCT-2019	321	202008	202	8	N	100	63.17
68	AAAxeZABGAADFTdAAH	4144	SAVINGS	1	566	AUTHOR	119	\N	17-OCT-2019	321	202008	202	8	N	100	3184464.71
69	AAAxeZABGAADFTdAAI	4199	STAFF SAVINGS	1	566	LEO	121	\N	17-OCT-2019	361	202008	202	8	N	100	50.00
70	AAAxeZABGAADFTdAAJ	4405	SAVINGS ACCT(T1)-	1	566	FRANK	141	\N	22-OCT-2019	821	202010	202	10	N	300	16.00
71	AAAxeZABGAADFTdAAL	4515	SAVINGS	1	566	GUSTAVE	147	\N	22-OCT-2019	321	202008	202	8	N	100	20.00
72	AAAxeZABGAADFTdAAM	4539	STAFF SAVINGS	1	566	HEZEKIAH	136	\N	22-OCT-2019	361	202008	202	8	N	100	6407.50
73	AAAxeZABGAADFTdAAR	4917	SAVINGS	1	566	LONEY	159	\N	28-OCT-2019	321	202008	202	8	N	100	205605.75
74	AAAxeZABGAADFTeAAA	5385	SAVINGS	1	566	CARROLL	197	\N	30-OCT-2019	321	202008	202	8	N	100	290890.97
75	AAAxeZABGAADFTeAAB	5495	SAVINGS	1	566	LONZO	207	\N	31-OCT-2019	321	202008	202	8	O	100	0.00
76	AAAxeZABGAADFTeAAC	3051	STAFF SAVINGS	1	566	ALF	1	\N	08-OCT-2019	361	202008	202	8	N	100	749.45
77	AAAxeZABGAADFTeAAD	3068	STAFF SAVINGS	1	566	SYLVESTER	2	\N	08-OCT-2019	361	202008	202	8	N	100	2358.66
78	AAAxeZABGAADFTeAAE	3491	DOMICILIARY-INDIVIDUAL	1	826	ALGER	76	\N	11-OCT-2019	111	201007	201	7	O	100	0.00
79	AAAxeZABGAADFTeAAF	3824	SAVINGS	1	566	ANTON	104	\N	15-OCT-2019	321	202008	202	8	N	100	-291888.73
80	AAAxeZABGAADFTeAAG	5048	INDIVIDUAL-CURRENT	1	566	HOWARD	176	\N	28-OCT-2019	401	201004	201	4	N	100	12869.08
81	AAAxeZABGAADFTeAAH	5103	CORP PLUS	1	566	KELLY	85	\N	28-OCT-2019	541	201005	201	5	N	100	1898682.66
82	AAAxeZABGAADFTeAAJ	5983	CORP CURRENT	1	566	HOMER	237	\N	05-NOV-2019	24	201005	201	5	N	100	3501756.40
83	AAAxeZABGAADFTeAAK	5990	CORP CURRENT	1	566	IRVING	236	\N	05-NOV-2019	501	201005	201	5	N	100	16113024.95
84	AAAxeZABGAADFTeAAL	6746	STAFF SAVINGS	1	566	BURTON	295	\N	15-NOV-2019	361	202008	202	8	O	100	0.00
85	AAAxeZABGAADFTeAAM	6784	CORP CURRENT	1	566	FLORIAN	264	\N	15-NOV-2019	501	201005	201	5	N	100	2711.88
86	AAAxeZABGAADFTfAAF	2700	STAFF SAVINGS	1	566	MATH	27	\N	08-OCT-2019	361	202008	202	8	N	100	58.16
87	AAAxeZABGAADFTfAAG	3439	SAVINGS ACCT(T1)-	1	566	CECIL	73	\N	11-OCT-2019	821	202010	202	10	N	300	5016.00
88	AAAxeZABGAADFTfAAH	3453	SAVINGS ACCT(T1)-	1	566	MANNING	75	\N	11-OCT-2019	821	202010	202	10	N	300	925.00
89	AAAxeZABGAADFTfAAI	3604	INDIVIDUAL-CURRENT	1	566	OMAR	89	\N	11-OCT-2019	401	201004	201	4	N	100	532451.58
90	AAAxeZABGAADFTfAAJ	3666	INDIVIDUAL-CURRENT	1	566	PLEASANT	92	\N	14-OCT-2019	401	201004	201	4	N	100	100359.00
91	AAAxeZABGAADFTfAAK	4955	DOMICILIARY-CORPORATE	1	840	LESLIE	163	\N	28-OCT-2019	121	201006	201	6	O	200	0.00
92	AAAxeZABGAADFTfAAM	5488	SAVINGS	1	566	NICHOLAS	203	\N	31-OCT-2019	321	202008	202	8	N	100	156.67
93	AAAxeZABGAADFTfAAN	5907	INDIVIDUAL-CURRENT	1	566	ROBERT	230	\N	04-NOV-2019	401	201004	201	4	N	100	2005547.01
94	AAAxeZABGAADFTfAAO	6502	PB CURRENT INDIVIDUAL	1	566	EARLY	282	\N	13-NOV-2019	221	201004	201	4	N	100	488928.36
95	AAAxeZABGAADFTfAAP	6612	INDIVIDUAL-CURRENT	1	566	VALENTINE	290	\N	14-NOV-2019	401	201004	201	4	N	100	18313.92
96	AAAxeZABGAADFTgAAI	3109	STAFF SAVINGS	1	566	WILEY	54	\N	08-OCT-2019	361	202008	202	8	N	100	13.35
97	AAAxeZABGAADFTgAAJ	4209	KIDDIES NON-CHECKING	1	566	ANDY	122	\N	17-OCT-2019	311	202009	202	9	N	100	25062530.22
98	AAAxeZABGAADFTgAAK	4797	STAFF SAVINGS	1	566	MAURICE	157	\N	23-OCT-2019	361	202008	202	8	N	100	20232.93
99	AAAxeZABGAADFTgAAL	5581	CORP CURRENT	1	566	CLEO	209	\N	31-OCT-2019	501	201005	201	5	N	100	149532.27
100	AAAxeZABGAADFTgAAM	5622	SAVINGS	1	566	URBAN	215	\N	01-NOV-2019	321	202008	202	8	N	100	6672.64
31	AAAxeZABGAADFTZAAP	3738	CORP CURRENT	1	566	ACE	97	\N	15-OCT-2019	501	201005	201	5	N	100	1938.00
45	AAAxeZABGAADFTbAAD	3910	INDIVIDUAL-CURRENT	1	566	LONNIE	108	\N	15-OCT-2019	401	201004	201	4	O	100	0.00
56	AAAxeZABGAADFTcAAD	3635	INDIVIDUAL-CURRENT	1	566	ALVAH	84	\N	14-OCT-2019	401	201004	201	4	N	100	24379967.47
\.


--
-- Data for Name: am_customer_bvn; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.am_customer_bvn (customer_id, bvn) FROM stdin;
27777	22159384862
28961	22192321426
29627	22193415849
30161	22153060250
35707	22146413434
38157	22203932054
42298	22197595776
43688	22143438144
52442	22164750205
56419	22282952231
57851	22209329997
57858	22156028288
58502	22259889678
60452	22166954797
61822	22264287300
62150	22204063955
64983	22249288478
66272	22299854346
67030	22257769055
67160	22226221089
67526	22242102432
68582	22152288192
70581	22202549929
71529	22200960469
82930	22141801791
102668	22147341480
103682	22270648018
\.


--
-- Data for Name: am_customer_education_level; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.am_customer_education_level (id, name, category_code) FROM stdin;
1	UNEDUCATED	722
2	BASIC	722
3	SECONDARY	722
4	UNIVERSITY DEGREE	722
5	POST GRADUATE	722
6	OTHER	722
\.


--
-- Data for Name: am_customer_email; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.am_customer_email (customer_id, email_address) FROM stdin;
57858	amid.rafka@yahoo.com
58502	ocookey@hotmail.com]
60452	TOgunyemi@slb.com
69188	martzoye@yahoo.com
70581	xmood2@yahoo.com,
71529	tfatimehin@euroflowdesigns.com]
82930	bolaji.lawal@gtbank.com,]
92181	inix2k@yahoo.co.uk
96116	stevejoko@yahoo.com
97531	egbase85@yahoo.com
102668	ademart99@yahoo.com
117043	fodewunmi@yahoo.com
117810	IBRAHIMLIKELEKAN@YAHOO.COM
137482	fraken_2004@yahoo.co.uk
170222	tonia_amodu@yahoo.co.uk
172310	osezdomain@yahoo.com
179330	ogundaini@yahoo.com
181013	ayodele.ajimuda2016@gmail.com
201006	vishowroom@gmail.com,]
201906	pakirosky@yahoo.com,]
204246	rich_fad@yahoo.com]
211760	stebalog@yahoo.com]
212459	modupeoluwakemi@yahoo.com
241102	sannidudu@yahoo.com,]
246085	lekedavies@yahoo.com
248610	tonyojibah77@yahoo.co.uk
251232	yinkibid@yahoo.co.uk,]
253847	Boo@gmail.com
265998	ikugbaigbedayo@yahoo.com,]
271049	ujuuzoetue@yahoo.com
273941	mnuelannodim@yahoo.com,]
274130	nelo4ever2004@yahoo.com]
280221	crediblefred@gmail.com
281771	ALFA.SULEIMAN@YAHOO.COM
286370	doceno2003@yahoo.co.uk,]
\.


--
-- Data for Name: am_customer_individual_profile; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.am_customer_individual_profile (id, name, category_code) FROM stdin;
1	SINGLE INDIVIDUAL	116
2	MUTUAL INDIVIDUAL	116
\.


--
-- Data for Name: am_customer_language; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.am_customer_language (id, name, category_code) FROM stdin;
1	FRENCH	900
2	ENGLISH	900
\.


--
-- Data for Name: am_customer_phone; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.am_customer_phone (row_id, customer_id, phone_number, prefix, categ) FROM stdin;
AAAyQmAAJAAACK1AAD	134	2037031104	NGN	2
AAAyQmAAJAAACK1AAE	140	2022020670	NGN	2
AAAyQmAAJAAACK1AAF	141	2174338245	NGN	2
AAAyQmAAJAAACK1AAG	145	2063907279	NGN	2
AAAyQmAAJAAACK1AAH	147	2147532696	NGN	2
AAAyQmAAJAAACK1AAI	148	2075524557	NGN	2
AAAyQmAAJAAACK1AAJ	169	2037007707	NGN	2
AAAyQmAAJAAACK1AAK	194	2033339048	NGN	2
AAAyQmAAJAAACK1AAL	198	2185904643	NGN	2
AAAyQmAAJAAACK1AAM	200	2034023058	NGN	2
AAAyQmAAJAAACK1AAN	202	2035973480	NGN	2
AAAyQmAAJAAACK1AAO	203	2111200200	NGN	2
AAAyQmAAJAAACK1AAP	236	2055979797	NGN	2
AAAyQmAAJAAACK1AAQ	237	2175314151	NGN	2
AAAyQmAAJAAACK1AAR	237	7030975327	NGN	3
AAAyQmAAJAAACK1AAS	199	7036622954	NGN	2
AAAyQmAAJAAACK1AAT	283	2038006606	NGN	2
AAAyQmAAJAAACK1AAU	290	2035980511	NGN	2
AAAyQmAAJAAACK1AAV	285	7035833250	NGN	2
AAAyQmAAJAAACK1AAW	285	2153110291	NGN	3
AAAyQmAAJAAACK1AAX	287	2116856045	NGN	2
AAAyQmAAJAAACK1AAY	288	2037874811	NGN	2
AAAyQmAAJAAACK1AAZ	291	2037290984	NGN	2
AAAyQmAAJAAACK1AAa	293	2035592705	NGN	2
AAAyQmAAJAAACK1AAb	294	2090259283	NGN	2
AAAyQmAAJAAACK1AAc	294	2039268887	NGN	3
AAAyQmAAJAAACK1AAd	295	7030342468	NGN	2
AAAyQmAAJAAACK1AAe	296	2034030716	NGN	2
\.


--
-- Data for Name: am_customer_priority; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.am_customer_priority (customer_id, name, profile_date) FROM stdin;
1	LOW	44
2	HIGH	44
3	MEDIUM	44
\.


--
-- Data for Name: am_customer_profile; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.am_customer_profile (customer_id, profile_id, profile_date) FROM stdin;
22	200	02-OCT-2019
23	150	02-OCT-2019
27	800	03-OCT-2019
31	150	03-OCT-2019
34	150	04-OCT-2019
35	800	04-OCT-2019
36	800	04-OCT-2019
37	800	04-OCT-2019
38	800	04-OCT-2019
39	800	04-OCT-2019
40	800	04-OCT-2019
41	200	04-OCT-2019
42	800	04-OCT-2019
64	450	10-OCT-2019
65	800	10-OCT-2019
66	900	10-OCT-2019
67	150	10-OCT-2019
68	800	10-OCT-2019
69	800	10-OCT-2019
85	650	11-OCT-2019
86	900	11-OCT-2019
91	500	14-OCT-2019
92	900	14-OCT-2019
93	800	14-OCT-2019
96	900	14-OCT-2019
97	500	14-OCT-2019
106	900	15-OCT-2019
112	800	16-OCT-2019
124	50	18-OCT-2019
125	900	18-OCT-2019
126	900	18-OCT-2019
128	500	18-OCT-2019
155	800	23-OCT-2019
156	500	23-OCT-2019
159	900	24-OCT-2019
163	500	28-OCT-2019
166	900	28-OCT-2019
167	900	28-OCT-2019
170	900	28-OCT-2019
172	900	28-OCT-2019
173	900	28-OCT-2019
174	900	28-OCT-2019
175	900	28-OCT-2019
177	900	28-OCT-2019
178	900	28-OCT-2019
179	900	28-OCT-2019
181	500	28-OCT-2019
182	500	28-OCT-2019
183	500	29-OCT-2019
185	500	29-OCT-2019
186	500	29-OCT-2019
193	500	29-OCT-2019
196	900	29-OCT-2019
204	500	30-OCT-2019
219	900	01-NOV-2019
220	500	01-NOV-2019
221	50	01-NOV-2019
224	500	01-NOV-2019
227	550	04-NOV-2019
232	900	04-NOV-2019
234	900	05-NOV-2019
238	900	06-NOV-2019
256	900	07-NOV-2019
259	900	07-NOV-2019
268	500	08-NOV-2019
282	900	13-NOV-2019
289	700	14-NOV-2019
298	150	15-NOV-2019
300	900	15-NOV-2019
302	900	15-NOV-2019
303	900	15-NOV-2019
304	900	15-NOV-2019
305	900	15-NOV-2019
307	900	15-NOV-2019
308	900	15-NOV-2019
310	800	15-NOV-2019
315	900	15-NOV-2019
\.


--
-- Data for Name: am_customer_tier; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.am_customer_tier (tier_id, name) FROM stdin;
1	Tier 1 - Individual
2	Tier 2 - Corporate
3	Tier 3 - Corporate
\.


--
-- Data for Name: am_customer_transaction_profile; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.am_customer_transaction_profile (id, name, category_code) FROM stdin;
1	LESS THAN NGN 50000	46
2	BETWEEN 51000-500000	46
3	BETWEEN 500000-1M	46
4	BETWEEN 1M-5M	46
5	ABOVE 5M	46
\.


--
-- Data for Name: am_dormant_accounts; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.am_dormant_accounts (id, branch_code, branch_name, account_number, account_name, current_balance, dormancy_date, stoppage, account_type, date_opened, tin_number, bvn, closure_status) FROM stdin;
56	1	KANO MM WAY BRANCH	56679	CLAUDE	892.50	04-MAR-2022	DORMANT ACCOUNT	CURRENT	28-FEB-2020	18041911-0001	56	OPEN
57	1	HEAD OFFICE	57401	EDWIN	2000.00	08-MAR-2021	DORMANT ACCOUNT	CURRENT	28-FEB-2020	\N	2226551218457	OPEN
58	1	KANO MM WAY BRANCH	58374	BEN	103.00	03-DEC-2021	DORMANT ACCOUNT	CURRENT	02-MAR-2020	\N	2235751651358	OPEN
59	1	KANO MM WAY BRANCH	59876	CHARLEY	1257.50	11-FEB-2022	DORMANT ACCOUNT	CURRENT	04-MAR-2020	01726538-0001	59	OPEN
60	1	HEAD OFFICE	60526	PAUL	98.25	05-SEP-2022	DORMANT ACCOUNT	CURRENT	04-MAR-2020	\N	2236388382360	OPEN
61	1	HEAD OFFICE	60533	EDGAR	20.00	22-MAR-2021	DORMANT ACCOUNT	CURRENT	04-MAR-2020	21078393-0001	61	OPEN
62	1	HEAD OFFICE	60557	ISAAC	10.00	05-MAR-2021	DORMANT ACCOUNT	CURRENT	04-MAR-2020	6500165250	62	OPEN
63	1	KANO MM WAY BRANCH	61286	OTTO	30.00	13-DEC-2021	DORMANT ACCOUNT	CURRENT	05-MAR-2020	\N	2255489367363	OPEN
64	1	HEAD OFFICE	60605	LUTHER	50.00	25-JUN-2021	DORMANT ACCOUNT	CURRENT	04-MAR-2020	21403717	64	OPEN
65	1	KANO MM WAY BRANCH	62128	LAWRENCE	170.25	04-JUL-2022	DORMANT ACCOUNT	CURRENT	06-MAR-2020	\N	2233574974465	OPEN
66	1	HEAD OFFICE	62458	IRA	5.00	08-MAR-2021	DORMANT ACCOUNT	CURRENT	06-MAR-2020	22170840-0001	66	OPEN
67	1	HEAD OFFICE	62379	PATRICK	50.00	08-MAR-2021	DORMANT ACCOUNT	CURRENT	06-MAR-2020	\N	2214211319767	OPEN
68	1	KANO MM WAY BRANCH	64627	GUY	9950.00	22-MAR-2021	DORMANT ACCOUNT	CURRENT	10-MAR-2020	\N	2239842371668	OPEN
69	1	KANO MM WAY BRANCH	64610	OLIVER	40.00	16-DEC-2021	DORMANT ACCOUNT	CURRENT	10-MAR-2020	\N	2242216537569	OPEN
70	1	HEAD OFFICE	65026	THEODORE	244.15	03-AUG-2022	DORMANT ACCOUNT	CURRENT	10-MAR-2020	\N	2222879812470	OPEN
71	1	KANO MM WAY BRANCH	65851	HUGH	863.00	13-SEP-2021	DORMANT ACCOUNT	CURRENT	12-MAR-2020	\N	2250436971771	OPEN
72	1	ABUJA CORPORATE BRANCH	129847	CLYDE	20318.25	24-NOV-2021	DORMANT ACCOUNT	CURRENT	08-JUN-2020	\N	2221435934372	OPEN
73	1	KANO MM WAY BRANCH	65693	ALEXANDER	30.00	13-DEC-2021	DORMANT ACCOUNT	CURRENT	11-MAR-2020	\N	2240690385773	OPEN
74	1	KANO MM WAY BRANCH	67570	AUGUST	300.00	07-JAN-2022	DORMANT ACCOUNT	CURRENT	13-MAR-2020	\N	2244868971074	OPEN
75	1	KANO MM WAY BRANCH	67604	FLOYD	82.00	04-AUG-2022	DORMANT ACCOUNT	CURRENT	13-MAR-2020	\N	2226068385375	OPEN
76	1	KANO MM WAY BRANCH	67769	HOMER	5.24	24-DEC-2021	DORMANT ACCOUNT	CURRENT	13-MAR-2020	\N	2227671991476	OPEN
77	1	KANO MM WAY BRANCH	67776	JACK	851.00	13-SEP-2021	DORMANT ACCOUNT	CURRENT	13-MAR-2020	\N	2242967203977	OPEN
78	1	KANO MM WAY BRANCH	67941	LEONARD	275.00	04-JUL-2022	DORMANT ACCOUNT	CURRENT	13-MAR-2020	\N	2227513774578	OPEN
79	1	KANO MM WAY BRANCH	68759	HORACE	350.00	03-NOV-2021	DORMANT ACCOUNT	CURRENT	16-MAR-2020	\N	2221287625179	OPEN
80	1	KANO MM WAY BRANCH	68797	MARION	20.00	13-DEC-2021	DORMANT ACCOUNT	CURRENT	16-MAR-2020	\N	2216956435680	OPEN
81	1	KANO MM WAY BRANCH	69024	PHILIP	50.50	02-FEB-2022	DORMANT ACCOUNT	CURRENT	16-MAR-2020	\N	2230593476781	OPEN
82	1	KANO MM WAY BRANCH	141089	ALLEN	249.65	11-AUG-2022	DORMANT ACCOUNT	CURRENT	17-JUN-2020	\N	2243048397482	OPEN
83	1	HEAD OFFICE	69653	ARCHIE	99.62	01-APR-2022	DORMANT ACCOUNT	CURRENT	17-MAR-2020	\N	2232496641883	OPEN
84	1	HEAD OFFICE	69763	STEPHEN	213800.83	20-JUL-2022	DORMANT ACCOUNT	CURRENT	17-MAR-2020	\N	2216646064984	OPEN
85	1	KANO MM WAY BRANCH	70808	CHESTER	30.00	13-DEC-2021	DORMANT ACCOUNT	CURRENT	19-MAR-2020	\N	2232318092885	OPEN
86	1	HEAD OFFICE	70626	WILLIS	1721.75	13-SEP-2021	DORMANT ACCOUNT	CURRENT	18-MAR-2020	19852435	86	OPEN
87	1	KANO MM WAY BRANCH	74143	RAYMOND	50.00	04-AUG-2022	DORMANT ACCOUNT	CURRENT	23-MAR-2020	\N	2225832470287	OPEN
88	1	KANO MM WAY BRANCH	75250	RUFUS	158.08	04-JUL-2022	DORMANT ACCOUNT	CURRENT	23-MAR-2020	\N	2224819341688	OPEN
89	1	KANO MM WAY BRANCH	75016	WARREN	50.12	02-MAR-2022	DORMANT ACCOUNT	CURRENT	23-MAR-2020	\N	2222219112089	OPEN
90	1	KANO MM WAY BRANCH	85305	JESSIE	71.00	04-OCT-2021	DORMANT ACCOUNT	CURRENT	06-APR-2020	\N	2223252861190	OPEN
91	1	KANO MM WAY BRANCH	75865	MILTON	7296.50	02-JUL-2021	DORMANT ACCOUNT	CURRENT	24-MAR-2020	23080690	91	OPEN
92	1	KANO MM WAY BRANCH	77182	ALEX	606.00	28-MAR-2022	DORMANT ACCOUNT	CURRENT	25-MAR-2020	\N	2241519518692	OPEN
93	1	KANO MM WAY BRANCH	76556	LEO	375.00	15-SEP-2021	DORMANT ACCOUNT	CURRENT	24-MAR-2020	\N	2247077079493	OPEN
94	1	KANO MM WAY BRANCH	76549	JULIUS	2000.00	30-AUG-2021	DORMANT ACCOUNT	CURRENT	24-MAR-2020	\N	2224321203594	OPEN
95	1	KANO MM WAY BRANCH	77089	RAY	1950.00	29-MAR-2021	DORMANT ACCOUNT	CURRENT	25-MAR-2020	\N	2251593771195	OPEN
96	1	KANO MM WAY BRANCH	77278	SIDNEY	30.00	24-DEC-2021	DORMANT ACCOUNT	CURRENT	25-MAR-2020	\N	2227446893596	OPEN
97	1	KANO MM WAY BRANCH	77326	BERNARD	876.00	13-SEP-2021	DORMANT ACCOUNT	CURRENT	25-MAR-2020	\N	2221677714797	OPEN
98	1	KANO MM WAY BRANCH	78608	DAN	914.01	13-AUG-2021	DORMANT ACCOUNT	CURRENT	26-MAR-2020	\N	2232002050598	OPEN
99	1	KANO MM WAY BRANCH	78622	JERRY	10140.00	24-DEC-2021	DORMANT ACCOUNT	CURRENT	26-MAR-2020	\N	2229337608299	OPEN
100	1	ABUJA CORPORATE BRANCH	77670	CALVIN	696.25	14-MAY-2021	DORMANT ACCOUNT	CURRENT	25-MAR-2020	\N	22313869898100	OPEN
101	1	HEAD OFFICE	78969	PERRY	1030.32	01-APR-2022	DORMANT ACCOUNT	CURRENT	26-MAR-2020	203175690001	101	OPEN
102	1	KANO MM WAY BRANCH	221105	DAVE	14.25	30-MAY-2022	DORMANT ACCOUNT	CURRENT	27-JUL-2020	\N	22276564059102	OPEN
103	1	ABUJA CORPORATE BRANCH	147452	ANTHONY	20.00	24-DEC-2021	DORMANT ACCOUNT	CURRENT	22-JUN-2020	\N	22202744854103	OPEN
104	1	KANO MM WAY BRANCH	82957	EDDIE	49885.00	25-MAR-2022	DORMANT ACCOUNT	CURRENT	02-APR-2020	23674224-0001	104	OPEN
105	1	KANO MM WAY BRANCH	85233	AMOS	3387.50	24-MAY-2021	DORMANT ACCOUNT	CURRENT	06-APR-2020	\N	22181169588105	OPEN
106	1	HEAD OFFICE	104958	DENNIS	15100.00	02-MAY-2022	DORMANT ACCOUNT	CURRENT	06-MAY-2020	09917340-001	106	OPEN
107	1	ABUJA CORPORATE BRANCH	105395	CLIFFORD	209319.99	11-AUG-2022	DORMANT ACCOUNT	CURRENT	07-MAY-2020	179138270001	107	OPEN
108	1	HEAD OFFICE	105728	LEROY	20.00	01-DEC-2021	DORMANT ACCOUNT	CURRENT	08-MAY-2020	17644798-0001	108	OPEN
109	1	HEAD OFFICE	106361	WESLEY	76.00	05-SEP-2022	DORMANT ACCOUNT	CURRENT	08-MAY-2020	\N	22286536796109	OPEN
110	1	HEAD OFFICE	106660	ALONZO	203.00	03-NOV-2021	DORMANT ACCOUNT	CURRENT	11-MAY-2020	\N	22318044158110	OPEN
111	1	HEAD OFFICE	106835	GARFIELD	625.60	04-AUG-2022	DORMANT ACCOUNT	CURRENT	11-MAY-2020	\N	22380944182111	OPEN
166	1	HEAD OFFICE	184617	ELBERT	10767.26	04-JAN-2022	DORMANT ACCOUNT	CURRENT	13-JUL-2020	14901660-0001	166	OPEN
167	1	KANO MM WAY BRANCH	609192	LESLIE	30.00	13-OCT-2021	DORMANT ACCOUNT	CURRENT	21-SEP-2020	\N	22445135439167	OPEN
168	1	ABUJA CORPORATE BRANCH	184789	MARSHALL	4347.75	05-NOV-2021	DORMANT ACCOUNT	CURRENT	13-JUL-2020	174524860001	168	OPEN
169	1	KANO MM WAY BRANCH	1312590	OWEN	10.00	20-MAY-2022	DORMANT ACCOUNT	CURRENT	20-APR-2021	\N	22512892824169	OPEN
170	1	KANO MM WAY BRANCH	193765	WILEY	39.25	07-MAR-2022	DORMANT ACCOUNT	CURRENT	15-JUL-2020	\N	22331165088170	OPEN
171	1	HEAD OFFICE	193923	ANTON	50.00	08-DEC-2021	DORMANT ACCOUNT	CURRENT	15-JUL-2020	10825017-0001	171	OPEN
172	1	HEAD OFFICE	194731	MORRIS	58.25	12-JAN-2022	DORMANT ACCOUNT	CURRENT	16-JUL-2020	\N	22234918115172	OPEN
173	1	HEAD OFFICE	831894	MANUEL	1.00	07-MAR-2022	DORMANT ACCOUNT	CURRENT	04-NOV-2020	15472801-0001	173	OPEN
174	1	KANO MM WAY BRANCH	198272	PHILLIP	1481.25	25-FEB-2022	DORMANT ACCOUNT	CURRENT	17-JUL-2020	22431512-0001	174	OPEN
175	1	HEAD OFFICE	1080565	AUGUSTUS	96.00	02-MAR-2022	DORMANT ACCOUNT	CURRENT	14-JAN-2021	\N	22302392840175	OPEN
176	1	KANO MM WAY BRANCH	204212	EMMETT	299312.50	04-AUG-2021	DORMANT ACCOUNT	CURRENT	20-JUL-2020	\N	22260740294176	OPEN
177	1	ABUJA CORPORATE BRANCH	204872	ELI	29441.12	13-SEP-2021	DORMANT ACCOUNT	CURRENT	20-JUL-2020	\N	22231602133177	OPEN
178	1	KANO MM WAY BRANCH	210390	NICHOLAS	6370.03	12-AUG-2022	DORMANT ACCOUNT	CURRENT	22-JUL-2020	19641353-0001	178	OPEN
179	1	HEAD OFFICE	207347	WILSON	100.00	09-FEB-2022	DORMANT ACCOUNT	CURRENT	21-JUL-2020	02050621-0001	179	OPEN
391	1	KANO MM WAY BRANCH	626470	ORIN	5200.00	27-SEP-2021	DORMANT ACCOUNT	CURRENT	24-SEP-2020	\N	22396234200391	OPEN
392	1	KANO MM WAY BRANCH	626755	ADDISON	2034.72	14-MAR-2022	DORMANT ACCOUNT	CURRENT	24-SEP-2020	\N	22187183622392	OPEN
393	1	ABUJA CORPORATE BRANCH	642146	CAL	503.12	25-OCT-2021	DORMANT ACCOUNT	CURRENT	28-SEP-2020	\N	22143710814393	OPEN
394	1	KANO MM WAY BRANCH	633579	ERASTUS	2000.00	29-SEP-2021	DORMANT ACCOUNT	CURRENT	25-SEP-2020	\N	22230442282394	OPEN
395	1	SOKOTO BRANCH	649561	FRANCISCO	24.61	01-JUN-2022	DORMANT ACCOUNT	CURRENT	29-SEP-2020	23316242-0001	395	OPEN
396	1	KANO MM WAY BRANCH	647127	HARDY	41435.00	06-OCT-2021	DORMANT ACCOUNT	CURRENT	29-SEP-2020	23474165-0001	396	OPEN
397	1	KANO MM WAY BRANCH	648564	LUCIEN	822.50	01-NOV-2021	DORMANT ACCOUNT	CURRENT	29-SEP-2020	\N	22402323352397	OPEN
398	1	HEAD OFFICE	651067	RANDOLPH	2385.62	16-MAR-2022	DORMANT ACCOUNT	CURRENT	29-SEP-2020	\N	22317173534398	OPEN
399	1	HEAD OFFICE	656897	STEWART	102.00	24-DEC-2021	DORMANT ACCOUNT	CURRENT	30-SEP-2020	\N	22418641811399	OPEN
400	1	HEAD OFFICE	657124	VERN	438.30	03-AUG-2022	DORMANT ACCOUNT	CURRENT	30-SEP-2020	22889929-0001	400	OPEN
401	1	HEAD OFFICE	657533	WILMER	409.00	01-FEB-2022	DORMANT ACCOUNT	CURRENT	30-SEP-2020	\N	22531816669401	OPEN
402	1	SOKOTO BRANCH	665127	ZACK	1585.00	17-NOV-2021	DORMANT ACCOUNT	CURRENT	02-OCT-2020	20608693-0001	402	OPEN
403	1	ABUJA CORPORATE BRANCH	859588	ADRIAN	50.00	11-APR-2022	DORMANT ACCOUNT	CURRENT	10-NOV-2020	\N	22252675183403	OPEN
404	1	HEAD OFFICE	666973	ALVAH	1996.00	01-NOV-2021	DORMANT ACCOUNT	CURRENT	02-OCT-2020	\N	22217638406404	OPEN
405	1	KANO MM WAY BRANCH	679201	BERTRAM	10000.00	20-OCT-2021	DORMANT ACCOUNT	CURRENT	05-OCT-2020	\N	22190382348405	OPEN
406	1	HEAD OFFICE	678194	CLAY	243.75	29-NOV-2021	DORMANT ACCOUNT	CURRENT	05-OCT-2020	\N	22426239685406	OPEN
407	1	SOKOTO BRANCH	679139	EPHRAIM	31921.31	28-JAN-2022	DORMANT ACCOUNT	CURRENT	05-OCT-2020	N\\\\\\\\A	407	OPEN
408	1	ABUJA CORPORATE BRANCH	681329	FRITZ	1000.00	06-OCT-2021	DORMANT ACCOUNT	CURRENT	05-OCT-2020	24142476-0001.	408	OPEN
409	1	HEAD OFFICE	683763	GILES	2300.00	03-NOV-2021	DORMANT ACCOUNT	CURRENT	06-OCT-2020	\N	22581079262409	OPEN
410	1	ABUJA CORPORATE BRANCH	685798	GROVER	20.17	01-SEP-2022	DORMANT ACCOUNT	CURRENT	06-OCT-2020	05068656-0001	410	OPEN
411	1	KANO MM WAY BRANCH	691508	HARRIS	25.00	13-DEC-2021	DORMANT ACCOUNT	CURRENT	07-OCT-2020	\N	22286946414411	OPEN
412	1	SOKOTO BRANCH	693351	ISOM	338.24	02-MAR-2022	DORMANT ACCOUNT	CURRENT	07-OCT-2020	24036624-0001	412	OPEN
\.


--
-- Data for Name: am_internal_accounts; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.am_internal_accounts (id, gl_code, gl_name) FROM stdin;
325	205007	PENSION-PAYABLE               
326	205008	P.A.Y.E PAYABLE               
327	205009	I T F PAYABLE                 
328	205010	WITHHOLDING TAX- STATE        
329	205011	Retention Money ISTISNA       
330	205012	Tanadi Payable                
331	205013	E-Transact Fee Payable        
332	205014	SUNDRY CREDITOR               
333	205015	VENDORS CONTROL ACCOUNT       
334	205016	PROFIT PAYABLE                
335	205017	SUNDRY DEPOSITS               
336	205018	CYBER SECURITY PAYABLE        
337	205019	LEGAL PERFECTION FEES ACCT    
338	205020	LEGAL SEARCH FEES ACCT        
339	205021	MUSHARAKAH SUKUK PROCEED      
340	205550	ACC AMORT OF RETAIL LEASE     
341	205551	ACC AMORT OF CORP LEASE       
342	206001	Deposit For Shares            
343	206002	DEMO DEPOSIT FOR SHARES        
344	206201	INSTANCE VERVE CARD SUSPENSE  
345	207001	Due to Charity                
346	207002	PENALTY ACCOUNT               
347	207022	IJARAH MNT CBN CACS PEN ACC   
348	207100	INTERBRANCH ACCOUNT           
349	207101	MOVEMENT ACCOUNT              
350	207111	IJARAH MNT CBN CACS HOLDING AC
351	207501	ACCRUED IT EXPENSE            
352	207502	ACCRUED DIRECTOR EXPENSE      
353	207503	ACCRUED ADVERT EXPENSE        
354	207504	ACCRUED SUBSCRIPTION EXPENSE  
355	207505	ACCRUED STAFF EXPENSE         
356	207506	ACCRUED TREASURY EXPENSE      
357	207507	ACCRUED ACE EXPENSE           
358	207508	ACCRUED OTHER EXPENSE         
359	208001	Proft Pay-Ordinary            
360	208002	Profit Pay-Corp               
361	208003	Profit Pay-Children           
362	208004	Profit Payable Mudaraba Time  
363	208101	IJARAH MUNT BTLK CBN CACS     
364	208102	IJARAH OF SERVICES CBN CACS   
365	208103	ISTISNA - CBN CACS            
366	208104	MURABAHA (ASSET FIN) CBN CACS 
367	208111	IJARAH MNT CBN CACS HOLDING AC
368	208112	IJARAH OF SERV CBN CACS PROFIT
369	208113	ISTISNA - CBN CACA PROFIT ACC 
370	208114	MURABAHA CBN CACS PROFIT ACC  
371	209001	MURABABAH DEF PROFIT          
372	209002	Murabaha Def Pft Ret          
373	209003	Murabaha Def Pft-Cor          
374	209004	IJARAH DEFFER INCOME          
375	209005	MURABAHA DEFER MONTHLY        
376	209006	MURABAHA DEFER YEARLY         
377	209007	MURABAHA HOME DEFER MONTHLY   
378	209008	MURABAHA HOME DEFER YEARLY    
379	209009	Murabaha Def Pft Yr           
380	209010	Mur Def Pft Yr Staff          
381	209011	Mur SME Def Prf Yrly          
382	209012	RETAIL ISTISNA CORP DEFER MONT
383	209013	RETAIL ISTISNA CORP DEFER YEAR
384	209014	IJARAH OF SERV DEFER MONTHLY  
385	209015	IJARAH OF SERVICE DEFER YEARLY
386	209016	BAI-MUAJJAL DEFER MONTHLY     
387	209017	BAI-MUAJJAL DEFER YEARLY      
388	209018	NQR PAYABLE ACCOUNT           
389	209020	PROFIT EQUALIZATION RESERVE   
390	209021	INVESTMENT RISK RESERVE       
391	209030	IJARAH MNT CBN CACS DEF MONTHL
392	209031	IJARAH MNT CBN CACS DEF YRLY  
393	209032	IJARAH OF SERV -CACS DEF MNTLY
394	209033	IJARAH OF SER- CBN CACS DEF YR
395	209034	ISTISNA - CBN CACS DEF MNTLY  
396	209035	ISTISNA - CBN CACS DEF YRLY   
397	209036	MURABAHA (ASSET FIN) -CBN CACS
398	209037	MURABAHA CBN CACS DEF YRLY    
399	209050	FX SOLD INCOME HOLDING ACCT   
400	209051	NGN TREASURY TRADING INCOME   
401	209099	ATM OVERAGE                   
402	209101	ATM WITHDRAWAL PAYABLE ACCOUNT
403	209102	ATM WITHD PAYABLE FEES ACCT   
404	209103	ATM RECHARGE PAYABLE ACCT     
405	209104	ATM RECHARGE PAY FEES ACCT    
406	209105	ATM BILL PAY PAYABLE ACCOUNT  
407	209106	ATM BILL PAYABLE FEES ACCT    
408	209107	ATM TRANSFER PAYABLE ACCT     
409	209108	ATM TRANSFER PAY FEES ACCT    
410	209109	POS GOODS & SERVICE PAYABLE   
411	209110	POS GDS & SERVICE PAYABLE FEES
412	209111	CMS HOLDING SUSPENSE ACCT     
413	209112	MOBILE WALLET SUSPENSE ACCT   
414	209115	CBN FX BID ACCOUNT            
415	209116	GBP FOREIGN TRADE ACCT        
416	209117	EURO FOREIGN TRADE ACCT       
417	209201	Pay Direct Till Acc           
418	209202	POS TRSF SUSP                 
419	209203	ATM OFF US PAYABLE            
420	209204	Remita Income Susp.           
421	209205	ATM Trsf Susp                 
422	209206	NIBSS EBILLS FEES ACCT HOLD   
423	209207	Clearing Diff Susp            
424	209208	NEFT Outward A/C              
425	209209	UNCLAIMED NEFT                
426	209210	General Suspense              
427	209211	Interbranch Accounts sales    
428	209212	Interbranch withdrawal        
429	209213	Forex Income                  
430	209214	SALARY SUSPENSE               
431	209215	Staff Welfare Suspense        
432	209216	MGR CHEQUE SUSPENSE           
433	209217	PROCEED ON DISPOSAL OF ASSET  
434	209218	UNCLAIMED SUSPENSE ACCOUNT    
435	209219	BRANCH SUSPENSE ACCOUNT-CREDIT
436	209220	INTERNAL CHEQUE ACCOUNT       
437	209221	NIP INCOME SPLITTING ACCT     
438	209222	USSD RECHARGE SPLITTING ACCT  
439	209223	WEB PAYMENT SPLITTING ACCT    
440	209224	CLEARING - UNPAID CHEQUES     
441	209225	SUSPENSE-TRANSIT ACCT         
442	209226	SUSPENSE- SEARCH REPORT       
443	209227	CASH OVEARGE                  
444	209228	DEMOMALL VENDOR SUSPENSE       
445	209229	DEMOMALL OPERATING ACCOUNT     
446	209230	AGENCY B INCOME SPLITTING ACCT
447	209231	PROFIT DISTRIBUTION ACCT      
448	209232	USSD BAL ENQ INCOME ACCT      
449	209233	DEMOMALL CUSTOMER REFUND ACCOUN
450	209234	SMS ALERT HOLDING ACCOUNT     
451	209235	CARD MAINTENANCE CHARGE       
452	209238	AGENT CARD HOLDING ACCT       
453	209240	USSD SESSION CHARGE HOLDING AC
454	209241	NAPS NIBSS CHARGE             
455	209500	GENERAL PROVISION             
456	209501	MURABAHA IMPAIRMENT           
457	209502	IJARAH IMPAIRMENT             
458	209503	ISTISNA IMPAIRMENT            
459	209504	SALAM IMPAIRMENT              
460	209510	IMPAIRMENT ON OFF-BALANCE SHEE
461	209512	PROVISION FOR TAXATION        
462	209601	TAX PAYABLE                   
463	301001	General Provision             
464	301002	Specific Provision            
465	301101	Provision For Taxation        
466	301202	PROV FOR MUDARABA TERM PAYABLE
467	301203	PROFIT PROVISION MUSHARAKA    
468	301204	THEORICAL PROFIT ACCT MUSHARAK
469	302001	Ord. Share Cap.               
470	302002	SHARE PREM                    
471	303001	RISK REG RESERVE              
472	303002	Retained Earnings             
473	303003	AGSMEIS RESERVE ACCT          
474	303004	Statutory Reserve             
475	303005	PROFIT EQUALIZATION RESERVE   
476	303006	AGSMEIS RESERVE               
477	323900	DEMO CLIENT PROV MONTHLY INVES 
478	401001	PROFIT ON MURAHABA RETAIL     
479	401002	Murabaha Retail               
480	401003	MURABAHA PROFIT-CORP          
481	401004	Murabaha Profit-staf          
482	401005	Murabaha Business             
149	103312	INVENTORY ACCRUAL ACCOUNT     
150	103401	WIP-Software                  
151	103402	WIP-STOCK & CONSUMABLE        
152	103403	Asset in Transit              
7	101201	ATM TILL CASH ACCT            
8	101202	ATM Deposit Cash              
9	101301	CASH IN TRNSIT                
10	101302	CASH IN HAND                  
11	101303	CASH CENTER COLLECTION ACCT   
12	101351	E-NAIRA SUSPENSE ACCT         
13	101401	CBN MAIN ACCOUNT              
14	101402	Cash Res. Req.                
15	101403	CBN CLEARING-FCMB             
16	101404	CBN NIP-FCMB                  
17	101405	FCMB ISW SVA CARD ACCT        
18	101406	FCMB CLEARING SETTLEMENT ACCT 
19	101408	CBN FX BID ACCOUNT            
20	101409	FCMB NIG GBP-DOM              
21	101410	FCMB NIG EUR -DOM             
22	101501	FCMB- UK (USD)                
23	101502	FIRST BANK PLC- UK            
24	101503	UNITED BANK AFRICA (USD)      
25	101504	ZENITH BANK UK                
26	101505	FCMB UK (GBP)                 
27	101506	FCMB UK(EUR)                  
28	101507	FCMB NIG GBP-DOM              
29	101508	FCMB NIG EUR -DOM             
30	101510	FIRST BANK NIG                
31	101511	FCMB NIG-OPERATING ACCT       
32	101512	FCMB NIG-DOM                  
33	101513	GTBANK                        
34	101514	ZENITH BANK MIRROR ACCOUNT    
35	101515	ZENITH BANK OPERATING ACCT    
36	101516	ZENITH BANK 2                 
37	101517	FIDELITY BANK                 
38	101518	ZENITH DOMICILIARY            
39	101519	FIDELITY BANK DOMICILIARY     
40	101520	UBA EXPORT DOMICILIARY        
41	101522	UBA MAIN OPERATING ACCOUNT\tGBP
42	101523	PQR RECEIVABLE ACC            
43	101524	AFREXIMBANK  NOSTRO ACC       
44	101525	AFREXIM BANK  CASH COLLATERAL 
45	101601	Sukuks                        
46	101602	CBN-PROMISORY NOTE            
47	101603	SUKUK TRADING ACCT            
48	101604	INTERBANK MUDARABAH           
49	101605	SUKUK OTHERS                  
50	101609	LEARNING CURVE                
51	101610	LEARNING CURVE                
52	101611	LEARNING EFFECTS              
53	101612	LEARNING CURVE                
54	101620	SUKUK TRADING ACCT            
55	101621	CBN-PROMISORY NOTE            
56	101650	INTERBANK MUDARABAH F         
57	101651	INTERBANK MUDAR (NON SHARIAH) 
58	101653	INTERBANK WAKALA              
59	101654	WAKALAH BILISTITHMAR PRNCIPAL 
60	101655	WAKALA BILISTITHMAR ACCR PRFIT
61	101678	GBP FOREIGN TRADE ACCT        
62	101679	EURO FOREIGN TRADE ACCT.      
63	101680	FX TRADING ACCOUNT            
64	101681	FX DEALERSHIP LICENCE         
65	101701	MURABAH RETAIL FINANCE        
66	101702	MURABAH-NON SHARIAH           
67	102401	Land Freehold                 
68	102402	Building Freehold             
69	102403	Equipments Office             
70	102404	Fur. and Fix. Office          
71	102405	Computer Hardware             
72	102406	MOTOR VEHICLES                
73	102407	OTHER DEPRECIABLE ASSET       
74	102408	RESIDENTIAL FIXED ASSET       
75	102502	Acc.Dep.Build.Freeho          
76	102503	Acc.Dep Equip.Office          
77	102504	Acc.Dep Fur. Fix Off          
78	102505	ACC.DEP COMPUTER HARDWARE     
79	102506	Acc.Dep.Mot.Veh off           
80	102507	ACC.DEP- OTHER DEPRECIABLE ASS
81	102508	ACC DEP: RESIDENTIAL F ASSET  
82	102510	Acc.Dep Leaseh.Imprv          
83	102511	Acc. Dep Computer(S)          
84	102601	LEASEHOLD IMPRMENT            
85	102602	LEASEHOLD IPMROVEMENT- BRANCH 
86	102603	LAGOS - LEASEHOLD IMPROVEMENT 
87	102701	Computer Software             
88	102702	LAGOS - LEASEHOLD IMPROVEMENT 
89	103001	ATM RECEIVABLE                
90	103002	AUTO PAY SETTLEMENT           
91	103003	Direct debit/Standing Order   
92	103004	ATM WITHDRAWAL RECEIVABLE ACCT
93	103005	ATM TRANSFER RECEIVABLE ACCT  
94	103006	CLEARING CENTRAL SETTLEMENT   
95	103007	ATM SHORTAGE                  
96	103008	NAPS CBN SETTLEMENT ACCOUNT   
97	103009	CORPORATEPAY TSS ACCOUNT      
98	103010	ETRANZACT RECEIVABLE          
99	103101	Clearing Suspense             
100	103102	CHQ INWARD  ACCOUNT           
101	103103	Clearing  Sttlmt A/C          
102	103104	Consolidatd Clearing          
103	103105	Outward Clearing Sus          
104	103106	General collection for Cheques
105	103107	REMITA RECEIVABLE CBN         
106	103108	Naps Settlement Rec.          
107	103109	Currency Equivalent Account   
108	103110	Loss on revaluation of Forex  
109	103111	Foreign Currency Purchase not 
110	103112	NAIRA CURRENCY PURCHASE NOT   
111	103113	Round up debit                
112	103114	PAY DIRECT SETTLEMENT         
113	103115	Remita Settlement susp        
114	103116	INTERSWITCH TSS ACCT          
115	103117	INTERBRANCH CLEARING ACCOUNT  
116	103118	NIBSS VALUE ADDED SERVICES    
117	103119	INTER-BRANCH CLEARING CHQ     
118	103120	RETURN INWARD ACCOUNT         
119	103121	E-BANKING SETTELEMENT ACCOUNT 
120	103122	NEFT INWARD ACCOUNT           
121	103123	NEFT RETURN OUTWARD           
122	103124	CHQ RETURN INWARD ACCT        
123	103125	DEMO MALL RECEIVABLE           
124	103126	CBN ISW FCMB                  
125	103127	RECEIVABLE ACCT               
126	103128	NGN TRADING SETTLEMENT ACCT   
127	103130	MERCHANT INSTANT POS RECIEVAB 
128	103131	QUICK TELLER RECHARGE ACCT    
129	103132	QUICK TELLER BILLS PAYMENT    
130	103133	ISW SETTLEMENT ACCOUNT        
131	103134	NAPS PAYABLE ACCOUNT          
132	103135	DEMOXPRESS BILLS PAYMENT       
133	103201	Cash Shortage                 
134	103202	Cash error position           
135	103203	RTGS RECEIVABLE ACCT          
136	103204	TSS INTERSWITCH ACCT          
137	103205	CASH HOLDING SUSPENSE         
138	103301	Accrual:Ijar wa Iq R          
139	103302	Accrual:Ijar wa Iq C          
140	103303	ACCR-IJARA SERVICE PROFIT     
141	103304	Accr: Ijar fin-Corp           
142	103305	Ijara Hme Fin Psn Ac          
143	103306	Accr. Ijarah                  
144	103307	ACCRUAL INVENTORY             
145	103308	Accrual Murabaha              
146	103309	Accrual istisnaa              
147	103310	RETAIL ACCR-IJARAH MUNT BITTAM
148	103311	CORP ACCR-IJARAH MUNT BITTAM  
305	204507	FGN SUKUK ISSUE COLLECTION ACT
306	204508	FACILITY COLLECTION ACCOUNT   
307	204509	COLLECTIONS- CUSTOMERS        
308	204510	FACILITY CENTRAL COLLECTION   
309	204511	FCMB UK CONFIRMATION LINE     
310	204512	ZENITH CONFIRMATION LINE ACCT 
311	204513	ZENITH CONFIRMATION LINE LC   
312	204514	CAPITALTRUST HALAL FIXED INC  
313	204515	CUSTOM COT COLLECTION ACCOUNT 
314	204517	PAYARENA COLLECTION ACCOUNT   
315	204518	E-NAIRA BRANCH SUSP ACCT      
316	204519	E-NAIRA CHANNELS SUSP ACCT    
317	204520	WAREHOUSE COST PAYABLE        
318	204521	NATIONAL COLLAT. REGISTRY(NCR)
319	205001	VENDORS PAYABLE               
320	205002	NDIC Insurance Payable        
321	205003	Withholding Tax- FG           
322	205004	STAMP DUTY-PAYABLE            
323	205005	VAT Payable                   
324	205006	NHF Payable                   
153	103404	DISPOSAL OF FIXED ASSET       
154	103405	WIP- FIXED ASSET              
155	103501	Interbranch Accounts          
156	103502	FT INTER-BRANCH CHQ           
157	103503	Currency Position Accts       
158	103504	Foreign Exchange Position Acct
159	103506	Suspense Forex Sale           
160	103507	General Suspense Account      
161	103508	Currency Adjustment Account   
162	103509	LOSS ON REVALUATION OF F.ASSET
163	103510	FOREIGN EXCHANGE SITUATION ACC
164	103511	BRANCH SUSPENSE ACCOUNT DEBIT 
165	103512	COUNTER VALUE FOR FOREX       
166	103601	Sundry Debtors                
167	103602	Salary Advance                
168	103603	NIP Receivable Acc            
169	103604	Cash Advance                  
170	103605	ATM SUSP. ACC BRNCH           
171	103606	Share Issues Expense          
172	103607	E-Transact Receivable Account 
173	103608	E-transact Fee Receivable     
174	103609	POS MERCHANT RECEIVABLE       
175	103610	WEB RECEIVABLE                
176	103611	UNPAID CHARGES                
177	103612	QUICK TELLER RECEIVABLE       
178	103613	SUKUK- ACCRUED RENTAL         
179	103614	PREMIUM ON SUKUK              
180	103615	INTER-BANK RECEIVABLE         
181	103616	MOBILE WALLET SUSPENSE ACCT   
182	103617	WAKALA BILISTITHMAR ACCR PRFIT
183	103620	QUICKTELLER RECHARGE ACCT     
184	103701	PREPAID - SOFTWARE            
185	103702	Prepaid Rent                  
186	103703	Prepaid Licence               
187	103704	Prepaid Other                 
188	103705	Prepaid Advet.and Pub         
189	103706	PREPAID IT EXP A/C            
190	103707	Prepaid Insurance             
191	103708	STATUS CAR- PREPAID           
192	103709	PREPAID HOUSING ALLOWANCE     
193	103710	PREPAID FURNITURE ALLOWANCE   
194	103711	PREPAID ADVERT & MARKETING COS
195	103712	PROMOTIONAL COSTS             
196	103713	MUSHARAKA SUKUK EXPENDITURE   
197	103801	CORP CHEQUE STOCK             
198	103802	INDIVIDUAL CHQ STOCK          
199	103803	M C STOCK                     
200	103804	INVENTORY- ATM STOCK          
201	103805	INVENTORY- OTHERS             
202	103806	INVEN - STOCK TOKEN           
203	103807	INVENTORY- FIXED ASSET        
204	103808	REGULAR VERVE CARD            
205	103809	TOKEN STOCK                   
206	103810	AGENT INSTANT CARD STOCK ACCT 
207	103812	AGENT INSTANT CARD STOCK ACCT 
208	103901	BRANCH DEV. EXP.              
209	103902	FRAUD AND FORGERY ASSETS      
210	104001	Sukuk Prf Receivable          
211	104002	Invesment Rental Rec          
212	104003	Bia Mujjal Receivabl          
213	104004	Tanadi Receivable             
214	104101	Deferred Tax Asset            
215	104102	Deferred Accounts             
216	104103	PROFIT/LOSS HOLDING ACCOUNT   
217	105001	VENDORS PAYABLE               
218	107101	MOVEMENT ACC                  
219	203021	RTGS RECEIVABLE ACCT          
220	203101	MUDARABAH TERM DEPOSIT ACCOUNT
221	203901	INVESTMENT ACCOUNT            
222	204002	ACRRUED AUDIT FEES            
223	204003	LC CONFIRMATION LINE          
224	204004	OTHER PAYABLE                 
225	204005	POS PAYABLE ACCOUNT           
226	204006	Swift Cost Charge             
227	204007	General Profit Distribution   
228	204008	QUICK  TELLER TRN.            
229	204009	NEFT PAYABLE                  
230	204010	RTGS Payable                  
231	204011	CREDIT BUREAU PAYABLE         
232	204012	NIP SETTLEMENT ACCOUNT        
233	204013	NIP Payable Comm.             
234	204014	DUD CHQ- CREDIT BUREAU PAYABLE
235	204015	NAPS PAYABLE ACCOUNT          
236	204016	ACCRUED DIRECTORS EXPENSES    
237	204017	Round up credit               
238	204018	E-Transact Payable            
239	204019	INTERBRANCH ACCOUNT           
240	204020	MANAGERS CHEQUE PAYABLE       
241	204021	WEB PAYABLE                   
242	204022	NIBSS PAYABLE                 
243	204023	OATEK USSD RECHARGE PAYABLE   
244	204024	OATEK USSD RECHARGE COMM PAYAB
245	204025	OATEK BILLS PAYABLE ACCOUNT   
246	204026	OATEK BILLS COMMSION PAYABLE  
247	204027	INTERSWITCH ATM PAYABLE       
248	204028	INTERSWITCH ATM FEE PAYABLE   
249	204029	INTERSWITCH POS PAYABLE       
250	204030	POS FEES SUSPENSE ACCT        
251	204031	INTERSWITCH WEB PAYABLE       
252	204032	INTERSWITCH WEB FEE PAYABLE   
253	204033	NIBSS DEVELOPMENT FUND ACCT   
254	204034	MANAGERS CHEQUE (MC)          
255	204035	RETURN OUTWARD ACCOUNT        
256	204036	NEFT RETURN OUTWARD           
257	204037	CHQ OUTWARD ACCOUNT           
258	204038	RTGS OUTWARD ACCOUNT          
259	204039	TSS INTERSITCH ACCT           
260	204040	ISW SETTLEMENT ACCOUNT        
261	204041	DEMOMALL PAYABLE ACCOUNT       
262	204042	REMITA TRANSIT ACCOUNT        
263	204043	REMITA FUNDS HOLDING          
264	204044	QUICKTELLER RECHARGE          
265	204045	QUICKTELLER BILLS PAYMENT     
266	204046	AGENT TRANSACTION COMM. ACCT  
267	204047	CBN FORM NXP MAINTENANCE ACCT 
268	204048	CBN FORM NCX MAINTENANCE ACCOU
269	204049	CBN FORM A MAINTENANCE ACCOUNT
270	204050	FORM M COMMISSION ACCOUNT     
271	204051	SUSPENSE SYSTEM ERROR         
272	204052	MC TRANSIT ACCT               
273	204053	EBILLS TILL ACCOUNT           
274	204054	EBILLSPAY PAYABLE ACCT        
275	204055	UNEARNED INCOME               
276	204056	AGENT BANKING POS HOLDING ACC 
277	204057	FX SUSPENSES ACCOUNT          
278	204058	DEMO FOREIGN TRADE ACCT        
279	204059	OVERSEAS CHARGES RECOVERABLE A
280	204060	FORM A COST RECOVERABLE ACCT  
281	204061	E-BANKING SETTLEMENT          
282	204062	AGENT BANKING POS ACCT        
283	204063	NQR PAYABLE ACCOUNT           
284	204064	AGENCY BANKING VAS SUSPENSE AC
285	204065	DEMOXPRESS VAS FEE HOLDING ACC 
286	204066	BULK INT-BANK TRF SUSPENSE ACC
287	204069	PAYARENA SETTLEMENT ACCOUNT   
288	204070	ERP INTERBRANCH ACCT          
289	204071	CHEQUE CONTROL ACCOUNT        
290	204072	CHEQUE CONTROL ACCOUNT        
291	204073	PTA/BTA CONTROL ACCT          
292	204074	AGENT INSTANT CARD HOLDING ACC
293	204075	CORPORATE PAY HOLDING ACCT    
294	204076	TSS PAYABLE ACCOUNT           
295	204080	ATM CARD MAINTE. HOLDING ACCT 
296	204096	STALE MC SUSPENSE             
297	204097	ATM SETTLEMENT ACCOUNT        
298	204104	MURABAHA CBN CACS FUNDING ACC 
299	204501	COLLECTION FIRS               
300	204502	COLLECTION STATE              
301	204503	CUSTOM DUTY ACCOUNT           
302	204504	REMITA SETTLEMENT ACCT        
303	204505	DEMO MALL ACCOUNT              
304	204506	SUKUK PROCEED ACCOUNTS        
483	401006	PROFIT MURABAHA HOME          
484	401007	PROFIT-CORP MURABAH HOME      
485	401009	Profit account for ISTISNAA S 
486	401010	RETAIL MURABAHA PROFIT        
487	401011	MURABAH CORP PROFIT           
488	402001	PROFIT-IJARA SERVICE          
489	402002	Ijar wa Iqtina prf R          
490	402003	Profit on Mudaraba Time Deposi
491	402004	PROFIT-IJARAH OF SERVICE      
492	402005	PROFIT-RETAIL IJARAH OF SERVIC
493	402006	PROFIT (POS) RETAIL IJARAH SER
494	402007	Profit on Ijarah Hom and Asset
495	402008	Profit on Saving-Mudrab       
496	402009	Profit Istisnaa               
497	402010	PROFIT-RETAIL  ISTISNA PROFIT 
498	402011	Profit on Bank Capital        
499	402012	Profit on Current Account     
500	402013	BAI-MUAJJAL                   
501	402014	PROFIT ON BAI-MUAJJAL         
502	402020	RETAIL-IJARAH MUNT BITTAMLEEK 
503	402021	CORP-IJARAH MUNT BITTAMLEEK   
504	402501	Processing fees on Murabaha   
505	402502	Management Fees on Murabaha   
506	402503	Processing fees on Murabaha bu
\.


--
-- Data for Name: am_ledger; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.am_ledger (branch_code, gl_code_id, gl_code, category_id, "NAME", currency_name, created_at, last_updated) FROM stdin;
10	303	303004	4	TILL 02 USD 303	USD	2021-12-06	
10	304	304004	4	TILL 03 USD 304	USD	2021-12-06	
15	150	150004	4	ATM 150	NGN	2022-06-21	
2	198	198004	4	CASH CENTER HT 198 NGN 198	NGN	2021-06-08	
2	197	197004	4	CASH CENTER HT 197 NGN 197	NGN	2021-06-08	
2	5	5004	4	CASH CENTER TILL 05 NGN 005	NGN	2021-10-26	
2	196	196004	4	CASH CENTER HT 196 NGN 196	NGN	2021-10-26	
2	155	155004	4	ATM 155	NGN	2021-10-26	
7	153	153004	4	ATM 153	NGN	2021-12-15	
7	100	100004	4	BRANCH VAULT NGN 100	NGN	2020-11-25	
7	101	101004	4	HEAD TELLER 101  NGN	NGN	2020-11-25	
7	102	102004	4	TILL 01 102 NGN	NGN	2020-11-25	
7	103	103004	4	TILL 02 NGN 103	NGN	2020-11-25	
7	104	104004	4	TILL 03 NGN 104	NGN	2020-11-25	
7	105	105004	4	TILL 04 NGN 105	NGN	2020-11-25	
7	106	106004	4	TILL 05 NGN 106	NGN	2020-11-25	
7	150	150004	4	ATM 150	NGN	2020-11-25	
7	151	151004	4	ATM 151	NGN	2020-11-25	
7	152	152004	4	ATM 152	NGN	2020-11-25	
7	200	200004	4	BRANCH VAULT EUR 200	EUR	2020-11-25	
7	201	201004	4	HEAD TELLER EUR 201	EUR	2020-11-25	
7	202	202004	4	TILL 01 EUR 202	EUR	2020-11-25	
2	177	177004	4	ATM ALARDA 177	SDG	2018-08-26	
1	100	100004	4	BRANCH VAULT NGN 100	NGN	2018-09-10	10-SEP-2018
1	101	101004	4	HEAD TELLER 101  NGN	NGN	2018-09-10	10-SEP-2018
1	102	102004	4	TILL 01 102 NGN	NGN	2018-09-10	
1	103	103004	4	TILL 02 NGN 103	NGN	2018-09-10	
1	104	104004	4	TILL 03 NGN 104	NGN	2018-09-10	
1	105	105004	4	TILL 04 NGN 105	NGN	2018-09-10	
1	106	106004	4	TILL 05 NGN 106	NGN	2018-09-10	
1	200	200004	4	BRANCH VAULT EUR 200	EUR	2018-09-10	
1	201	201004	4	HEAD TELLER EUR 201	EUR	2018-09-10	10-SEP-2018
1	202	202004	4	TILL 01 EUR 202	EUR	2018-09-10	
1	203	203004	4	TILL 02 EUR 203	EUR	2018-09-10	
1	204	204004	4	TILL 03 EUR 204	EUR	2018-09-10	
1	205	205004	4	ORDINARY TELLER EUR 205	EUR	2018-09-10	
1	206	206004	4	ORDINARY TELLER EUR 206	EUR	2018-09-10	
1	300	300004	4	BRANCH VAULT 300 USD	USD	2018-09-10	10-SEP-2018
1	301	301004	4	HEAD TELLER USD 301	USD	2018-09-10	10-SEP-2018
1	302	302004	4	TILL 01 USD 302	USD	2018-09-10	
1	303	303004	4	TILL 02 USD 303	USD	2018-09-10	
1	304	304004	4	TILL 03 USD 304	USD	2018-09-10	
1	400	400004	4	BRANCH VAULT GBP 400	GBP	2018-09-10	
1	401	401004	4	HEAD TELLER GBP 401	GBP	2018-09-10	10-SEP-2018
1	402	402004	4	TILL 01 GBP 402	GBP	2018-09-10	
1	403	403004	4	TILL 02 GBP 403	GBP	2018-09-10	
1	404	404004	4	TILL 03 GBP 404	GBP	2018-09-10	
3	100	100004	4	BRANCH VAULT NGN 100	NGN	2018-09-10	10-SEP-2018
3	101	101004	4	HEAD TELLER 101  NGN	NGN	2018-09-10	10-SEP-2018
3	102	102004	4	TILL 01 102 NGN	NGN	2018-09-10	
3	103	103004	4	TILL 02 NGN 103	NGN	2018-09-10	
3	104	104004	4	TILL 03 NGN 104	NGN	2018-09-10	
3	105	105004	4	TILL 04 NGN 105	NGN	2018-09-10	
3	106	106004	4	TILL 05 NGN 106	NGN	2018-09-10	
3	200	200004	4	BRANCH VAULT EUR 200	EUR	2018-09-10	10-SEP-2018
3	201	201004	4	HEAD TELLER EUR 201	EUR	2018-09-10	10-SEP-2018
3	202	202004	4	TILL 01 EUR 202	EUR	2018-09-10	
3	203	203004	4	TILL 02 EUR 203	EUR	2018-09-10	
3	204	204004	4	TILL 03 EUR 204	EUR	2018-09-10	
3	205	205004	4	ORDINARY TELLER EUR 205	EUR	2018-09-10	
3	206	206004	4	ORDINARY TELLER EUR 206	EUR	2018-09-10	
3	300	300004	4	BRANCH VAULT 300 USD	USD	2018-09-10	10-SEP-2018
3	301	301004	4	HEAD TELLER USD 301	USD	2018-09-10	10-SEP-2018
3	302	302004	4	TILL 01 USD 302	USD	2018-09-10	
3	303	303004	4	TILL 02 USD 303	USD	2018-09-10	
3	304	304004	4	TILL 03 USD 304	USD	2018-09-10	
3	400	400004	4	BRANCH VAULT GBP 400	GBP	2018-09-10	10-SEP-2018
3	401	401004	4	HEAD TELLER GBP 401	GBP	2018-09-10	10-SEP-2018
3	402	402004	4	TILL 01 GBP 402	GBP	2018-09-10	
3	403	403004	4	TILL 02 GBP 403	GBP	2018-09-10	
3	404	404004	4	TILL 03 GBP 404	GBP	2018-09-10	
2	107	107004	4	TILL 06 NGN 107	NGN	2019-04-15	
1	150	150004	4	ATM 150	NGN	2016-02-04	16-APR-2019
1	151	151004	4	ATM 151	NGN	2016-02-04	16-APR-2019
1	152	152004	4	ATM 152	NGN	2016-02-04	16-APR-2019
7	203	203004	4	TILL 02 EUR 203	EUR	2020-11-25	
7	204	204004	4	TILL 03 EUR 204	EUR	2020-11-25	
7	205	205004	4	ORDINARY TELLER EUR 205	EUR	2020-11-25	
7	206	206004	4	ORDINARY TELLER EUR 206	EUR	2020-11-25	
7	300	300004	4	BRANCH VAULT 300 USD	USD	2020-11-25	
7	301	301004	4	HEAD TELLER USD 301	USD	2020-11-25	
7	302	302004	4	TILL 01 USD 302	USD	2020-11-25	
3	150	150004	4	ATM 150	NGN	2019-12-17	
3	151	151004	4	ATM 151	NGN	2019-12-17	
3	152	152004	4	ATM 152	NGN	2019-12-17	
4	100	100004	4	BRANCH VAULT NGN 100	NGN	2020-01-27	
4	200	200004	4	BRANCH VAULT EUR 200	EUR	2020-01-27	
4	300	300004	4	BRANCH VAULT 300 USD	USD	2020-01-27	
4	400	400004	4	BRANCH VAULT GBP 400	GBP	2020-01-27	
4	101	101004	4	HEAD TELLER 101  NGN	NGN	2020-01-27	
4	102	102004	4	TILL 01 102 NGN	NGN	2020-01-27	
4	201	201004	4	HEAD TELLER EUR 201	EUR	2020-01-27	
4	202	202004	4	TILL 01 EUR 202	EUR	2020-01-27	
4	301	301004	4	HEAD TELLER USD 301	USD	2020-01-27	
4	302	302004	4	TILL 01 USD 302	USD	2020-01-27	
4	401	401004	4	HEAD TELLER GBP 401	GBP	2020-01-27	
4	402	402004	4	TILL 01 GBP 402	GBP	2020-01-27	
8	103	103004	4	TILL 02 NGN 103	NGN	2021-10-14	
8	200	200004	4	BRANCH VAULT EUR 200	EUR	2021-10-14	
8	201	201004	4	HEAD TELLER EUR 201	EUR	2021-10-14	
8	202	202004	4	TILL 01 EUR 202	EUR	2021-10-14	
8	203	203004	4	TILL 02 EUR 203	EUR	2021-10-14	
8	300	300004	4	BRANCH VAULT 300 USD	USD	2021-10-14	
8	301	301004	4	HEAD TELLER USD 301	USD	2021-10-14	
8	302	302004	4	TILL 01 USD 302	USD	2021-10-14	
8	303	303004	4	TILL 02 USD 303	USD	2021-10-14	
9	100	100004	4	BRANCH VAULT NGN 100	NGN	2021-10-14	
9	101	101004	4	HEAD TELLER 101  NGN	NGN	2021-10-14	
9	102	102004	4	TILL 01 102 NGN	NGN	2021-10-14	
9	103	103004	4	TILL 02 NGN 103	NGN	2021-10-14	
9	200	200004	4	BRANCH VAULT EUR 200	EUR	2021-10-14	
9	201	201004	4	HEAD TELLER EUR 201	EUR	2021-10-14	
9	202	202004	4	TILL 01 EUR 202	EUR	2021-10-14	
9	203	203004	4	TILL 02 EUR 203	EUR	2021-10-14	
9	300	300004	4	BRANCH VAULT 300 USD	USD	2021-10-14	
9	301	301004	4	HEAD TELLER USD 301	USD	2021-10-14	
9	302	302004	4	TILL 01 USD 302	USD	2021-10-14	
9	303	303004	4	TILL 02 USD 303	USD	2021-10-14	
7	303	303004	4	TILL 02 USD 303	USD	2020-11-25	
7	304	304004	4	TILL 03 USD 304	USD	2020-11-25	
7	400	400004	4	BRANCH VAULT GBP 400	GBP	2020-11-25	
7	401	401004	4	HEAD TELLER GBP 401	GBP	2020-11-25	
7	402	402004	4	TILL 01 GBP 402	GBP	2020-11-25	
7	403	403004	4	TILL 02 GBP 403	GBP	2020-11-25	
7	404	404004	4	TILL 03 GBP 404	GBP	2020-11-25	
6	100	100004	4	BRANCH VAULT NGN 100	NGN	2020-07-08	
6	101	101004	4	HEAD TELLER 101  NGN	NGN	2020-07-08	
6	102	102004	4	TILL 01 102 NGN	NGN	2020-07-08	
6	150	150004	4	ATM 150	NGN	2020-07-08	
6	200	200004	4	BRANCH VAULT EUR 200	EUR	2020-07-08	
12	302	302004	4	TILL 01 USD 302	USD	2021-12-14	
12	104	104004	4	TILL 03 NGN 104	NGN	2021-12-14	
12	204	204004	4	TILL 03 EUR 204	EUR	2021-12-14	
12	304	304004	4	TILL 03 USD 304	USD	2021-12-14	
12	150	150004	4	ATM 150	NGN	2021-12-14	
12	151	151004	4	ATM 151	NGN	2021-12-14	
12	152	152004	4	ATM 152	NGN	2021-12-14	
13	100	100004	4	BRANCH VAULT NGN 100	NGN	2021-12-14	
13	101	101004	4	HEAD TELLER 101  NGN	NGN	2021-12-14	
13	102	102004	4	TILL 01 102 NGN	NGN	2021-12-14	
13	103	103004	4	TILL 02 NGN 103	NGN	2021-12-14	
13	104	104004	4	TILL 03 NGN 104	NGN	2021-12-14	
13	200	200004	4	BRANCH VAULT EUR 200	EUR	2021-12-14	
13	201	201004	4	HEAD TELLER EUR 201	EUR	2021-12-14	
13	202	202004	4	TILL 01 EUR 202	EUR	2021-12-14	
13	203	203004	4	TILL 02 EUR 203	EUR	2021-12-14	
13	204	204004	4	TILL 03 EUR 204	EUR	2021-12-14	
13	300	300004	4	BRANCH VAULT 300 USD	USD	2021-12-14	
13	301	301004	4	HEAD TELLER USD 301	USD	2021-12-14	
13	302	302004	4	TILL 01 USD 302	USD	2021-12-14	
13	303	303004	4	TILL 02 USD 303	USD	2021-12-14	
13	304	304004	4	TILL 03 USD 304	USD	2021-12-14	
13	150	150004	4	ATM 150	NGN	2021-12-14	
13	151	151004	4	ATM 151	NGN	2021-12-14	
13	152	152004	4	ATM 152	NGN	2021-12-14	
14	100	100004	4	BRANCH VAULT NGN 100	NGN	2021-12-14	
14	101	101004	4	HEAD TELLER 101  NGN	NGN	2021-12-14	
14	103	103004	4	TILL 02 NGN 103	NGN	2021-12-14	
14	102	102004	4	TILL 01 102 NGN	NGN	2021-12-14	
14	104	104004	4	TILL 03 NGN 104	NGN	2021-12-14	
14	200	200004	4	BRANCH VAULT EUR 200	EUR	2021-12-14	
14	201	201004	4	HEAD TELLER EUR 201	EUR	2021-12-14	
14	202	202004	4	TILL 01 EUR 202	EUR	2021-12-14	
14	203	203004	4	TILL 02 EUR 203	EUR	2021-12-14	
14	204	204004	4	TILL 03 EUR 204	EUR	2021-12-14	
14	300	300004	4	BRANCH VAULT 300 USD	USD	2021-12-14	
14	301	301004	4	HEAD TELLER USD 301	USD	2021-12-14	
14	302	302004	4	TILL 01 USD 302	USD	2021-12-14	
14	303	303004	4	TILL 02 USD 303	USD	2021-12-14	
14	304	304004	4	TILL 03 USD 304	USD	2021-12-14	
14	150	150004	4	ATM 150	NGN	2021-12-14	
14	151	151004	4	ATM 151	NGN	2021-12-14	
14	152	152004	4	ATM 152	NGN	2021-12-14	
13	400	400004	4	BRANCH VAULT GBP 400	GBP	2022-08-19	
13	401	401004	4	HEAD TELLER GBP 401	GBP	2022-08-19	
13	402	402004	4	TILL 01 GBP 402	GBP	2022-08-19	
13	403	403004	4	TILL 02 GBP 403	GBP	2022-08-19	
13	404	404004	4	TILL 03 GBP 404	GBP	2022-08-19	
17	100	100004	4	BRANCH VAULT NGN 100	NGN	2022-09-12	
17	101	101004	4	HEAD TELLER 101  NGN	NGN	2022-09-12	
17	102	102004	4	TILL 01 102 NGN	NGN	2022-09-12	
17	103	103004	4	TILL 02 NGN 103	NGN	2022-09-12	
17	104	104004	4	TILL 03 NGN 104	NGN	2022-09-12	
17	200	200004	4	BRANCH VAULT EUR 200	EUR	2022-09-12	
17	201	201004	4	HEAD TELLER EUR 201	EUR	2022-09-12	
17	202	202004	4	TILL 01 EUR 202	EUR	2022-09-12	
17	203	203004	4	TILL 02 EUR 203	EUR	2022-09-12	
17	204	204004	4	TILL 03 EUR 204	EUR	2022-09-12	
17	300	300004	4	BRANCH VAULT 300 USD	USD	2022-09-12	
17	301	301004	4	HEAD TELLER USD 301	USD	2022-09-12	
17	302	302004	4	TILL 01 USD 302	USD	2022-09-12	
17	303	303004	4	TILL 02 USD 303	USD	2022-09-12	
17	304	304004	4	TILL 03 USD 304	USD	2022-09-12	
17	400	400004	4	BRANCH VAULT GBP 400	GBP	2022-09-12	
17	401	401004	4	HEAD TELLER GBP 401	GBP	2022-09-12	
17	402	402004	4	TILL 01 GBP 402	GBP	2022-09-12	
17	403	403004	4	TILL 02 GBP 403	GBP	2022-09-12	
17	404	404004	4	TILL 03 GBP 404	GBP	2022-09-12	
17	150	150004	4	ATM 150	NGN	2022-09-12	
16	100	100004	4	BRANCH VAULT NGN 100	NGN	2022-08-08	
16	101	101004	4	HEAD TELLER 101  NGN	NGN	2022-08-08	
16	102	102004	4	TILL 01 102 NGN	NGN	2022-08-08	
16	103	103004	4	TILL 02 NGN 103	NGN	2022-08-08	
16	104	104004	4	TILL 03 NGN 104	NGN	2022-08-08	
16	200	200004	4	BRANCH VAULT EUR 200	EUR	2022-08-08	
16	201	201004	4	HEAD TELLER EUR 201	EUR	2022-08-08	
16	202	202004	4	TILL 01 EUR 202	EUR	2022-08-08	
16	203	203004	4	TILL 02 EUR 203	EUR	2022-08-08	
16	204	204004	4	TILL 03 EUR 204	EUR	2022-08-08	
16	300	300004	4	BRANCH VAULT 300 USD	USD	2022-08-08	
16	301	301004	4	HEAD TELLER USD 301	USD	2022-08-08	
16	302	302004	4	TILL 01 USD 302	USD	2022-08-08	
16	303	303004	4	TILL 02 USD 303	USD	2022-08-08	
16	304	304004	4	TILL 03 USD 304	USD	2022-08-08	
16	400	400004	4	BRANCH VAULT GBP 400	GBP	2022-08-08	
16	401	401004	4	HEAD TELLER GBP 401	GBP	2022-08-08	
16	402	402004	4	TILL 01 GBP 402	GBP	2022-08-08	
16	403	403004	4	TILL 02 GBP 403	GBP	2022-08-08	
16	404	404004	4	TILL 03 GBP 404	GBP	2022-08-08	
16	150	150004	4	ATM 150	NGN	2022-08-08	
16	151	151004	4	ATM 151	NGN	2022-08-08	
6	201	201004	4	HEAD TELLER EUR 201	EUR	2020-07-08	
6	202	202004	4	TILL 01 EUR 202	EUR	2020-07-08	
6	300	300004	4	BRANCH VAULT 300 USD	USD	2020-07-08	
6	301	301004	4	HEAD TELLER USD 301	USD	2020-07-08	
6	302	302004	4	TILL 01 USD 302	USD	2020-07-08	
6	400	400004	4	BRANCH VAULT GBP 400	GBP	2020-07-08	
6	401	401004	4	HEAD TELLER GBP 401	GBP	2020-07-08	
6	402	402004	4	TILL 01 GBP 402	GBP	2020-07-08	
6	103	103004	4	TILL 02 NGN 103	NGN	2020-08-24	
6	104	104004	4	TILL 03 NGN 104	NGN	2020-08-24	
6	105	105004	4	TILL 04 NGN 105	NGN	2020-08-24	
6	106	106004	4	TILL 05 NGN 106	NGN	2020-08-24	
6	107	107004	4	TILL 06 NGN 107	NGN	2020-08-24	
6	151	151004	4	ATM 151	NGN	2020-08-24	
6	152	152004	4	ATM 152	NGN	2020-08-24	
6	203	203004	4	TILL 01 EUR 203	EUR	2020-08-24	16-MAR-2021
6	204	204004	4	TILL 03 EUR 204	EUR	2020-08-24	
6	303	303004	4	TILL 01 USD 303	USD	2020-08-24	16-MAR-2021
6	304	304004	4	TILL 03 USD 304	USD	2020-08-24	
6	403	403004	4	TILL 02 GBP 403	GBP	2020-08-24	
6	404	404004	4	TILL 03 GBP 404	GBP	2020-08-24	
2	153	153004	4	ATM 153	NGN	2021-06-03	
2	154	154004	4	ATM 154	NGN	2021-06-03	
2	1001	1001004	4	NULL 1001 NGN 1001	NGN	2021-06-07	07-JUN-2021
2	307	307004	4	TILL 04 USD 307	USD	2021-09-15	
2	207	207004	4	TILL 04 EUR 207	EUR	2021-09-15	
2	407	407004	4	TILL 04 GBP 407	GBP	2021-09-15	
15	204	204004	4	TILL 03 EUR 204	EUR	2022-06-21	
15	304	304004	4	TILL 03 USD 304	USD	2022-06-21	
8	100	100004	4	BRANCH VAULT NGN 100	NGN	2021-10-14	
8	101	101004	4	HEAD TELLER 101  NGN	NGN	2021-10-14	
8	102	102004	4	TILL 01 102 NGN	NGN	2021-10-14	
10	100	100004	4	BRANCH VAULT NGN 100	NGN	2021-12-06	
10	101	101004	4	HEAD TELLER 101  NGN	NGN	2021-12-06	
10	102	102004	4	TILL 01 102 NGN	NGN	2021-12-06	
10	103	103004	4	TILL 02 NGN 103	NGN	2021-12-06	
10	200	200004	4	BRANCH VAULT EUR 200	EUR	2021-12-06	
10	201	201004	4	HEAD TELLER EUR 201	EUR	2021-12-06	
10	202	202004	4	TILL 01 EUR 202	EUR	2021-12-06	
10	203	203004	4	TILL 02 EUR 203	EUR	2021-12-06	
10	204	204004	4	TILL 03 EUR 204	EUR	2021-12-06	
10	104	104004	4	TILL 03 NGN 104	NGN	2021-12-06	
7	1	1004	4	CASH CENTER TILL 01 NGN 001	NGN	2021-11-23	
3	1	1004	4	CASH CENTER TILL 01 NGN 001	NGN	2021-11-23	
3	2	2004	4	CASH CENTER TILL 02 NGN 002	NGN	2021-11-23	
3	3	3004	4	CASH CENTER TILL 03 NGN 003	NGN	2021-11-23	
3	4	4004	4	CASH CENTER TILL 04 NGN 004	NGN	2021-11-23	
7	199	199004	4	CASH CENTER HT 199 NGN 199	NGN	2021-11-23	
3	199	199004	4	CASH CENTER HT 199 NGN 199	NGN	2021-11-23	
3	198	198004	4	CASH CENTER HT 198 NGN 198	NGN	2021-11-23	
3	197	197004	4	CASH CENTER HT 197 NGN 197	NGN	2021-11-23	
3	196	196004	4	CASH CENTER HT 196 NGN 196	NGN	2021-11-23	
3	154	154004	4	ATM 154	NGN	2021-11-23	
3	155	155004	4	ATM 155	NGN	2021-11-23	
7	154	154004	4	ATM 154	NGN	2021-11-23	
7	155	155004	4	ATM 155	NGN	2021-11-23	
9	104	104004	4	TILL 03 NGN 104	NGN	2021-11-02	
9	105	105004	4	TILL 04 NGN 105	NGN	2021-11-02	
9	106	106004	4	TILL 05 NGN 106	NGN	2021-11-02	
8	104	104004	4	TILL 03 NGN 104	NGN	2021-11-02	
8	105	105004	4	TILL 04 NGN 105	NGN	2021-11-02	
8	106	106004	4	TILL 05 NGN 106	NGN	2021-11-02	
8	304	304004	4	TILL 03 USD 304	USD	2021-11-02	
8	400	400004	4	BRANCH VAULT GBP 400	GBP	2021-10-26	
8	401	401004	4	HEAD TELLER GBP 401	GBP	2021-10-26	
8	402	402004	4	TILL 01 GBP 402	GBP	2021-10-26	
8	403	403004	4	TILL 02 GBP 403	GBP	2021-10-26	
8	404	404004	4	TILL 03 GBP 404	GBP	2021-10-26	
9	150	150004	4	ATM 150	NGN	2021-11-09	
9	151	151004	4	ATM 151	NGN	2021-11-09	
8	150	150004	4	ATM 150	NGN	2021-11-09	
8	151	151004	4	ATM 151	NGN	2021-11-09	
11	100	100004	4	BRANCH VAULT NGN 100	NGN	2021-12-14	
11	101	101004	4	HEAD TELLER 101  NGN	NGN	2021-12-14	
11	102	102004	4	TILL 01 102 NGN	NGN	2021-12-14	
11	103	103004	4	TILL 02 NGN 103	NGN	2021-12-14	
11	200	200004	4	BRANCH VAULT EUR 200	EUR	2021-12-14	
11	201	201004	4	HEAD TELLER EUR 201	EUR	2021-12-14	
11	202	202004	4	TILL 01 EUR 202	EUR	2021-12-14	
11	203	203004	4	TILL 02 EUR 203	EUR	2021-12-14	
11	204	204004	4	TILL 03 EUR 204	EUR	2021-12-14	
11	104	104004	4	TILL 03 NGN 104	NGN	2021-12-14	
11	300	300004	4	BRANCH VAULT 300 USD	USD	2021-12-14	
11	301	301004	4	HEAD TELLER USD 301	USD	2021-12-14	
11	302	302004	4	TILL 01 USD 302	USD	2021-12-14	
11	303	303004	4	TILL 02 USD 303	USD	2021-12-14	
11	304	304004	4	TILL 03 USD 304	USD	2021-12-14	
11	150	150004	4	ATM 150	NGN	2021-12-14	
11	151	151004	4	ATM 151	NGN	2021-12-14	
11	152	152004	4	ATM 152	NGN	2021-12-14	
2	199	199004	4	CASH CENTER HT 199 NGN 199	NGN	2021-06-07	
10	150	150004	4	ATM 150	NGN	2022-01-21	
10	151	151004	4	ATM 151	NGN	2022-01-21	
2	1	1004	4	CASH CENTER TILL 01 NGN 001	NGN	2021-06-07	07-JUN-2021
2	2	2004	4	CASH CENTER TILL 02 NGN 002	NGN	2021-06-07	07-JUN-2021
2	3	3004	4	CASH CENTER TILL 03 NGN 003	NGN	2021-06-07	07-JUN-2021
2	4	4004	4	CASH CENTER TILL 04 NGN 004	NGN	2021-06-07	07-JUN-2021
15	400	400004	4	BRANCH VAULT GBP 400	GBP	2022-06-21	
15	401	401004	4	HEAD TELLER GBP 401	GBP	2022-06-21	
15	402	402004	4	TILL 01 GBP 402	GBP	2022-06-21	
15	403	403004	4	TILL 02 GBP 403	GBP	2022-06-21	
15	404	404004	4	TILL 03 GBP 404	GBP	2022-06-21	
1	999	999004	4	STC TELLER 999  NGN	NGN	2022-04-13	
3	999	999004	4	STC TELLER 999  NGN	NGN	2022-04-13	20-APR-2022
5	999	999004	4	STC TELLER 999  NGN	NGN	2022-04-13	20-APR-2022
6	999	999004	4	STC TELLER 999  NGN	NGN	2022-04-13	20-APR-2022
7	999	999004	4	STC TELLER 999  NGN	NGN	2022-04-13	20-APR-2022
8	999	999004	4	STC TELLER 999  NGN	NGN	2022-04-13	20-APR-2022
9	999	999004	4	STC TELLER 999  NGN	NGN	2022-04-13	20-APR-2022
10	999	999004	4	STC TELLER 999  NGN	NGN	2022-04-13	20-APR-2022
11	999	999004	4	STC TELLER 999  NGN	NGN	2022-04-13	20-APR-2022
12	999	999004	4	STC TELLER 999  NGN	NGN	2022-04-13	20-APR-2022
13	999	999004	4	STC TELLER 999  NGN	NGN	2022-04-13	20-APR-2022
14	999	999004	4	STC TELLER 999  NGN	NGN	2022-04-13	20-APR-2022
7	2	2004	4	CASH CENTER TILL 02 NGN 002	NGN	2021-12-14	
7	3	3004	4	CASH CENTER TILL 03 NGN 003	NGN	2021-12-14	
7	198	198004	4	CASH CENTER HT 198 NGN 198	NGN	2021-12-14	
7	197	197004	4	CASH CENTER HT 197 NGN 197	NGN	2021-12-14	
12	100	100004	4	BRANCH VAULT NGN 100	NGN	2021-12-14	
12	101	101004	4	HEAD TELLER 101  NGN	NGN	2021-12-14	
12	102	102004	4	TILL 01 102 NGN	NGN	2021-12-14	
12	103	103004	4	TILL 02 NGN 103	NGN	2021-12-14	
12	200	200004	4	BRANCH VAULT EUR 200	EUR	2021-12-14	
12	201	201004	4	HEAD TELLER EUR 201	EUR	2021-12-14	
12	202	202004	4	TILL 01 EUR 202	EUR	2021-12-14	
12	203	203004	4	TILL 02 EUR 203	EUR	2021-12-14	
12	300	300004	4	BRANCH VAULT 300 USD	USD	2021-12-14	
12	301	301004	4	HEAD TELLER USD 301	USD	2021-12-14	
12	303	303004	4	TILL 02 USD 303	USD	2021-12-14	
2	202	202004	4	TILL 01 EUR 202	EUR	2016-11-15	10-SEP-2018
2	203	203004	4	TILL 02 EUR 203	EUR	2016-11-15	10-SEP-2018
2	204	204004	4	TILL 03 EUR 204	EUR	2016-11-15	10-SEP-2018
2	205	205004	4	ORDINARY TELLER EUR 205	EUR	2016-11-15	
2	206	206004	4	ORDINARY TELLER EUR 206	EUR	2016-11-15	
2	300	300004	4	BRANCH VAULT 300 USD	USD	2016-02-04	10-SEP-2018
2	301	301004	4	HEAD TELLER USD 301	USD	2016-02-04	10-SEP-2018
2	302	302004	4	TILL 01 USD 302	USD	2016-11-15	10-SEP-2018
2	303	303004	4	TILL 02 USD 303	USD	2016-11-15	10-SEP-2018
2	304	304004	4	TILL 03 USD 304	USD	2016-11-15	10-SEP-2018
2	305	305004	4	ORDINARY TELLER USD 305	USD	2016-11-15	
2	306	306004	4	ORDINARY TELLER USD 306	USD	2016-11-15	
2	400	400004	4	BRANCH VAULT GBP 400	GBP	2016-02-04	10-SEP-2018
2	401	401004	4	HEAD TELLER GBP 401	GBP	2016-02-04	10-SEP-2018
2	402	402004	4	TILL 01 GBP 402	GBP	2016-11-15	10-SEP-2018
2	403	403004	4	TILL 02 GBP 403	GBP	2016-11-15	10-SEP-2018
2	404	404004	4	TILL 03 GBP 404	GBP	2016-11-15	10-SEP-2018
2	405	405004	4	ORDINARY TELLER GBP 405	GBP	2016-11-15	
2	406	406004	4	ORDINARY TELLER GBP 406	GBP	2016-11-15	
2	500	500004	4	PRINCIPAL TELLER 500 CHF	CHF	2016-11-15	
2	501	501004	4	ORDINARY TELLER CHF 501	CHF	2016-11-15	
2	502	502004	4	ORDINARY TELLER CHF 502	CHF	2016-11-15	
2	503	503004	4	ORDINARY TELLER CHF 503	CHF	2016-11-15	
2	504	504004	4	ORDINARY TELLER CHF 504	CHF	2016-11-15	
2	505	505004	4	ORDINARY TELLER CHF 505	CHF	2016-11-15	
2	506	506004	4	ORDINARY TELLER CHF 506	CHF	2016-11-15	
2	600	600004	4	PRINCIPAL TELLER 600 SAR	SAR	2016-02-04	15-NOV-2016
2	601	601004	4	ORDINARY TELLER SAR 601	SAR	2016-02-04	15-NOV-2016
2	602	602004	4	ORDINARY TELLER SAR 602	SAR	2016-11-15	15-NOV-2016
2	603	603004	4	ORDINARY TELLER SAR 603	SAR	2016-11-15	15-NOV-2016
2	604	604004	4	ORDINARY TELLER SAR 604	SAR	2016-11-15	15-NOV-2016
2	605	605004	4	ORDINARY TELLER SAR 605	SAR	2016-11-15	15-NOV-2016
2	606	606004	4	ORDINARY TELLER SAR 606	SAR	2016-11-15	15-NOV-2016
2	700	700004	4	PRINCIPAL TELLER 700 KWD	KWD	2016-02-04	03-SEP-2018
2	701	701004	4	ORDINARY TELLER 701 KWD	KWD	2016-02-04	03-SEP-2018
2	702	702004	4	ORDINARY TELLER 702 KWD	KWD	2016-11-15	15-NOV-2016
2	703	703004	4	ORDINARY TELLER 703 KWD	KWD	2016-11-15	15-NOV-2016
2	704	704004	4	ORDINARY TELLER 704 KWD	KWD	2016-11-15	15-NOV-2016
2	705	705004	4	ORDINARY TELLER 705 KWD	KWD	2016-11-15	15-NOV-2016
2	706	706004	4	ORDINARY TELLER 706 KWD	KWD	2016-11-15	15-NOV-2016
2	800	800004	4	PRINCIPAL TELLER 800 AED	AED	2016-11-15	
2	801	801004	4	ORDINARY TELLER  AED 801	AED	2016-11-15	
2	802	802004	4	ORDINARY TELLER  AED 802	AED	2016-11-15	
2	803	803004	4	ORDINARY TELLER  AED 803	AED	2016-11-15	
2	804	804004	4	ORDINARY TELLER  AED 804	AED	2016-11-15	
2	805	805004	4	ORDINARY TELLER  AED 805	AED	2016-11-15	
2	806	806004	4	ORDINARY TELLER  AED 806	AED	2016-11-15	
2	900	900004	4	PRINCIPAL TELLER 900 OMR	OMR	2016-11-15	
2	901	901004	4	ORDINARY TELLER  OMR 901	OMR	2016-11-15	
2	902	902004	4	ORDINARY TELLER  OMR 902	OMR	2016-11-15	
2	903	903004	4	ORDINARY TELLER  OMR 903	OMR	2016-11-15	
2	904	904004	4	ORDINARY TELLER  OMR 904	OMR	2016-11-15	
2	905	905004	4	ORDINARY TELLER  OMR 905	OMR	2016-11-15	
2	906	906004	4	ORDINARY TELLER  OMR 906	OMR	2016-11-15	
2	10	10004	4	PRINCIPAL TELLER 1000 BHD	BHD	2016-11-15	
2	11	11004	4	ORDINARY TELLER  BHD 1001	BHD	2016-11-15	
2	12	12004	4	ORDINARY TELLER  BHD 1002	BHD	2016-11-15	
2	13	13004	4	ORDINARY TELLER  BHD 1003	BHD	2016-11-15	
2	14	14004	4	ORDINARY TELLER  BHD 1004	BHD	2016-11-15	
2	15	15004	4	ORDINARY TELLER  BHD 1005	BHD	2016-11-15	
2	16	16004	4	ORDINARY TELLER  BHD 1006	BHD	2016-11-15	
2	100	100004	4	BRANCH VAULT NGN 100	NGN	2016-02-04	10-SEP-2018
2	101	101004	4	HEAD TELLER 101  NGN	NGN	2016-02-04	10-SEP-2018
2	102	102004	4	TILL 01 102 NGN	NGN	2016-02-04	10-SEP-2018
2	103	103004	4	TILL 02 NGN 103	NGN	2016-02-04	10-SEP-2018
2	104	104004	4	TILL 03 NGN 104	NGN	2016-02-04	10-SEP-2018
2	105	105004	4	TILL 04 NGN 105	NGN	2016-02-04	10-SEP-2018
2	106	106004	4	TILL 05 NGN 106	NGN	2016-02-04	10-SEP-2018
2	110	110004	4	PRINCIPAL TELLER 1100 QAR	QAR	2016-11-15	
2	111	111004	4	ORDINARY TELLER QAR 1101	QAR	2016-11-15	15-NOV-2016
2	112	112004	4	ORDINARY TELLER QAR 1102	QAR	2016-11-15	15-NOV-2016
2	113	113004	4	ORDINARY TELLER QAR 1103	QAR	2016-11-15	
2	114	114004	4	ORDINARY TELLER QAR 1104	QAR	2016-11-15	
2	115	115004	4	ORDINARY TELLER QAR 1105	QAR	2016-11-15	
2	116	116004	4	ORDINARY TELLER QAR 1106	QAR	2016-11-15	
2	170	170004	4	ATM MAIN OFFICE 170	SDG	2016-02-04	04-OCT-2016
2	171	171004	4	ATM BURJ ALFATIH HOTEL 171	SDG	2016-02-04	04-OCT-2016
2	172	172004	4	ATM SAGANA BRANCH 172	SDG	2016-02-04	04-OCT-2016
2	173	173004	4	ATM LYBIA BRANCH 173	SDG	2016-02-04	04-OCT-2016
2	174	174004	4	ATM WAD NOBAWI 174	SDG	2016-02-04	04-OCT-2016
2	175	175004	4	ATM ABUHAMAMA 175	SDG	2016-02-04	04-OCT-2016
2	176	176004	4	ATM SHAMBAT 176	SDG	2016-02-04	04-OCT-2016
2	178	178004	4	ATM BSIC TOWER 178	SDG	2016-10-04	
2	179	179004	4	ATM POLICE STATION WADNOBAWI	SDG	2016-10-04	
2	200	200004	4	BRANCH VAULT EUR 200	EUR	2016-02-04	10-SEP-2018
2	201	201004	4	HEAD TELLER EUR 201	EUR	2016-02-04	10-SEP-2018
4	150	150004	4	ATM 150	NGN	2020-02-03	
5	100	100004	4	BRANCH VAULT NGN 100	NGN	2020-03-30	
5	101	101004	4	HEAD TELLER 101  NGN	NGN	2020-03-30	
5	102	102004	4	TILL 01 102 NGN	NGN	2020-03-30	
5	200	200004	4	BRANCH VAULT EUR 200	EUR	2020-03-30	
5	201	201004	4	HEAD TELLER EUR 201	EUR	2020-03-30	
5	202	202004	4	TILL 01 EUR 202	EUR	2020-03-30	
5	300	300004	4	BRANCH VAULT 300 USD	USD	2020-03-30	
5	301	301004	4	HEAD TELLER USD 301	USD	2020-03-30	
5	302	302004	4	TILL 01 USD 302	USD	2020-03-30	
5	400	400004	4	BRANCH VAULT GBP 400	GBP	2020-03-30	
5	401	401004	4	HEAD TELLER GBP 401	GBP	2020-03-30	
5	402	402004	4	TILL 01 GBP 402	GBP	2020-03-30	
5	150	150004	4	ATM 150	NGN	2020-03-30	
2	999	999004	4	STC TELLER 999  NGN	NGN	2022-04-12	20-APR-2022
15	100	100004	4	BRANCH VAULT NGN 100	NGN	2022-06-21	
15	101	101004	4	HEAD TELLER 101  NGN	NGN	2022-06-21	
15	102	102004	4	TILL 01 102 NGN	NGN	2022-06-21	
15	103	103004	4	TILL 02 NGN 103	NGN	2022-06-21	
15	104	104004	4	TILL 03 NGN 104	NGN	2022-06-21	
15	200	200004	4	BRANCH VAULT EUR 200	EUR	2022-06-21	
15	201	201004	4	HEAD TELLER EUR 201	EUR	2022-06-21	
15	202	202004	4	TILL 01 EUR 202	EUR	2022-06-21	
15	203	203004	4	TILL 02 EUR 203	EUR	2022-06-21	
15	300	300004	4	BRANCH VAULT 300 USD	USD	2022-06-21	
15	301	301004	4	HEAD TELLER USD 301	USD	2022-06-21	
15	302	302004	4	TILL 01 USD 302	USD	2022-06-21	
15	303	303004	4	TILL 02 USD 303	USD	2022-06-21	
2	150	150004	4	ATM 150	NGN	2019-12-03	
2	151	151004	4	ATM 151	NGN	2019-12-03	
2	152	152004	4	ATM 152	NGN	2019-12-03	
10	300	300004	4	BRANCH VAULT 300 USD	USD	2021-12-06	
10	301	301004	4	HEAD TELLER USD 301	USD	2021-12-06	
10	302	302004	4	TILL 01 USD 302	USD	2021-12-06	
\.


--
-- Data for Name: am_names; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.am_names (id, name) FROM stdin;
100	BUSINESS BANKING GROUP
2A00	RETAIL BANKING GROUP
3A00	PUBLIC SECTOR GROUP
4A00	LAGOS LIASON
500	PRIVATE BANKING GROUP
016Z	VOTER'S ID
FATCREAT	COUNTRY COMPANY CREATION
FATDOC	DOCUMENTATION COMP & VERIF
FATEIN	EIN
FATENTITE	ENTITY ACTIF/PASSIF
FATGIIN	GIIN
FATGRC	GREEN CARD
FATHVA	HVA
FATSPON	SPONSOR PP US
0000000014	PEP
0000000015	POLITICAL EXPOSED PERSON
0000000040	CUS1
0000000041	CUS2
0000000043	AML RL
0000000046	NO DOCUMENTS
0000000048	NO CONTACT
1001	BANK VERIFICATION NUMBER
00C2	NUMBER OF SPOUSE
0003X	HUSBAND/WIFE NAME
017X	POSITION OF CONTACT PERSON
0004X	GRADE LEVEL
0011	NATIONAL ID CARD
0002	PASSPORT
003X	OTHERS
004S	MILITARY CARD
005W	JUDICIARY CARD
006000	DRIVERS LICENSE
0007	RESIDENCE PERMIT
00080	LEASE
0090	CERTIFICATE OF ACCOMODATION
010	LETTER OF EMPLOYMENT
0110	REGISTRATION CERTIFICATE
0120	TIN
0130	TRADE LICENSE
0140	RESIDENCE CERTIFICATE
01500	OTHERS
00100	NOT SPECIFIED
0022	CAPITAL
700	E-BUSINESS GROUP
78	UPGRADE/UPDATE FORM
067	BOARD OF TRUSTEES
0680	PEP APPROVAL
0690	VALID EMPLOYEE ID
070	NYSC ID/SCH ID/CALL UP LETTER
071	LETTER OF CREDENCE
072	CONSTI OF TRUSTEES
073	BIODATA OF NIG PASSPORT
00001	VOTERS ID
00002	INTERNATIONAL PASSPORT
00005	DRIVING LICENSE
00006	MILITARY CARD
00012	JURIDICARY CARD
00099	PERMIT FOR PERMANENT RESIDENCE
00013	NYSC ID/CALL UP LETTER
0330	CAPITAL CURRENCY
021	NICKNAME ENGLISH
0220	NICKNAME ARABIC
032	CURRENCY OF MONTHLYEXPENDINTUR
0010	BANK VERIFICATION NUMBER
0150	REGISTRATION NUMBER
0050	NUMBER OF CHILDREN
0060	NUMBER OF SPOUSES
007	GRADE LEVEL
008	MONTHLY EXPENDINTURES
009	INDIVIDUA LCLASSIFICATION
010	ISSUANCE COUNTRY FOR IDS
016	TAX NUMBER
018	REGISTRATION COUNTRY
019	NICKNAME ARABIC
020	NICKNAME ENGLISH
026	ORGANIZATION TYPE
022	NUMBER OF SHARES (TOTAL)
024	POSITION OF CONTACT PERSON
025	ACCREDITED PARTY
027	SPOUSE NAME
028	PRIVATE OR PUBLIC COMPANY
017	ESTABLISHMENT DATE
021	COMPANY CAPITAL
030	OLD THIRD NUMBER IN SMART
023	SHARESAMOUNT
GU2	GUDU CASH CENTER GROUP
GU1	ABUJA BUS DEVELOPMT GROUP/GUDU
DS1	ABUJA RETAIL BKG GRP TEAM DSAS
SBG	SABON GARI CASH CENTER GROUP
055	INFORMATION SECURITY
007	TYPE SAVING ACCOUNT
008	SCUML
066	DOM REQUEST LETTER
019	BIRTH CERTIFICATE
020	INTRO LETTER FROM EMPLOYER
021	INTRO LETTER FROM SCHOOL
022	CTC FORM CO2
023	CTC FORM CO7
024	POWER OF ATTORNEY
026	PARTNERSHIP AGREEMENT
028	CTC FORM 1.1
031	CERTFICATE TO COMMENCE BIZ
032	COMPANY REGULATIONS
034	FATCA FORM
036	APPROVAL LETTER
042	LETTER OF INDEMNITY
044	COPY OF AUDITED FIN STATEMNT
045	DELEGATION OF SIGNATORIES
046	REGISTRATION CERTIFICATION/BUS
047	EXPORT IMPORT REGISTRATION
050	LETTER FROM AG/MIN OF FINANCE
054	BDC LICENSE
055	ABCON CERTIFICATE
056	CTC APPLICATION FOR REGISTRATI
057	COPY OF GAZETTE
058	GOVT ID
060	REFERENCES
062	DULY COMPLETED ACCT OPENING FO
064	UTILITY DIASPORA
065	BUSINESS PERMIT
052	MANDATE CARD
053	KYC-KNOW YOUR CUSTOMER
017	UTILITY BILL
018	INTERNATIONAL PASSPORT
063	EMAIL INDEMNITY
061	CTC-INCORPORATION OF TRUSTEES
049	BVN
041	SEARCH REPORT
035	TAX CLEARANCE CERTIFICATE
033	SCUML
025	CERTIFICATE OF INCORPORATION
027	CTC MEMART
029	BOARD RESOLUTION TO OPEN ACCT
030	CONSTITUTION/REGULATIONS
037	TRUST DEED
043	CVR-CUSTOMER VISITATION REPORT
051	EXTRACT OF MINUTES OF MEETING
059	STATE BOARD OF EDU APPROVAL
013	SUB-SECTOR
012	SECTOR
074	FOREIGN UTILITY BILL
075	REQUEST LETTER FOR ACCT OPENIN
076	FORM 2.1
900	EXCLUSIVE
600	TAJMALL
304	TEAM B ABUJA-304
001	BUSINESS DEVELOPMENT
077	UPGRADE/UPDATE FORM
450	DIGITAL BANKING
00008	OFFICE ID CARD
00009	MILITARY ID CARD
00010	FOREIGN ID CARD
014	GROUP
015	SUB-GROUP
056	SOKOTO BRANCH OPERATION
057	SOKOTO CASH MOVEMENT
058	SOKOTO MARKETING
00007	NIMC
800	TREASURY DEPARTMENT
005	NEXT OF KIN
006	NEXT OF KIN DESCRIPTION
GAR	GARKI CC GROUP
KFW	KOFAR WAMBAI GROUP
HTR	HOTORO GROUP
WUS	WUSE CASH CENTER GROUP
YOL	YOLA RETAIL  BANKING GROUP
460	AGRIC DESK
GOM	GOMBE PUBLIC SECTOR GROUP
MAI	MAIDUGURI BB GROUP
ABJ	ABUJA CORPORATE BRANCH
WSU	WUSE MAIN BRANCH
KRA	KURNA ASABE - GROUP
KSB	KASUWAN BACCI CC GROUP
079	CUSTOMER PROFILE FORM
080	WATCHLIST SCREENING FORM
081	STATUS REPORT
APR	AIRPORT ROAD CC GROUP
BAU	BUSINESS DEVELOPMENT
EXP	EXPORT BUSINESS
\.


--
-- Data for Name: am_overdue_cases; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.am_overdue_cases (title, category, days_overdue, since, status, staff_responsible, rating) FROM stdin;
Undeclared Assets by Teller	DOCUMENT STORAGE	183	6 months ago	open	JONATHAN	Medium
CHEQUE NOT DESTROYED ON FINACLE AFTER USAGE	PROCESSED NIBBS/NEFT TRANSACTIONS	180	6 months ago	open	FAVOUR EFAM	Low
DELAYED RESPONSE TO AUDIT  ENQUIRY/REQUEST	CHEQUE PAYMENT	161	5 months ago	open	HANSON	High
ACCOUNT OPENED WITH INCOMPLETE DOCUMENTATION	ACCOUNT CLOSURE	161	5 months ago	open	TOBI	Medium
ACCOUNT OPENED WITH INCOMPLETE DOCUMENTATION	ACCOUNT CLOSURE	161	5 months ago	open	TOBI	Low
TRANSACTION REVIEW/CALLOVER	TRANSACTION REVIEW	161	5 months ago	open	FAVOUR EFAM	Low
NO HOP/CASH OFFICER APPROVAL FOR PAYMENT ABOVE TELLER LIMIT	CASH AND TELLER	157	5 months ago	open	TOBI	Critical
NO HOP/CASH OFFICER APPROVAL FOR PAYMENT ABOVE TELLER LIMIT	CASH AND TELLER	157	5 months ago	open	HANSON	Medium
NO RECORD OF POS RETRIEVED FROM VAULT FOR SET UP	POS ACQUIRED	157	5 months ago	open	TOBI	Low
DOCUMENTATION	INWARD CLEARING	157	5 months ago	open	TOBI	Low
WRONG CHARGES TAKEN	AUDIT ENQUIRY CHARGES	156	5 months ago	open	HANSON	Medium
WRONG CHARGES TAKEN	AUDIT ENQUIRY CHARGES	156	5 months ago	open	TOBI	Low
DOCUMENTATION	AUDIT ENQUIRY CHARGES	156	5 months ago	open	TOBI	Low
NO HOP/CASH OFFICER APPROVAL FOR PAYMENT ABOVE TELLER LIMIT	CASH AND TELLER	155	5 months ago	open	TOBI	Low
NO HOP/CASH OFFICER APPROVAL FOR PAYMENT ABOVE TELLER LIMIT	CASH AND TELLER	150	5 months ago	open	TOBI	Low
NO EMAIL INDEMNITY INSTRUCTION	EMAIL INDEMNITY	149	5 months ago	open	TOBI	Medium
AMOUNT MISMATCH	INBOUND AND OUTBOUND CORRESPONDENCE	149	5 months ago	open	TOBI	Low
NO HOP/CASH OFFICER APPROVAL FOR PAYMENT ABOVE TELLER LIMIT	CASH AND TELLER	149	5 months ago	open	TOBI	Low
DOCUMENTATION	INWARD CLEARING	149	5 months ago	open	HANSON	Low
CREDIT CARD CONTRACT	RECONCILIATION	149	5 months ago	open	TOBI	Low
INCOMPLETE TRANSACTION	INWARD CLEARING	148	5 months ago	open	JONATHAN	Medium
NO HOP/CASH OFFICER APPROVAL FOR PAYMENT ABOVE TELLER LIMIT	CASH AND TELLER	148	5 months ago	open	TOBI	Medium
STORE REGISTER NOT UPDATED	CARD DISTRIBUTION	148	5 months ago	open	TOBI	Medium
Some suspicious transaction	TRANSACTION REVIEW	148	5 months ago	open	TOBI	Medium
NO HOP/CASH OFFICER APPROVAL FOR PAYMENT ABOVE TELLER LIMIT	CASH AND TELLER	148	5 months ago	open	TOBI	Medium
AMOUNT MISMATCH	INBOUND AND OUTBOUND CORRESPONDENCE	148	5 months ago	open	HANSON	Medium
CREDIT CARD CONTRACT	RECONCILIATION	148	5 months ago	open	TOBI	Medium
ATM ISSUED TO WRONG CUSTOMER WITH SAME NAME	ATM CARD REQUEST AND ISSUANCE	148	5 months ago	open	HANSON	Medium
WRONG CHARGES TAKEN	AUDIT ENQUIRY CHARGES	148	5 months ago	open	HANSON	Low
WRONG CHARGES TAKEN	AUDIT ENQUIRY CHARGES	148	5 months ago	open	TOBI	Low
STORE REGISTER NOT UPDATED	CARD DISTRIBUTION	146	5 months ago	open	HANSON	Low
OUTSTANDING CHARGES NOT TAKEN	SAFE KEEPING ITEMS	146	5 months ago	open	HANSON	Low
NO HOP/CASH OFFICER APPROVAL FOR PAYMENT ABOVE TELLER LIMIT	CASH AND TELLER	146	5 months ago	open	CHARLES	Low
WRONG CHARGES TAKEN	AUDIT ENQUIRY CHARGES	142	5 months ago	open	HANSON	Medium
SETTLEMENT INCONSISTENT	PAYDIRECT � WHERE BANK IS COLLECTING BANK	63	2 months ago	open	CHARLES	Medium
STORE REGISTER NOT UPDATED	CARD DISTRIBUTION	63	2 months ago	open	CHARLES	Low
OVERDRAWN STAFF ACCOUNT	REVIEW OF STAFF AND STAFF RELATED ACCOUNTS	36	5 weeks ago	open	FAVOUR EFAM	Low
AMOUNT MISMATCH	RECONCILIATION	23	3 weeks ago	open	CHARLES	Low
DELAYED RESPONSE TO AUDIT  ENQUIRY/REQUEST	AUDIT ENQUIRY CHARGES	4	3 days ago	open	CHARLES	Low
\.


--
-- Data for Name: am_staff; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.am_staff (id, staff_name, department, email, dept_email, staff_id, user_id, os_user) FROM stdin;
4829	JONATHAN	BUSINESS DEVELOPMENT	jonathan.o@novajii.com	\N	jonathan.o@novajii.com	\N	\N
4830	OPERATIONS	BUSINESS DEVELOPMENT	operations@novajii.com	\N	operations@novajii.com	\N	oracle
4831	Chief Compliance Officer	BUSINESS DEVELOPMENT	chizo.o@novajii.com	\N	chizo.o@novajii.com	\N	\N
4832	JOY	BUSINESS DEVELOPMENT	kutesayo.j@novajii.com	\N	kutesayo.j@novajii.com	\N	\N
4833	TOBI	BUSINESS DEVELOPMENT	oluwatobi.obademi@sterling.ng	\N	oluwatobi.obademi@sterling.ng	101	oracle
4834	VICTOR	BUSINESS DEVELOPMENT	victor.i@novajii.com	\N	victor.i@novajii.com	\N	\N
4835	FAVOUR EFAM	BUSINESS DEVELOPMENT	favour.e@novajii.com	\N	favour.e@novajii.com	81	\N
4836	HANSON	BUSINESS DEVELOPMENT	hanson.e@novajii.com	\N	hanson.e@novajii.com	11	oracle1
4837	DAMARIS	OPERATIONS	chiamaka.c@novajii.com	\N	chiamaka.c@novajii.com	182	oracle
5509	CHARLES	BUSINESS DEVELOPMENT	charles.e@novajii.com	\N	charles.e@novajii.com	202	oracle
5469	Augustine Ejira	BUSINESS DEVELOPMENT	augustine.e@novajii.com	\N	augustine.e@novajii.com	223	\N
5277	NOVAJI INTROSERVE	COMPLIANCE	tech-support@novajii.com	\N	tech-support@novajii.com	43	oracle
\.


--
-- Data for Name: aml_report; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.aml_report (id, name, download_url, user_id, report_type_id, created_at, status, category, xml_data, error_msg, date_from, date_to) FROM stdin;
\.


--
-- Data for Name: app_config; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.app_config (id, name, val, description) FROM stdin;
10	app_id	106	Default Application ID
11	mail_url	https://opc.novajii.com/ords/r/novaji/icomply/login	Default mail login url
12	mail_banner	https://novajii.com/bvn/AdExample.jpg	Default mail banner
82	rest_base_url	http://localhost/icomply/public/sterlingdb	Base URL for REST  data source
42	max_risk_score	25	Maximum Risk Score
102	public_alert_page	https://opc.novajii.com/ords/r/novaji/icomply/public-alert-view?p233_id	Public Page to Review Alert
22	case_overdue_days	1	Number of days after which Open case is overdue
62	risk_score_model	avg	Statistical model for computing risk score from set of risk analyis entries:\nOptions:\navg : will use the average score\nmax : will use the max score
13	public_response_page	https://opc.novajii.com/ords/r/novaji/icomply/public-case-response?p236_id	Response page
4	default_mail_sender	alert@novajii.com	The default email sender
5	report_url	https://opc.novajii.com/ords/icomply/api/report	The query report URL for getting query reports as JSON
6	script_url	https://opc.novajii.com/ords/icomply/api/report/script	URL for the html app script repot
7	control_emails	tech-support@novajii.com,alert@novajii.com	Default Control Email
8	default_sender	alert@novajii.com	Default Email Sender
9	default_control_email	alert@novajii.com	Default Control Email
\.


--
-- Data for Name: app_pep_accounts; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.app_pep_accounts (id, branch_code, customer_id, debited, credited, date_opened, account_officer_id) FROM stdin;
1	5	75774	4433254.26	5730000.00	14-OCT-2020	315
2	5	75807	0.00	0.00	14-OCT-2020	315
3	5	75237	7769655.54	7768775.00	13-OCT-2020	315
4	3	2818	161.25	0.00	03-FEB-2020	238
5	2	77464	50845563.87	56142156.74	16-OCT-2020	313
6	1	75825	39766746.84	39664065.01	14-OCT-2020	243
7	2	77416	4140945.49	4136302.64	16-OCT-2020	313
8	2	77426	850147.02	384667.31	16-OCT-2020	312
9	1	332723	29997.50	30000.00	24-AUG-2022	284
10	1	337090	1010.75	1200.00	01-SEP-2022	275
11	1	337323	31896.50	32652.00	02-SEP-2022	233
12	13	342624	1214.60	2000.00	13-SEP-2022	4DH
13	7	346177	0.00	0.00	19-SEP-2022	5KB
14	16	346330	0.00	0.00	19-SEP-2022	2BD
15	1	324995	0.00	0.00	10-AUG-2022	227
16	13	344185	0.00	2000.00	15-SEP-2022	7DH
17	1	342636	50.00	213000.00	13-SEP-2022	3GB
18	2	337390	1700053.75	1812000.00	02-SEP-2022	227
19	2	300802	515402.05	600564.10	23-JUN-2022	225
20	1	325062	0.00	0.00	10-AUG-2022	276
21	2	344882	0.00	5000.00	16-SEP-2022	3DG
22	1	321205	0.00	100.00	02-AUG-2022	7WD
23	1	320879	58.00	20000.00	02-AUG-2022	071
24	2	13024	445.90	43651.60	18-JUN-2020	125
25	2	13026	881.24	7852.38	18-JUN-2020	125
26	3	2442	0.00	0.00	22-JAN-2020	132
27	3	2447	0.00	0.00	09-MAR-2020	132
28	3	2447	752380.16	0.00	22-JAN-2020	132
29	3	2447	0.00	0.00	09-MAR-2020	132
30	3	2444	9427329148.27	9677944444.19	22-JAN-2020	132
31	2	1274	0.00	0.00	27-MAR-2020	512
32	2	1274	45015227.05	45098813.30	20-DEC-2019	512
33	2	1274	45000000.00	45000000.00	17-JAN-2020	512
34	6	102702	9133870.75	9311328.77	16-DEC-2020	164
35	6	102702	11260400.77	11258037.05	16-DEC-2020	164
36	8	337686	0.00	2000.00	02-SEP-2022	732
37	1	318798	0.00	0.00	28-JUL-2022	5GD
38	1	313215	0.00	0.00	15-JUL-2022	14D
39	8	337674	0.00	12000.00	02-SEP-2022	10G
40	13	332134	12802.00	15000.00	23-AUG-2022	5HB
41	10	332258	0.00	3000.00	23-AUG-2022	5YR
42	13	337724	32729356.88	48800000.00	02-SEP-2022	3HB
43	1	317519	0.00	0.00	26-JUL-2022	1DA
44	2	336862	50.00	70000.00	01-SEP-2022	15D
45	3	333815	5050.00	1555040.00	26-AUG-2022	133
46	1	316422	0.00	10.00	25-JUL-2022	284
47	14	334967	397357.50	397500.00	29-AUG-2022	2DR
48	1	306951	23896.00	24000.00	04-JUL-2022	2YD
49	1	313719	0.00	0.00	18-JUL-2022	071
50	1	323735	1020.75	1050.00	08-AUG-2022	14D
51	1	337736	960.75	1000.00	02-SEP-2022	1MR
52	1	340886	116014.50	178088.00	09-SEP-2022	2MR
53	1	316169	912.00	1250.00	22-JUL-2022	071
54	1	313370	0.00	0.00	18-JUL-2022	14D
55	1	313349	0.00	0.00	15-JUL-2022	14D
56	14	335031	5200.91	6000.00	29-AUG-2022	4DR
57	2	338713	1075.00	12000.00	05-SEP-2022	1DI
58	2	338700	0.00	2000.00	05-SEP-2022	1DI
59	8	332862	230752.13	1291000.00	24-AUG-2022	2GR
60	1	302362	62222.50	1825000.00	27-JUN-2022	4DC
61	1	340391	1060.75	22900.00	08-SEP-2022	2MR
62	12	335784	31861.49	32000.00	30-AUG-2022	1DK
63	2	328756	0.00	10005.92	17-AUG-2022	11B
64	13	328264	13051.88	213100.00	17-AUG-2022	2DH
65	1	307828	0.00	0.00	05-JUL-2022	071
66	1	318401	0.00	0.00	27-JUL-2022	071
67	3	333516	2100.00	3000.00	25-AUG-2022	727
68	2	329107	468197.78	468200.00	18-AUG-2022	1DI
69	1	336090	456678.75	457100.00	30-AUG-2022	3DB
70	7	337324	0.00	0.00	02-SEP-2022	4KB
71	7	337324	0.00	1500.00	05-SEP-2022	4KB
72	1	312023	0.00	0.00	13-JUL-2022	14D
73	1	320027	0.00	0.00	01-AUG-2022	2DA
74	1	343783	146175.00	148100.00	15-SEP-2022	1DH
75	1	317560	0.00	0.00	26-JUL-2022	4MR
76	3	2448	1758830382.00	1758700107.50	22-JAN-2020	132
77	3	2448	269010178.58	243460319.76	09-OCT-2020	132
78	5	70714	292303.00	150000.00	05-OCT-2020	315
79	8	324001	299374.05	299561.28	08-AUG-2022	2GR
80	15	323345	468812.53	500000.00	08-AUG-2022	1PW
81	1	321882	5069.00	405200.00	04-AUG-2022	3DB
82	7	322171	927950.00	935087.00	04-AUG-2022	735
83	13	316789	0.00	2000.00	25-JUL-2022	2DH
84	8	321634	50.00	102000.00	03-AUG-2022	3GB
85	6	322362	0.00	0.00	04-AUG-2022	166
86	8	321648	20170.64	102000.00	03-AUG-2022	3GB
87	8	320713	3295114.36	3304860.92	02-AUG-2022	3GB
88	14	308793	9166.30	10000.00	07-JUL-2022	8DR
89	2	319162	0.00	17000.08	29-JUL-2022	4DI
90	7	320800	0.00	0.00	02-AUG-2022	5KB
91	6	321185	10000153.75	10903387.50	02-AUG-2022	165
92	13	337084	72627.21	78000.00	01-SEP-2022	7DH
93	3	319517	0.00	2200.00	29-JUL-2022	242
94	1	320849	24977.97	109000.00	02-AUG-2022	3GR
95	5	320913	150.00	100010000.00	02-AUG-2022	323
96	5	320913	0.00	2000.00	02-AUG-2022	323
97	15	314062	34716.45	34790.00	19-JUL-2022	1WD
98	7	322962	1141.98	52000.00	05-AUG-2022	289
99	3	247530	838845.80	843685.22	22-MAR-2022	331
100	5	325546	45362.63	70000.00	11-AUG-2022	315
101	5	325546	19250.00	40000.00	11-AUG-2022	315
102	5	325546	0.00	2000.00	11-AUG-2022	315
103	5	325852	4585.75	5000.00	11-AUG-2022	315
104	8	315984	1095107.50	1102000.00	22-JUL-2022	2GR
105	5	295530	9526.88	10000.00	16-JUN-2022	315
106	10	278722	2998287.81	2998387.50	19-MAY-2022	2YR
107	13	295732	23637074.77	24846850.00	16-JUN-2022	7DH
\.


--
-- Data for Name: app_views; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.app_views (view_name, sql_query) FROM stdin;
ACI_DIGITAL_DETAILS	select d.id,d.slug,d.created_at,j.username,j.device_status, \nj.device_id,j.created_by, \nto_date(j.created_date,'MM/DD/YYYY HH24:MI:SS') created_date, \nj.account_numbers \nfrom   aci_payload d, json_table (   \n         d.response_body, '$' columns (   \n          nested path '$[*]'   \n           columns (   \n                username varchar2(500) path '$.username', \n                device_status varchar2(500) path '$.status', \n                device_id varchar2(100) path '$.deviceId', \n                created_by varchar2(100) path '$.createdBy', \n                created_date varchar2(100) path '$.createdDate', \n                account_numbers varchar2(500) path '$.accountNumbers' \n                )  \n            )  \n        ) j  where d.slug='digital-details'
ACI_MOBILE_DETAILS	select d.id,d.slug,d.created_at,j.username, \n  aci_mgt.get_branch(j.username) branch_code, \n  j.profile_status , \nto_date(j.date_created,'MM/DD/YYYY HH24:MI:SS') create_date, \nto_date(j.date_registered,'MM/DD/YYYY HH24:MI:SS') registered_date,j.device_name  \nfrom   aci_payload d, json_table (   \n         d.response_body, '$' columns (   \n          nested path '$[*]'   \n           columns (   \n             username path '$.username',    \n             profile_status  path '$.profileStatus', \n             date_created  path '$.dateCreated', \n             date_registered path '$.dateRegistered', \n             device_name path '$.deviceName'    \n                  )  \n            )  \n        ) j  where d.slug='mobile-details'
ACI_POST_OFFICE_DETAILS	select d.id,d.slug,d.created_at,j.post_tran_id,j.post_tran_cust_id, \nj.sink_node_name,j.message_type,j.tran_type,j.tran_nr,j.stan, \nj.rsp_code_rsp,j.acquiring_inst_id_code, \nto_date(j.datetime_rsp,'MM/DD/YYYY HH24:MI:SS') datetime_resp, \nj.from_account_id,j.to_account_id,j.settle_amount, \nj.surcharge,j.payee,j.terminal_id,j.card_acceptor_id_code,j.card_acceptor_name_loc \nfrom   aci_payload d, json_table (   \n         d.response_body, '$' columns (   \n          nested path '$[*]'   \n           columns (   \n            post_tran_id number path '$.post_tran_id',    \n            post_tran_cust_id number path '$.post_tran_cust_id', \n            sink_node_name varchar2(500) path '$.sink_node_name', \n            message_type varchar2(500) path '$.message_type', \n            tran_type varchar2(100) path '$.tran_type', \n            tran_nr varchar2(100) path '$.tran_nr', \n            stan varchar2(100) path '$.stan', \n            rsp_code_rsp  varchar2(100) path '$.rsp_code_rsp',  \n            acquiring_inst_id_code varchar2(100) path '$.acquiring_inst_id_code',  \n            datetime_rsp varchar2(100) path '$.datetime_rsp', \n            from_account_id varchar2(100) path '$.from_account_id', \n            to_account_id varchar2(100) path '$.to_account_id', \n            settle_amount number path '$.settle_amount', \n            surcharge number path '$.surcharge', \n            payee varchar2(500) path '$.payee', \n            terminal_id varchar2(500) path '$.terminal_id', \n            card_acceptor_id_code varchar2(500) path '$.card_acceptor_id_code', \n            card_acceptor_name_loc varchar2(500) path '$.card_acceptor_name_loc' \n            )  \n            )  \n        ) j  where d.slug='post-office-details'
AM_ACCOUNT	select   \n    b.branch_code, \n    a.customer_id, \n    b.ext_rowid, \n    b.account_number, \n    b.date_created, \n    b.account_name, \n    b.product_code, \n    b.gl_code, \n    c.bvn, \n    a.id_type, \n    a.id_number, \n    a.sex  gender, \n    a.regn   birth_region, \n    a.firstname, \n    a.lastname, \n    a.reg_date, \n    a.othername, \n    a.middlename, \n    a.company_reg_date, \n    a.regn   region, \n    a.town birth_city, \n    a.state, \n    a.dob    date_of_birth, \n    a.id_organisationorparastatal, \n    a.account_officer_id, \n    a.id_country,     \n    a.title_code, \n    a.id_delivery_date,    \n    a.nationality_code, \n    b.closure_status, \n    b.gl_code_id, \n    b.gl_code_category_id, \n    d.address1, \n    d.address2, \n    d.address3, \n    e.email_address email, \n    (select g.num from tajprod.bktelcli@tajrep g where g.typ='001' and g.cli=b.customer_id and rownum=1) phonenumber1, \n    (select g.num from tajprod.bktelcli@tajrep g where g.typ='002' and g.cli=b.customer_id and rownum=1) phonenumber2  \nfrom am_customer a,am_customer_account b, \nam_customer_bvn c, am_customer_address d, \nam_customer_email e  \nwhere a.customer_id=b.customer_id \nand a.customer_id=c.customer_id  \nand a.customer_id=d.customer_id  \nand a.customer_id=e.customer_id
AM_ACCOUNT_BALANCE	select a.rowid row_id,trim(a.age) branch_code,trim(a.ncp) account_number, \ntrim(a.cha) gl_code,substr(a.cha,0,3) gl_code_id,substr(a.cha,4,3) parent_gl_code_id, \na.inti account_name,a.sin current_balance  \nfrom tajprod.bkcom@tajrep a
AM_ACCOUNT_BALANCE_HIST	select b.rowid row_id,trim(b.dev) curency_code, \n  trim(b.ncp) account_number,b.sde balance,trim(b.cha) gl_code, \n  trim(b.age) branch_code, \n  b.dco balance_date \nfrom tajprod.bksld@tajrep b
AM_ACCOUNT_DAILY_BALANCE	select a.age branch_code,a.dev currency_code,a.ncp account_number,a.dco tran_date ,nvl(a.mvtd,0) debited,nvl(a.mvtc,0) credited, \na.cha gl_code,nvl(a.sde,0) closing_balance,trunc(a.dco)-1 prev_date \nfrom tajprod.bksld@tajrep a
AM_ACCOUNT_OFFICERS	select account_officer_id, account_officer_name  \nfrom ctl_account_officers
AM_ACCOUNT_TYPE	select id,name from app_account_type
AM_ALERT_OWNERS	select a.id,a.status_id,a.alert_name,a.created_at,a.exception_process_id, \np.first_owner_id,p.second_owner_id \nfrom alert a,exception_process p  \nwhere a.exception_process_id=p.id
AM_ALL_ACCOUNTS	select a.ncp account_number,a.age branch_code,a.dev currency_code,a.cli customer_id,a.sde current_balance, \na.dou date_created,a.inti account_name,(select nomrest from tajprod.bkcli@tajrep where cli=a.cli) customer_name \nfrom tajprod.bkcom@tajrep a
AM_ALL_TAB_COLUMNS	select owner,column_name,table_name,data_type,data_length,  \ndata_precision,char_length  \nfrom all_tab_columns@tajrep \nwhere owner in ('TAJPROD')
AM_APPROVERS	select id,mdp,name,cimp,nif,date_created,branch_code,last_updated,customer_id,puti,port,ddlv  \nfrom app_approvers
AM_APP_USERS	WITH\n    apps AS (SELECT id,app_id str FROM users)\nSELECT\n    REGEXP_SUBSTR(str, '[^:]+', 1, LEVEL) app_id,id user_id\nFROM apps\nCONNECT BY LEVEL <= REGEXP_COUNT(STR, ':') + 1
AM_BANKING_CHANNELS	select trim(cacc) id, upper(trim(lib1)) name, trim(ctab) category_code \nfrom tajprod.bknom@tajrep where trim(ctab) in ('170')
AM_BRANCH	SELECT "BRANCH_CODE","BRANCH_NAME" FROM MAT_BRANCHES
AM_BRANCHES	SELECT "BRANCH_CODE","BRANCH_NAME" FROM MAT_BRANCHES
AM_BVN_RECENT_MODIFIED	select cli customer_id,valmt bvn \nfrom tajprod.bkicli@tajrep where trim(iden)='001'  \nminus  \nselect cli customer_id,valmt bvn \nfrom tajprod.bkicli@tajrep as of timestamp systimestamp - interval '1' hour where trim(iden)='001'
AM_CALLOVER	SELECT \n        rowidtochar(e.rowid) row_id, \n        trim(e.agsa)     source_branch_code, \n        trim(e.age)      branch_code, \n        e.ope      op_code, \n        e.eve      trans_id, \n        trim(e.age1)     branch_code1, \n        trim(e.dev1)     nationality_code1, \n        trim(e.dev) currency, \n        e.ncp1     account_number1, \n        trim(e.cli1)     customer_id1, \n        e.nom1     name1, \n        e.mon1     amt1, \n        e.mht1, \n       (select j.lib from tajprod.evuti@tajrep j where trim(j.cuti)=trim(e.uti) and rownum=1) initiator, \n       (select j.lib from tajprod.evuti@tajrep j where trim(j.cuti)=trim(e.uta) and rownum=1) approver1, \n       (select j.lib from tajprod.evuti@tajrep j where trim(j.cuti)=trim(e.utf) and rownum=1) approver2, \n        case when e.ncp1=b.ncp then mon1 end dr_amt, \n        case when e.ncp2=b.ncp then mon2 end cr_amt, \n        e.sol1     balance1, \n        e.mnat, \n        e.nat, \n        e.dou      value_date, \n        e.dco      date2, \n        e.uti      tran_ref, \n        e.lib1     narration1, \n        e.lib2     narration2, \n        e.dsai     tran_date, \n        e.hsai     tran_time, \n        e.eta tran_status, \n        b.cha gl_code, \n        substr(trim(b.cha),0,3) gl_code_id, \n        substr(trim(b.cha),4,3) gl_code_category_id \n    FROM \n        tajprod.bkeve@tajrep  e,tajprod.bkcom@tajrep b \n         \n    where ((e.ncp1) = (b.ncp) or (e.ncp2) = (b.ncp)) \n \nand (e.age1 = b.age or e.age2=b.age)
AM_CALLOVER_HIST	SELECT \n        rowidtochar(e.rowid) row_id, \n        e.agsa     source_branch_code, \n        e.age      branch_code, \n        e.ope      op_code, \n        e.eve      trans_id, \n        e.age1     branch_code1, \n        trim(e.dev1)     nationality_code1, \n        trim(e.dev) currency, \n        e.ncp1     account_number1, \n        e.cli1     customer_id1, \n        e.nom1     name1, \n        e.mon1     amt1, \n        e.mht1, \n       (select j.lib from tajprod.evuti@tajrep j where j.cuti=e.uti and rownum=1) initiator, \n       (select j.lib from tajprod.evuti@tajrep j where j.cuti=e.uta and rownum=1) approver1, \n       (select j.lib from tajprod.evuti@tajrep j where j.cuti=e.utf and rownum=1) approver2, \n        case when e.ncp1=b.ncp then mon1 end dr_amt, \n        case when e.ncp2=b.ncp then mon2 end cr_amt, \n        e.sol1     balance1, \n        e.mnat, \n        e.nat, \n        e.dou      value_date, \n        e.dco      date2, \n        e.uti      tran_ref, \n        e.lib1     narration1, \n        e.lib2     narration2, \n        e.dsai     tran_date, \n        e.hsai     tran_time, \n        e.eta tran_status, \n        b.cha gl_code, \n        substr(trim(b.cha),0,3) gl_code_id, \n        substr(trim(b.cha),4,3) gl_code_category_id \n    FROM \n        tajprod.bkheve@tajrep  e,tajprod.bkcom@tajrep b \n         \n    where ((e.ncp1) = (b.ncp) or (e.ncp2) = (b.ncp)) \nand (e.age1 = b.age or e.age2=b.age)
\.


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.cache (key, value, expiration) FROM stdin;
\.


--
-- Data for Name: case_management; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.case_management (id, user_id, case_status_id, priority_level_id, description, reason_for_close, created_at, updated_at, assigned_user, case_action, department_id, process_id, process_categoryid, assigned_user_response, alert_id, supervisor_1, supervisor_2, supervisor_3, event_date, title, exception_process_id, exception_log_id) FROM stdin;
59	9	1	1	case description	\N	2023-08-30 12:52:00	\N	9	very urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
61	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
63	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
87	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
88	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
89	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
90	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
68	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
91	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
92	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
93	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
94	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
95	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
96	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
97	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
57	8	2	1	case description	\N	2023-08-28 15:52:00	\N	55	please treat as urgent	60	40	311	\N	\N	\N	\N	\N	\N	\N	\N	\N
77	9	1	1	case description 1		2023-09-06 11:42:00	\N	9	please treat this	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
78	9	1	1	case description 1		2023-09-06 11:42:00	\N	9	please treat this	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
79	9	1	1	case description 1		2023-09-06 11:42:00	\N	9	please treat this	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
80	9	1	1	case description 1	null	2023-09-06 11:42:00	\N	9	please treat this	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
81	9	1	1	case description 1	null	2023-09-06 11:42:00	\N	9	please treat this	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
82	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
83	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
84	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
85	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
98	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
99	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
100	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
101	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
102	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
103	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
104	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
105	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
128	9	1	2	mycase 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	40	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
60	9	2	1	case description	\N	2023-08-30 12:52:00	\N	9	very urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
130	9	1	2	mycase 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	40	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
70	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
71	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
72	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
73	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
74	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
75	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
76	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
106	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
58	10	2	2	update	update	2023-09-26 16:39:29	\N	10	update	45	19891	336	update	53645	8	9	10	2022-10-14 00:00:00	update	19891	\N
107	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
108	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
109	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
110	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
111	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
112	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
113	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
114	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
115	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
116	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
117	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
118	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
119	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
120	9	1	2	new case created on 7th	\N	2023-08-30 12:52:00	\N	9	kindly attend to this, extremely urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
121	9	1	2	new case created on 7th	\N	2023-08-30 12:52:00	\N	9	kindly attend to this, extremely urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
55	9	2	2	new case 	no reason	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	cool response	\N	\N	\N	\N	\N	\N	\N	\N
122	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	60	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
129	9	1	2	mycase 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	40	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
131	9	1	2	mycase 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	40	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
132	9	1	2	mycase 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	40	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
133	9	1	2	mycase 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	40	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
134	9	1	2	mycase 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	40	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
135	9	1	2	mycase 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	40	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
136	9	1	2	mycase 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	40	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
137	9	1	2	mycase 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	40	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
138	9	1	2	mycase 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	40	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
139	9	1	2	mycase 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	40	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
140	9	1	2	mycase 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	40	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
141	9	1	2	mycase 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	40	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
142	9	1	2	mycase 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	40	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
144	9	1	2	mycase 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	40	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
145	9	1	2	mycase 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	40	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
146	9	1	2	mycase 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	40	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
124	9	1	2	new case 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	40	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
125	9	1	2	mycase 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	40	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
126	9	1	2	mycase 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	40	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
127	9	1	2	mycase 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	40	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
123	9	2	2	personal description on 7th september	\N	2023-08-30 12:52:00	\N	8	extremly urgent	40	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
147	9	1	2	mycase 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	40	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
148	9	1	2	mycase 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	40	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
149	9	1	2	mycase 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	40	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
150	9	1	2	mycase 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	40	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
151	9	1	2	mycase 	\N	2023-08-30 12:52:00	\N	9	extremly urgent	40	4	279	\N	\N	\N	\N	\N	\N	\N	\N	\N
153	10	1	1	missing ATM card	customer contacted	2023-08-30 12:52:00	2023-09-30 12:52:00	11	a matter of urgency	60	4	279	\N	\N	9	\N	\N	\N	\N	\N	\N
154	10	1	1	missing ATM card	customer contacted	2023-08-30 12:52:00	2023-09-30 12:52:00	11	a matter of urgency	60	4	279	\N	\N	9	\N	\N	\N	\N	\N	\N
155	9	1	2	sample case	reason is resolved	2023-08-28 00:00:00	2023-08-30 00:00:00	9	Very urgent	60	4	279	User response validated	1	8	9	10	\N	\N	\N	\N
156	9	1	2	sample case	reason is resolved	2023-08-28 00:00:00	2023-09-23 00:00:00	9	Very urgent	60	4	279	User response validated	1	8	9	10	\N	\N	\N	\N
157	9	1	2	sample case	reason is resolved	2023-09-23 00:00:00	2023-09-23 00:00:00	9	Very urgent	60	4	279	User response validated	1	8	9	10	\N	\N	\N	\N
158	9	1	2	sample case	reason is resolved	2017-08-08 02:00:00	2023-09-23 00:00:00	9	Very urgent	60	4	279	User response validated	1	8	9	10	\N	\N	\N	\N
159	9	1	2	sample case	reason is resolved	2017-08-08 02:00:00	2017-09-08 02:00:00	9	Very urgent	60	4	279	User response validated	1	8	9	10	\N	\N	\N	\N
162	8	1	1	testing description	\N	\N	\N	\N	\N	\N	\N	1	\N	\N	\N	\N	\N	\N	\N	\N	\N
163	10	1	2	test desc	\N	\N	\N	9	respond to case	60	4	279	\N	\N	8	10	\N	\N	\N	\N	\N
164	10	1	2	test desc	\N	\N	\N	9	respond to case	60	4	279	\N	\N	8	10	\N	\N	\N	\N	\N
165	10	1	2	test desc	\N	\N	\N	9	respond to case	60	4	279	\N	\N	8	10	\N	\N	\N	\N	\N
166	10	1	2	test desc	\N	\N	\N	9	respond to case	60	4	279	\N	\N	8	10	\N	\N	\N	\N	\N
167	10	1	2	test desc	\N	\N	\N	9	respond to case	60	4	279	\N	\N	8	10	\N	\N	\N	\N	\N
168	10	1	2	test desc	\N	\N	\N	9	respond to case	60	4	279	\N	\N	8	10	\N	\N	\N	\N	\N
169	10	1	2	test desc	\N	\N	\N	9	respond to case	60	4	279	\N	\N	8	10	\N	\N	\N	\N	\N
170	10	1	2	test desc	\N	\N	\N	9	respond to case	60	4	279	\N	\N	8	10	\N	\N	\N	\N	\N
171	10	1	2	test desc	\N	\N	\N	9	respond to case	60	4	279	\N	\N	8	10	\N	\N	\N	\N	\N
172	10	1	2	test desc	\N	\N	\N	9	respond to case	60	4	279	\N	\N	8	10	\N	\N	\N	\N	\N
173	10	1	2	test desc	\N	\N	\N	9	respond to case	60	4	279	\N	\N	8	10	\N	\N	\N	\N	\N
174	10	1	2	test desc	\N	\N	\N	9	respond to case	60	4	279	\N	\N	8	10	\N	\N	\N	\N	\N
175	10	1	2	test desc	\N	\N	\N	9	respond to case	60	4	279	\N	\N	8	10	\N	\N	\N	\N	\N
176	10	1	2	test desc	\N	\N	\N	9	respond to case	60	4	279	\N	\N	8	10	\N	\N	\N	\N	\N
177	10	1	2	test desc	\N	\N	\N	9	respond to case	60	4	279	\N	\N	8	10	\N	\N	\N	\N	\N
178	10	1	2	test desc	\N	\N	\N	9	respond to case	60	4	279	\N	\N	8	10	\N	\N	\N	\N	\N
179	10	1	2	test desc	\N	\N	\N	9	respond to case	60	4	279	\N	\N	8	10	\N	\N	\N	\N	\N
180	10	1	2	test desc	\N	\N	\N	9	respond to case	60	4	279	\N	\N	8	10	\N	\N	\N	\N	\N
181	10	1	2	test desc	\N	\N	\N	9	respond to case	60	4	279	\N	\N	8	10	\N	\N	\N	\N	\N
900	10	1	2	test desc	\N	\N	\N	9	respond to case	60	4	279	\N	\N	8	10	\N	\N	\N	\N	\N
182	10	1	2	test desc	\N	\N	\N	9	respond to case	60	4	279	\N	\N	8	10	\N	\N	\N	\N	\N
183	10	1	2	test desc	\N	\N	\N	9	respond to case	60	4	279	\N	\N	8	10	\N	\N	\N	\N	\N
184	10	1	2	test desc	\N	\N	\N	9	respond to case	60	4	279	\N	\N	8	10	\N	\N	\N	\N	\N
185	10	1	2	test desc	\N	\N	\N	9	respond to case	60	4	279	\N	\N	8	10	\N	\N	\N	\N	\N
186	10	1	2	test desc	\N	\N	\N	9	respond to case	60	4	279	\N	\N	8	10	\N	\N	\N	\N	\N
187	10	1	2	test desc	\N	\N	\N	9	respond to case	60	4	279	\N	\N	8	10	\N	\N	\N	\N	\N
188	10	1	2	test desc	\N	\N	\N	9	respond to case	60	4	279	\N	\N	8	10	\N	\N	\N	\N	\N
189	10	1	2	test desc	\N	\N	\N	9	respond to case	60	4	279	\N	\N	8	10	\N	\N	\N	\N	\N
190	10	1	2	test desc	\N	\N	\N	9	respond to case	60	4	279	\N	\N	8	10	\N	\N	\N	\N	\N
191	10	1	2	test desc	\N	\N	\N	9	respond to case	60	4	279	\N	\N	8	10	\N	\N	\N	\N	\N
192	10	1	3	creating a new case to check balances	customer contacted and issue resolved	2023-09-25 00:00:00	\N	8	Check balance immediately	72	19891	336	Working on it	4535235545	9	10	10	2023-07-08 00:00:00	Resolution in process	19891	\N
193	10	1	3	creating a new case to check balances	customer contacted and issue resolved	2023-09-25 00:00:00	\N	8	Check balance immediately	72	19891	336	Working on it	4535235545	9	10	10	2023-07-08 00:00:00	Resolution in process	19891	\N
194	10	1	3	creating a new case to check balances	customer contacted and issue resolved	2023-09-25 17:24:12	\N	8	Check balance immediately	72	19891	336	Working on it	4535235545	9	10	10	2022-06-15 00:00:00	Resolution in process	19891	\N
195	10	1	3	creating a new case to check balances	customer contacted and issue resolved	2023-09-25 17:28:04	\N	8	Check balance immediately	72	19891	336	Working on it	4535235545	9	10	10	2022-05-08 00:00:00	Resolution in process	19891	\N
196	10	1	3	testing package to insert	customer contacted and issue resolved amicably	2023-09-25 18:02:21	\N	8	confirm account details	50	19833	305	Working on resolving	72584354	8	9	10	2022-10-25 00:00:00	Resolution in process	19891	\N
197	10	1	3	creating a new case to check balances	customer contacted and issue resolved	2023-09-26 05:15:46	\N	8	Check balance immediately	72	19891	336	Working on it	4535235545	9	10	10	2022-05-08 00:00:00	Resolution in process	19891	\N
198	8	3	3	testing package to insert	customer contacted and issue resolved amicably	2023-09-26 08:13:08	\N	8	confirm account details	50	19833	305	Working on resolving	72584354	8	9	10	2022-10-25 00:00:00	Resolution in process	19891	\N
199	8	3	3	fulltest	customer contacted and issue resolved amicably	2023-09-26 08:16:33	\N	8	confirm account details	50	19833	305	Working on resolving	72584354	8	9	10	2022-10-25 00:00:00	Resolution in process	19891	\N
200	10	3	3	slow process	customer contacted and issue resolved amicably	2023-09-26 09:03:21	\N	8	confirm account details	50	19833	305	Working on resolving	72584354	8	9	10	2022-10-25 00:00:00	Resolution in process	19891	\N
201	9	9	9	9	9	2023-09-26 09:17:49	\N	9	9	9	9	9	9	9	9	9	9	0009-01-01 00:00:00	9	9	\N
202	9	9	9	9	9	2023-09-26 09:17:58	\N	9	9	9	9	9	9	9	9	9	9	0009-01-01 00:00:00	9	9	\N
203	9	3	3	fulltest	customer contacted and issue resolved amicably	2023-09-26 09:53:02	\N	8	confirm account details	50	19833	305	Working on resolving	72584354	8	9	10	2022-10-25 00:00:00	Resolution in process	19891	\N
204	8	3	3	fulltest	customer contacted and issue resolved amicably	2023-09-26 10:14:12	\N	8	confirm account details	50	19833	305	Working on resolving	72584354	8	9	10	2022-10-25 00:00:00	Resolution in process	19891	\N
205	10	2	2	closed as created	customer contacted immediately	2023-09-26 13:07:15	\N	8	confirm account details	50	19833	305	Working on resolving	72584354	8	9	10	2022-10-25 00:00:00	Resolution in process	19891	\N
206	9	2	3	Incomplete credentials	Handled	2023-09-26 14:38:13	\N	9	Credential seems missing	55	19891	336	Customer contacted immediately	65347568	8	8	10	2023-06-28 00:00:00	Documentation	19891	\N
207	10	3	2	missing photo	customer contacting	2023-09-26 15:03:14	\N	10	check quality	45	19891	336	resolved	7984593	9	10	9	2022-11-17 00:00:00	Documentation	19891	\N
209	101	3	1	Forged signature	Resolved	2023-09-27 17:24:45	\N	101	Contact customer	60	336	19891	Working on it	656456456465	10	9	8	2023-10-11 00:00:00	check v2 document	336	\N
210	61	1	3	forged	forged	2023-09-27 17:51:19	\N	61	forged	67	336	19891	forged	35467889	121	162	202	2022-10-15 00:00:00	forged	336	\N
211	61	1	3	fixed	fixed	2023-09-27 18:00:26	\N	61	fixed	67	336	19891	fixed	35467889	121	162	202	2022-10-15 00:00:00	fixed	336	\N
212	61	1	3	fixed	fixed	2023-09-27 18:01:06	\N	61	fixed	67	336	19891	fixed	35467889	121	162	202	2022-10-15 00:00:00	fixed	336	\N
213	61	1	3	fix	fix	2023-09-27 18:03:11	\N	61	fix	67	336	19891	fix	35467889	121	162	202	2022-10-15 00:00:00	fix	336	\N
214	61	1	3	kicker	kicker	2023-09-27 18:25:14	\N	61	fix	67	336	19891	kicker	35467889	121	162	202	2022-10-15 00:00:00	kicker	336	\N
215	61	1	3	kicker	kicker	2023-09-27 18:27:10	\N	61	fix	67	336	19891	kicker	35467889	121	162	202	2022-10-15 00:00:00	kicker	336	\N
218	9	2	3	rate	rate	2023-09-28 00:51:17	\N	9	rate	67	336	19891	rate	456789	9	10	11	2020-11-15 00:00:00	rate	336	\N
220	\N	\N	\N	test123	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
221	\N	\N	\N	test	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
222	\N	\N	\N	test	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
223	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	title	\N	\N
224	10	1	3	email check	email check	2023-09-29 13:46:30	\N	10	email check	60	19891	336	email check	43754585	8	9	101	2022-10-12 00:00:00	email check	19891	\N
225	10	1	3	email check	email check	2023-09-29 13:52:19	\N	10	email check	60	19891	336	email check	43754585	8	9	101	2022-10-12 00:00:00	email check	19891	\N
\.


--
-- Data for Name: case_status; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.case_status (id, name, description, slug, created_at, updated_at) FROM stdin;
1	Opened	Open Case	opened	\N	\N
2	Closed	Closed Case	closed	\N	\N
3	Overdue	overdue cases	overdue	\N	\N
\.


--
-- Data for Name: cases; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.cases (id, title, cases_description, created_at, updated_at, status_id, alert_id, team_id, staff_id, cases_action, user_id, event_date, rating_id, exception_process_id, response_note, responses) FROM stdin;
656	WRONG CHARGES TAKEN	Check Audit		17-APR-23 03.57.27.023904000 PM	1	639	\N	4833	Please review and ensure compliance	43	17-APR-23 12.00.00.000000000 AM	1	17048	\N	\N
715	CHEQUE PAID BUT NOT CONFIRMED.	Please treat	2023-10-04 22:00:32.960947+00 09.00.17.176950000 AM	2023-10-04 22:00:32.960947+00 09.00.17.176950000 AM	2	698	101	4833	Please review and ensure compliance	43	2023-10-04 22:00:32.960947+00	2	17034	\N	\N
717	WRONG CHARGES TAKEN	Please treat	2023-10-04 22:00:32.960947+00 09.40.50.953121000 AM	2023-10-04 22:00:32.960947+00 09.40.50.953121000 AM	1	700	101	4836	Please review and ensure compliance	43	2023-10-04 22:00:32.960947+00 	2	17048	\N	\N
756	WRONG CHARGES TAKEN	To be checked	2023-10-04 22:00:32.960947+00 11.33.28.586653000 PM	2023-10-04 22:00:32.960947+00 11.33.28.586653000 PM	1	739	60	4833	Please review and ensure compliance	43	2023-10-04 22:00:32.960947+00	1	17048	\N	\N
775	DUPLICATE TRANSACTION	Check compliance	19-APR-23 12.38.33.241198000 PM	19-APR-23 12.38.33.241198000 PM	2	760	44	4833	Please review and ensure compliance on process	43	19-APR-23 12.00.00.000000000 AM	2	17494	\N	\N
816	ATM ISSUED TO WRONG CUSTOMER WITH SAME NAME	Both appeared to have requested for ATM card within two week	20-APR-23 09.11.08.928385000 AM	20-APR-23 09.11.08.928385000 AM	2	802	67	4833	Please review and resolved	43	19-APR-23 12.00.00.000000000 AM	2	18093	\N	\N
835	AMOUNT MISMATCH	Please treat	22-APR-23 09.43.39.283742000 AM	22-APR-23 09.43.39.283742000 AM	2	878	\N	4836	Please review and ensure compliance	81	22-APR-23 12.00.00.000000000 AM	1	17146	\N	\N
915	CONFIRMATION PROCESS NOT SATISFACTORY	Ensure all documents are completed	25-APR-23 08.29.10.076581000 PM	25-APR-23 08.29.10.076581000 PM	2	1018	44	4833	Please review and ensure compliance	43	23-APR-23 12.00.00.000000000 AM	2	19267	\N	\N
968	WRONG CHARGES TAKEN	Pleae respond	26-APR-23 12.39.07.169404000 PM	26-APR-23 12.39.07.169404000 PM	2	1079	101	4833	Please review and ensure compliance	43	26-APR-23 12.00.00.000000000 AM	1	17048	\N	\N
977	NO HOP/CASH OFFICER APPROVAL FOR PAYMENT ABOVE TELLER LIMIT	check for mail	28-APR-23 09.46.20.645992000 AM	28-APR-23 09.46.20.645992000 AM	1	1120	101	5509	Please review and ensure compliance	43	28-APR-23 12.00.00.000000000 AM	1	17246	\N	\N
1056	WRONG/NO FILING	case	20-JUL-23 07.48.02.783688000 AM	20-JUL-23 07.48.02.783688000 AM	1	1679	\N	5509	Please review and ensure compliance	11	20-JUL-23 12.00.00.000000000 AM	1	17147	\N	\N
1059	SETTLEMENT INCONSISTENT	confirm recipient mail	20-JUL-23 07.57.46.130356000 AM	20-JUL-23 07.57.46.130356000 AM	1	1682	43	5509	Please review and ensure compliance	11	14-JUL-23 12.00.00.000000000 AM	2	17496	\N	\N
1075	INCOMPLETE TRANSACTION	Transaction Details:&nbsp,\n\nProcess :Multiple Bill Payment transactions same day - ALERT2023220502000767837&nbsp,\n\nEvent Date :22-MAY-2023 02:00AM&nbsp,\n\nNarration : Multiple Bill Payment transactions same day	23-JUL-23 02.24.41.907344000 PM	23-JUL-23 02.24.41.907344000 PM	2	1698	44	5509	Please review and revert	43	23-JUL-23 12.00.00.000000000 AM	2	17248	\N	\N
1155	AMOUNT MISMATCH	\N	29-AUG-23 08.28.25.909894000 AM	29-AUG-23 08.28.25.909894000 AM	1	1778	48	5509	please treat as very urgent	43	28-AUG-23 12.00.00.000000000 AM	1	17378	\N	\N
1235	NO HOP/CASH OFFICER APPROVAL FOR PAYMENT ABOVE TELLER LIMIT	chech process	02-OCT-23 01.30.01.597441000 PM	02-OCT-23 01.30.01.597441000 PM	1	1858	102	4835	Please review and ensure compliance	43	02-OCT-23 12.00.00.000000000 AM	1	17246	\N	\N
555	NO HOP/CASH OFFICER APPROVAL FOR PAYMENT ABOVE TELLER LIMIT	\N	24-MAR-23 06.09.41.440106000 PM	24-MAR-23 06.09.41.440106000 PM	2	539	101	4834	Please review and ensure compliance	43	24-MAR-23 12.00.00.000000000 AM	1	17246	\N	\N
575	CHEQUE NOT DESTROYED ON FINACLE AFTER USAGE	Kindly treat	25-MAR-23 11.40.45.075040000 AM	25-MAR-23 11.40.45.075040000 AM	1	558	101	4835	Please review and ensure compliance	43	25-MAR-23 12.00.00.000000000 AM	1	19222	\N	\N
604	TRANSACTION REVIEW/CALLOVER	Transaction Details:&nbsp,\nTrans. Ref:000004&nbsp,\nCustomer Credited:&nbsp,\nAccount Credited:&nbsp,\nCustomer Debited: GREEN WYLIE&nbsp,\nAccount Debited:&nbsp,\nTran. Date: 25-SEP-2019&nbsp,\nTran. Amt: 8,000,000.00\nNarration: Online Payment|AAAxaJAAJAAAA0nAAB	13-APR-23 10.00.46.596379000 AM	13-APR-23 10.00.46.596379000 AM	2	587	\N	4833	Please review and ensure compliance	182	13-APR-23 12.00.00.000000000 AM	1	7061	\N	\N
615	DELAYED RESPONSE TO AUDIT  ENQUIRY/REQUEST	Just Testing	13-APR-23 12.57.16.693563000 PM	13-APR-23 12.57.16.693563000 PM	1	598	60	4836	Please review and ensure compliance	81	13-APR-23 12.00.00.000000000 AM	3	19603	\N	\N
675	SYSTEM FAILURE	Check card status and respond	17-APR-23 06.03.58.669397000 PM	17-APR-23 06.03.58.669397000 PM	2	658	94	4833	Please review and ensure compliance	101	17-APR-23 12.00.00.000000000 AM	3	17543	\N	\N
876	DOCUMENTATION	Check and confirm	25-APR-23 09.47.10.494967000 AM	25-APR-23 09.47.10.494967000 AM	1	978	44	4836	Please review and ensure compliance	101	25-APR-23 12.00.00.000000000 AM	1	17025	\N	\N
916	CREDIT CARD CONTRACT	Ensure its confirmed	25-APR-23 08.45.56.207028000 PM	25-APR-23 08.45.56.207028000 PM	2	1019	62	4833	Please review	101	25-APR-23 12.00.00.000000000 AM	2	17368	\N	\N
957	AMOUNT MISMATCH	check all	26-APR-23 08.27.27.391377000 AM	26-APR-23 08.27.27.391377000 AM	1	1064	104	4836	Please review and ensure compliance	43	26-APR-23 12.00.00.000000000 AM	2	17146	\N	\N
958	WRONG CHARGES TAKEN	Confirm	26-APR-23 09.14.30.112119000 AM	26-APR-23 09.14.30.112119000 AM	1	1065	\N	4836	Please review and ensure compliance	43	26-APR-23 12.00.00.000000000 AM	2	17048	\N	\N
960	NO HOP/CASH OFFICER APPROVAL FOR PAYMENT ABOVE TELLER LIMIT	Kindly treat	26-APR-23 09.38.05.436373000 AM	26-APR-23 09.38.05.436373000 AM	1	1067	101	4833	Please review and ensure compliance	43	26-APR-23 12.00.00.000000000 AM	2	17246	\N	\N
995	WRONG CHARGES TAKEN	Please respond	02-MAY-23 09.48.38.853866000 AM	02-MAY-23 09.48.38.853866000 AM	1	1198	62	4836	Please review and ensure compliance	43	02-MAY-23 12.00.00.000000000 AM	2	17048	<p>update made</p>	\N
1175	DELAYED RESPONSE TO AUDIT  ENQUIRY/REQUEST	\N	17-SEP-23 08.07.58.258166000 PM	17-SEP-23 08.07.58.258166000 PM	1	1798	102	5509	Please review and ensure compliance	43	10-SEP-23 12.00.00.000000000 AM	1	17049	<p>yes yes yes</p>	\N
955	NO HOP/CASH OFFICER APPROVAL FOR PAYMENT ABOVE TELLER LIMIT	checking buttons	26-APR-23 05.40.26.173852000 AM	26-APR-23 05.40.26.173852000 AM	1	1062	43	4833	Please review and ensure compliance	101	26-APR-23 12.00.00.000000000 AM	2	17246	working on meeting with the customer	\N
536	Missing POS	\N		2023-10-05 11:58:07	2	224	41	4833	Kindly handle	43		1	\N	\N	\N
963	BOXED CASH REGISTER NOT MAINTAINED OR UPDATED	Kindly treat immediately	26-APR-23 11.13.48.898108000 AM	26-APR-23 11.13.48.898108000 AM	2	1070	44	4833	Please review and ensure compliance	43	26-APR-23 12.00.00.000000000 AM	1	19287	\N	\N
964	ATM ISSUED TO WRONG CUSTOMER WITH SAME NAME	Kindly treat immediately	26-APR-23 11.38.20.040314000 AM	26-APR-23 11.38.20.040314000 AM	1	1071	98	4836	Please review and resolved	43	25-APR-23 12.00.00.000000000 AM	2	18093	\N	\N
965	WRONG CHARGES TAKEN	Kindly treat immediately	26-APR-23 11.39.08.940750000 AM	26-APR-23 11.39.08.940750000 AM	1	1072	44	4836	Please review and ensure compliance	43	26-APR-23 12.00.00.000000000 AM	1	17048	\N	\N
1035	LONG OUTSTANDING BALANCE UNATTENDED TO	Urgent issue confirmed	19-JUL-23 08.43.13.476994000 PM	19-JUL-23 08.43.13.476994000 PM	2	1658	44	5509	Please review and revert on this issue	43	12-JUL-23 12.00.00.000000000 AM	2	17542	\N	\N
1095	HANSON	Transaction Details:&nbsp,\n\nTrans. Ref: AAACT230271YPXXCL5&nbsp,\n\nCustomer: 932006&nbsp,\n\nAccount Number: 25798202&nbsp,\n\nTran. Date: 27-JAN-2023&nbsp,\n\nTran. Amt: 4.27&nbsp,\n\nNarration: Credit Interest??CAPITALISE?			2	1718	43	4831	Please review and ensure compliance	43		1	7061	\N	\N
1215	open document	open document	28-SEP-23 09.56.38.904329000 AM	28-SEP-23 09.56.38.904329000 AM	1	1838	44	5509	open document	43	28-SEP-23 12.00.00.000000000 AM	2	17246	\N	\N
599	ACCOUNT CLOSURE INSTRUCTION NOT FILLED	Please treat urgently. Just testing	13-APR-23 08.55.13.429593000 AM	13-APR-23 08.55.13.429593000 AM	1	582	\N	4836	Please review and ensure compliance	182	13-APR-23 12.00.00.000000000 AM	1	18146	\N	\N
601	ACCOUNT OPENED WITH INCOMPLETE DOCUMENTATION	Please treat urgently. Just testing	13-APR-23 08.56.19.946459000 AM	13-APR-23 08.56.19.946459000 AM	1	584	101	4833	Please review and ensure compliance	182	13-APR-23 12.00.00.000000000 AM	2	18173	\N	\N
603	DIFFERENCE BTW BIN CARD BALANCE AND PHYSICAL BALANCE	Clear this always	13-APR-23 08.58.43.485426000 AM	13-APR-23 08.58.43.485426000 AM	1	586	\N	4835	Please review and ensure compliance	182	13-APR-23 12.00.00.000000000 AM	1	17394	\N	\N
657	NO HOP/CASH OFFICER APPROVAL FOR PAYMENT ABOVE TELLER LIMIT	Kindly confirm teller status	17-APR-23 04.03.26.835903000 PM	17-APR-23 04.03.26.835903000 PM	1	640	44	4836	Please review and ensure compliance	43	17-APR-23 12.00.00.000000000 AM	2	17246	\N	\N
676	STORE REGISTER NOT UPDATED	CHECK CARD STATUS	17-APR-23 06.23.54.114507000 PM	17-APR-23 06.23.54.114507000 PM	2	659	44	4833	Please review and ensure compliance	43	17-APR-23 12.00.00.000000000 AM	1	17398	\N	\N
695	STORE REGISTER NOT UPDATED	check	17-APR-23 09.21.25.746676000 PM	17-APR-23 09.21.25.746676000 PM	2	678	44	4833	Please review and ensure compliance	43	17-APR-23 12.00.00.000000000 AM	1	17398	\N	\N
697	NO HOP/CASH OFFICER APPROVAL FOR PAYMENT ABOVE TELLER LIMIT	Link test	17-APR-23 10.02.21.784134000 PM		1	680	44	4833	Please review and ensure compliance	43	17-APR-23 12.00.00.000000000 AM	4	17246	\N	\N
2	NO HOP/CASH OFFICER APPROVAL FOR PAYMENT ABOVE TELLER LIMIT	<p>STORE REGISTER NOT UPDATED LATE</p>	2023-10-05 11:33:38.451095+00	2023-10-05 11:33:38	1	218	104	4835	STORE REGISTER NOT UPDATED LATE	101	03-OCT-2023	1	17246	\N	\N
720	Testing Purpose	Transaction Details:&nbsp,\nTrans. Ref:&nbsp,\nCustomer Credited:&nbsp,\nAccount Credited:&nbsp,\nCustomer Debited:&nbsp,\nAccount Debited:&nbsp,\nTran. Date:&nbsp,\nTran. Amt:&nbsp,\nNarration:	 	2023-10-04 22:00:32.960947+00 	2	703	60	4836	Please review and ensure compliance	43	2023-10-04 22:00:32.960947+00	1	7061	\N	\N
3	\N	test description no 5	\N	2023-10-05 11:34:30	1	219	44	5469		222	\N	2	19716	\N	\N
6	INVALID CHEQUE OBSERVED	<p>INVALID CHEQUE OBSERVED ON WEEKENDS</p>	2023-10-05 14:01:04.225802+00	2023-10-05 14:01:04	1	236	46	4836	INVALID CHEQUE OBSERVED	101	02-OCT-2023	1	17253	<p>Nothing to see here</p>	\N
4	CREDIT CARD CONTRACTORS	<p>CREDIT CARD CONTRACTORS</p>	2023-10-05 12:09:34.610545+00	2023-10-05 12:09:34	1	226	77	4836	CREDIT CARD CONTRACTORS	101	05-SEP-2023	2	17368	<p>noted</p>	\N
855	NO HOP/CASH OFFICER APPROVAL FOR PAYMENT ABOVE TELLER LIMIT	The numbers are not matching the report submitted	24-APR-23 10.23.49.001948000 AM	24-APR-23 10.23.49.001948000 AM	1	938	43	4833	Please review and ensure compliance	101	24-APR-23 12.00.00.000000000 AM	1	17246	<p>working on it</p>	\N
5	DELAYED RESPONSE TO AUDIT  ENQUIRY/REQUEST	<p>Response delayed</p>	2023-10-05 12:20:57.174253+00	2023-10-05 12:20:57	1	229	104	5509	Response delayed	101	02-OCT-2023	1	17049	\N	\N
1	INTEGRITY TEST REGISTER NOT PAGINATED	<p>primary action</p>	2023-10-05 11:24:14.350508+00	\N	1	\N	102	4835	primary action	101	02-OCT-2023	1	17252	\N	\N
495	Undeclared Assets by Teller	Treat as urgent	2023-10-04 22:00:32.960947+00	2023-10-04 22:00:32.960947+00	2	478	101	5469	Please crosscheck and revert	222	2023-10-04 22:00:32.960947+00	2	\N	\N	\N
\.


--
-- Data for Name: compliance_checklist; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.compliance_checklist (id, name, implications, report_type_id, user_id, created_at, status, scope_id, key, timeline, exception_details, exception_status, was_carried_out, recommendation, branches_involved, action_taken, review_description, description, exception_noted, created_by, weightage, product) FROM stdin;
1174	\N	\N	61	\N	03-JUL-2022	1	\N	Vault Cash Registers-Secured, Balanced (check amount in words & figures) & Alterations Signed off, Cash Strapped & Wrappers stamped and signed	Daily on branch visitation. on branch visitation.	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1175	\N	\N	61	\N	03-JUL-2022	1	\N	Vault Movement registers-Duly completed & Alteration duly signed off	Daily on branch visitation. on branch visitation.	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1176	\N	\N	61	\N	03-JUL-2022	1	\N	Vault key/Combination Register-Updated, Combination changed with Due approval when necessary	Once in a week	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1177	\N	\N	61	\N	03-JUL-2022	1	\N	Confirm Cash Seal is not broken if present in the branch during cash movement.	If present in the branch during cash movement.	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1178	\N	\N	61	\N	03-JUL-2022	1	\N	Confirm that wrappers contain clear stamps and Teller signatures	Daily on branch visitation. on branch visitation.	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1179	\N	\N	61	\N	03-JUL-2022	1	\N	Teller Proof Review-Prepared and Balanced with system, Reviewed/signed by teller & Cash officer, Alterations signed off	Daily on branch visitation. on branch visitation.	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1180	\N	\N	61	\N	03-JUL-2022	1	\N	Asset Declaration Register -Updated, Content not absurd	Daily on branch visitation. on branch visitation.	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1181	\N	\N	61	\N	03-JUL-2022	1	\N	Working Tools-Teller Stamp (numbered & registered) / Time Stamp/ UV Lights confirmed ok.	Daily on branch visitation. on branch visitation.	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1182	\N	\N	61	\N	03-JUL-2022	1	\N	Integrity Test-Up to date on all tellers	At least once in a quarter for every branch	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1183	\N	\N	61	\N	03-JUL-2022	1	\N	Boxed Cash - All boxed cash registered (traced to the account) & signed off - Query items beyond 24 hours	Daily on branch visitation. on branch visitation.	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1184	\N	\N	61	\N	03-JUL-2022	1	\N	STC Register-All cash Registered (Traced to their accounts) & signed off, Confirmed that STC agreement approved by RBH is in place -Query items beyond 24hours	Daily on branch visitation. on branch visitation.	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1185	\N	\N	61	\N	03-JUL-2022	1	\N	Review Triplicate Deposit Register and usage in the branch	Daily on branch visitation. on branch visitation.	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1186	\N	\N	61	\N	03-JUL-2022	1	\N	ATM Vault cash count to confirm physical cash and cash balancing	Once in a week	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1187	\N	\N	61	\N	03-JUL-2022	1	\N	ATM Vault review-No cash is warehoused in the faulty Cassette or any where	Once in a week	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1188	\N	\N	61	\N	03-JUL-2022	1	\N	ATM cash Load Register-Duly Updated & Signed off	Once in a week	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1189	\N	\N	61	\N	03-JUL-2022	1	\N	ATM movement register-Duly maintained-Dual control in place	Once in a week	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1190	\N	\N	61	\N	03-JUL-2022	1	\N	ATM Key & Combination register-Dual control & duly signed off	Once in a week	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1173	\N	\N	61	\N	03-JUL-2022	1	\N	Vault cash count to confirm physical cash with system balance	Daily on branch visitation. on branch visitation.	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1218	\N	\N	61	\N	03-JUL-2022	1	\N	Processing of Scanned Instructions from customers without executed e-mail Indemnity.	Daily on branch visitation.	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1219	\N	\N	61	\N	03-JUL-2022	1	\N	General review of Fixed Deposit Files and accounts.	Once in a week	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1220	\N	\N	61	\N	03-JUL-2022	1	\N	Absence of e-mail addresses or No email idemnity on fixed Deposit Accounts for their Certificate.	Once in a week	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1221	\N	\N	61	\N	03-JUL-2022	1	\N	Review of transits, suspense and proxy accounts	Daily on branch visitation.	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1222	\N	\N	61	\N	03-JUL-2022	1	\N	Branch Expense GLs- Review Approval in place, reasonableness and proper classification.	Daily on branch visitation.	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1223	\N	\N	61	\N	03-JUL-2022	1	\N	Unconventional balance in the GL &PL Account	Daily on branch visitation.	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1224	\N	\N	61	\N	03-JUL-2022	1	\N	Prepaid Cash Advance - Review for overdue advances (Above 10 working days)	Once in a week	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1225	\N	\N	61	\N	03-JUL-2022	1	\N	Accounts overdrawn daily	Daily on branch visitation.	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1226	\N	\N	61	\N	03-JUL-2022	1	\N	Unauthorized Overdrawn Accounts	Once in a week	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1227	\N	\N	61	\N	03-JUL-2022	1	\N	Any disparity between interest on system & Offer letter	when disbursining the facility	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1228	\N	\N	61	\N	03-JUL-2022	1	\N	Any Non-compliance with conditions precedent to drawdown prior to facility disbursement?	when reviewing the facility	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1229	\N	\N	61	\N	03-JUL-2022	1	\N	Review of Expired Loan accounts with balances	Once in a week	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1230	\N	\N	61	\N	03-JUL-2022	1	\N	Review of Mirror file for facility booked at Head office	Once in a week	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1231	\N	\N	61	\N	03-JUL-2022	1	\N	Accounts with Incomplete Documentation not on PND.	Once in a week	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1232	\N	\N	61	\N	03-JUL-2022	1	\N	Review customers with multiple accounts	Once in a week	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1233	\N	\N	61	\N	03-JUL-2022	1	\N	Review savings accounts above threashold without KYC	monthly	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1234	\N	\N	61	\N	03-JUL-2022	1	\N	Statement Request File & Register	Once in a week	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1235	\N	\N	61	\N	03-JUL-2022	1	\N	ATM Dispense Error/ Complaint Form	Once in a week	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1236	\N	\N	61	\N	03-JUL-2022	1	\N	E-Banking/ATM Pin Request	Once in a week	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1237	\N	\N	61	\N	03-JUL-2022	1	\N	ATM card issuance Register	Daily on branch visitation.	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1238	\N	\N	61	\N	03-JUL-2022	1	\N	ATM Pin Collection Register	Daily on branch visitation.	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1239	\N	\N	61	\N	03-JUL-2022	1	\N	Review closed accounts including deceased accounts which Estate accounts have been opened for.	Once in a week	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1240	\N	\N	61	\N	03-JUL-2022	1	\N	Total name change file/Register	Review on request	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1241	\N	\N	61	\N	03-JUL-2022	1	\N	Counter cheque request	Daily on branch visitation.	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1242	\N	\N	61	\N	03-JUL-2022	1	\N	E-Service Review	Daily on branch visitation.	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1243	\N	\N	61	\N	03-JUL-2022	1	\N	Cheque Book Issuance & Acknowledgment Review	Once in a week	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1244	\N	\N	61	\N	03-JUL-2022	1	\N	Minutes of Branch Meetings	monthly	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1245	\N	\N	61	\N	03-JUL-2022	1	\N	Standing order instruction	Once in a week	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1246	\N	\N	61	\N	03-JUL-2022	1	\N	Reference Letter	Once in a week	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1247	\N	\N	61	\N	03-JUL-2022	1	\N	Customer Complaint File	Daily on branch visitation.	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1248	\N	\N	61	\N	03-JUL-2022	1	\N	SMS/ Email Alert Modification	Daily on branch visitation.	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1249	\N	\N	61	\N	03-JUL-2022	1	\N	Retrieved Card Register	Once in a week	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
1250	\N	\N	61	\N	03-JUL-2022	1	\N	Stop order/cheque Review	Once in a week	\N	\N	\N	N/A	\N	\N	\N	\N	\N	\N	10	\N
\.


--
-- Data for Name: compliance_report; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.compliance_report (id, report_name, narration, report_type_id, user_id, date_from, date_to, account_number, branch_code, gl_code, status, created_at, "KEY", recommendation, "SCOPE", supervisor_comment, new_created_at) FROM stdin;
4085	CR-2209130019-8025		1	43	2022-09-01	2022-09-30	0003360052 	00001	202008    	completed	13-SEP-22 01.20.08.778303000 AM					\N
4086	CR-2209130201-6761		5	43	2022-09-01	2022-09-30		99999		completed	13-SEP-22 03.01.54.944148000 AM					\N
4087	CR-2209122103-5172		1	\N	2022-06-14	2022-09-12	0003372204 	00001	202008    	completed	12-SEP-22 10.04.02.000000000 PM					\N
4088	CR-2209122109-2508		1	43	2022-06-14	2022-09-12	0003364847 	00001	202008    	completed	12-SEP-22 01.00.00.000000000 AM				Test Comment	\N
4089	CR-2209122117-6788		1	43	2022-06-14	2022-09-12	0003363675 	00001	202008    	completed	12-SEP-22 01.00.00.000000000 AM				Needs urgent attention	\N
4090	CR-2209130200-9428		5	43	2022-09-01	2022-09-30		99999		completed	13-SEP-22 03.00.43.613690000 AM					\N
4091	CR-2209130925-8547		4	43	2022-09-01	2022-09-30				completed	13-SEP-22 10.26.00.024196000 AM					\N
4092	CR-2209131011-4796		1	43	2022-09-01	2022-09-30	0000002700 	00001	202008    	completed	13-SEP-22 11.12.20.056492000 AM					\N
4093	CR-2209131015-5842		1	43	2022-09-01	2022-09-30	0003372204 	00001	202008    	completed	13-SEP-22 11.15.00.000000000 AM				Additional Supervisor Comment	\N
4094	CR-2209131107-8269		61	43	\N	\N	0003369581 	00001	202008    	completed	13-SEP-22 12.08.57.243885000 PM					\N
4095	CR-2209131124-7454		4	43	2022-09-01	2022-09-30	0003372204 	00001	202008    	completed	13-SEP-22 12.24.49.009022000 PM					\N
4096	CR-2209141842-3964		1	43	2022-09-01	2022-09-30	0003372204 	00001	202008    	completed	14-SEP-22 07.42.55.506272000 PM					\N
4097	CR-2209130159-4833		81	43	2022-09-01	2022-09-30		99999		completed	13-SEP-22 02.59.30.167456000 AM					\N
4098	CR-2209131115-1708		1	43	2022-09-01	2022-09-30	0003372204 	00001	202008    	completed	13-SEP-22 12.16.00.000000000 PM				Test Comment	\N
4099	CR-2209281310-8887		1	43	2022-09-01	2022-09-30	4050420001 	00001		completed	28-SEP-22 02.11.40.139043000 PM					\N
4100	CR-2302031147-9009		1	43	2023-02-01	2023-02-28	4050420001 	00001		completed	03-FEB-23 12.49.51.927982000 PM					\N
4101	CR-2209211430-2363		61	43	\N	\N		1		completed	21-SEP-22 03.31.15.970430000 PM					\N
4102	CR-2211131713-2863		5	43	2022-11-01	2022-11-30		99999		completed	13-NOV-22 06.13.59.913851000 PM					\N
4434	CR-2307231452-8941		61	43	2023-07-01	2023-07-31				completed	23-JUL-23 02.53.08.534133000 PM					\N
4505	CR-2308171337-9152		81	43	\N	\N				completed	17-AUG-23 01.37.42.320268000 PM					\N
4530	CR-2308171340-3636		5	43	2023-08-01	2023-08-31				completed	17-AUG-23 01.40.17.450678000 PM					\N
4427	CR-2307231447-3596		5	43	2023-07-01	2023-07-31				completed	23-JUL-23 02.47.32.156300000 PM					\N
4437	CR-2307231454-3985		61	43	\N	\N				completed	23-JUL-23 02.55.08.374121000 PM					\N
4207	CR-2304261327-9029_Daily		61	43	\N	\N				completed	26-APR-23 01.28.25.253944000 PM					\N
4306	CR-2305030731-4430		61	43	2023-05-01	2023-05-31		NG0020006		completed	03-MAY-23 07.31.47.117143000 AM					\N
4365	CR-2305041817-3605		61	43	\N	\N				completed	04-MAY-23 06.18.50.255328000 PM					\N
4565	CR-2309081428-1484		61	11	\N	\N				completed	08-SEP-23 02.29.02.076417000 PM					\N
4425	CR-2307231446-7123		61	43	\N	\N				completed	23-JUL-23 02.46.42.727988000 PM					\N
4106	CR-2303251150-9204		61	43	\N	\N				completed	25-MAR-23 11.51.20.016425000 AM					\N
\N	CR-2309280900-3427	\N	61	43	2023-09-01	2023-09-30		NG0010001		completed	\N	\N	\N	\N	\N	\N
\N	CR-2309280900-3427	\N	61	43	2023-09-01	2023-09-30		NG0010001		completed	\N	\N	\N	\N	\N	\N
\N	CR-2309280900-3427	\N	61	43	2023-09-01	2023-09-30		NG0010001		completed	\N	\N	\N	\N	\N	\N
\N	CR-2309280900-3427	\N	61	43	2023-09-01	2023-09-30		NG0010001		completed	\N	\N	\N	\N	\N	\N
\N	CR-2309280900-3427	\N	61	43	2023-09-01	2023-09-30		NG0010001		completed	\N	\N	\N	\N	\N	\N
\N	CR-2309280900-3427	\N	61	43	2023-09-01	2023-09-30		NG0010001		completed	\N	\N	\N	\N	\N	\N
\N	CR-2309280900-3427	\N	61	43	2023-09-01	2023-09-30		NG0010001		completed	\N	\N	\N	\N	\N	\N
\N	CR-2309280900-3427	\N	61	43	2023-09-01	2023-09-30		NG0010001		completed	\N	\N	\N	\N	\N	\N
\N	CR-2309280900-3427	\N	61	43	2023-09-01	2023-09-30		NG0010001		completed	\N	\N	\N	\N	\N	\N
\N	CR-2309280900-3427	\N	61	43	2023-09-01	2023-09-30		NG0010001		completed	\N	\N	\N	\N	\N	\N
\N	CR-2309280900-3427	\N	61	43	2023-09-01	2023-09-30		NG0010001		completed	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: compliance_report_line; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.compliance_report_line (id, report_id, checklist_id, response, created_at, user_id, recommendation, branches, action_taken, exception_noted, review_desc) FROM stdin;
3632	3617	1575	YES	2022-09-12	\N					
3638	3617	1582	YES	2022-09-12	\N					
3646	3617	1591	YES	2022-09-12	\N					
3651	3617	1596	YES	2022-09-12	\N					
3666	3654	1573	YES	2022-09-12	\N					
3668	3654	1575	YES	2022-09-12	\N					
3682	3654	1590	YES	2022-09-12	\N					
3690	3654	1597	YES	2022-09-12	\N					
3694	3654	1601	YES	2022-09-12	\N					
3698	3654	1605	YES	2022-09-12	\N					
3700	3699	1562	YES	2022-09-12	\N					
3705	3699	1567	NO	2022-09-12	\N					
3709	3699	1571	YES	2022-09-12	\N					
3720	3699	1583	YES	2022-09-12	\N					
3734	3734	1561	YES	2022-09-13	\N					
3737	3734	1564	YES	2022-09-13	\N					
3740	3734	1569	YES	2022-09-13	\N					
3748	3734	1574	YES	2022-09-13	\N					
3750	3734	1577	YES	2022-09-13	\N					
3752	3734	1580	YES	2022-09-13	\N					
3760	3734	1587	YES	2022-09-13	\N					
3764	3762	1624	YES	2022-09-13	\N					
3769	3762	1628	YES	2022-09-13	\N					
3770	3762	1629	YES	2022-09-13	\N					
3771	3762	1631	YES	2022-09-13	\N					
3775	3774	1529	YES	2022-09-13	\N					
3776	3774	1530	NO	2022-09-13	\N					
3778	3774	1533	YES	2022-09-13	\N					
3781	3774	1536	YES	2022-09-13	\N					
3782	3774	1535	YES	2022-09-13	\N					
3789	3774	1543	YES	2022-09-13	\N					
3797	3797	1528	YES	2022-09-13	\N					
3798	3797	1529	YES	2022-09-13	\N					
3799	3797	1533	YES	2022-09-13	\N					
3803	3797	1534	YES	2022-09-13	\N					
3817	3813	1565	YES	2022-09-13	\N					
3826	3813	1576	NO	2022-09-13	\N					
3840	3835	1567	YES	2022-09-13	\N					
3849	3835	1575	YES	2022-09-13	\N					
3856	3852	1180	YES	2022-09-13	\N	N/A				
3864	3852	1189	YES	2022-09-13	\N	N/A				
3866	3852	1181	YES	2022-09-13	\N	N/A				
3870	3852	1184	YES	2022-09-13	\N	N/A				
3874	3852	1224	YES	2022-09-13	\N	N/A				
3876	3852	1227	YES	2022-09-13	\N	N/A				
3886	3852	1234	YES	2022-09-13	\N	N/A				
3887	3852	1225	YES	2022-09-13	\N	N/A				
3890	3852	1238	YES	2022-09-13	\N	N/A				
3899	3892	1568	YES	2022-09-13	\N					
3901	3892	1571	YES	2022-09-13	\N					
3910	3892	1579	YES	2022-09-13	\N					
3916	3892	1584	YES	2022-09-13	\N					
3921	3892	1590	YES	2022-09-13	\N					
3930	3926	1748	NO	2022-09-13	\N					
3937	3926	1760		2022-09-13	\N					
3943	3926	1721		2022-09-13	\N					
3948	3926	1747		2022-09-13	\N					
3975	3974	1563	YES	2022-09-14	\N					
3977	3974	1565	YES	2022-09-14	\N					
3981	3974	1568	YES	2022-09-14	\N					
3984	3974	1571	YES	2022-09-14	\N					
3989	3974	1576	YES	2022-09-14	\N					
3993	3974	1580	YES	2022-09-14	\N					
3996	3974	1583	YES	2022-09-14	\N					
4000	3974	1587	YES	2022-09-14	\N					
4002	3974	1589	YES	2022-09-14	\N					
4011	3974	1598	YES	2022-09-14	\N					
4013	3974	1600	YES	2022-09-14	\N					
4016	3974	1603	YES	2022-09-14	\N					
3617	3617	1561	YES	2022-09-12	\N					
3618	3617	1563	YES	2022-09-12	\N					
3619	3617	1562	YES	2022-09-12	\N					
3620	3617	1565	YES	2022-09-12	\N					
3630	3617	1574	YES	2022-09-12	\N					
3631	3617	1576	YES	2022-09-12	\N					
3635	3617	1579	YES	2022-09-12	\N					
3636	3617	1580	YES	2022-09-12	\N					
3640	3617	1584	YES	2022-09-12	\N					
3642	3617	1586	YES	2022-09-12	\N					
3643	3617	1587	YES	2022-09-12	\N					
3644	3617	1588	YES	2022-09-12	\N					
3647	3617	1590	YES	2022-09-12	\N					
3649	3617	1593	YES	2022-09-12	\N					
3652	3617	1595	YES	2022-09-12	\N					
3654	3654	1561	YES	2022-09-12	\N					
3655	3654	1562	YES	2022-09-12	\N					
3656	3654	1563	YES	2022-09-12	\N					
3659	3654	1566	YES	2022-09-12	\N					
3664	3654	1571	YES	2022-09-12	\N					
3665	3654	1572	YES	2022-09-12	\N					
3670	3654	1577	YES	2022-09-12	\N					
3672	3654	1579	YES	2022-09-12	\N					
3673	3654	1580	YES	2022-09-12	\N					
3674	3654	1581	YES	2022-09-12	\N					
3677	3654	1584	YES	2022-09-12	\N					
3678	3654	1585	YES	2022-09-12	\N					
3679	3654	1586	YES	2022-09-12	\N					
3681	3654	1588	YES	2022-09-12	\N					
3683	3654	1589	YES	2022-09-12	\N					
3685	3654	1592	YES	2022-09-12	\N					
3686	3654	1594	YES	2022-09-12	\N					
3691	3654	1598	YES	2022-09-12	\N					
3692	3654	1600	YES	2022-09-12	\N					
3693	3654	1599	YES	2022-09-12	\N					
3695	3654	1602	YES	2022-09-12	\N					
3699	3699	1561	NO	2022-09-12	\N					
3701	3699	1563	YES	2022-09-12	\N					
3702	3699	1564	YES	2022-09-12	\N					
3704	3699	1566	YES	2022-09-12	\N					
3706	3699	1568	YES	2022-09-12	\N					
3710	3699	1572	YES	2022-09-12	\N					
3714	3699	1576	YES	2022-09-12	\N					
3717	3699	1579	YES	2022-09-12	\N					
3718	3699	1580	YES	2022-09-12	\N					
3721	3699	1582	YES	2022-09-12	\N					
3736	3734	1563	YES	2022-09-13	\N					
3742	3734	1567	YES	2022-09-13	\N					
3744	3734	1571	YES	2022-09-13	\N					
3747	3734	1575	YES	2022-09-13	\N					
3751	3734	1578	NO	2022-09-13	\N					
3754	3734	1581	YES	2022-09-13	\N					
3755	3734	1582	YES	2022-09-13	\N					
3757	3734	1584	YES	2022-09-13	\N					
3759	3734	1586	NO	2022-09-13	\N					
3761	3734	1588	YES	2022-09-13	\N					
3763	3762	1621	YES	2022-09-13	\N					
3766	3762	1625	YES	2022-09-13	\N					
3767	3762	1626	YES	2022-09-13	\N					
3772	3762	1630	YES	2022-09-13	\N					
3773	3762	1632	YES	2022-09-13	\N					
3774	3774	1528	NO	2022-09-13	\N					
3777	3774	1531	YES	2022-09-13	\N					
3779	3774	1532	YES	2022-09-13	\N					
3780	3774	1534	YES	2022-09-13	\N					
3783	3774	1537	YES	2022-09-13	\N					
3786	3774	1538	YES	2022-09-13	\N					
3787	3774	1541	YES	2022-09-13	\N					
3788	3774	1542	YES	2022-09-13	\N					
3791	3774	1545	YES	2022-09-13	\N					
3795	3774	1549	YES	2022-09-13	\N					
3796	3774	1550	YES	2022-09-13	\N					
3800	3797	1532	YES	2022-09-13	\N					
3801	3797	1530	YES	2022-09-13	\N					
3804	3804	1758		2022-09-13	\N					
3807	3804	1759		2022-09-13	\N					
3808	3804	1743		2022-09-13	\N					
3810	3804	1723		2022-09-13	\N					
3811	3804	1761		2022-09-13	\N					
3813	3813	1561	YES	2022-09-13	\N					
3815	3813	1564	YES	2022-09-13	\N					
3822	3813	1568	YES	2022-09-13	\N					
3829	3813	1577	YES	2022-09-13	\N					
3831	3813	1579	NO	2022-09-13	\N					
3833	3813	1581	YES	2022-09-13	\N					
3835	3835	1561	NO	2022-09-13	\N					
3838	3835	1564	YES	2022-09-13	\N					
3843	3835	1569	YES	2022-09-13	\N					
3846	3835	1572	YES	2022-09-13	\N					
3851	3835	1576	YES	2022-09-13	\N					
3852	3852	1178	YES	2022-09-13	\N	N/A				
3854	3852	1177	YES	2022-09-13	\N	N/A				
3855	3852	1174	NO	2022-09-13	\N	TEST				
3859	3852	1179	YES	2022-09-13	\N	N/A				
3861	3852	1186	YES	2022-09-13	\N	N/A				
3863	3852	1175	YES	2022-09-13	\N	TES2				
3868	3852	1219	YES	2022-09-13	\N	N/A				
3869	3852	1220	YES	2022-09-13	\N	N/A				
3872	3852	1221	YES	2022-09-13	\N	N/A				
3875	3852	1226	YES	2022-09-13	\N	N/A				
3877	3852	1228	YES	2022-09-13	\N	N/A				
3878	3852	1229	YES	2022-09-13	\N	N/A				
3881	3852	1230	YES	2022-09-13	\N	N/A				
3882	3852	1231	YES	2022-09-13	\N	N/A				
3883	3852	1232	YES	2022-09-13	\N	N/A				
3884	3852	1233	YES	2022-09-13	\N	N/A				
3891	3852	1239	YES	2022-09-13	\N	N/A				
3896	3892	1565	YES	2022-09-13	\N					
3897	3892	1567	YES	2022-09-13	\N					
3902	3892	1572	YES	2022-09-13	\N					
3906	3892	1575	YES	2022-09-13	\N					
3907	3892	1577	YES	2022-09-13	\N					
3908	3892	1569	NO	2022-09-13	\N					
3912	3892	1583	YES	2022-09-13	\N					
3915	3892	1585	YES	2022-09-13	\N					
3917	3892	1586	YES	2022-09-13	\N					
3918	3892	1587	YES	2022-09-13	\N					
3920	3892	1591	YES	2022-09-13	\N					
3922	3892	1592	YES	2022-09-13	\N					
3924	3892	1594	YES	2022-09-13	\N					
3926	3926	1761		2022-09-13	\N					
3927	3926	1759		2022-09-13	\N					
3931	3926	1742		2022-09-13	\N					
3932	3926	1743		2022-09-13	\N					
3933	3926	1723		2022-09-13	\N					
3935	3926	1751		2022-09-13	\N					
3940	3926	1767		2022-09-13	\N					
3942	3926	1769		2022-09-13	\N					
3944	3926	1744		2022-09-13	\N					
3946	3926	1746		2022-09-13	\N					
3949	3926	1750		2022-09-13	\N					
3950	3926	1755		2022-09-13	\N					
3952	3926	1757		2022-09-13	\N					
3955	3926	1766		2022-09-13	\N					
3957	3926	1770		2022-09-13	\N					
3958	3926	1763		2022-09-13	\N					
3974	3974	1561	NO	2022-09-14	\N					
3978	3974	1566	YES	2022-09-14	\N					
3979	3974	1564	YES	2022-09-14	\N					
3980	3974	1567	YES	2022-09-14	\N					
3982	3974	1569	YES	2022-09-14	\N					
3986	3974	1572	YES	2022-09-14	\N					
3990	3974	1577	YES	2022-09-14	\N					
3992	3974	1579	YES	2022-09-14	\N					
3995	3974	1581	YES	2022-09-14	\N					
3998	3974	1585	YES	2022-09-14	\N					
3999	3974	1586	YES	2022-09-14	\N					
4003	3974	1590	YES	2022-09-14	\N					
4005	3974	1592	YES	2022-09-14	\N					
4007	3974	1594	YES	2022-09-14	\N					
4010	3974	1597	YES	2022-09-14	\N					
4012	3974	1599	YES	2022-09-14	\N					
4017	3974	1604	YES	2022-09-14	\N					
3621	3617	1564	YES	2022-09-12	\N					
3623	3617	1567	YES	2022-09-12	\N					
3625	3617	1569	YES	2022-09-12	\N					
3626	3617	1570	YES	2022-09-12	\N					
3627	3617	1571	YES	2022-09-12	\N					
3628	3617	1572	YES	2022-09-12	\N					
3633	3617	1577	YES	2022-09-12	\N					
3637	3617	1581	YES	2022-09-12	\N					
3639	3617	1583	YES	2022-09-12	\N					
3641	3617	1585	YES	2022-09-12	\N					
3648	3617	1592	YES	2022-09-12	\N					
3653	3617	1597	YES	2022-09-12	\N					
3657	3654	1564	YES	2022-09-12	\N					
3658	3654	1565	YES	2022-09-12	\N					
3661	3654	1567	YES	2022-09-12	\N					
3662	3654	1569	YES	2022-09-12	\N					
3663	3654	1570	YES	2022-09-12	\N					
3667	3654	1574	YES	2022-09-12	\N					
3669	3654	1576	YES	2022-09-12	\N					
3675	3654	1582	YES	2022-09-12	\N					
3676	3654	1583	YES	2022-09-12	\N					
3684	3654	1591	YES	2022-09-12	\N					
3334	3348	1174	NO	2022-09-21	\N	N/A	Abuja			
3338	3348	1176	YES	2022-09-21	\N	N/A				
3339	3348	1179	YES	2022-09-21	\N	N/A				
3340	3348	1180	YES	2022-09-21	\N	N/A				
3342	3348	1182	YES	2022-09-21	\N	N/A				
4054	4106	1175	YES	2023-03-25	\N	N/A				
4056	4106	1177	YES	2023-03-25	\N	N/A				
4084	4106	1231	YES	2023-03-25	\N	N/A				
4099	4106	1246	YES	2023-03-25	\N	N/A				
4100	4106	1247	YES	2023-03-25	\N	N/A				
4102	4106	1249	YES	2023-03-25	\N	N/A				
4106	4106	1253	YES	2023-03-25	\N	N/A				
4108	4106	1255	YES	2023-03-25	\N	N/A				
4112	4106	1193	YES	2023-03-25	\N	N/A				
4117	4106	1199	YES	2023-03-25	\N	N/A				
4121	4106	1202	YES	2023-03-25	\N	N/A				
4125	4106	1206	YES	2023-03-25	\N	N/A				
4135	4106	1216	YES	2023-03-25	\N	N/A				
4138	4106	1259	YES	2023-03-25	\N	N/A				
4140	4106	1260	YES	2023-03-25	\N	N/A				
4174	4207	1220	Yes	2023-04-26	\N	N/A				
4184	4207	1231	Yes	2023-04-26	\N	N/A				
4187	4207	1234	Yes	2023-04-26	\N	N/A				
4192	4207	1240	Yes	2023-04-26	\N	N/A				
4197	4207	1244	Yes	2023-04-26	\N	N/A				
4202	4207	1252	Yes	2023-04-26	\N	N/A				
4207	4207	1217	Yes	2023-04-26	\N	N/A				
4211	4207	1192	Yes	2023-04-26	\N	N/A				
4217	4207	1197	Yes	2023-04-26	\N	N/A				
4219	4207	1200	Yes	2023-04-26	\N	N/A				
4227	4207	1210	Yes	2023-04-26	\N	N/A				
4231	4207	1211	Yes	2023-04-26	\N	N/A				
4236	4207	1258	Yes	2023-04-26	\N	N/A				
4238	4207	1259	Yes	2023-04-26	\N	N/A				
4253	4306	1174	Yes	2023-05-03	\N	N/A				
4254	4306	1175	Yes	2023-05-03	\N	N/A				
4255	4306	1176	Yes	2023-05-03	\N	N/A				
4263	4306	1184	Yes	2023-05-03	\N	N/A				
4265	4306	1186	Yes	2023-05-03	\N	N/A				
4274	4306	1221	Yes	2023-05-03	\N	N/A				
4278	4306	1225	Yes	2023-05-03	\N	N/A				
4282	4306	1229	Yes	2023-05-03	\N	N/A				
4289	4306	1235	Yes	2023-05-03	\N	N/A				
4299	4306	1245	Yes	2023-05-03	\N	N/A				
4301	4306	1248	Yes	2023-05-03	\N	N/A				
4313	4365	1174	Yes	2023-05-04	\N	N/A				
4317	4365	1176	Yes	2023-05-04	\N	N/A				
4319	4365	1182	Yes	2023-05-04	\N	N/A				
4322	4365	1183	Yes	2023-05-04	\N	N/A				
4324	4365	1186	Yes	2023-05-04	\N	N/A				
4326	4365	1187	Yes	2023-05-04	\N	N/A				
4329	4365	1190	Yes	2023-05-04	\N	N/A				
4330	4365	1218	Yes	2023-05-04	\N	N/A				
4331	4365	1173	Yes	2023-05-04	\N	N/A				
4336	4365	1223	Yes	2023-05-04	\N	N/A				
4337	4365	1225	Yes	2023-05-04	\N	N/A				
4338	4365	1224	Yes	2023-05-04	\N	N/A				
4344	4365	1231	Yes	2023-05-04	\N	N/A				
4345	4365	1232	Yes	2023-05-04	\N	N/A				
4352	4365	1239	Yes	2023-05-04	\N	N/A				
4359	4365	1246	Yes	2023-05-04	\N	N/A				
4360	4365	1248	Yes	2023-05-04	\N	N/A				
4373	4425	1174	Yes	2023-07-23	\N	N/A				
4374	4425	1175	Yes	2023-07-23	\N	N/A				
4376	4427	1548	Yes	2023-07-23	\N					
4388	4437	1177	Yes	2023-07-23	\N	N/A				
4389	4437	1178	Yes	2023-07-23	\N	N/A				
4397	4437	1185	Yes	2023-07-23	\N	N/A				
4399	4437	1188	Yes	2023-07-23	\N	N/A				
4404	4437	1222	Yes	2023-07-23	\N	N/A				
4405	4437	1219	Yes	2023-07-23	\N	N/A				
4408	4437	1223	Yes	2023-07-23	\N	N/A				
4410	4437	1225	Yes	2023-07-23	\N	N/A				
4411	4437	1227	Yes	2023-07-23	\N	N/A				
4413	4437	1229	Yes	2023-07-23	\N	N/A				
4416	4437	1231	Yes	2023-07-23	\N	N/A				
4420	4437	1236	Yes	2023-07-23	\N	N/A				
4421	4437	1234	Yes	2023-07-23	\N	N/A				
4426	4437	1242	Yes	2023-07-23	\N	N/A				
4427	4437	1241	Yes	2023-07-23	\N	N/A				
4431	4437	1247	Yes	2023-07-23	\N	N/A				
4433	4437	1246	Yes	2023-07-23	\N	N/A				
4453	4505	1621	Yes	2023-08-17	\N					
4456	4505	1641	Yes	2023-08-17	\N					
4457	4505	1639	Yes	2023-08-17	\N					
4460	4505	1645	Yes	2023-08-17	\N					
4464	4505	1653	Yes	2023-08-17	\N					
4465	4505	1655	Yes	2023-08-17	\N					
4469	4505	1663	Yes	2023-08-17	\N					
4472	4505	1667	Yes	2023-08-17	\N					
4473	4505	1671	Yes	2023-08-17	\N					
4480	4530	1551	Yes	2023-08-17	\N					
4483	4530	1547	Yes	2023-08-17	\N					
4484	4530	1553	Yes	2023-08-17	\N					
4486	4530	1554	Yes	2023-08-17	\N					
4487	4530	1556	Yes	2023-08-17	\N					
4490	4530	1559	Yes	2023-08-17	\N					
4491	4530	1528	Yes	2023-08-17	\N					
4493	4530	1529	Yes	2023-08-17	\N					
4495	4530	1533	Yes	2023-08-17	\N					
4498	4530	1536	Yes	2023-08-17	\N					
4499	4530	1535	Yes	2023-08-17	\N					
4501	4530	1538	Yes	2023-08-17	\N					
4504	4530	1541	Yes	2023-08-17	\N					
4508	4530	1542	Yes	2023-08-17	\N					
4509	4530	1544	Yes	2023-08-17	\N					
3345	3348	1186	YES	2022-09-21	\N	N/A				
3349	3348	1189	YES	2022-09-21	\N	N/A				
3353	3348	1219	YES	2022-09-21	\N	N/A				
3354	3348	1222	YES	2022-09-21	\N	N/A				
3358	3348	1223	YES	2022-09-21	\N	N/A				
3360	3348	1227	YES	2022-09-21	\N	N/A				
3363	3348	1229	YES	2022-09-21	\N	N/A				
3369	3348	1234	YES	2022-09-21	\N	N/A				
3372	3348	1237	YES	2022-09-21	\N	N/A				
3373	3348	1241	YES	2022-09-21	\N	N/A				
3376	3348	1242	YES	2022-09-21	\N	N/A				
3378	3348	1243	YES	2022-09-21	\N	N/A				
3381	3348	1246	YES	2022-09-21	\N	N/A				
3389	3398	1566	YES	2022-09-28	\N					
3396	3398	1573	YES	2022-09-28	\N					
3404	3398	1580	YES	2022-09-28	\N					
3408	3398	1585	YES	2022-09-28	\N					
3425	3398	1602	YES	2022-09-28	\N					
3427	3398	1603	YES	2022-09-28	\N					
3557	3589	1528	YES	2022-11-13	\N					
3559	3589	1533	YES	2022-11-13	\N					
3569	3589	1540	YES	2022-11-13	\N					
3580	3589	1552	YES	2022-11-13	\N					
3588	3589	1560	YES	2022-11-13	\N					
3723	3754	1887	YES	2023-02-03	\N					
3726	3754	1888	YES	2023-02-03	\N					
3729	3754	1892	YES	2023-02-03	\N					
3731	3754	1894	YES	2023-02-03	\N					
3732	3754	1895	YES	2023-02-03	\N					
3688	3654	1595	YES	2022-09-12	\N					
3689	3654	1596	YES	2022-09-12	\N					
3696	3654	1603	YES	2022-09-12	\N					
3703	3699	1565	YES	2022-09-12	\N					
3707	3699	1569	YES	2022-09-12	\N					
3708	3699	1570	YES	2022-09-12	\N					
3711	3699	1573	YES	2022-09-12	\N					
3713	3699	1575	YES	2022-09-12	\N					
3715	3699	1577	YES	2022-09-12	\N					
3716	3699	1578	YES	2022-09-12	\N					
3719	3699	1581	YES	2022-09-12	\N					
3735	3734	1562	YES	2022-09-13	\N					
3738	3734	1566	NO	2022-09-13	\N					
3741	3734	1568	YES	2022-09-13	\N					
3743	3734	1570	YES	2022-09-13	\N					
3746	3734	1573	YES	2022-09-13	\N					
3749	3734	1576	YES	2022-09-13	\N					
3758	3734	1585	YES	2022-09-13	\N					
3768	3762	1627	YES	2022-09-13	\N					
3792	3774	1546	YES	2022-09-13	\N					
3819	3813	1566	YES	2022-09-13	\N					
3823	3813	1571	YES	2022-09-13	\N					
3825	3813	1573	YES	2022-09-13	\N					
3827	3813	1574	YES	2022-09-13	\N					
3828	3813	1575	YES	2022-09-13	\N					
3834	3813	1582	YES	2022-09-13	\N					
3836	3835	1562	YES	2022-09-13	\N					
3837	3835	1563	YES	2022-09-13	\N					
3839	3835	1568	YES	2022-09-13	\N					
3841	3835	1566	YES	2022-09-13	\N					
3844	3835	1570	YES	2022-09-13	\N					
3845	3835	1571	YES	2022-09-13	\N					
3847	3835	1573	YES	2022-09-13	\N					
3848	3835	1574	YES	2022-09-13	\N					
3853	3852	1176	YES	2022-09-13	\N	N/A				
3858	3852	1183	YES	2022-09-13	\N	N/A				
3862	3852	1187	YES	2022-09-13	\N	N/A				
3867	3852	1173	YES	2022-09-13	\N	N/A				
3871	3852	1222	YES	2022-09-13	\N	N/A				
3880	3852	1218	YES	2022-09-13	\N	N/A				
3885	3852	1235	YES	2022-09-13	\N	N/A				
3888	3852	1237	YES	2022-09-13	\N	N/A				
3894	3892	1563	NO	2022-09-13	\N					
3898	3892	1566	NO	2022-09-13	\N					
3900	3892	1570	YES	2022-09-13	\N					
3904	3892	1573	YES	2022-09-13	\N					
3905	3892	1576	YES	2022-09-13	\N					
3911	3892	1580	YES	2022-09-13	\N					
3913	3892	1582	YES	2022-09-13	\N					
3919	3892	1588	YES	2022-09-13	\N					
3929	3926	1758		2022-09-13	\N					
3934	3926	1749		2022-09-13	\N					
3938	3926	1765		2022-09-13	\N					
3939	3926	1764		2022-09-13	\N					
3941	3926	1768		2022-09-13	\N					
3947	3926	1745		2022-09-13	\N					
3951	3926	1754		2022-09-13	\N					
3954	3926	1762		2022-09-13	\N					
3976	3974	1562	YES	2022-09-14	\N					
3983	3974	1570	YES	2022-09-14	\N					
3985	3974	1573	YES	2022-09-14	\N					
3987	3974	1574	YES	2022-09-14	\N					
3988	3974	1575	YES	2022-09-14	\N					
3991	3974	1578	YES	2022-09-14	\N					
3994	3974	1582	YES	2022-09-14	\N					
3997	3974	1584	YES	2022-09-14	\N					
4001	3974	1588	YES	2022-09-14	\N					
4004	3974	1591	YES	2022-09-14	\N					
4006	3974	1593	YES	2022-09-14	\N					
4008	3974	1595	YES	2022-09-14	\N					
4009	3974	1596	YES	2022-09-14	\N					
4014	3974	1601	YES	2022-09-14	\N					
4015	3974	1602	YES	2022-09-14	\N					
3622	3617	1566	NO	2022-09-12	\N					
3624	3617	1568	YES	2022-09-12	\N					
3629	3617	1573	YES	2022-09-12	\N					
3634	3617	1578	YES	2022-09-12	\N					
3645	3617	1589	YES	2022-09-12	\N					
3650	3617	1594	YES	2022-09-12	\N					
3660	3654	1568	YES	2022-09-12	\N					
3671	3654	1578	YES	2022-09-12	\N					
3680	3654	1587	YES	2022-09-12	\N					
3687	3654	1593	YES	2022-09-12	\N					
3697	3654	1604	YES	2022-09-12	\N					
3712	3699	1574	YES	2022-09-12	\N					
3739	3734	1565	YES	2022-09-13	\N					
3745	3734	1572	NO	2022-09-13	\N					
3753	3734	1579	YES	2022-09-13	\N					
3785	3774	1539	YES	2022-09-13	\N					
3793	3774	1547	YES	2022-09-13	\N					
3802	3797	1531	YES	2022-09-13	\N					
3806	3804	1753		2022-09-13	\N					
3809	3804	1742		2022-09-13	\N					
3812	3804	1749		2022-09-13	\N					
3816	3813	1563	YES	2022-09-13	\N					
3818	3813	1567	YES	2022-09-13	\N					
3821	3813	1570	NO	2022-09-13	\N					
3824	3813	1572	NO	2022-09-13	\N					
3830	3813	1578	YES	2022-09-13	\N					
3842	3835	1565	YES	2022-09-13	\N					
3756	3734	1583	YES	2022-09-13	\N					
3762	3762	1622	YES	2022-09-13	\N					
3765	3762	1623	YES	2022-09-13	\N					
3784	3774	1540	YES	2022-09-13	\N					
3790	3774	1544	YES	2022-09-13	\N					
3794	3774	1548	YES	2022-09-13	\N					
3805	3804	1748		2022-09-13	\N					
3814	3813	1562	YES	2022-09-13	\N					
3820	3813	1569	YES	2022-09-13	\N					
3832	3813	1580	YES	2022-09-13	\N					
3850	3835	1577	YES	2022-09-13	\N					
3857	3852	1182	YES	2022-09-13	\N	N/A				
3860	3852	1185	YES	2022-09-13	\N	N/A				
3865	3852	1188	YES	2022-09-13	\N	N/A				
3873	3852	1223	YES	2022-09-13	\N	N/A				
3879	3852	1190	YES	2022-09-13	\N	N/A				
3889	3852	1236	YES	2022-09-13	\N	N/A				
3892	3892	1561	YES	2022-09-13	\N			PLEASE REVIEW		
3893	3892	1562	YES	2022-09-13	\N					
3895	3892	1564	YES	2022-09-13	\N					
3903	3892	1574	YES	2022-09-13	\N					
3909	3892	1578	YES	2022-09-13	\N					
3914	3892	1581	YES	2022-09-13	\N					
3923	3892	1593	YES	2022-09-13	\N					
3925	3892	1589	YES	2022-09-13	\N					
3928	3926	1753	NO	2022-09-13	\N					
3936	3926	1752		2022-09-13	\N					
3945	3926	1741		2022-09-13	\N					
3953	3926	1756		2022-09-13	\N					
3956	3926	1771		2022-09-13	\N					
3386	3398	1565	YES	2022-09-28	\N					
3390	3398	1567	YES	2022-09-28	\N					
3393	3398	1570	YES	2022-09-28	\N					
3401	3398	1578	YES	2022-09-28	\N					
3407	3398	1583	YES	2022-09-28	\N					
3410	3398	1587	YES	2022-09-28	\N					
3413	3398	1590	YES	2022-09-28	\N					
3417	3398	1594	YES	2022-09-28	\N					
3420	3398	1597	YES	2022-09-28	\N					
3423	3398	1600	YES	2022-09-28	\N					
3426	3398	1604	YES	2022-09-28	\N					
3556	3589	1530	YES	2022-11-13	\N					
3562	3589	1534	YES	2022-11-13	\N					
3563	3589	1538	YES	2022-11-13	\N					
3565	3589	1531	YES	2022-11-13	\N					
3566	3589	1537	YES	2022-11-13	\N					
3567	3589	1541	YES	2022-11-13	\N					
3568	3589	1536	YES	2022-11-13	\N					
3570	3589	1542	YES	2022-11-13	\N					
3572	3589	1543	YES	2022-11-13	\N					
3573	3589	1545	YES	2022-11-13	\N					
3574	3589	1546	YES	2022-11-13	\N					
3576	3589	1547	YES	2022-11-13	\N					
3577	3589	1549	YES	2022-11-13	\N					
3583	3589	1555	YES	2022-11-13	\N					
3584	3589	1557	YES	2022-11-13	\N					
3585	3589	1558	YES	2022-11-13	\N					
3722	3754	1886	YES	2023-02-03	\N					
3724	3754	1891	YES	2023-02-03	\N					
3727	3754	1889	YES	2023-02-03	\N					
3335	3348	1175	YES	2022-09-21	\N	N/A				
3336	3348	1177	YES	2022-09-21	\N	N/A				
3337	3348	1178	YES	2022-09-21	\N	N/A				
3341	3348	1181	YES	2022-09-21	\N	N/A				
3343	3348	1183	YES	2022-09-21	\N	N/A				
3344	3348	1184	YES	2022-09-21	\N	N/A				
3346	3348	1185	YES	2022-09-21	\N	N/A				
3347	3348	1188	YES	2022-09-21	\N	N/A				
3348	3348	1187	YES	2022-09-21	\N	N/A				
3350	3348	1173	YES	2022-09-21	\N	N/A				
3351	3348	1190	YES	2022-09-21	\N	N/A				
3352	3348	1218	YES	2022-09-21	\N	N/A				
3355	3348	1221	YES	2022-09-21	\N	N/A				
3356	3348	1220	YES	2022-09-21	\N	N/A				
3357	3348	1224	YES	2022-09-21	\N	N/A				
3359	3348	1225	YES	2022-09-21	\N	N/A				
3361	3348	1226	YES	2022-09-21	\N	N/A				
3362	3348	1228	YES	2022-09-21	\N	N/A				
3364	3348	1231	YES	2022-09-21	\N	N/A				
3365	3348	1230	YES	2022-09-21	\N	N/A				
3367	3348	1235	YES	2022-09-21	\N	N/A				
3368	3348	1233	YES	2022-09-21	\N	N/A				
3370	3348	1236	YES	2022-09-21	\N	N/A				
3371	3348	1238	YES	2022-09-21	\N	N/A				
3374	3348	1240	YES	2022-09-21	\N	N/A				
3377	3348	1244	YES	2022-09-21	\N	N/A				
3379	3348	1247	YES	2022-09-21	\N	N/A				
3380	3348	1245	YES	2022-09-21	\N	N/A				
3383	3348	1249	YES	2022-09-21	\N	N/A				
3384	3398	1561	NO	2022-09-28	\N					
3385	3398	1564	NO	2022-09-28	\N					
3391	3398	1568	YES	2022-09-28	\N					
3392	3398	1569	YES	2022-09-28	\N					
3395	3398	1572	YES	2022-09-28	\N					
3397	3398	1574	YES	2022-09-28	\N					
3399	3398	1575	YES	2022-09-28	\N					
3400	3398	1577	YES	2022-09-28	\N					
3402	3398	1579	YES	2022-09-28	\N					
3405	3398	1582	YES	2022-09-28	\N					
3406	3398	1584	YES	2022-09-28	\N					
3409	3398	1586	YES	2022-09-28	\N					
3411	3398	1588	YES	2022-09-28	\N					
3412	3398	1589	YES	2022-09-28	\N					
3414	3398	1591	YES	2022-09-28	\N					
3415	3398	1592	YES	2022-09-28	\N					
3416	3398	1593	YES	2022-09-28	\N					
3418	3398	1595	YES	2022-09-28	\N					
3419	3398	1596	YES	2022-09-28	\N					
3421	3398	1598	YES	2022-09-28	\N					
3422	3398	1599	YES	2022-09-28	\N					
3424	3398	1601	YES	2022-09-28	\N					
3560	3589	1532	YES	2022-11-13	\N					
3579	3589	1551	YES	2022-11-13	\N					
3587	3589	1559	YES	2022-11-13	\N					
3725	3754	1877	YES	2023-02-03	\N					
3730	3754	1893	YES	2023-02-03	\N					
3733	3754	1896	YES	2023-02-03	\N					
3366	3348	1232	YES	2022-09-21	\N	N/A				
3375	3348	1239	YES	2022-09-21	\N	N/A				
3382	3348	1248	YES	2022-09-21	\N	N/A				
3387	3398	1562	NO	2022-09-28	\N					
3388	3398	1563	YES	2022-09-28	\N					
3394	3398	1571	YES	2022-09-28	\N					
3398	3398	1576	YES	2022-09-28	\N					
3403	3398	1581	YES	2022-09-28	\N					
3428	3398	1605	YES	2022-09-28	\N					
3558	3589	1529	YES	2022-11-13	\N					
3561	3589	1535	YES	2022-11-13	\N					
3564	3589	1539	YES	2022-11-13	\N					
3571	3589	1544	YES	2022-11-13	\N					
3575	3589	1548	YES	2022-11-13	\N					
3578	3589	1550	YES	2022-11-13	\N					
3581	3589	1553	YES	2022-11-13	\N					
3582	3589	1554	YES	2022-11-13	\N					
3586	3589	1556	YES	2022-11-13	\N					
3728	3754	1890	YES	2023-02-03	\N					
4053	4106	1176	YES	2023-03-25	\N	N/A				
4055	4106	1174	YES	2023-03-25	\N	N/A				
4059	4106	1180	YES	2023-03-25	\N	N/A				
4060	4106	1182	YES	2023-03-25	\N	N/A				
4066	4106	1187	YES	2023-03-25	\N	N/A				
4072	4106	1219	YES	2023-03-25	\N	N/A				
4077	4106	1223	YES	2023-03-25	\N	N/A				
4080	4106	1227	YES	2023-03-25	\N	N/A				
4083	4106	1229	YES	2023-03-25	\N	N/A				
4085	4106	1232	YES	2023-03-25	\N	N/A				
4087	4106	1234	YES	2023-03-25	\N	N/A				
4090	4106	1237	YES	2023-03-25	\N	N/A				
4091	4106	1238	YES	2023-03-25	\N	N/A				
4093	4106	1240	YES	2023-03-25	\N	N/A				
4095	4106	1243	YES	2023-03-25	\N	N/A				
4096	4106	1241	YES	2023-03-25	\N	N/A				
4101	4106	1248	YES	2023-03-25	\N	N/A				
4104	4106	1251	YES	2023-03-25	\N	N/A				
4105	4106	1252	YES	2023-03-25	\N	N/A				
4107	4106	1254	YES	2023-03-25	\N	N/A				
4109	4106	1217	YES	2023-03-25	\N	N/A				
4111	4106	1192	YES	2023-03-25	\N	N/A				
4114	4106	1195	YES	2023-03-25	\N	N/A				
4116	4106	1197	YES	2023-03-25	\N	N/A				
4118	4106	1198	YES	2023-03-25	\N	N/A				
4120	4106	1201	YES	2023-03-25	\N	N/A				
4122	4106	1203	YES	2023-03-25	\N	N/A				
4123	4106	1204	YES	2023-03-25	\N	N/A				
4127	4106	1207	YES	2023-03-25	\N	N/A				
4130	4106	1211	YES	2023-03-25	\N	N/A				
4131	4106	1212	YES	2023-03-25	\N	N/A				
4133	4106	1214	YES	2023-03-25	\N	N/A				
4136	4106	1257	YES	2023-03-25	\N	N/A				
4137	4106	1258	YES	2023-03-25	\N	N/A				
4139	4106	1261	YES	2023-03-25	\N	N/A				
4153	4207	1176	No	2023-04-26	\N	N/A				
4158	4207	1174	Yes	2023-04-26	\N	N/A				
4161	4207	1182	Yes	2023-04-26	\N	N/A				
4168	4207	1173	Yes	2023-04-26	\N	N/A				
4171	4207	1218	Yes	2023-04-26	\N	N/A				
4175	4207	1219	Yes	2023-04-26	\N	N/A				
4196	4207	1243	Yes	2023-04-26	\N	N/A				
4203	4207	1251	Yes	2023-04-26	\N	N/A				
4204	4207	1249	Yes	2023-04-26	\N	N/A				
4208	4207	1255	Yes	2023-04-26	\N	N/A				
4210	4207	1256	Yes	2023-04-26	\N	N/A				
4214	4207	1193	Yes	2023-04-26	\N	N/A				
4216	4207	1195	Yes	2023-04-26	\N	N/A				
4220	4207	1201	Yes	2023-04-26	\N	N/A				
4222	4207	1202	Yes	2023-04-26	\N	N/A				
4226	4207	1206	Yes	2023-04-26	\N	N/A				
4228	4207	1208	Yes	2023-04-26	\N	N/A				
4230	4207	1213	Yes	2023-04-26	\N	N/A				
4233	4207	1216	Yes	2023-04-26	\N	N/A				
4234	4207	1214	Yes	2023-04-26	\N	N/A				
4239	4207	1260	Yes	2023-04-26	\N	N/A				
4241	4207	1191	Yes	2023-04-26	\N	N/A				
4256	4306	1177	Yes	2023-05-03	\N	N/A				
4257	4306	1178	Yes	2023-05-03	\N	N/A				
4258	4306	1179	Yes	2023-05-03	\N	N/A				
4259	4306	1180	Yes	2023-05-03	\N	N/A				
4260	4306	1182	Yes	2023-05-03	\N	N/A				
4261	4306	1183	Yes	2023-05-03	\N	N/A				
4262	4306	1181	Yes	2023-05-03	\N	N/A				
4264	4306	1188	Yes	2023-05-03	\N	N/A				
4266	4306	1187	Yes	2023-05-03	\N	N/A				
4267	4306	1185	Yes	2023-05-03	\N	N/A				
4269	4306	1190	Yes	2023-05-03	\N	N/A				
4270	4306	1173	Yes	2023-05-03	\N	N/A				
4271	4306	1218	Yes	2023-05-03	\N	N/A				
4272	4306	1219	Yes	2023-05-03	\N	N/A				
4273	4306	1220	Yes	2023-05-03	\N	N/A				
4275	4306	1222	Yes	2023-05-03	\N	N/A				
4276	4306	1223	Yes	2023-05-03	\N	N/A				
4277	4306	1224	Yes	2023-05-03	\N	N/A				
4279	4306	1226	Yes	2023-05-03	\N	N/A				
4280	4306	1227	Yes	2023-05-03	\N	N/A				
4281	4306	1228	Yes	2023-05-03	\N	N/A				
4283	4306	1230	Yes	2023-05-03	\N	N/A				
4284	4306	1231	Yes	2023-05-03	\N	N/A				
4285	4306	1232	Yes	2023-05-03	\N	N/A				
4286	4306	1233	Yes	2023-05-03	\N	N/A				
4287	4306	1234	Yes	2023-05-03	\N	N/A				
4288	4306	1236	Yes	2023-05-03	\N	N/A				
4290	4306	1237	Yes	2023-05-03	\N	N/A				
4291	4306	1239	Yes	2023-05-03	\N	N/A				
4293	4306	1240	Yes	2023-05-03	\N	N/A				
4294	4306	1241	Yes	2023-05-03	\N	N/A				
4296	4306	1243	Yes	2023-05-03	\N	N/A				
4297	4306	1246	Yes	2023-05-03	\N	N/A				
4298	4306	1244	Yes	2023-05-03	\N	N/A				
4300	4306	1247	Yes	2023-05-03	\N	N/A				
4302	4306	1249	Yes	2023-05-03	\N	N/A				
4314	4365	1177	Yes	2023-05-04	\N	N/A				
4316	4365	1175	Yes	2023-05-04	\N	N/A				
4318	4365	1179	Yes	2023-05-04	\N	N/A				
4320	4365	1181	Yes	2023-05-04	\N	N/A				
4323	4365	1184	Yes	2023-05-04	\N	N/A				
4325	4365	1188	Yes	2023-05-04	\N	N/A				
4328	4365	1189	Yes	2023-05-04	\N	N/A				
4332	4365	1219	Yes	2023-05-04	\N	N/A				
4333	4365	1221	Yes	2023-05-04	\N	N/A				
4335	4365	1222	Yes	2023-05-04	\N	N/A				
4339	4365	1226	Yes	2023-05-04	\N	N/A				
4340	4365	1227	Yes	2023-05-04	\N	N/A				
4342	4365	1230	Yes	2023-05-04	\N	N/A				
4343	4365	1229	Yes	2023-05-04	\N	N/A				
4347	4365	1234	Yes	2023-05-04	\N	N/A				
4348	4365	1235	Yes	2023-05-04	\N	N/A				
4349	4365	1236	Yes	2023-05-04	\N	N/A				
4351	4365	1238	Yes	2023-05-04	\N	N/A				
4353	4365	1241	Yes	2023-05-04	\N	N/A				
4355	4365	1242	Yes	2023-05-04	\N	N/A				
4356	4365	1243	Yes	2023-05-04	\N	N/A				
4357	4365	1245	Yes	2023-05-04	\N	N/A				
4358	4365	1247	Yes	2023-05-04	\N	N/A				
4361	4365	1249	Yes	2023-05-04	\N	N/A				
4375	4427	1547	Yes	2023-07-23	\N					
4377	4427	1549	Yes	2023-07-23	\N					
4378	4427	1550	Yes	2023-07-23	\N					
4379	4427	1553	Yes	2023-07-23	\N					
4380	4427	1555	Yes	2023-07-23	\N					
4381	4427	1528	Yes	2023-07-23	\N					
4382	4434	1183	Yes	2023-07-23	\N	N/A				
4383	4434	1187	Yes	2023-07-23	\N	N/A				
4384	4434	1218	Yes	2023-07-23	\N	N/A				
4385	4437	1174	Yes	2023-07-23	\N	N/A				
4386	4437	1175	Yes	2023-07-23	\N	N/A				
4387	4437	1176	Yes	2023-07-23	\N	N/A				
4390	4437	1179	Yes	2023-07-23	\N	N/A				
4391	4437	1180	Yes	2023-07-23	\N	N/A				
4392	4437	1181	Yes	2023-07-23	\N	N/A				
4393	4437	1182	Yes	2023-07-23	\N	N/A				
4394	4437	1184	Yes	2023-07-23	\N	N/A				
4395	4437	1183	Yes	2023-07-23	\N	N/A				
4396	4437	1186	Yes	2023-07-23	\N	N/A				
4398	4437	1187	Yes	2023-07-23	\N	N/A				
4400	4437	1189	Yes	2023-07-23	\N	N/A				
4401	4437	1190	Yes	2023-07-23	\N	N/A				
4402	4437	1173	Yes	2023-07-23	\N	N/A				
4403	4437	1218	Yes	2023-07-23	\N	N/A				
4406	4437	1220	Yes	2023-07-23	\N	N/A				
4407	4437	1221	Yes	2023-07-23	\N	N/A				
4409	4437	1224	Yes	2023-07-23	\N	N/A				
4412	4437	1226	Yes	2023-07-23	\N	N/A				
4414	4437	1228	Yes	2023-07-23	\N	N/A				
4415	4437	1230	Yes	2023-07-23	\N	N/A				
4417	4437	1232	Yes	2023-07-23	\N	N/A				
4418	4437	1233	Yes	2023-07-23	\N	N/A				
4419	4437	1235	Yes	2023-07-23	\N	N/A				
4422	4437	1238	Yes	2023-07-23	\N	N/A				
4423	4437	1237	Yes	2023-07-23	\N	N/A				
4424	4437	1244	Yes	2023-07-23	\N	N/A				
4425	4437	1239	Yes	2023-07-23	\N	N/A				
4428	4437	1240	Yes	2023-07-23	\N	N/A				
4429	4437	1243	Yes	2023-07-23	\N	N/A				
4430	4437	1245	Yes	2023-07-23	\N	N/A				
4432	4437	1248	Yes	2023-07-23	\N	N/A				
4454	4505	1625	Yes	2023-08-17	\N					
4455	4505	1623	Yes	2023-08-17	\N					
4458	4505	1637	Yes	2023-08-17	\N					
4459	4505	1643	Yes	2023-08-17	\N					
4461	4505	1647	Yes	2023-08-17	\N					
4462	4505	1649	Yes	2023-08-17	\N					
4463	4505	1651	Yes	2023-08-17	\N					
4466	4505	1659	Yes	2023-08-17	\N					
4467	4505	1657	Yes	2023-08-17	\N					
4468	4505	1661	Yes	2023-08-17	\N					
4470	4505	1665	Yes	2023-08-17	\N					
4471	4505	1673	Yes	2023-08-17	\N					
4474	4505	1669	Yes	2023-08-17	\N					
4475	4505	1679	Yes	2023-08-17	\N					
4476	4505	1677	Yes	2023-08-17	\N					
4477	4505	1681	Yes	2023-08-17	\N					
4478	4530	1549	Yes	2023-08-17	\N					
4479	4530	1550	Yes	2023-08-17	\N					
4481	4530	1548	Yes	2023-08-17	\N					
4482	4530	1552	Yes	2023-08-17	\N					
4485	4530	1555	Yes	2023-08-17	\N					
4488	4530	1557	Yes	2023-08-17	\N					
4489	4530	1558	Yes	2023-08-17	\N					
4492	4530	1531	Yes	2023-08-17	\N					
4494	4530	1532	Yes	2023-08-17	\N					
4496	4530	1530	Yes	2023-08-17	\N					
4497	4530	1534	Yes	2023-08-17	\N					
4500	4530	1540	Yes	2023-08-17	\N					
4502	4530	1539	Yes	2023-08-17	\N					
4505	4530	1545	Yes	2023-08-17	\N					
4506	4530	1543	Yes	2023-08-17	\N					
4513	4565	1174	Yes	2023-09-08	\N	N/A				
4057	4106	1178	YES	2023-03-25	\N	N/A				
4058	4106	1179	YES	2023-03-25	\N	N/A				
4061	4106	1183	YES	2023-03-25	\N	N/A				
4062	4106	1181	YES	2023-03-25	\N	N/A				
4063	4106	1184	YES	2023-03-25	\N	N/A				
4064	4106	1186	YES	2023-03-25	\N	N/A				
4065	4106	1185	YES	2023-03-25	\N	N/A				
4067	4106	1188	YES	2023-03-25	\N	N/A				
4068	4106	1189	YES	2023-03-25	\N	N/A				
4069	4106	1190	YES	2023-03-25	\N	N/A				
4070	4106	1218	YES	2023-03-25	\N	N/A				
4071	4106	1173	YES	2023-03-25	\N	N/A				
4073	4106	1220	YES	2023-03-25	\N	N/A				
4074	4106	1221	YES	2023-03-25	\N	N/A				
4075	4106	1222	YES	2023-03-25	\N	N/A				
4076	4106	1224	YES	2023-03-25	\N	N/A				
4078	4106	1225	YES	2023-03-25	\N	N/A				
4079	4106	1226	YES	2023-03-25	\N	N/A				
4081	4106	1228	YES	2023-03-25	\N	N/A				
4082	4106	1230	YES	2023-03-25	\N	N/A				
4086	4106	1233	YES	2023-03-25	\N	N/A				
4088	4106	1235	YES	2023-03-25	\N	N/A				
4089	4106	1236	YES	2023-03-25	\N	N/A				
4092	4106	1239	YES	2023-03-25	\N	N/A				
4094	4106	1242	YES	2023-03-25	\N	N/A				
4097	4106	1244	YES	2023-03-25	\N	N/A				
4098	4106	1245	YES	2023-03-25	\N	N/A				
4103	4106	1250	YES	2023-03-25	\N	N/A				
4110	4106	1256	YES	2023-03-25	\N	N/A				
4113	4106	1194	YES	2023-03-25	\N	N/A				
4115	4106	1196	YES	2023-03-25	\N	N/A				
4119	4106	1200	YES	2023-03-25	\N	N/A				
4124	4106	1205	YES	2023-03-25	\N	N/A				
4126	4106	1208	YES	2023-03-25	\N	N/A				
4128	4106	1210	YES	2023-03-25	\N	N/A				
4129	4106	1209	YES	2023-03-25	\N	N/A				
4132	4106	1213	YES	2023-03-25	\N	N/A				
4134	4106	1215	YES	2023-03-25	\N	N/A				
4141	4106	1191	YES	2023-03-25	\N	N/A				
4156	4207	1179	Yes	2023-04-26	\N	N/A				
4157	4207	1178	Yes	2023-04-26	\N	N/A				
4159	4207	1180	Yes	2023-04-26	\N	N/A				
4163	4207	1184	Yes	2023-04-26	\N	N/A				
4164	4207	1185	Yes	2023-04-26	\N	N/A				
4166	4207	1188	Yes	2023-04-26	\N	N/A				
4167	4207	1190	Yes	2023-04-26	\N	N/A				
4173	4207	1221	Yes	2023-04-26	\N	N/A				
4177	4207	1223	Yes	2023-04-26	\N	N/A				
4179	4207	1226	Yes	2023-04-26	\N	N/A				
4180	4207	1227	Yes	2023-04-26	\N	N/A				
4181	4207	1228	Yes	2023-04-26	\N	N/A				
4182	4207	1229	Yes	2023-04-26	\N	N/A				
4183	4207	1230	Yes	2023-04-26	\N	N/A				
4185	4207	1233	Yes	2023-04-26	\N	N/A				
4188	4207	1235	Yes	2023-04-26	\N	N/A				
4189	4207	1238	Yes	2023-04-26	\N	N/A				
4190	4207	1237	Yes	2023-04-26	\N	N/A				
4191	4207	1236	Yes	2023-04-26	\N	N/A				
4193	4207	1239	Yes	2023-04-26	\N	N/A				
4194	4207	1241	Yes	2023-04-26	\N	N/A				
4195	4207	1242	Yes	2023-04-26	\N	N/A				
4198	4207	1245	Yes	2023-04-26	\N	N/A				
4199	4207	1246	Yes	2023-04-26	\N	N/A				
4200	4207	1247	Yes	2023-04-26	\N	N/A				
4201	4207	1248	Yes	2023-04-26	\N	N/A				
4205	4207	1250	Yes	2023-04-26	\N	N/A				
4206	4207	1254	Yes	2023-04-26	\N	N/A				
4209	4207	1253	Yes	2023-04-26	\N	N/A				
4212	4207	1194	Yes	2023-04-26	\N	N/A				
4213	4207	1196	Yes	2023-04-26	\N	N/A				
4215	4207	1198	Yes	2023-04-26	\N	N/A				
4218	4207	1199	Yes	2023-04-26	\N	N/A				
4221	4207	1203	Yes	2023-04-26	\N	N/A				
4223	4207	1204	Yes	2023-04-26	\N	N/A				
4224	4207	1207	Yes	2023-04-26	\N	N/A				
4225	4207	1205	Yes	2023-04-26	\N	N/A				
4229	4207	1209	Yes	2023-04-26	\N	N/A				
4232	4207	1212	Yes	2023-04-26	\N	N/A				
4235	4207	1215	Yes	2023-04-26	\N	N/A				
4237	4207	1257	Yes	2023-04-26	\N	N/A				
4240	4207	1261	Yes	2023-04-26	\N	N/A				
4268	4306	1189	Yes	2023-05-03	\N	N/A				
4292	4306	1238	Yes	2023-05-03	\N	N/A				
4295	4306	1242	Yes	2023-05-03	\N	N/A				
4315	4365	1178	Yes	2023-05-04	\N	N/A				
4321	4365	1180	Yes	2023-05-04	\N	N/A				
4327	4365	1185	Yes	2023-05-04	\N	N/A				
4334	4365	1220	Yes	2023-05-04	\N	N/A				
4341	4365	1228	Yes	2023-05-04	\N	N/A				
4346	4365	1233	Yes	2023-05-04	\N	N/A				
4350	4365	1237	Yes	2023-05-04	\N	N/A				
4354	4365	1240	Yes	2023-05-04	\N	N/A				
4362	4365	1244	Yes	2023-05-04	\N	N/A				
4503	4530	1537	Yes	2023-08-17	\N					
4507	4530	1546	Yes	2023-08-17	\N					
4510	4530	1560	Yes	2023-08-17	\N					
\.


--
-- Data for Name: compliance_report_type; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.compliance_report_type (id, "NAME", user_id, created_at, description, slug, category) FROM stdin;
81	Weekly Report	\N	\N	Weekly Report	weekly	report
1	Account Opening/KYC	\N	\N	Account Opening , KYC Review	account	compliance
2	Branch Compliance	\N	\N	Branch Regulations	branch	compliance
3	Staff Compliance	\N	\N	Staff Compliance	staff	compliance
4	Regulatory Reports	\N	\N	Regulatory Reports	regulatory	compliance
5	Cluster Review	\N	\N	Electronic Display, Deliverables and Implications	cluster	compliance
101	International Ops	\N	\N	International Ops	IOps	compliance
61	Daily Report	\N	\N	Daily Report	daily	report
\.


--
-- Data for Name: compliance_stat_categ; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.compliance_stat_categ (id, name, slug, created_at) FROM stdin;
2	Account	account	16-AUG-22 10.54.29.689209000 AM
4	Branch Wide	branch	16-AUG-22 10.54.59.006265000 AM
21	Backend Admin	admin	27-AUG-22 02.50.05.835875000 PM
22	AML	aml	27-AUG-22 02.50.06.605214000 PM
23	Compliance	compliance	27-AUG-22 02.50.07.246042000 PM
24	Case Manager	case-manager	27-AUG-22 02.53.27.488321000 PM
61	Transaction Scoring	transaction-scoring	14-APR-23 11.24.59.932160000 AM
41	Customer Risk Scoring	customer-risk-score	09-APR-23 11.53.20.873358000 PM
25	User Statistics	user	\N
1	Bank Wide	Bank	04-OCT-2023
3	TTY	TTY	sysdate
5	yy	yy	sysdate
6	try	try	03-OCT-2023
7	test	test	07-OCT-2023
\.


--
-- Data for Name: compliance_statistics; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.compliance_statistics (name, sql_query, val, created_at, last_updated, slug, status, process_order, char_format, categ, branch_code, download_query, update_mode, icon, url, description, url_request, request_parameters, risk_score, risk_assessment_id, risk_univ_id, id) FROM stdin;
Total STR Filed	select count(id) from STR_TRANSACTIONS WHERE created_at between v('P129_START_DATE') and v('P129_END_DATE')	0	03-APR-23 09.34.45.802695000 PM		total-str	active	1	999,999,999,999	aml	\N		on-demand						1	\N	\N	4
Total PEP Bank-Wide	select count(customer_code) from sterlingdb.get_customers(\np_where => q'~ pep='Y' ~'\n)	5	03-APR-23 09.34.45.802848000 PM	24-APR-23 10.54.19.154158000 AM	total-pep	active	1	999,999,999,999	bank	\N	select customer_code,short_name,pep,co_code from sterlingdb.get_customers(\np_where => q'~ pep='Y' ~'\n)	auto			Number of politically-exposed persons operating accounts in the bank			20	\N	\N	5
% Customers Without BVN	with total_bvn as (select count(customer_code) val from sterlingdb.get_customers() where replace(bvn,'NULL') is null),\ntotal_customers as (select count(customer_code) val from st_customers) \nselect to_char((1-(total_bvn.val/total_customers.val))*100,'99.99') as pct_without_bvn from total_bvn,total_customers	 50.87	03-APR-23 09.34.45.803809000 PM	24-APR-23 10.31.31.161929000 AM	pct-customers-nobvn	active	2	99.99	bank	\N		auto			Percentage of customers without BVN bank-wide			1	\N	\N	7
Customers With Expired ID	select count(customer_code) from st_customers where legal_exp_date < trunc(sysdate)	88	03-APR-23 09.34.45.805073000 PM		total-high-risk-with-expired-id	inactive	1	999,999,999,999	bank	\N	select * from st_customers where legal_exp_date < trunc(sysdate)	auto			High-risk accounts with expired means of identification			1	\N	\N	9
Total Customers	select count(customer_code) from st_customers	4995	03-APR-23 09.34.45.805193000 PM	24-APR-23 10.23.52.357423000 AM	total-customers	active	1	999,999,999	bank	\N	select * from st_customers	auto		#	Number of customers bank wide			1	\N	\N	10
Total Accounts Opened	select count(account_number) from am_customer_account	328890	03-APR-23 09.34.45.805306000 PM		total-accounts-opened	active	1	999,999,999	account	\N		auto						1	\N	\N	11
% Customers With BVN	with total_bvn as (select val from compliance_statistics where slug='total-customers-with-bvn'),\ntotal_customers as (select val from compliance_statistics where slug='total-customers')\nselect to_char((total_bvn.val/total_customers.val)*100,'99.99') as pct_bvn_customers from total_bvn,total_customers	91.09	03-APR-23 09.34.45.805437000 PM		pct-customers-with-bvn	inactive	2	99.99	bank	\N		auto						1	\N	\N	12
Customers Without BVN	select count(customer_code) from sterlingdb.get_customers() where replace(bvn,'NULL') is null	2454	03-APR-23 09.34.45.805554000 PM	24-APR-23 10.27.28.544510000 AM	customers-no-bvn	active	2	999,999,999	bank	\N	select * from sterlingdb.get_customers() where replace(bvn,'NULL') is null	auto			Number of accounts on-boarded without BVN			20	\N	\N	13
Number of Customers With Phone	select count(distinct(customer_id)) t from am_customer_phone	330367	03-APR-23 09.34.45.805674000 PM		total-customers-with-phone	inactive	1	999,999,999	bank	\N		auto						1	\N	\N	14
Number of Accounts Opened This Month	select count(distinct(account_number)) from am_customer_account where date_created > LAST_DAY(ADD_MONTHS(TRUNC(SYSDATE, 'MM'), -1))	10846	03-APR-23 09.34.45.805807000 PM		total-accounts-this-month	active	1	999,999,999,999	account	\N		auto						1	\N	\N	15
High Risk Customers - H/O	select count(customer_id) from am_customer where risk_rating_id in (select id from ctl_risk_rating where name='HIGH') and branch_code='00001'	1459	03-APR-23 09.34.45.805925000 PM		high-risk-rating-head-office	active	1	999,999,999,999	branch	1		auto						1	\N	\N	16
Medium Risk Customers - H/O	select count(customer_id) from am_customer where risk_rating_id in (select id from ctl_risk_rating where name='MEDIUM') and branch_code='00001'	1627	03-APR-23 09.34.45.806728000 PM		total-medium-risk-rating-customers-head-office	active	1	999,999,999,999	branch	1		auto						1	\N	\N	17
Low-risk Customers - H/O	select count(customer_id) from am_customer where risk_rating_id in (select id from ctl_risk_rating where name='LOW') and branch_code='00001'	30753	03-APR-23 09.34.45.806929000 PM		total-low-risk-customers-head-office	active	1	999,999,999,999	branch	1		auto						1	\N	\N	18
Accounts with Exceptions	select count(distinct a.account_number) from  COMPLIANCE_REPORT a,  COMPLIANCE_REPORT_LINE b\nwhere b.response = 'NO' and trunc(a.created_at) \nbetween v('P69_START_DATE') and v('P69_END_DATE')  and a.id = b.report_id and a.account_number IS NOT NULL	0	03-APR-23 09.34.45.807054000 PM		compliance-accounts-with-exceptions	active	1	999,999,999,999	compliance	\N		auto						1	\N	\N	19
Total Number of High-risk Customers	select count(customer_id) from am_customer where risk_rating_id in (select id from ctl_risk_rating where name='HIGH')	11308	03-APR-23 09.34.45.807170000 PM		total-high-risk-customers	inactive	1	999,999,999	bank	\N	select a.customer_id,a.full_name,(select account_number from ctl_account where trim(customer_id)=trim(a.customer_id) and rownum=1) account_number,\na.branch_code  from am_customer a where a.risk_rating_id in  (select id from ctl_risk_rating where name='HIGH')	auto			Number of high risk accounts bank-wide ( risk score: 15-25 )			1	\N	\N	20
Total Number of Low-risk Customers	select count(customer_id) from am_customer where risk_rating_id in (select id from ctl_risk_rating where name='LOW')	98539	03-APR-23 09.34.45.807292000 PM		total-low-risk-customers	inactive	1	999,999,999	bank	\N		auto						1	\N	\N	21
opp3	test	test	sysdate	sysdate	test	test	2	5	tt	rr	tt	test	tt	yy	jj	yy	vv	6	7	7	3
opp7	test	test	sysdate	sysdate	test	test	2	5	tt	rr	tt	test	tt	yy	jj	yy	vv	6	7	7	6
Cases created	select count(id) from cases where user_id=$user_id	13	03-APR-23 09.34.45.807560000 PM		cases-by-me	active	1	999,999,999,999	user	\N		on-demand	fa-user	f?p=$app_id:my-cases:$app_session:created_by_me:::P4_USER_ID:$user_id	Number of cases you have initiated			1	\N	\N	22
Cases closed	select count(id) from am_cases where user_id=$user_id and status = 'close'		03-APR-23 09.34.45.807684000 PM		cases-closed-by-me	active	3	999,999,999,999	user	\N		auto	fa-check	f?p=$app_id:my-cases:$app_session:CLOSED:::P4_USER_ID,P4_STATUS:$user_id,2	Cases you created and have been closed			1	\N	\N	23
Overdue cases	select count(id) from am_cases where staff_id=(select id from am_staff where user_id=$user_id and rownum=1) and status='open' and days_overdue > config.get_parameter('case_overdue_days')		03-APR-23 09.34.45.808734000 PM		alerts	active	8	999,999,999,999	user	\N		on-demand	fa-envelope	f?p=$app_id:my-cases:$app_session:MY_OVERDUE:::	Cases long overdue, that you need to respond and close			1	\N	\N	24
Open Cases	select count(id) from cases where status_id in (select id from case_status where name='Open')	4	03-APR-23 09.34.45.808888000 PM		open-cases	active	2	999,999,999,999	case-manager	\N		auto		f?p=&APP_ID.:my-cases:&APP_SESSION.::::P4_STATUS,P4_STAFF,P4_USER_ID:1,0,0				1	\N	\N	25
Cases pending	select count(id) from cases where user_id=$user_id and status_id in (select id from case_status where lower(name) = 'open')		03-APR-23 09.34.45.809023000 PM		open-cases-by-me	active	2	999,999,999,999	user	\N		on-demand	fa-folder-o	f?p=$app_id:my-cases:$app_session.:TO_CLOSE:::	Cases you initiated and still open			1	\N	\N	26
Cases assigned to me	select count(id) from am_cases where status='open' and staff_id = (select id from am_staff where user_id=$user_id and rownum=1)	4	03-APR-23 09.34.45.809138000 PM		cases-assigned	active	4	999,999,999,999	user	\N		on-demand	fa-user-plus	f?p=$app_id:my-cases:$app_session:ASSIGNED_TO_ME:::P4_USER_ID:$user_id	Cases awaiting your response			1	\N	\N	27
Policies/Procedures created	select count(id) from ctl_document where user_id = $user_id		03-APR-23 09.34.45.809246000 PM		policies-created	inactive	5	999,999,999,999	user	\N		on-demand	fa-file	f?p=&APP_ID.:documents:&APP_SESSION.::::P169_REF_NUMBER,P169_FILE_NAME,P169_SOURCE_FILE:0,0,0				1	\N	\N	28
Callover to review this month	select count(*) from app_callover_transactions	6531	03-APR-23 09.34.45.809358000 PM		callover-ro-review	active	6	999,999,999,999	user	\N		on-demand	fa-money	f?p=$app_id:callover:$app_session::::	Transactions awaiting your review			1	\N	\N	29
Processes Assigned	select nvl(count(id),23) from exception_process where first_line_owner=$user_id		03-APR-23 09.34.45.809481000 PM		processes-assigned	inactive	7	999,999,999,999	user	\N		on-demand	fa-cog	#				1	\N	\N	30
Systems assigned to me	select 3 from dual	3	03-APR-23 09.34.45.809591000 PM		system-assigned	inactive	10	999,999,999,999	user	\N		on-demand	fa-laptop	#				1	\N	\N	31
Overdue  Cases	select count(id) from cases where status_id in (select id from case_status where name='Open') and (trunc(sysdate) - trunc(created_at)) >= config.get_parameter('case_overdue_days')	4	03-APR-23 09.34.45.809705000 PM		overdue-cases	active	4	999,999,999,999	case-manager	\N		on-demand		f?p=&APP_ID.:my-cases:&APP_SESSION.:OVERDUE:::P4_STATUS,P4_STAFF,P4_USER_ID:1,0,0				1	\N	\N	32
STR filed this month	select 14 from dual	14	03-APR-23 09.34.45.809838000 PM		stf-filed-this-month	inactive	8	999,999,999,999	user	\N		on-demand	fa-flag	#				1	\N	\N	33
All Cases	select count(id) from cases	16	03-APR-23 09.34.45.809959000 PM		all-cases	active	1	999,999,999,999	case-manager	\N		on-demand	fa-	f?p=&APP_ID.:my-cases:&APP_SESSION.::::P4_STATUS,P4_STAFF,P4_USER_ID:0,0,0				1	\N	\N	34
Closed Cases	select count(id) from cases where status_id in (select id from case_status where name='Closed')	12	03-APR-23 09.34.45.810066000 PM		closed-cases	active	1	999,999,999,999	case-manager	\N		auto		f?p=&APP_ID.:my-cases:&APP_SESSION.::::P4_STATUS,P4_STAFF,P4_USER_ID:2,0,0				1	\N	\N	35
Last One Month	select count(id) from cases where trunc(created_at) >= add_months(sysdate,-1)	16	03-APR-23 09.34.45.810179000 PM		filed-last-one-month	active	5	999,999,999,999	case-manager	\N		auto		f?p=&APP_ID.:my-cases:&APP_SESSION.:LAST_MONTH:::P4_STATUS,P4_STAFF,P4_USER_ID:0,0,0				1	\N	\N	36
BVN Compliance	select 1 from am_customer_bvn where customer_id='$customer_id' and rownum=1		09-APR-23 11.54.46.362284000 PM		bvn-risk-score	active	1	999,999,999,999	customer-risk-score	\N		auto		#	Customer's BVN risk score			22	21	\N	37
Enhanced Due Diligence	select risk_score from app_edd where customer_id = '$customer_id' and rownum=1 order by created_at desc		09-APR-23 11.58.34.066013000 PM		customer-edd-score	active	2	999,999,999,999	customer-risk-score	\N		auto		#	Risk score obtained using the most recent Enhanced Due Diligence that was done			15	\N	\N	38
Customer Education Level	SELECT risk_score FROM am_risk_assessment\nWHERE assessment_id = (select assessment_id FROM\napp_am_cust_edu_level WHERE id_1 in (select education_level from am_customer where customer_id='$customer_id' and rownum=1)\n and rownum=1) and rownum=1		10-APR-23 12.00.04.217178000 AM		cust-education-risk-score	active	3	999,999,999,999	customer-risk-score	\N		auto		#	Risk rating based on Risk assessment associated with customer education level profile			16	\N	\N	39
Customer PEP Score	select 25 from app_pep_accounts where trim(customer_id) ='$customer_id' and rownum=1		10-APR-23 10.10.12.708600000 AM		customer-pep-score	active	4	999,999,999,999	customer-risk-score	\N		auto		#	Risk score for PEP related accounts			1	\N	\N	40
Customer Risk Score	select risk_score from compliance_cust_risk_score where customer_id='$customer_id' and rownum=1		14-APR-23 11.26.15.415642000 AM		customer-risk-score	active	1	999,999,999,999	transaction-scoring	\N		auto		#	Risk score obtained from Customer risk rating			18	21	\N	41
Machine Score	select transaction_mgt.machine_score(p_transaction_id => '$transaction_id' from dual;		14-APR-23 11.27.30.163808000 AM		machine-transaction-score	active	2	999,999,999,999	transaction-scoring	\N		auto		#	Machine learning transaction score applied to every transaction based on selected model			15	21	\N	42
Jurisdiction	SELECT ci.name AS jurisdiction, gz.risk_score as risk_score\nFROM nigeria_states gz\nINNER JOIN COMPLIANCE_INST_FC_RISK_UNIV ci ON gz.risk_univ_id = ci.id\nWHERE lower(gz.state) = lower(:P17_STATE) or lower(gz.capital) = lower(:P17_STATE)				Jurisdiction	active	1	99.99	customer_static_risk_score	\N					The risk score based on the 6 jurisdictions			12	\N	21	43
Products and Services	select risk_score from COMPLIANCE_INST_FC_RISK_SUBJECT2 where lower(name) = lower(:P27_PRODUCT_SERVICE)				Products and Services	active	2	99.99	customer_static_risk_score	\N					Product and Services associated			8	\N	22	44
Exceptions Raised This Month	select count(a.id) from  COMPLIANCE_REPORT a,  COMPLIANCE_REPORT_LINE b\nwhere upper(b.response) ='NO' and a.id = b.report_id and trunc(a.created_at) \n>= TRUNC(SYSDATE, 'MM')	0	03-APR-23 09.34.45.801181000 PM		tt	tt	10	tt	tt	tt	tt	tt	tt	tt	tt	tt	tt	1	1	1	2
opp2	test	test	sysdate	sysdate	test	test	2	5	tt	rr	tt	test	tt	yy	jj	yy	vv	6	7	7	45
free	test	test	sysdate	sysdate	test	test	2	5	tt	rr	tt	test	tt	yy	jj	yy	vv	6	7	7	8
trial	test	test	sysdate	sysdate	test	test	2	5	tt	rr	tt	test	tt	yy	jj	yy	vv	6	7	7	1
\.


--
-- Data for Name: compliance_statisticss; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.compliance_statisticss (id, name, sql_query, val, created_at, last_updated, slug, status, process_order, char_format, categ, branch_code, download_query, update_mode, icon, url, description, url_request, request_parameters, risk_score, risk_assessment_id, risk_univ_id) FROM stdin;
87	Customers With BVN	select count(customer_code) val from sterlingdb.get_customers() where replace(bvn,\\NULL\\) is not null	2541.00	03-APR-23 09.34.45.795680000 PM	24-APR-23 10.39.15.970017000 AM	total-customers-with-bvn	active	1	999,999,999	bank	\N	select customer_code,name_1,bvn,co_code branch_code from sterlingdb.get_customers() where replace(bvn,) is not null	auto	\N	\N	Customers having BVN	\N	\N	1.0	\N	\N
88	Exceptions Raised This Month	select count(a.id) from  COMPLIANCE_REPORT a,  COMPLIANCE_REPORT_LINE b\\nwhere upper(b.response)  and a.id = b.report_id and trunc(a.created_at) \\n>= TRUNC(SYSDATE,)	0.00	03-APR-23 09.34.45.801181000 PM	\N	compliance-this-month	active	3	999,999,999,999	compliance	\N	\N	auto	\N	\N	\N	\N	\N	1.0	\N	\N
89	Total Validated	select count(a.id) from  COMPLIANCE_REPORT a,  COMPLIANCE_REPORT_LINE b\\nwhere b.response  and a.id = b.report_id \\nand trunc(a.created_at) \\nbetween v	268.00	03-APR-23 09.34.45.802525000 PM	\N	compliance-total-validated	active	2	999,999,999,999	compliance	\N	select  a.id,a.report_name from  COMPLIANCE_REPORT a,  COMPLIANCE_REPORT_LINE b\\nwhere b.response  and a.id = b.report_id \\nand trunc(a.created_at) \\nbetween 	auto	\N	\N	\N	\N	\N	1.0	\N	\N
90	Total STR Filed	select count(id) from STR_TRANSACTIONS WHERE created_at between 	0.00	03-APR-23 09.34.45.802695000 PM	\N	total-str	active	1	999,999,999,999	aml	\N	\N	on-demand	\N	\N	\N	\N	\N	1.0	\N	\N
91	Total PEP Bank-Wide	select count(customer_code) from sterlingdb.get_customers(\\np_where => 	5.00	03-APR-23 09.34.45.802848000 PM	24-APR-23 10.54.19.154158000 AM	total-pep	active	1	999,999,999,999	bank	\N	select customer_code,short_name,pep,co_code from sterlingdb.get_customers(\\np_where => q\\)	auto	\N	\N	Number of politically-exposed persons operating accounts in the bank	\N	\N	20.0	\N	\N
92	Total Number of Medium-risk Customers	select count(customer_id) from am_customer where risk_rating_id in (select id from ctl_risk_rating where name=\\)	10569.00	03-APR-23 09.34.45.803630000 PM	\N	total-medium-risk-customers	inactive	1	999,999,999	bank	\N	\N	auto	\N	\N	Medium risk account bank wide (risk score: 11-15 )	\N	\N	1.0	\N	\N
93	% Customers Without BVN	with total_bvn as (select count(customer_code) val from sterlingdb.get_customers() where replace(bvn,) is null),\\ntotal_customers as (select count(customer_code) val from st_customers) \\nselect to_char((1-(total_bvn.val/total_customers.val))*100,99.99\\) as pct_without_bvn from total_bvn,total_customers	50.87	03-APR-23 09.34.45.803809000 PM	24-APR-23 10.31.31.161929000 AM	pct-customers-nobvn	active	2	99.99	bank	\N	\N	auto	\N	\N	Percentage of customers without BVN bank-wide	\N	\N	1.0	\N	\N
94	Number of Customers With Expired ID	select count(customer_id) from am_customer where id_expiry_date is not null and id_expiry_date < trunc(sysdate)	483.00	03-APR-23 09.34.45.804941000 PM	24-APR-23 10.21.00.278319000 AM	total-customers-expired-id	active	1	999,999,999,999	bank	\N	select * from am_customer where id_expiry_date is not null and id_expiry_date < trunc(sysdate)	auto	\N	\N	Number of accounts with expired means of identification	\N	\N	20.0	\N	\N
95	Customers With Expired ID	select count(customer_code) from st_customers where legal_exp_date < trunc(sysdate)	88.00	03-APR-23 09.34.45.805073000 PM	\N	total-high-risk-with-expired-id	inactive	1	999,999,999,999	bank	\N	select * from st_customers where legal_exp_date < trunc(sysdate)	auto	\N	\N	High-risk accounts with expired means of identification	\N	\N	1.0	\N	\N
96	Total Customers	select count(customer_code) from st_customers	4995.00	03-APR-23 09.34.45.805193000 PM	24-APR-23 10.23.52.357423000 AM	total-customers	active	1	999,999,999	bank	\N	select * from st_customers	auto	\N	#	Number of customers bank wide	\N	\N	1.0	\N	\N
97	Total Accounts Opened	select count(account_number) from am_customer_account	328890.00	03-APR-23 09.34.45.805306000 PM	\N	total-accounts-opened	active	1	999,999,999	account	\N	\N	auto	\N	\N	\N	\N	\N	1.0	\N	\N
98	% Customers With BVN	with total_bvn as (select val from compliance_statistics where slug=\\,\\ntotal_customers as (select val from compliance_statistics where slug=)\\nselect to_char((total_bvn.val/total_customers.val)*100,\\99.99\\) as pct_bvn_customers from total_bvn,total_customers	91.09	03-APR-23 09.34.45.805437000 PM	\N	pct-customers-with-bvn	inactive	2	99.99	bank	\N	\N	auto	\N	\N	\N	\N	\N	1.0	\N	\N
99	Customers Without BVN	select count(customer_code) from sterlingdb.get_customers() where replace(bvn,\\) is null	2454.00	03-APR-23 09.34.45.805554000 PM	24-APR-23 10.27.28.544510000 AM	customers-no-bvn	active	2	999,999,999	bank	\N	select * from sterlingdb.get_customers() where replace(bvn,\\NULL\\) is null	auto	\N	\N	Number of accounts on-boarded without BVN	\N	\N	20.0	\N	\N
100	Number of Customers With Phone	select count(distinct(customer_id)) t from am_customer_phone	330367.00	03-APR-23 09.34.45.805674000 PM	\N	total-customers-with-phone	inactive	1	999,999,999	bank	\N	\N	auto	\N	\N	\N	\N	\N	1.0	\N	\N
101	Number of Accounts Opened This Month	select count(distinct(account_number)) from am_customer_account where date_created > LAST_DAY(ADD_MONTHS(TRUNC(SYSDATE, ), -1))	10846.00	03-APR-23 09.34.45.805807000 PM	\N	total-accounts-this-month	active	1	999,999,999,999	account	\N	\N	auto	\N	\N	\N	\N	\N	1.0	\N	\N
103	Medium Risk Customers - H/O	select count(customer_id) from am_customer where risk_rating_id in (select id from ctl_risk_rating where name=\\) and branch_code=\\	1627.00	 09.34.45.806728000 PM	\N	total-medium-risk-rating-customers-head-office	active	1	999,999,999,999	branch	1	\N	auto	\N	\N	\N	\N	\N	1.0	\N	\N
\.


--
-- Data for Name: comply; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.comply (id, created_at, updated_at) FROM stdin;
50	2023-08-28 14:52:00	\N
55	2023-08-28 14:52:00	\N
\.


--
-- Data for Name: ctl_account; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.ctl_account (account_number, branch_code, currency_code, gl_code, customer_id, name, date_created) FROM stdin;
\.


--
-- Data for Name: ctl_alert_group; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.ctl_alert_group (id, name, created_at, email, email_cc, state, tag) FROM stdin;
2	Branch Compliance	23-MAY-22 02.38.41.168154000 PM	alert@novajii.com	\N	active	branch-comp
3	Head Office Control	23-MAY-22 02.38.41.738922000 PM	alert@novajii.com,hanson.e@novajii.com	operations@novajii.com	active	headoffice
4	Compliance	23-MAY-22 02.38.42.379479000 PM	alert@novajii.com	\N	active	comp
5	User Access	23-MAY-22 02.38.42.987027000 PM	alert@novajii.com	\N	active	user
6	Sharia Compliance	23-MAY-22 02.38.43.805664000 PM	alert@novajii.com	\N	active	sharia
22	Internal Mail Recipients Only	25-MAY-22 03.22.58.678938000 PM	alert@novajii.com	\N	active	internal
41	Vendors	16-APR-23 10.07.57.729965000 AM	charles.e@novajii.com,favour.e@novajii.com,hanson.e@novajii.com	chizo.o@novajii.com,jonathan.o@novajii.com	active	vendors
1	Branch Control	23-MAY-22 02.38.40.530041000 PM	alert@novajii.com		active	branch
700	test	23-MAY-22 02.38.40.530041000 PM	Hansoneyuren3@Gmail.Com	Hansoneyuren5@Gmail.Com	test2	test3
710	test	09/29/2023	Hansoneyuren3@Gmail.Com	Hansoneyuren5@Gmail.Com	test2	test3
720	TS	09/29/2023	Hansoneyuren1@Gmail.Com	Hansoneyuren1@Gmail.Com	Admin	te
800	FREEN	NULL	FREE	FREE	FREE	T
900	fr	SYSDATE	fr	tr	ty	yyuhh
920	fr	SYSDATE	fr	tr	ty	yyuhh
950	fr	SYSDATE	fr	tr	ty	yyuhh
952	fr	SYSDATE	fr	tr	ty	yyuhh
955	gjjh	SYSDATE	jhh	bjkj	active	jjk
1000	sd	SYSDATE	fgvb	ghj	active	dfgh
\.


--
-- Data for Name: ctl_branch; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.ctl_branch (branch_code, branch_name) FROM stdin;
99999	ONITSHA
1	HEAD OFFICE
3	KANO
5	PORT HARCOURT REG HQ
7	KADUNA
4	LAGOS REG. HQ
6	SOKOTO
15	IBADAN
9	ABIA
11	CROSS RIVER
12	CALABAR
13	WARRI
14	ENUGU REG HQ
8	GOMBE
10	YOLA
16	BAUCHI
0	ILORIN
2	ABUJA
\.


--
-- Data for Name: ctl_collections; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.ctl_collections (id, name, val1, val2, val3) FROM stdin;
21	expense-account	100001	0	0
22	expense-account	100002	0	0
23	expense-gl	10001	0	0
24	expense-account	10005	0	0
25	tech-users	Tunde	0	0
26	tech-users	Tobi	0	0
27	ebanking_accounts	2040640001	AGENCY BANKING VAS SUSPENSE AC	NULL
28	ebanking_accounts	2040620001	AGENT BANKING POS ACCT	NULL
29	ebanking_accounts	1031270001	AGENT BANKING POS RECEIVABLE�	NULL
30	ebanking_accounts	2040460001	AGENT TRANSACTION COMM. ACCT�	NULL
31	ebanking_accounts	2091050001	ATM BILL PAY. PAYABLE ACCOUNT	NULL
32	ebanking_accounts	2091060001	ATM BILL PAYABLE FEES ACCOUNT	NULL
33	ebanking_accounts	2092030001	ATM OFF US PAYABLE	NULL
34	ebanking_accounts	2091030001	ATM RECHARGE PAYABLE ACCOUNT	NULL
35	ebanking_accounts	1030010001	ATM SETTLEMENT	NULL
36	ebanking_accounts	2091070001	ATM TRANSFER PAYABLE	NULL
37	ebanking_accounts	1030050001	ATM TRANSFER RECEIVABLE	NULL
38	ebanking_accounts	2092050001	ATM TRSF SUSP	NULL
39	ebanking_accounts	2091010001	ATM WITHDRAWER PAYABLE	NULL
40	ebanking_accounts	1030040001	ATM WITHDRAWER RECEIVABLE	NULL
41	ebanking_accounts	1030020001	AUTO PAY SETTLEMENT	NULL
42	ebanking_accounts	1014040001	CBN NIP-FCMB	NULL
43	ebanking_accounts	1031210001	E-BANKING SETTELEMENT SUSPENSE	NULL
44	ebanking_accounts	2040610001	E-BANKING SETTLEMENT	NULL
45	ebanking_accounts	2040150001	ETRAN TSS ACCOUNT	NULL
46	ebanking_accounts	1036080001	E-TRANSACT FEE RECEIVABLE ACCOUNT	NULL
47	ebanking_accounts	2040180001	E-TRANSACT PAYABLE	NULL
48	ebanking_accounts	1036070001	E-TRANSACT RECEIVABLE ACCOUNT	NULL
49	ebanking_accounts	2040280001	INTERSWITCH ATM FEE PAYABLE��	NULL
50	ebanking_accounts	2040270001	INTERSWITCH ATM PAYABLE������	NULL
51	ebanking_accounts	2040290001	INTERSWITCH POS PAYABLE	NULL
52	ebanking_accounts	1031160001	INTERSWITCH TSS ACCT���������	NULL
53	ebanking_accounts	2040310001	INTERSWITCH WEB FEE PAYABLE��	NULL
54	ebanking_accounts	2040320001	INTERSWITCH WEB FEE PAYABLE��	NULL
55	ebanking_accounts	2040400001	ISW SETTLEMENT SUSPANCE	NULL
56	ebanking_accounts	2040330001	NIBSS DEVELOPMENT ACCT	NULL
57	ebanking_accounts	1031180001	NIBSS VALUE ADDED SERVICES	NULL
58	ebanking_accounts	2040120001	NIP PAYABLE	NULL
59	ebanking_accounts	1036030001	NIP RECEIVABLE	NULL
60	ebanking_accounts	2040230003	OATEK 9 MOBILE ACCT	NULL
61	ebanking_accounts	2040230002	OATEK AIRTEL�RECHARGE	NULL
62	ebanking_accounts	2040230004	OATEK GLO RECHARGE	NULL
63	ebanking_accounts	2040230001	OATEK MTN RECHARGE	NULL
64	ebanking_accounts	1031140001	PAY DIRECT SETTLEMENT	NULL
65	ebanking_accounts	2091100001	POS GDS & SERVICE PAYABLE FEES	NULL
66	ebanking_accounts	2091090001	POS GOODS & SERVICE PAYABLE	NULL
67	ebanking_accounts	1036090001	POS RECEIVABLE���������������	NULL
68	ebanking_accounts	2092020001	POS TRSF SUSPENSE	NULL
69	ebanking_accounts	2040450001	QUICKTELLER BILL PAYMENT	NULL
70	ebanking_accounts	2040440001	QUICKTELLER RECHARGE	NULL
71	ebanking_accounts	2092330001	TAJMALL CUSTOMER REFUND ACCOUNT	NULL
72	ebanking_accounts	2092280001	TAJMALL VENDOR SUSPENSE������	NULL
73	ebanking_accounts	1032040001	TSS INTERSWITCH ACCT���������	NULL
74	ebanking_accounts	2040210001	WEB PAYABLE������������������	NULL
75	ebanking_accounts	2092230001	WEB PAYMENT SPLITTING ACCT	NULL
76	ebanking_accounts	1036100001	WEB RECEIVABLE���������������	NULL
4	ARO	2091150001	MARYAM LAWAN	NULL
5	ARO	2091170001	ABIODUN AFOLAYAN	NULL
6	ARO	2040570005	TAIWO ADEBOJE	NULL
7	ARO	2040570002	TAIWO ADEBOJE	NULL
8	ARO	2040570003	TAIWO ADEBOJE	NULL
9	ARO	2040570004	TAIWO ADEBOJE	NULL
10	ARO	2040570001	TAIWO ADEBOJE	NULL
11	ARO	2091160001	ABIODUN AFOLAYAN	NULL
12	ARO	1031280001	ISSA ABUBAKAR	NULL
13	ARO	2040590003	ABIODUN AFOLAYAN	NULL
14	ARO	2040590004	ABIODUN AFOLAYAN	NULL
15	ARO	2040590002	OMOLADE OMOLUSI	NULL
16	ARO	2040590001	OMOLADE OMOLUSI	NULL
17	ARO	2040580001	BAMIDELE FOLORUNSHO	NULL
18	ARO	2040580001	BAMIDELE FOLORUNSHO	NULL
\.


--
-- Data for Name: ctl_control_officer; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.ctl_control_officer (id, branch_code, alert_group_id, employee_id, created_at) FROM stdin;
26	NG0020011	1	5277	24-MAY-22 12.08.09.385272000 AM
21	NG0020015	1	4833	23-MAY-22 11.53.01.144163000 PM
22	00002	1	2485	23-MAY-22 11.53.38.275633000 PM
28	NG0010001	1	5469	24-MAY-22 12.11.42.679907000 AM
23	00014	1	2491	23-MAY-22 11.54.16.589199000 PM
25	00008	1	2891	23-MAY-22 11.55.21.866464000 PM
41	00001	1	1	31-MAY-22 04.19.05.874493000 PM
42	00001	1	2	31-MAY-22 04.19.58.598179000 PM
43	00003	1	2491	31-MAY-22 04.20.50.986909000 PM
45	00007	1	2760	31-MAY-22 04.24.25.866180000 PM
2	00003	1	1	23-MAY-22 03.44.02.938022000 PM
24	00011	1	2491	23-MAY-22 11.54.47.844455000 PM
27	00010	1	2891	24-MAY-22 12.09.14.515907000 AM
46	00012	1	2491	31-MAY-22 04.26.10.624874000 PM
47	00013	1	2491	31-MAY-22 04.26.47.199841000 PM
\.


--
-- Data for Name: ctl_currency; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.ctl_currency (currency_id, currency_name, narration) FROM stdin;
156	CNY	YUAN
392	JPY	JAPANESE YEN
826	GBP	POUND STERLING
840	USD	DOLLAR US
978	EUR	EURO
566	NGN	NAIRA
\.


--
-- Data for Name: ctl_document; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.ctl_document (id, file_name, user_id, mime_type, document_type_id, created_at, updated_at, source_file, charset, name, description, ref_number, exception_process_id, first_owner_id, second_owner_id, alert_rule_id, approver_id, approved_at, status) FROM stdin;
1	LAPO PayAttitude Integration_v1.pdf	43	application/pdf	2	25-MAR-23 08.49.00.280730000 PM	\N	[unsupported data type]	\N	AUDIY Enquiry Response	\N	REF/001	17049	4835	4833	\N	43	25-MAR-23 08.51.32.988799000 PM	approved
61	postgresql-14-US.pdf	11	application/pdf	1	07-SEP-23 03.13.25.606342000 PM	\N	[unsupported data type]	\N	uche policy	<p>newest policy</p>	5858	18149	5509	4836	\N	\N	07-SEP-23 03.13.25.606342000 PM	draft
21	employee-recruitment-selection-policy-sample.pdf	43	application/pdf	1	26-APR-23 11.58.05.539818000 AM	\N	[unsupported data type]	\N	Recruitment	\N	HR1	17055	4833	\N	\N	43	26-APR-23 11.58.54.332437000 AM	approved
42	\N	43	\N	2	01-AUG-23 12.53.56.287175000 PM	\N	[unsupported data type]	\N	Charles	\N	\N	18147	5509	4836	\N	11	01-AUG-23 12.54.28.642108000 PM	approved
58	NEWfile	9	442	101	327pm		legit source		test file	sensitive data	111	101	9	10	23	8	today	inactive
60	NEWfile	9	442	101	327pm		legit source		upload file	sensitive data	111	101	9	10	23	8	today	inactive
62	NEWfile	9	442	101	327pm		legit source		upload file	sensitive data	111	101	9	10	23	8	today	inactive
33	testing created_at	9	\N	101	\N	\N	show file path@20:42	\N	upload file on postman	sensitive data	\N	101	9	10	23	8	today	inactive
59	NEWfile	9	442	101	327pm	2023-10-03 00:09:56	uploads/9NfV1bawLqJneBpUnw9VH7LZ8jA5UU3qvAPo7ze4.pdf		test file	sensitive data	111	101	9	10	23	8	today	inactive
56	NEWfile	9	442	101	327pm	2023-10-02 23:13:25	uploads/AXLfxYb5qSSPQpY7ejCIp8EOkqF4TAaFHtw8Mj7z.pdf		upload file	sensitive data	111	101	9	10	23	8	today	inactive
57	NEWfile	9	442	101	327pm	2023-10-02 23:16:09	uploads/WYUXwpWf66zqa2ikuM1uARfiQWkdiDTZB4Pii4gZ.pdf		test file	sensitive data	111	101	9	10	23	8	today	inactive
63	test	2		2	10/03/2023	10/03/2023	test		test2	test	test	5	2	5	5	3		1
64	8209848140007243/pdf.pdf	2		2	03-OCT-2023	03-OCT-2023	8209848140007243/pdf.pdf			<p>test</p>	hytyg	5	2	5	5	3		1
65		2		2	03-OCT-2023	03-OCT-2023	8210275815048790/pdf.pdf			<p>TEST</p>	gHR	2	5557	5554	5	6	03-OCT-2023	2
66	doc	2		1	03-OCT-2023	03-OCT-2023	8210503650071031/pdf.pdf			<p>test</p>	BBrr	1	5551	5553	5	6	03-OCT-2023	2
67	HH	2		2	03-OCT-2023	03-OCT-2023	8210625896074356/pdf.pdf			<p>TEST</p>	gHR	2	5557	5554	5	6	03-OCT-2023	2
68	Doc2	2		1	03-OCT-2023	03-OCT-2023	8210772427099314/SMS Technical Architecture.pdf			<p>testing doc</p>	HH3	1	5553	5550	5	6	03-OCT-2023	2
69	NEWfile	9	442	101	327pm		legit source		upload file	sensitive data	111	101	9	10	23	8	today	inactive
70	NEWfile	9	442	101	327pm		legit source		upload file	sensitive data	111	101	9	10	23	8	today	inactive
71	NEWfile	9	442	101	327pm		legit source		upload file	sensitive data	111	101	9	10	23	8	today	inactive
72	NEWfile	9	442	101	327pm	2023-10-04 10:58:44	uploads/lc3wgKjOZIcRWAuSprlY2jzmfhXycmWpJoCwDBOf.txt		upload file	sensitive data	111	101	9	10	23	8	today	inactive
73	NEWfile	9	442	101	327pm	2023-10-04 11:05:17	uploads/E7PvKLDisX202xmzWpntAWsGvrqADwnH39iJYc2V.txt		upload file	sensitive data	111	101	9	10	23	8	today	inactive
74	NEWfile	9	442	101	327pm	2023-10-04 11:06:21	uploads/X345XoivYc3ijcIQH1nRCaJO4FFL6c9s9W2nQBdN.txt		upload file	sensitive data	111	101	9	10	23	8	today	inactive
75	NEWfile	9	442	101	327pm	2023-10-04 11:07:31	uploads/UPHqusnCcxxIkqqnD6WV3Kq5fulsY9yJEE2ifpyc.txt		upload file	sensitive data	111	101	9	10	23	8	today	inactive
76	NEWfile	9	442	101	327pm		legit source		upload file	sensitive data	111	101	9	10	23	8	today	inactive
77	NEWfile	9	442	101	327pm	2023-10-04 11:13:02	uploads/a5Pes75JfihZTgKqQRGH8NVpZagZcm24Hj6pYi14.txt		upload file	sensitive data	111	101	9	10	23	8	today	inactive
78	NEWfile	9	442	101	327pm	2023-10-04 11:19:05	uploads/HX6704KcSte9SSzagONANqnCLijVbE2odRtDc92F.png		upload file	sensitive data	111	101	9	10	23	8	today	inactive
79	NEWfile	9	442	101	327pm		legit source		upload file	sensitive data	111	101	9	10	23	8	today	inactive
80	NEWfile	9	442	101	327pm		legit source		upload file	sensitive data	111	101	9	10	23	8	today	inactive
81	NEWfile	9	442	101	327pm		legit source		upload file	sensitive data	111	101	9	10	23	8	today	inactive
82	NEWfile	9	442	101	327pm		legit source		upload file	sensitive data	111	101	9	10	23	8	today	inactive
83	NEWfile	9	442	101	327pm		legit source		upload file	sensitive data	111	101	9	10	23	8	today	inactive
84	NEWfile	9	442	101	327pm		legit source		upload file	sensitive data	111	101	9	10	23	8	today	inactive
85	NEWfile	9	442	101	327pm	2023-10-04 17:27:18	uploads/R2QKbClRQ3WjjnPJzlo3XnmeaBxJw2Asq1OYuMvd.txt		upload file	sensitive data	111	101	9	10	23	8	today	inactive
86	NEWfile	9	442	101	327pm		legit source		upload file	sensitive data	111	101	9	10	23	8	today	inactive
87	NEWfile	9	442	101	327pm		legit source		upload file	sensitive data	111	101	9	10	23	8	today	inactive
88	NEWfile	9	442	101	327pm	2023-10-04 17:31:52	uploads/gnHQXqsl84pZTJEnqHXuQbR1oNi0fQnTfexylUj1.txt		upload file	sensitive data	111	101	9	10	23	8	today	inactive
89	NEWfile	9	442	101	327pm	2023-10-04 17:33:35	uploads/vxkoGL2oLtMkH3H5eG7ja3hoGFhgHFlOtWv17AtX.txt		upload file	sensitive data	111	101	9	10	23	8	today	inactive
90	NEWfile	9	442	101	327pm	2023-10-04 17:38:04	uploads/i7QuHuEKkc9hvu9Trd2tchk1vac2GekiWfFSDXpb.txt		upload file	sensitive data	111	101	9	10	23	8	today	inactive
91	NEWfile	9	442	101	327pm	2023-10-04 17:40:18	uploads/qpzbKF1tjTVYge03PqDmut7uRD2B6YyH9deePsrU.txt		upload file	sensitive data	111	101	9	10	23	8	today	inactive
92	NEWfile	9	442	101	327pm	2023-10-05 08:10:42	uploads/u89aLItKXK4vZzghcMHAK0j06arVXX9acenCIzbn.png		upload file	sensitive data	111	101	9	10	23	8	today	inactive
93	NEWfile	9	442	101	327pm	2023-10-05 08:16:59	uploads/LcQIXeksJGPM3weu5Ujrt6J0NpN5XQkGK9SmGaIu.png		upload file	sensitive data	111	101	9	10	23	8	today	inactive
94	NEWfile	9	442	101	327pm	2023-10-05 08:18:34	uploads/mW8mmUnpb6xDMMTtLXHtwKuK4WsdN3bYxlqRXqYm.jpg		upload file	sensitive data	111	101	9	10	23	8	today	inactive
95	NEWfile	9	442	101	327pm	2023-10-05 08:21:11	uploads/n1gXRbZe6IjLliVS4Ojt30jskU9qpe5nSxmFfChk.jpg		upload file	sensitive data	111	101	9	10	23	8	today	inactive
96	NEWfile	9	442	101	327pm	2023-10-05 08:23:05	uploads/0UOsNSuDaYBnBgINTpFmQj4T60bXVMb09QQVTpx1.jpg		upload file	sensitive data	111	101	9	10	23	8	today	inactive
97	NEWfile	9	442	101	327pm	2023-10-05 08:24:10	uploads/1rrdzdZNbvcuwgVbQdSAPGV51biKFiHMTXawAKDr.jpg		upload file	sensitive data	111	101	9	10	23	8	today	inactive
98	NEWfile	9	442	101	327pm	2023-10-05 08:43:58	uploads/vaZsFaDI1LTGeZ6NfMSWFiylJWK7rjl59cswTgmi.jpg		upload file	sensitive data	111	101	9	10	23	8	today	inactive
99	NEWfile	9	442	101	327pm	2023-10-05 08:49:39	uploads/Dak61J9xZI5SsZVOQCAhyQ54yjgVctZKEnd95r31.txt		upload file	sensitive data	111	101	9	10	23	8	today	inactive
100	NEWfile	9	442	101	327pm		legit source		upload file	sensitive data	111	101	9	10	23	8	today	inactive
101	NEWfile	9	442	101	327pm		legit source		upload file	sensitive data	111	101	9	10	23	8	today	inactive
102	NEWfile	9	442	101	327pm		legit source		upload file	sensitive data	111	101	9	10	23	8	today	inactive
103	NEWfile	9	442	101	327pm		legit source		upload file	sensitive data	111	101	9	10	23	8	today	inactive
104	NEWfile	9	442	101	327pm		legit source		upload file	sensitive data	111	101	9	10	23	8	today	inactive
105	NEWfile	9	442	101	327pm		legit source		upload file	sensitive data	111	101	9	10	23	8	today	inactive
106	NEWfile	9	442	101	327pm	2023-10-05 10:03:46	http://127.0.0.1:8000/allfiles/pbzsSJPSPDHR6vXQSBaFMPh7AIIOQFyOwVdprZ60.jpg		upload file	sensitive data	111	101	9	10	23	8	today	inactive
107	NEWfile	9	442	101	327pm	2023-10-05 10:04:30	http://127.0.0.1:8000/allfiles/TGQQ3k0xS208KAPVuyBHAKBUdEbbD3YS4f7bZwBk.jpg		upload file	sensitive data	111	101	9	10	23	8	today	inactive
108	NEWfile	9	442	101	327pm	2023-10-05 10:05:01	http://127.0.0.1:8000/allfiles/DKdlF27qph4IR4LlYOhP4HsXIBmbKfGUVbrQ6pu4.txt		upload file	sensitive data	111	101	9	10	23	8	today	inactive
109	NEWfile	9	442	101	327pm	2023-10-05 10:05:59	http://127.0.0.1:8000/allfiles/OzuhIdi0lsBTqg5I7hbGH0GKbo44bJWF16ujqiy2.txt		upload file	sensitive data	111	101	9	10	23	8	today	inactive
110	NEWfile	9	442	101	327pm	2023-10-05 10:06:57	http://127.0.0.1:8000/allfiles/0qRXTur9Mk5vWUUdcwAfjhnZh45ttwVe86Y98MvX.txt		upload file	sensitive data	111	101	9	10	23	8	today	inactive
111	NEWfile	9	442	101	327pm	2023-10-05 10:07:41	http://127.0.0.1:8000/allfiles/FYccGTJmfyPtMtkTMy4cdGm9SNEdGH1X62T6yqO0.txt		upload file	sensitive data	111	101	9	10	23	8	today	inactive
112	NEWfile	9	442	101	327pm		legit source		upload file	sensitive data	111	101	9	10	23	8	today	inactive
113	POLICY	2		1	05-OCT-2023	05-OCT-2023	8709041598324442/pdf.pdf			<p>FROM CBN</p>	RRTTRTR	1	5558	5558	5	6	05-OCT-2023	2
114	NEWfile	9	442	101	327pm		legit source		upload file	sensitive data	111	101	9	10	23	8	today	inactive
115	NEWfile	9	442	101	327pm	2023-10-05 11:51:21	http://127.0.0.1:8000/allfiles/aH5ILLKpR0PxwqgkTKpEvWfNt7YgGjCys77UnvY4.txt		upload file	sensitive data	111	101	9	10	23	8	today	inactive
116	NEWfile	9	442	101	327pm	2023-10-05 11:52:27	http://127.0.0.1:8000/allfiles/1UZMGQtXQTWOVzgA98hYx8TujIeYHZ1vG1ob9PBi.txt		upload file	sensitive data	111	101	9	10	23	8	today	inactive
\.


--
-- Data for Name: ctl_document_type; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.ctl_document_type (id, name, status, created_at, updated_at) FROM stdin;
1	Policy	\N	25-MAR-23 08.51.00.125588000 PM	\N
2	Procedure	\N	25-MAR-23 08.51.00.126180000 PM	\N
\.


--
-- Data for Name: ctl_general_ledger_hist; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.ctl_general_ledger_hist (id, branch_code, account_number, gl_code, currency_code, account_name, prev_bal, cur_bal, bal, cur_date, prev_date, created_at, exchange_rate, debited, credited) FROM stdin;
5965168	1	1035010011	103501	USD	INTERBRANCH ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965170	1	1035010002	103501	USD	INTER-BRANCH LINKING ACCOUNT E	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965171	1	1035010004	103501	USD	INTERBRANCH  FOR BILLS FOR COL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965174	1	8010080020	103501	USD	INTERBRANCH FOR LC IMPORT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965175	1	1035010015	103501	USD	INTERBRANCH ACCOUNTS	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965177	1	1035010001	103501	USD	INTER-BRANCH LINKING ACCOUNT E	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965179	1	1035010005	103501	USD	INTERBRANCH FOR LC IMPORT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965181	1	1035010001	103501	USD	INTER-BRANCH LINKING ACCOUNT E	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965183	1	1035010011	103501	USD	INTERBRANCH ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965185	1	1035010005	103501	USD	INTERBRANCH FOR LC IMPORT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965188	1	1035010003	103501	USD	INTERBRANCH ACCOUNT FOR BILLS	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965190	1	1035010001	103501	USD	INTER-BRANCH LINKING ACCOUNT E	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965192	1	1035010003	103501	USD	INTERBRANCH ACCOUNT FOR BILLS	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965194	1	1035010012	103501	USD	INTERBRANCH ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965196	1	1035010011	103501	USD	INTERBRANCH ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965198	1	8010080020	103501	USD	INTERBRANCH FOR LC IMPORT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965200	1	8010080020	103501	USD	INTERBRANCH FOR LC IMPORT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965202	1	1035010015	103501	USD	INTERBRANCH ACCOUNTS	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965529	1	1035010011	103501	USD	INTERBRANCH ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965531	1	1035010015	103501	USD	INTERBRANCH ACCOUNTS	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965534	1	1035010015	103501	USD	INTERBRANCH ACCOUNTS	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965536	1	1035010001	103501	USD	INTER-BRANCH LINKING ACCOUNT E	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965538	1	1035010002	103501	USD	INTER-BRANCH LINKING ACCOUNT E	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965540	1	1035010004	103501	USD	INTERBRANCH  FOR BILLS FOR COL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965542	1	1035010012	103501	USD	INTERBRANCH ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965544	1	1035010003	103501	USD	INTERBRANCH ACCOUNT FOR BILLS	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965546	1	1035010003	103501	USD	INTERBRANCH ACCOUNT FOR BILLS	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965548	1	1035010001	103501	USD	INTER-BRANCH LINKING ACCOUNT E	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965550	1	1035010003	103501	USD	INTERBRANCH ACCOUNT FOR BILLS	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965552	1	1035010015	103501	USD	INTERBRANCH ACCOUNTS	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965554	1	1035010012	103501	USD	INTERBRANCH ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965556	1	1035010003	103501	USD	INTERBRANCH ACCOUNT FOR BILLS	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965557	1	1035010002	103501	USD	INTER-BRANCH LINKING ACCOUNT E	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965559	1	1035010004	103501	USD	INTERBRANCH  FOR BILLS FOR COL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965561	1	1035010005	103501	USD	INTERBRANCH FOR LC IMPORT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965563	1	1035010001	103501	USD	INTER-BRANCH LINKING ACCOUNT E	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965565	1	1035010005	103501	USD	INTERBRANCH FOR LC IMPORT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965568	1	8010080020	103501	USD	INTERBRANCH FOR LC IMPORT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965570	1	1035010001	103501	USD	INTER-BRANCH LINKING ACCOUNT E	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965572	1	1035010012	103501	USD	INTERBRANCH ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965573	1	1035010003	103501	USD	INTERBRANCH ACCOUNT FOR BILLS	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965575	1	1035010011	103501	USD	INTERBRANCH ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965577	1	1035010011	103501	USD	INTERBRANCH ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965579	1	1035010015	103501	USD	INTERBRANCH ACCOUNTS	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965581	1	1035010002	103501	USD	INTER-BRANCH LINKING ACCOUNT E	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965584	1	1035010005	103501	USD	INTERBRANCH FOR LC IMPORT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965586	1	1035010012	103501	USD	INTERBRANCH ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965588	1	8010080020	103501	USD	INTERBRANCH FOR LC IMPORT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965590	1	8010080020	103501	USD	INTERBRANCH FOR LC IMPORT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965591	1	1035010002	103501	USD	INTER-BRANCH LINKING ACCOUNT E	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965593	1	1035010004	103501	USD	INTERBRANCH  FOR BILLS FOR COL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965595	1	1035010005	103501	USD	INTERBRANCH FOR LC IMPORT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965597	1	8010080020	103501	USD	INTERBRANCH FOR LC IMPORT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965600	1	1035010002	103501	USD	INTER-BRANCH LINKING ACCOUNT E	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965601	1	1035010004	103501	USD	INTERBRANCH  FOR BILLS FOR COL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965603	1	1035010001	103501	USD	INTER-BRANCH LINKING ACCOUNT E	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965605	1	1035010005	103501	USD	INTERBRANCH FOR LC IMPORT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965607	1	1035010005	103501	USD	INTERBRANCH FOR LC IMPORT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965609	1	1035010003	103501	USD	INTERBRANCH ACCOUNT FOR BILLS	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965611	1	1035010002	103501	USD	INTER-BRANCH LINKING ACCOUNT E	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965612	1	1035010001	103501	USD	INTER-BRANCH LINKING ACCOUNT E	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965614	1	1035010012	103501	USD	INTERBRANCH ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965617	1	1035010011	103501	USD	INTERBRANCH ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965619	1	1035010002	103501	USD	INTER-BRANCH LINKING ACCOUNT E	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965621	1	1035010004	103501	USD	INTERBRANCH  FOR BILLS FOR COL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965623	1	1035010004	103501	USD	INTERBRANCH  FOR BILLS FOR COL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965625	1	8010080020	103501	USD	INTERBRANCH FOR LC IMPORT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965627	1	1035010011	103501	USD	INTERBRANCH ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965629	1	1035010015	103501	USD	INTERBRANCH ACCOUNTS	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965631	1	8010080020	103501	USD	INTERBRANCH FOR LC IMPORT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965633	1	1035010003	103501	USD	INTERBRANCH ACCOUNT FOR BILLS	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965634	1	1035010011	103501	USD	INTERBRANCH ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960925	1	1015010001	101501	USD	FCMB-UK MAIN ACCT (USD)	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960929	1	1015010001	101501	USD	FCMB-UK MAIN ACCT (USD)	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960930	1	1015010002	101501	USD	FCMBUK (USD) CASH COLLATERAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965654	1	1035010002	103501	USD	INTER-BRANCH LINKING ACCOUNT E	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965656	1	8010080020	103501	USD	INTERBRANCH FOR LC IMPORT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965658	1	1035010012	103501	USD	INTERBRANCH ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965659	1	1035010015	103501	USD	INTERBRANCH ACCOUNTS	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965660	1	1035010002	103501	USD	INTER-BRANCH LINKING ACCOUNT E	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965661	1	1035010001	103501	USD	INTER-BRANCH LINKING ACCOUNT E	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965662	1	1035010005	103501	USD	INTERBRANCH FOR LC IMPORT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965663	1	1035010004	103501	USD	INTERBRANCH  FOR BILLS FOR COL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965664	1	1035010012	103501	USD	INTERBRANCH ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965665	1	1035010003	103501	USD	INTERBRANCH ACCOUNT FOR BILLS	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965666	1	1035010005	103501	USD	INTERBRANCH FOR LC IMPORT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965667	1	1035010012	103501	USD	INTERBRANCH ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965668	1	1035010003	103501	USD	INTERBRANCH ACCOUNT FOR BILLS	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965669	1	1035010011	103501	USD	INTERBRANCH ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965670	1	1035020002	103502	USD	INTER-BRANCH LINKING ACCOUNT B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965671	1	1035020002	103502	USD	INTER-BRANCH LINKING ACCOUNT B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965672	1	1035020001	103502	USD	INTER-BRANCH LINKING ACCOUNT B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965673	1	1035020001	103502	USD	INTER-BRANCH LINKING ACCOUNT B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965674	1	1035020001	103502	USD	INTER-BRANCH LINKING ACCOUNT B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965675	1	1035020002	103502	USD	INTER-BRANCH LINKING ACCOUNT B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965676	1	1035020002	103502	USD	INTER-BRANCH LINKING ACCOUNT B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965677	1	1035020001	103502	USD	INTER-BRANCH LINKING ACCOUNT B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965678	1	1035020002	103502	USD	INTER-BRANCH LINKING ACCOUNT B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965679	1	1035020001	103502	USD	INTER-BRANCH LINKING ACCOUNT B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965680	1	1035020002	103502	USD	INTER-BRANCH LINKING ACCOUNT B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965681	1	1035020001	103502	USD	INTER-BRANCH LINKING ACCOUNT B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965682	1	1035020002	103502	USD	INTER-BRANCH LINKING ACCOUNT B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965683	1	1035020002	103502	USD	INTER-BRANCH LINKING ACCOUNT B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965684	1	1035020001	103502	USD	INTER-BRANCH LINKING ACCOUNT B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965685	1	1035020001	103502	USD	INTER-BRANCH LINKING ACCOUNT B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965686	1	1035020002	103502	USD	INTER-BRANCH LINKING ACCOUNT B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965687	1	1035020002	103502	USD	INTER-BRANCH LINKING ACCOUNT B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965688	1	1035020001	103502	USD	INTER-BRANCH LINKING ACCOUNT B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965689	1	1035020002	103502	USD	INTER-BRANCH LINKING ACCOUNT B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965690	1	1035020001	103502	USD	INTER-BRANCH LINKING ACCOUNT B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965691	1	1035020001	103502	USD	INTER-BRANCH LINKING ACCOUNT B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965692	1	1035020001	103502	USD	INTER-BRANCH LINKING ACCOUNT B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965693	1	1035020001	103502	USD	INTER-BRANCH LINKING ACCOUNT B	0	-296933.85	-296933.85	19-SEP-2022	18-SEP-2022		415.77	0	0
5966438	1	1035020002	103502	USD	INTER-BRANCH LINKING ACCOUNT B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5966439	1	1035020002	103502	USD	INTER-BRANCH LINKING ACCOUNT B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5966440	1	1035020001	103502	USD	INTER-BRANCH LINKING ACCOUNT B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5966441	1	1035020002	103502	USD	INTER-BRANCH LINKING ACCOUNT B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5966442	1	1035020001	103502	USD	INTER-BRANCH LINKING ACCOUNT B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5966443	1	1035020001	103502	USD	INTER-BRANCH LINKING ACCOUNT B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5966444	1	1035020002	103502	USD	INTER-BRANCH LINKING ACCOUNT B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960873	1	1014010002	101401	USD	CBN-CURRENT A/C	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960876	1	1014010002	101401	USD	CBN-CURRENT A/C	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960878	1	1014010002	101401	USD	CBN-CURRENT A/C	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960882	1	1014010002	101401	USD	CBN-CURRENT A/C	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960885	1	1014010002	101401	USD	CBN-CURRENT A/C	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960888	1	1014010002	101401	USD	CBN-CURRENT A/C	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960890	1	1014010002	101401	USD	CBN-CURRENT A/C	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960894	1	1014010002	101401	USD	CBN-CURRENT A/C	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960897	1	1014010002	101401	USD	CBN-CURRENT A/C	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960900	1	1014090001	101409	USD	FCMB NIG GBP-DOM	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960903	1	1015010001	101501	USD	FCMB-UK MAIN ACCT (USD)	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960906	1	1015010001	101501	USD	FCMB-UK MAIN ACCT (USD)	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960907	1	1015010001	101501	USD	FCMB-UK MAIN ACCT (USD)	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960910	1	1015010001	101501	USD	FCMB-UK MAIN ACCT (USD)	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960913	1	1015010001	101501	USD	FCMB-UK MAIN ACCT (USD)	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960916	1	1015010001	101501	USD	FCMB-UK MAIN ACCT (USD)	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960919	1	1015010001	101501	USD	FCMB-UK MAIN ACCT (USD)	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960921	1	1015010001	101501	USD	FCMB-UK MAIN ACCT (USD)	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962253	1	1022030004	102203	USD	MURABAHA WAKALA CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962254	1	1022030001	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962255	1	1022030004	102203	USD	MURABAHA WAKALA CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962256	1	1022030002	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962257	1	1022030002	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962258	1	1022030002	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962259	1	1022030004	102203	USD	MURABAHA WAKALA CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962260	1	1022030001	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962261	1	1022030002	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962262	1	1022030003	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960934	1	1015010001	101501	USD	FCMB-UK MAIN ACCT (USD)	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960935	1	1015010003	101501	USD	FCMB-UK (USD) PROFIT ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960937	1	1015010001	101501	USD	FCMB-UK MAIN ACCT (USD)	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960943	1	1015010001	101501	USD	FCMB-UK MAIN ACCT (USD)	0	-1234936.47	-1234936.47	19-SEP-2022	18-SEP-2022		415.77	0	9236.55
5960946	1	1015010001	101501	USD	FCMB-UK MAIN ACCT (USD)	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960949	1	1015010001	101501	USD	FCMB-UK MAIN ACCT (USD)	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960952	1	1015010003	101501	USD	FCMB-UK (USD) PROFIT ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960954	1	1015010002	101501	USD	FCMBUK (USD) CASH COLLATERAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960957	1	1015010001	101501	USD	FCMB-UK MAIN ACCT (USD)	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960960	1	1015010002	101501	USD	FCMBUK (USD) CASH COLLATERAL	0	-1344499.03	-1344499.03	19-SEP-2022	18-SEP-2022		415.77	0	0
5960963	1	1015010003	101501	USD	FCMB-UK (USD) PROFIT ACCOUNT	0	-130608.98	-130608.98	19-SEP-2022	18-SEP-2022		415.77	0	0
5960966	1	1015020001	101502	USD	FIRST BANK UK ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960969	1	1015020001	101502	USD	FIRST BANK UK ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960972	1	1015020001	101502	USD	FIRST BANK UK ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960974	1	1015020001	101502	USD	FIRST BANK UK ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960977	1	1015020001	101502	USD	FIRST BANK UK ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960981	1	1015020001	101502	USD	FIRST BANK UK ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960985	1	1015020001	101502	USD	FIRST BANK UK ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961473	1	1015020001	101502	USD	FIRST BANK UK ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961474	1	1015020001	101502	USD	FIRST BANK UK ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961475	1	1015020001	101502	USD	FIRST BANK UK ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961476	1	1015020001	101502	USD	FIRST BANK UK ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961477	1	1015020001	101502	USD	FIRST BANK UK ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961478	1	1015020001	101502	USD	FIRST BANK UK ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961479	1	1015020001	101502	USD	FIRST BANK UK ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961480	1	1015020001	101502	USD	FIRST BANK UK ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961481	1	1015020001	101502	USD	FIRST BANK UK ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961482	1	1015030001	101503	USD	UNITED BANK OF AFRICA-PROFIT A	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961483	1	1015030001	101503	USD	UNITED BANK OF AFRICA-PROFIT A	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961484	1	1015030001	101503	USD	UNITED BANK OF AFRICA-PROFIT A	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961485	1	1015030001	101503	USD	UNITED BANK OF AFRICA-PROFIT A	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961486	1	1015030001	101503	USD	UNITED BANK OF AFRICA-PROFIT A	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961487	1	1015030001	101503	USD	UNITED BANK OF AFRICA-PROFIT A	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961488	1	1015030001	101503	USD	UNITED BANK OF AFRICA-PROFIT A	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961489	1	1015030001	101503	USD	UNITED BANK OF AFRICA-PROFIT A	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961490	1	1015030002	101503	USD	UBA-(USD) LC CASH COLLATERAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961491	1	1015030003	101503	USD	UBA-(USD) EXPORT DOM ACCT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961492	1	1015030004	101503	USD	UBA-(USD) MAIN ACCT (NEW YORK)	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961493	1	1015030001	101503	USD	UNITED BANK OF AFRICA-PROFIT A	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961494	1	1015030001	101503	USD	UNITED BANK OF AFRICA-PROFIT A	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961495	1	1015030001	101503	USD	UNITED BANK OF AFRICA-PROFIT A	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960758	1	1010020002	101002	USD	USD TELLER TILL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	247850	239850
5960759	1	1010020003	101002	USD	TELLER CASH	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960760	1	1010020003	101002	USD	TELLER CASH	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960761	1	1010020004	101002	USD	TELLER CASH	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960762	1	1010020004	101002	USD	TELLER CASH	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960763	1	1010020004	101002	USD	TELLER CASH	0	0	0	19-SEP-2022	18-SEP-2022		415.77	500	500
5960764	1	1010020001	101002	USD	TELLER CASH	0	0	0	19-SEP-2022	18-SEP-2022		415.77	500	500
5960765	1	1010020001	101002	USD	TELLER CASH	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960766	1	1010020002	101002	USD	USD TELLER TILL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960767	1	1010020003	101002	USD	TELLER CASH	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960768	1	1010020004	101002	USD	TELLER CASH	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960769	1	1010020002	101002	USD	USD TELLER TILL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960770	1	1010020003	101002	USD	TELLER CASH	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960771	1	1010020002	101002	USD	USD TELLER TILL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960772	1	1010020003	101002	USD	TELLER CASH	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960773	1	1010020004	101002	USD	TELLER CASH	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960774	1	1011020001	101102	USD	VAULT - NOTES	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960776	1	1011020001	101102	USD	VAULT - NOTES	0	-73580	-73580	19-SEP-2022	18-SEP-2022		415.77	0	1200
5960777	1	1011020001	101102	USD	VAULT - NOTES	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960778	1	1011020001	101102	USD	VAULT - NOTES	0	-501	-501	19-SEP-2022	18-SEP-2022		415.77	0	0
5960779	1	1011020001	101102	USD	VAULT - NOTES	0	-150	-150	19-SEP-2022	18-SEP-2022		415.77	0	0
5960780	1	1011020001	101102	USD	VAULT - NOTES	0	-6845	-6845	19-SEP-2022	18-SEP-2022		415.77	0	0
5960781	1	1011020001	101102	USD	VAULT - NOTES	0	-16899	-16899	19-SEP-2022	18-SEP-2022		415.77	0	0
5960782	1	1011020001	101102	USD	VAULT - NOTES	0	-11209	-11209	19-SEP-2022	18-SEP-2022		415.77	300	0
5960783	1	1011020001	101102	USD	VAULT - NOTES	0	-4050	-4050	19-SEP-2022	18-SEP-2022		415.77	0	0
5960785	1	1011020001	101102	USD	VAULT - NOTES	0	-44800	-44800	19-SEP-2022	18-SEP-2022		415.77	0	0
5960787	1	1011020001	101102	USD	VAULT - NOTES	0	-76793	-76793	19-SEP-2022	18-SEP-2022		415.77	0	0
5960789	1	1011020001	101102	USD	VAULT - NOTES	0	-310	-310	19-SEP-2022	18-SEP-2022		415.77	0	0
5960791	1	1011020001	101102	USD	VAULT - NOTES	0	-13712	-13712	19-SEP-2022	18-SEP-2022		415.77	0	0
5960793	1	1011020001	101102	USD	VAULT - NOTES	0	-3416107	-3416107	19-SEP-2022	18-SEP-2022		415.77	7300	46050
5960795	1	1011020001	101102	USD	VAULT - NOTES	0	-26	-26	19-SEP-2022	18-SEP-2022		415.77	0	500
5961546	1	1015240001	101524	USD	AFREXIMBANK USD NOSTRO ACCOUNT	0	-5440204.45	-5440204.45	19-SEP-2022	18-SEP-2022		415.77	1525131.86	1738813.09
5961547	1	1015250001	101525	USD	AFREXIM BANK USD CASH COLLATER	0	-589540.06	-589540.06	19-SEP-2022	18-SEP-2022		415.77	0	0
5961548	1	1015230001	101526	USD	BANK OF BEIRUT MAIN OPERATING	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961549	1	1015260001	101526	USD	BANK OF BEIRUT MAIN OPERATING	0	-858467.1	-858467.1	19-SEP-2022	18-SEP-2022		415.77	484320.16	521536.81
5961550	1	1015270001	101527	USD	ACCESS BANK UK CASH COLLAT USD	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961551	1	1015300001	101530	USD	BANK OF BEIRUT CASH COLLAT USD	0	-540125	-540125	19-SEP-2022	18-SEP-2022		415.77	0	0
5961552	1	1015400001	101540	USD	MASTERCARD USD CASH COLLAT	0	-100000	-100000	19-SEP-2022	18-SEP-2022		415.77	0	0
5961553	1	1016800001	101680	USD	FX TRADING ACCOUNT	0	-1016905.8	-1016905.8	19-SEP-2022	18-SEP-2022		415.77	0	0
5961554	1	1017090001	101709	USD	USD MURABAHA COR FINANCE	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961555	1	864504	101709	USD	USD-MURABAHA FINANCE	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961556	1	701649	101709	USD	USD-MURABAHA FINANCE	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961557	1	1021100001	102110	USD	IJARAH OF SERVICE	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961558	1	1021100001	102110	USD	IJARAH OF SERVICE	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961559	1	1021100001	102110	USD	IJARAH OF SERVICE	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961560	1	1021100001	102110	USD	IJARAH OF SERVICE	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961561	1	1021100001	102110	USD	IJARAH OF SERVICE	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961562	1	1021100001	102110	USD	IJARAH OF SERVICE	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961563	1	1021100001	102110	USD	IJARAH OF SERVICE	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961564	1	1021100001	102110	USD	IJARAH OF SERVICE	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961565	1	1021100001	102110	USD	IJARAH OF SERVICE	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961566	1	1021100001	102110	USD	IJARAH OF SERVICE	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961567	1	1021100001	102110	USD	IJARAH OF SERVICE	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961568	1	1021100001	102110	USD	IJARAH OF SERVICE	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961569	1	1021100001	102110	USD	IJARAH OF SERVICE	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961570	1	1021100001	102110	USD	IJARAH OF SERVICE	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961571	1	1021100001	102110	USD	IJARAH OF SERVICE	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961572	1	1021100001	102110	USD	IJARAH OF SERVICE	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961573	1	1021100001	102110	USD	IJARAH OF SERVICE	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961574	1	1022020001	102202	USD	IJARA HOME ASSET CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962208	1	1022020001	102202	USD	IJARA HOME ASSET CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962209	1	1022020001	102202	USD	IJARA HOME ASSET CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962210	1	1022020001	102202	USD	IJARA HOME ASSET CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962211	1	1022020001	102202	USD	IJARA HOME ASSET CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962212	1	1022020001	102202	USD	IJARA HOME ASSET CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962213	1	1022020001	102202	USD	IJARA HOME ASSET CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962214	1	1022020001	102202	USD	IJARA HOME ASSET CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962215	1	1022020001	102202	USD	IJARA HOME ASSET CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962216	1	1022020001	102202	USD	IJARA HOME ASSET CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962217	1	1022020001	102202	USD	IJARA HOME ASSET CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962218	1	1022020001	102202	USD	IJARA HOME ASSET CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962219	1	1022020001	102202	USD	IJARA HOME ASSET CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962220	1	1022020001	102202	USD	IJARA HOME ASSET CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962221	1	1022020001	102202	USD	IJARA HOME ASSET CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962222	1	1022020001	102202	USD	IJARA HOME ASSET CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962223	1	1022030004	102203	USD	MURABAHA WAKALA CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962224	1	1022030001	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962225	1	1022030003	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962226	1	1022030002	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962227	1	1022030001	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962228	1	1022030004	102203	USD	MURABAHA WAKALA CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962229	1	1022030003	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962230	1	1022030003	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962231	1	1022030004	102203	USD	MURABAHA WAKALA CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962232	1	1022030002	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962233	1	1022030003	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962234	1	1022030002	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962235	1	1022030001	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962236	1	1022030002	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962237	1	1022030001	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962238	1	1022030003	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962239	1	1022030004	102203	USD	MURABAHA WAKALA CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962240	1	1022030001	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962241	1	1022030004	102203	USD	MURABAHA WAKALA CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962242	1	1022030001	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962243	1	1022030001	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962244	1	1022030004	102203	USD	MURABAHA WAKALA CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962245	1	1022030002	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962246	1	1022030003	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962247	1	1022030004	102203	USD	MURABAHA WAKALA CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962248	1	1022030002	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962249	1	1022030003	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962250	1	1022030003	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962251	1	1022030002	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962252	1	1022030001	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960798	1	1011020001	101102	USD	VAULT - NOTES	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960799	1	1011020001	101102	USD	VAULT - NOTES	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960801	1	1012020001	101202	USD	ATM DEPOSIT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960804	1	1012020001	101202	USD	ATM DEPOSIT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960805	1	1012020001	101202	USD	ATM DEPOSIT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960808	1	1012020001	101202	USD	ATM DEPOSIT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960756	1	1010020001	101002	USD	TELLER CASH	0	0	0	19-SEP-2022	18-SEP-2022		415.77	53350	53350
5960757	1	1010020002	101002	USD	USD TELLER TILL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960810	1	1012020001	101202	USD	ATM DEPOSIT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960812	1	1012020001	101202	USD	ATM DEPOSIT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960814	1	1012020001	101202	USD	ATM DEPOSIT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960816	1	1012020001	101202	USD	ATM DEPOSIT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960819	1	1012020001	101202	USD	ATM DEPOSIT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960821	1	1012020001	101202	USD	ATM DEPOSIT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960823	1	1012020001	101202	USD	ATM DEPOSIT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960825	1	1012020001	101202	USD	ATM DEPOSIT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960827	1	1012020001	101202	USD	ATM DEPOSIT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960831	1	1012020001	101202	USD	ATM DEPOSIT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960834	1	1012020001	101202	USD	ATM DEPOSIT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960837	1	1012020001	101202	USD	ATM DEPOSIT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960840	1	1012020001	101202	USD	ATM DEPOSIT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960843	1	1013020001	101302	USD	CASH IN HAND	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960845	1	1013020001	101302	USD	CASH IN HAND	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960849	1	1013020001	101302	USD	CASH IN HAND	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960851	1	1014010002	101401	USD	CBN-CURRENT A/C	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960855	1	1014010002	101401	USD	CBN-CURRENT A/C	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960858	1	1014010002	101401	USD	CBN-CURRENT A/C	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960862	1	1014010002	101401	USD	CBN-CURRENT A/C	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960864	1	1014010002	101401	USD	CBN-CURRENT A/C	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960867	1	1014010002	101401	USD	CBN-CURRENT A/C	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5960870	1	1014010002	101401	USD	CBN-CURRENT A/C	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961496	1	1015030001	101503	USD	UNITED BANK OF AFRICA-PROFIT A	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961497	1	1015030001	101503	USD	UNITED BANK OF AFRICA-PROFIT A	0	-9300.35	-9300.35	19-SEP-2022	18-SEP-2022		415.77	0	614.18
5961498	1	1015030001	101503	USD	UNITED BANK OF AFRICA-PROFIT A	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961499	1	1015030004	101503	USD	UBA-(USD) MAIN ACCT (NEW YORK)	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961500	1	1015030001	101503	USD	UNITED BANK OF AFRICA-PROFIT A	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961501	1	1015030001	101503	USD	UNITED BANK OF AFRICA-PROFIT A	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961502	1	1015030002	101503	USD	UBA-(USD) LC CASH COLLATERAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961503	1	1015030003	101503	USD	UBA-(USD) EXPORT DOM ACCT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961504	1	1015030002	101503	USD	UBA-(USD) LC CASH COLLATERAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961506	1	1015030003	101503	USD	UBA-(USD) EXPORT DOM ACCT	0	-1598112.61	-1598112.61	19-SEP-2022	18-SEP-2022		415.77	0	0
5961507	1	1015030004	101503	USD	UBA-(USD) MAIN ACCT (NEW YORK)	0	-1111420.34	-1111420.34	19-SEP-2022	18-SEP-2022		415.77	40000	425875
5961508	1	1015040001	101504	USD	ZENITH B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961509	1	1015040001	101504	USD	ZENITH B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961510	1	1015040001	101504	USD	ZENITH B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961511	1	1015040001	101504	USD	ZENITH B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961512	1	1015040001	101504	USD	ZENITH B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961513	1	1015040001	101504	USD	ZENITH B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961514	1	1015040001	101504	USD	ZENITH B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961515	1	1015040001	101504	USD	ZENITH B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961516	1	1015040001	101504	USD	ZENITH B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961517	1	1015040001	101504	USD	ZENITH B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961518	1	1015040001	101504	USD	ZENITH B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961519	1	1015040002	101504	USD	MAIN OPERATING ACCT USD ZENITH	0	-199138.89	-199138.89	19-SEP-2022	18-SEP-2022		415.77	0	0
5961520	1	1015040003	101504	USD	ZENITH-UK-USD CASH COLLATTERAL	0	-540469.19	-540469.19	19-SEP-2022	18-SEP-2022		415.77	0	0
5961521	1	1015040001	101504	USD	ZENITH B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961522	1	1015040001	101504	USD	ZENITH B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961523	1	1015040001	101504	USD	ZENITH B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961524	1	1015040001	101504	USD	ZENITH B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961525	1	1015040001	101504	USD	ZENITH B	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961526	1	1015090001	101509	USD	ACCESS BANK UK MAIN OPERATING	0	-520939.55	-520939.55	19-SEP-2022	18-SEP-2022		415.77	0	0
5961527	1	1015100001	101510	USD	FIRST BANK NIG	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961528	1	1015100001	101510	USD	FIRST BANK NIG	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961529	1	1015100001	101510	USD	FIRST BANK NIG	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961530	1	1015100001	101510	USD	FIRST BANK NIG	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961531	1	1015100001	101510	USD	FIRST BANK NIG	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961532	1	1015100001	101510	USD	FIRST BANK NIG	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961533	1	1015100001	101510	USD	FIRST BANK NIG	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961534	1	1015100001	101510	USD	FIRST BANK NIG	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961535	1	1015100001	101510	USD	FIRST BANK NIG	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961536	1	1015100001	101510	USD	FIRST BANK NIG	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961537	1	1015100001	101510	USD	FIRST BANK NIG	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961538	1	1015100001	101510	USD	FIRST BANK NIG	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961539	1	1015100001	101510	USD	FIRST BANK NIG	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961540	1	1015100001	101510	USD	FIRST BANK NIG	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961541	1	1015100001	101510	USD	FIRST BANK NIG	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961542	1	1015100001	101510	USD	FIRST BANK NIG	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961543	1	1015120001	101512	USD	FCMB NIG-DOM	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5961544	1	1015120001	101512	USD	FCMB NIG-DOM	0	-3298206.33	-3298206.33	19-SEP-2022	18-SEP-2022		415.77	1020111.53	0
5961545	1	1015120001	101512	USD	FCMB NIG-DOM	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965636	1	1035010001	103501	USD	INTER-BRANCH LINKING ACCOUNT E	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965638	1	1035010015	103501	USD	INTERBRANCH ACCOUNTS	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965640	1	8010080020	103501	USD	INTERBRANCH FOR LC IMPORT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965642	1	1035010001	103501	USD	INTER-BRANCH LINKING ACCOUNT E	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965644	1	1035010004	103501	USD	INTERBRANCH  FOR BILLS FOR COL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965645	1	1035010005	103501	USD	INTERBRANCH FOR LC IMPORT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965648	1	1035010012	103501	USD	INTERBRANCH ACCOUNT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965649	1	1035010003	103501	USD	INTERBRANCH ACCOUNT FOR BILLS	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5965652	1	1035010015	103501	USD	INTERBRANCH ACCOUNTS	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962263	1	1022030004	102203	USD	MURABAHA WAKALA CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962264	1	1022030004	102203	USD	MURABAHA WAKALA CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962265	1	1022030003	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962266	1	1022030001	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962267	1	1022030003	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962268	1	1022030001	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962269	1	1022030001	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962270	1	1022030003	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962271	1	1022030002	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962272	1	1022030002	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962273	1	1022030002	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962274	1	1022030001	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962275	1	1022030003	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962276	1	1022030002	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962278	1	1022030003	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962279	1	1022030003	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962280	1	1022030001	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962281	1	1022030004	102203	USD	MURABAHA WAKALA CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962282	1	1022030001	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962283	1	1022030003	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962284	1	1022030004	102203	USD	MURABAHA WAKALA CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962285	1	1022030004	102203	USD	MURABAHA WAKALA CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962286	1	1022030004	102203	USD	MURABAHA WAKALA CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962287	1	1022030002	102203	USD	MURABAHA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962288	1	1022040001	102204	USD	ISTISNAA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962289	1	1022040001	102204	USD	ISTISNAA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962290	1	1022040001	102204	USD	ISTISNAA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962291	1	1022040001	102204	USD	ISTISNAA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962292	1	1022040001	102204	USD	ISTISNAA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962293	1	1022040001	102204	USD	ISTISNAA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962294	1	1022040001	102204	USD	ISTISNAA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962295	1	1022040001	102204	USD	ISTISNAA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962296	1	1022040001	102204	USD	ISTISNAA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962297	1	1022040001	102204	USD	ISTISNAA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962298	1	1022040001	102204	USD	ISTISNAA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962299	1	1022040001	102204	USD	ISTISNAA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962300	1	1022040001	102204	USD	ISTISNAA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962301	1	1022040001	102204	USD	ISTISNAA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962302	1	1022040001	102204	USD	ISTISNAA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962303	1	1022040001	102204	USD	ISTISNAA GOODS CAPITAL	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962304	1	1023560001	102356	USD	MURABAHA-CBN DCRR CONTROL ACCT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962305	1	1023560001	102356	USD	MURABAHA-CBN DCRR CONTROL ACCT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962306	1	1023560001	102356	USD	MURABAHA-CBN DCRR CONTROL ACCT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962307	1	1023560001	102356	USD	MURABAHA-CBN DCRR CONTROL ACCT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962308	1	1023560001	102356	USD	MURABAHA-CBN DCRR CONTROL ACCT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962309	1	1023560001	102356	USD	MURABAHA-CBN DCRR CONTROL ACCT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962980	1	1023560001	102356	USD	MURABAHA-CBN DCRR CONTROL ACCT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962981	1	1023560001	102356	USD	MURABAHA-CBN DCRR CONTROL ACCT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962982	1	1023560001	102356	USD	MURABAHA-CBN DCRR CONTROL ACCT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962983	1	1023560001	102356	USD	MURABAHA-CBN DCRR CONTROL ACCT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962985	1	1023560001	102356	USD	MURABAHA-CBN DCRR CONTROL ACCT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962986	1	1023560001	102356	USD	MURABAHA-CBN DCRR CONTROL ACCT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962987	1	1023560001	102356	USD	MURABAHA-CBN DCRR CONTROL ACCT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962988	1	1023560001	102356	USD	MURABAHA-CBN DCRR CONTROL ACCT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962989	1	1023560001	102356	USD	MURABAHA-CBN DCRR CONTROL ACCT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962990	1	1023560001	102356	USD	MURABAHA-CBN DCRR CONTROL ACCT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962991	1	1023560001	102356	USD	MURABAHA-CBN DCRR CONTROL ACCT	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962992	1	1023570001	102357	USD	ISTISNA-CORPORATE-CBN DCRR	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962993	1	1023570001	102357	USD	ISTISNA-CORPORATE-CBN DCRR	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962994	1	1023570001	102357	USD	ISTISNA-CORPORATE-CBN DCRR	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962995	1	1023570001	102357	USD	ISTISNA-CORPORATE-CBN DCRR	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962996	1	1023570001	102357	USD	ISTISNA-CORPORATE-CBN DCRR	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962997	1	1023570001	102357	USD	ISTISNA-CORPORATE-CBN DCRR	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962998	1	1023570001	102357	USD	ISTISNA-CORPORATE-CBN DCRR	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5962999	1	1023570001	102357	USD	ISTISNA-CORPORATE-CBN DCRR	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963000	1	1023570001	102357	USD	ISTISNA-CORPORATE-CBN DCRR	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963001	1	1023570001	102357	USD	ISTISNA-CORPORATE-CBN DCRR	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963002	1	1023570001	102357	USD	ISTISNA-CORPORATE-CBN DCRR	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963003	1	1023570001	102357	USD	ISTISNA-CORPORATE-CBN DCRR	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963004	1	1023570001	102357	USD	ISTISNA-CORPORATE-CBN DCRR	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963005	1	1023570001	102357	USD	ISTISNA-CORPORATE-CBN DCRR	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963006	1	1023570001	102357	USD	ISTISNA-CORPORATE-CBN DCRR	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963007	1	1023570001	102357	USD	ISTISNA-CORPORATE-CBN DCRR	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963008	1	1023570001	102357	USD	ISTISNA-CORPORATE-CBN DCRR	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963009	1	1030030001	103003	USD	DIRECT DEBIT/STANDING ORDER	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963010	1	1030030001	103003	USD	DIRECT DEBIT/STANDING ORDER	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963011	1	1030030001	103003	USD	DIRECT DEBIT/STANDING ORDER	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963012	1	1030030002	103003	USD	DIRECT DEBIT/STANDING ORDER	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963013	1	1030030002	103003	USD	DIRECT DEBIT/STANDING ORDER	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963014	1	1030030002	103003	USD	DIRECT DEBIT/STANDING ORDER	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963015	1	1030030002	103003	USD	DIRECT DEBIT/STANDING ORDER	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963016	1	1030030002	103003	USD	DIRECT DEBIT/STANDING ORDER	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963017	1	1030030001	103003	USD	DIRECT DEBIT/STANDING ORDER	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963018	1	1030030002	103003	USD	DIRECT DEBIT/STANDING ORDER	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963019	1	1030030001	103003	USD	DIRECT DEBIT/STANDING ORDER	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963020	1	1030030002	103003	USD	DIRECT DEBIT/STANDING ORDER	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963021	1	1030030001	103003	USD	DIRECT DEBIT/STANDING ORDER	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963022	1	1030030002	103003	USD	DIRECT DEBIT/STANDING ORDER	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963023	1	1030030001	103003	USD	DIRECT DEBIT/STANDING ORDER	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963024	1	1030030002	103003	USD	DIRECT DEBIT/STANDING ORDER	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963025	1	1030030002	103003	USD	DIRECT DEBIT/STANDING ORDER	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963026	1	1030030001	103003	USD	DIRECT DEBIT/STANDING ORDER	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963027	1	1030030002	103003	USD	DIRECT DEBIT/STANDING ORDER	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963028	1	1030030001	103003	USD	DIRECT DEBIT/STANDING ORDER	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963029	1	1030030001	103003	USD	DIRECT DEBIT/STANDING ORDER	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963030	1	1030030001	103003	USD	DIRECT DEBIT/STANDING ORDER	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963031	1	1030030002	103003	USD	DIRECT DEBIT/STANDING ORDER	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963032	1	1030030002	103003	USD	DIRECT DEBIT/STANDING ORDER	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963033	1	1030030001	103003	USD	DIRECT DEBIT/STANDING ORDER	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963034	1	1030030002	103003	USD	DIRECT DEBIT/STANDING ORDER	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963035	1	1030030001	103003	USD	DIRECT DEBIT/STANDING ORDER	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963036	1	1030030001	103003	USD	DIRECT DEBIT/STANDING ORDER	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963037	1	1030030002	103003	USD	DIRECT DEBIT/STANDING ORDER	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963038	1	1030030001	103003	USD	DIRECT DEBIT/STANDING ORDER	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963039	1	1030030001	103003	USD	DIRECT DEBIT/STANDING ORDER	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963040	1	1030030002	103003	USD	DIRECT DEBIT/STANDING ORDER	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963041	1	1031060002	103101	USD	CLEARING SUSPENSE	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963042	1	1031060002	103101	USD	CLEARING SUSPENSE	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963043	1	1031060002	103101	USD	CLEARING SUSPENSE	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963044	1	1031060002	103101	USD	CLEARING SUSPENSE	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963045	1	1031060002	103101	USD	CLEARING SUSPENSE	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963046	1	1031060002	103101	USD	CLEARING SUSPENSE	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963047	1	1031060002	103101	USD	CLEARING SUSPENSE	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963048	1	1031060002	103101	USD	CLEARING SUSPENSE	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963049	1	1031060002	103101	USD	CLEARING SUSPENSE	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963050	1	1031060002	103101	USD	CLEARING SUSPENSE	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
5963051	1	1031060002	103101	USD	CLEARING SUSPENSE	0	0	0	19-SEP-2022	18-SEP-2022		415.77	0	0
\.


--
-- Data for Name: ctl_overdrawn_accounts; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.ctl_overdrawn_accounts (customer_name, account_number, branch_code, trans_date, currency_code, currency_id, balance, product_code, product_name, current_balance, account_officer_name, account_officer_id, customer_id, inti, email, phone_number, gl_code) FROM stdin;
HURLEY OBE	3927	671	15-OCT-2019	USD	840	0.00	111	DOMICILIARY-INDIVIDUAL	0.00	BILLY HANS	121	108	DOMICILIARY-INDIVIDUAL	imranhassan15@yahoo.com	8033396434	201007
ODIS ADRIEN	4144	1	17-OCT-2019	NGN	566	3184464.71	321	SAVINGS	3184464.71	DOUGLAS ALTO	112	119	SAVINGS	ameeyar@yahoo.com	8030835524	202008
DUNCAN EMILE	4199	2	17-OCT-2019	NGN	566	50.00	361	STAFF SAVINGS	50.00	HARDY CLEMENT	512	121	STAFF SAVINGS	shedracksmsn@gmail.com	8086898823	202008
EBB WILLARD	4405	2	22-OCT-2019	NGN	566	16.00	821	SAVINGS ACCT	16.00	LEMON FRANK	511	141	SAVINGS ACCT	\N	8174338245	202010
BAXTER SAMUEL	4412	1	22-OCT-2019	NGN	566	463.40	471	STAFF SALARY ACCOUNT	463.40	LON NEAL	000	139	STAFF SALARY ACCOUNT	elsafs227@gmail.com	8038005654	201002
LEWIS SHERMAN	4515	2	22-OCT-2019	NGN	566	20.00	321	SAVINGS	20.00	WARREN BARNEY	511	147	SAVINGS	ndukalu@yahoo.com	8147532696	202008
EARLY CAESAR	4539	1	22-OCT-2019	NGN	566	3668.25	361	STAFF SAVINGS	3668.25	JACOB LEWIS	000	136	STAFF SAVINGS	badejo_f@yahoo.com	7038386812	202008
LAVERNE ORANGE	1031210001	2	28-OCT-2019	NGN	566	0.00	\N	E-BANKING SETTELEMENT SUSPENSE	0.00	LOUIE BLAINE	852	10	E-BANKING SETTELEMENT SUSPENSE	\N	0	204061
LAVERNE ORANGE	1031210001	3	28-OCT-2019	NGN	566	0.00	\N	E-BANKING SETTELEMENT SUSPENSE	0.00	LOUIE BLAINE	852	150	E-BANKING SETTELEMENT SUSPENSE	\N	0	204061
WRIGHT BENJAMAN	4917	2	28-OCT-2019	NGN	566	255605.75	321	SAVINGS	255605.75	LUCIOUS DENNIS	512	159	SAVINGS	\N	8036789657	202008
\.


--
-- Data for Name: ctl_system; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.ctl_system (id, model_number, owner_1, owner_2, created_at, owner, approver_id, process_category, exception_process_id, additional_comment, approved_at, reference_number, name, category_id) FROM stdin;
1	POS675R3248	5324	5388	31-MAR-23 11.23.56.434133000 AM +00:00	4834	\N	266	17392	confirm assigned cash please	\N	\N	POS Machine 1	2
41	\N	4831	5509	06-MAY-23 11.50.07.701387000 AM +00:00	4829	\N	371	18127	ATM cards submission on a daily transaction	\N	\N	ATM Card	1
43	COM45252345	4830	4832	06-MAY-23 11.58.57.348200000 AM +00:00	5509	\N	261	17025	Document needs confirmation	\N	\N	Dell	4
2	model621	9	10	05:53	9	8	333	40	an additional comment	yesterday	1515	predator laptop	21
3	model621	9	10	05:53	9	8	333	40	an additional comment	yesterday	1515	predator laptop	21
4	model621	9	10	05:53	9	8	333	40	an additional comment	yesterday	1515	predator laptop	21
21	GG	7	9										5
42	PH9465959754	5557	5551	04-OCT-2023	5559		294	17548	Please check			Techno	21
81	2019	5509	4836	04-OCT-2023	5509		261	17034				Ios	21
\.


--
-- Data for Name: ctl_system_allocation; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.ctl_system_allocation (created_at, user_id, reference_number, status, category_id, system_id, approved_at, description, responsible_id, id, approver_id) FROM stdin;
01-AUG-23 01.54.24.377289000 PM	43	\N	draft	1	41	\N	\N	4836	43	\N
01-AUG-23 01.53.38.487065000 PM	43	\N	draft	1	\N	\N	\N	5509	42	\N
31-MAR-23 11.27.35.374313000 AM	43	POS7534682	approved	2	1	31-MAR-23 11.36.29.567172000 AM +00:00	Please check status	5083	1	43
07-SEP-23 02.34.55.115242000 PM	11	12345	draft	1	41	\N	new system allocation	4836	81	\N
06-MAY-23 12.00.43.014043000 PM	43	REF5926794375	draft	4	43	\N	Check for document	5509	21	\N
06-MAY-23 12.01.34.844545000 PM	43	COM4157283452	draft	3	21	\N	Repairs necessary	4837	22	\N
06-MAY-23 12.29.48.214482000 PM	43	PH54859679	draft	21	42	\N	\N	5509	23	\N
01-AUG-23 01.45.28.580005000 PM	43	\N	2	62	62	\N	\N	5509	41	\N
02-AUG-23 11.55.42.963721000 AM	43	334567865342	2	2	1	\N	Please Take care of it	5509	61	\N
2023	8	5050	draft	41	62	05:07am	good to go	10	1	\N
2023	8	5050	draft	41	62	05:07am	good to go	10	6	\N
2023	8	5050	draft	41	62	05:07am	good to go	10	7	\N
2023	8	5050	approved	41	62	05:07am	good to go	10	8	\N
\.


--
-- Data for Name: ctl_system_category; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.ctl_system_category (id, name, created_at, category_id) FROM stdin;
1	ATM	30-MAR-23 09.31.05.343812000 PM +00:00	1
2	POS	30-MAR-23 09.31.13.429229000 PM +00:00	1
4	DESKTOP COMPUTER	30-MAR-23 09.31.34.578718000 PM +00:00	1
5	AIR CONDITIONER	30-MAR-23 09.31.45.560369000 PM +00:00	1
3	LAPTOP	30-MAR-23 09.31.21.326419000 PM +00:00	1
21	PHONE	31-MAR-23 11.18.09.640961000 AM +00:00	1
6	POS TEST	10/02/2023	1
7	POS TEST	10/02/2023	1
8	POS TEST	02-03-2023	1
9	TEST	10/02/2023	1
10	TEST	10/02/2023	1
11	TEST	10/02/2023	4
20	TEST	10-02-2023	4
50	TEST	10-02-2023	4
12	TEST	10-02-2023	1
13	TEST5	02-OCT-2023	1
\.


--
-- Data for Name: ctr_report_types; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.ctr_report_types (id, name, slug) FROM stdin;
3	Outward Buffer	outward
4	Cash Deposit Foreign	foreign_deposit
6	Cash Withdrawal Foreign	foreign_withdrawal
8	Fx Inward	fx_inward
2	Account to Account	account
1	Inward Buffer	inward
5	Cash Deposit local	local_deposit
7	Cash Withdrawal Local	local_withdrawal
\.


--
-- Data for Name: ctr_transactions; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.ctr_transactions (id, t_account_number, t_trans_number, t_location, transaction_description, t_teller, t_authorized, t_late_deposit, t_transmode_code, t_amount_local, t_source_client_type, t_source_type, t_source_funds_code, t_source_currency_code, t_source_foreign_amount, t_source_exchange_rate, t_source_country, t_source_institution_code, t_source_institution_name, t_source_account_number, t_source_account_name, t_source_person_first_name, t_source_person_last_name, t_source_entity_name, t_dest_client_type, t_dest_type, t_dest_funds_code, t_dest_currency_code, t_dest_foreign_amount, t_dest_exchange_rate, t_dest_country, t_dest_institution_code, t_dest_institution_name, t_dest_account_number, t_dest_account_name, t_dest_person_first_name, t_dest_person_last_name, t_dest_entity_name, tran_type, created_at, t_date_posting, t_value_date, t_date, t_client_number, t_gender, t_title, t_firstname, t_lastname, t_dob, t_phone, t_address, t_city, t_state, t_idnumber, t_idregdate, t_taxno, t_taxregdate, t_acctopndate, t_balance, row_ref) FROM stdin;
68189	1036030001	603101	KOFAR WAMBAI BRANCH	NIP FRM YAHAYA MOHAMMED  SANI MOBDK MULT	SYSTEM	SYSTEM	0	A	5000000	\N	\N	L	NGN	5000000	1	NG	12	KOFAR WAMBAI BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	5000000	1	NG	12	StanbicIBTC Bank	3195090	DK MULTI GLOBAL SERVICES LTD	\N	\N	\N	OTHERS	30-AUG-22 04.48.15.976526000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	DK MULTI GLOBAL SERVICES LTD	01-JAN-70 12.00.00.000000000 AM	8038659310	NO 162 LAYIN LABUN KAWA GAIDA  ZAWA CIKI GIDA                 KUMBOTSO LGA	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	23933725-0001	23933725-0001	25-JUL-22 12.00.00.000000000 AM	7130684.25	AAnpyKAAVAAAnbAAAB
68190	2518973	278544	KANO MM WAY BRANCH	NIP Online   WEB APP  Yahaya  Trf to FCM	SYSTEM	SYSTEM	0	A	10105155	\N	\N	L	NGN	10105155	1	NG	3	KANO MM WAY BRANCH	2518973	SANI MANAGGE AGRO ALLIED	\N	\N	\N	\N	\N	L	NGN	10105155	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.17.168431000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	SANI MANAGGE AGRO ALLIED	01-JAN-70 12.00.00.000000000 AM	8062402782	NO 315                         SANI MAINAGGE STREET	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	2501407-0001	2501407-0001	25-MAR-22 12.00.00.000000000 AM	1885.97	AAnpyKAAUAAF0F4AAA
68191	3179867	352551	HEAD OFFICE	NIP 15k   INTER BANK TRANSFER	SYSTEM	SYSTEM	0	A	10530000	\N	\N	L	NGN	10530000	1	NG	1	HEAD OFFICE	3179867	AL-FARIS GLOBAL ENTERPRISE	\N	\N	\N	\N	\N	L	NGN	10530000	1	NG	1	Sterling Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.18.794020000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	AL-FARIS GLOBAL ENTERPRISE	01-JAN-70 12.00.00.000000000 AM	8118078597	PLOT 1438 FLAT 2               DAKI BIYU AIRPORT ROAD         JABI	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	25300638-0001	25300638-0001	22-JUL-22 12.00.00.000000000 AM	3780127.25	AAnpyKAATAAASMzAAC
68192	1826071	403982	HEAD OFFICE	NIP Online   WEB APP  Boo Farmzone Afric	SYSTEM	SYSTEM	0	A	6513471	\N	\N	L	NGN	6513471	1	NG	1	HEAD OFFICE	1826071	FARM-ZONE AFRICA INTEGRATED SERVICES	\N	\N	\N	\N	\N	L	NGN	6513471	1	NG	1	Sterling Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.19.651814000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	FARM-ZONE AFRICA INTEGRATED SERVICES	01-JAN-70 12.00.00.000000000 AM	7035505284	NO 19C                         ICHIE MIKE STREET LEKKI        PHASE 1	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	23694291-0001	23694291-0001	08-NOV-21 12.00.00.000000000 AM	59492.28	AAnpyKAASAAAn8SAAB
68193	1360168	045725	SOKOTO BRANCH	NIP Online   WEB APP  ZAYShfa  Trf to JA	SYSTEM	SYSTEM	0	A	100000000	\N	\N	L	NGN	100000000	1	NG	6	SOKOTO BRANCH	1360168	AL-ADYAS GLOBAL RESOURCES LIMITED	\N	\N	\N	\N	\N	L	NGN	100000000	1	NG	6	JAIZ Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.20.290771000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	AL-ADYAS GLOBAL RESOURCES LIMITED	01-JAN-70 12.00.00.000000000 AM	8060606080	RSQ14                          A Y M PLAZA KOFAR ATIKU ROAD   AREA SOKOTO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	1015007154	1015007154	19-MAY-21 12.00.00.000000000 AM	4813068.36	AAnpyKAASAAAn8hAAA
68194	1826071	403984	HEAD OFFICE	NIP Online   WEB APP  Trf to Providus Ba	SYSTEM	SYSTEM	0	A	26000000	\N	\N	L	NGN	26000000	1	NG	1	HEAD OFFICE	1826071	FARM-ZONE AFRICA INTEGRATED SERVICES	\N	\N	\N	\N	\N	L	NGN	26000000	1	NG	1	Sterling Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.21.155887000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	FARM-ZONE AFRICA INTEGRATED SERVICES	01-JAN-70 12.00.00.000000000 AM	7035505284	NO 19C                         ICHIE MIKE STREET LEKKI        PHASE 1	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	23694291-0001	23694291-0001	08-NOV-21 12.00.00.000000000 AM	59492.28	AAnpyKAASAAAn9CAAC
68195	1826071	403986	HEAD OFFICE	NIP Online   WEB APP  Trf to Providus Ba	SYSTEM	SYSTEM	0	A	26000001	\N	\N	L	NGN	26000001	1	NG	1	HEAD OFFICE	1826071	FARM-ZONE AFRICA INTEGRATED SERVICES	\N	\N	\N	\N	\N	L	NGN	26000001	1	NG	1	Sterling Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.22.033083000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	FARM-ZONE AFRICA INTEGRATED SERVICES	01-JAN-70 12.00.00.000000000 AM	7035505284	NO 19C                         ICHIE MIKE STREET LEKKI        PHASE 1	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	23694291-0001	23694291-0001	08-NOV-21 12.00.00.000000000 AM	59492.28	AAnpyKAASAAAn9GAAB
68196	1826071	403988	HEAD OFFICE	NIP Online   WEB APP  Agent pay   aggreg	SYSTEM	SYSTEM	0	A	7468300	\N	\N	L	NGN	7468300	1	NG	1	HEAD OFFICE	1826071	FARM-ZONE AFRICA INTEGRATED SERVICES	\N	\N	\N	\N	\N	L	NGN	7468300	1	NG	1	Sterling Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.22.970087000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	FARM-ZONE AFRICA INTEGRATED SERVICES	01-JAN-70 12.00.00.000000000 AM	7035505284	NO 19C                         ICHIE MIKE STREET LEKKI        PHASE 1	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	23694291-0001	23694291-0001	08-NOV-21 12.00.00.000000000 AM	59492.28	AAnpyKAASAAAn9WAAB
68197	2459968	067491	HEAD OFFICE	Alh murtala zuru	SYSTEM	SYSTEM	0	A	5000000	\N	\N	L	NGN	5000000	1	NG	1	HEAD OFFICE	2459968	MURTALA MUHAMMED	\N	\N	\N	\N	\N	L	NGN	5000000	1	NG	1	Sterling Bank	2508048	SALISU MUHAMMAD	\N	\N	\N	OTHERS	30-AUG-22 04.48.24.114580000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	M	MR	MURTALA	MUHAMMED	25-JUL-79 12.00.00.000000000 AM	7030858684	22 BAWO ROAD KANO STATE        KANO                           KANO	KEBBI	KEBBI	A09944577	19-NOV-18 12.00.00.000000000 AM	\N	\N	18-MAR-22 12.00.00.000000000 AM	4415.62	AAnpyKAARAAAqK2AAC
68198	1036030001	603154	KOFAR WAMBAI BRANCH	NIP FRM IBRAHIM AMINU GALADANCI FBNMOBIL	SYSTEM	SYSTEM	0	A	7000000	\N	\N	L	NGN	7000000	1	NG	12	KOFAR WAMBAI BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	7000000	1	NG	12	StanbicIBTC Bank	2737684	BABA DUDU AGRO VENTUERS	\N	\N	\N	OTHERS	30-AUG-22 04.48.25.491380000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	BABA DUDU AGRO VENTUERS	01-JAN-70 12.00.00.000000000 AM	8065427424	168 U/GABAS HOTORO OFF         COL DAUDA STREET               NASSARAWA LGA	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24751288-001	24751288-001	05-MAY-22 12.00.00.000000000 AM	6293786.01	AAnpyKAARAAAqLiAAA
68181	1036030001	306081	KANO MM WAY BRANCH	NIP FRM LAWAN  GARBA TRFTrFRM LAWAN  GAR	SYSTEM	SYSTEM	0	A	5000000	\N	\N	L	NGN	5000000	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	5000000	1	NG	3	FCMB	1313841	AUDIDIAMOND GLOBAL AGENCY LTD	\N	\N	\N	OTHERS	30-AUG-22 04.48.07.803095000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	AUDIDIAMOND GLOBAL AGENCY LTD	01-JAN-70 12.00.00.000000000 AM	8094101975	C 47 SHARADA JUMMA MOSQUE BY   BUK ROAD KANO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	23825845-0001	23825845-0001	20-APR-21 12.00.00.000000000 AM	5006446.23	AAnpyKAAYAAAmrRAAC
68182	1036030001	306062	KANO MM WAY BRANCH	NIP FRM MABAB INTERNATIONAL LIMITED web	SYSTEM	SYSTEM	0	A	10000000	\N	\N	L	NGN	10000000	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	10000000	1	NG	3	FCMB	37603	MABAB PROPERTY LIMITED	\N	\N	\N	OTHERS	30-AUG-22 04.48.08.292568000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	MABAB PROPERTY LIMITED	01-JAN-70 12.00.00.000000000 AM	9099968999	NO 1 HOSPITAL ROAD, NASSARAWA  G.R.A. DANBATA HOUSE AUDU BAKO WAY. KANO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	22352143-0001	22352143-0001	06-FEB-20 12.00.00.000000000 AM	10686.1	AAnpyKAAYAAAmrjAAD
68183	1036030001	306127	KANO MM WAY BRANCH	NIP FRM MABAB INTERNATIONAL LIMITED web	SYSTEM	SYSTEM	0	A	10000000	\N	\N	L	NGN	10000000	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	10000000	1	NG	3	FCMB	37603	MABAB PROPERTY LIMITED	\N	\N	\N	OTHERS	30-AUG-22 04.48.08.762416000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	MABAB PROPERTY LIMITED	01-JAN-70 12.00.00.000000000 AM	9099968999	NO 1 HOSPITAL ROAD, NASSARAWA  G.R.A. DANBATA HOUSE AUDU BAKO WAY. KANO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	22352143-0001	22352143-0001	06-FEB-20 12.00.00.000000000 AM	10686.1	AAnpyKAAYAAAmr3AAC
68184	2518973	278536	KANO MM WAY BRANCH	NIP Online   WEB APP  Yahaya  Trf to FCM	SYSTEM	SYSTEM	0	A	5036400	\N	\N	L	NGN	5036400	1	NG	3	KANO MM WAY BRANCH	2518973	SANI MANAGGE AGRO ALLIED	\N	\N	\N	\N	\N	L	NGN	5036400	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.10.252700000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	SANI MANAGGE AGRO ALLIED	01-JAN-70 12.00.00.000000000 AM	8062402782	NO 315                         SANI MAINAGGE STREET	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	2501407-0001	2501407-0001	25-MAR-22 12.00.00.000000000 AM	1885.97	AAnpyKAAXAAAqwzAAA
68185	3179867	352526	HEAD OFFICE	okok   LOCAL TRANSFER	SYSTEM	SYSTEM	0	A	10230000	\N	\N	L	NGN	10230000	1	NG	1	HEAD OFFICE	3179867	AL-FARIS GLOBAL ENTERPRISE	\N	\N	\N	\N	\N	L	NGN	10230000	1	NG	1	Sterling Bank	3196640	INNOBASH INTEGRATED VENTURES	\N	\N	\N	OTHERS	30-AUG-22 04.48.12.173094000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	AL-FARIS GLOBAL ENTERPRISE	01-JAN-70 12.00.00.000000000 AM	8118078597	PLOT 1438 FLAT 2               DAKI BIYU AIRPORT ROAD         JABI	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	25300638-0001	25300638-0001	22-JUL-22 12.00.00.000000000 AM	3780127.25	AAnpyKAAXAAAqw9AAB
68186	864322	403973	HEAD OFFICE	NIP Online   WEB APP  Paynebt  Trf to JA	SYSTEM	SYSTEM	0	A	10230000	\N	\N	L	NGN	10230000	1	NG	1	HEAD OFFICE	864322	LAKECITY CONSULT LIMITED	\N	\N	\N	\N	\N	L	NGN	10230000	1	NG	1	Sterling Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.12.644911000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	LAKECITY CONSULT LIMITED	01-JAN-70 12.00.00.000000000 AM	8099873606	NO 11                          DURBAN STREET                  WUSE 2	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	10522606-0001	10522606-0001	11-NOV-20 12.00.00.000000000 AM	170761783.65	AAnpyKAAXAAAqxWAAB
68187	1036030001	306185	KANO MM WAY BRANCH	NIP FRM MABAB INTERNATIONAL LIMITED web	SYSTEM	SYSTEM	0	A	9999200	\N	\N	L	NGN	9999200	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	9999200	1	NG	3	FCMB	37603	MABAB PROPERTY LIMITED	\N	\N	\N	OTHERS	30-AUG-22 04.48.13.015012000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	MABAB PROPERTY LIMITED	01-JAN-70 12.00.00.000000000 AM	9099968999	NO 1 HOSPITAL ROAD, NASSARAWA  G.R.A. DANBATA HOUSE AUDU BAKO WAY. KANO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	22352143-0001	22352143-0001	06-FEB-20 12.00.00.000000000 AM	10686.1	AAnpyKAAXAAAqx4AAC
68188	2518973	278532	KANO MM WAY BRANCH	NIP Online   WEB APP  Yahaya  Trf to Pro	SYSTEM	SYSTEM	0	A	12250983	\N	\N	L	NGN	12250983	1	NG	3	KANO MM WAY BRANCH	2518973	SANI MANAGGE AGRO ALLIED	\N	\N	\N	\N	\N	L	NGN	12250983	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.14.382961000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	SANI MANAGGE AGRO ALLIED	01-JAN-70 12.00.00.000000000 AM	8062402782	NO 315                         SANI MAINAGGE STREET	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	2501407-0001	2501407-0001	25-MAR-22 12.00.00.000000000 AM	1885.97	AAnpyKAAWAAAkznAAA
68207	1036030001	603250	KOFAR WAMBAI BRANCH	NIP FRM KABARA SHEHU MALAM REF3012033880	SYSTEM	SYSTEM	0	A	5000000	\N	\N	L	NGN	5000000	1	NG	12	KOFAR WAMBAI BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	5000000	1	NG	12	StanbicIBTC Bank	2756399	GLOBAL FORTUNE ASSOCIATES NIG LTD	\N	\N	\N	OTHERS	30-AUG-22 04.48.36.376651000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	GLOBAL FORTUNE ASSOCIATES NIG LTD	01-JAN-70 12.00.00.000000000 AM	8030426080	NO 390 KABARA HOUSE            KMC                            KANO MUNICIPAL LGA	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	1018869576	1018869576	10-MAY-22 12.00.00.000000000 AM	5244814.6	AAnpyKAAJAAHC4RAAC
68199	1812069	083791	MAIDUGURI  BRANCH	000026220830000248000021350766	SYSTEM	SYSTEM	0	A	44500000	\N	\N	L	NGN	44500000	1	NG	9	MAIDUGURI  BRANCH	1812069	SHEHU A GONI GENERAL ENTERPRISES	\N	\N	\N	\N	\N	L	NGN	44500000	1	NG	9	Citi Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.26.408911000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	SHEHU A GONI GENERAL ENTERPRISES	01-JAN-70 12.00.00.000000000 AM	7039391098	NO 41                          MONDAY                         MARKET	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	22857850-0001	22857850-0001	01-NOV-21 12.00.00.000000000 AM	59997.86	AAnpyKAAQAAAqKKAAA
68200	3234630	111863	SOKOTO BRANCH	NIP transfer	SYSTEM	SYSTEM	0	A	7000000	\N	\N	L	NGN	7000000	1	NG	6	SOKOTO BRANCH	3234630	LAWALI MUAZU	\N	\N	\N	\N	\N	L	NGN	7000000	1	NG	6	JAIZ Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.28.414596000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	M	COMR	LAWALI	MUAZU	17-JUN-86 12.00.00.000000000 AM	8038032394	NO 15 AFTER KABIRU             BIGI HOUSE ARKILLA             LIMAN AREA	BIRNIN KEBBI	KEBBI	10797485523	12-JUN-19 12.00.00.000000000 AM	\N	\N	03-AUG-22 12.00.00.000000000 AM	3646.6	AAnpyKAAQAAAqKRAAB
68201	1812069	083789	MAIDUGURI  BRANCH	NIP G   INTER BANK TRANSFER	SYSTEM	SYSTEM	0	A	17071750	\N	\N	L	NGN	17071750	1	NG	9	MAIDUGURI  BRANCH	1812069	SHEHU A GONI GENERAL ENTERPRISES	\N	\N	\N	\N	\N	L	NGN	17071750	1	NG	9	Citi Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.29.416569000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	SHEHU A GONI GENERAL ENTERPRISES	01-JAN-70 12.00.00.000000000 AM	7039391098	NO 41                          MONDAY                         MARKET	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	22857850-0001	22857850-0001	01-NOV-21 12.00.00.000000000 AM	59997.86	AAnpyKAAQAAAqKkAAC
68202	1036030001	468670	MAIDUGURI  BRANCH	NIP FRM SHEHU A GONI GENERAL ENTERPRIS N	SYSTEM	SYSTEM	0	A	17071750	\N	\N	L	NGN	17071750	1	NG	9	MAIDUGURI  BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	17071750	1	NG	9	Citi Bank	1855398	GAJIMI GONI IBRAHIM	\N	\N	\N	OTHERS	30-AUG-22 04.48.30.534572000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	M	MR	GAJIMI	IBRAHIM	02-JUN-82 12.00.00.000000000 AM	8023666313	NO 89                          CUSTOM AREA                    NEAR MAMI MARKET	MAIDUGURI	BORNO	MAD18994AA88	05-JUN-18 12.00.00.000000000 AM	\N	\N	16-NOV-21 12.00.00.000000000 AM	54974011.18	AAnpyKAAQAAAqLtAAB
68203	2903454	391986	KANO MM WAY BRANCH	NIP Abba to gambo fafa   INTER BANK TRAN	SYSTEM	SYSTEM	0	A	17466112	\N	\N	L	NGN	17466112	1	NG	3	KANO MM WAY BRANCH	2903454	ABBAN JAMMEL GENERAL MACHINES	\N	\N	\N	\N	\N	L	NGN	17466112	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.32.053712000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	ABBAN JAMMEL GENERAL MACHINES	01-JAN-70 12.00.00.000000000 AM	8104060678	NO 59 MURTALA MUHAMMAD WAY     FAGGE WAPA KANO STATE          KANO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	22301380-0001	22301380-0001	07-JUN-22 12.00.00.000000000 AM	1707073.62	AAnpyKAAPAAAqHwAAA
68204	1880978	352647	HEAD OFFICE	NIP h	SYSTEM	SYSTEM	0	A	10000000	\N	\N	L	NGN	10000000	1	NG	1	HEAD OFFICE	1880978	IBRAHIM GARANCHI HAMZA	\N	\N	\N	\N	\N	L	NGN	10000000	1	NG	1	Sterling Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.33.034007000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	22657136855	M	MR	IBRAHIM	HAMZA	29-APR-87 12.00.00.000000000 AM	8146666661	NO 34                          KINSHASA STREET                WUSE ZONE 6	GUSAU	ZAMFARA	\N	01-JAN-70 12.00.00.000000000 AM	\N	\N	24-NOV-21 12.00.00.000000000 AM	15665965.09	AAnpyKAAOAAGzO+AAA
68205	1709257	893445	KANO MM WAY BRANCH	NIP Mobile   Afy	SYSTEM	SYSTEM	0	A	5000000	\N	\N	L	NGN	5000000	1	NG	3	KANO MM WAY BRANCH	1709257	YAKUBU MOHAMMED ADAMU	\N	\N	\N	\N	\N	L	NGN	5000000	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.33.815446000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	22482033198	M	MR	YAKUBU	ADAMU	02-FEB-75 12.00.00.000000000 AM	7012222515	GABARI QTRS                    DUTSE JIGAWA                   JIGAWA STATE	HADEJIA	JIGAWA	A11889043	26-JUL-21 12.00.00.000000000 AM	\N	\N	30-SEP-21 12.00.00.000000000 AM	187067.7	AAnpyKAANAAA2IPAAB
68206	2351426	099326	SABON GARI BRANCH	NIP Material    INTER BANK TRANSFER	SYSTEM	SYSTEM	0	A	28000000	\N	\N	L	NGN	28000000	1	NG	11	SABON GARI BRANCH	2351426	HAPPY HOME UNIVERSAL RICE RESOURCES	\N	\N	\N	\N	\N	L	NGN	28000000	1	NG	11	Unity Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.35.025562000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	HAPPY HOME UNIVERSAL RICE RESOURCES	01-JAN-70 12.00.00.000000000 AM	8033550064	N0 30160                       COMMERCIAL AREA                NASSARAWA	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	23981251-0001	23981251-0001	28-FEB-22 12.00.00.000000000 AM	106767868.09	AAnpyKAALAAFkVDAAC
68208	1036030001	632042	HEAD OFFICE	NIP FRM BSIT INTER TRADE App house no 6	SYSTEM	SYSTEM	0	A	10000000	\N	\N	L	NGN	10000000	1	NG	1	HEAD OFFICE	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	10000000	1	NG	1	Sterling Bank	1481320	HAIMBRIDGE LIMITED	\N	\N	\N	OTHERS	30-AUG-22 04.48.37.104068000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	HAIMBRIDGE LIMITED	01-JAN-70 12.00.00.000000000 AM	8133839041	PLOT 288                       ADUVE STYREET                  JAHI DISTRICT	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	19813871-0001	19813871-0001	09-JUL-21 12.00.00.000000000 AM	90752956.23	AAnpyKAAJAAHC58AAA
68209	1963521	403990	HEAD OFFICE	WEB APP     Trf to DEM BANK HIFZULLAH MU	SYSTEM	SYSTEM	0	A	7300000	\N	\N	L	NGN	7300000	1	NG	3	HEAD OFFICE	1963521	HUKUMULLAH M SHARIF ENTERPRISES	\N	\N	\N	\N	\N	L	NGN	7300000	1	NG	1	Sterling Bank	1819611	HIFZULLAH MUNZALI SHARIF	\N	\N	\N	OTHERS	30-AUG-22 04.48.38.053714000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	M	MR	HIFZULLAH	SHARIF	01-JAN-92 12.00.00.000000000 AM	8063305041	NO 396 ISLAMIYYA 5303 D7230    UNGOGO KANO STATE              KANO	KANO	KANO	A10655528	18-JUN-19 12.00.00.000000000 AM	\N	\N	05-NOV-21 12.00.00.000000000 AM	15600153.58	AAnpyKABOAAAtOZAAB
68210	1963521	278569	KANO MM WAY BRANCH	WEB APP     Trf to DEM BANK HIFZULLAH MU	SYSTEM	SYSTEM	0	A	7300000	\N	\N	L	NGN	7300000	1	NG	3	KANO MM WAY BRANCH	1963521	HUKUMULLAH M SHARIF ENTERPRISES	\N	\N	\N	\N	\N	L	NGN	7300000	1	NG	1	Sterling Bank	1819611	HIFZULLAH MUNZALI SHARIF	\N	\N	\N	OTHERS	30-AUG-22 04.48.39.066797000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	HUKUMULLAH M SHARIF ENTERPRISES	01-JAN-70 12.00.00.000000000 AM	8063305041	396 ISLAMIYYAA S303 D720076    RIMIN GATA KANO                KANO STATE	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	1059112597	1059112597	16-DEC-21 12.00.00.000000000 AM	91.09	AAnpyKABOAAAtOZAAC
68211	3072975	278570	KANO MM WAY BRANCH	NIP Online   WEB APP  Trf to Access Bank	SYSTEM	SYSTEM	0	A	19060000	\N	\N	L	NGN	19060000	1	NG	3	KANO MM WAY BRANCH	3072975	BASHIR AHMED IBRAHIM	\N	\N	\N	\N	\N	L	NGN	19060000	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.40.517026000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	M	MR	BASHIR	IBRAHIM	01-JUN-89 12.00.00.000000000 AM	8036375350	NO 1                           LAYIN ADO BAYERO GATE 1        KOFAR DAWANAU DANISHE	DALA	KANO	60120472139	02-FEB-20 12.00.00.000000000 AM	\N	\N	01-JUL-22 12.00.00.000000000 AM	899396.9	AAnpyKABOAAAtOhAAB
68212	3072975	278572	KANO MM WAY BRANCH	NIP Online   WEB APP  Ibbmaiturare  Trf	SYSTEM	SYSTEM	0	A	5964596	\N	\N	L	NGN	5964596	1	NG	3	KANO MM WAY BRANCH	3072975	BASHIR AHMED IBRAHIM	\N	\N	\N	\N	\N	L	NGN	5964596	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.42.095125000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	M	MR	BASHIR	IBRAHIM	01-JUN-89 12.00.00.000000000 AM	8036375350	NO 1                           LAYIN ADO BAYERO GATE 1        KOFAR DAWANAU DANISHE	DALA	KANO	60120472139	02-FEB-20 12.00.00.000000000 AM	\N	\N	01-JUL-22 12.00.00.000000000 AM	899396.9	AAnpyKABOAAAtOlAAA
68213	3047838	058193	GOMBE BRANCH	NIP Online   WEB APP  Peak 14 g  Trf to	SYSTEM	SYSTEM	0	A	9500000	\N	\N	L	NGN	9500000	1	NG	8	GOMBE BRANCH	3047838	SHUGABA DAN MUSA GENERAL MERCHANDISE	\N	\N	\N	\N	\N	L	NGN	9500000	1	NG	8	POLARIS BANK	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.43.865310000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	SHUGABA DAN MUSA GENERAL MERCHANDISE	01-JAN-70 12.00.00.000000000 AM	7061616222	ABUJA LOWCOST GOMBE            BYPASS GALDIMARI	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	25236638-0001	25236638-0001	24-JUN-22 12.00.00.000000000 AM	1219155.24	AAnpyKABOAAAtOlAAC
68214	1036030001	307179	KANO MM WAY BRANCH	NIP FRM ISIEKWENU VENTURES TUD  IBGUTOCO	SYSTEM	SYSTEM	0	A	6337186	\N	\N	L	NGN	6337186	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	6337186	1	NG	3	FCMB	3072975	BASHIR AHMED IBRAHIM	\N	\N	\N	OTHERS	30-AUG-22 04.48.45.799192000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	M	MR	BASHIR	IBRAHIM	01-JUN-89 12.00.00.000000000 AM	8036375350	NO 1                           LAYIN ADO BAYERO GATE 1        KOFAR DAWANAU DANISHE	DALA	KANO	60120472139	02-FEB-20 12.00.00.000000000 AM	\N	\N	01-JUL-22 12.00.00.000000000 AM	899396.9	AAnpyKABNAAAtOuAAB
68215	1036030001	307161	KANO MM WAY BRANCH	NIP FRM ISIEKWENU VENTURES TUD  IBGUTOCO	SYSTEM	SYSTEM	0	A	11551000	\N	\N	L	NGN	11551000	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	11551000	1	NG	3	FCMB	3072975	BASHIR AHMED IBRAHIM	\N	\N	\N	OTHERS	30-AUG-22 04.48.47.157529000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	M	MR	BASHIR	IBRAHIM	01-JUN-89 12.00.00.000000000 AM	8036375350	NO 1                           LAYIN ADO BAYERO GATE 1        KOFAR DAWANAU DANISHE	DALA	KANO	60120472139	02-FEB-20 12.00.00.000000000 AM	\N	\N	01-JUL-22 12.00.00.000000000 AM	899396.9	AAnpyKABNAAAtPAAAC
68216	1036030001	077791	SOKOTO BRANCH	NIP FRM A M D AND SONS NIGERIA LTD TRFAm	SYSTEM	SYSTEM	0	A	5000000	\N	\N	L	NGN	5000000	1	NG	6	SOKOTO BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	5000000	1	NG	6	JAIZ Bank	1224732	A M D &amp, SONS NIGERIA LIMITED	\N	\N	\N	OTHERS	30-AUG-22 04.48.47.905859000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	A M D &amp, SONS NIGERIA LIMITED	01-JAN-70 12.00.00.000000000 AM	8037673030	NO 22/23                       SULTAN BELLO ROAD SOKOTO       SOKOTOO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	16997700-0001	16997700-0001	09-MAR-21 12.00.00.000000000 AM	175958.49	AAnpyKABLAAAumiAAD
68171	16602	000232	KANO MM WAY BRANCH	\N	SYSTEM	SYSTEM	0	A	10000000	\N	\N	L	NGN	10000000	1	NG	3	KANO MM WAY BRANCH	16602	HAFSATU ABBA ADO BAYERO	\N	\N	\N	\N	\N	L	NGN	10000000	1	NG	\N	Others	\N	\N	\N	\N	\N	OTHERS	30-AUG-22 04.47.59.029867000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	22329617297	F	HAJIYA	HAFSATU	BAYERO	12-APR-43 12.00.00.000000000 AM	8035517340	NO 1                           EMIR PALACE KANO               EMI PALACE	KANO	KANO	A10188248	19-FEB-19 12.00.00.000000000 AM	\N	\N	18-DEC-19 12.00.00.000000000 AM	10000974.85	AAnpyKAAJAAAAglAAB
68172	1360168	045717	SOKOTO BRANCH	NIP Online   WEB APP  Zshfa2  Trf to JAI	SYSTEM	SYSTEM	0	A	100000000	\N	\N	L	NGN	100000000	1	NG	6	SOKOTO BRANCH	1360168	AL-ADYAS GLOBAL RESOURCES LIMITED	\N	\N	\N	\N	\N	L	NGN	100000000	1	NG	6	JAIZ Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.47.59.999340000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	AL-ADYAS GLOBAL RESOURCES LIMITED	01-JAN-70 12.00.00.000000000 AM	8060606080	RSQ14                          A Y M PLAZA KOFAR ATIKU ROAD   AREA SOKOTO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	1015007154	1015007154	19-MAY-21 12.00.00.000000000 AM	4813068.36	AAnpyKAA2AAAoiwAAC
68173	1036030001	305968	KANO MM WAY BRANCH	NIP FRM MUSAF  UMAR TRFMusabFRM MUSAF  U	SYSTEM	SYSTEM	0	A	10000000	\N	\N	L	NGN	10000000	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	10000000	1	NG	3	FCMB	1242419	BEGAYU ENTERPRISES	\N	\N	\N	OTHERS	30-AUG-22 04.48.00.921226000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	BEGAYU ENTERPRISES	01-JAN-70 12.00.00.000000000 AM	8155555554	NO 10 TANKO SHATIMA            KANO                           KANO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24541320-0001	24541320-0001	17-MAR-21 12.00.00.000000000 AM	1282636.25	AAnpyKAA2AAAojsAAA
68174	1360168	045723	SOKOTO BRANCH	NIP Online   WEB APP  Zshafa2  Trf to JA	SYSTEM	SYSTEM	0	A	80000000	\N	\N	L	NGN	80000000	1	NG	6	SOKOTO BRANCH	1360168	AL-ADYAS GLOBAL RESOURCES LIMITED	\N	\N	\N	\N	\N	L	NGN	80000000	1	NG	6	JAIZ Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.01.804079000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	AL-ADYAS GLOBAL RESOURCES LIMITED	01-JAN-70 12.00.00.000000000 AM	8060606080	RSQ14                          A Y M PLAZA KOFAR ATIKU ROAD   AREA SOKOTO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	1015007154	1015007154	19-MAY-21 12.00.00.000000000 AM	4813068.36	AAnpyKAAaAAF0CFAAA
68175	2015544	073831	KOFAR WAMBAI BRANCH	NIP Online   WEB APP  K  Trf to ZENITH B	SYSTEM	SYSTEM	0	A	9800000	\N	\N	L	NGN	9800000	1	NG	12	KOFAR WAMBAI BRANCH	2015544	AMANI UNIVERSAL RICE LIMITED	\N	\N	\N	\N	\N	L	NGN	9800000	1	NG	12	StanbicIBTC Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.03.240509000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	AMANI UNIVERSAL RICE LIMITED	01-JAN-70 12.00.00.000000000 AM	8039317398	NO. 80/82 TAFAWA BALEWA ROAD   BOMPAI KANO                    NASSARAWA LGA	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	20263771-0001	20263771-0001	29-DEC-21 12.00.00.000000000 AM	47318164.64	AAnpyKAAaAAF0CwAAB
68176	1360168	045721	SOKOTO BRANCH	NIP Online   WEB APP  Zshafa3  Trf to JA	SYSTEM	SYSTEM	0	A	100000000	\N	\N	L	NGN	100000000	1	NG	6	SOKOTO BRANCH	1360168	AL-ADYAS GLOBAL RESOURCES LIMITED	\N	\N	\N	\N	\N	L	NGN	100000000	1	NG	6	JAIZ Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.03.992159000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	AL-ADYAS GLOBAL RESOURCES LIMITED	01-JAN-70 12.00.00.000000000 AM	8060606080	RSQ14                          A Y M PLAZA KOFAR ATIKU ROAD   AREA SOKOTO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	1015007154	1015007154	19-MAY-21 12.00.00.000000000 AM	4813068.36	AAnpyKAAaAAF0DGAAC
68177	1994244	278529	KANO MM WAY BRANCH	WEB APP  Snsi  saddik 3  Trf to DEM BANK	SYSTEM	SYSTEM	0	A	28000000	\N	\N	L	NGN	28000000	1	NG	3	KANO MM WAY BRANCH	1994244	HATTA AGRO ALLIED AND FARMS	\N	\N	\N	\N	\N	L	NGN	28000000	1	NG	3	FCMB	1835624	SEDEEQ GENERAL FARM ENTERPRISE	\N	\N	\N	OTHERS	30-AUG-22 04.48.04.963380000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	HATTA AGRO ALLIED AND FARMS	01-JAN-70 12.00.00.000000000 AM	8030909019	NO 17                          NAGODA ROAD KOFAR WAMBAI       MARKET FAGGE	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	1062833221	1062833221	23-DEC-21 12.00.00.000000000 AM	51689667.95	AAnpyKAAaAAF0DaAAA
68178	1036030001	306082	KANO MM WAY BRANCH	NIP FRM MABAB INTERNATIONAL LIMITED web	SYSTEM	SYSTEM	0	A	10000000	\N	\N	L	NGN	10000000	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	10000000	1	NG	3	FCMB	37603	MABAB PROPERTY LIMITED	\N	\N	\N	OTHERS	30-AUG-22 04.48.05.315582000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	MABAB PROPERTY LIMITED	01-JAN-70 12.00.00.000000000 AM	9099968999	NO 1 HOSPITAL ROAD, NASSARAWA  G.R.A. DANBATA HOUSE AUDU BAKO WAY. KANO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	22352143-0001	22352143-0001	06-FEB-20 12.00.00.000000000 AM	10686.1	AAnpyKAAZAAF0CHAAD
68179	1036030001	603038	KOFAR WAMBAI BRANCH	NIP FRM MAIMUNA ISIYAKA RABIU ENTERPRI T	SYSTEM	SYSTEM	0	A	26280000	\N	\N	L	NGN	26280000	1	NG	12	KOFAR WAMBAI BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	26280000	1	NG	12	StanbicIBTC Bank	2015544	AMANI UNIVERSAL RICE LIMITED	\N	\N	\N	OTHERS	30-AUG-22 04.48.06.470583000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	AMANI UNIVERSAL RICE LIMITED	01-JAN-70 12.00.00.000000000 AM	8039317398	NO. 80/82 TAFAWA BALEWA ROAD   BOMPAI KANO                    NASSARAWA LGA	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	20263771-0001	20263771-0001	29-DEC-21 12.00.00.000000000 AM	47318164.64	AAnpyKAAZAAF0C2AAC
68180	1036030001	306132	KANO MM WAY BRANCH	NIP FRM MABAB INTERNATIONAL LIMITED web	SYSTEM	SYSTEM	0	A	10000000	\N	\N	L	NGN	10000000	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	10000000	1	NG	3	FCMB	37603	MABAB PROPERTY LIMITED	\N	\N	\N	OTHERS	30-AUG-22 04.48.07.014129000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	MABAB PROPERTY LIMITED	01-JAN-70 12.00.00.000000000 AM	9099968999	NO 1 HOSPITAL ROAD, NASSARAWA  G.R.A. DANBATA HOUSE AUDU BAKO WAY. KANO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	22352143-0001	22352143-0001	06-FEB-20 12.00.00.000000000 AM	10686.1	AAnpyKAAYAAAmrEAAD
68219	2916593	278578	KANO MM WAY BRANCH	NIP Online   WEB APP  Ay  Trf to Fidelit	SYSTEM	SYSTEM	0	A	26825000	\N	\N	L	NGN	26825000	1	NG	3	KANO MM WAY BRANCH	2916593	NBA MULTI PURPOSE COMANY NIG	\N	\N	\N	\N	\N	L	NGN	26825000	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.50.132625000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	NBA MULTI PURPOSE COMANY NIG	01-JAN-70 12.00.00.000000000 AM	8032605293	NO 449                         MANDAWARI SABON TITI           BERUIT ROAD	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24808054-0001	24808054-0001	09-JUN-22 12.00.00.000000000 AM	206023198.35	AAnpyKABLAAAum/AAA
68220	37603	278574	KANO MM WAY BRANCH	NIP Online   WEB APP  Transfer  Trf to F	SYSTEM	SYSTEM	0	A	50000000	\N	\N	L	NGN	50000000	1	NG	3	KANO MM WAY BRANCH	37603	MABAB PROPERTY LIMITED	\N	\N	\N	\N	\N	L	NGN	50000000	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.50.472474000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	MABAB PROPERTY LIMITED	01-JAN-70 12.00.00.000000000 AM	9099968999	NO 1 HOSPITAL ROAD, NASSARAWA  G.R.A. DANBATA HOUSE AUDU BAKO WAY. KANO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	22352143-0001	22352143-0001	06-FEB-20 12.00.00.000000000 AM	10686.1	AAnpyKABLAAAunWAAB
68221	2508048	067592	HEAD OFFICE	NIP Mobile   Salisu shagamu	SYSTEM	SYSTEM	0	A	5000000	\N	\N	L	NGN	5000000	1	NG	1	HEAD OFFICE	2508048	SALISU MUHAMMAD	\N	\N	\N	\N	\N	L	NGN	5000000	1	NG	1	Sterling Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.51.651039000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	M	MR	SALISU	MUHAMMAD	12-OCT-82 12.00.00.000000000 AM	8035690393	GADA BIYU AREA HOUSE NO 6      GUSAU ZAMFARA STATE            ZAMFARA	GUSAU	ZAMFARA	5298202630981894	24-MAR-22 12.00.00.000000000 AM	\N	\N	24-MAR-22 12.00.00.000000000 AM	8821.98	AAnpyKABLAAAunhAAA
68222	2057797	181979	ABUJA CORPORATE BRANCH	NIP Online   WEB APP  Bd  Trf to FCMB SE	SYSTEM	SYSTEM	0	A	6000000	\N	\N	L	NGN	6000000	1	NG	2	ABUJA CORPORATE BRANCH	2057797	A4J INTEGRATED SERVICES LIMITED	\N	\N	\N	\N	\N	L	NGN	6000000	1	NG	2	Keystone Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.52.952081000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	A4J INTEGRATED SERVICES LIMITED	01-JAN-70 12.00.00.000000000 AM	8035307513	NO 20                          OTUKPO STREET                  AREA 11 GARKI	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	23817509-0001	23817509-0001	07-JAN-22 12.00.00.000000000 AM	778130.85	AAnpyKABKAAAuW5AAA
68223	1036030001	307291	KANO MM WAY BRANCH	NIP FRM ADEDOYIN SEGUN LATEEF via GTWORL	SYSTEM	SYSTEM	0	A	7130000	\N	\N	L	NGN	7130000	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	7130000	1	NG	3	FCMB	1002477	GARBA ISAH ABDULLAHI	\N	\N	\N	OTHERS	30-AUG-22 04.48.53.455767000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	22150478117	M	MR	GARBA	ABDULLAHI	13-OCT-78 12.00.00.000000000 AM	8033171758	NO 127 SANI MAINAGGE QUATERS   KANO                           GIDAN KANKARABUS STOP	KANO	KANO	EKY61511AA03	28-DEC-17 12.00.00.000000000 AM	\N	\N	16-DEC-20 12.00.00.000000000 AM	49993739.33	AAnpyKABKAAAuXVAAB
68224	3089799	070208	SABON GARI BRANCH	NIP Online   WEB APP  Deposit for 300bag	SYSTEM	SYSTEM	0	A	15000000	\N	\N	L	NGN	15000000	1	NG	11	SABON GARI BRANCH	3089799	ABBA ABDULRAHMAN ISAH	\N	\N	\N	\N	\N	L	NGN	15000000	1	NG	11	Unity Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.55.947366000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	M	MR	ABBA	ISAH	02-APR-91 12.00.00.000000000 AM	8035480761	179 GWAMMAJA                   QRTS GWAMMAJA                  GIRLS SEC SCH	GWALE	KANO	41413649597	04-JUL-22 12.00.00.000000000 AM	\N	\N	04-JUL-22 12.00.00.000000000 AM	734449.53	AAnpyKABKAAAuXsAAB
68343	1030100001	641053	HEAD OFFICE	09FG2208301019396756ISADY  ONLINE  TO TA	SYSTEM	SYSTEM	0	A	5000000	\N	\N	L	NGN	5000000	1	NG	1	HEAD OFFICE	1030100001	ETRANZACT RECEIVABLE	\N	\N	\N	\N	\N	L	NGN	5000000	1	NG	1	Sterling Bank	1515834	KLIMATT NIG LTD	\N	\N	\N	OTHERS	30-AUG-22 04.51.57.238642000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	KLIMATT NIG LTD	01-JAN-70 12.00.00.000000000 AM	8036096249	NO 9                           AMINU SALE CRESCENT            KATAMPE EXTENSION	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	1051423950	1051423950	26-JUL-21 12.00.00.000000000 AM	38348265.49	AAnpyKAA7AAHcK7AAA
68344	1036030001	439186	ABUJA CORPORATE BRANCH	NIP FRM EL YAYI ENTERPRISES B	SYSTEM	SYSTEM	0	A	15000000	\N	\N	L	NGN	15000000	1	NG	2	ABUJA CORPORATE BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	15000000	1	NG	2	Keystone Bank	299801	LUBELL AGRO ALLIED SERVICES LTD	\N	\N	\N	OTHERS	30-AUG-22 04.51.57.372473000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	LUBELL AGRO ALLIED SERVICES LTD	01-JAN-70 12.00.00.000000000 AM	8033299791	NO 15                          MAGADISHU STREET               WUSE ZONE 4	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	23795683-0001	23795683-0001	13-AUG-20 12.00.00.000000000 AM	58379787	AAnpyKAA7AAHcLnAAD
68345	1036030001	307929	KANO MM WAY BRANCH	NIP FRM VOC MULTILINK SERVICES COB TRF F	SYSTEM	SYSTEM	0	A	16000000	\N	\N	L	NGN	16000000	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	16000000	1	NG	3	FCMB	1885241	AA ALIYU MUKHTAR ENTERPRISES	\N	\N	\N	OTHERS	30-AUG-22 04.51.58.159870000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	AA ALIYU MUKHTAR ENTERPRISES	01-JAN-70 12.00.00.000000000 AM	9069627743	NO 37B HAIJYA AMINA HOUSE     BEIRUT ROAD KANO               KANO STATE	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24289324-0001	24289324-0001	25-NOV-21 12.00.00.000000000 AM	1276.03	AAnpyKAA7AAHcL/AAB
68272	2040120001	163570	HEAD OFFICE	NIPPAYSETTL5THSESS_29TH_AUG	SYSTEM	SYSTEM	0	A	3156398726.85	\N	\N	L	NGN	3156398726.85	1	NG	1	HEAD OFFICE	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	\N	\N	L	NGN	3156398726.85	1	NG	1	Sterling Bank	1031210001	TAJBANK LTD	\N	\N	\N	OTHERS	30-AUG-22 04.50.02.575962000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	TAJBANK LTD	01-JAN-70 12.00.00.000000000 AM	0	PLOT 72 AHMADU BELLO WAY       BENUE PLAZA                    CBD	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	2126083-0001	2126083-0001	30-SEP-19 12.00.00.000000000 AM	-853975088.46	AAnpyKAAQAAG+KOAAA
68273	1031210001	163571	HEAD OFFICE	NIPRECSETTL5THSESS_29TH_AUG	SYSTEM	SYSTEM	0	A	2956642602.22	\N	\N	L	NGN	2956642602.22	1	NG	1	HEAD OFFICE	1031210001	TAJBANK LTD	\N	\N	\N	\N	\N	L	NGN	2956642602.22	1	NG	1	Sterling Bank	1036030001	NIP Receivable Acc	\N	\N	\N	OTHERS	30-AUG-22 04.50.03.219323000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	TAJBANK LTD	01-JAN-70 12.00.00.000000000 AM	0	PLOT 72 AHMADU BELLO WAY       BENUE PLAZA                    CBD	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	2126083-0001	2126083-0001	30-SEP-19 12.00.00.000000000 AM	-853975088.46	AAnpyKAAQAAG+KOAAB
68274	2040120001	163572	HEAD OFFICE	NIPPAYSETTL1ST.SESS_30TH_AUG	SYSTEM	SYSTEM	0	A	746008776.77	\N	\N	L	NGN	746008776.77	1	NG	1	HEAD OFFICE	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	\N	\N	L	NGN	746008776.77	1	NG	1	Sterling Bank	1031210001	TAJBANK LTD	\N	\N	\N	OTHERS	30-AUG-22 04.50.03.998371000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	TAJBANK LTD	01-JAN-70 12.00.00.000000000 AM	0	PLOT 72 AHMADU BELLO WAY       BENUE PLAZA                    CBD	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	2126083-0001	2126083-0001	30-SEP-19 12.00.00.000000000 AM	-853975088.46	AAnpyKAAQAAG+KYAAA
68275	2916593	278613	KANO MM WAY BRANCH	NIP Online   WEB APP  Aay  Trf to Fideli	SYSTEM	SYSTEM	0	A	21700000	\N	\N	L	NGN	21700000	1	NG	3	KANO MM WAY BRANCH	2916593	NBA MULTI PURPOSE COMANY NIG	\N	\N	\N	\N	\N	L	NGN	21700000	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.50.05.676396000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	NBA MULTI PURPOSE COMANY NIG	01-JAN-70 12.00.00.000000000 AM	8032605293	NO 449                         MANDAWARI SABON TITI           BERUIT ROAD	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24808054-0001	24808054-0001	09-JUN-22 12.00.00.000000000 AM	206023198.35	AAnpyKAAPAAHwDfAAA
68276	1031210001	163574	HEAD OFFICE	NIPPAYSETTL1ST.SESS_30TH_AUG	SYSTEM	SYSTEM	0	A	396365501.39	\N	\N	L	NGN	396365501.39	1	NG	1	HEAD OFFICE	1031210001	TAJBANK LTD	\N	\N	\N	\N	\N	L	NGN	396365501.39	1	NG	1	Sterling Bank	1036030001	NIP Receivable Acc	\N	\N	\N	OTHERS	30-AUG-22 04.50.06.531084000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	TAJBANK LTD	01-JAN-70 12.00.00.000000000 AM	0	PLOT 72 AHMADU BELLO WAY       BENUE PLAZA                    CBD	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	2126083-0001	2126083-0001	30-SEP-19 12.00.00.000000000 AM	-853975088.46	AAnpyKAAPAAHwD2AAA
68277	1036030001	438985	ABUJA CORPORATE BRANCH	NIP FRM INSTANT TRAVELS AND TOURISM LT A	SYSTEM	SYSTEM	0	A	5000000	\N	\N	L	NGN	5000000	1	NG	2	ABUJA CORPORATE BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	5000000	1	NG	2	Keystone Bank	24478	ARINOLA AFRICAN SHOP SERVICES	\N	\N	\N	OTHERS	30-AUG-22 04.50.06.565115000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	ARINOLA AFRICAN SHOP SERVICES	01-JAN-70 12.00.00.000000000 AM	8033525192	NO 4,                          TENNESSE CRESCENT,             MAITAMA,	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	19857868	19857868	09-JAN-20 12.00.00.000000000 AM	5878532.14	AAnpyKAAOAAHwCaAAC
68278	1030080005	307576	KANO MM WAY BRANCH	N 00000017167 TRSF IFO WARREN	SYSTEM	SYSTEM	0	A	152257200	\N	\N	L	NGN	152257200	1	NG	1	KANO MM WAY BRANCH	1030080005	NAPS CBN SETTLEMENT ACCOUNT	\N	\N	\N	\N	\N	L	NGN	152257200	1	NG	3	FCMB	148631	WARREN BRADSTREET ENTERPRISES	\N	\N	\N	OTHERS	30-AUG-22 04.50.07.107465000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	WARREN BRADSTREET ENTERPRISES	01-JAN-70 12.00.00.000000000 AM	8036365600	NO 9                           SAMBAJO STREET                 SANI MAINAGGE	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	2231298-0001	2231298-0001	22-JUN-20 12.00.00.000000000 AM	275484.9	AAnpyKAAOAAHwDQAAA
68279	1030080005	637195	HEAD OFFICE	N 00000017167 TRSF IFO WARREN	SYSTEM	SYSTEM	0	A	152257200	\N	\N	L	NGN	152257200	1	NG	1	HEAD OFFICE	1030080005	NAPS CBN SETTLEMENT ACCOUNT	\N	\N	\N	\N	\N	L	NGN	152257200	1	NG	3	FCMB	148631	WARREN BRADSTREET ENTERPRISES	\N	\N	\N	OTHERS	30-AUG-22 04.50.07.594422000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	WARREN BRADSTREET ENTERPRISES	01-JAN-70 12.00.00.000000000 AM	8036365600	NO 9                           SAMBAJO STREET                 SANI MAINAGGE	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	2231298-0001	2231298-0001	22-JUN-20 12.00.00.000000000 AM	275484.9	AAnpyKAAOAAHwDQAAB
68280	1030080005	307577	KANO MM WAY BRANCH	CIBS MADUS COMMODITIES NIG LTD To ABBAMA	SYSTEM	SYSTEM	0	A	20000000	\N	\N	L	NGN	20000000	1	NG	1	KANO MM WAY BRANCH	1030080005	NAPS CBN SETTLEMENT ACCOUNT	\N	\N	\N	\N	\N	L	NGN	20000000	1	NG	3	FCMB	3073721	ABBAMASU COMPANY	\N	\N	\N	OTHERS	30-AUG-22 04.50.09.256393000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	ABBAMASU COMPANY	01-JAN-70 12.00.00.000000000 AM	7036229808	NO. 1125 UNGOGGO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	22865004-0001	22865004-0001	30-JUN-22 12.00.00.000000000 AM	30155048.34	AAnpyKAAOAAHwDYAAC
68225	2916593	278582	KANO MM WAY BRANCH	NIP Online   WEB APP  Aay  Trf to Access	SYSTEM	SYSTEM	0	A	8722058	\N	\N	L	NGN	8722058	1	NG	3	KANO MM WAY BRANCH	2916593	NBA MULTI PURPOSE COMANY NIG	\N	\N	\N	\N	\N	L	NGN	8722058	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.57.473476000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	NBA MULTI PURPOSE COMANY NIG	01-JAN-70 12.00.00.000000000 AM	8032605293	NO 449                         MANDAWARI SABON TITI           BERUIT ROAD	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24808054-0001	24808054-0001	09-JUN-22 12.00.00.000000000 AM	206023198.35	AAnpyKABKAAAuXvAAA
68226	2916593	278584	KANO MM WAY BRANCH	NIP Online   WEB APP  Aay  Trf to Access	SYSTEM	SYSTEM	0	A	23208434	\N	\N	L	NGN	23208434	1	NG	3	KANO MM WAY BRANCH	2916593	NBA MULTI PURPOSE COMANY NIG	\N	\N	\N	\N	\N	L	NGN	23208434	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.58.938478000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	NBA MULTI PURPOSE COMANY NIG	01-JAN-70 12.00.00.000000000 AM	8032605293	NO 449                         MANDAWARI SABON TITI           BERUIT ROAD	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24808054-0001	24808054-0001	09-JUN-22 12.00.00.000000000 AM	206023198.35	AAnpyKABKAAAuXvAAC
68227	1138569	404004	HEAD OFFICE	WEB APP  supply office equipment  Trf to	SYSTEM	SYSTEM	0	A	10000000	\N	\N	L	NGN	10000000	1	NG	1	HEAD OFFICE	1138569	KAMA INTEGRATED SERVICES LTD	\N	\N	\N	\N	\N	L	NGN	10000000	1	NG	1	Sterling Bank	2986028	UTHMAN UMAR MUHAMMAD	\N	\N	\N	OTHERS	30-AUG-22 04.48.59.978672000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	KAMA INTEGRATED SERVICES LTD	01-JAN-70 12.00.00.000000000 AM	8063431107	NO 1                           FIRST AVENUE, DRIVE FORT ROYAL  ESTATE, AIR PORT ROAD	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	11967404-0001	11967404-0001	02-FEB-21 12.00.00.000000000 AM	13734.75	AAnpyKABKAAAuX6AAB
68228	1835624	392032	KANO MM WAY BRANCH	NIP SDQ   INTER BANK TRANSFER	SYSTEM	SYSTEM	0	A	29140000	\N	\N	L	NGN	29140000	1	NG	3	KANO MM WAY BRANCH	1835624	SEDEEQ GENERAL FARM ENTERPRISE	\N	\N	\N	\N	\N	L	NGN	29140000	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.49.00.877703000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	SEDEEQ GENERAL FARM ENTERPRISE	01-JAN-70 12.00.00.000000000 AM	8104206816	NO 02                          KOFAR KUDU SABUWAR             UNGUWA WUDIL	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	1056601394	1056601394	10-NOV-21 12.00.00.000000000 AM	3737.1	AAnpyKABJAAAs8JAAB
68229	1036030001	037434	KADUNA MAIN BRANCH	NIP FRM LAPLACE VENTURES COB TRF FROM LA	SYSTEM	SYSTEM	0	A	5000000	\N	\N	L	NGN	5000000	1	NG	7	KADUNA MAIN BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	5000000	1	NG	7	Fidelity Bank	1608044	LORE MULTI LINKS SERVICES	\N	\N	\N	OTHERS	30-AUG-22 04.49.01.620233000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	LORE MULTI LINKS SERVICES	01-JAN-70 12.00.00.000000000 AM	8033115854	NO.7                           CLUB ROAD                      BEHIND HAMDALA HOTEL	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24244814-0001	24244814-0001	24-AUG-21 12.00.00.000000000 AM	96323191.25	AAnpyKABJAAAs8aAAD
68230	1218609	045733	SOKOTO BRANCH	WEB APP  Mukhtar  Trf to DEM BANK SEEDY	SYSTEM	SYSTEM	0	A	10000000	\N	\N	L	NGN	10000000	1	NG	6	SOKOTO BRANCH	1218609	ABUBAKAR MUKHTAR	\N	\N	\N	\N	\N	L	NGN	10000000	1	NG	6	JAIZ Bank	1052049	SEEDY QUALITY MOTORS LTD	\N	\N	\N	OTHERS	30-AUG-22 04.49.02.236727000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	22299176028	M	MR	ABUBAKAR	MUKHTAR	12-JAN-84 12.00.00.000000000 AM	9015555556	200 ARKILLA FEDERAL LOWCOST    ARKILLA	SOKOTO	SOKOTO	WMK00415AA01	13-JUL-19 12.00.00.000000000 AM	\N	\N	08-MAR-21 12.00.00.000000000 AM	949268.01	AAnpyKABJAAAs9vAAA
68231	2916593	278588	KANO MM WAY BRANCH	NIP Online   WEB APP  Ay  Trf to ZENITH	SYSTEM	SYSTEM	0	A	6079734	\N	\N	L	NGN	6079734	1	NG	3	KANO MM WAY BRANCH	2916593	NBA MULTI PURPOSE COMANY NIG	\N	\N	\N	\N	\N	L	NGN	6079734	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.49.03.658615000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	NBA MULTI PURPOSE COMANY NIG	01-JAN-70 12.00.00.000000000 AM	8032605293	NO 449                         MANDAWARI SABON TITI           BERUIT ROAD	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24808054-0001	24808054-0001	09-JUN-22 12.00.00.000000000 AM	206023198.35	AAnpyKABIAAAt/SAAA
68232	1905231	278594	KANO MM WAY BRANCH	WEB APP  Sammie  Trf to DEM BANK ABDULRA	SYSTEM	SYSTEM	0	A	6100000	\N	\N	L	NGN	6100000	1	NG	3	KANO MM WAY BRANCH	1905231	UGONAZ GLOBAL RESOURCES	\N	\N	\N	\N	\N	L	NGN	6100000	1	NG	3	FCMB	198595	ABDULRAHAMAN SABO JIBRIN	\N	\N	\N	OTHERS	30-AUG-22 04.49.04.660066000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	UGONAZ GLOBAL RESOURCES	01-JAN-70 12.00.00.000000000 AM	8035878749	NO 188  FESTING ROAD           SABON GARI                     FAGGE	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	23055622-0001	23055622-0001	01-DEC-21 12.00.00.000000000 AM	800028.45	AAnpyKABHAAAtqIAAA
68233	2916593	278595	KANO MM WAY BRANCH	NIP Online   WEB APP  Ay  Trf to Fidelit	SYSTEM	SYSTEM	0	A	16000000	\N	\N	L	NGN	16000000	1	NG	3	KANO MM WAY BRANCH	2916593	NBA MULTI PURPOSE COMANY NIG	\N	\N	\N	\N	\N	L	NGN	16000000	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.49.06.240530000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	NBA MULTI PURPOSE COMANY NIG	01-JAN-70 12.00.00.000000000 AM	8032605293	NO 449                         MANDAWARI SABON TITI           BERUIT ROAD	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24808054-0001	24808054-0001	09-JUN-22 12.00.00.000000000 AM	206023198.35	AAnpyKABHAAAtqYAAA
68252	455966	067864	HEAD OFFICE	NIP Mobile   Bus	SYSTEM	SYSTEM	0	A	5000000	\N	\N	L	NGN	5000000	1	NG	1	HEAD OFFICE	455966	ISAAC MOSES	\N	\N	\N	\N	\N	L	NGN	5000000	1	NG	1	Sterling Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.49.22.280809000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	22342968523	M	MR	ISAAC	MOSES	28-AUG-81 12.00.00.000000000 AM	8058849025	NO 34                          SETTIMA ALI MUNGUNO CRESCENT   UTAKO	KATSINA-ALA	BENUE	\N	01-JAN-70 12.00.00.000000000 AM	\N	\N	28-AUG-20 12.00.00.000000000 AM	256484.73	AAnpyKAA2AAEW3AAAC
68253	\N	003633	ABUJA CORPORATE BRANCH	VAULT OUT	SYSTEM	SYSTEM	0	A	7726730	\N	\N	A	NGN	7726730	0	NG	\N	ABUJA CORPORATE BRANCH	\N	\N	\N	\N	\N	\N	\N	A	NGN	7726730	0	NG	2	Keystone Bank	1013030004	TAJBANK LTD	\N	\N	\N	LOCAL DEPOSIT	30-AUG-22 04.49.23.329681000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	TAJBANK LTD	01-JAN-70 12.00.00.000000000 AM	0	PLOT 72 AHMADU BELLO WAY       BENUE PLAZA                    CBD	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	2126083-0001	2126083-0001	30-SEP-19 12.00.00.000000000 AM	-10564835	AAnpyKAA2AAEW3vAAB
68254	1031070001	635230	HEAD OFFICE	R 102414691 Session 2208300800 102414691	SYSTEM	SYSTEM	0	A	51459738.64	\N	\N	L	NGN	51459738.64	1	NG	1	HEAD OFFICE	1031070001	REMITA CBN MIRROR AC	\N	\N	\N	\N	\N	L	NGN	51459738.64	1	NG	1	Sterling Bank	21491	TAJBANK LIMITED	\N	\N	\N	OTHERS	30-AUG-22 04.49.23.361234000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	TAJBANK LIMITED	01-JAN-70 12.00.00.000000000 AM	8033050015	PLOT 72                        AHMADU BELLO WAY               CBD,BENUE PLAZA	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	21260831-0001	21260831-0001	03-JAN-20 12.00.00.000000000 AM	120859145.12	AAnpyKAA2AAEW3+AAA
68255	1036030001	438854	ABUJA CORPORATE BRANCH	NIP FRM UCHIANO GLOBAL LINKS ENTERPRIS w	SYSTEM	SYSTEM	0	A	5000000	\N	\N	L	NGN	5000000	1	NG	2	ABUJA CORPORATE BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	5000000	1	NG	2	Keystone Bank	642108	UCHENNA CHRISTAIN MUOJEKWU	\N	\N	\N	OTHERS	30-AUG-22 04.49.24.220581000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	22331927351	M	MR	UCHENNA	MUOJEKWU	08-AUG-80 12.00.00.000000000 AM	8063326902	NO 25                          EME COURT ROAD                 NKWO NWENI TRIANGLE BUS STOP	ABUJA	FCT	\N	01-JAN-70 12.00.00.000000000 AM	\N	\N	25-SEP-20 12.00.00.000000000 AM	4319793.56	AAnpyKAA1AAD1seAAB
68256	896767	045734	SOKOTO BRANCH	NIP Online   WEB APP  S  Trf to First Ba	SYSTEM	SYSTEM	0	A	14000000	\N	\N	L	NGN	14000000	1	NG	6	SOKOTO BRANCH	896767	MUHAMMADU SANI YAHAYA	\N	\N	\N	\N	\N	L	NGN	14000000	1	NG	6	JAIZ Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.49.24.717157000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	22575492064	M	MR	MUHAMMADU	YAHAYA	01-DEC-90 12.00.00.000000000 AM	8106936622	KWALBATI AREA ILLELA           SOKOTO                         SOKOTO	ILLELAH	SOKOTO	93047008288	12-JUN-14 12.00.00.000000000 AM	\N	\N	20-NOV-20 12.00.00.000000000 AM	10792059.69	AAnpyKAA1AAD1t/AAC
68257	2916593	278605	KANO MM WAY BRANCH	NIP Online   WEB APP  Ay  Trf to United	SYSTEM	SYSTEM	0	A	6985700	\N	\N	L	NGN	6985700	1	NG	3	KANO MM WAY BRANCH	2916593	NBA MULTI PURPOSE COMANY NIG	\N	\N	\N	\N	\N	L	NGN	6985700	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.49.26.401787000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	NBA MULTI PURPOSE COMANY NIG	01-JAN-70 12.00.00.000000000 AM	8032605293	NO 449                         MANDAWARI SABON TITI           BERUIT ROAD	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24808054-0001	24808054-0001	09-JUN-22 12.00.00.000000000 AM	206023198.35	AAnpyKAAaAAGgI3AAB
68258	2916593	278607	KANO MM WAY BRANCH	NIP Online   WEB APP  Aay  Trf to Access	SYSTEM	SYSTEM	0	A	13659551	\N	\N	L	NGN	13659551	1	NG	3	KANO MM WAY BRANCH	2916593	NBA MULTI PURPOSE COMANY NIG	\N	\N	\N	\N	\N	L	NGN	13659551	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.49.27.893502000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	NBA MULTI PURPOSE COMANY NIG	01-JAN-70 12.00.00.000000000 AM	8032605293	NO 449                         MANDAWARI SABON TITI           BERUIT ROAD	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24808054-0001	24808054-0001	09-JUN-22 12.00.00.000000000 AM	206023198.35	AAnpyKAAZAAGgJIAAB
68259	1224732	045736	SOKOTO BRANCH	NIP Online   WEB APP  Amd  Trf to First	SYSTEM	SYSTEM	0	A	9700000	\N	\N	L	NGN	9700000	1	NG	6	SOKOTO BRANCH	1224732	A M D &amp, SONS NIGERIA LIMITED	\N	\N	\N	\N	\N	L	NGN	9700000	1	NG	6	JAIZ Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.49.28.692123000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	A M D &amp, SONS NIGERIA LIMITED	01-JAN-70 12.00.00.000000000 AM	8037673030	NO 22/23                       SULTAN BELLO ROAD SOKOTO       SOKOTOO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	16997700-0001	16997700-0001	09-MAR-21 12.00.00.000000000 AM	175958.49	AAnpyKAAYAAG8XvAAA
68260	3345905	099338	SABON GARI BRANCH	NIP Balance   INTER BANK TRANSFER	SYSTEM	SYSTEM	0	A	7540000	\N	\N	L	NGN	7540000	1	NG	11	SABON GARI BRANCH	3345905	GOMBAW AGRO VENTURES	\N	\N	\N	\N	\N	L	NGN	7540000	1	NG	11	Unity Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.49.32.869114000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	GOMBAW AGRO VENTURES	01-JAN-70 12.00.00.000000000 AM	8034246606	02 YAN KAJI STREET             DAWANAU MARKET                 DAWAKIN TOFA LGA	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	1064611690	1064611690	23-AUG-22 12.00.00.000000000 AM	6858536.15	AAnpyKAAWAAF0FLAAC
68261	1036030001	037546	KADUNA MAIN BRANCH	NIP FRM KHALID YUSUF ABUBAKAR K	SYSTEM	SYSTEM	0	A	5000000	\N	\N	L	NGN	5000000	1	NG	7	KADUNA MAIN BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	5000000	1	NG	7	Fidelity Bank	3320858	MUHAMJIL NIG LTD	\N	\N	\N	OTHERS	30-AUG-22 04.49.34.577757000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	MUHAMJIL NIG LTD	01-JAN-70 12.00.00.000000000 AM	8032367124	FF9                            NUT PLAZA                      MUHAMMED BUHARI WAY	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	20589213-0001	20589213-0001	19-AUG-22 12.00.00.000000000 AM	51082163.75	AAnpyKAAWAAF0FuAAD
68262	1031210001	163560	HEAD OFFICE	NIBSS SESSION1 30-08-2022	SYSTEM	SYSTEM	0	A	549338708.77	\N	\N	L	NGN	549338708.77	1	NG	1	HEAD OFFICE	1031210001	TAJBANK LTD	\N	\N	\N	\N	\N	L	NGN	549338708.77	1	NG	1	Sterling Bank	1014010001	CBN MAIN ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.49.35.298535000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	TAJBANK LTD	01-JAN-70 12.00.00.000000000 AM	0	PLOT 72 AHMADU BELLO WAY       BENUE PLAZA                    CBD	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	2126083-0001	2126083-0001	30-SEP-19 12.00.00.000000000 AM	-853975088.46	AAnpyKAAVAAF0CKAAA
68263	\N	487702	SOKOTO BRANCH	62020/CD/SOLOMON	SYSTEM	SYSTEM	0	A	6750000	\N	\N	A	NGN	6750000	0	NG	\N	SOKOTO BRANCH	\N	\N	\N	\N	\N	\N	\N	A	NGN	6750000	0	NG	6	JAIZ Bank	1787651	IFEANYI EZEAGU	\N	\N	\N	LOCAL DEPOSIT	30-AUG-22 04.49.36.189674000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	22350945855	M	MR	IFEANYI	EZEAGU	17-APR-86 12.00.00.000000000 AM	8030897165	TAMAJI AREA                    BEHIND NNPC FILLING STATION    SOKOTO SOUTH	IMO	IMO	57228364098	01-JAN-18 12.00.00.000000000 AM	\N	\N	26-OCT-21 12.00.00.000000000 AM	84290059.66	AAnpyKAAVAAF0CyAAA
68264	\N	487712	SOKOTO BRANCH	62021/CD/VICENT	SYSTEM	SYSTEM	0	A	8300000	\N	\N	A	NGN	8300000	0	NG	\N	SOKOTO BRANCH	\N	\N	\N	\N	\N	\N	\N	A	NGN	8300000	0	NG	6	JAIZ Bank	1787651	IFEANYI EZEAGU	\N	\N	\N	LOCAL DEPOSIT	30-AUG-22 04.49.37.048691000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	22350945855	M	MR	IFEANYI	EZEAGU	17-APR-86 12.00.00.000000000 AM	8030897165	TAMAJI AREA                    BEHIND NNPC FILLING STATION    SOKOTO SOUTH	IMO	IMO	57228364098	01-JAN-18 12.00.00.000000000 AM	\N	\N	26-OCT-21 12.00.00.000000000 AM	84290059.66	AAnpyKAAVAAF0C/AAC
68265	2071000002	163563	ABUJA CORPORATE BRANCH	IFO OFFICIAL BAAYE ENTERPRISES	SYSTEM	SYSTEM	0	A	30000000	\N	\N	L	NGN	30000000	1	NG	2	ABUJA CORPORATE BRANCH	2071000002	INTERBRANCH ACCOUNT	\N	\N	\N	\N	\N	L	NGN	30000000	1	NG	12	StanbicIBTC Bank	2239652	OFFICIAL BAAYE ENTERPRISES	\N	\N	\N	OTHERS	30-AUG-22 04.49.38.215650000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	OFFICIAL BAAYE ENTERPRISES	01-JAN-70 12.00.00.000000000 AM	8037980254	NO. 63 EL-DUNIYA SHOPPING      COMPLEX IBRAHIM TAIWO ROAD     FAGGE LGA	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24852412-0001	24852412-0001	10-FEB-22 12.00.00.000000000 AM	57427540.75	AAnpyKAAUAAG+SpAAA
68266	2986028	353173	HEAD OFFICE	NIP Supply Office Equipment	SYSTEM	SYSTEM	0	A	10000000	\N	\N	L	NGN	10000000	1	NG	1	HEAD OFFICE	2986028	UTHMAN UMAR MUHAMMAD	\N	\N	\N	\N	\N	L	NGN	10000000	1	NG	1	Sterling Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.49.40.605739000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	22221217401	M	MR	UTHMAN	MUHAMMAD	28-DEC-88 12.00.00.000000000 AM	8037885528	76 SOKOTO STREET               JEDO ESTATE                    LUGBE SAUKA	KANO	KANO	61983599190	17-JUN-22 12.00.00.000000000 AM	\N	\N	17-JUN-22 12.00.00.000000000 AM	105004.75	AAnpyKAATAAGu6+AAC
68267	1036030001	307552	KANO MM WAY BRANCH	NIP FRM UMAR SALIHU S TRFAle AbbaFRM UMA	SYSTEM	SYSTEM	0	A	24900000	\N	\N	L	NGN	24900000	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	24900000	1	NG	3	FCMB	1357957	SHEHU UMAR	\N	\N	\N	OTHERS	30-AUG-22 04.49.41.434100000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	22530114925	M	MR	SHEHU	UMAR	02-AUG-74 12.00.00.000000000 AM	7060566752	NO 15 SHEKA                    SABUWAR ABUJA	KANO	KANO	43465882788	01-JAN-70 12.00.00.000000000 AM	\N	\N	18-MAY-21 12.00.00.000000000 AM	19597557.82	AAnpyKAATAAGu74AAC
68268	1030080005	163566	HEAD OFFICE	CIBS/BOKO AGRO ALLIED NIG LTD	SYSTEM	SYSTEM	0	A	20000000	\N	\N	L	NGN	20000000	1	NG	1	HEAD OFFICE	1030080005	NAPS CBN SETTLEMENT ACCOUNT	\N	\N	\N	\N	\N	L	NGN	20000000	1	NG	3	FCMB	1389529	BOKO AGRO ALLIED NIG LTD	\N	\N	\N	OTHERS	30-AUG-22 04.49.42.183486000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	BOKO AGRO ALLIED NIG LTD	01-JAN-70 12.00.00.000000000 AM	8032173656	SHARADA STREET OFF             ZOO ROAD                       KANO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	23719855-0001	23719855-0001	02-JUN-21 12.00.00.000000000 AM	31309108.66	AAnpyKAASAAHwC1AAA
68234	2231986	181989	ABUJA CORPORATE BRANCH	NIP Online   WEB APP  CH 2  Trf to Provi	SYSTEM	SYSTEM	0	A	8958040	\N	\N	L	NGN	8958040	1	NG	2	ABUJA CORPORATE BRANCH	2231986	ANT FINANCIAL LTD	\N	\N	\N	\N	\N	L	NGN	8958040	1	NG	2	Keystone Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.49.07.483155000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	ANT FINANCIAL LTD	01-JAN-70 12.00.00.000000000 AM	9067677457	NO 4                           AMURIE OMANZE STREET           GARKI 2	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24099647-0001	24099647-0001	09-FEB-22 12.00.00.000000000 AM	5777874.49	AAnpyKABHAAAtr3AAB
68235	1036030001	307332	KANO MM WAY BRANCH	NIP FRM RABIB INTEGRATED CONCEPTS App  T	SYSTEM	SYSTEM	0	A	10000000	\N	\N	L	NGN	10000000	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	10000000	1	NG	3	FCMB	1994244	HATTA AGRO ALLIED AND FARMS	\N	\N	\N	OTHERS	30-AUG-22 04.49.08.430415000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	HATTA AGRO ALLIED AND FARMS	01-JAN-70 12.00.00.000000000 AM	8030909019	NO 17                          NAGODA ROAD KOFAR WAMBAI       MARKET FAGGE	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	1062833221	1062833221	23-DEC-21 12.00.00.000000000 AM	51689667.95	AAnpyKABGAAAtsqAAA
68236	423655	392053	KANO MM WAY BRANCH	NIP Sm6   INTER BANK TRANSFER	SYSTEM	SYSTEM	0	A	10266471	\N	\N	L	NGN	10266471	1	NG	3	KANO MM WAY BRANCH	423655	A.S.D.K STANDARD VISION LTD	\N	\N	\N	\N	\N	L	NGN	10266471	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.49.08.660672000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	A.S.D.K STANDARD VISION LTD	01-JAN-70 12.00.00.000000000 AM	9065954664	HOTORO QUATERS MAIDUGURI       ROAD	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	20217981-0001	20217981-0001	25-AUG-20 12.00.00.000000000 AM	26352243.47	AAnpyKABFAAAjAIAAA
68237	1477954	416365	KADUNA MAIN BRANCH	NIP Mobile   BABA ALI ENTERPRISES NIG LT	SYSTEM	SYSTEM	0	A	5000000	\N	\N	L	NGN	5000000	1	NG	7	KADUNA MAIN BRANCH	1477954	GOGA HEAVY TRUCKS	\N	\N	\N	\N	\N	L	NGN	5000000	1	NG	7	Fidelity Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.49.09.485708000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	GOGA HEAVY TRUCKS	01-JAN-70 12.00.00.000000000 AM	8036944378	NO 1                           WUSASA                         DAN MAGAJI	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24688340-0001	24688340-0001	08-JUL-21 12.00.00.000000000 AM	521029.15	AAnpyKABFAAAjAKAAB
68238	1036030001	307340	KANO MM WAY BRANCH	NIP FRM AHMEDGAJO AUTOMOBILE SERV LTD To	SYSTEM	SYSTEM	0	A	8033600	\N	\N	L	NGN	8033600	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	8033600	1	NG	3	FCMB	2916593	NBA MULTI PURPOSE COMANY NIG	\N	\N	\N	OTHERS	30-AUG-22 04.49.10.931737000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	NBA MULTI PURPOSE COMANY NIG	01-JAN-70 12.00.00.000000000 AM	8032605293	NO 449                         MANDAWARI SABON TITI           BERUIT ROAD	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24808054-0001	24808054-0001	09-JUN-22 12.00.00.000000000 AM	206023198.35	AAnpyKABFAAAjAeAAC
68239	2916593	278597	KANO MM WAY BRANCH	NIP Online   WEB APP  Aay  Trf to FCMB E	SYSTEM	SYSTEM	0	A	6988700	\N	\N	L	NGN	6988700	1	NG	3	KANO MM WAY BRANCH	2916593	NBA MULTI PURPOSE COMANY NIG	\N	\N	\N	\N	\N	L	NGN	6988700	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.49.12.377094000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	NBA MULTI PURPOSE COMANY NIG	01-JAN-70 12.00.00.000000000 AM	8032605293	NO 449                         MANDAWARI SABON TITI           BERUIT ROAD	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24808054-0001	24808054-0001	09-JUN-22 12.00.00.000000000 AM	206023198.35	AAnpyKABFAAAjBYAAC
68240	423655	392060	KANO MM WAY BRANCH	NIP Sm7   INTER BANK TRANSFER	SYSTEM	SYSTEM	0	A	31493600	\N	\N	L	NGN	31493600	1	NG	3	KANO MM WAY BRANCH	423655	A.S.D.K STANDARD VISION LTD	\N	\N	\N	\N	\N	L	NGN	31493600	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.49.12.582492000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	A.S.D.K STANDARD VISION LTD	01-JAN-70 12.00.00.000000000 AM	9065954664	HOTORO QUATERS MAIDUGURI       ROAD	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	20217981-0001	20217981-0001	25-AUG-20 12.00.00.000000000 AM	26352243.47	AAnpyKABEAAAtMIAAB
68241	1993340	392057	KANO MM WAY BRANCH	NIP Jaya masaud    INTER BANK TRANSFER	SYSTEM	SYSTEM	0	A	13980000	\N	\N	L	NGN	13980000	1	NG	3	KANO MM WAY BRANCH	1993340	NAXEEPH AGRO ALLIED TRADES	\N	\N	\N	\N	\N	L	NGN	13980000	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.49.13.813479000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	NAXEEPH AGRO ALLIED TRADES	01-JAN-70 12.00.00.000000000 AM	8110559829	NO 14                          ZEETA HOUSE                    IBB GWARI MARKET, FAGGE	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	1062913072	1062913072	23-DEC-21 12.00.00.000000000 AM	65634164.75	AAnpyKABEAAAtNhAAC
68242	1036030001	438804	ABUJA CORPORATE BRANCH	NIP FRM ADEWUYI ADELOYE SUNDAY REF326253	SYSTEM	SYSTEM	0	A	10000000	\N	\N	L	NGN	10000000	1	NG	2	ABUJA CORPORATE BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	10000000	1	NG	2	Keystone Bank	1795788	OLUMIDE ADEMOLA ADEBAYO	\N	\N	\N	OTHERS	30-AUG-22 04.49.14.737505000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	M	MR	OLUMIDE	ADEBAYO	16-AUG-82 12.00.00.000000000 AM	8034942840	BY OANDO                       FILLING STATION                FHA KUJE 1	ADO EKITI	EKITI	B00054575	24-SEP-19 12.00.00.000000000 AM	\N	\N	28-OCT-21 12.00.00.000000000 AM	29684680.92	AAnpyKABDAAASfuAAA
68243	21491	352938	HEAD OFFICE	R 701277524 UNIVERSAL  40PAYMENT CBN 701	SYSTEM	SYSTEM	0	A	23687729.63	\N	\N	L	NGN	23687729.63	1	NG	1	HEAD OFFICE	21491	TAJBANK LIMITED	\N	\N	\N	\N	\N	L	NGN	23687729.63	1	NG	1	Sterling Bank	871775	CEELUX ENGINEERING SERVICES LTD	\N	\N	\N	OTHERS	30-AUG-22 04.49.14.769998000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	TAJBANK LIMITED	01-JAN-70 12.00.00.000000000 AM	8033050015	PLOT 72                        AHMADU BELLO WAY               CBD,BENUE PLAZA	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	21260831-0001	21260831-0001	03-JAN-20 12.00.00.000000000 AM	120859145.12	AAnpyKAA7AAASdGAAC
68244	1031070001	634460	HEAD OFFICE	R 102495143 Session 2208291100 102495143	SYSTEM	SYSTEM	0	A	98374507.48	\N	\N	L	NGN	98374507.48	1	NG	1	HEAD OFFICE	1031070001	REMITA CBN MIRROR AC	\N	\N	\N	\N	\N	L	NGN	98374507.48	1	NG	1	Sterling Bank	21491	TAJBANK LIMITED	\N	\N	\N	OTHERS	30-AUG-22 04.49.14.805080000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	TAJBANK LIMITED	01-JAN-70 12.00.00.000000000 AM	8033050015	PLOT 72                        AHMADU BELLO WAY               CBD,BENUE PLAZA	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	21260831-0001	21260831-0001	03-JAN-20 12.00.00.000000000 AM	120859145.12	AAnpyKAA7AAASdIAAC
68245	21491	352937	HEAD OFFICE	R 701322715 FGN  FEDER BEINGPAYMENTTOTHE	SYSTEM	SYSTEM	0	A	14754200	\N	\N	L	NGN	14754200	1	NG	1	HEAD OFFICE	21491	TAJBANK LIMITED	\N	\N	\N	\N	\N	L	NGN	14754200	1	NG	1	Sterling Bank	643552	WINSLOW LOGISTICS LTD-FACILITY ACC	\N	\N	\N	OTHERS	30-AUG-22 04.49.14.849093000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	TAJBANK LIMITED	01-JAN-70 12.00.00.000000000 AM	8033050015	PLOT 72                        AHMADU BELLO WAY               CBD,BENUE PLAZA	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	21260831-0001	21260831-0001	03-JAN-20 12.00.00.000000000 AM	120859145.12	AAnpyKAA7AAASdMAAB
68246	21491	352939	HEAD OFFICE	R 700621392 FEDERAL CO PROVISIONOFFERTIL	SYSTEM	SYSTEM	0	A	11280000	\N	\N	L	NGN	11280000	1	NG	1	HEAD OFFICE	21491	TAJBANK LIMITED	\N	\N	\N	\N	\N	L	NGN	11280000	1	NG	1	Sterling Bank	1579511	GWANA FARMS LIMITED	\N	\N	\N	OTHERS	30-AUG-22 04.49.14.904059000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	TAJBANK LIMITED	01-JAN-70 12.00.00.000000000 AM	8033050015	PLOT 72                        AHMADU BELLO WAY               CBD,BENUE PLAZA	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	21260831-0001	21260831-0001	03-JAN-20 12.00.00.000000000 AM	120859145.12	AAnpyKAA7AAASdMAAC
68247	1692148	494042	ABUJA CORPORATE BRANCH	NIP Mobile   Self	SYSTEM	SYSTEM	0	A	5000000	\N	\N	L	NGN	5000000	1	NG	2	ABUJA CORPORATE BRANCH	1692148	SALIHU OLAYINKA ABDULKADIR	\N	\N	\N	\N	\N	L	NGN	5000000	1	NG	2	Keystone Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.49.15.815724000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	M	MR	SALIHU	ABDULKADIR	08-AUG-71 12.00.00.000000000 AM	8033574286	PLOT 784 INSURANCE BUILDING     UND. ST AMAC	ILORIN WEST	KWARA	HKY00035AA1	01-DEC-17 12.00.00.000000000 AM	\N	\N	24-SEP-21 12.00.00.000000000 AM	34999978.39	AAnpyKAA5AAGoO8AAA
68248	3248336	181997	ABUJA CORPORATE BRANCH	NIP Online   WEB APP  Gaduwa Ref   Trf t	SYSTEM	SYSTEM	0	A	7000000	\N	\N	L	NGN	7000000	1	NG	2	ABUJA CORPORATE BRANCH	3248336	MCDREAM CONCEPTS LIMITED PROJECT ACC	\N	\N	\N	\N	\N	L	NGN	7000000	1	NG	2	Keystone Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.49.18.186668000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	MCDREAM CONCEPTS LIMITED PROJECT ACC	01-JAN-70 12.00.00.000000000 AM	7033347533	PLOT 11B                       KASHIM IBRAHIM ROAD            RIMI	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	20769953/0001	20769953/0001	05-AUG-22 12.00.00.000000000 AM	53440080.61	AAnpyKAA5AAGoPYAAA
68249	\N	003631	ABUJA CORPORATE BRANCH	VAULT OUT	SYSTEM	SYSTEM	0	A	9236790	\N	\N	A	NGN	9236790	0	NG	\N	ABUJA CORPORATE BRANCH	\N	\N	\N	\N	\N	\N	\N	A	NGN	9236790	0	NG	2	Keystone Bank	1013030001	TAJBANK LTD	\N	\N	\N	LOCAL DEPOSIT	30-AUG-22 04.49.19.144447000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	TAJBANK LTD	01-JAN-70 12.00.00.000000000 AM	0	PLOT 72 AHMADU BELLO WAY       BENUE PLAZA                    CBD	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	2126083-0001	2126083-0001	30-SEP-19 12.00.00.000000000 AM	-3745090	AAnpyKAA4AAGkMgAAA
68250	1036030001	307438	KANO MM WAY BRANCH	NIP FRM AHMEDGAJO AUTOMOBILE SERV LTD To	SYSTEM	SYSTEM	0	A	10000000	\N	\N	L	NGN	10000000	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	10000000	1	NG	3	FCMB	2916593	NBA MULTI PURPOSE COMANY NIG	\N	\N	\N	OTHERS	30-AUG-22 04.49.20.423742000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	NBA MULTI PURPOSE COMANY NIG	01-JAN-70 12.00.00.000000000 AM	8032605293	NO 449                         MANDAWARI SABON TITI           BERUIT ROAD	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24808054-0001	24808054-0001	09-JUN-22 12.00.00.000000000 AM	206023198.35	AAnpyKAA3AAD1lBAAC
68251	1036030001	307433	KANO MM WAY BRANCH	NIP FRM FADIMA TALO GLOBAL ENTERPRISE CO	SYSTEM	SYSTEM	0	A	29980000	\N	\N	L	NGN	29980000	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	29980000	1	NG	3	FCMB	2916593	NBA MULTI PURPOSE COMANY NIG	\N	\N	\N	OTHERS	30-AUG-22 04.49.22.025428000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	NBA MULTI PURPOSE COMANY NIG	01-JAN-70 12.00.00.000000000 AM	8032605293	NO 449                         MANDAWARI SABON TITI           BERUIT ROAD	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24808054-0001	24808054-0001	09-JUN-22 12.00.00.000000000 AM	206023198.35	AAnpyKAA3AAD1lpAAB
68281	1030080005	637196	HEAD OFFICE	CIBS MADUS COMMODITIES NIG LTD To ABBAMA	SYSTEM	SYSTEM	0	A	20000000	\N	\N	L	NGN	20000000	1	NG	1	HEAD OFFICE	1030080005	NAPS CBN SETTLEMENT ACCOUNT	\N	\N	\N	\N	\N	L	NGN	20000000	1	NG	3	FCMB	3073721	ABBAMASU COMPANY	\N	\N	\N	OTHERS	30-AUG-22 04.50.10.933796000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	ABBAMASU COMPANY	01-JAN-70 12.00.00.000000000 AM	7036229808	NO. 1125 UNGOGGO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	22865004-0001	22865004-0001	30-JUN-22 12.00.00.000000000 AM	30155048.34	AAnpyKAAOAAHwDcAAB
68282	1030080005	307578	KANO MM WAY BRANCH	CIBS MADUS COMMODITIES NIG LTD To ABBAMA	SYSTEM	SYSTEM	0	A	20000000	\N	\N	L	NGN	20000000	1	NG	1	KANO MM WAY BRANCH	1030080005	NAPS CBN SETTLEMENT ACCOUNT	\N	\N	\N	\N	\N	L	NGN	20000000	1	NG	3	FCMB	3073721	ABBAMASU COMPANY	\N	\N	\N	OTHERS	30-AUG-22 04.50.12.796468000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	ABBAMASU COMPANY	01-JAN-70 12.00.00.000000000 AM	7036229808	NO. 1125 UNGOGGO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	22865004-0001	22865004-0001	30-JUN-22 12.00.00.000000000 AM	30155048.34	AAnpyKAAOAAHwDoAAC
68283	1030080005	637197	HEAD OFFICE	CIBS MADUS COMMODITIES NIG LTD To ABBAMA	SYSTEM	SYSTEM	0	A	20000000	\N	\N	L	NGN	20000000	1	NG	1	HEAD OFFICE	1030080005	NAPS CBN SETTLEMENT ACCOUNT	\N	\N	\N	\N	\N	L	NGN	20000000	1	NG	3	FCMB	3073721	ABBAMASU COMPANY	\N	\N	\N	OTHERS	30-AUG-22 04.50.14.538796000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	ABBAMASU COMPANY	01-JAN-70 12.00.00.000000000 AM	7036229808	NO. 1125 UNGOGGO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	22865004-0001	22865004-0001	30-JUN-22 12.00.00.000000000 AM	30155048.34	AAnpyKAAOAAHwDsAAA
68284	1036030001	037629	KADUNA MAIN BRANCH	NIP FRM ABUBAKAR KHALID YUSUF TRFKFRM AB	SYSTEM	SYSTEM	0	A	11000000	\N	\N	L	NGN	11000000	1	NG	7	KADUNA MAIN BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	11000000	1	NG	7	Fidelity Bank	3320858	MUHAMJIL NIG LTD	\N	\N	\N	OTHERS	30-AUG-22 04.50.16.627967000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	MUHAMJIL NIG LTD	01-JAN-70 12.00.00.000000000 AM	8032367124	FF9                            NUT PLAZA                      MUHAMMED BUHARI WAY	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	20589213-0001	20589213-0001	19-AUG-22 12.00.00.000000000 AM	51082163.75	AAnpyKAAMAAHwC5AAC
68285	1036030001	439022	ABUJA CORPORATE BRANCH	000004220830090905115494447375	SYSTEM	SYSTEM	0	A	5000000	\N	\N	L	NGN	5000000	1	NG	2	ABUJA CORPORATE BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	5000000	1	NG	2	Keystone Bank	3046927	LODCH HOMES INVESTMENT LTD	\N	\N	\N	OTHERS	30-AUG-22 04.50.17.798074000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	LODCH HOMES INVESTMENT LTD	01-JAN-70 12.00.00.000000000 AM	8055132062	SUITE 63 JAM NAB PLAZA GARKI   2 ABUJA FCT                    BRAND ROAD UND ST. ADO FCT EAS	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	23928899-0001	23928899-0001	27-JUN-22 12.00.00.000000000 AM	18018883.75	AAnpyKAALAAHwCSAAB
68286	\N	487765	SOKOTO BRANCH	61378 /C.D/ ALH ABU ZAMAU	SYSTEM	SYSTEM	0	A	8000000	\N	\N	A	NGN	8000000	0	NG	\N	SOKOTO BRANCH	\N	\N	\N	\N	\N	\N	\N	A	NGN	8000000	0	NG	6	JAIZ Bank	1298045	SIRAJO ABUBAKAR ZAMAU	\N	\N	\N	LOCAL DEPOSIT	30-AUG-22 04.50.18.560828000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	22297849964	M	MR	SIRAJO	ZAMAU	02-JUN-85 12.00.00.000000000 AM	8065718004	NEAR ALH ABUBAKAR ZAMAU        OLD MARKET AREA SOKOTO         SOKOTO	SOKOTO NORTH	SOKOTO	65209917561	12-JUN-16 12.00.00.000000000 AM	\N	\N	12-APR-21 12.00.00.000000000 AM	43685250.52	AAnpyKAALAAHwCeAAA
68287	2764794	085358	YOLA BRANCH	NIP BO  JAMIL PET NIG LTD IFO TRADER SAN	SYSTEM	SYSTEM	0	A	8000000	\N	\N	L	NGN	8000000	1	NG	10	YOLA BRANCH	2764794	JAMIL PET NIG LTD	\N	\N	\N	\N	\N	L	NGN	8000000	1	NG	10	Ecobank Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.50.20.034534000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	JAMIL PET NIG LTD	01-JAN-70 12.00.00.000000000 AM	7031988882	BLOCK J SHOP 182 JIMETA ULTRA  MODERN MARKET JIMETA YOLA      NORTH LGA ADAMAWA STATE	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	11580940-001	11580940-001	11-MAY-22 12.00.00.000000000 AM	43375	AAnpyKAAKAAHD/WAAA
68288	3116833	099345	SABON GARI BRANCH	NIP Tolulope    INTER BANK TRANSFER	SYSTEM	SYSTEM	0	A	13537800	\N	\N	L	NGN	13537800	1	NG	11	SABON GARI BRANCH	3116833	SUBWAY AGRO LIMITED	\N	\N	\N	\N	\N	L	NGN	13537800	1	NG	11	Unity Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.50.21.870764000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	SUBWAY AGRO LIMITED	01-JAN-70 12.00.00.000000000 AM	9092729325	BARE BARI LINE                 KANO. PREMIER HOUSE            IBRAHIM TAIWO ROAD KANO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24249473-0001	24249473-0001	08-JUL-22 12.00.00.000000000 AM	63251501.87	AAnpyKAAKAAHD/eAAB
68289	2974735	392130	KANO MM WAY BRANCH	Kk   LOCAL TRANSFER	SYSTEM	SYSTEM	0	A	8718000	\N	\N	L	NGN	8718000	1	NG	11	KANO MM WAY BRANCH	2974735	DIDAT GENERAL ENTERPRISES	\N	\N	\N	\N	\N	L	NGN	8718000	1	NG	3	FCMB	1521273	LA BINGOO FARM	\N	\N	\N	OTHERS	30-AUG-22 04.50.22.928912000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	LA BINGOO FARM	01-JAN-70 12.00.00.000000000 AM	8132530847	NO 2481 NAIBAWA                NAIBAWA                        KANO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	105599257	105599257	28-JUL-21 12.00.00.000000000 AM	8718356.46	AAnpyKAAKAAHD/nAAC
68290	2974735	099344	SABON GARI BRANCH	Kk   LOCAL TRANSFER	SYSTEM	SYSTEM	0	A	8718000	\N	\N	L	NGN	8718000	1	NG	11	SABON GARI BRANCH	2974735	DIDAT GENERAL ENTERPRISES	\N	\N	\N	\N	\N	L	NGN	8718000	1	NG	3	FCMB	1521273	LA BINGOO FARM	\N	\N	\N	OTHERS	30-AUG-22 04.50.24.539794000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	CORPORATE	\N	DIDAT GENERAL ENTERPRISES	01-JAN-70 12.00.00.000000000 AM	7039204159	N0 34 GANDU GRA SHARAD PH 1    SHARADA PHRASE 1 QRTS          KMC	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	25223908-0001	25223908-0001	16-JUN-22 12.00.00.000000000 AM	13994024.27	AAnpyKAAKAAHD/rAAC
68217	1036030001	633400	HEAD OFFICE	NIP FRM SULE HAMZA WURO BOKKI FBNMOBILEQ	SYSTEM	SYSTEM	0	A	5000000	\N	\N	L	NGN	5000000	1	NG	1	HEAD OFFICE	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	5000000	1	NG	1	Sterling Bank	4546	QARIBULLAH ABUBAKAR ARABI	\N	\N	\N	OTHERS	30-AUG-22 04.48.47.932156000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	22337122903	M	MR	QARIBULLAH	ARABI	07-MAR-70 12.00.00.000000000 AM	8055437330	FLAT 5 PLOT 214,               PATRICK YAKOWA,                KATAMPE,	NAFADA	GOMBE	\N	01-JAN-70 12.00.00.000000000 AM	\N	\N	21-OCT-19 12.00.00.000000000 AM	5018490.99	AAnpyKABLAAAummAAA
68218	1036030001	633424	HEAD OFFICE	NIP FRM YAHYA YUSUF ILU REF3112139010061	SYSTEM	SYSTEM	0	A	6150000	\N	\N	L	NGN	6150000	1	NG	1	HEAD OFFICE	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	6150000	1	NG	1	Sterling Bank	1456922	JAMILU MUSA ABUBAKAR	\N	\N	\N	OTHERS	30-AUG-22 04.48.48.692063000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	22243100570	M	MR	JAMILU	ABUBAKAR	25-JAN-88 12.00.00.000000000 AM	8134796211	NO 4                           OGUN RIVER                     OFF DANUBA MAITAMA	YAWURI	KEBBI	\N	01-JAN-70 12.00.00.000000000 AM	\N	\N	01-JUL-21 12.00.00.000000000 AM	1397166.44	AAnpyKABLAAAumzAAC
68329	36606	182055	ABUJA CORPORATE BRANCH	WEB APP  Trf to DEM BANK MOHAMMED IBRAHI	SYSTEM	SYSTEM	0	A	50000000	\N	\N	L	NGN	50000000	1	NG	2	ABUJA CORPORATE BRANCH	36606	TWINS WORLD WIDE VENTURES	\N	\N	\N	\N	\N	L	NGN	50000000	1	NG	3	FCMB	30628	MOHAMMED IBRAHIM BUHARI	\N	\N	\N	OTHERS	30-AUG-22 04.51.32.788894000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	TWINS WORLD WIDE VENTURES	01-JAN-70 12.00.00.000000000 AM	8099999118	NO 3                           KABWE CLOSE                    ZONE 4	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	6500169971-0001	6500169971-0001	05-FEB-20 12.00.00.000000000 AM	4978771.47	AAnpyKAACAAHwRRAAB
68330	1036030001	439168	ABUJA CORPORATE BRANCH	NIP FRM DAWAKI G8 NIG LTD TRF TO ROSHE I	SYSTEM	SYSTEM	0	A	6000000	\N	\N	L	NGN	6000000	1	NG	2	ABUJA CORPORATE BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	6000000	1	NG	2	Keystone Bank	2331305	ROSHE INTEGRATED SERVICES	\N	\N	\N	OTHERS	30-AUG-22 04.51.34.132153000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	ROSHE INTEGRATED SERVICES	01-JAN-70 12.00.00.000000000 AM	8033892484	PLOT 715 WUYE DISTRICT	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	19452090-0001	19452090-0001	25-FEB-22 12.00.00.000000000 AM	16000764.37	AAnpyKAACAAHwS1AAC
68331	2069554	118632	KOFAR WAMBAI BRANCH	NIP TRF BO  DANDA&#039,U GLOBAL CONCEPT LIMIT	SYSTEM	SYSTEM	0	A	7830000	\N	\N	L	NGN	7830000	1	NG	12	KOFAR WAMBAI BRANCH	2069554	DANDA&#039,U GLOBAL CONCEPT LIMITED	\N	\N	\N	\N	\N	L	NGN	7830000	1	NG	12	StanbicIBTC Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.51.35.208046000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	CORPORATE	\N	DANDA&#039,U GLOBAL CONCEPT LIMITED	01-JAN-70 12.00.00.000000000 AM	8036858175	NO 46 HOTORO QUARTERS          HOTORO                         NASSARAWA LGA	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	09689733-0001	09689733-0001	11-JAN-22 12.00.00.000000000 AM	43433037.99	AAnpyKAACAAHwTEAAA
68332	2069554	163586	KOFAR WAMBAI BRANCH	TRF BO DANDA&#039,U/YUSUF DA,U ALI	SYSTEM	SYSTEM	0	A	9440000	\N	\N	L	NGN	9440000	1	NG	12	KOFAR WAMBAI BRANCH	2069554	DANDA&#039,U GLOBAL CONCEPT LIMITED	\N	\N	\N	\N	\N	L	NGN	9440000	1	NG	13	GTBank Plc	3116390	YUSUF DAU ALIYU	\N	\N	\N	OTHERS	30-AUG-22 04.51.36.284459000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	CORPORATE	\N	DANDA&#039,U GLOBAL CONCEPT LIMITED	01-JAN-70 12.00.00.000000000 AM	8036858175	NO 46 HOTORO QUARTERS          HOTORO                         NASSARAWA LGA	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	09689733-0001	09689733-0001	11-JAN-22 12.00.00.000000000 AM	43433037.99	AAnpyKAACAAHwTtAAA
68333	938669	353806	HEAD OFFICE	NIP ifo  OK GALAXY RESOURCES NIGERIA	SYSTEM	SYSTEM	0	A	6000000	\N	\N	L	NGN	6000000	1	NG	1	HEAD OFFICE	938669	OLIVEC VENTURES (NIGERIA) LIMITED	\N	\N	\N	\N	\N	L	NGN	6000000	1	NG	1	Sterling Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.51.36.819700000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	OLIVEC VENTURES LIMITED	01-JAN-70 12.00.00.000000000 AM	8142467093	HOUSE 5                        FEMI OTEDOLA STREET            7TH AVENUE GWARIMPA	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	01616502	01616502	01-DEC-20 12.00.00.000000000 AM	26167135.82	AAnpyKAACAAHwU2AAB
68334	2878376	353830	HEAD OFFICE	NIP tiles gum profile aluminium windows	SYSTEM	SYSTEM	0	A	50000000	\N	\N	L	NGN	50000000	1	NG	1	HEAD OFFICE	2878376	HOMPIRE ENTERPRISE	\N	\N	\N	\N	\N	L	NGN	50000000	1	NG	1	Sterling Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.51.38.482575000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	HOMPIRE ENTERPRISE	01-JAN-70 12.00.00.000000000 AM	8034848044	FLAT 5 BLOCK B7                ZONE 1                         7TH STREET GAMES VILLAGE	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	25196934-0001	25196934-0001	02-JUN-22 12.00.00.000000000 AM	5635875.5	AAnpyKAACAAHwVIAAB
68335	2197554	278635	KANO MM WAY BRANCH	NIP Online   WEB APP  Dusa  Trf to Acces	SYSTEM	SYSTEM	0	A	24000000	\N	\N	L	NGN	24000000	1	NG	3	KANO MM WAY BRANCH	2197554	MMR GLOBAL VISION SYNERGY SERVICES L	\N	\N	\N	\N	\N	L	NGN	24000000	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.51.39.665450000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	MMR GLOBAL VISION SYNERGY SERVICES	01-JAN-70 12.00.00.000000000 AM	8035008688	GORON DUTSE ISYAKU RABIUSTREET KANO STATE                     KANO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	20167473-0001	20167473-0001	03-FEB-22 12.00.00.000000000 AM	38070838.59	AAnpyKAACAAHwXzAAA
68336	2090648	070211	SABON GARI BRANCH	NIP Online   WEB APP  Alh umar  Trf to Z	SYSTEM	SYSTEM	0	A	10000000	\N	\N	L	NGN	10000000	1	NG	11	SABON GARI BRANCH	2090648	ALKAZABRI POULTRY &amp, FARMS	\N	\N	\N	\N	\N	L	NGN	10000000	1	NG	11	Unity Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.51.40.825507000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	ALKAZABRI POULTRY &amp, FARMS	01-JAN-70 12.00.00.000000000 AM	8099999547	NO 7 GIDAN MALLAM RUFAI        WAPA                           KANO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	22751726-0001	22751726-0001	14-JAN-22 12.00.00.000000000 AM	11677061.74	AAnpyKAACAAHwX0AAA
68337	1036030001	307840	KANO MM WAY BRANCH	NIP FRM HAMZA YAKUBU TRADING COMPANY TUD	SYSTEM	SYSTEM	0	A	32150000	\N	\N	L	NGN	32150000	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	32150000	1	NG	3	FCMB	1976921	A M DEE GENERAL MERCHANTS	\N	\N	\N	OTHERS	30-AUG-22 04.51.52.059080000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	A M DEE GENERAL MERCHANTS	01-JAN-70 12.00.00.000000000 AM	8099992099	NO 8 FALALA SHOP               TITIN YANDOYA                  AMASCO BABAN LAYIN KURNA ASABE	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24952326-0001	24952326-0001	17-DEC-21 12.00.00.000000000 AM	35413790.62	AAnpyKAA7AAHcHCAAB
68338	1036030001	603458	KOFAR WAMBAI BRANCH	NIP FRM ABUBAKAR BELLO MOB To DEM BANKSA	SYSTEM	SYSTEM	0	A	7070000	\N	\N	L	NGN	7070000	1	NG	12	KOFAR WAMBAI BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	7070000	1	NG	12	StanbicIBTC Bank	2398629	SALISU HASSAN RABI GENERAL ENTERPRIS	\N	\N	\N	OTHERS	30-AUG-22 04.51.53.639081000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	SALISU HASSAN RABI GENERAL ENTERPRIS	01-JAN-70 12.00.00.000000000 AM	8023090872	NO 532 TANKO SHETTIMA          SHETTIMA HOUSE                 FAGGE LGA	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	21989494-0001	21989494-0001	08-MAR-22 12.00.00.000000000 AM	11513258.72	AAnpyKAA7AAHcJVAAA
68339	1036030001	307933	KANO MM WAY BRANCH	NIP FRM ABUBAKAR SHUAIBU web Shfi web Sh	SYSTEM	SYSTEM	0	A	7000000	\N	\N	L	NGN	7000000	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	7000000	1	NG	3	FCMB	729199	IBRAHIM YAU	\N	\N	\N	OTHERS	30-AUG-22 04.51.53.913905000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	M	MR	IBRAHIM	YAU	05-DEC-92 12.00.00.000000000 AM	7063500414	DUMI STREET                    WAPA                           WHITE HOUSE	KANO	KANO	90F5B53150524566740	13-OCT-20 12.00.00.000000000 AM	\N	\N	13-OCT-20 12.00.00.000000000 AM	3570476.65	AAnpyKAA7AAHcKEAAB
68340	1976921	278650	KANO MM WAY BRANCH	NIP Online   WEB APP  Ali sagiru  Trf to	SYSTEM	SYSTEM	0	A	9500000	\N	\N	L	NGN	9500000	1	NG	3	KANO MM WAY BRANCH	1976921	A M DEE GENERAL MERCHANTS	\N	\N	\N	\N	\N	L	NGN	9500000	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.51.55.219733000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	A M DEE GENERAL MERCHANTS	01-JAN-70 12.00.00.000000000 AM	8099992099	NO 8 FALALA SHOP               TITIN YANDOYA                  AMASCO BABAN LAYIN KURNA ASABE	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24952326-0001	24952326-0001	17-DEC-21 12.00.00.000000000 AM	35413790.62	AAnpyKAA7AAHcKNAAA
68341	59010	404111	HEAD OFFICE	NIP Online   WEB APP  Dan Hadeja  Trf to	SYSTEM	SYSTEM	0	A	10000000	\N	\N	L	NGN	10000000	1	NG	1	HEAD OFFICE	59010	BINAHMAD GLOBAL VENTURES	\N	\N	\N	\N	\N	L	NGN	10000000	1	NG	1	Sterling Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.51.55.549200000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	BINAHMAD GLOBAL VENTURES	01-JAN-70 12.00.00.000000000 AM	8033546689	SUITE 23                       MUSAWA HOUSE ZONE 4 PLAZA      CONSTANTINE STREET	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	225586520001	225586520001	02-MAR-20 12.00.00.000000000 AM	16234039.35	AAnpyKAA7AAHcKNAAC
68342	2270451	182074	ABUJA CORPORATE BRANCH	NIP Online   WEB APP  Ugochukwu  Trf to	SYSTEM	SYSTEM	0	A	6960000	\N	\N	L	NGN	6960000	1	NG	2	ABUJA CORPORATE BRANCH	2270451	SADIQ AND SHAMSU VENTURES	\N	\N	\N	\N	\N	L	NGN	6960000	1	NG	2	Keystone Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.51.56.569094000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	SADIQ AND SHAMSU VENTURES	01-JAN-70 12.00.00.000000000 AM	8106749724	02 CONSTANTINE STREET ZONE 4   WUSE PLOT 1278 ZONE 4 WUSE	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	25021852-0001	25021852-0001	15-FEB-22 12.00.00.000000000 AM	1195371.48	AAnpyKAA7AAHcKVAAA
68324	1036030001	307825	KANO MM WAY BRANCH	NIP FRM DAN BATTA MAKODA NIP	SYSTEM	SYSTEM	0	A	7000000	\N	\N	L	NGN	7000000	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	7000000	1	NG	3	FCMB	3147738	DAN--BATTA MAKODA MICROFINANCE BANK	\N	\N	\N	OTHERS	30-AUG-22 04.51.28.889344000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	DAN-BATTA MAKODA MICROFINANCE BANK	01-JAN-70 12.00.00.000000000 AM	8036360096	NO 7 KANO ROAD KOFAR YAMMA     DAMBATTA LGA KANO STATE        KANO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	05214824-0001	05214824-0001	30-JUN-22 12.00.00.000000000 AM	10188947.5	AAnpyKAACAAHwOZAAB
68325	1036030001	639960	HEAD OFFICE	NIP FRM 01240111200002873340 PWM INVESTM	SYSTEM	SYSTEM	0	A	10236712.32	\N	\N	L	NGN	10236712.32	1	NG	1	HEAD OFFICE	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	10236712.32	1	NG	1	Sterling Bank	2873340	MUTE SWAN CAPITAL LTD (OPERATIONS AC	\N	\N	\N	OTHERS	30-AUG-22 04.51.30.799092000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	MUTE SWAN CAPITAL LTD (OPS ACC)	01-JAN-70 12.00.00.000000000 AM	8065048847	NO 13                          MALABO STREET                  WUSE 2	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	21260193-0001..	21260193-0001..	02-JUN-22 12.00.00.000000000 AM	50423181.59	AAnpyKAACAAHwOsAAA
68326	1036030001	439124	ABUJA CORPORATE BRANCH	NIP FRM HANSHEP AGROALLIED LTD TRF IFO M	SYSTEM	SYSTEM	0	A	20000000	\N	\N	L	NGN	20000000	1	NG	2	ABUJA CORPORATE BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	20000000	1	NG	2	Keystone Bank	2064793	MOHA-NAS GLOBAL INVESTMENT LTD	\N	\N	\N	OTHERS	30-AUG-22 04.51.31.850578000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	MOHA-NAS GLOBAL INVESTMENT LTD	01-JAN-70 12.00.00.000000000 AM	8038699003	NO 61B LADI KWALI STREET WUSE  ZONE 4	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	21131719-0001	21131719-0001	10-JAN-22 12.00.00.000000000 AM	10791437.95	AAnpyKAACAAHwQfAAB
68327	148631	278631	KANO MM WAY BRANCH	NIP Online   WEB APP  Kumar  Trf to Acce	SYSTEM	SYSTEM	0	A	22000000	\N	\N	L	NGN	22000000	1	NG	3	KANO MM WAY BRANCH	148631	WARREN BRADSTREET ENTERPRISES	\N	\N	\N	\N	\N	L	NGN	22000000	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.51.32.298645000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	WARREN BRADSTREET ENTERPRISES	01-JAN-70 12.00.00.000000000 AM	8036365600	NO 9                           SAMBAJO STREET                 SANI MAINAGGE	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	2231298-0001	2231298-0001	22-JUN-20 12.00.00.000000000 AM	275484.9	AAnpyKAACAAHwROAAC
68346	3158206	274346	ABUJA CORPORATE BRANCH	NIP BO ISA ALHAJI HUSSENI IFO ISA ALHAJI	SYSTEM	SYSTEM	0	A	5000000	\N	\N	L	NGN	5000000	1	NG	2	ABUJA CORPORATE BRANCH	3158206	ISA ALHAJI HUSSENI	\N	\N	\N	\N	\N	L	NGN	5000000	1	NG	2	Keystone Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.52.00.291640000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	M	MR	ISA	HUSSENI	12-AUG-67 12.00.00.000000000 AM	8034946026	NO 26                          DEMSAWA WARD WUKARI STREET     JIMETA YOLA	KANO MUNICIPAL	KANO	A50447759	28-JUL-17 12.00.00.000000000 AM	\N	\N	19-JUL-22 12.00.00.000000000 AM	163968.75	AAnpyKAA7AAHcNPAAA
68347	150096	353949	HEAD OFFICE	NIP ifo  H MEDIX PHARMACY LTD NEW WHOLES	SYSTEM	SYSTEM	0	A	7377287.3	\N	\N	L	NGN	7377287.3	1	NG	1	HEAD OFFICE	150096	H-MEDIX PHARMACY LTD (FERMA 2)	\N	\N	\N	\N	\N	L	NGN	7377287.3	1	NG	1	Sterling Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.52.01.745247000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	H-MEDIX PHARMACY LTD (FERMA 2)	01-JAN-70 12.00.00.000000000 AM	8127422427	PLOT 17A                       AMINU KANO CRESCENT            WUSE 2	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	02427196-0001	02427196-0001	23-JUN-20 12.00.00.000000000 AM	6308527.89	AAnpyKAA7AAHcOAAAC
68348	3073037	278644	KANO MM WAY BRANCH	NIP Online   WEB APP  Mannir  Trf to FCM	SYSTEM	SYSTEM	0	A	7000000	\N	\N	L	NGN	7000000	1	NG	3	KANO MM WAY BRANCH	3073037	MANNIR AUWAL ABUBAKAR	\N	\N	\N	\N	\N	L	NGN	7000000	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.52.03.668355000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	M	MR	MANNIR	ABUBAKAR	21-JUN-79 12.00.00.000000000 AM	8036597896	NO 1                           LAYIN ADO BAYERO GATE 1        KOFAR DAWANU DANDISHE	DALA	KANO	29935365532	02-FEB-20 12.00.00.000000000 AM	\N	\N	01-JUL-22 12.00.00.000000000 AM	5352720.84	AAnpyKAA7AAHcOaAAB
68349	1036030001	307925	KANO MM WAY BRANCH	NIP FRM OREGON FOCUS ENTERPRISES COB TRF	SYSTEM	SYSTEM	0	A	12000000	\N	\N	L	NGN	12000000	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	12000000	1	NG	3	FCMB	1885241	AA ALIYU MUKHTAR ENTERPRISES	\N	\N	\N	OTHERS	30-AUG-22 04.52.14.677912000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	AA ALIYU MUKHTAR ENTERPRISES	01-JAN-70 12.00.00.000000000 AM	9069627743	NO 37B HAIJYA AMINA HOUSE     BEIRUT ROAD KANO               KANO STATE	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24289324-0001	24289324-0001	25-NOV-21 12.00.00.000000000 AM	1276.03	AAnpyKAA7AAHcOoAAB
68350	1036030001	670674	GOMBE BRANCH	NIP FRM TRANSAHEL MOTORS GOMBE IBR  TFR	SYSTEM	SYSTEM	0	A	5000000	\N	\N	L	NGN	5000000	1	NG	8	GOMBE BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	5000000	1	NG	8	POLARIS BANK	2496532	DALHA AMINU HARUNA	\N	\N	\N	OTHERS	30-AUG-22 04.52.15.956092000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	M	MR	DALHA	HARUNA	28-APR-73 12.00.00.000000000 AM	8033173417	GAMBOMI STREET                 NEAR NYSC STATE                SECRETARIAT BOLARI	GOMBE	GOMBE	A 12089687	24-SEP-21 12.00.00.000000000 AM	\N	\N	23-MAR-22 12.00.00.000000000 AM	13662669.98	AAnpyKAA7AAHcOoAAC
68351	1615497	494244	ABUJA CORPORATE BRANCH	NIP Mobile   Payment of goods	SYSTEM	SYSTEM	0	A	5000000	\N	\N	L	NGN	5000000	1	NG	2	ABUJA CORPORATE BRANCH	1615497	CHILARENE BUSINESS SERVICES	\N	\N	\N	\N	\N	L	NGN	5000000	1	NG	2	Keystone Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.52.16.932585000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	CHILARENE BUSINESS SERVICES	01-JAN-70 12.00.00.000000000 AM	9025437327	BLOCK 30                       SHOP R25                       GUDU MARKET	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24686248-0001	24686248-0001	26-AUG-21 12.00.00.000000000 AM	12505864.35	AAnpyKAA6AAHLAZAAC
68352	1036030001	307981	KANO MM WAY BRANCH	NIP FRM VIABLE COMMUNICATION LTD web Usm	SYSTEM	SYSTEM	0	A	9000000	\N	\N	L	NGN	9000000	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	9000000	1	NG	3	FCMB	1885241	AA ALIYU MUKHTAR ENTERPRISES	\N	\N	\N	OTHERS	30-AUG-22 04.52.18.061672000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	AA ALIYU MUKHTAR ENTERPRISES	01-JAN-70 12.00.00.000000000 AM	9069627743	NO 37B HAIJYA AMINA HOUSE     BEIRUT ROAD KANO               KANO STATE	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24289324-0001	24289324-0001	25-NOV-21 12.00.00.000000000 AM	1276.03	AAnpyKAA6AAHLDHAAB
68307	2239652	073848	KOFAR WAMBAI BRANCH	NIP Online   WEB APP  Bills  Trf to Acce	SYSTEM	SYSTEM	0	A	30000000	\N	\N	L	NGN	30000000	1	NG	12	KOFAR WAMBAI BRANCH	2239652	OFFICIAL BAAYE ENTERPRISES	\N	\N	\N	\N	\N	L	NGN	30000000	1	NG	12	StanbicIBTC Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.51.07.224430000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	OFFICIAL BAAYE ENTERPRISES	01-JAN-70 12.00.00.000000000 AM	8037980254	NO. 63 EL-DUNIYA SHOPPING      COMPLEX IBRAHIM TAIWO ROAD     FAGGE LGA	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24852412-0001	24852412-0001	10-FEB-22 12.00.00.000000000 AM	57427540.75	AAnpyKAAIAAHwTbAAC
68308	3215224	054223	YOLA BRANCH	JUADS TECHNOLOGIST LIMITED	SYSTEM	SYSTEM	0	A	5000000	\N	\N	L	NGN	5000000	0	NG	2	YOLA BRANCH	3215224	JUADS TECHNOLOGIST LIMITED	\N	\N	\N	\N	\N	L	NGN	5000000	0	NG	\N	Others	\N	\N	\N	\N	\N	LOCAL WITHDRAWAL	30-AUG-22 04.51.08.791548000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	JUADS TECHNOLOGIST LIMITED	01-JAN-70 12.00.00.000000000 AM	8062432801	NO 5                           IYAMOYE CLOSE                  AREA 11 GARKI	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	17797089-0001	17797089-0001	29-JUL-22 12.00.00.000000000 AM	5999497.5	AAnpyKAAIAAHwUwAAA
68309	3215224	054226	ABUJA CORPORATE BRANCH	\N	SYSTEM	SYSTEM	0	A	10000000	\N	\N	L	NGN	10000000	0	NG	2	ABUJA CORPORATE BRANCH	3215224	JUADS TECHNOLOGIST LIMITED	\N	\N	\N	\N	\N	L	NGN	10000000	0	NG	\N	Others	\N	\N	\N	\N	\N	LOCAL WITHDRAWAL	30-AUG-22 04.51.10.580626000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	JUADS TECHNOLOGIST LIMITED	01-JAN-70 12.00.00.000000000 AM	8062432801	NO 5                           IYAMOYE CLOSE                  AREA 11 GARKI	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	17797089-0001	17797089-0001	29-JUL-22 12.00.00.000000000 AM	5999497.5	AAnpyKAAIAAHwUwAAB
68310	3215224	054225	YOLA BRANCH	JUADS TECHNOLOGIST LIMITED	SYSTEM	SYSTEM	0	A	10000000	\N	\N	L	NGN	10000000	0	NG	2	YOLA BRANCH	3215224	JUADS TECHNOLOGIST LIMITED	\N	\N	\N	\N	\N	L	NGN	10000000	0	NG	\N	Others	\N	\N	\N	\N	\N	LOCAL WITHDRAWAL	30-AUG-22 04.51.12.163899000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	JUADS TECHNOLOGIST LIMITED	01-JAN-70 12.00.00.000000000 AM	8062432801	NO 5                           IYAMOYE CLOSE                  AREA 11 GARKI	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	17797089-0001	17797089-0001	29-JUL-22 12.00.00.000000000 AM	5999497.5	AAnpyKAAIAAHwUwAAC
68311	1030080005	072646	KANO MM WAY BRANCH	CIBS/BOKO AGRO ALLIED NIG LTD	SYSTEM	SYSTEM	0	A	20000000	\N	\N	L	NGN	20000000	1	NG	1	KANO MM WAY BRANCH	1030080005	NAPS CBN SETTLEMENT ACCOUNT	\N	\N	\N	\N	\N	L	NGN	20000000	1	NG	3	FCMB	1389529	BOKO AGRO ALLIED NIG LTD	\N	\N	\N	OTHERS	30-AUG-22 04.51.12.833216000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	BOKO AGRO ALLIED NIG LTD	01-JAN-70 12.00.00.000000000 AM	8032173656	SHARADA STREET OFF             ZOO ROAD                       KANO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	23719855-0001	23719855-0001	02-JUN-21 12.00.00.000000000 AM	31309108.66	AAnpyKAAIAAHwVtAAA
68312	148631	073847	KOFAR WAMBAI BRANCH	WEB APP  Kumar  Trf to DEM BANK OFFICIAL	SYSTEM	SYSTEM	0	A	80000000	\N	\N	L	NGN	80000000	1	NG	3	KOFAR WAMBAI BRANCH	148631	WARREN BRADSTREET ENTERPRISES	\N	\N	\N	\N	\N	L	NGN	80000000	1	NG	12	StanbicIBTC Bank	2239652	OFFICIAL BAAYE ENTERPRISES	\N	\N	\N	OTHERS	30-AUG-22 04.51.13.995218000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	OFFICIAL BAAYE ENTERPRISES	01-JAN-70 12.00.00.000000000 AM	8037980254	NO. 63 EL-DUNIYA SHOPPING      COMPLEX IBRAHIM TAIWO ROAD     FAGGE LGA	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24852412-0001	24852412-0001	10-FEB-22 12.00.00.000000000 AM	57427540.75	AAnpyKAAIAAHwXbAAA
68313	148631	278617	KANO MM WAY BRANCH	WEB APP  Kumar  Trf to DEM BANK OFFICIAL	SYSTEM	SYSTEM	0	A	80000000	\N	\N	L	NGN	80000000	1	NG	3	KANO MM WAY BRANCH	148631	WARREN BRADSTREET ENTERPRISES	\N	\N	\N	\N	\N	L	NGN	80000000	1	NG	12	StanbicIBTC Bank	2239652	OFFICIAL BAAYE ENTERPRISES	\N	\N	\N	OTHERS	30-AUG-22 04.51.14.524803000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	WARREN BRADSTREET ENTERPRISES	01-JAN-70 12.00.00.000000000 AM	8036365600	NO 9                           SAMBAJO STREET                 SANI MAINAGGE	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	2231298-0001	2231298-0001	22-JUN-20 12.00.00.000000000 AM	275484.9	AAnpyKAAIAAHwXbAAB
68314	1036030001	639995	HEAD OFFICE	NIP FRM MAHMUD AND COMPANY TRF FRM MAHMU	SYSTEM	SYSTEM	0	A	8000000	\N	\N	L	NGN	8000000	1	NG	1	HEAD OFFICE	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	8000000	1	NG	1	Sterling Bank	2925373	MAHMUD AND COMPANY	\N	\N	\N	OTHERS	30-AUG-22 04.51.16.073032000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	MAHMUD AND COMPANY	01-JAN-70 12.00.00.000000000 AM	8033117197	NO 9                           BOUZOUN CLOSE OFF ADETOKUNBO   ADEMOLA BEHD AP PLAZA	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	18880878-0001	18880878-0001	10-JUN-22 12.00.00.000000000 AM	5827343.24	AAnpyKAACAAHwIQAAC
68315	2974735	353764	HEAD OFFICE	Kk   LOCAL TRANSFER	SYSTEM	SYSTEM	0	A	17167000	\N	\N	L	NGN	17167000	1	NG	11	HEAD OFFICE	2974735	DIDAT GENERAL ENTERPRISES	\N	\N	\N	\N	\N	L	NGN	17167000	1	NG	1	Sterling Bank	1641658	DARA BROTHERS ENTERPRISES	\N	\N	\N	OTHERS	30-AUG-22 04.51.16.868560000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	DARA BROTHERS ENTERPRISES	01-JAN-70 12.00.00.000000000 AM	8066951877	RIGHT WING 1ST FLOOR           NO. 50 EBITU EKIWE STR         JABI	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	33688097-0001	33688097-0001	06-SEP-21 12.00.00.000000000 AM	23262933.14	AAnpyKAACAAHwJzAAB
68316	2974735	099355	SABON GARI BRANCH	Kk   LOCAL TRANSFER	SYSTEM	SYSTEM	0	A	17167000	\N	\N	L	NGN	17167000	1	NG	11	SABON GARI BRANCH	2974735	DIDAT GENERAL ENTERPRISES	\N	\N	\N	\N	\N	L	NGN	17167000	1	NG	1	Sterling Bank	1641658	DARA BROTHERS ENTERPRISES	\N	\N	\N	OTHERS	30-AUG-22 04.51.18.384088000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	CORPORATE	\N	DIDAT GENERAL ENTERPRISES	01-JAN-70 12.00.00.000000000 AM	7039204159	N0 34 GANDU GRA SHARAD PH 1    SHARADA PHRASE 1 QRTS          KMC	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	25223908-0001	25223908-0001	16-JUN-22 12.00.00.000000000 AM	13994024.27	AAnpyKAACAAHwJzAAC
68317	1036030001	307732	KANO MM WAY BRANCH	NIP FRM INTERGLOBAL SERVICES NIP	SYSTEM	SYSTEM	0	A	24000000	\N	\N	L	NGN	24000000	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	24000000	1	NG	3	FCMB	2197554	MMR GLOBAL VISION SYNERGY SERVICES L	\N	\N	\N	OTHERS	30-AUG-22 04.51.19.517350000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	MMR GLOBAL VISION SYNERGY SERVICES	01-JAN-70 12.00.00.000000000 AM	8035008688	GORON DUTSE ISYAKU RABIUSTREET KANO STATE                     KANO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	20167473-0001	20167473-0001	03-FEB-22 12.00.00.000000000 AM	38070838.59	AAnpyKAACAAHwJ4AAB
68318	2069554	118628	KOFAR WAMBAI BRANCH	NIP TRF BO  DANDA&#039,U GLOBAL CONCEPT LIMIT	SYSTEM	SYSTEM	0	A	7730000	\N	\N	L	NGN	7730000	1	NG	12	KOFAR WAMBAI BRANCH	2069554	DANDA&#039,U GLOBAL CONCEPT LIMITED	\N	\N	\N	\N	\N	L	NGN	7730000	1	NG	12	StanbicIBTC Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.51.20.697349000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	CORPORATE	\N	DANDA&#039,U GLOBAL CONCEPT LIMITED	01-JAN-70 12.00.00.000000000 AM	8036858175	NO 46 HOTORO QUARTERS          HOTORO                         NASSARAWA LGA	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	09689733-0001	09689733-0001	11-JAN-22 12.00.00.000000000 AM	43433037.99	AAnpyKAACAAHwKoAAB
68319	2069554	072651	HOTORO BRANCH	TRF BO DANDA&#039,U/YUSUF DA,U ALI	SYSTEM	SYSTEM	0	A	9440000	\N	\N	L	NGN	9440000	1	NG	12	HOTORO BRANCH	2069554	DANDA&#039,U GLOBAL CONCEPT LIMITED	\N	\N	\N	\N	\N	L	NGN	9440000	1	NG	13	GTBank Plc	3116390	YUSUF DAU ALIYU	\N	\N	\N	OTHERS	30-AUG-22 04.51.22.464390000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	M	MR	YUSUF	ALIYU	30-MAR-69 12.00.00.000000000 AM	8023248246	NO 46                          HOTORO                         DAN MARKE	BIRNIN KUDU	JIGAWA	A10348197	28-MAR-19 12.00.00.000000000 AM	\N	\N	08-JUL-22 12.00.00.000000000 AM	14189074.37	AAnpyKAACAAHwK/AAB
68320	2064793	182058	ABUJA CORPORATE BRANCH	NIP Online   WEB APP  Baba Umaru  Trf to	SYSTEM	SYSTEM	0	A	13860000	\N	\N	L	NGN	13860000	1	NG	2	ABUJA CORPORATE BRANCH	2064793	MOHA-NAS GLOBAL INVESTMENT LTD	\N	\N	\N	\N	\N	L	NGN	13860000	1	NG	2	Keystone Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.51.23.421189000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	MOHA-NAS GLOBAL INVESTMENT LTD	01-JAN-70 12.00.00.000000000 AM	8038699003	NO 61B LADI KWALI STREET WUSE  ZONE 4	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	21131719-0001	21131719-0001	10-JAN-22 12.00.00.000000000 AM	10791437.95	AAnpyKAACAAHwL3AAB
68321	1036030001	455682	SABON GARI BRANCH	NIP FRM AA NIYAAH GENERAL ENTERPRISE web	SYSTEM	SYSTEM	0	A	6000000	\N	\N	L	NGN	6000000	1	NG	11	SABON GARI BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	6000000	1	NG	11	Unity Bank	2775932	R.Y.M AGRO ALLIED NIG	\N	\N	\N	OTHERS	30-AUG-22 04.51.24.836615000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	CORPORATE	\N	R.Y.M AGRO ALLIED NIG	01-JAN-70 12.00.00.000000000 AM	8108762000	N0 25/26                       KOFAR WAMBAI                   FAGGE	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	1063655441	1063655441	13-MAY-22 12.00.00.000000000 AM	6451385.97	AAnpyKAACAAHwMSAAB
68322	1036030001	037717	KADUNA MAIN BRANCH	NIP FRM MOHAMMED ABDULKADIR BTI424637974	SYSTEM	SYSTEM	0	A	6000000	\N	\N	L	NGN	6000000	1	NG	7	KADUNA MAIN BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	6000000	1	NG	7	Fidelity Bank	1917665	ABDULQADIR MUHAMMAD JIKA	\N	\N	\N	OTHERS	30-AUG-22 04.51.25.828788000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	M	MR	ABDULQADIR	JIKA	18-APR-68 12.00.00.000000000 AM	8036426406	NO 1                           AHMED MAKARFI                  KADUNA	GOMBE	GOMBE	A50342384	20-JAN-17 12.00.00.000000000 AM	\N	\N	06-DEC-21 12.00.00.000000000 AM	4420416.65	AAnpyKAACAAHwMiAAB
68323	2610839	069617	KURNA ASABE BRANCH	NIP Online   WEB APP  Balance  Trf to FC	SYSTEM	SYSTEM	0	A	15600000	\N	\N	L	NGN	15600000	1	NG	14	KURNA ASABE BRANCH	2610839	ABDULLAHI DANYARO IBRAHIM	\N	\N	\N	\N	\N	L	NGN	15600000	1	NG	14	Access Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.51.27.229914000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	22444317977	M	ALH	ABDULLAHI	IBRAHIM	21-OCT-93 12.00.00.000000000 AM	8033920280	NO 610                         KATSINA ROAD                   TUDUN BOJUWA	DALA	KANO	BCH03360AA44	15-NOV-17 12.00.00.000000000 AM	\N	\N	11-APR-22 12.00.00.000000000 AM	20801692.46	AAnpyKAACAAHwOUAAB
68353	1036030001	307996	KANO MM WAY BRANCH	NIP FRM VIABLE COMMUNICATION LTD web Usm	SYSTEM	SYSTEM	0	A	8475000	\N	\N	L	NGN	8475000	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	8475000	1	NG	3	FCMB	1885241	AA ALIYU MUKHTAR ENTERPRISES	\N	\N	\N	OTHERS	30-AUG-22 04.52.18.979009000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	AA ALIYU MUKHTAR ENTERPRISES	01-JAN-70 12.00.00.000000000 AM	9069627743	NO 37B HAIJYA AMINA HOUSE     BEIRUT ROAD KANO               KANO STATE	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24289324-0001	24289324-0001	25-NOV-21 12.00.00.000000000 AM	1276.03	AAnpyKAA6AAHLEdAAB
68354	1036030001	307948	KANO MM WAY BRANCH	NIP FRM VIABLE COMMUNICATION LTD web Usm	SYSTEM	SYSTEM	0	A	10000000	\N	\N	L	NGN	10000000	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	10000000	1	NG	3	FCMB	1885241	AA ALIYU MUKHTAR ENTERPRISES	\N	\N	\N	OTHERS	30-AUG-22 04.52.19.896640000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	AA ALIYU MUKHTAR ENTERPRISES	01-JAN-70 12.00.00.000000000 AM	9069627743	NO 37B HAIJYA AMINA HOUSE     BEIRUT ROAD KANO               KANO STATE	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24289324-0001	24289324-0001	25-NOV-21 12.00.00.000000000 AM	1276.03	AAnpyKAA6AAHLEpAAB
68291	2974735	392132	KANO MM WAY BRANCH	Kk   LOCAL TRANSFER	SYSTEM	SYSTEM	0	A	8718000	\N	\N	L	NGN	8718000	1	NG	11	KANO MM WAY BRANCH	2974735	DIDAT GENERAL ENTERPRISES	\N	\N	\N	\N	\N	L	NGN	8718000	1	NG	3	FCMB	655560	LEGACY GENERAL CONTRACT &amp, SUPPLY LTD	\N	\N	\N	OTHERS	30-AUG-22 04.50.25.558853000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	LEGACY GENERAL CONTRACT &amp, SUPPLY LTD	01-JAN-70 12.00.00.000000000 AM	8035665738	NO 10 GWANGWAZO QTRS           NO 1872E ZARIA RD              KANO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	1050211539-0001	1050211539-0001	30-SEP-20 12.00.00.000000000 AM	8718427.5	AAnpyKAAKAAHD/2AAA
68292	2974735	099347	SABON GARI BRANCH	Kk   LOCAL TRANSFER	SYSTEM	SYSTEM	0	A	8718000	\N	\N	L	NGN	8718000	1	NG	11	SABON GARI BRANCH	2974735	DIDAT GENERAL ENTERPRISES	\N	\N	\N	\N	\N	L	NGN	8718000	1	NG	3	FCMB	655560	LEGACY GENERAL CONTRACT &amp, SUPPLY LTD	\N	\N	\N	OTHERS	30-AUG-22 04.50.27.326523000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	CORPORATE	\N	DIDAT GENERAL ENTERPRISES	01-JAN-70 12.00.00.000000000 AM	7039204159	N0 34 GANDU GRA SHARAD PH 1    SHARADA PHRASE 1 QRTS          KMC	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	25223908-0001	25223908-0001	16-JUN-22 12.00.00.000000000 AM	13994024.27	AAnpyKAAKAAHD/2AAB
68293	1036030001	439005	ABUJA CORPORATE BRANCH	NIP FRM IFEANYI CHIWEUBA UZOKWE106DIAM T	SYSTEM	SYSTEM	0	A	8000000	\N	\N	L	NGN	8000000	1	NG	2	ABUJA CORPORATE BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	8000000	1	NG	2	Keystone Bank	3046927	LODCH HOMES INVESTMENT LTD	\N	\N	\N	OTHERS	30-AUG-22 04.50.28.560059000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	LODCH HOMES INVESTMENT LTD	01-JAN-70 12.00.00.000000000 AM	8055132062	SUITE 63 JAM NAB PLAZA GARKI   2 ABUJA FCT                    BRAND ROAD UND ST. ADO FCT EAS	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	23928899-0001	23928899-0001	27-JUN-22 12.00.00.000000000 AM	18018883.75	AAnpyKAAKAAHD/2AAC
68294	2974735	392136	KANO MM WAY BRANCH	Kk   LOCAL TRANSFER	SYSTEM	SYSTEM	0	A	8718000	\N	\N	L	NGN	8718000	1	NG	11	KANO MM WAY BRANCH	2974735	DIDAT GENERAL ENTERPRISES	\N	\N	\N	\N	\N	L	NGN	8718000	1	NG	3	FCMB	2307416	IDRIS AND BROTHERS FASHION AND DESIG	\N	\N	\N	OTHERS	30-AUG-22 04.50.29.827591000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	IDRIS AND BROTHERS FASHION AND DESIG	01-JAN-70 12.00.00.000000000 AM	7031124888	1523                           GWAMMAJA HOUSING ESTATE        KANO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	1058353895	1058353895	22-FEB-22 12.00.00.000000000 AM	8717983.32	AAnpyKAAJAAHwCJAAA
\.


--
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.department (id, name, email, created_at, updated_at) FROM stdin;
45	FINANCIAL CONTROL	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
55	RISK MANAGEMENT	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
72	FOREIGN OPERATIONS	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
42	DOMESTIC OPERATIONS	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
43	BUSINESS BANKING	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
46	INTERNAL AUDIT	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
48	FINANCIAL CONTROL	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
53	PUBLIC SECTOR	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
51	RETAIL BANKING	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
54	INFORMATION SECURITY	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
56	SHARIAH AUDIT	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
58	SHARIAH DEPARTMENT	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
59	TRANSFORMATION	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
62	CONTACT CENTER	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
63	MD'S\\ DIRECTORATE	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
66	E-BUSINESS	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
67	MARKETING	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
68	PRIVATE BANKING	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
69	OPERATIONS-NASS	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
71	CUSTOMER SERVICE	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
74	OPERATIONS-KANO	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
77	HUMAN RESOURCES	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
78	CORPORATE SERVICES	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
95	TREASURY	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
94	INFORMATION TECHNONOLOGY	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
92	DEVELOPMENT FINANCE	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
91	OPERATIONS-LAGOS	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
89	Head office	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
87	LEGAL	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
104	BUISNESS BANKING GROUP	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
102	AGRIC BUSINESS	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
101	BUSINESS DEVELOPMENT	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
100	CORPORATE TREASURY	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
99	INTERNATIONAL OPERATIONS	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
98	E-BANKING OPERATIONS	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
97	ED BUSINESS DEVELOPMENT, DIRECTORATE	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
96	TREASURY OPERATIONS	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
105	MARKETING COMMUNICATIONS	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
107	TAJMALL	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
44	COMPLIANCE	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
60	APPLICATION DEVELOPMENT	appdev@gmail.com	2023-08-28 10:46:57	2023-08-28 10:46:57
1	INTERNAL CONTROL	internal.c@mail.com	2023-08-28 10:46:57	2023-08-28 10:46:57
40	OPERATIONS	operations@mail.com	2023-08-28 10:46:57	2023-08-28 10:46:57
2	test name	test@gmail.com	2023-08-23 16:49:12	2023-08-23 16:49:12
3	personal control	controller@gmail.org	2023-08-23 16:49:12	2023-08-23 16:49:12
4	Harry kane	hk@mail.com	2023-08-23 16:49:12	2023-08-23 16:49:12
5	Martin Odegaard	mo@gmail.com	2023-08-23 16:49:12	2023-08-23 16:49:12
6	||:p_name||	||:p_mail||	2023-08-23 16:49:12	2023-08-23 16:49:12
7	fret frat	ff@mail.com	2023-08-23 16:49:12	2023-08-23 16:49:12
8	p_name	p_email	2023-08-23 16:49:12	2023-08-23 16:49:12
9	:p_name	:p_email	2023-08-23 16:49:12	2023-08-23 16:49:12
10	||p_name||	||p_email||	2023-08-23 16:49:12	2023-08-23 16:49:12
11	petty grace	pg@mail.com	2023-08-23 16:49:12	2023-08-23 16:49:12
12	:pname	:pemail	2023-08-23 16:49:12	2023-08-23 16:49:12
13	jaden charles	jaden@gmail.com	2023-08-23 16:49:12	2023-08-23 16:49:12
50	information and security	\N	2023-08-28 10:46:57	2023-08-28 10:46:57
\.


--
-- Data for Name: download_notifier; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.download_notifier (id, temp_dir, ip_address, download_status, file_size, created_at) FROM stdin;
1	tempdir_6563c3487cf23	127.0.0.1	complete	15087	2023-11-26 23:14:33
2	tempdir_6563c3dd445bd	127.0.0.1	complete	15087	2023-11-26 23:17:02
3	tempdir_6563c430a35f9	127.0.0.1	complete	15087	2023-11-26 23:18:25
4	tempdir_6563c46023dff	127.0.0.1	complete	15087	2023-11-26 23:19:13
5	tempdir_6563c4cab6bd6	127.0.0.1	complete	15087	2023-11-26 23:20:59
6	tempdir_6563c6bb0449a	127.0.0.1	complete	15087	2023-11-26 23:29:18
7	tempdir_6563c746203ea	127.0.0.1	complete	15087	2023-11-26 23:31:38
8	tempdir_6563c8116086f	127.0.0.1	complete	15087	2023-11-26 23:35:03
9	tempdir_656491e5f1957	127.0.0.1	complete	15087	2023-11-27 13:56:21
10	tempdir_656492631c48d	127.0.0.1	complete	15087	2023-11-27 13:58:16
11	tempdir_656492d9babab	127.0.0.1	complete	15087	2023-11-27 14:00:15
12	tempdir_65649303cb081	127.0.0.1	complete	15087	2023-11-27 14:00:55
13	tempdir_6564b8cf459af	127.0.0.1	complete	15087	2023-11-27 16:42:11
14	tempdir_6564b8d74ffb5	127.0.0.1	complete	15087	2023-11-27 16:42:18
15	tempdir_6564b8de2d911	127.0.0.1	complete	15087	2023-11-27 16:42:25
16	tempdir_6564b8e45fb31	127.0.0.1	complete	15087	2023-11-27 16:42:31
17	tempdir_6564b8eae0789	127.0.0.1	complete	15087	2023-11-27 16:42:37
18	tempdir_6564bc35029b6	127.0.0.1	complete	15087	2023-11-27 16:56:39
19	tempdir_6564bc3b232fb	127.0.0.1	complete	15087	2023-11-27 16:56:46
20	tempdir_6564bc412a711	127.0.0.1	complete	15087	2023-11-27 16:56:52
21	tempdir_6564bc4768645	127.0.0.1	complete	15087	2023-11-27 16:56:58
22	tempdir_6564bc4d8008e	127.0.0.1	complete	15087	2023-11-27 16:57:04
23	tempdir_6565e1d530d99	127.0.0.1	complete	15087	2023-11-28 13:49:28
24	tempdir_6565e1de14ef1	127.0.0.1	complete	15087	2023-11-28 13:49:38
25	tempdir_6565e1e73d62e	127.0.0.1	complete	15087	2023-11-28 13:50:17
26	tempdir_6565e1eccd73a	127.0.0.1	complete	15087	2023-11-28 13:50:20
27	tempdir_6565e1f345f13	127.0.0.1	complete	15087	2023-11-28 13:50:24
28	tempdir_6565e1f893b95	127.0.0.1	complete	15087	2023-11-28 13:50:27
29	tempdir_6565e1fece5c4	127.0.0.1	complete	15087	2023-11-28 13:50:30
30	tempdir_6565e204dbacc	127.0.0.1	complete	15087	2023-11-28 13:50:33
31	tempdir_6565e40785b1d	127.0.0.1	complete	15087	2023-11-28 13:58:52
32	tempdir_6565e47d7fa71	127.0.0.1	complete	15087	2023-11-28 14:00:52
33	tempdir_6565e537dc243	127.0.0.1	complete	15087	2023-11-28 14:03:56
34	tempdir_6565e5c47710c	127.0.0.1	complete	15087	2023-11-28 14:06:17
35	tempdir_6565e637aac6a	127.0.0.1	complete	15087	2023-11-28 14:08:12
36	tempdir_6565e69d69b29	127.0.0.1	complete	15087	2023-11-28 14:09:53
37	tempdir_6565e6f0b1340	127.0.0.1	complete	15087	2023-11-28 14:11:17
38	tempdir_6565e72426a37	127.0.0.1	complete	15087	2023-11-28 14:12:08
39	tempdir_6565e7b3f21b0	127.0.0.1	complete	15087	2023-11-28 14:14:32
\.


--
-- Data for Name: download_queue; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.download_queue (id, user_id, ip_address, file_name, file_size, temp_directory, query_string, download_status, downloaded_at, created_at) FROM stdin;
1	\N	127.0.0.1	exported_data.csv	12044	tempdir_6563b468cf339	select * from cases	pending	\N	2023-11-26 22:11:04
2	\N	127.0.0.1	exported_data.csv	2497	tempdir_6563b496e21f9	select * from team	pending	\N	2023-11-26 22:11:50
3	\N	127.0.0.1	exported_data.csv	2497	tempdir_6563b50bd38f2	select * from team	pending	\N	2023-11-26 22:13:47
4	\N	127.0.0.1	exported_data.csv	15087	tempdir_6563b5183e857	select * from report	pending	\N	2023-11-26 22:14:00
5	\N	127.0.0.1	exported_data.csv	15087	tempdir_6563c746203ea	select * from report	pending	\N	2023-11-26 23:31:34
6	\N	127.0.0.1	exported_data.csv	15087	tempdir_6563c8116086f	select * from report	pending	\N	2023-11-26 23:34:57
7	\N	127.0.0.1	exported_data.csv	15087	tempdir_6564915cc93a6	select * from report	pending	\N	2023-11-27 13:53:48
8	\N	127.0.0.1	exported_data.csv	15087	tempdir_656491bac8e53	select * from report	pending	\N	2023-11-27 13:55:22
9	\N	127.0.0.1	exported_data.csv	15087	tempdir_656491e5f1957	select * from report	pending	\N	2023-11-27 13:56:05
10	\N	127.0.0.1	exported_data.csv	15087	tempdir_656492631c48d	select * from report	pending	\N	2023-11-27 13:58:11
11	\N	127.0.0.1	exported_data.csv	15087	tempdir_656492d9babab	select * from report	pending	\N	2023-11-27 14:00:09
12	\N	127.0.0.1	exported_data.csv	15087	tempdir_65649303cb081	select * from report	pending	\N	2023-11-27 14:00:51
13	\N	127.0.0.1	exported_data.csv	12044	tempdir_6564b27790aa9	select * from cases	pending	\N	2023-11-27 16:15:03
14	\N	127.0.0.1	exported_data.csv	12044	tempdir_6564b27e0146a	select * from cases	pending	\N	2023-11-27 16:15:10
15	\N	127.0.0.1	exported_data.csv	12044	tempdir_6564b282aa33e	select * from cases	pending	\N	2023-11-27 16:15:14
16	\N	127.0.0.1	exported_data.csv	12044	tempdir_6564b28727b1a	select * from cases	pending	\N	2023-11-27 16:15:19
17	\N	127.0.0.1	exported_data.csv	12044	tempdir_6564b28b7f527	select * from cases	pending	\N	2023-11-27 16:15:23
18	\N	127.0.0.1	exported_data.csv	2497	tempdir_6564b7cbc5ffc	select * from team	pending	\N	2023-11-27 16:37:47
19	\N	127.0.0.1	exported_data.csv	2497	tempdir_6564b7dae7653	select * from team	pending	\N	2023-11-27 16:38:02
20	\N	127.0.0.1	exported_data.csv	2497	tempdir_6564b7dfe18bb	select * from team	pending	\N	2023-11-27 16:38:07
21	\N	127.0.0.1	exported_data.csv	2497	tempdir_6564b7e43a285	select * from team	pending	\N	2023-11-27 16:38:12
22	\N	127.0.0.1	exported_data.csv	2497	tempdir_6564b7e8b0fbd	select * from team	pending	\N	2023-11-27 16:38:16
23	\N	127.0.0.1	exported_data.csv	2497	tempdir_6564b80f1e2de	select * from team	pending	\N	2023-11-27 16:38:55
24	\N	127.0.0.1	exported_data.csv	2497	tempdir_6564b87e8a655	select * from team	pending	\N	2023-11-27 16:40:46
25	\N	127.0.0.1	exported_data.csv	2497	tempdir_6564b885a1e47	select * from team	pending	\N	2023-11-27 16:40:53
26	\N	127.0.0.1	exported_data.csv	2497	tempdir_6564b88ee7982	select * from team	pending	\N	2023-11-27 16:41:02
27	\N	127.0.0.1	exported_data.csv	2497	tempdir_6564b89379fb6	select * from team	pending	\N	2023-11-27 16:41:07
28	\N	127.0.0.1	exported_data.csv	2497	tempdir_6564b897c6233	select * from team	pending	\N	2023-11-27 16:41:11
29	\N	127.0.0.1	exported_data.csv	15087	tempdir_6564b8cf459af	select * from report	pending	\N	2023-11-27 16:42:07
30	\N	127.0.0.1	exported_data.csv	15087	tempdir_6564b8d74ffb5	select * from report	pending	\N	2023-11-27 16:42:15
31	\N	127.0.0.1	exported_data.csv	15087	tempdir_6564b8de2d911	select * from report	pending	\N	2023-11-27 16:42:22
32	\N	127.0.0.1	exported_data.csv	15087	tempdir_6564b8e45fb31	select * from report	pending	\N	2023-11-27 16:42:28
33	\N	127.0.0.1	exported_data.csv	15087	tempdir_6564b8eae0789	select * from report	pending	\N	2023-11-27 16:42:34
34	\N	127.0.0.1	exported_data.csv	2497	tempdir_6564bb1c99d80	select * from team	pending	\N	2023-11-27 16:51:56
35	\N	127.0.0.1	exported_data.csv	2497	tempdir_6564bb215e2ab	select * from team	pending	\N	2023-11-27 16:52:01
36	\N	127.0.0.1	exported_data.csv	2497	tempdir_6564bb26aa8a5	select * from team	pending	\N	2023-11-27 16:52:06
37	\N	127.0.0.1	exported_data.csv	2497	tempdir_6564bb2b5b659	select * from team	pending	\N	2023-11-27 16:52:11
38	\N	127.0.0.1	exported_data.csv	2497	tempdir_6564bb2f8aee3	select * from team	pending	\N	2023-11-27 16:52:15
39	\N	127.0.0.1	exported_data.csv	2497	tempdir_6564bb8001607	select * from team	pending	\N	2023-11-27 16:53:36
40	\N	127.0.0.1	exported_data.csv	2497	tempdir_6564bb84c0172	select * from team	pending	\N	2023-11-27 16:53:40
41	\N	127.0.0.1	exported_data.csv	2497	tempdir_6564bb88dd60a	select * from team	pending	\N	2023-11-27 16:53:44
42	\N	127.0.0.1	exported_data.csv	2497	tempdir_6564bb8d0eacf	select * from team	pending	\N	2023-11-27 16:53:49
43	\N	127.0.0.1	exported_data.csv	2497	tempdir_6564bb9120b54	select * from team	pending	\N	2023-11-27 16:53:53
44	\N	127.0.0.1	exported_data.csv	15087	tempdir_6564bc35029b6	select * from report	pending	\N	2023-11-27 16:56:37
45	\N	127.0.0.1	exported_data.csv	15087	tempdir_6564bc3b232fb	select * from report	pending	\N	2023-11-27 16:56:43
46	\N	127.0.0.1	exported_data.csv	15087	tempdir_6564bc412a711	select * from report	pending	\N	2023-11-27 16:56:49
47	\N	127.0.0.1	exported_data.csv	15087	tempdir_6564bc4768645	select * from report	pending	\N	2023-11-27 16:56:55
48	\N	127.0.0.1	exported_data.csv	15087	tempdir_6564bc4d8008e	select * from report	pending	\N	2023-11-27 16:57:01
49	\N	127.0.0.1	exported_data.csv	12044	tempdir_6565e19f68516	select * from cases	pending	\N	2023-11-28 13:48:31
50	\N	127.0.0.1	exported_data.csv	12044	tempdir_6565e1a765a65	select * from cases	pending	\N	2023-11-28 13:48:39
51	\N	127.0.0.1	exported_data.csv	15087	tempdir_6565e1ae3f24b	select * from report	pending	\N	2023-11-28 13:48:46
52	\N	127.0.0.1	exported_data.csv	2497	tempdir_6565e1b3933da	select * from team	pending	\N	2023-11-28 13:48:51
53	\N	127.0.0.1	exported_data.csv	2497	tempdir_6565e1b90fe50	select * from team	pending	\N	2023-11-28 13:48:57
54	\N	127.0.0.1	exported_data.csv	12044	tempdir_6565e1c08ddd8	select * from cases	pending	\N	2023-11-28 13:49:04
55	\N	127.0.0.1	exported_data.csv	12044	tempdir_6565e1c633f0a	select * from cases	pending	\N	2023-11-28 13:49:10
56	\N	127.0.0.1	exported_data.csv	15087	tempdir_6565e1d530d99	select * from report	pending	\N	2023-11-28 13:49:25
57	\N	127.0.0.1	exported_data.csv	15087	tempdir_6565e1de14ef1	select * from report	pending	\N	2023-11-28 13:49:34
58	\N	127.0.0.1	exported_data.csv	15087	tempdir_6565e1e73d62e	select * from report	pending	\N	2023-11-28 13:49:43
59	\N	127.0.0.1	exported_data.csv	15087	tempdir_6565e1eccd73a	select * from report	pending	\N	2023-11-28 13:49:48
60	\N	127.0.0.1	exported_data.csv	15087	tempdir_6565e1f345f13	select * from report	pending	\N	2023-11-28 13:49:55
61	\N	127.0.0.1	exported_data.csv	15087	tempdir_6565e1f893b95	select * from report	pending	\N	2023-11-28 13:50:00
62	\N	127.0.0.1	exported_data.csv	15087	tempdir_6565e1fece5c4	select * from report	pending	\N	2023-11-28 13:50:06
63	\N	127.0.0.1	exported_data.csv	15087	tempdir_6565e204dbacc	select * from report	pending	\N	2023-11-28 13:50:12
64	\N	127.0.0.1	exported_data.csv	12044	tempdir_6565e23343c62	select * from cases	pending	\N	2023-11-28 13:50:59
65	\N	127.0.0.1	exported_data.csv	2497	tempdir_6565e239ead57	select * from team	pending	\N	2023-11-28 13:51:05
66	\N	127.0.0.1	exported_data.csv	2497	tempdir_6565e243eaaf2	select * from team	pending	\N	2023-11-28 13:51:15
67	\N	127.0.0.1	exported_data.csv	15087	tempdir_6565e24a030e5	select * from report	pending	\N	2023-11-28 13:51:22
68	\N	127.0.0.1	exported_data.csv	15087	tempdir_6565e25180a6f	select * from report	pending	\N	2023-11-28 13:51:29
69	\N	127.0.0.1	exported_data.csv	15087	tempdir_6565e25761127	select * from report	pending	\N	2023-11-28 13:51:35
70	\N	127.0.0.1	exported_data.csv	15087	tempdir_6565e2b0ab345	select * from report	pending	\N	2023-11-28 13:53:04
71	\N	127.0.0.1	exported_data.csv	15087	tempdir_6565e2bb3fbea	select * from report	pending	\N	2023-11-28 13:53:15
72	\N	127.0.0.1	exported_data.csv	12044	tempdir_6565e2d421b3b	select * from cases	pending	\N	2023-11-28 13:53:40
73	\N	127.0.0.1	exported_data.csv	12044	tempdir_6565e2df7e2eb	select * from cases	pending	\N	2023-11-28 13:53:51
74	\N	127.0.0.1	exported_data.csv	2497	tempdir_6565e2f6f0a43	select * from team	pending	\N	2023-11-28 13:54:14
75	\N	127.0.0.1	exported_data.csv	15087	tempdir_6565e40785b1d	select * from report	pending	\N	2023-11-28 13:58:47
76	\N	127.0.0.1	exported_data.csv	15087	tempdir_6565e47d7fa71	select * from report	pending	\N	2023-11-28 14:00:45
77	\N	127.0.0.1	exported_data.csv	15087	tempdir_6565e537dc243	select * from report	pending	\N	2023-11-28 14:03:51
78	\N	127.0.0.1	exported_data.csv	15087	tempdir_6565e5c47710c	select * from report	pending	\N	2023-11-28 14:06:12
79	\N	127.0.0.1	exported_data.csv	15087	tempdir_6565e637aac6a	select * from report	pending	\N	2023-11-28 14:08:07
80	\N	127.0.0.1	exported_data.csv	15087	tempdir_6565e69d69b29	select * from report	pending	\N	2023-11-28 14:09:49
81	\N	127.0.0.1	exported_data.csv	15087	tempdir_6565e6f0b1340	select * from report	pending	\N	2023-11-28 14:11:12
82	\N	127.0.0.1	exported_data.csv	15087	tempdir_6565e72426a37	select * from report	pending	\N	2023-11-28 14:12:04
83	\N	127.0.0.1	exported_data.csv	15087	tempdir_6565e7b3f21b0	select * from report	pending	\N	2023-11-28 14:14:27
84	\N	127.0.0.1	exported_data.csv	2497	tempdir_6565e7d7d3807	select * from team	pending	\N	2023-11-28 14:15:03
85	\N	127.0.0.1	exported_data.csv	2497	tempdir_6565e85e2daf9	select * from team	pending	\N	2023-11-28 14:17:18
86	\N	127.0.0.1	exported_data.csv	2497	tempdir_6565e864b1052	select * from team	pending	\N	2023-11-28 14:17:24
87	\N	127.0.0.1	exported_data.csv	12044	tempdir_6565e8c84e5ac	select * from cases	pending	\N	2023-11-28 14:19:04
88	\N	127.0.0.1	exported_data.csv	2497	tempdir_6565e8cfcedb0	select * from team	pending	\N	2023-11-28 14:19:11
89	\N	127.0.0.1	exported_data.csv	15087	tempdir_6565eaa7171e2	select * from report	pending	\N	2023-11-28 14:27:03
90	\N	127.0.0.1	exported_data.csv	15087	tempdir_6565eaade976d	select * from report	pending	\N	2023-11-28 14:27:09
91	\N	127.0.0.1	exported_data.csv	15087	tempdir_6565eaed154be	select * from report	pending	\N	2023-11-28 14:28:13
92	\N	127.0.0.1	exported_data.csv	15087	tempdir_6565ec0670834	select * from report	pending	\N	2023-11-28 14:32:54
93	\N	127.0.0.1	exported_data.csv	15087	tempdir_6565ec0d6e8f1	select * from report	pending	\N	2023-11-28 14:33:01
94	\N	127.0.0.1	exported_data.csv	12044	tempdir_6565ee9c42716	select * from cases	pending	\N	2023-11-28 14:43:56
95	\N	127.0.0.1	exported_data.csv	12044	tempdir_6565eea29d752	select * from cases	pending	\N	2023-11-28 14:44:02
96	\N	127.0.0.1	exported_data.csv	12044	tempdir_6565eee889584	select * from cases	pending	\N	2023-11-28 14:45:12
97	\N	127.0.0.1	exported_data.csv	12044	tempdir_6565eeee2a22f	select * from cases	pending	\N	2023-11-28 14:45:18
98	\N	127.0.0.1	exported_data.csv	12044	tempdir_6565f51dc16af	select * from cases	pending	\N	2023-11-28 15:11:41
99	\N	127.0.0.1	exported_data.csv	12044	tempdir_6565f5289d5d7	select * from cases	pending	\N	2023-11-28 15:11:52
100	\N	127.0.0.1	exported_data.csv	2497	tempdir_6565f56a8e259	select * from team	pending	\N	2023-11-28 15:12:58
101	\N	127.0.0.1	exported_data.csv	12044	tempdir_6565f5e5dfa95	select * from cases	pending	\N	2023-11-28 15:15:01
102	\N	127.0.0.1	exported_data.csv	12044	tempdir_6565f5f44e19b	select * from cases	pending	\N	2023-11-28 15:15:16
103	\N	127.0.0.1	exported_data.csv	12044	tempdir_6565f605b41c5	select * from cases	pending	\N	2023-11-28 15:15:33
104	\N	127.0.0.1	exported_data.csv	12044	tempdir_6565f60f42359	select * from cases	pending	\N	2023-11-28 15:15:43
105	\N	127.0.0.1	exported_data.csv	12044	tempdir_6565fb9411674	select * from cases	pending	\N	2023-11-28 15:39:16
106	\N	127.0.0.1	exported_data.csv	12044	tempdir_6565fb9b0899b	select * from cases	pending	\N	2023-11-28 15:39:23
\.


--
-- Data for Name: exception_category; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.exception_category (id, name, description, code, created_at) FROM stdin;
21	Automated Transactional Alerts	Automated Transactional Alerts	trans	2023-09-06 13:01:29
1	Case Manager Exception Processes	Case Manager Exception Processes	non-trans	2023-09-06 13:01:29
\.


--
-- Data for Name: exception_frequency; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.exception_frequency (id, name, code, created_at) FROM stdin;
1	Every 5 Minutes	minutes	2023-09-06 12:45:40
2	Hourly	hour	2023-09-06 12:45:40
3	Daily	day	2023-09-06 12:45:40
4	Weekly	week	2023-09-06 12:45:40
5	Monthly	month	2023-09-06 12:45:40
6	Yearly	year	2023-09-06 12:45:40
\.


--
-- Data for Name: exception_process; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.exception_process (id, name, sql_text, frequency, category_id, email_to, state, alert_group_id, branch_code, type_id, risk_rating_id, first_line_owner, second_line_owner, first_owner_id, policy_id, second_owner_id, approver_id, approved_at, user_id, created_at, narration) FROM stdin;
19817	Wrong Account	\N	\N	1	\N	active	\N	1	407	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19820	Wrong FD Tenor	\N	\N	1	\N	active	\N	1	407	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19822	tellers working tools left outside	\N	\N	1	\N	active	\N	1	276	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19824	Stale Instruction	\N	\N	1	\N	active	\N	1	305	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19825	Unauthorized Transaction	\N	\N	1	\N	active	\N	1	305	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19828	Incomplete documentation	\N	\N	1	\N	active	\N	1	305	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19829	Signature Verification Incomplete	\N	\N	1	\N	active	\N	1	305	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19831	Instruction not timestamped	\N	\N	1	\N	active	\N	1	305	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19833	Wrong Account	\N	\N	1	\N	active	\N	1	305	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19835	Counter cheque issued without registering it	\N	\N	1	\N	active	\N	1	305	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19837	Instruction not sv	\N	\N	1	\N	active	\N	1	305	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19839	Unused cheques not detroyed on finacle	\N	\N	1	\N	active	\N	1	305	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19842	Transaction Instruments not scanned	\N	\N	1	\N	active	\N	1	305	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19844	Charges taken from Wrong Account	\N	\N	1	\N	active	\N	1	305	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19847	Duplicate Transaction	\N	\N	1	\N	active	\N	1	305	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19849	Instrument not sv	\N	\N	1	\N	active	\N	1	305	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19851	Loss of Income	\N	\N	1	\N	active	\N	1	305	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19854	Settlement Inconsistent	\N	\N	1	\N	active	\N	1	305	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19856	Wrong Settlement value	\N	\N	1	\N	active	\N	1	460	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19860	Rate Code	\N	\N	1	\N	active	\N	1	460	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19863	Incomplete Transaction	\N	\N	1	\N	active	\N	1	460	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19866	Wrong Account	\N	\N	1	\N	active	\N	1	460	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19872	Incomplete Transaction	\N	\N	1	\N	active	\N	1	333	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19874	Duplicate Transaction	\N	\N	1	\N	active	\N	1	333	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19877	No RM  name and signature on cofirmation	\N	\N	1	\N	active	\N	1	333	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19881	transaction of 5mand above without BL approval	\N	\N	1	\N	active	\N	1	333	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19883	Wrong Date on instrument	\N	\N	1	\N	active	\N	1	333	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19885	Documentation	\N	\N	1	\N	active	\N	1	334	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19889	Culture	\N	\N	1	\N	active	\N	1	335	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19891	Employee Benefit	\N	\N	1	\N	active	\N	1	336	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19894	HOP did not sign off forms/request	\N	\N	1	\N	active	\N	1	336	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19900	Wrong Execution	\N	\N	1	\N	active	\N	1	284	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19903	Wrong/Incomplete Transfer Details	\N	\N	1	\N	active	\N	1	357	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19906	Asset declaration register not updated or signed by tellers	\N	\N	1	\N	active	\N	1	358	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19910	attendance not maintained or updated	\N	\N	1	\N	active	\N	1	358	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19913	Wrong Classification	\N	\N	1	\N	active	\N	1	382	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19917	Cash suppression by tellers	\N	\N	1	\N	active	\N	1	436	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19920	Incomplete Signatory	\N	\N	1	\N	active	\N	1	436	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19716	Missing/Delayed Tickets	\N	\N	1	\N	active	\N	1	281	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19718	Sms alert not treated	\N	\N	1	\N	active	\N	1	281	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19720	Unauthorized Transaction	\N	\N	1	\N	active	\N	1	281	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19721	Cheque paid but not confirmed.	\N	\N	1	\N	active	\N	1	281	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19724	Charges not taken	\N	\N	1	\N	active	\N	1	281	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19726	Transaction Instruments not scanned	\N	\N	1	\N	active	\N	1	281	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19728	Service Level Agreement	\N	\N	1	\N	active	\N	1	281	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19731	Incomplete Transaction	\N	\N	1	\N	active	\N	1	434	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19733	Wrong/Incomplete Transfer Details	\N	\N	1	\N	active	\N	1	434	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19735	Documentation	\N	\N	1	\N	active	\N	1	434	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19738	BIN card not updated	\N	\N	1	\N	active	\N	1	332	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19740	Wrong configuration of ATM	\N	\N	1	\N	active	\N	1	332	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19742	Ambience	\N	\N	1	\N	active	\N	1	332	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19744	Alteration not Signed	\N	\N	1	\N	active	\N	1	282	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19746	Flooded premises	\N	\N	1	\N	active	\N	1	282	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19748	Leaking pipes	\N	\N	1	\N	active	\N	1	282	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19752	attendance not maintained or updated	\N	\N	1	\N	active	\N	1	282	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19754	Documentation	\N	\N	1	\N	active	\N	1	282	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19756	Faulty priming machine	\N	\N	1	\N	active	\N	1	282	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19760	branch walls are dirty and not painted	\N	\N	1	\N	active	\N	1	282	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19763	No back up Generator set	\N	\N	1	\N	active	\N	1	282	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19766	Vehicle parking/driver not maintained	\N	\N	1	\N	active	\N	1	282	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19768	branch toilet very bad	\N	\N	1	\N	active	\N	1	282	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19773	Vault environment is dirty	\N	\N	1	\N	active	\N	1	282	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19775	Wrong Execution	\N	\N	1	\N	active	\N	1	282	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19777	no dual control observed	\N	\N	1	\N	active	\N	1	282	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19781	HOP did not sign off forms/request	\N	\N	1	\N	active	\N	1	282	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19784	Duty log register not maintained or updated	\N	\N	1	\N	active	\N	1	283	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19787	Ambience	\N	\N	1	\N	active	\N	1	283	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19788	No approval from RBH for late closure of Branch	\N	\N	1	\N	active	\N	1	283	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19793	inflated expense	\N	\N	1	\N	active	\N	1	283	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19795	overdrawn staff account	\N	\N	1	\N	active	\N	1	380	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19798	Instruction for reactivation not sighted	\N	\N	1	\N	active	\N	1	303	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19800	Wrong Account	\N	\N	1	\N	active	\N	1	304	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19805	Manual debits into customers account	\N	\N	1	\N	active	\N	1	435	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
2	tt	\N	\N	6	\N	\N	6	tt	4	\N	\N	\N	8	7	8	\N	\N	9	10/04/2023	\N
19808	TRY	\N	\N	4	\N	active	5	ff	4	\N	\N	\N	3	4	3	\N	25-MAR-23 05.10.07.924584000 PM	5	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
19925	tre	\N	\N	5	\N	active	7	tesr	6	\N	\N	\N	9	6	8	\N	25-MAR-23 05.10.07.924584000 PM	9	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
3	yt	\N	\N	6	\N	\N	6	tt	4	\N	\N	\N	8	7	8	\N	\N	9	10/04/2023	\N
4	yt	\N	\N	6	\N	\N	6	tt	4	\N	\N	\N	8	7	3	\N	\N	9	10/04/2023	\N
5	tr	\N	\N	4	\N	\N	6	ty	6	\N	\N	\N	8	5	7	\N	\N	2	10/04/2023	\N
7	tr	\N	\N	4	\N	\N	6	ty	6	\N	\N	\N	8	5	7	\N	\N	2	\N	\N
8	tre	\N	\N	5	\N	\N	7	tesr	6	\N	\N	\N	9	6	8	\N	\N	9	\N	\N
9	tre	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
19922	Tampared seal 14	\N	\N	1	\N	active	2	NG0020115	350	\N	\N	\N	5559	1	5558	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert
10	tert	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	tert	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
12	test	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
13	yt	\N	\N	6	\N	\N	6	tt	4	\N	\N	\N	8	7	3	\N	\N	9	\N	\N
14	bbb	\N	\N	6	\N	\N	6	tt	4	\N	\N	\N	8	7	3	\N	\N	9	\N	\N
15	vv	\N	\N	1	\N	\N	2	NG0010001	261	\N	\N	\N	5559	1	5559	\N	\N	43	\N	\N
16	bbb	test	test	6	\N	test	6	tt	4	\N	\N	\N	8	7	3	\N	\N	9	\N	test
17	bbb	test	test	6	\N	test	6	tt	4	\N	\N	\N	8	7	3	\N	\N	9	\N	test
18	MEDICAL			1	\N		3	NG0020016	370	\N	\N	\N	5559	1	5559	\N	\N	43	\N	
19	MEDICAL			1	\N		3	NG0020016	370	\N	\N	\N	5559	1	5559	\N	\N	43	\N	
20	BUSINESS			1	\N		1	NG0010001	370	\N	\N	\N	5559	1	5559	\N	\N	43	\N	
21	BUSINESS			1	\N		1	NG0010001	370	\N	\N	\N	5559	1	5559	\N	\N	43	\N	
22	FARMING			1	\N		2	NG0010001	370	\N	\N	\N	5559	1	5559	\N	\N	43	\N	
\.


--
-- Data for Name: exception_process_; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.exception_process_ (id, name, sql_text, frequency, email_to, state, alert_group_id, branch_code, process_id, risk_rating_id, first_line_owner, second_line_owner, first_owner_id, policy_id, second_owner_id, approver_id, approved_at, user_id, created_at, narration, type_id) FROM stdin;
1	newest process	sql goes here		["lebechiuchey@gmail.com"]	inactive	50	1001	333	24			8	01	10	1	1am	9	5pm	newest process narration	\N
7	newest process	sql goes here		["lebechiuchey@gmail.com"]	inactive	50	1001	333	24			8	01	10	1	1am	9	5pm	newest process narration	\N
13	newest process	sql goes here		["lebechiuchey@gmail.com"]	inactive	50	1001	333	24			8	01	10	1	1am	9	5pm	newest process narration	\N
19	newest process	sql goes here		["lebechiuchey@gmail.com"]	inactive	50	1001	333	24			8	01	10	1	1am	9	5pm	newest process narration	\N
2	newest process	sql goes here		["lebechiuchey@gmail.com"]	inactive	50	1001	333	24			8	01	10	1	1am	9	5pm	newest process narration	\N
8	newest process	sql goes here		["lebechiuchey@gmail.com"]	inactive	50	1001	333	24			8	01	10	1	1am	9	5pm	newest process narration	\N
14	newest process	sql goes here		["lebechiuchey@gmail.com"]	inactive	50	1001	333	24			8	01	10	1	1am	9	5pm	newest process narration	\N
20	newest process	sql goes here		["lebechiuchey@gmail.com"]	inactive	50	1001	333	24			8	01	10	1	1am	9	5pm	newest process narration	\N
3	newest process	sql goes here		["lebechiuchey@gmail.com"]	inactive	50	1001	333	24			8	01	10	1	1am	9	5pm	newest process narration	\N
9	newest process	sql goes here		["lebechiuchey@gmail.com"]	inactive	50	1001	333	24			8	01	10	1	1am	9	5pm	newest process narration	\N
15	newest process	sql goes here		["lebechiuchey@gmail.com"]	inactive	50	1001	333	24			8	01	10	1	1am	9	5pm	newest process narration	\N
21	newest process	sql goes here		["lebechiuchey@gmail.com"]	inactive	50	1001	333	24			8	01	10	1	1am	9	5pm	newest process narration	\N
100	Wrong Account	\N	\N	\N	active	\N	1	407	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
101	Wrong FD Tenor	\N	\N	\N	active	\N	1	407	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
102	tellers working tools left outside	\N	\N	\N	active	\N	1	276	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
103	Stale Instruction	\N	\N	\N	active	\N	1	305	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
104	Unauthorized Transaction	\N	\N	\N	active	\N	1	305	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
105	Incomplete documentation	\N	\N	\N	active	\N	1	305	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
106	Signature Verification Incomplete	\N	\N	\N	active	\N	1	305	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
107	Instruction not timestamped	\N	\N	\N	active	\N	1	305	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
108	Wrong Account	\N	\N	\N	active	\N	1	305	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
109	Counter cheque issued without registering it	\N	\N	\N	active	\N	1	305	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
110	Instruction not sv	\N	\N	\N	active	\N	1	305	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
111	Unused cheques not detroyed on finacle	\N	\N	\N	active	\N	1	305	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
112	Transaction Instruments not scanned	\N	\N	\N	active	\N	1	305	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
113	Charges taken from Wrong Account	\N	\N	\N	active	\N	1	305	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
114	Duplicate Transaction	\N	\N	\N	active	\N	1	305	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
115	Instrument not sv	\N	\N	\N	active	\N	1	305	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
116	Loss of Income	\N	\N	\N	active	\N	1	305	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
119	Rate Code	\N	\N	\N	active	\N	1	460	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
4	newest process	sql goes here		["lebechiuchey@gmail.com"]	inactive	50	1001	333	24			8	01	10	1	1am	9	5pm	newest process narration	\N
10	newest process	sql goes here		["lebechiuchey@gmail.com"]	inactive	50	1001	333	24			8	01	10	1	1am	9	5pm	newest process narration	\N
16	newest process	sql goes here		["lebechiuchey@gmail.com"]	inactive	50	1001	333	24			8	01	10	1	1am	9	5pm	newest process narration	\N
5	newest process	sql goes here		["lebechiuchey@gmail.com"]	inactive	50	1001	333	24			8	01	10	1	1am	9	5pm	newest process narration	\N
11	newest process	sql goes here		["lebechiuchey@gmail.com"]	inactive	50	1001	333	24			8	01	10	1	1am	9	5pm	newest process narration	\N
17	newest process	sql goes here		["lebechiuchey@gmail.com"]	inactive	50	1001	333	24			8	01	10	1	1am	9	5pm	newest process narration	\N
117	Settlement Inconsistent	\N	\N	\N	active	\N	1	305	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
118	Wrong Settlement value	\N	\N	\N	active	\N	1	460	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
120	Incomplete Transaction	\N	\N	\N	active	\N	1	460	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
121	Wrong Account	\N	\N	\N	active	\N	1	460	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
122	Incomplete Transaction	\N	\N	\N	active	\N	1	333	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
123	Duplicate Transaction	\N	\N	\N	active	\N	1	333	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
124	No RM  name and signature on cofirmation	\N	\N	\N	active	\N	1	333	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
125	transaction of 5mand above without BL approval	\N	\N	\N	active	\N	1	333	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
126	Time Stampimg	\N	\N	\N	active	\N	1	285	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
127	Wrong Date on instrument	\N	\N	\N	active	\N	1	333	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
128	Documentation	\N	\N	\N	active	\N	1	334	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
129	Culture	\N	\N	\N	active	\N	1	335	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
130	Employee Benefit	\N	\N	\N	active	\N	1	336	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
131	HOP did not sign off forms/request	\N	\N	\N	active	\N	1	336	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
132	Wrong Execution	\N	\N	\N	active	\N	1	284	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
133	Wrong/Incomplete Transfer Details	\N	\N	\N	active	\N	1	357	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
134	Asset declaration register not updated or signed by tellers	\N	\N	\N	active	\N	1	358	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
135	attendance not maintained or updated	\N	\N	\N	active	\N	1	358	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
136	Wrong Classification	\N	\N	\N	active	\N	1	382	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
137	Cash suppression by tellers	\N	\N	\N	active	\N	1	436	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
138	Incomplete Signatory	\N	\N	\N	active	\N	1	436	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
139	Tampared seal	\N	\N	\N	active	\N	1	436	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
140	Cash not strapped kept in the vault	\N	\N	\N	active	\N	1	436	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
141	Missing/Delayed Tickets	\N	\N	\N	active	\N	1	281	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
142	Sms alert not treated	\N	\N	\N	active	\N	1	281	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
143	Unauthorized Transaction	\N	\N	\N	active	\N	1	281	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
144	Cheque paid but not confirmed.	\N	\N	\N	active	\N	1	281	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
145	Charges not taken	\N	\N	\N	active	\N	1	281	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
146	Transaction Instruments not scanned	\N	\N	\N	active	\N	1	281	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
147	Service Level Agreement	\N	\N	\N	active	\N	1	281	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
148	Incomplete Transaction	\N	\N	\N	active	\N	1	434	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
149	Wrong/Incomplete Transfer Details	\N	\N	\N	active	\N	1	434	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
150	Documentation	\N	\N	\N	active	\N	1	434	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
151	BIN card not updated	\N	\N	\N	active	\N	1	332	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
152	Wrong configuration of ATM	\N	\N	\N	active	\N	1	332	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
153	Ambience	\N	\N	\N	active	\N	1	332	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
154	Alteration not Signed	\N	\N	\N	active	\N	1	282	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
155	Flooded premises	\N	\N	\N	active	\N	1	282	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
156	Leaking pipes	\N	\N	\N	active	\N	1	282	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
157	attendance not maintained or updated	\N	\N	\N	active	\N	1	282	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
158	Documentation	\N	\N	\N	active	\N	1	282	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
159	Faulty priming machine	\N	\N	\N	active	\N	1	282	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
160	branch walls are dirty and not painted	\N	\N	\N	active	\N	1	282	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
161	No back up Generator set	\N	\N	\N	active	\N	1	282	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
162	Vehicle parking/driver not maintained	\N	\N	\N	active	\N	1	282	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
163	branch toilet very bad	\N	\N	\N	active	\N	1	282	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
164	Vault environment is dirty	\N	\N	\N	active	\N	1	282	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
165	Wrong Execution	\N	\N	\N	active	\N	1	282	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
166	no dual control observed	\N	\N	\N	active	\N	1	282	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
167	HOP did not sign off forms/request	\N	\N	\N	active	\N	1	282	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
168	Duty log register not maintained or updated	\N	\N	\N	active	\N	1	283	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
169	Ambience	\N	\N	\N	active	\N	1	283	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
170	No approval from RBH for late closure of Branch	\N	\N	\N	active	\N	1	283	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
171	inflated expense	\N	\N	\N	active	\N	1	283	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
172	overdrawn staff account	\N	\N	\N	active	\N	1	380	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
173	Instruction for reactivation not sighted	\N	\N	\N	active	\N	1	303	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
174	Wrong Account	\N	\N	\N	active	\N	1	304	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
175	Manual debits into customers account	\N	\N	\N	active	\N	1	435	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
176	Unconventional balances in GL	\N	\N	\N	active	\N	1	435	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
177	Conditions precedent to draw down in offer letter not met	\N	\N	\N	active	\N	1	356	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
178	credit documentation papers not dated	\N	\N	\N	active	\N	1	356	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
179	Boxed cash register not maintained or updated	\N	\N	\N	active	\N	1	301	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
180	Cash stacked around the ATM vault	\N	\N	\N	active	\N	1	301	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
181	Amount Mismatch	\N	\N	\N	active	\N	1	301	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
182	Amount in words differs from figure	\N	\N	\N	active	\N	1	436	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
183	Overdrawn staff account balance [Test]	select  nomrest customer,branch_code,account_number,product_name,currency_code,to_char(balance,\\"999,999,999.99\\") balance,upper(account_officer_name) account_officer, phone_number,lower(email) email \\nfrom overdrawn_accounts \\nwhere  balance < 0 and product_code in (\\"431\\")	day	\N	inactive	1	1	\N	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
184	Account Opened Last 6 Months [Test]	select * from(select a.account_number,c.full_name,a.product_name,a.branch_code,b.branch_name,\\na.date_created,helpers.number_format(a.balance) current_balance,\\nd.account_officer_name,a.email_address,a.phone_numbers \\nfrom am_customer_account a,am_branch b,am_customer c,am_account_officers d \\nwhere a.branch_code=b.branch_code and a.customer_id=c.customer_id \\nand c.account_officer_id=d.account_officer_id\\nand trim(a.customer_id) is not null and \\na.date_created > trunc(sysdate) - interval \\"6\\" month) where 1=1 and product_name=\\"DOMICILIARY-INDIVIDUAL\\"	day	\N	inactive	1	1	\N	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
185	Overdrawn Staff Related Accounts - [Test]	select customer_name,account_number,inti account_name,branch_code,gl_code,\\ncurrency_code,to_char(balance,\\"999,999,999.99\\") \\"BALANCE\\",helpers.number_format(current_balance) curr_balance ,account_officer_name,product_name,\\nlower(email) email,phone_number from overdrawn_accounts where current_balance < 0 \\nand  currency_code=\\"NGN\\"  \\nand gl_code in (select gl_code from am_gl_account where classification=\\"staff\\" and gl_code in )	day	\N	inactive	22	1	\N	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
186	Missing/Delayed Tickets	\N	\N	\N	active	\N	1	436	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
187	Cash swap transaction not posted on Finacle	\N	\N	\N	active	\N	1	436	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
188	Deposit receipt printout not signed by the customer	\N	\N	\N	active	\N	1	436	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
189	Dual control not observed	\N	\N	\N	active	\N	1	436	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
190	Incomplete Transaction	\N	\N	\N	active	\N	1	436	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
191	Wrong Date on instrument	\N	\N	\N	active	\N	1	436	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
192	Cash certificate wrongly prepared	\N	\N	\N	active	\N	1	437	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
193	Tellers till not balanced with the system	\N	\N	\N	active	\N	1	437	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
194	Inadequate number of cash control team	\N	\N	\N	active	\N	1	285	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
195	No cash officer Sign off on supply slip	\N	\N	\N	active	\N	1	285	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
196	Seal number and stamped not on exchange ticket	\N	\N	\N	active	\N	1	285	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
197	Signature Verification Incomplete	\N	\N	\N	active	\N	1	285	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
198	Amount in words differs from figure	\N	\N	\N	active	\N	1	285	\N	\N	\N	\N	\N	\N	\N	25-MAR-23 05.10.07.924584000 PM	43	19-APR-23 09.50.36.008911000 AM	Kindly review and revert	\N
6	newest process	sql goes here		["lebechiuchey@gmail.com"]	inactive	50	1001	333	24			8	01	10	1	1am	9	5pm	newest process narration	\N
12	newest process	sql goes here		["lebechiuchey@gmail.com"]	inactive	50	1001	333	24			8	01	10	1	1am	9	5pm	newest process narration	\N
18	newest process	sql goes here		["lebechiuchey@gmail.com"]	inactive	50	1001	333	24			8	01	10	1	1am	9	5pm	newest process narration	\N
\.


--
-- Data for Name: exception_process_status; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.exception_process_status (id, name, code, created_at) FROM stdin;
1	Email sending activated	active	2023-09-06 12:34:42
2	Email sending deactivated	inactive	2023-09-06 12:34:42
\.


--
-- Data for Name: exception_process_type; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.exception_process_type (id, name, category_id) FROM stdin;
261	INWARD CLEARING	1
262	AUDIT ENQUIRY CHARGES	1
263	INBOUND AND OUTBOUND CORRESPONDENCE	1
264	CASH AND TELLER	1
265	RECONCILIATION	1
266	CARD DISTRIBUTION	1
267	PAYDIRECT � WHERE BANK IS COLLECTING BANK	1
268	POS ACQUIRED	1
269	VISACARD	1
270	COLLATERAL RELEASE	1
271	MOBILITY REPORT � ATM TRANSFER, QUICKTELLER AND OTHER TRANSFER ON ALL CHANNELS	1
272	INSTANT ALERT/NOTIFICATION ON NGN00023437055 (LONG OUTSTANDING ACCOUNT) ENTRIES	1
273	CUSTOMER SERVICES : MODIFICATIONS OF CUSTOMERS� PHONE NUMBER AND EMAIL ADDRESSES IN CORE BANKING AND SMS PORTAL.	1
274	DESK SWEEP AND ENVIRONMENTAL/ SECURITY SCANNING	1
275	SAFE KEEPING ITEMS	1
276	DESK SWEEP AND ENVIRONMENTAL SCANNING	1
277	IMTO	1
278	BRANCH ADMINISTRATION	1
279	CASH WITHDRAWAL LOCAL CURRENCY	1
280	CHEQUE PAYMENT	1
281	EMAIL INDEMNITY	1
282	AMBIENCE(FUNCTIONAL TOILET,CLEAN FLAGS ETC)	1
283	BRANCH CLOSING TIME	1
284	PAYROLL MANAGEMENT - EX-STAFF BENEFITS AND INDEBTEDNESS.	1
285	EVACUATION AND REPLENISHMENT OF CASH (BRANCHES/HEAD OFFICE)	1
286	MICR	1
287	INTERBANK TRADING OF CURRENCIES	1
288	ACQUIRER CHARGEBACK (ATM)	1
289	MANAGE CUSTOMER COMPLAINT DASHBOARD	1
290	ACQUIRER CHARGEBACK	1
291	POS ISSUER SETTLEMENT	1
292	PAYDIRECT � WHERE BANK IS LEAD BANK	1
293	PAYGATE/WEB ACQUIRED	1
294	MASTERCARD	1
295	INWARD NEFT	1
296	RETURNED OUTWARD CHEQUES	1
297	KYC/CDD/EDD	1
298	DOCUMENT STORAGE	1
299	PROCESSED NIBBS/NEFT TRANSACTIONS	1
300	CONFIRMATION OF INVOICES, POS, DOMICILIATIONS.	1
301	ATM OVERAGE	1
302	LETTER WITHDRAWAL	1
303	PROMISSORY NOTE TRADING	1
304	REAL TIME GROSS SETTLEMENT (RTGS) [INWARD]	1
305	DOMICILIARY OUTFLOW PROCESSING	1
306	TREASURY BILLS TRADING	1
307	ISSUANCE OF MANAGER�S CHEQUE [MC]	1
308	TRADING AND BANKING BOOKS REPORT	1
309	LEGAL DOCUMENTATION	1
310	DEPOSIT INVESTMENT [FCY]	1
311	ACCOUNT OPENING DOCUMENTATION	1
312	RECRUITMENT	1
313	FIRS VAT ENFORCEMENT	1
314	ENSURE RECORD COMPLETENESS FOR ALL COMPLAINT LODGED	1
315	ANALYSE COMPLAINTS TO PROVIDE INSIGHT TO MANAGEMENT	1
316	GENERAL LEDGER MANAGEMENT	1
317	POS/WEB TERMINALS � ACTIVE OR INACTIVE	1
318	POS/WEB MERCHANT TERMINALS SET UP	1
319	ATM TRANSACTIONS- ROU/NOU	1
320	VAULT ADMINISTRATION	1
321	GENERAL LEDGER CFM/LONG OUTSTANDING ACCOUNT	1
322	EQUIPMENT MAINTENANCE	1
323	VTU APPROVED TRANSACTIONS FOR RECHARGE, WEB & OTHERS	1
324	IN BRANCH POS TRANSFERS	1
325	TRANSACTIONS PROCESSED ON EASY TRANS PORTAL.	1
326	REACTIVATION OF ACCOUNTS	1
327	STANDING INSTRUCTION	1
328	CUSTOMERS REQUEST FOR ACCOUNT STATEMENT (OFF CYCLE STATEMENT)	1
329	BANKER�S CONFIRMATION/REFERENCE LETTER	1
330	ADMINISTRATION OF CLOSED CIRCUIT TELEVISION [CCTV]	1
331	WORK PLACE ETHICS	1
332	PRIMING OF CARDS	1
333	ACCOUNT OFFICER CONFIRMATION	1
334	FOREIGN DRAFT PROCESSING	1
335	TRAINING AND DEVELOPMENT	1
336	STAFF WELFARE - HEALTH AND MEDICARE SERVICES	1
337	FIXED ASSETS ADMINISTRATION	1
338	ISSUER CHRAGEBACK	1
339	LETTER OF CREDIT	1
340	OUTWARD CLEARING	1
341	ENFORCE DATA INTEGRITY ON ALL DATA CAPTURE PLATFORMS	1
342	WESTERN UNION MONEY TRANSFER/MONEYGRAM	1
343	CHARGES /BILLING � VISA/UPSL/VERVE	1
344	PAYMENT GATEWAY- AUTOPAY/REMITTA	1
345	INCOME AND NIBSS CHARGES	1
346	RETURNED INWARD CHEQUES	1
347	LOAN DEMAND SATISFACTION	1
348	ACCOUNT LIEN MAINTENANCE	1
349	REVOKE STOP PAYMENT ORDER	1
351	FORM M PROCESSING	1
352	CONFIRMATION AND SETTLEMENT	1
353	MEDIA RELATIONS	1
354	DOCUMENT RECEIPT	1
355	PRE-TRADE DOCUMENTS ON COUNTER-PARTIES	1
356	CREDIT DOCUMENTATION, AND MONITORING	1
357	PAYROLL MANAGEMENT � STATUTORY DEDUCTIONS AND REMITTANCE	1
358	PERSONNEL DATA ADMINISTRATION	1
359	INWARD REAL TIME GROSS SETTLEMENT (RTGS)	1
360	PREPAYMENT AND AMORTIZATION	1
361	LITIGATION AND PROSECUTION	1
362	FORM M	1
363	FRESH REQUEST FOR AUDIT INQUIRY AND CONFIRMATION OF BALANCES	1
364	AUDIT ENQUIRY AND BALANCE CONFIRMATION	1
365	LOAN DISBURSEMENT	1
366	POWER AND PLANT	1
367	RIA  MONEY TRANSFER	1
368	MICRO-FINANCE BANKS (NON-SETTLEMENT BANK) CHEQUES	1
369	INSTANT ALERT/NOTIFICATION ON NGN00023437056 (LONG OUTSTANDING ACCOUNT) ENTRIES	1
370	ACCOUNT FREEZE MAINTENANCE	1
371	ATM CARD REQUEST AND ISSUANCE	1
372	BRANCH EXPENSES	1
373	DAILY POSITION VALUATION AND P&L RECONCILIATION	1
374	CREDIT DOCUMENTATION, AND  MONITORING	1
375	FX POSITION KEEPING	1
376	CUSTOMERS E-SERVICES ENROLLMENT	1
377	REGULATORY AUTHORITIES/LAW ENFORCEMENT REQUEST	1
378	AML/CFT CREDIT ASSESSMENT QUESTIONNAIRE.	1
379	CHEQUE LODGEMENT	1
380	REVIEW OF STAFF AND STAFF RELATED ACCOUNTS	1
381	MANPOWER PLANNING	1
382	MOVEMENT OF CASH TO CBN	1
383	CASH ADVANCE DISBURSEMENT AND RETIREMENT	1
384	EXCESS CHARGES AND CLAIMS	1
385	RECOMMEND PROCESS IMPROVEMENT	1
386	MASTERCARD INTERNATIONAL	1
387	DCC	1
388	ETRANZACT SETTLEMENT	1
389	DEBIT CARD LIMIT MODIFICATION	1
390	ORGANISE FILES AND TIDY DOMESTIC ACCOUNT UNIT FILE ROOM	1
391	DOCUMENT RETRIEVAL	1
392	CREDIT INTEREST MAINTENANCE	1
393	PREMISES	1
394	CHEQUE BOOK REQUISITION/ISSUANCE AND MAINTENANCE	1
395	CLOSURE OF A DECEASED CUSTOMER�S ACCOUNT	1
396	ADMINISTRATION OF INTEGRITY TESTS ON TELLERS.	1
397	ATM OPERATIONS	1
398	DUE DILIGENCE, ENHANCED DUE DILIGENCE, AND UNUSUAL INFLOWS AND TRANSACTION AMOUNTS THAT SUGGEST STRUCTURING/SMURFING	1
399	DUD CHEQUES, BVN, ADDRESS AND ID VERIFICATION	1
400	STAFF ENGAGEMENT	1
401	DOCUMENT PROCESSING	1
402	PROTOCOL	1
403	LIMIT SETTING	1
404	INVESTIGATION OF INCIDENTS	1
405	DEAL TRADE CAPTURE	1
406	INTERNATIONAL MONEY TRANSFER OPERATORS(IMTO)	1
407	CUSTOMERS INVESTMENT (NGN)	1
408	CONTRACTS/AGREEMENT REVIEWS	1
409	SHIPPING DOCUMENTS AND RISK ASSESSMENT REPORT (RAR) PROCESSING	1
410	EXPORT PROCESSING	1
411	BILLS FOR COLLECTION	1
412	FILING, DISPATCH AND ARCHIVING	1
413	RETURNS AND RECONCILIATION	1
414	FORM A PROCESSING	1
415	SME - INVISIBLE FX TRANSACTION	1
416	RECONCILE ACCOUNTS WHEN NECESSARY	1
417	DOCUMENT DISPOSAL	1
418	CREDIT CARD	1
419	OUTWARD NEFT	1
420	LIMITS MAINTENANCE	1
421	CAPTURE COMPLAINTS DETAILS FOR EXCESS CHARGES	1
422	COLLATERAL LODGEMENT	1
423	PROCUREMENT AND STORE MANAGEMENT	1
424	FLEET MANAGEMENT	1
425	PROCUREMENT	1
426	BUILDING/BRANCH DEVELOPMENT	1
427	STOP PAYMENT ORDER	1
428	MANAGER�S CHEQUES (MC)/BANK DRAFTS ISSUED	1
429	DEPOSIT INVESTMENTS	1
430	BTA/PTA PROCESSING	1
431	CREDIT CHECK ON CREDIT BUREAU PORTAL	1
432	VARIOUS STATE COLLECTION	1
433	PRODUCT MARKETING AND ADVERTISING	1
434	FOREIGN EXCHANGE (FX) MOBILIZATION AND DISPOSAL	1
435	UNAUTHORIZED OVERDRAWN ACCOUNT REVIEW	1
436	CASH SWAP WITH OTHER BANKS	1
437	MONTHLY CASH COUNT	1
438	VENDOR PAYMENT	1
439	MANAGER�S CHEQUE LIQUIDATION	1
440	REMITA RECONCILIATION	1
441	DEBIT INTEREST MAINTENANCE	1
442	MAINTENANCE OF BANK AUTHORIZES SIGNATORIES	1
443	SECURITY	1
444	INTERNET BANKING ACCESS	1
445	DISPUTE AND ACQUIRING	1
446	POS/WEB TERMINALS FAILED/DECLINE TRANSACTIONS	1
447	ETRANZACT CORPAY/TRANSFER	1
448	NIBSS INSTANT PAYMENT (NIP) [OUT GOING]	1
449	STAFF RETURNED CHEQUES REPORT	1
450	CUSTOMER COMPLAINTS	1
451	CHEQUE CLEARING (INWARD AND OUTWARD)	1
452	WESTERN UNION MONEY TRANSFER (WUMT)/MONEY GRAM (MG)	1
453	ACCOUNT PROOFS AND RECONCILIATION	1
454	BRANCH SECURITY	1
455	FIXED ASSETS REGISTER	1
456	FIRS COLLECTION	1
457	EVENT MANAGEMENT	1
458	CREDIT DISBURSEMENT	1
459	AUTOMATION AND QA	1
460	DOMICILIARY INFLOW PROCESSING	1
461	OUTWARD REAL TIME GROSS SETTLEMENT (RTGS)	1
462	CUSTOMERS INVESTMENT	1
501	Overdrawn Transactions	1
502	PEP Accounts	1
481	TRANSACTION REVIEW	1
7743	personal clearing	1
1	personal clearing	1
2	personal	1
4	personal	1
5	test name	1
6	test name	1
7	uche test	1
8	uche test	1
9	leonard leonard leonard	1
10	leonard leonard leonard	1
11	leonard leonard leonard	1
12	leonard leonard leonard	1
13	leonard leonard leonard	1
14	leonard leonard leonard	1
15	TEST Process	1
16	ACCOUNT	1
350	ACCOUNT	1
\.


--
-- Data for Name: exception_status; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.exception_status (id, name, description) FROM stdin;
1	Open	Open
2	Close	Closed
\.


--
-- Data for Name: exceptions_logs; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.exceptions_logs (id, user_id, title, rating_id, event_date, category_id, status_id, cases_action, created_at, rule_id, transaction_id, process_id, staff_id, team_id, alert_id, closed_date, direct_supervisor, group_head, divisional_head, close_remarks, attachment, attachment_mime_type, attachment_last_updated, attachment_filename, attachment_charset, response_note, customer_id, exception_process_id, cases_description, tran_id) FROM stdin;
429	43	Faulty Laptop	3	21-SEP-22 01.00.00.000000000 AM	1	2	Two laptops are faulty in the IT department	21-SEP-22 01.14.15.276945000 PM	\N	\N	378	3001	94	392	21-SEP-22 01.14.15.276945000 PM	3495	3176	3474	Done	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	\N	\N
4436	\N	\N	3	09-NOV-22 01.00.00.000000000 AM	1	1	\N	11-NOV-22 06.23.30.199363000 PM	\N	\N	378	2985	44	439	11-NOV-22 06.23.30.199363000 PM	2985	2984	2984	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Faulty Laptop	\N
6436	\N	AML Improperly Done	1	03-FEB-23 01.00.00.000000000 AM	1	2	Kindly treat	03-FEB-23 11.35.52.712233000 AM	\N	\N	275	2989	43	459	03-FEB-23 11.35.52.712233000 AM	3009	3005	\N	Issue resolved	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	\N	\N
424	43	Account Opened with Incomplete Documentation	1	19-SEP-22 01.00.00.000000000 AM	1	1	Please provide evidence of complete documentation	19-SEP-22 09.41.18.055413000 AM	\N	\N	311	3532	71	386	21-SEP-22 09.41.18.055413000 AM	3021	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	\N	\N
428	43	Missing Customer KYC	1	21-SEP-22 01.00.00.000000000 AM	1	1	A PEP customer has an account with no KYC	21-SEP-22 01.01.02.195569000 PM	\N	\N	378	3010	\N	391	21-SEP-22 01.01.02.195569000 PM	3204	3495	3204	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Please treat as urgent	\N
436	\N	No email indemnity instruction	1	28-SEP-22 01.00.00.000000000 AM	1	2	Please provide details	28-SEP-22 12.19.32.781376000 PM	\N	\N	281	3236	44	401	28-SEP-22 12.19.32.781376000 PM	2981	\N	\N	Case has been  resolved	[unsupported data type]	application/pdf	\N	101domain.com Order Confirmation 101CM-o1334583_archsolveltd.com.pdf	\N	\N	\N	\N	Please provide additional details	\N
437	\N	Test case	1	28-SEP-22 01.00.00.000000000 AM	1	2	Test action	28-SEP-22 01.23.17.863338000 PM	\N	\N	265	2984	43	402	28-SEP-22 01.23.17.863338000 PM	2982	\N	\N	Test remarks	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Please provide additional details	\N
438	\N	Incomplete account opened	1	28-SEP-22 01.00.00.000000000 AM	1	1	Please provide evidence of full compliance	28-SEP-22 01.50.57.495476000 PM	\N	\N	311	2982	\N	403	28-SEP-22 01.50.57.495476000 PM	2983	\N	\N	\N	[unsupported data type]	application/pdf	\N	101domain.com Order Confirmation 101CM-o1334583_archsolveltd.com.pdf	\N	\N	\N	\N	\N	\N
4435	\N	\N	4	11-NOV-22 01.00.00.000000000 AM	1	2	\N	11-NOV-22 06.22.20.673476000 PM	\N	\N	264	2986	43	438	11-NOV-22 06.22.20.673476000 PM	2985	2984	2983	Done	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Faulty Fan	\N
4437	\N	\N	3	11-NOV-22 01.00.00.000000000 AM	1	1	\N	11-NOV-22 06.26.17.393154000 PM	\N	\N	378	\N	\N	440	11-NOV-22 06.26.17.393154000 PM	2981	2981	2982	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Faulty Air conditioner	\N
6435	\N	CABLES NOT PROPERLY TRUNCkED	1	03-FEB-23 01.00.00.000000000 AM	1	2	PLEASE TREAT	03-FEB-23 11.19.55.524888000 AM	\N	\N	282	2986	102	458	03-FEB-23 11.19.55.524888000 AM	2982	2986	\N	Issue resolved	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	\N	\N
23	43	Dirty Floor	1	20-SEP-22 01.00.00.000000000 AM	1	2	Clean up banking hall	20-SEP-22 01.00.00.000000000 AM	2	222	16004	2	\N	43	\N	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Banking Hall is dirty	\N
41	43	Spoilt AC	3	04-APR-22 01.00.00.000000000 AM	1	1	1	04-APR-22 01.00.00.000000000 AM	\N	\N	13361	1	1	\N	\N	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Repair AC	\N
44	43	Insecurity	1	27-APR-22 01.00.00.000000000 AM	1	2	Securrity Personnel Needed	\N	\N	\N	16002	1	1	14	\N	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	No security at the Reception	\N
62	43	Insecurtiy	3	28-APR-22 01.00.00.000000000 AM	1	1	Report to CSO	\N	\N	\N	16002	1	1	23	\N	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	No Security at banking hall	\N
301	43	Bad Internet	1	14-JUN-22 12.00.00.000000000 AM	1	1	Test Exception	\N	\N	\N	16004	2488	47	262	14-JUN-22 10.09.40.450367000 AM	1	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Test Exception	\N
362	43	Dirty Uniforms (Test)	1	21-JUN-22 12.00.00.000000000 AM	1	1	Dirty Uniforms (Test)	21-JUN-22 10.16.13.568439000 AM	\N	\N	16004	2488	75	322	21-JUN-22 10.16.13.568439000 AM	2585	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Dirty Uniforms (Test)	\N
404	43	Test Exception with attachment	1	06-JUL-22 12.00.00.000000000 AM	1	1	Test Exception with attachment	06-JUL-22 11.36.01.495322000 AM	\N	\N	16004	2488	\N	364	06-JUL-22 11.36.01.495322000 AM	2361	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Test Exception with attachment	\N
484	\N	Demo	4	26-AUG-22 01.00.00.000000000 AM	1	2	Demo	26-AUG-22 10.31.48.439500000 PM	\N	\N	378	1	\N	444	26-AUG-22 10.31.48.439500000 PM	2	2585	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	\N	\N
63	43	Dirty Toilet	1	28-APR-22 01.00.00.000000000 AM	1	2	Janitor Needed	\N	\N	\N	16002	1	1	24	\N	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Messy Floor	\N
64	43	Unofficial Dressing	1	28-APR-22 01.00.00.000000000 AM	1	2	Sanction defaulter	\N	\N	\N	16002	1	1	25	\N	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Casual Dressing on a Wednesday	\N
181	43	Dirty Floor	1	16-MAY-22 12.00.00.000000000 AM	1	2	Test Case	\N	\N	\N	15997	1	1	141	16-MAY-22 11.09.20.719418000 AM	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Test Case	\N
503	\N	Faulty Airconditioner in Ojodu Office	1	31-AUG-22 01.00.00.000000000 AM	1	2	Please ensure equipment is fixed	31-AUG-22 02.06.23.266840000 PM	\N	\N	282	1	\N	463	31-AUG-22 02.06.23.266840000 PM	2585	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Kindly treat as urgent	\N
282	43	Another Test Exception	1	10-JUN-22 12.00.00.000000000 AM	1	1	Another Test Exception	\N	\N	\N	16004	2628	44	242	10-JUN-22 03.30.08.290334000 PM	2585	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Another Test Exception please ignore	\N
361	43	Broken Glass (Test)	1	21-JUN-22 12.00.00.000000000 AM	1	1	Broken Glass (Test)	21-JUN-22 09.51.51.789771000 AM	\N	\N	16004	1	1	321	21-JUN-22 09.51.51.789771000 AM	2585	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Broken Glass (Test)	\N
523	\N	Favour iyke test	1	09-SEP-22 01.00.00.000000000 AM	1	2	Kindly treat	09-SEP-22 01.44.47.107426000 PM	\N	\N	378	2513	102	483	09-SEP-22 01.44.47.107426000 PM	2879	2800	2879	Test	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Kinfly test	\N
524	\N	This is favour Iyke's TEst	2	09-SEP-22 01.00.00.000000000 AM	1	2	Please Treat	09-SEP-22 02.07.08.894678000 PM	\N	\N	378	2800	\N	484	09-SEP-22 02.07.08.894678000 PM	2800	2879	\N	It's okay	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Kinfly test	\N
525	\N	TestTest	3	09-SEP-22 01.00.00.000000000 AM	1	2	TestTest	09-SEP-22 04.18.50.142886000 PM	\N	\N	378	2800	\N	485	09-SEP-22 04.18.50.142886000 PM	2879	2800	2800	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Kinfly test	\N
527	\N	So test	3	09-SEP-22 01.00.00.000000000 AM	1	1	So test	09-SEP-22 04.54.52.224468000 PM	\N	\N	378	2513	\N	487	09-SEP-22 04.54.52.224468000 PM	2800	2800	2879	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	\N	\N
61	43	Over Crowding	1	28-APR-22 01.00.00.000000000 AM	1	2	Security / Crowd Control Needed	\N	\N	\N	16002	2	1	22	\N	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Banking Hall too Crowded	\N
281	43	Test Exception with attachment	1	10-JUN-22 12.00.00.000000000 AM	1	1	Test Exception	\N	\N	\N	16004	2488	44	241	10-JUN-22 03.10.28.844995000 PM	2585	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Nothing serious just testing	\N
310	43	Leaking Sink (Please ignore)	1	26-JUN-22 12.00.00.000000000 AM	1	1	Leaking Sink (Please ignore)	\N	\N	\N	16004	1	1	271	14-JUN-22 05.52.53.381215000 PM	2	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Leaking Sink (Please ignore)	\N
321	43	Broken Tile (Please ignore)	1	15-JUN-22 12.00.00.000000000 AM	1	1	Broken Tile (Please ignore)	\N	\N	\N	16004	1	1	281	15-JUN-22 10.58.24.390345000 AM	2488	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Broken Tile (Please ignore)	\N
26	43	Test form	1	26-APR-22 01.00.00.000000000 AM	1	1	do nothing	\N	\N	\N	13362	1	1	\N	\N	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	test	\N
43	43	Over Crowding	1	27-APR-22 01.00.00.000000000 AM	1	2	Security / Crowd Control Needed	\N	\N	\N	13360	2	1	13	\N	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Banking Hall too Crowded	\N
81	43	Bad Chairs	1	05-MAY-22 01.00.00.000000000 AM	1	2	Replacements Needed	\N	\N	\N	16005	2	1	43	\N	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Bad Chairs that need replacement	\N
101	43	Broken Glass	1	04-MAY-22 01.00.00.000000000 AM	1	2	Replace Immediately	\N	\N	\N	16005	1	1	61	\N	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Third Floor	\N
103	43	Wet Floor (test)	1	06-MAY-22 01.00.00.000000000 AM	1	2	Get the janitor	\N	\N	\N	16005	1	1	63	\N	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	internal control office	\N
104	43	Dirty Floor	1	06-MAY-22 01.00.00.000000000 AM	1	2	Get the Cleaner	\N	\N	\N	16005	1	1	64	11-MAY-22 01.00.00.000000000 AM	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	First floor is dirty	\N
161	43	A New Test	1	13-MAY-22 12.00.00.000000000 AM	1	2	A New Test	\N	\N	\N	15997	1	44	121	13-MAY-22 10.44.47.937937000 AM	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	We are just testing	\N
164	43	Test Exception case	1	13-MAY-22 12.00.00.000000000 AM	1	2	Test Exception	\N	\N	\N	15997	1	44	126	13-MAY-22 02.13.16.397441000 PM	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Test Exception	\N
10435	\N	Staff Resumed Late fir Work	2	23-MAR-23 12.00.00.000000000 AM	1	2	Please address this issue	23-MAR-23 01.08.14.771609000 PM	\N	\N	278	4829	101	498	23-MAR-23 01.08.14.771609000 PM	4833	4830	\N	Issue has been resolved	[unsupported data type]	application/pdf	\N	API USSD V2.3.2 (EN)(1).pdf	\N	\N	\N	\N	\N	\N
18436	182	ACCOUNT OPENED WITH INCOMPLETE DOCUMENTATION	1	13-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	13-APR-23 08.52.14.975346000 AM	\N	\N	350	4833	101	579	13-APR-23 08.52.14.975346000 AM	4830	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	<p>Treated</p>	\N	\N	<p>Please treat&nbsp,</p>	\N
24436	43	WRONG CHARGES TAKEN	1	17-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	17-APR-23 03.57.27.043302000 PM	\N	\N	262	4833	\N	639	17-APR-23 03.57.27.043302000 PM	4833	4836	4835	\N	[unsupported data type]	\N	\N	\N	\N	<p>checked and updated</p>	123	\N	<p>Check Audit</p>	\N
28436	43	DOCUMENTATION	1	17-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	17-APR-23 09.37.50.141909000 PM	\N	\N	261	4833	62	679	17-APR-23 09.37.50.141909000 PM	4836	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	<p>checked and confirmed cleared</p>	102	\N	<p>testing link</p>	ert3466353546
30435	43	CHEQUE PAID BUT NOT CONFIRMED.	2	18-APR-23 12.00.00.000000000 AM	1	2	Please review and ensure compliance	18-APR-23 09.00.17.193624000 AM	\N	\N	261	4833	101	698	18-APR-23 09.00.17.193624000 AM	4829	4831	\N	Handled	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	<p>Please treat</p>	\N
30437	43	WRONG CHARGES TAKEN	2	18-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	18-APR-23 09.40.50.972937000 AM	\N	\N	262	4836	101	700	18-APR-23 09.40.50.972937000 AM	4833	4831	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	<p>Please treat</p>	\N
32435	43	DOCUMENTATION	1	18-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	18-APR-23 05.20.32.296489000 PM	\N	\N	262	4833	60	718	18-APR-23 05.20.32.296489000 PM	4829	4836	5469	\N	[unsupported data type]	\N	\N	\N	\N	<p>checking</p>	\N	\N	<p>please revert</p>	\N
34435	43	WRONG CHARGES TAKEN	1	18-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	18-APR-23 11.33.28.639297000 PM	\N	\N	262	4833	60	739	18-APR-23 11.33.28.639297000 PM	4836	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	<p>confirming response mail initiator</p>	\N	\N	<p>To be checked</p>	\N
36435	43	DUPLICATE TRANSACTION	2	19-APR-23 12.00.00.000000000 AM	1	2	Please review and ensure compliance on process	19-APR-23 12.38.33.257595000 PM	\N	\N	267	4833	44	760	19-APR-23 12.38.33.257595000 PM	4836	4829	\N	resolved	[unsupported data type]	\N	\N	\N	\N	\N	2200217	\N	<p>Check compliance</p>	TRA632464634
36436	43	NO HOP/CASH OFFICER APPROVAL FOR PAYMENT ABOVE TELLER LIMIT	1	19-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	19-APR-23 03.42.43.803682000 PM	\N	\N	264	4833	44	780	19-APR-23 03.42.43.803682000 PM	4829	\N	\N	\N	[unsupported data type]	application/vnd.oasis.opendocument.text	\N	API USSD V2.3.2 (EN) (1).odt	\N	<p>Resolved successfully.</p>	6726820	\N	<p>&nbsp,Check compliance</p>	\N
38435	43	ATM ISSUED TO WRONG CUSTOMER WITH SAME NAME	2	19-APR-23 12.00.00.000000000 AM	1	2	Please review and rectify	20-APR-23 08.40.55.279054000 AM	\N	\N	371	4833	105	801	20-APR-23 08.40.55.279054000 AM	4835	4829	\N	Thank you	[unsupported data type]	application/pdf	\N	IComply Enhancements_221001_113307.pdf	\N	<p>Customers has been contacted, card deactivated</p>	1019788	\N	<p>Both appeared to have requested for ATM card within a week</p>	ATM71345362423
38436	43	ATM ISSUED TO WRONG CUSTOMER WITH SAME NAME	2	19-APR-23 12.00.00.000000000 AM	1	2	Please review and resolved	20-APR-23 09.11.08.942812000 AM	\N	\N	371	4833	67	802	20-APR-23 09.11.08.942812000 AM	4836	4829	\N	Thank you for fixing	[unsupported data type]	application/vnd.oasis.opendocument.text	\N	API USSD V2.3.2 (EN) (1) (1).odt	\N	<p>Customer contacted with due respect</p>	14378542	\N	<p>Both appeared to have requested for ATM card within two week</p>	ATM16343457
38437	43	NO HOP/CASH OFFICER APPROVAL FOR PAYMENT ABOVE TELLER LIMIT of 100000	2	18-APR-23 12.00.00.000000000 AM	1	2	Please review and ensure compliance	20-APR-23 09.57.56.864454000 AM	\N	\N	264	4836	43	803	20-APR-23 09.57.56.864454000 AM	4833	4829	\N	Noted	[unsupported data type]	\N	\N	\N	\N	<p>Case Settled Currently</p>	10316834	\N	<p>Kindly handle</p>	CAS6745264129
38438	43	AMOUNT MISMATCH	1	20-APR-23 12.00.00.000000000 AM	1	2	Please review	20-APR-23 09.38.45.926869000 PM	\N	\N	263	5469	104	818	20-APR-23 09.38.45.926869000 PM	4835	4836	4833	Case Sorted out	[unsupported data type]	\N	\N	\N	\N	\N	2082713	\N	<p>please respond</p>	\N
40435	81	AMOUNT MISMATCH	1	22-APR-23 12.00.00.000000000 AM	1	2	Please review and ensure compliance	22-APR-23 09.43.39.304939000 AM	\N	\N	263	4836	\N	878	22-APR-23 09.43.39.304939000 AM	5469	\N	\N	checking initiator	[unsupported data type]	\N	\N	\N	\N	\N	2082713	\N	<p>Please treat</p>	\N
42435	101	NO HOP/CASH OFFICER APPROVAL FOR PAYMENT ABOVE TELLER LIMIT	1	24-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	24-APR-23 10.23.49.014710000 AM	\N	\N	264	4833	43	938	24-APR-23 10.23.49.014710000 AM	4835	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	96	\N	<p>The numbers are not matching the report submitted</p>	\N
42436	43	WRONG CHARGES TAKEN	1	24-APR-23 12.00.00.000000000 AM	1	2	Please review and ensure compliance	24-APR-23 10.26.41.182987000 AM	\N	\N	262	4833	101	939	24-APR-23 10.26.41.182987000 AM	4837	\N	\N	fine	[unsupported data type]	\N	\N	\N	\N	\N	102	\N	<p>check status</p>	\N
44435	101	AMOUNT MISMATCH	2	25-APR-23 12.00.00.000000000 AM	1	2	Please review and ensure compliance	25-APR-23 08.24.10.920710000 AM	\N	\N	263	4836	60	962	25-APR-23 08.24.10.920710000 AM	4835	4837	\N	checked	[unsupported data type]	application/vnd.oasis.opendocument.text	\N	API USSD V2.3.2 (EN) (1) (1) (1).odt	\N	\N	96	\N	<p>Check alert template</p>	TRA2845672487
44436	101	DOCUMENTATION	1	25-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	25-APR-23 09.47.10.510176000 AM	\N	\N	261	4836	44	978	25-APR-23 09.47.10.510176000 AM	4834	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	111	\N	<p>Check and confirm</p>	\N
44437	43	NO EMAIL INDEMNITY INSTRUCTION	2	24-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	25-APR-23 10.52.46.997816000 AM	\N	\N	281	4833	44	998	25-APR-23 10.52.46.997816000 AM	4836	4829	\N	\N	[unsupported data type]	application/vnd.oasis.opendocument.text	\N	API USSD V2.3.2 (EN) (1) (1) (1).odt	\N	\N	93	\N	<p>Check for email link</p>	\N
46435	43	CONFIRMATION PROCESS NOT SATISFACTORY	2	23-APR-23 12.00.00.000000000 AM	1	2	Please review and ensure compliance	25-APR-23 08.29.10.128732000 PM	\N	\N	300	4833	44	1018	25-APR-23 08.29.10.128732000 PM	4837	4836	\N	Thank you	[unsupported data type]	text/csv	\N	EFZ_ACCOUNT_DEN_POC (1).csv	\N	<p>noted</p>	111	\N	<p>Ensure all documents are completed</p>	TRA23567957342
165	43	Test Exception new	1	13-MAY-22 12.00.00.000000000 AM	1	2	Test Exception new	\N	\N	\N	15997	1	44	127	13-MAY-22 02.58.37.619574000 PM	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Test Exception new	\N
166	43	Test case exception	1	13-MAY-22 12.00.00.000000000 AM	1	2	Test case exception	\N	\N	\N	15997	1	44	128	13-MAY-22 04.05.40.982121000 PM	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Test case exception	\N
167	43	Ignore Test	1	13-MAY-22 12.00.00.000000000 AM	1	2	Ignore Test	\N	\N	\N	15997	1	44	129	13-MAY-22 04.08.20.764026000 PM	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Ignore Test	\N
201	43	Bad Internet	1	17-MAY-22 12.00.00.000000000 AM	1	2	Test Exception	\N	\N	\N	16005	1	\N	161	17-MAY-22 01.25.36.754451000 PM	2	2488	1	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Test Exception	\N
423	\N	Test Exception	1	23-AUG-22 12.00.00.000000000 AM	1	1	Ignore	23-AUG-22 12.00.56.145795000 PM	\N	\N	148	2	\N	383	23-AUG-22 12.00.56.145795000 PM	2	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Ignore	\N
342	43	Dirty Floor (Test)	1	17-JUN-22 12.00.00.000000000 AM	1	1	No Action	17-JUN-22 01.38.57.813627000 PM	\N	\N	16004	2410	44	302	17-JUN-22 01.38.57.813627000 PM	1	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Dirty Floor (Test)	\N
463	\N	Test Case	1	26-AUG-22 01.00.00.000000000 AM	1	1	Example CAse	26-AUG-22 11.05.33.534267000 AM	\N	\N	51	1	\N	423	26-AUG-22 11.05.33.534267000 AM	1	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Additional Notes	\N
483	\N	Test	2	26-AUG-22 01.00.00.000000000 AM	1	2	Test	26-AUG-22 10.18.45.754170000 PM	\N	\N	378	2	\N	443	26-AUG-22 10.18.45.754170000 PM	1	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	\N	\N
265	43	Test email with attachment	1	24-MAY-22 12.00.00.000000000 AM	1	1	Test email with attachment	\N	\N	\N	16004	2	44	230	24-MAY-22 03.46.34.015341000 PM	1	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Test email with attachment	\N
266	43	test attachment mail two	1	24-MAY-22 12.00.00.000000000 AM	1	1	test attachment mail two	\N	\N	\N	16004	1	1	231	24-MAY-22 05.28.19.202274000 PM	2	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	test attachment mail two	\N
305	43	Broken Extingusher (Please ignore)	1	14-JUN-22 12.00.00.000000000 AM	1	1	Broken Extingusher (Please ignore)	\N	\N	\N	16004	1	75	266	14-JUN-22 01.07.11.533627000 PM	2488	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Broken Extingusher (Please ignore)	\N
485	\N	TEsting	1	26-AUG-22 01.00.00.000000000 AM	1	1	Testing	26-AUG-22 10.32.45.110694000 PM	\N	\N	378	2800	\N	445	26-AUG-22 10.32.45.110694000 PM	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	\N	\N
487	\N	Test	4	26-AUG-22 01.00.00.000000000 AM	1	2	Test	26-AUG-22 10.42.14.908369000 PM	\N	\N	378	2360	\N	447	26-AUG-22 10.42.14.908369000 PM	1	2485	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	\N	\N
21	43	Over Crowding	1	26-APR-22 01.00.00.000000000 AM	1	1	Security / Crowd Control Needed	\N	\N	\N	15997	2	\N	\N	\N	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Banking Hall too Crowded	\N
24	43	Over Crowding	1	20-APR-22 01.00.00.000000000 AM	1	1	Security / Crowd Control Needed	26-APR-22 01.00.00.000000000 AM	1	1	13364	2	\N	\N	\N	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Banking Hall too Crowded	\N
25	43	Over Crowding	1	26-APR-22 01.00.00.000000000 AM	1	1	Security / Crowd Control Needed	\N	\N	\N	15997	2	1	\N	\N	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Banking Hall too Crowded	\N
27	43	Over Crowding	1	26-APR-22 01.00.00.000000000 AM	1	1	Security / Crowd Control Needed	\N	\N	\N	13348	2	1	\N	\N	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Banking Hall too Crowded	\N
28	43	Over Crowding	1	26-APR-22 01.00.00.000000000 AM	1	1	Security / Crowd Control Needed	\N	\N	\N	13349	2	1	\N	\N	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Banking Hall too Crowded	\N
29	43	Tunde didnt flush	3	26-APR-22 01.00.00.000000000 AM	1	1	He must flush	\N	\N	\N	13362	1	1	\N	\N	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Tunde didnt flush	\N
30	43	Over Crowding	1	26-APR-22 01.00.00.000000000 AM	1	1	Security / Crowd Control Needed	\N	\N	\N	15997	2	1	\N	\N	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Banking Hall too Crowded	\N
31	43	Over Crowding	1	26-APR-22 01.00.00.000000000 AM	1	1	Security / Crowd Control Needed	\N	\N	\N	13353	2	1	\N	\N	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Banking Hall too Crowded	\N
42	43	Tobi is a Foodie	3	05-APR-22 01.00.00.000000000 AM	1	1	Starve him for days, Make Fasting compulsory	\N	\N	\N	\N	1	2	\N	\N	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	The way He eats is scary	\N
45	43	Over Crowding	1	27-APR-22 01.00.00.000000000 AM	1	2	Security / Crowd Control Needed	\N	\N	\N	16002	2	1	15	\N	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Banking Hall too Crowded	\N
46	43	Over Crowding	1	27-APR-22 01.00.00.000000000 AM	1	2	Security / Crowd Control Needed	\N	\N	\N	16002	2	1	16	\N	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Banking Hall too Crowded	\N
47	43	Over Crowding	1	27-APR-22 01.00.00.000000000 AM	1	2	Security / Crowd Control Needed	\N	\N	\N	16002	2	1	17	\N	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Banking Hall too Crowded	\N
264	43	Test Attachment2	1	24-MAY-22 12.00.00.000000000 AM	1	1	Test Attachment2	\N	\N	\N	16004	2	44	229	24-MAY-22 03.08.48.293261000 PM	1	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Test Attachment	\N
304	43	Broken Extingusher Test	1	14-JUN-22 12.00.00.000000000 AM	1	1	Broken Extingusher Test	\N	\N	\N	16004	1	75	265	14-JUN-22 01.05.23.009254000 PM	2	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Broken Extingusher Test	\N
309	43	Leaking Sink (Please ignore)	1	14-JUN-22 12.00.00.000000000 AM	1	1	Leaking Sink (Please ignore)	\N	\N	\N	16004	1	1	270	14-JUN-22 05.49.18.838407000 PM	2	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Leaking Sink (Please ignore)	\N
341	43	Unofficial Dressing	3	17-JUN-22 12.00.00.000000000 AM	1	1	Replacement Immediately	\N	\N	\N	16004	2410	1	301	17-JUN-22 10.56.42.031591000 AM	1	2410	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Wearing Unofficial dressing on a monday	\N
443	\N	Test Exception	1	23-AUG-22 12.00.00.000000000 AM	1	1	Test Exception	23-AUG-22 06.21.22.211578000 PM	\N	\N	148	1	\N	407	23-AUG-22 06.21.22.211578000 PM	1	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Test Exception	\N
486	\N	Testing	3	26-AUG-22 01.00.00.000000000 AM	1	2	Testing	26-AUG-22 10.34.22.593230000 PM	\N	\N	378	2879	\N	446	26-AUG-22 10.34.22.593230000 PM	2	1	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	\N	\N
488	\N	Test	3	26-AUG-22 01.00.00.000000000 AM	1	2	Test	26-AUG-22 10.45.12.083941000 PM	\N	\N	378	2360	\N	448	26-AUG-22 10.45.12.083941000 PM	2	1	2585	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	\N	\N
427	43	Faulty Air Conditioner	3	21-SEP-22 01.00.00.000000000 AM	1	2	The AC on the second floor, wing C	21-SEP-22 12.59.56.679756000 PM	\N	\N	378	3417	41	390	21-SEP-22 12.59.56.679756000 PM	3236	3315	3553	Nothign to report	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Please treat as urgent	\N
431	43	Implete documentation	2	21-SEP-22 01.00.00.000000000 AM	1	1	Kindly treat	21-SEP-22 03.04.55.466615000 PM	\N	\N	311	3236	71	394	21-SEP-22 03.04.55.466615000 PM	2982	2983	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Pleae check for correctness	\N
434	43	Missing Email	1	27-SEP-22 01.00.00.000000000 AM	1	1	Kindly provide response	27-SEP-22 07.54.21.506524000 PM	\N	\N	281	2983	43	397	27-SEP-22 07.54.21.506524000 PM	3002	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Kindly provide details	\N
435	43	Amount Mismatch	1	27-SEP-22 01.00.00.000000000 AM	1	2	Please treat	27-SEP-22 08.13.32.925618000 PM	\N	\N	269	2983	\N	400	27-SEP-22 08.13.32.925618000 PM	2982	\N	\N	All good	[unsupported data type]	application/pdf	\N	16AL31.pdf	\N	\N	\N	\N	Please explain further	\N
430	43	KYC Not Done	2	21-SEP-22 01.00.00.000000000 AM	1	1	Please review and revert	21-SEP-22 01.24.45.137773000 PM	\N	\N	311	2981	\N	393	21-SEP-22 01.24.45.137773000 PM	2982	2984	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Pleae check for correctness	\N
2435	\N	\N	2	10-NOV-22 01.00.00.000000000 AM	1	2	Faulty chairs	10-NOV-22 02.45.26.827131000 PM	\N	\N	378	2985	104	418	10-NOV-22 02.45.26.827131000 PM	2981	2981	2982	Solved	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Urgently	\N
8435	\N	Undeclared Assets by Teller	2	22-MAR-23 12.00.00.000000000 AM	1	1	Please crosscheck and revert	22-MAR-23 01.41.31.236283000 PM	\N	\N	298	4829	101	478	22-MAR-23 01.41.31.236283000 PM	4830	4831	\N	\N	[unsupported data type]	application/pdf	\N	LAPO PayAttitude Integration_v1.pdf	\N	\N	\N	\N	Treat as urgent	\N
12435	\N	Outstanding charges not taken	1	23-MAR-23 12.00.00.000000000 AM	1	2	Please treat	23-MAR-23 03.05.49.517146000 PM	\N	\N	275	4833	101	518	23-MAR-23 03.05.49.517146000 PM	4833	4829	4830	Resolved	[unsupported data type]	application/pdf	\N	API USSD V2.3.2 (EN)(1).pdf	\N	\N	\N	\N	\N	\N
163	43	Bad Internet	1	13-MAY-22 12.00.00.000000000 AM	1	2	Test Exception	\N	\N	\N	15997	1	44	124	13-MAY-22 02.11.35.410277000 PM	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Test Exception	\N
312	43	Dirty Office (Test)	1	14-JUN-22 12.00.00.000000000 AM	1	1	Dirty Office (Test)	\N	\N	\N	16004	1	1	273	14-JUN-22 05.58.40.083045000 PM	2488	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Dirty Office (Test)	\N
363	43	FX Transaction 1527 (test)	1	10-MAY-22 12.00.00.000000000 AM	1	1	Fee not taken (test)	23-JUN-22 05.19.00.437147000 PM	\N	\N	15998	1	1	323	23-JUN-22 05.19.00.437147000 PM	2585	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	BVN: 22180746925, Transaction Amount: 2500, Transaction Currency: USD	\N
384	43	Timestamp	3	17-JAN-22 12.00.00.000000000 AM	21	1	Timestamp	01-JUL-22 05.49.29.902550000 PM	\N	\N	16004	2	44	345	01-JUL-22 05.49.29.902550000 PM	1	2485	2488	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Event No: 153795, Initiated By: WSUSER, Transaction Amount: 1075, Transaction Currency: 566, Customer Name Debited: MUSTAPHA MIKAIL MUSA, Customer Account Number: 0002066577	\N
385	43	Amount in words and figures differs	3	17-JAN-22 12.00.00.000000000 AM	21	1	Ensure ticket is regularized	01-JUL-22 06.08.56.569666000 PM	\N	\N	16004	1	\N	346	01-JUL-22 06.08.56.569666000 PM	2626	2585	2578	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Event No: 228052, Initiated By: TAJOS1917, Transaction Amount: 5000, Transaction Currency: , Customer Name Debited: , Customer Account Number:	\N
526	\N	I'm Testing	2	09-SEP-22 01.00.00.000000000 AM	1	2	Test	09-SEP-22 04.27.43.542123000 PM	\N	\N	378	2879	\N	486	09-SEP-22 04.27.43.542123000 PM	2768	2800	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Test	\N
121	43	In-Security exception	1	09-MAY-22 01.00.00.000000000 AM	1	2	test action	\N	\N	\N	16002	1	1	81	09-MAY-22 01.00.00.000000000 AM	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	test description	\N
307	43	Broken pipe (Please ignore)	1	14-JUN-22 12.00.00.000000000 AM	1	2	Broken pipe (Please ignore)	\N	\N	\N	16004	2488	21	268	14-JUN-22 05.23.04.889404000 PM	1	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Broken pipe (Please ignore)	\N
311	43	Dirty Office (Test)	1	14-JUN-22 12.00.00.000000000 AM	1	1	Dirty Office (Test)	\N	\N	\N	16004	1	1	272	14-JUN-22 05.55.37.350124000 PM	2488	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Dirty Office (Test)	\N
364	43	FX Transaction 1527 (test)	1	10-MAY-22 12.00.00.000000000 AM	1	1	FX Transaction 1527 (test)	23-JUN-22 05.47.14.282168000 PM	\N	\N	15998	1	75	324	23-JUN-22 05.47.14.282168000 PM	2585	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	BVN: 22180746925, Transaction Amount: 2500, Transaction Currency: USD, Product Type: PTA	\N
82	43	Broken Glass	1	05-MAY-22 01.00.00.000000000 AM	1	2	Replacement needed	\N	\N	\N	16005	1	1	44	\N	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	The Office glass was broken and needs replacement	\N
102	43	Wet Floor	1	06-MAY-22 01.00.00.000000000 AM	1	2	Get the janitor	\N	\N	\N	16005	2	1	62	\N	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Internal and control office 3rd floor	\N
141	43	Test exception	1	12-MAY-22 12.00.00.000000000 AM	1	2	Test action	\N	\N	\N	16005	1	21	101	12-MAY-22 11.57.01.205913000 AM	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Test description	\N
162	43	Bad Internet	1	13-MAY-22 12.00.00.000000000 AM	1	2	Test Exception	\N	\N	\N	15997	1	44	123	13-MAY-22 01.55.04.567004000 PM	\N	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Test Exception	\N
242	43	Bad Internet	1	19-MAY-22 12.00.00.000000000 AM	1	1	Test Exception	\N	\N	\N	16004	1	\N	202	19-MAY-22 10.47.20.323003000 AM	2	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Test Exception	\N
267	43	test attachment mail three	1	24-MAY-22 12.00.00.000000000 AM	1	2	test attachment mail three	\N	\N	\N	16004	1	1	232	24-MAY-22 05.37.23.562296000 PM	2488	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	test attachment mail three	\N
306	43	Broken Tile (Please ignore)	1	14-JUN-22 12.00.00.000000000 AM	1	1	Broken Tile (Please ignore)	\N	\N	\N	16004	1	47	267	14-JUN-22 01.38.39.757156000 PM	2488	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Broken Tile (Please ignore)	\N
403	43	Test Exception	1	06-JUL-22 12.00.00.000000000 AM	1	2	Test Exception	06-JUL-22 11.27.24.359741000 AM	\N	\N	16004	2361	\N	363	06-JUL-22 11.27.24.359741000 AM	2488	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Test Exception	\N
426	43	Bank closed earlier at 2pm earlier than expected	1	21-SEP-22 01.00.00.000000000 AM	1	2	Kindly review	21-SEP-22 12.53.49.619300000 PM	\N	\N	283	3532	\N	388	21-SEP-22 12.53.49.619300000 PM	3021	\N	\N	False alarm	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Pleae check for correctness	\N
432	43	Charges Not Taken	1	27-SEP-22 01.00.00.000000000 AM	1	2	Kindly provide details	27-SEP-22 05.48.46.782936000 PM	\N	\N	280	2986	43	395	27-SEP-22 05.48.46.782936000 PM	2981	\N	\N	done	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Kindly provide details	\N
425	43	BVN Validation Note done	1	21-SEP-22 01.00.00.000000000 AM	1	1	Documentation needs to be updated	21-SEP-22 12.51.45.075534000 PM	\N	\N	326	3528	62	387	21-SEP-22 12.51.45.075534000 PM	3526	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Pleae check for correctness	\N
433	43	SMS Alert no treated	1	27-SEP-22 01.00.00.000000000 AM	1	1	Kindly treat	27-SEP-22 07.43.12.668795000 PM	\N	\N	281	2985	60	396	27-SEP-22 07.43.12.668795000 PM	2984	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	Kindly provide details	\N
18439	182	ACCOUNT CLOSURE INSTRUCTION NOT FILLED	1	13-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	13-APR-23 08.55.13.436134000 AM	\N	\N	350	4836	\N	582	13-APR-23 08.55.13.436134000 AM	4835	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	<p>Please treat urgently. Just testing</p>	\N
18443	182	DIFFERENCE BTW BIN CARD BALANCE AND PHYSICAL BALANCE	1	13-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	13-APR-23 08.58.43.492364000 AM	\N	\N	266	4835	\N	586	13-APR-23 08.58.43.492364000 AM	4833	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	<p>Clear this always</p>	\N
18444	182	TRANSACTION REVIEW/CALLOVER	1	13-APR-23 12.00.00.000000000 AM	1	2	Please review and ensure compliance	13-APR-23 10.00.46.606265000 AM	\N	\N	481	4833	\N	587	13-APR-23 10.00.46.606265000 AM	4835	\N	\N	confirm mail when closed	[unsupported data type]	\N	\N	\N	\N	\N	138	\N	<p><strong>Transaction Details</strong>:&nbsp,<br>Trans. Ref:000004&nbsp,<br>Customer Credited:&nbsp,<br>Account Credited:&nbsp,<br>Customer Debited: GREEN WYLIE&nbsp,<br>Account Debited:&nbsp,<br>Tran. Date: 25-SEP-2019&nbsp,<br>Tran. Amt: <strong>8,000,000.00</strong><br>Narration: Online Payment|AAAxaJAAJAAAA0nAAB</p>	AAAxaJAAJAAAA0nAAB
12436	\N	Missing POS	1	23-MAR-23 12.00.00.000000000 AM	1	2	Kindly handle	23-MAR-23 04.13.31.271497000 PM	\N	\N	268	4833	41	519	23-MAR-23 04.13.31.271497000 PM	4833	\N	\N	Resolved	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	\N	\N
14435	\N	NO HOP/CASH OFFICER APPROVAL FOR PAYMENT ABOVE TELLER LIMIT	1	24-MAR-23 12.00.00.000000000 AM	1	2	Please review and ensure compliance	24-MAR-23 06.09.41.452018000 PM	\N	\N	264	4834	101	539	24-MAR-23 06.09.41.452018000 PM	4833	4830	4831	Resolved	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	\N	\N
16435	\N	CHEQUE NOT DESTROYED ON FINACLE AFTER USAGE	1	25-MAR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	25-MAR-23 11.40.45.089396000 AM	\N	\N	299	4835	101	558	25-MAR-23 11.40.45.089396000 AM	4830	4833	4829	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	<p>Kindly treat</p>	\N
18435	182	ACCOUNT CLOSURE INSTRUCTION NOT FILLED	1	13-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance extendable	13-APR-23 08.41.55.218400000 AM	\N	\N	350	4833	\N	578	13-APR-23 08.41.55.218400000 AM	4830	\N	\N	\N	[unsupported data type]	image/png	\N	Capture.PNG	\N	<p>still on it</p>	\N	\N	<p>Just testing this</p>	\N
18437	182	CHARGES NOT TAKEN	1	13-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	13-APR-23 08.54.03.923564000 AM	\N	\N	265	4835	\N	580	13-APR-23 08.54.03.923564000 AM	4833	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	<p>Please treat urgently</p>	\N
18441	182	ACCOUNT OPENED WITH INCOMPLETE DOCUMENTATION	2	13-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	13-APR-23 08.56.19.953043000 AM	\N	\N	350	4833	101	584	13-APR-23 08.56.19.953043000 AM	4830	4829	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	<p>Please treat urgently. Just testing</p>	\N
20435	81	DELAYED RESPONSE TO AUDIT  ENQUIRY/REQUEST	3	13-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	13-APR-23 12.57.16.768960000 PM	\N	\N	280	4836	60	598	13-APR-23 12.57.16.768960000 PM	4833	5363	5083	\N	[unsupported data type]	image/jpeg	\N	5460693.jpg	\N	\N	111	\N	<p>Just Testing</p>	\N
20436	43	TRANSACTION REVIEW/CALLOVER	1	13-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	13-APR-23 01.18.41.533561000 PM	\N	\N	481	4835	104	599	13-APR-23 01.18.41.533561000 PM	5083	5296	5296	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	\N	\N
22435	43	WRONG CHARGES TAKEN	2	14-APR-23 12.00.00.000000000 AM	1	2	Please review and ensure compliance	14-APR-23 01.07.39.740961000 PM	\N	\N	262	4833	101	618	14-APR-23 01.07.39.740961000 PM	4831	4830	\N	Issue resolved	[unsupported data type]	\N	\N	\N	\N	<p>resolved</p>	96	\N	<p><strong>Transaction Details</strong>:&nbsp,<br>Trans. Ref:000004&nbsp,<br>Customer Credited:&nbsp,<br>Account Credited:&nbsp,<br>Customer Debited: GREEN WYLIE&nbsp,<br>Account Debited:&nbsp,<br>Tran. Date: 25-SEP-2019&nbsp,<br>Tran. Amt:&nbsp,<br>Narration: Online Payment|AAAxaJAAJAAAA0nAAB</p>	\N
24435	43	NO RECORD OF POS RETRIEVED FROM VAULT FOR SET UP	1	17-APR-23 12.00.00.000000000 AM	1	1	Please review and provide update	17-APR-23 11.50.42.936566000 AM	\N	\N	268	4833	44	638	17-APR-23 11.50.42.936566000 AM	4833	4837	4836	\N	[unsupported data type]	\N	\N	\N	\N	<p>Attending to it</p>	\N	\N	<p>The numbers are not matching the report submitted</p>	\N
24437	43	NO HOP/CASH OFFICER APPROVAL FOR PAYMENT ABOVE TELLER LIMIT	2	17-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	17-APR-23 04.03.26.842693000 PM	\N	\N	264	4836	44	640	17-APR-23 04.03.26.842693000 PM	4833	4835	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	96	\N	<p>Kindly confirm teller status</p>	\N
24438	101	NO RECORD OF POS RETRIEVED FROM VAULT FOR SET UP	2	17-APR-23 12.00.00.000000000 AM	1	2	Please review and ensure compliance	17-APR-23 04.15.11.259932000 PM	\N	\N	268	4836	102	641	17-APR-23 04.15.11.259932000 PM	4833	4837	\N	handled	[unsupported data type]	\N	\N	\N	\N	\N	111	\N	<p>Kindly handle</p>	TID482346674
24439	101	DUPLICATE TRANSACTION	3	17-APR-23 12.00.00.000000000 AM	1	2	Please review and ensure compliance	17-APR-23 04.46.24.412947000 PM	\N	\N	267	4836	44	642	17-APR-23 04.46.24.412947000 PM	4833	4829	4830	resolved	[unsupported data type]	\N	\N	\N	\N	\N	113	\N	<p>Kindly confirm and revert</p>	TID8675484375
26435	101	SYSTEM FAILURE	3	17-APR-23 12.00.00.000000000 AM	1	2	Please review and ensure compliance	17-APR-23 06.03.58.695337000 PM	\N	\N	294	4833	94	658	17-APR-23 06.03.58.695337000 PM	5277	4837	4829	Thank you	[unsupported data type]	\N	\N	\N	\N	<p>issue with system fixed.</p>	96	\N	<p>Check card status and respond</p>	\N
26436	43	STORE REGISTER NOT UPDATED	1	17-APR-23 12.00.00.000000000 AM	1	2	Please review and ensure compliance	17-APR-23 06.23.54.140857000 PM	\N	\N	266	4833	44	659	17-APR-23 06.23.54.140857000 PM	4833	\N	\N	yes, response gotten but not via mail�i cant access novaji mail i mean	[unsupported data type]	\N	\N	\N	\N	<p>responding to case assigned to me. Kindly confirm mail of my response and close</p>	111	\N	<p>CHECK CARD STATUS</p>	TYR167434562
28435	43	STORE REGISTER NOT UPDATED	1	17-APR-23 12.00.00.000000000 AM	1	2	Please review and ensure compliance	17-APR-23 09.21.25.778478000 PM	\N	\N	266	4833	44	678	17-APR-23 09.21.25.778478000 PM	4836	\N	\N	done	[unsupported data type]	\N	\N	\N	\N	\N	84	\N	<p>check</p>	ytu346464357
28437	43	NO HOP/CASH OFFICER APPROVAL FOR PAYMENT ABOVE TELLER LIMIT	4	17-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	17-APR-23 10.02.21.800748000 PM	\N	\N	264	4833	44	680	17-APR-23 10.02.21.800748000 PM	4837	4834	4830	\N	[unsupported data type]	\N	\N	\N	\N	<p>Second mail confirmation</p>	96	\N	<p>Link test</p>	FTP2658542648
30436	43	NO HOP/CASH OFFICER APPROVAL FOR PAYMENT ABOVE TELLER LIMIT	2	18-APR-23 12.00.00.000000000 AM	1	2	Please review and ensure compliance	18-APR-23 09.07.43.894636000 AM	\N	\N	264	4833	101	699	18-APR-23 09.07.43.894636000 AM	4836	4829	4831	Noted	[unsupported data type]	\N	\N	\N	\N	<p>working on it</p>	\N	\N	<p>Please treat</p>	\N
30438	43	NO HOP/CASH OFFICER APPROVAL FOR PAYMENT ABOVE TELLER LIMIT	1	18-APR-23 12.00.00.000000000 AM	1	2	Please review and ensure compliance	18-APR-23 09.43.01.634213000 AM	\N	\N	264	4833	60	701	18-APR-23 09.43.01.634213000 AM	4829	4831	4830	done	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	<p>Please treat</p>	\N
30439	43	AMOUNT MISMATCH	1	18-APR-23 12.00.00.000000000 AM	1	2	Please review and ensure compliance	18-APR-23 09.50.56.326233000 AM	\N	\N	263	4833	101	702	18-APR-23 09.50.56.326233000 AM	4837	4835	4829	done	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	<p>Please treat&nbsp,</p>	\N
48437	43	AMOUNT MISMATCH	2	26-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	26-APR-23 08.27.27.408875000 AM	\N	\N	263	4836	104	1064	26-APR-23 08.27.27.408875000 AM	4836	4833	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	96	\N	<p>check all</p>	TRA85231481
30440	43	Testing Purpose	1	18-APR-23 12.00.00.000000000 AM	1	2	Please review and ensure compliance	18-APR-23 01.52.03.561084000 PM	\N	\N	481	4836	60	703	18-APR-23 01.52.03.561084000 PM	4833	4835	4831	handled successfully	[unsupported data type]	\N	\N	\N	\N	\N	84	\N	<p><strong>Transaction Details</strong>:&nbsp,<br>Trans. Ref:&nbsp,<br>Customer Credited:&nbsp,<br>Account Credited:&nbsp,<br>Customer Debited:&nbsp,<br>Account Debited:&nbsp,<br>Tran. Date:&nbsp,<br>Tran. Amt:&nbsp,<br>Narration:</p>	\N
32436	43	LONG OUTSTANDING BALANCE	1	18-APR-23 12.00.00.000000000 AM	1	2	Please review and ensure compliance	18-APR-23 10.58.45.746421000 PM	\N	\N	294	4833	\N	738	18-APR-23 10.58.45.746421000 PM	4836	\N	\N	Awaiting	[unsupported data type]	\N	\N	\N	\N	<p>will revert before cob</p>	\N	\N	<p>check status of cards</p>	\N
46439	101	AMOUNT MISMATCH	1	25-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	25-APR-23 10.33.36.900561000 PM	\N	\N	263	4833	43	1040	25-APR-23 10.33.36.900561000 PM	4836	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	119	\N	<p>check again</p>	\N
48447	43	INCOMPLETE TRANSACTION	2	26-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	26-APR-23 12.28.47.638393000 PM	\N	\N	261	4829	101	1078	26-APR-23 12.28.47.638393000 PM	4837	4831	\N	\N	[unsupported data type]	\N	\N	\N	\N	<p>thank you&nbsp,</p><p>&nbsp,</p>	\N	\N	<p>Kindly provide explanation</p>	\N
48435	101	NO HOP/CASH OFFICER APPROVAL FOR PAYMENT ABOVE TELLER LIMIT	2	26-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	26-APR-23 05.40.26.201346000 AM	\N	\N	264	4833	43	1062	26-APR-23 05.40.26.201346000 AM	4836	4835	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	<p>checking buttons</p>	\N
48448	43	WRONG CHARGES TAKEN	1	26-APR-23 12.00.00.000000000 AM	1	2	Please review and ensure compliance	26-APR-23 12.39.07.182316000 PM	\N	\N	262	4833	101	1079	26-APR-23 12.39.07.182316000 PM	4829	\N	\N	This is noted. Thanks	[unsupported data type]	\N	\N	\N	\N	<p>False Alert</p>	\N	\N	<p>Pleae respond</p>	\N
58436	11	WRONG/NO FILING	1	20-JUL-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	20-JUL-23 07.48.02.796094000 AM	\N	\N	263	5509	\N	1679	20-JUL-23 07.48.02.796094000 AM	5509	4836	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	84	\N	<p>case</p>	TRf44444
58437	11	STORE REGISTER NOT UPDATED	1	12-JUL-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	20-JUL-23 07.52.24.413510000 AM	\N	\N	266	5509	44	1680	20-JUL-23 07.52.24.413510000 AM	5277	\N	\N	\N	[unsupported data type]	image/png	\N	fix.png	\N	<p>am awaiting client feedback</p>	\N	\N	<p>check case</p>	ST3715185234825
60435	43	INCOMPLETE TRANSACTION	2	23-JUL-23 12.00.00.000000000 AM	1	2	Please review and revert	23-JUL-23 02.24.41.977104000 PM	\N	\N	264	5509	44	1698	23-JUL-23 02.24.41.977104000 PM	4836	4829	\N	Thank you	[unsupported data type]	image/png	\N	1xbetProgress.png	\N	<p>Customer contacted and resolved</p>	93	\N	<p><strong>Transaction Details</strong>:&nbsp,<br><br><strong>Process</strong> :Multiple Bill Payment transactions same day - ALERT2023220502000767837&nbsp,<br><br><strong>Event Date</strong> :22-MAY-2023 02:00AM&nbsp,<br><br><strong>Narration</strong> : Multiple Bill Payment transactions same day</p>	FT763458234
68435	43	AMOUNT MISMATCH	1	28-AUG-23 12.00.00.000000000 AM	1	1	please treat as very urgent	29-AUG-23 08.28.25.923877000 AM	\N	\N	265	5509	48	1778	29-AUG-23 08.28.25.923877000 AM	5277	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	\N	\N
70435	43	DELAYED RESPONSE TO AUDIT  ENQUIRY/REQUEST	1	10-SEP-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	17-SEP-23 08.07.58.279971000 PM	\N	\N	262	5509	102	1798	17-SEP-23 08.07.58.279971000 PM	4836	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	\N	\N
48438	43	WRONG CHARGES TAKEN	2	26-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	26-APR-23 09.14.30.136562000 AM	\N	\N	262	4836	\N	1065	26-APR-23 09.14.30.136562000 AM	4836	4833	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	111	\N	<p>Confirm</p>	TRAD17625438
48443	43	BOXED CASH REGISTER NOT MAINTAINED OR UPDATED	1	26-APR-23 12.00.00.000000000 AM	1	2	Please review and ensure compliance	26-APR-23 11.13.48.921097000 AM	\N	\N	301	4833	44	1070	26-APR-23 11.13.48.921097000 AM	4836	\N	\N	thank you	[unsupported data type]	application/pdf	\N	List of state governors of Nigeria 2019.pdf	\N	<p>resolved</p>	84	\N	<p>Kindly treat immediately</p>	ATM45629456754
48444	43	ATM ISSUED TO WRONG CUSTOMER WITH SAME NAME	2	25-APR-23 12.00.00.000000000 AM	1	1	Please review and resolved	26-APR-23 11.38.20.048397000 AM	\N	\N	371	4836	98	1071	26-APR-23 11.38.20.048397000 AM	4831	4835	\N	\N	[unsupported data type]	application/pdf	\N	Trends_and_Patterns_of_Online_Newspapers.pdf	\N	\N	166	\N	<p>Kindly treat immediately</p>	TD5967345245
48445	43	WRONG CHARGES TAKEN	1	26-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	26-APR-23 11.39.08.947387000 AM	\N	\N	262	4836	44	1072	26-APR-23 11.39.08.947387000 AM	4833	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	<p>Okay</p>	96	\N	<p>Kindly treat immediately</p>	\N
46437	101	CREDIT CARD CONTRACT	1	25-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	25-APR-23 10.14.26.685546000 PM	\N	\N	265	4833	101	1038	25-APR-23 10.14.26.685546000 PM	4837	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	96	\N	<p>check compliance</p>	try8467517234
50436	43	STORE REGISTER NOT UPDATED	1	28-APR-23 12.00.00.000000000 AM	1	1	Please review	28-APR-23 08.26.16.385045000 AM	\N	\N	266	4836	62	1119	28-APR-23 08.26.16.385045000 AM	4837	4831	4829	\N	[unsupported data type]	\N	\N	\N	\N	<p>Response has been made</p>	102	\N	<p>Please ensure compliance</p>	TR4566788889999
50437	43	NO HOP/CASH OFFICER APPROVAL FOR PAYMENT ABOVE TELLER LIMIT	1	28-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	28-APR-23 09.46.20.653614000 AM	\N	\N	264	5509	101	1120	28-APR-23 09.46.20.653614000 AM	5509	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	<p>check for response mail again</p>	102	\N	<p>check for mail</p>	TR2459876781
58439	11	SETTLEMENT INCONSISTENT	2	14-JUL-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	20-JUL-23 07.57.46.139795000 AM	\N	\N	267	5509	43	1682	20-JUL-23 07.57.46.139795000 AM	5277	4829	\N	\N	[unsupported data type]	application/pdf	\N	Checkout (2).pdf	\N	<p>noted with thanks</p>	96	\N	<p>confirm recipient mail</p>	TRT45845355684
58443	43	DUPLICATE TRANSACTION NOTICED	2	19-JUL-23 12.00.00.000000000 AM	1	2	Please review and revert	20-JUL-23 11.29.05.480791000 AM	\N	\N	294	5509	71	1686	20-JUL-23 11.29.05.480791000 AM	4836	4829	\N	Thank you	[unsupported data type]	application/pdf	\N	Checkout.pdf	\N	<p>Looking into it</p>	161	\N	<p>Awaiting your response</p>	MD743842735
46436	101	CREDIT CARD CONTRACT	2	25-APR-23 12.00.00.000000000 AM	1	2	Please review	25-APR-23 08.45.56.240349000 PM	\N	\N	265	4833	62	1019	25-APR-23 08.45.56.240349000 PM	4837	4836	\N	Thank you	[unsupported data type]	application/vnd.oasis.opendocument.text	\N	API USSD V2.3.2 (EN) (1) (1) (1).odt	\N	<p>resolved and confirmed by customer yesterday</p>	102	\N	<p>Ensure its confirmed</p>	TRANS24685732497
46438	101	NO HOP/CASH OFFICER APPROVAL FOR PAYMENT ABOVE TELLER LIMIT	1	22-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	25-APR-23 10.30.58.461791000 PM	\N	\N	264	4833	43	1039	25-APR-23 10.30.58.461791000 PM	4836	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	102	\N	<p>check and comply</p>	\N
48436	101	CREDIT CARD CONTRACT	2	26-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	26-APR-23 05.55.20.703245000 AM	\N	\N	265	4833	43	1063	26-APR-23 05.55.20.703245000 AM	4837	4836	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	<p>check</p>	\N
48439	43	DOCUMENTATION	2	26-APR-23 12.00.00.000000000 AM	1	2	Please review and ensure compliance	26-APR-23 09.34.57.579664000 AM	\N	\N	261	4836	101	1066	26-APR-23 09.34.57.579664000 AM	4833	4837	\N	thank you	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	<p>Kindly treat</p>	\N
48440	43	NO HOP/CASH OFFICER APPROVAL FOR PAYMENT ABOVE TELLER LIMIT	2	26-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	26-APR-23 09.38.05.445957000 AM	\N	\N	264	4833	101	1067	26-APR-23 09.38.05.445957000 AM	4836	4837	\N	\N	[unsupported data type]	\N	\N	\N	\N	<p>Issue has been resolved succesfully</p>	\N	\N	<p>Kindly treat</p>	\N
48442	101	NO HOP/CASH OFFICER APPROVAL FOR PAYMENT ABOVE TELLER LIMIT	2	26-APR-23 12.00.00.000000000 AM	1	2	Please review and ensure compliance	26-APR-23 10.56.59.496490000 AM	\N	\N	264	4833	60	1069	26-APR-23 10.56.59.496490000 AM	4836	4837	\N	thank you	[unsupported data type]	\N	\N	\N	\N	<p>understood</p>	102	\N	<p>check compliance</p>	TR4685795454
48446	43	WRONG CHARGES TAKEN	1	26-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	26-APR-23 11.43.53.882886000 AM	\N	\N	262	4833	43	1073	26-APR-23 11.43.53.882886000 AM	4836	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	96	\N	<p>check</p>	TRA67285437
48449	43	Some suspicious transaction	2	26-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	26-APR-23 01.22.17.590020000 PM	\N	\N	481	4833	101	1081	26-APR-23 01.22.17.590020000 PM	4837	4831	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	2040040	\N	<p><strong>Transaction Details</strong>:&nbsp,<br><br><strong>Trans. Ref</strong>: AAACT23055KYCCZP8G&nbsp,<br><br><strong>Customer</strong>: 2040040&nbsp,<br><br><strong>Account Number</strong>: 669055&nbsp,<br><br><strong>Tran. Date</strong>: 24-FEB-2023&nbsp,<br><br><strong>Tran. Amt</strong>: 108.58&nbsp,<br><br><strong>Narration</strong>: Credit Interest??CAPITALISE?</p>	AAACT23055KYCCZP8G
50435	43	OUTSTANDING CHARGES NOT TAKEN	1	28-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	28-APR-23 08.17.03.235865000 AM	\N	\N	275	4836	43	1118	28-APR-23 08.17.03.235865000 AM	5277	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	<p>This case has been resolved</p>	102	\N	<p>check</p>	gh645375
56435	43	LONG OUTSTANDING BALANCE UNATTENDED TO	2	12-JUL-23 12.00.00.000000000 AM	1	2	Please review and revert on this issue	19-JUL-23 08.43.13.507096000 PM	\N	\N	294	5509	44	1658	19-JUL-23 08.43.13.507096000 PM	4836	4829	\N	noted	[unsupported data type]	application/pdf	\N	Checkout.pdf	\N	<p>presently working on it.</p>	419	\N	<p>Urgent issue confirmed</p>	MCD248946575343
56438	43	SETTLEMENT INCONSISTENT	1	14-JUL-23 12.00.00.000000000 AM	1	2	Please review and ensure compliance	19-JUL-23 09.15.44.576199000 PM	\N	\N	267	5509	60	1661	19-JUL-23 09.15.44.576199000 PM	4836	4835	\N	thank you	[unsupported data type]	application/pdf	\N	Checkout.pdf	\N	<p>already handling</p>	111	\N	<p>check and comply</p>	\N
64435	43	OVERDRAWN STAFF ACCOUNT	1	16-AUG-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	16-AUG-23 10.02.15.060317000 PM	\N	\N	380	4835	43	1738	16-AUG-23 10.02.15.060317000 PM	4836	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	84	\N	<p>Just a check</p>	\N
64436	43	CREDIT CARD CONTRACT	1	16-AUG-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	16-AUG-23 10.09.05.183468000 PM	\N	\N	265	4835	\N	1739	16-AUG-23 10.09.05.183468000 PM	4835	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	\N	\N	\N	<p>Please treat</p>	\N
48441	101	STORE REGISTER NOT UPDATED	2	26-APR-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	26-APR-23 10.45.12.857231000 AM	\N	\N	266	4833	44	1068	26-APR-23 10.45.12.857231000 AM	4836	4835	\N	\N	[unsupported data type]	\N	\N	\N	\N	<p>reassigned</p>	102	\N	<p>check compliance</p>	TRANS458709523
52435	43	WRONG CHARGES TAKEN	2	02-MAY-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	02-MAY-23 09.48.38.870158000 AM	\N	\N	262	4836	62	1198	02-MAY-23 09.48.38.870158000 AM	4836	4834	\N	\N	[unsupported data type]	\N	\N	\N	\N	<p>Case settled</p>	84	\N	<p>Please respond</p>	\N
54435	43	NO HOP/CASH OFFICER APPROVAL FOR PAYMENT ABOVE TELLER LIMIT	1	02-MAY-23 12.00.00.000000000 AM	1	1	Please review and ensure compliance	02-MAY-23 11.40.59.718678000 PM	\N	\N	264	5509	\N	1218	02-MAY-23 11.40.59.718678000 PM	4836	\N	\N	\N	[unsupported data type]	\N	\N	\N	\N	<p>right now now again</p>	96	\N	<p>public alert mail check</p>	\N
62435	43	HANSON	1	02-AUG-23 12.00.00.000000000 AM	1	2	Please review and ensure compliance	02-AUG-23 05.04.50.143281000 PM	\N	\N	481	4831	43	1718	02-AUG-23 05.04.50.143281000 PM	5469	\N	\N	?SUOER	[unsupported data type]	\N	\N	\N	\N	\N	932006	\N	<p><strong>Transaction Details</strong>:&nbsp,<br><br><strong>Trans. Ref</strong>: AAACT230271YPXXCL5&nbsp,<br><br><strong>Customer</strong>: 932006&nbsp,<br><br><strong>Account Number</strong>: 25798202&nbsp,<br><br><strong>Tran. Date</strong>: 27-JAN-2023&nbsp,<br><br><strong>Tran. Amt</strong>: 4.27&nbsp,<br><br><strong>Narration</strong>: Credit Interest??CAPITALISE?</p>	AAACT230271YPXXCL5
66435	43	AMOUNT MISMATCH CHECK	2	20-AUG-23 12.00.00.000000000 AM	1	2	Please review and revert	22-AUG-23 04.24.01.224782000 PM	\N	\N	266	5509	44	1758	22-AUG-23 04.24.01.224782000 PM	4836	4834	\N	Thank you	[unsupported data type]	application/pdf	\N	Novaji_API_Driven_USSD_Deployment_v10.2.pdf	\N	<p>Customer contacted already</p>	2082713	\N	<p>A customer card is missing</p>	\N
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
27	default	{"uuid":"67de8918-0c5e-4758-b918-a230f73da1f3","displayName":"App\\\\Jobs\\\\DownloadDataJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\DownloadDataJob","command":"O:24:\\"App\\\\Jobs\\\\DownloadDataJob\\":10:{s:13:\\"tempDirectory\\";s:75:\\"C:\\\\Users\\\\USER\\\\Documents\\\\NOVAJI\\\\task-space\\\\storage\\\\app\\/tempdir_655e227421412\\";s:11:\\"zipFileName\\";s:17:\\"exported_data.zip\\";s:3:\\"job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}"}}	0	\N	1700668022	1700668022
28	default	{"uuid":"1d8cde81-800b-47f9-99b9-d79342be80a1","displayName":"App\\\\Jobs\\\\DownloadDataJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\DownloadDataJob","command":"O:24:\\"App\\\\Jobs\\\\DownloadDataJob\\":10:{s:13:\\"tempDirectory\\";s:75:\\"C:\\\\Users\\\\USER\\\\Documents\\\\NOVAJI\\\\task-space\\\\storage\\\\app\\/tempdir_655e2297dc6e0\\";s:11:\\"zipFileName\\";s:17:\\"exported_data.zip\\";s:3:\\"job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}"}}	0	\N	1700668056	1700668056
29	default	{"uuid":"52da428d-8850-46ed-a59b-3fa5e9e0ba6f","displayName":"App\\\\Jobs\\\\DownloadDataJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\DownloadDataJob","command":"O:24:\\"App\\\\Jobs\\\\DownloadDataJob\\":10:{s:13:\\"tempDirectory\\";s:75:\\"C:\\\\Users\\\\USER\\\\Documents\\\\NOVAJI\\\\task-space\\\\storage\\\\app\\/tempdir_655e23166f7ce\\";s:11:\\"zipFileName\\";s:17:\\"exported_data.zip\\";s:3:\\"job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}"}}	0	\N	1700668182	1700668182
30	default	{"uuid":"be77f780-d09e-41d3-8382-99f2c0e93c9d","displayName":"App\\\\Jobs\\\\DownloadDataJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\DownloadDataJob","command":"O:24:\\"App\\\\Jobs\\\\DownloadDataJob\\":10:{s:13:\\"tempDirectory\\";s:75:\\"C:\\\\Users\\\\USER\\\\Documents\\\\NOVAJI\\\\task-space\\\\storage\\\\app\\/tempdir_655e24ba9556b\\";s:11:\\"zipFileName\\";s:17:\\"exported_data.zip\\";s:3:\\"job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}"}}	0	\N	1700668602	1700668602
31	default	{"uuid":"73f14cdc-aea9-4989-8228-32346a3ad710","displayName":"App\\\\Jobs\\\\DownloadDataJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\DownloadDataJob","command":"O:24:\\"App\\\\Jobs\\\\DownloadDataJob\\":10:{s:13:\\"tempDirectory\\";s:75:\\"C:\\\\Users\\\\USER\\\\Documents\\\\NOVAJI\\\\task-space\\\\storage\\\\app\\/tempdir_655e24c465f47\\";s:11:\\"zipFileName\\";s:17:\\"exported_data.zip\\";s:3:\\"job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}"}}	0	\N	1700668612	1700668612
32	default	{"uuid":"2497bdf5-4b03-4ada-8a94-5309b4e48eea","displayName":"App\\\\Jobs\\\\DownloadDataJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\DownloadDataJob","command":"O:24:\\"App\\\\Jobs\\\\DownloadDataJob\\":10:{s:13:\\"tempDirectory\\";s:75:\\"C:\\\\Users\\\\USER\\\\Documents\\\\NOVAJI\\\\task-space\\\\storage\\\\app\\/tempdir_655e2e762ce63\\";s:11:\\"zipFileName\\";s:17:\\"exported_data.zip\\";s:3:\\"job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}"}}	0	\N	1700671094	1700671094
33	default	{"uuid":"9495fbc9-0a17-46c9-9a41-ed0bb6fea076","displayName":"App\\\\Jobs\\\\DownloadDataJob","job":"Illuminate\\\\Queue\\\\CallQueuedHandler@call","maxTries":null,"maxExceptions":null,"delay":null,"timeout":null,"timeoutAt":null,"data":{"commandName":"App\\\\Jobs\\\\DownloadDataJob","command":"O:24:\\"App\\\\Jobs\\\\DownloadDataJob\\":10:{s:13:\\"tempDirectory\\";s:75:\\"C:\\\\Users\\\\USER\\\\Documents\\\\NOVAJI\\\\task-space\\\\storage\\\\app\\/tempdir_655e2e8036326\\";s:11:\\"zipFileName\\";s:17:\\"exported_data.zip\\";s:3:\\"job\\";N;s:10:\\"connection\\";N;s:5:\\"queue\\";N;s:15:\\"chainConnection\\";N;s:10:\\"chainQueue\\";N;s:5:\\"delay\\";N;s:10:\\"middleware\\";a:0:{}s:7:\\"chained\\";a:0:{}}"}}	0	\N	1700671104	1700671104
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_users_table	1
2	2014_10_12_100000_create_password_resets_table	1
3	2019_08_19_000000_create_failed_jobs_table	1
4	2019_12_14_000001_create_personal_access_tokens_table	1
5	2023_08_10_125611_create_case_management_table	1
6	2023_08_10_140913_create_case_status_table	1
7	2023_08_10_142008_create_priority_level_table	1
8	2023_08_10_144528_add_foreign_key_to_case_management	2
9	2023_08_10_163644_update_users_table_nullable_is_supervisor	3
10	2023_08_11_145918_update_case_management_table_nullable_narration	4
11	2023_08_15_112609_update_case_management_table_nullable_supervisor_name	5
12	2023_08_18_132722_drop_narration_to_drop_column_from_case_management	6
13	2023_08_23_130124_add_staff_responsible_column_to_case_management	7
14	2023_08_23_144005_create_process_category_table	8
16	2023_08_23_144433_create_process_table	9
18	2023_08_23_145145_add_foreign_key_to_process	10
23	2023_08_23_155052_create_department_table	11
24	2023_08_23_162647_update_department_table_nullable_email	11
25	2023_08_23_163618_add_department_id_column_to_users	11
26	2023_08_24_122923_create_alert_table	12
27	2023_08_24_123109_create_staff_table	12
28	2023_08_23_170343_add_department_id_column_to_case_management	13
29	2023_08_25_093743_add_mail_to_column_to_alert	14
30	2023_08_25_095508_add_email_column_to_staff	15
31	2023_08_29_105859_add_process_categoryid_column_to_case_management	16
32	2023_08_30_082903_rename_and_disable_foreign_key_on_case_management	17
33	2023_09_04_170220_add_assigned_user_response_on_case_management	18
34	2023_09_06_091414_create_alert_group_table	19
35	2023_09_06_091854_create_exception_process_status_table	19
36	2023_09_06_123522_add_foreign_key_on_alert_group	20
37	2023_09_06_124355_create_exception_frequency_table	21
38	2023_09_06_125415_create_exception_category_table	22
39	2023_09_06_125018_add_foreign_key_on_alert	23
40	2023_09_06_130942_add_foreign_key_on_alert	24
41	2023_09_06_142959_add_exception_categoryid_on_process_category	25
42	2023_09_06_150131_add_mail_to_on_alert	26
43	2023_09_08_170920_create_report_type_table	27
44	2023_09_08_185747_add_alert_group_to_process	28
45	2023_09_08_192412_add_alert_group_to_process	29
46	2023_09_10_113021_create_document_type_table	30
47	2023_09_10_135039_create_system_category_table	31
48	2023_09_10_161030_add_fk_to_system_allocation	32
49	2023_09_19_195917_create_comply_table	33
50	2023_09_21_181811_create_test_table	34
51	2023_10_06_233043_add_all_response_to_cases_table	35
52	2023_11_09_185228_create_jobs_table	35
53	2023_11_21_172726_create_cache_table	36
54	2023_11_23_111727_create_download_queue_table	36
55	2023_11_23_111729_create_download_queue_table	37
56	2023_11_23_1117290_create_download_queue_table	38
57	2023_11_23_11176690_create_download_queue_table	39
58	2023_11_26_224630_create_download_notifier_table	40
\.


--
-- Data for Name: overdrawn_accounts; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.overdrawn_accounts (customer_name, account_number, branch_code, trans_date, currency_code, currency_id, balance, product_code, product_name, current_balance, account_officer_name, account_officer_id, customer_id, inti, email, phone_number, gl_code) FROM stdin;
HURLEY OBE	3927	1	15-OCT-2019	USD	840	0	111	DOMICILIARY-INDIVIDUAL	0.00	BILLY HANS	121	108	DOMICILIARY-INDIVIDUAL	imranhassan15@yahoo.com	8033396434	201007
ODIS ADRIEN	4144	1	17-OCT-2019	NGN	566	3184464	71321	SAVINGS	3184464.71	DOUGLAS ALTO	112	119	SAVINGS	ameeyar@yahoo.com	8030835524	202008
DUNCAN EMILE	4199	2	17-OCT-2019	NGN	566	50	361	STAFF SAVINGS	50.00	HARDY CLEMENT	512	121	STAFF SAVINGS	shedracksmsn@gmail.com	8086898823	202008
EBB WILLARD	4405	2	22-OCT-2019	NGN	566	16	821	SAVINGS ACCT	16.00	LEMON FRANK	511	141	SAVINGS ACCT	\N	8174338245	202010
BAXTER SAMUEL	4412	1	22-OCT-2019	NGN	566	463	4471	STAFF SALARY ACCOUNT	463.40	LON NEAL	000	139	STAFF SALARY ACCOUNT	elsafs227@gmail.com	8038005654	201002
LEWIS SHERMAN	4515	2	22-OCT-2019	NGN	566	20	321	SAVINGS	20.00	WARREN BARNEY	511	147	SAVINGS	ndukalu@yahoo.com	8147532696	202008
EARLY CAESAR	4539	1	22-OCT-2019	NGN	566	3668	25361	STAFF SAVINGS	3668.25	JACOB LEWIS	000	136	STAFF SAVINGS	badejo_f@yahoo.com	7038386812	202008
\.


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
1	App\\Models\\User	4	MyAuthApp	e44eb601b844a8966897486b193e996b9ac9f3389261d1005eed5e9b9592e666	["*"]	\N	\N	2023-08-10 16:58:48	2023-08-10 16:58:48
2	App\\Models\\User	4	MyAuthApp	640902c429c3edf0a491aec6a67eb068ef72045a5541baf380e211ce98297718	["*"]	\N	\N	2023-08-10 16:59:44	2023-08-10 16:59:44
5	App\\Models\\User	4	MyAuthApp	edf9b3a7ab566e3551cfdf2e4f1ae1758b5ef9af682c1c6518e2c1d1712eee9b	["*"]	2023-08-16 12:48:35	\N	2023-08-12 16:33:12	2023-08-16 12:48:35
6	App\\Models\\User	6	MyAuthApp	1c70e21d84701d51b0e7c4be8e17c490bff6e10cb5d8be8db6160e59dd33e05e	["*"]	\N	\N	2023-08-12 22:45:22	2023-08-12 22:45:22
7	App\\Models\\User	7	MyAuthApp	63ddd57dd4016dfe30a1f730000e1ba101f2d717c38584e1e765a5fef2d4db5c	["*"]	\N	\N	2023-08-15 15:13:14	2023-08-15 15:13:14
3	App\\Models\\User	4	MyAuthApp	66ae0cc0ce220a9c15167ce563f761791d1f94a14761d0775ca6e8f46f5888bb	["*"]	2023-08-12 16:37:45	\N	2023-08-11 11:33:07	2023-08-12 16:37:45
4	App\\Models\\User	5	MyAuthApp	afdc9b9135c6e6bb23524386240de69e91b1604835dc310a526f8e40750a51fb	["*"]	\N	\N	2023-08-11 15:52:51	2023-08-11 15:52:51
12	App\\Models\\User	5	MyAuthApp	146317f3f34aa1c36d957ce91da1c11545fd35408263e8bfd8e4ce597e17ee1a	["*"]	2023-08-19 17:46:06	\N	2023-08-16 12:58:50	2023-08-19 17:46:06
8	App\\Models\\User	7	MyAuthApp	d009929d72a9283f9be01ad65906e1152b7a0b00c1eb934117c9fc1a71f471ab	["*"]	2023-08-15 16:27:20	\N	2023-08-15 16:23:35	2023-08-15 16:27:20
9	App\\Models\\User	7	MyAuthApp	f039efed24116bac0f50f5e324ced0481461f02500cfe637f03e18b584a97d8e	["*"]	2023-08-15 16:31:23	\N	2023-08-15 16:29:16	2023-08-15 16:31:23
11	App\\Models\\User	5	MyAuthApp	01bc672848d635024b8c700ab5db9e84a05420cc48f9d34340f02e8928e19e46	["*"]	\N	\N	2023-08-16 10:45:52	2023-08-16 10:45:52
13	App\\Models\\User	4	MyAuthApp	2e1e4ba0e6211cf87d6f80bb176d793411d23c5a08a564d905adf66c43aae130	["*"]	2023-08-20 14:49:53	\N	2023-08-20 14:44:29	2023-08-20 14:49:53
14	App\\Models\\User	4	MyAuthApp	4463443ece68871d63fd38dff48c18e5d1f1091708f7cc830e73bf2e2957cdaa	["*"]	\N	\N	2023-08-20 14:57:59	2023-08-20 14:57:59
15	App\\Models\\User	4	MyAuthApp	e95922c58082035f811252a937e72647826657c7375e7fcc6c4562fff4892ca1	["*"]	\N	\N	2023-08-20 15:35:42	2023-08-20 15:35:42
16	App\\Models\\User	4	MyAuthApp	2942edb312dbd02a0468523a6930a15a714a9945dc5cdff0a8fafc23dc6b11a8	["*"]	\N	\N	2023-08-20 15:42:50	2023-08-20 15:42:50
17	App\\Models\\User	4	MyAuthApp	bc5c6d995e85c998327979ac13ea7738604dfba453f1d0a9ea312c5b09213593	["*"]	\N	\N	2023-08-20 15:46:31	2023-08-20 15:46:31
10	App\\Models\\User	5	MyAuthApp	f2a4f6782f8446494e76f02ef679c3b7d6b1e45d68332009e7c23ea5e28ea51d	["*"]	2023-08-16 10:59:34	\N	2023-08-16 10:45:02	2023-08-16 10:59:34
18	App\\Models\\User	4	MyAuthApp	2f6935448ae93a166d583050219012d0fccb11621cb3d5492aeb92e0eb2d9d61	["*"]	\N	\N	2023-08-20 16:01:32	2023-08-20 16:01:32
19	App\\Models\\User	4	MyAuthApp	0dc566497b193bb10f394594c99eeaf7c611f6e9ff38d7560f4a5ddc87562873	["*"]	\N	\N	2023-08-20 16:04:57	2023-08-20 16:04:57
20	App\\Models\\User	4	MyAuthApp	74d0fed919c0d30908cc604dc91675d86cefbff0310b7fe1ed9fb5252f1905ef	["*"]	2023-08-20 16:30:02	\N	2023-08-20 16:08:35	2023-08-20 16:30:02
21	App\\Models\\User	4	MyAuthApp	6a45ac6819347a2705acbd9fc49ef5907c37d90b354dccc901b98daeb7f3fe9a	["*"]	\N	\N	2023-08-20 17:46:32	2023-08-20 17:46:32
22	App\\Models\\User	4	MyAuthApp	a98e3e1910fd8bbc7458bf7dcbf61e3c1b7e69eed27ef841cce9fac5862e96e1	["*"]	\N	\N	2023-08-20 17:49:29	2023-08-20 17:49:29
23	App\\Models\\User	4	MyAuthApp	76d0ded04f90168b229faece8af675252ce730bcc6a81e78f9f77b2cbffcf3dc	["*"]	\N	\N	2023-08-20 17:51:32	2023-08-20 17:51:32
24	App\\Models\\User	4	MyAuthApp	28bc9746b0545dfa6f72e6f82d49867adb8e0545ff414fe7442931b724a222fc	["*"]	\N	\N	2023-08-20 17:52:57	2023-08-20 17:52:57
25	App\\Models\\User	4	MyAuthApp	f6bd4c7a90af73a3c82b98fa4349764f301a1f5e0ac3165b58c44550178d3317	["*"]	\N	\N	2023-08-20 17:55:48	2023-08-20 17:55:48
26	App\\Models\\User	4	MyAuthApp	0aeea7c2fed573e40aa48fd6b0f76ed73b4a45448d15647e9f7a457a35c76b4b	["*"]	\N	\N	2023-08-20 17:57:25	2023-08-20 17:57:25
27	App\\Models\\User	4	MyAuthApp	c7e7cb2568e3d9fe13b23f5ef80219574a76dd06f3ab951af85619e86a6353ea	["*"]	\N	\N	2023-08-20 18:02:55	2023-08-20 18:02:55
28	App\\Models\\User	4	MyAuthApp	db55b29535f243922cb2286f9b43b3b48c88a45ddd4c6ce5504747df99569ac5	["*"]	\N	\N	2023-08-20 18:03:14	2023-08-20 18:03:14
29	App\\Models\\User	4	MyAuthApp	8a5f56741eed75d39f23387ed9d514eb61297674957af3e702e90fe70ed87bd8	["*"]	\N	\N	2023-08-20 18:03:36	2023-08-20 18:03:36
30	App\\Models\\User	4	MyAuthApp	adcb23afb30f61debc25d4ebc9fefbb9a7c1f8b00b54d5e7f9e221460ad27754	["*"]	2023-08-20 18:04:46	\N	2023-08-20 18:04:15	2023-08-20 18:04:46
31	App\\Models\\User	4	MyAuthApp	038d0ea235c077ae40e8096b2ad2f53ab308ac1db3a8e08369794f429b13f999	["*"]	\N	\N	2023-08-20 21:46:33	2023-08-20 21:46:33
32	App\\Models\\User	4	MyAuthApp	601c77290e53b24a9ee05f6534b1914cab196c10a21eb44d52105593decc17b5	["*"]	\N	\N	2023-08-20 21:49:04	2023-08-20 21:49:04
33	App\\Models\\User	4	MyAuthApp	358edd100366e8b04b95926e2d44e201234ccac5ee3148dbb26f0d1fca4e36ca	["*"]	\N	\N	2023-08-20 21:50:11	2023-08-20 21:50:11
34	App\\Models\\User	4	MyAuthApp	e9b01e180cd821a2635ea61c405b29c730798daffca072d5ae62e166ed3f9d62	["*"]	\N	\N	2023-08-20 21:57:18	2023-08-20 21:57:18
35	App\\Models\\User	4	MyAuthApp	1ff4804952ac75b734a6aba6f0af73507fef0718807dcf649ad175580c46388e	["*"]	\N	\N	2023-08-20 22:00:22	2023-08-20 22:00:22
36	App\\Models\\User	4	MyAuthApp	2fd95b271db0c70e170fc11c1460ac4f42a56aae9920610ece8cffc4c71f13eb	["*"]	\N	\N	2023-08-20 22:04:20	2023-08-20 22:04:20
37	App\\Models\\User	4	MyAuthApp	6282b26cfa3885db9cf6bfd49887a007730c34b1c67988c7a361262d7ddf6b50	["*"]	\N	\N	2023-08-20 22:05:21	2023-08-20 22:05:21
47	App\\Models\\User	4	MyAuthApp	86a39cd2af99fd690a1369bc521ce88ea71ccea9c6ae6f8a2298a2e1633e2763	["*"]	\N	\N	2023-08-21 18:05:34	2023-08-21 18:05:34
38	App\\Models\\User	4	MyAuthApp	840a7086efea2706930c438e6560a63ce1057dd63c5dff7f7a7727b44e34fcf2	["*"]	2023-08-20 22:23:40	\N	2023-08-20 22:06:47	2023-08-20 22:23:40
39	App\\Models\\User	4	MyAuthApp	c9138b77852d042aa8a9fab2a7400f098053a92ee1610b54c8ad6969faa8fa9d	["*"]	\N	\N	2023-08-21 08:52:22	2023-08-21 08:52:22
48	App\\Models\\User	4	MyAuthApp	f6eb117a2ecea218efd21dad956bcdb1c0625240bfa318fb9feec5069670ae29	["*"]	\N	\N	2023-08-21 18:06:12	2023-08-21 18:06:12
49	App\\Models\\User	4	MyAuthApp	74235a403cfece0e07ea7049b66d57f4a49dd339833afd74ae207123f36e095a	["*"]	\N	\N	2023-08-21 18:06:34	2023-08-21 18:06:34
53	App\\Models\\User	5	MyAuthApp	7dd81dd2b2ca28fb0329553640ff92dff2dbcb069cc0fd74bd3305862193fc2b	["*"]	2023-08-23 12:52:49	\N	2023-08-23 10:44:16	2023-08-23 12:52:49
50	App\\Models\\User	4	MyAuthApp	bf8b3c93e649791945c5376b99a629dc6251b5c4445f2eb225be002ddef560d2	["*"]	2023-08-22 09:18:04	\N	2023-08-21 18:08:28	2023-08-22 09:18:04
40	App\\Models\\User	4	MyAuthApp	a8299a6ebd5f6efa4c460b786a544b701ac2800d9a32c634e4e9c80c6b68e78e	["*"]	2023-08-21 11:52:29	\N	2023-08-21 08:55:01	2023-08-21 11:52:29
41	App\\Models\\User	4	MyAuthApp	398d0d00bb7944cb7792d006c0976cef241506d0ec1ad57ff39e57003f8af661	["*"]	2023-08-21 14:12:41	\N	2023-08-21 14:09:26	2023-08-21 14:12:41
42	App\\Models\\User	4	MyAuthApp	8aca51263849fc2d58bec6d9e892b3e540aa2c272a586b541d6af434cec60864	["*"]	\N	\N	2023-08-21 15:18:18	2023-08-21 15:18:18
43	App\\Models\\User	4	MyAuthApp	4deeb078629c936f45edf99b5bee110a74f902ca63ce676ba9c6bf9f34f42840	["*"]	\N	\N	2023-08-21 15:19:39	2023-08-21 15:19:39
44	App\\Models\\User	4	MyAuthApp	ac558eec989ea50782bee25845d0562e44e95ab6486f49e3d18d10197808c7cf	["*"]	\N	\N	2023-08-21 15:21:14	2023-08-21 15:21:14
45	App\\Models\\User	4	MyAuthApp	da0cd7386db5d0fcb36d6108527e44bc50464f330109eb215e2c6094db370349	["*"]	2023-08-22 13:42:53	\N	2023-08-21 15:25:27	2023-08-22 13:42:53
51	App\\Models\\User	5	MyAuthApp	fb5798cba53e8857e7f8e6b1d8960135b69067f9779e38091b3009ea664e0afe	["*"]	\N	\N	2023-08-22 14:12:00	2023-08-22 14:12:00
52	App\\Models\\User	5	MyAuthApp	9acc1915d9cc088ac68ad88e01bbfc869290bd9aebfc5e0322394bd659df3fe2	["*"]	2023-08-25 14:53:36	\N	2023-08-22 14:15:01	2023-08-25 14:53:36
46	App\\Models\\User	4	MyAuthApp	8be6f0d9c21535021f4a8a169ae359bd47f1633c69b1d51370ec141a57e3b291	["*"]	\N	\N	2023-08-21 16:18:49	2023-08-21 16:18:49
\.


--
-- Data for Name: priority_level; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.priority_level (id, name, slug, description, created_at, updated_at) FROM stdin;
1	Low	low	Low Priority	\N	\N
2	Medium	medium	Medium Priority	\N	\N
3	High	high	High Priority	\N	\N
\.


--
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.report (id, "NAME", sql_query, val, created_at, last_updated, slug, status, process_order, char_format, categ, branch_code, download_query, update_mode, icon, url, description, url_request, request_parameters, risk_score, risk_assessment_id, risk_univ_id) FROM stdin;
87	Customers With BVN	select count(customer_code) val from sterlingdb.get_customers() where replace(bvn,'NULL') is not null	2541	03-APR-23 09.34.45.795680000 PM	24-APR-23 10.39.15.970017000 AM	total-customers-with-bvn	active	1	999,999,999	bank		select customer_code,name_1,bvn,co_code branch_code from sterlingdb.get_customers() where replace(bvn,'NULL') is not null	auto			Customers having BVN			1	\N	\N
88	Exceptions Raised This Month	select count(a.id) from  COMPLIANCE_REPORT a,  COMPLIANCE_REPORT_LINE b\nwhere upper(b.response) ='NO' and a.id = b.report_id and trunc(a.created_at) \n>= TRUNC(SYSDATE, 'MM')	0	03-APR-23 09.34.45.801181000 PM		compliance-this-month	active	3	999,999,999,999	compliance			auto						1	\N	\N
89	Total Validated	select count(a.id) from  COMPLIANCE_REPORT a,  COMPLIANCE_REPORT_LINE b\nwhere b.response ='YES' and a.id = b.report_id \nand trunc(a.created_at) \nbetween v('P69_START_DATE') and v('P69_END_DATE')	268	03-APR-23 09.34.45.802525000 PM		compliance-total-validated	active	2	999,999,999,999	compliance		select  a.id,a.report_name from  COMPLIANCE_REPORT a,  COMPLIANCE_REPORT_LINE b\nwhere b.response ='YES' and a.id = b.report_id \nand trunc(a.created_at) \nbetween v('P69_START_DATE') and v('P69_END_DATE')	auto						1	\N	\N
90	Total STR Filed	select count(id) from STR_TRANSACTIONS WHERE created_at between v('P129_START_DATE') and v('P129_END_DATE')	0	03-APR-23 09.34.45.802695000 PM		total-str	active	1	999,999,999,999	aml			on-demand						1	\N	\N
91	Total PEP Bank-Wide	select count(customer_code) from sterlingdb.get_customers(\np_where => q'~ pep='Y' ~'\n)	5	03-APR-23 09.34.45.802848000 PM	24-APR-23 10.54.19.154158000 AM	total-pep	active	1	999,999,999,999	bank		select customer_code,short_name,pep,co_code from sterlingdb.get_customers(\np_where => q'~ pep='Y' ~'\n)	auto			Number of politically-exposed persons operating accounts in the bank			20	\N	\N
92	Total Number of Medium-risk Customers	select count(customer_id) from am_customer where risk_rating_id in (select id from ctl_risk_rating where name='MEDIUM')	10569	03-APR-23 09.34.45.803630000 PM		total-medium-risk-customers	inactive	1	999,999,999	bank			auto			Medium risk account bank wide (risk score: 11-15 )			1	\N	\N
93	% Customers Without BVN	with total_bvn as (select count(customer_code) val from sterlingdb.get_customers() where replace(bvn,'NULL') is null),\ntotal_customers as (select count(customer_code) val from st_customers) \nselect to_char((1-(total_bvn.val/total_customers.val))*100,'99.99') as pct_without_bvn from total_bvn,total_customers	 50.87	03-APR-23 09.34.45.803809000 PM	24-APR-23 10.31.31.161929000 AM	pct-customers-nobvn	active	2	99.99	bank			auto			Percentage of customers without BVN bank-wide			1	\N	\N
94	Number of Customers With Expired ID	select count(customer_id) from am_customer where id_expiry_date is not null and id_expiry_date < trunc(sysdate)	483	03-APR-23 09.34.45.804941000 PM	24-APR-23 10.21.00.278319000 AM	total-customers-expired-id	active	1	999,999,999,999	bank		select * from am_customer where id_expiry_date is not null and id_expiry_date < trunc(sysdate)	auto			Number of accounts with expired means of identification			20	\N	\N
95	Customers With Expired ID	select count(customer_code) from st_customers where legal_exp_date < trunc(sysdate)	88	03-APR-23 09.34.45.805073000 PM		total-high-risk-with-expired-id	inactive	1	999,999,999,999	bank		select * from st_customers where legal_exp_date < trunc(sysdate)	auto			High-risk accounts with expired means of identification			1	\N	\N
96	Total Customers	select count(customer_code) from st_customers	4995	03-APR-23 09.34.45.805193000 PM	24-APR-23 10.23.52.357423000 AM	total-customers	active	1	999,999,999	bank		select * from st_customers	auto		#	Number of customers bank wide			1	\N	\N
97	Total Accounts Opened	select count(account_number) from am_customer_account	328890	03-APR-23 09.34.45.805306000 PM		total-accounts-opened	active	1	999,999,999	account			auto						1	\N	\N
98	% Customers With BVN	with total_bvn as (select val from compliance_statistics where slug='total-customers-with-bvn'),\ntotal_customers as (select val from compliance_statistics where slug='total-customers')\nselect to_char((total_bvn.val/total_customers.val)*100,'99.99') as pct_bvn_customers from total_bvn,total_customers	91.09	03-APR-23 09.34.45.805437000 PM		pct-customers-with-bvn	inactive	2	99.99	bank			auto						1	\N	\N
99	Customers Without BVN	select count(customer_code) from sterlingdb.get_customers() where replace(bvn,'NULL') is null	2454	03-APR-23 09.34.45.805554000 PM	24-APR-23 10.27.28.544510000 AM	customers-no-bvn	active	2	999,999,999	bank		select * from sterlingdb.get_customers() where replace(bvn,'NULL') is null	auto			Number of accounts on-boarded without BVN			20	\N	\N
100	Number of Customers With Phone	select count(distinct(customer_id)) t from am_customer_phone	330367	03-APR-23 09.34.45.805674000 PM		total-customers-with-phone	inactive	1	999,999,999	bank			auto						1	\N	\N
101	Number of Accounts Opened This Month	select count(distinct(account_number)) from am_customer_account where date_created > LAST_DAY(ADD_MONTHS(TRUNC(SYSDATE, 'MM'), -1))	0	03-APR-23 09.34.45.805807000 PM	03-OCT-23 01.43.55.774657000 AM	total-accounts-this-month	active	1	999,999,999,999	account			auto						1	\N	\N
102	High Risk Customers - H/O	select count(customer_id) from am_customer where risk_rating_id in (select id from ctl_risk_rating where name='HIGH') and branch_code='00001'	1459	03-APR-23 09.34.45.805925000 PM		high-risk-rating-head-office	active	1	999,999,999,999	branch	00001		auto						1	\N	\N
103	Medium Risk Customers - H/O	select count(customer_id) from am_customer where risk_rating_id in (select id from ctl_risk_rating where name='MEDIUM') and branch_code='00001'	1627	03-APR-23 09.34.45.806728000 PM		total-medium-risk-rating-customers-head-office	active	1	999,999,999,999	branch	00001		auto						1	\N	\N
104	Low-risk Customers - H/O	select count(customer_id) from am_customer where risk_rating_id in (select id from ctl_risk_rating where name='LOW') and branch_code='00001'	30753	03-APR-23 09.34.45.806929000 PM		total-low-risk-customers-head-office	active	1	999,999,999,999	branch	00001		auto						1	\N	\N
105	Accounts with Exceptions	select count(distinct a.account_number) from  COMPLIANCE_REPORT a,  COMPLIANCE_REPORT_LINE b\nwhere b.response = 'NO' and trunc(a.created_at) \nbetween v('P69_START_DATE') and v('P69_END_DATE')  and a.id = b.report_id and a.account_number IS NOT NULL	0	03-APR-23 09.34.45.807054000 PM		compliance-accounts-with-exceptions	active	1	999,999,999,999	compliance			auto						1	\N	\N
106	Total Number of High-risk Customers	select count(customer_id) from am_customer where risk_rating_id in (select id from ctl_risk_rating where name='HIGH')	11308	03-APR-23 09.34.45.807170000 PM		total-high-risk-customers	inactive	1	999,999,999	bank		select a.customer_id,a.full_name,(select account_number from ctl_account where trim(customer_id)=trim(a.customer_id) and rownum=1) account_number,\na.branch_code  from am_customer a where a.risk_rating_id in  (select id from ctl_risk_rating where name='HIGH')	auto			Number of high risk accounts bank-wide ( risk score: 15-25 )			1	\N	\N
107	Total Number of Low-risk Customers	select count(customer_id) from am_customer where risk_rating_id in (select id from ctl_risk_rating where name='LOW')	98539	03-APR-23 09.34.45.807292000 PM		total-low-risk-customers	inactive	1	999,999,999	bank			auto						1	\N	\N
108	Cases created	select count(id) from cases where user_id=$user_id	13	03-APR-23 09.34.45.807560000 PM		cases-by-me	active	1	999,999,999,999	user			on-demand	fa-user	f?p=$app_id:my-cases:$app_session:created_by_me:::P4_USER_ID:$user_id	Number of cases you have initiated			1	\N	\N
109	Cases closed	select count(id) from am_cases where user_id=$user_id and status = 'close'		03-APR-23 09.34.45.807684000 PM		cases-closed-by-me	active	3	999,999,999,999	user			auto	fa-check	f?p=$app_id:my-cases:$app_session:CLOSED:::P4_USER_ID,P4_STATUS:$user_id,2	Cases you created and have been closed			1	\N	\N
110	Overdue cases	select count(id) from am_cases where staff_id=(select id from am_staff where user_id=$user_id and rownum=1) and status='open' and days_overdue > config.get_parameter('case_overdue_days')		03-APR-23 09.34.45.808734000 PM		alerts	active	8	999,999,999,999	user			on-demand	fa-envelope	f?p=$app_id:my-cases:$app_session:MY_OVERDUE:::	Cases long overdue, that you need to respond and close			1	\N	\N
111	Open Cases	select count(id) from cases where status_id in (select id from case_status where name='Open')	4	03-APR-23 09.34.45.808888000 PM		open-cases	active	2	999,999,999,999	case-manager			auto		f?p=&APP_ID.:my-cases:&APP_SESSION.::::P4_STATUS,P4_STAFF,P4_USER_ID:1,0,0				1	\N	\N
112	Cases pending	select count(id) from cases where user_id=$user_id and status_id in (select id from case_status where lower(name) = 'open')		03-APR-23 09.34.45.809023000 PM		open-cases-by-me	active	2	999,999,999,999	user			on-demand	fa-folder-o	f?p=$app_id:my-cases:$app_session.:TO_CLOSE:::	Cases you initiated and still open			1	\N	\N
113	Cases assigned to me	select count(id) from am_cases where status='open' and staff_id = (select id from am_staff where user_id=$user_id and rownum=1)	4	03-APR-23 09.34.45.809138000 PM		cases-assigned	active	4	999,999,999,999	user			on-demand	fa-user-plus	f?p=$app_id:my-cases:$app_session:ASSIGNED_TO_ME:::P4_USER_ID:$user_id	Cases awaiting your response			1	\N	\N
114	Policies/Procedures created	select count(id) from ctl_document where user_id = $user_id		03-APR-23 09.34.45.809246000 PM		policies-created	inactive	5	999,999,999,999	user			on-demand	fa-file	f?p=&APP_ID.:documents:&APP_SESSION.::::P169_REF_NUMBER,P169_FILE_NAME,P169_SOURCE_FILE:0,0,0				1	\N	\N
115	Callover to review this month	select count(*) from app_callover_transactions	6531	03-APR-23 09.34.45.809358000 PM		callover-ro-review	active	6	999,999,999,999	user			on-demand	fa-money	f?p=$app_id:callover:$app_session::::	Transactions awaiting your review			1	\N	\N
116	Processes Assigned	select nvl(count(id),23) from exception_process where first_line_owner=$user_id		03-APR-23 09.34.45.809481000 PM		processes-assigned	inactive	7	999,999,999,999	user			on-demand	fa-cog	#				1	\N	\N
117	Systems assigned to me	select 3 from dual	3	03-APR-23 09.34.45.809591000 PM		system-assigned	inactive	10	999,999,999,999	user			on-demand	fa-laptop	#				1	\N	\N
118	Overdue  Cases	select count(id) from cases where status_id in (select id from case_status where name='Open') and (trunc(sysdate) - trunc(created_at)) >= config.get_parameter('case_overdue_days')	4	03-APR-23 09.34.45.809705000 PM		overdue-cases	active	4	999,999,999,999	case-manager			on-demand		f?p=&APP_ID.:my-cases:&APP_SESSION.:OVERDUE:::P4_STATUS,P4_STAFF,P4_USER_ID:1,0,0				1	\N	\N
119	STR filed this month	select 14 from dual	14	03-APR-23 09.34.45.809838000 PM		stf-filed-this-month	inactive	8	999,999,999,999	user			on-demand	fa-flag	#				1	\N	\N
120	All Cases	select count(id) from cases	16	03-APR-23 09.34.45.809959000 PM		all-cases	active	1	999,999,999,999	case-manager			on-demand	fa-	f?p=&APP_ID.:my-cases:&APP_SESSION.::::P4_STATUS,P4_STAFF,P4_USER_ID:0,0,0				1	\N	\N
121	Closed Cases	select count(id) from cases where status_id in (select id from case_status where name='Closed')	12	03-APR-23 09.34.45.810066000 PM		closed-cases	active	1	999,999,999,999	case-manager			auto		f?p=&APP_ID.:my-cases:&APP_SESSION.::::P4_STATUS,P4_STAFF,P4_USER_ID:2,0,0				1	\N	\N
122	Last One Month	select count(id) from cases where trunc(created_at) >= add_months(sysdate,-1)	16	03-APR-23 09.34.45.810179000 PM		filed-last-one-month	active	5	999,999,999,999	case-manager			auto		f?p=&APP_ID.:my-cases:&APP_SESSION.:LAST_MONTH:::P4_STATUS,P4_STAFF,P4_USER_ID:0,0,0				1	\N	\N
127	BVN Compliance	select 1 from am_customer_bvn where customer_id='$customer_id' and rownum=1		09-APR-23 11.54.46.362284000 PM		bvn-risk-score	active	1	999,999,999,999	customer-risk-score			auto		#	Customer's BVN risk score			22	21	\N
128	Enhanced Due Diligence	select risk_score from app_edd where customer_id = '$customer_id' and rownum=1 order by created_at desc		09-APR-23 11.58.34.066013000 PM		customer-edd-score	active	2	999,999,999,999	customer-risk-score			auto		#	Risk score obtained using the most recent Enhanced Due Diligence that was done			15	\N	\N
129	Customer Education Level	SELECT risk_score FROM am_risk_assessment\nWHERE assessment_id = (select assessment_id FROM\napp_am_cust_edu_level WHERE id_1 in (select education_level from am_customer where customer_id='$customer_id' and rownum=1)\n and rownum=1) and rownum=1		10-APR-23 12.00.04.217178000 AM		cust-education-risk-score	active	3	999,999,999,999	customer-risk-score			auto		#	Risk rating based on Risk assessment associated with customer education level profile			16	\N	\N
147	Customer PEP Score	select 25 from app_pep_accounts where trim(customer_id) ='$customer_id' and rownum=1		10-APR-23 10.10.12.708600000 AM		customer-pep-score	active	4	999,999,999,999	customer-risk-score			auto		#	Risk score for PEP related accounts			1	\N	\N
167	Customer Risk Score	select risk_score from compliance_cust_risk_score where customer_id='$customer_id' and rownum=1		14-APR-23 11.26.15.415642000 AM		customer-risk-score	active	1	999,999,999,999	transaction-scoring			auto		#	Risk score obtained from Customer risk rating			18	21	\N
168	Machine Score	select transaction_mgt.machine_score(p_transaction_id => '$transaction_id' from dual;		14-APR-23 11.27.30.163808000 AM		machine-transaction-score	active	2	999,999,999,999	transaction-scoring			auto		#	Machine learning transaction score applied to every transaction based on selected model			15	21	\N
169	Jurisdiction	SELECT ci.name AS jurisdiction, gz.risk_score as risk_score\nFROM nigeria_states gz\nINNER JOIN COMPLIANCE_INST_FC_RISK_UNIV ci ON gz.risk_univ_id = ci.id\nWHERE lower(gz.state) = lower(:P17_STATE) or lower(gz.capital) = lower(:P17_STATE)				Jurisdiction	active	1	99.99	customer_static_risk_score						The risk score based on the 6 jurisdictions			12.6	\N	21
170	Products and Services	select risk_score from COMPLIANCE_INST_FC_RISK_SUBJECT2 where lower(name) = lower(:P27_PRODUCT_SERVICE)				Products and Services	active	2	99.99	customer_static_risk_score						Product and Services associated			8	\N	22
171	Customer Type	select risk_score from COMPLIANCE_INST_FC_RISK_SUBJECT2 where lower(name) = lower(:P27_SECTOR_CODE)				Customer Type	active	3	99.99	customer_static_risk_score						The different kinds of customers we are dealing with			5.4	\N	24
\.


--
-- Data for Name: st_customers; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.st_customers (customer_code, mnemonic, short_name, address, town_country, country, sector, street, account_officer, post_code, industry, legal_id, legal_doc_name, legal_holder_name, legal_iss_auth, legal_iss_date, legal_exp_date, customer_rating, cr_profile_type, cr_profile, title, given_names, family_name, gender, date_of_birth, marital_status, sms_1, email_1, customer_currency, salary) FROM stdin;
	NULL	NULL	NULL	NULL	NULL	\N	NULL		NULL		NULL	NULL	NULL	NULL	\N	\N	NULL	NULL		NULL	NULL	NULL	NULL		NULL		NULL	NULL	NULL
	NULL	NULL	NULL	NULL	NULL	\N	NULL		NULL		NULL	NULL	NULL	NULL	\N	\N	NULL	NULL		NULL	NULL	NULL	NULL		NULL		NULL	NULL	NULL
	NULL	NULL	NULL	NULL	NULL	\N	NULL		NULL		NULL	NULL	NULL	NULL	\N	\N	NULL	NULL		NULL	NULL	NULL	NULL		NULL		NULL	NULL	NULL
	NULL	NULL	NULL	NULL	NULL	\N	NULL		NULL		NULL	NULL	NULL	NULL	\N	\N	NULL	NULL		NULL	NULL	NULL	NULL		NULL		NULL	NULL	NULL
	NULL	NULL	NULL	NULL	NULL	\N	NULL		NULL		NULL	NULL	NULL	NULL	\N	\N	NULL	NULL		NULL	NULL	NULL	NULL		NULL		NULL	NULL	NULL
22768	CUS0022768	H.Q.M.NIGERIA LTD	LAGOS	LAGOS	NULL	6000	7 JAMES GEORGES	777	NULL	6005	NULL	NULL	NULL	NULL	\N	\N	NULL	VALUED.CUSTOMER	14	NULL	H.Q.M.NIGERIA LTD	H.Q.M.NIGERIA LTD	NULL	29-NOV-2001	NULL		NULL	NULL	NULL
23565	CUS0023565	VIGOR OIL LIMITED	LAGOS	NULL	NULL	4900	61SHIPEOLU ST.PALMGROOVELAGOS	777	NULL	4906	NULL	NULL	NULL	NULL	\N	\N	NULL	VALUED.CUSTOMER	14	NULL	VIGOR OIL LIMITED	VIGOR OIL LIMITED	NULL		NULL		NULL	NULL	NULL
23887	CUS0023887	MIKE  ANEGBODE	20 MARINA LAGOS	LAGOS	NULL	6200	STERLING BANK PLC	777	NULL	6212	A5632632	PASSPORT	ANEGBODE MIKE	NIS	2000-12-01	\N	HIGH	VALUED.CUSTOMER	11	MR	MIKE	ANEGBODE	MALE	23-JUN-1969	NULL		NULL	NULL	NULL
24034	CUS0024034	VICTORIA  WILFRED	LEKKI LAGOS	LAGOS	NULL	4200	BLK 16,FLAT 3 JAKANDE ESTATE	777	NULL	4207	10112004	PASSPORT	WILFRED VICTORIA	NIS	2004-11-10	\N	MED	VALUED.CUSTOMER	12	MRS	VICTORIA	WILFRED	FEMALE	10-OCT-1962	NULL	8055632504	NULL	NULL	NULL
24327	CUS0024327	ADELEKE  ADEFOPE	LAGOS	NULL	NULL	4800	32,AROWOLO STREET,IWAYA YABA	777	NULL	4806	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MR	ADELEKE	ADEFOPE	MALE		NULL		NULL	NULL	NULL
24333	CUS0024333	KENMOS LTD 	OKE IRA NLA, AJAH, L	NULL	NULL	6000	PLOT 4 BLK E GOODHOMES ESTATE	777	NULL	6005	NULL	NULL	NULL	NULL	\N	\N	HIGH	VALUED.CUSTOMER	14	MR	NULL	KENMOS LTD	MALE	07-JUL-2005	NULL	0	NULL	NULL	NULL
25178	CUS0025178	YEJIDE VIRGINIA AYENI	IKEJA	LAGOS	NIGERIA	4900	7 ALFRED OLAIYA ST OPEBI	555	23401	4902	AG00265AA	DRIVING.LICENSE	AYENI YEJIDE VIRGINIA	FRSC	2001-05-10	\N	MED	VALUED.CUSTOMER	11	MRS	YEJIDE	AYENI	FEMALE	17-JUN-1968	NULL	8033589086	NULL	NULL	NULL
25582	CUS0025582	ABDULLAHI HAMZE  ADAMS	GRA IKEJA LAGOS	NULL	NULL	4300	17 AKIN AKINADE CL GRA IKEJA	777	NULL	4304	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		NULL	ABDULLAHI HAMZE	ADAMS	MALE		NULL		NULL	NULL	NULL
25963	CUS0025963	YEWANDE  ATOBATELE	OMOLE ESTATE IKEJA L	NULL	NULL	5900	33 MUYIBAT OYEFUSI ST	777	NULL	5905	NULL	NULL	NULL	NULL	\N	\N	NULL	NULL		NULL	YEWANDE	ATOBATELE	MALE		NULL		NULL	NULL	NULL
25991	CUS0025991	DORA ONOMEN  IJIE	IKEJA LAGOS	NULL	NULL	4300	18 FADEYI ALADURA ST	500554	NULL	4304	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		NULL	DORA ONOMEN	IJIE	MALE		NULL		NULL	NULL	NULL
26472	CUS0026472	TUNDE  AYANNIYI	AGEGE	LAGOS	NULL	5900	22.24 SHOMOYE STREET	777	NULL	5905	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	TUNDE	AYANNIYI	MALE	25-JUN-1980	NULL		NULL	NULL	NULL
27244	CUS0027244	SEABREEZE GLOBAL INT L LTD SEABREEZ	IKEJA	LAGOS	NIGERIA	6000	158 OREGUN ROAD IKEJA	777	23401	6005	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	14	NULL	SEABREEZE GLOBAL INT L LTD	SEABREEZE GLOBAL INT L LTD	NULL		NULL	80	NULL	NULL	NULL
27331	CUS0027331	NARINEDA NIGERIA LIMITED NARINEDA N	IKEJA	LAGOS	NULL	4300	18 ADELEKE STREET OFF ALLEN AV	500544	NULL	4304	NEG6761AA1	DRIVING.LICENSE	NARINEDA NIGERIA LIMITED	FRSC	2004-05-14	\N	MED	VALUED.CUSTOMER	14	MR	NARINEDA NIGERIA LIMITED	NARINEDA NIGERIA LIMITED	MALE	06-FEB-1971	NULL	4979579	NULL	NULL	NULL
27369	CUS0027369	POLYFLOYD INVESTMENTS LIMITED INVES	OLUSOSUN IKEJA LAGOS	NULL	NULL	4300	26-28 OLORUNFUNMI STREET	777	NULL	4304	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MESSRS	INVESTMENTS LIMITED	POLYFLOYD INVESTMENTS LIMITED	MALE		NULL		NULL	NULL	NULL
27777	CUS0027777	AYODELE  BAKARE	IKEJA	LAGOS	NIGERIA	5200	104 AWOLOWO WAY, IKEJA B/S	777	23401	5204	A2923670A	PASSPORT	BAKARE AYODELE	NIS	2005-12-08	\N	MED	VALUED.CUSTOMER	11	MR	AYODELE	BAKARE	MALE	20-MAR-1960	MARRIED	8058385007	NULL	NULL	NULL
28961	CUS0028961	FELICIA ABOSEDE  AYANSOGA	LAGOS	LAGOS	NULL	5000	36 EBUN-OTI STREET OLODI APAPA	501721	NULL	5004	OD349267959	NATIONAL.ID	AYANSOGA FELICIA ABOSEDE	NIMC	2002-09-30	\N	MED	VALUED.CUSTOMER	11	MRS	FELICIA ABOSEDE	AYANSOGA	FEMALE	14-APR-1974	NULL	8035785019	NULL	NULL	NULL
29157	CUS0029157	CHUKWUEBUKA  IZUOGU	APAPA	LAGOS	NULL	4800	28 WILMER CRES.OLODI APAPA.	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	CHUKWUEBUKA	IZUOGU	MALE	13-JUL-1959	NULL		NULL	NULL	NULL
29627	CUS0029627	JOHN  OKPOKO	APAPA	LAGOS	NG	4800	2 BERGER CLOSE AJEGUNLE	508754	NULL	4803	APP25256AA2	DRIVING.LICENSE	OKPOKO JOHN	FRSC	2000-12-01	\N	MED	VALUED.CUSTOMER	11	MR	JOHN	OKPOKO	MALE	13-SEP-1968	NULL	8033028815	NULL	NULL	NULL
29831	CUS0029831	ROMANUS CHUKWUEMEKA  AGU	LAGOS	LAGOS	NULL	4800	248 KIRIKIRI RD OLODI APA.	555	NULL	4803	APP3598AB	DRIVING.LICENSE	AGU ROMANUS CHUKWUEMEKA	FRSC	2003-03-18	\N	MED	NULL		MR	ROMANUS CHUKWUEMEKA	AGU	MALE	26-FEB-1947	NULL	8023242649	NULL	NULL	NULL
30161	CUS0030161	EZEKIEL  DANFARI	AMUWO ODOFIN,LAGOS.	LAGOS	NULL	4800	9 OLAYEMI STREET,MAZA MAZA	555	NULL	4803	AAA1612AB	DRIVING.LICENSE	DANFARI EZEKIEL	FRSC	2003-08-28	\N	MED	NULL		MR	EZEKIEL	DANFARI	MALE	07-MAY-1966	NULL	8023027059	NULL	NULL	NULL
30455	CUS0030455	JUSTINE  USHI	LAGOS	LAGOS	NULL	4800	7A AJALINKOKO KIRIKIRI TOWN	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	JUSTINE	USHI	MALE		NULL		NULL	NULL	NULL
30762	CUS0030762	WASIU  ARE	LAGOS	LAGOS	NULL	4900	5 JONES WARIBI STREET OLODI AP	777	NULL	4901	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	WASIU	ARE	MALE		NULL		NULL	NULL	NULL
30982	CUS0030982	CARIX SHIPPING CO. LTD	LAGOS	LAGOS	NULL	5500	4 BADAGRY ROAD APAPA.	777	NULL	5503	NULL	NULL	NULL	NULL	\N	\N	HIGH	VALUED.CUSTOMER	14	NULL	CARIX SHIPPING CO. LTD	CARIX SHIPPING CO. LTD	NULL	20-FEB-1997	NULL		NULL	NULL	NULL
31576	CUS0031576	MOSES IKECHUKWU  OFOELE	APAPA	LAGOS	NULL	4800	79 CADOSO STREET AWODI-ORA EST	777	NULL	4803	IM215454578	NATIONAL.ID	OFOELE MOSES IKECHUKWU	NIMC	2005-06-08	\N	MED	NULL		MR	MOSES IKECHUKWU	OFOELE	MALE	02-APR-1974	NULL	8033614190	NULL	NULL	NULL
33096	CUS0033096	SOBAB INTERNATIONAL LTD 	LAGOS	LAGOS	NULL	4200	54 TAIWO ST	777	NULL	4207	A00178590	PASSPORT	HAZZAN BABATUNDE	NIS	2013-01-17	2017-01-16	MED	VALUED.CUSTOMER	14	NULL	SOBAB INTERNATIONAL LTD	SOBAB INTERNATIONAL LTD	NULL		NULL		NULL	NULL	NULL
34234	CUS0034234	TONY  LINLEY	LAGOS	LAGOS	NULL	4800	27 CREEK ROAD APAPA	777	NULL	4803	OS500069343	NATIONAL.ID	LINLEY TONY	NIMC	2002-12-11	\N	HIGH	NULL		MR	TONY	LINLEY	MALE	24-JUL-1946	NULL	8033029621	NULL	NULL	NULL
34386	CUS0034386	ANTHONY AGBO  IDOKO	LAGOS	LAGOS	NULL	4800	PLT 2068 BLK 18C AMUWO-FESTAC	777	NULL	4803	WKR137DAA	DRIVING.LICENSE	IDOKO ANTHONY AGBO	FRSC	2003-04-02	\N	MED	NULL		MR	ANTHONY AGBO	IDOKO	MALE	13-MAY-1973	NULL		NULL	NULL	NULL
34425	CUS0034425	OSIYOSOLA  OSIBOGUN	LAGOS	LAGOS	NULL	5900	12 ADEJUMO TENNIS CLUB RD EJIG	777	NULL	5905	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MRS	OSIYOSOLA	OSIBOGUN	FEMALE	23-JAN-1957	NULL		NULL	NULL	NULL
34876	CUS0034876	EMMANUEL  ACHIAGBA	LAGOS	LAGOS	NULL	4800	20SHITUJERO STREET AJANGBADI	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	EMMANUEL	ACHIAGBA	MALE	01-JAN-1975	NULL		NULL	NULL	NULL
35087	CUS0035087	FAGSON ENGINEERING LTD	LAGOS	LAGOS	NULL	5500	1B RAILWAY COMPOUND APAPA	777	NULL	5505	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		NULL	FAGSON ENGINEERING LTD	FAGSON ENGINEERING LTD	NULL		NULL		NULL	NULL	NULL
35110	CUS0035110	JABBAR GANI AND SONS LTD JABBAR GAN	LAGOS	LAGOS	NULL	4800	1 IKIJA ST BARIGA	506035	NULL	4817	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	14	NULL	JABBAR GANI AND SONS CO.	JABBAR GANI AND SONS LTD	MALE		NULL	8033157906	NULL	NULL	NULL
35200	CUS0035200	UNITED HAMMOUD VENTURES.TRAVEL	LAGOS	LAGOS	NULL	6000	39 BURMA RD APA.	777	NULL	6001	NULL	NULL	NULL	NULL	\N	\N	NULL	VALUED.CUSTOMER	13	NULL	UNITED	VENTURES.TRAVEL	NULL		NULL		NULL	NULL	NULL
35209	CUS0035209	QUAYS LINK NIGERIA LTD	LAGOS	LAGOS	NULL	6200	78.80 WILMER CRES.OLODI APA.	777	NULL	6202	ODO15987533	NATIONAL.ID	QUAYS LINK NIGERIA LTD	NIMC	2002-03-14	\N	NULL	VALUED.CUSTOMER	13	NULL	QUAYS LINK NIGERIA LTD	QUAYS LINK NIGERIA LTD	NULL	25-JAN-1994	NULL		NULL	NULL	NULL
35330	CUS0035330	SARO TRANSCONTINENTAL LTD	LAGOS	LAGOS	NULL	4800	43 CAULCRICK STR APAPA	777	NULL	4817	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		NULL	SARO TRANSCONTINENTAL LTD	SARO TRANSCONTINENTAL LTD	NULL		NULL		NULL	NULL	NULL
35370	CUS0035370	MOHANDI ENTERPRISES	LAGOS	LAGOS	NULL	4900	13 MARINE ROAD APAPA	777	NULL	4921	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		NULL	MOHANDI ENTERPRISES	MOHANDI ENTERPRISES	NULL		NULL		NULL	NULL	NULL
35707	CUS0035707	OLAIDE  OYEWO	ESTATE OGBA LAGOS	LAGOS	NIGERIA	4800	BLOCK 16 FLAT 4 NEW DIARY FARM	777	NULL	4803	EPE04422AA6	DRIVING.LICENSE	OYEWO OLAIDE ABIBAT	FRSC	2004-03-29	\N	MED	VALUED.CUSTOMER	11	MRS	OLAIDE	OYEWO	FEMALE	02-MAY-1976	NULL		NULL	NULL	NULL
36650	CUS0036650	ADETOUN ADIJAT  GIWA	LAGOS	LAGOS	NULL	5900	29 NNAMDI AZIKWE MOSHALASHI JI	777	NULL	5904	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MISS	ADETOUN ADIJAT	GIWA	FEMALE	22-JUN-1967	NULL	8033068414	NULL	NULL	NULL
37094	CUS0037094	FAOLISH CONCEPT ENTERPRISES	LAGOS.	LAGOS	NULL	5300	42 EREKO STR IDUMOTA	777	NULL	5324	NULL	NULL	NULL	NULL	\N	\N	NULL	NULL		NULL	FAOLISH	ENTERPRISES	NULL		NULL		NULL	NULL	NULL
37121	CUS0037121	FOA BASH NIG.LTD	IDUMOTA LAGOS	LAGOS	NULL	5900	37 JOHN STREET	777	NULL	5904	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		NULL	FOA BASH NIG.LTD	FOA BASH NIG.LTD	NULL		NULL		NULL	NULL	NULL
37359	CUS0037359	DEBORAH  OLUWAKOTANMI	OGBA-IKEJA	LAGOS	NULL	4200	25,SEGUN GBELE ST.OMOLE	777	NULL	4204	NULL	NULL	NULL	NULL	\N	\N	HIGH	NULL		MRS	DEBORAH	OLUWAKOTANMI	FEMALE	22-FEB-1968	NULL		NULL	NULL	NULL
37397	CUS0037397	SAODAT IFEDOLAPO  ADEYEMO	LAGOS	NULL	NULL	4900	NO 102, IBIDUN STR OJUELEGBA S	777	NULL	4921	NULL	NULL	NULL	NULL	\N	\N	NULL	NULL		MRS	SAODAT IFEDOLAPO	ADEYEMO	FEMALE		NULL	7780514	NULL	NULL	NULL
38157	CUS0038157	ISAIAH  FARINTO	AKOWONJO	LAGOS.	NULL	4800	41 ADERELE STREET,	507492	NULL	4803	CAL4081AC]CAL4081AC	DRIVING.LICENSE]DRIVING.LICENSE	FARINTO ISAIAH ADEAGBO]FARINTO ISAIAH ADEAGBO	FRSC]FRSC	\N	\N	HIGH	NULL		MR	ISAIAH	FARINTO	MALE	07-DEC-1945	NULL	8023134901	NULL	NULL	NULL
38842	CUS0038842	HAFEECON ENGINEERING NIG. LTD HAFEE	LAGOS	LAGOS	NULL	4800	17 ABEOKUTA EXP.RD.IDIMANGORO	500565	NULL	4817	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	14	NULL	HAFEECON ENGINEERING NIG. LTD	HAFEECON ENGINEERING NIG. LTD	MALE		NULL		NULL	NULL	NULL
38988	CUS0038988	THE DUKE MEDICAL THE DUKE MEDICAL 	IKEJA LAGOS	LAGOS	NIGERIA	6400	26 BAMISHILE STR.OFF ALLEN AVE	507492	NULL	6401	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	14	ALHAJI	THE DUKE MEDICAL	THE DUKE MEDICAL	MALE	01-JAN-1991	NULL		NULL	NULL	NULL
39561	CUS0039561	SHAMSONDEEN  ADEMOLA	LAGOS	NULL	NULL	4200	7 ALHAJI IDOWU STREET AKOWONJO	507492	NULL	4202	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	NULL	SHAMSONDEEN	ADEMOLA	MALE		NULL		NULL	NULL	NULL
40041	CUS0040041	OSITA  OBI	TRADEFAIR LAGOS	LAGOS	NULL	5700	ZONE A BLK 4 SHOP 101 ASPAMDA	777	NULL	5703	DL-BDG50121A	DRIVING.LICENSE	OBI OSITA	FRSC	2004-01-15	\N	MED	NULL		MR	OSITA	OBI	MALE	05-FEB-1974	SINGLE	8033471300	NULL	NULL	NULL
40047	CUS0040047	KINGSLEY C.  NWOSU	TRADEFAIR LAGOS	LAGOS	NULL	5700	ZONE D BLOCK 2 SHOP 106 ASPAMD	777	NULL	5703	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	KINGSLEY C.	NWOSU	MALE	07-MAY-1972	NULL	8033339306	NULL	NULL	NULL
41054	CUS0041054	CALLISTUS  CHIBUOKE	MUSHIN LAGOS.	NULL	NULL	4800	5 OWO ST ILASAMAJA	777	NULL	4803	OG064302338	NATIONAL.ID	CHIBUOKE CALLISTUS	NIMC	2003-01-31	\N	MED	NULL		MR	CALLISTUS	CHIBUOKE	MALE	12-MAY-1975	NULL		NULL	NULL	NULL
42014	CUS0042014	ANTHONY  ADODOH	EJIGBO,LAGOS.	LAGOS	NULL	4800	28 KAYODE STREET OKE AFA	777	NULL	4803	EK058606189	NATIONAL.ID	ADODOH ANTHONY	NIMC	2003-01-28	\N	MED	NULL		MR	ANTHONY	ADODOH	MALE	22-JUN-1963	NULL		NULL	NULL	NULL
42298	CUS0042298	IFIOK OKON WILLIE	SURULERE,LAGOS.	LAGOS	NG	4800	29 RAMONI OKE STREET ITIRE	777	NULL	4803	AK056140345	NATIONAL.ID	WILLIE IFIOK OKON	NIMC	2002-12-24	\N	MED	VALUED.CUSTOMER	11	MR	IFIOK	WILLIE	MALE	17-JUL-1969	NULL	8034348755	NULL	NULL	NULL
43688	CUS0043688	MUFUTAU  AJENIPA	L.ISLAND,LAGOS	LAGOS	NULL	4200	61 OJO-GIWA STREET	777	NULL	4207	A1465611	PASSPORT	AJENIPA MUFUTAU	NIS	2005-03-17	\N	MED	VALUED.CUSTOMER	11	MR	MUFUTAU	AJENIPA	MALE	26-NOV-1974	NULL	8034231913	NULL	NULL	NULL
43725	CUS0043725	EMMANUEL  OYEGOKE	LAGOS ISLAND (1ST FL	NULL	NULL	5900	135.137 NNAMDI AZIKWE STREET	777	NULL	5905	NULL	NULL	NULL	NULL	\N	\N	NULL	NULL		NULL	EMMANUEL	OYEGOKE	MALE		NULL		NULL	NULL	NULL
44927	CUS0044927	SAKA  JIMOH	ABUJA	FEDERAL CAPITAL TERRITORY	NULL	4200	DIRECTORATE OF RD TRAFFIC SERV	777	NULL	4207	PHC44932A1	DRIVING.LICENSE	JIMOH SAKA	FRSC	2003-03-10	\N	MED	NULL		MR	SAKA	JIMOH	MALE	23-MAY-1978	NULL	8036929856	NULL	NULL	NULL
45683	CUS0045683	YUNISA  APEH	ABUJA	FEDERAL CAPITAL TERRITORY	NULL	4800	COURT OF APPEAL HQTS	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	YUNISA	APEH	MALE	01-JUN-1965	NULL		NULL	NULL	NULL
46105	CUS0046105	SYMBAR INVESTMENTS LTD	ABUJA	FEDERAL CAPITAL TERRITORY	NULL	5500	LOZUMBA CPLX AREA 10 GARKI	777	NULL	5501	119258278	DRIVING.LICENSE	SYMBAR INVESTMENTS LTD	FRSC	2002-11-30	\N	NULL	NULL		NULL	SYMBAR INVESTMENTS LTD	SYMBAR INVESTMENTS LTD	NULL	02-MAR-2000	NULL	9091235353	NULL	NULL	NULL
46550	CUS0046550	ENRICH SYSTEMS LIMITED	ABUJA	FCT	NULL	5000	PLOT 791 RABAT STREET ZONE 6 W	777	NULL	5004	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	NULL	ENRICH SYSTEMS LIMITED	ENRICH SYSTEMS LIMITED	MALE		NULL		NULL	NULL	NULL
46737	CUS0046737	ILIYA  SHADA	ABUJA	NULL	NULL	4200	YAKUBU GOWON CENTER	777	NULL	4207	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		NULL	ILIYA	SHADA	MALE		NULL		NULL	NULL	NULL
46800	CUS0046800	UCHE  ONWUANUOKWU	ABUJA	FEDERAL CAPITAL TERRITORY	NULL	4800	BLK429 FLT 13 MASSANA STR. ZON	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	UCHE	ONWUANUOKWU	MALE		NULL		NULL	NULL	NULL
46991	CUS0046991	JOHN  ALKALI	ABUJA	FEDERAL CAPITAL TERRITORY	NULL	4200	BLK E FLAT 1 GUDU	500803	NULL	4207	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MR	JOHN	ALKALI	MALE	01-JAN-1900	NULL		NULL	NULL	NULL
47961	CUS0047961	ONUORAH OKOYE  PAUL	KADUNA	KADUNA	NULL	4200	AK 42 YORUBA ROAD	777	NULL	4207	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MR	ONUORAH OKOYE	PAUL	MALE	01-DEC-2016	NULL	802000000	NULL	NULL	NULL
48401	CUS0048401	KINGSLEY  AUDU-SUNDAY	KADUNA	KADUNA	NULL	4200	N0.13 YERIMA STREET,YELWA TELE	777	NULL	4207	NULL	NULL	NULL	NULL	\N	\N	NULL	NULL		MR	KINGSLEY	AUDU-SUNDAY	MALE		NULL		NULL	NULL	NULL
49514	CUS0049514	BERJAWI  SAEED	KANO	NULL	NULL	4200	NO.10 ALU AVENUE	777	NULL	4207	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		NULL	BERJAWI	SAEED	MALE		NULL		NULL	NULL	NULL
50594	CUS0050594	KOLAWOLE  OLADIMEJI	OSUN STATE	ILESA	NULL	4200	B166 OKESA STR. ILESHA	777	NULL	4207	OS526662523	NATIONAL.ID	OLADIMEJI KOLAWOLE	NIMC	2002-12-13	\N	MED	NULL		MR	KOLAWOLE	OLADIMEJI	MALE	13-APR-1945	SINGLE		NULL	NULL	NULL
52442	CUS0052442	AKURE BRANCH LOAN RECOVERY FUN	AKURE	AKURE	NULL	5000	NBM BANK,142 OYEMEKUN ROAD	777	NULL	5004	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	NULL	AKURE BRANCH LOAN RECOVERY FUN	AKURE BRANCH LOAN RECOVERY FUN	MALE		NULL		NULL	NULL	NULL
52460	CUS0052460	EYOSI ABO  IFEDUN	ONDO STATE	AKURE	NULL	4300	CAC OKE IGAN,AKURE	777	NULL	4304	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	EYOSI ABO	IFEDUN	MALE	25-MAY-1986	NULL		NULL	NULL	NULL
53691	CUS0053691	TESSY IFEYINWA  OLATUNDE	CHALLENGE	IBADAN	NULL	5000	SW8.1154A ESHO STREET	777	NULL	5004	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MRS	TESSY IFEYINWA	OLATUNDE	FEMALE	22-JUN-1957	MARRIED		NULL	NULL	NULL
54664	CUS0054664	OLUSEYE ONAKOYA  ADEBAYO	MOLETE	OYO	NULL	4300	S7.564 OSHODI ST OLORUNSOGO	777	NULL	4305	oy664	NATIONAL.ID	ADEBAYO OLUSEYE ONAKOYA	NIMC	2015-11-30	\N	MED	VALUED.CUSTOMER	13	MR	OLUSEYE ONAKOYA	ADEBAYO	MALE	01-FEB-1975	NULL		NULL	NULL	NULL
55385	CUS0055385	LASFUN CONTINENTAL SERVICE LTD	IBADAN OYO STATE	IBADAN	NULL	5000	PLOT 2B OLOJO COMMUNITY OLODO	777	NULL	5004	A1228174	PASSPORT	LASFUN CONTINENTAL SERVICE LTD	NIS	2005-12-02	\N	HIGH	VALUED.CUSTOMER	14	NULL	LASFUN CONTINENTAL SERVICE LTD	LASFUN CONTINENTAL SERVICE LTD	NULL		NULL	8035230557	NULL	NULL	NULL
56419	CUS0056419	FAVOUR CHIMDI OZIBGU	PORT HARCOURT	PORT HARCOURT	NULL	5000	PLOT 68 STADIUM ROAD RUMUOMASI	501772	NULL	5004	NULL	NULL	NULL	NULL	\N	\N	LOW	VALUED.CUSTOMER	13	MR	FAVOUR	OZIBGU	MALE	18-DEC-2000	NULL	7053831024	NULL	NULL	NULL
57389	CUS0057389	AUSTINE  AUSTINE	PORT HARCOURT	PORT HARCOURT	NULL	4200	10 OHIAMINI ELEKAHIA	777	NULL	4207	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	AUSTINE	AUSTINE	MALE	24-AUG-1978	NULL		NULL	NULL	NULL
57851	CUS0057851	AYONIMITE  DAUKORU	PORT HARCOURT	NULL	NULL	4200	55 VICTORIA ST.TOWN	777	NULL	4207	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MR	AYONIMITE	DAUKORU	MALE	30-DEC-1970	NULL	7030550056	NULL	NULL	NULL
57858	CUS0057858	RAFKA  AMID	PORT HARCOURT	PORT HARCOURT	NULL	4200	PLOT 65 TRANS AMADI IND LAYOUT	777	NULL	4207	A080890	PASSPORT	AMID RAFKA	NIS	2012-11-22	\N	MED	VALUED.CUSTOMER	11	MR	RAFKA	AMID	MALE	10-FEB-1974	NULL	8063435400	amid.rafka@yahoo.com	NULL	NULL
58502	CUS0058502	OFFICE AND HOME LTD.	PORT HARCOURT	PORT HARCOURT	NIGERIA	4800	PLOT 32 BIRABI STGRA PHASE 1	503497	NULL	4814	NULL	NULL	NULL	NULL	\N	\N	HIGH	NULL		MR	OFFICE AND HOME LTD.	OFFICE AND HOME LTD.	NULL		NULL		ocookey@hotmail.com]	NULL	NULL
58684	CUS0058684	SARAH S INTEGRATED SERVICES INTEGRA	PORT HARCOURT	NULL	NULL	4300	128 OLD REFINERY RDELELNWO	777	NULL	4303	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	14	NULL	INTEGRATED SERVICES	SARAH S INTEGRATED SERVICES	NULL		NULL		NULL	NULL	NULL
58989	CUS0058989	MICHAEL AKINNIRANYE AND CO. MICHAEL	PORT HARCOURT	PORT HARCOURT	NULL	5000	23 HOSP. RD P.H.	777	NULL	5004	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	14	NULL	MICHAEL AKINNIRANYE AND CO.	MICHAEL AKINNIRANYE AND CO.	MALE		NULL		NULL	NULL	NULL
60452	CUS0060452	ADEMOLA TAOFEEK  OGUNYEMI	PORT HARCOURT	PORT HARCOURT	NULL	4200	8 WISDOM DRIVE OFF ALCON RD WO	503497	NULL	4207	RUM5540AC	DRIVING.LICENSE	OGUNYEMI ADEMOLA TAOFEEK	FRSC	2005-12-23	\N	HIGH	VALUED.CUSTOMER	11	MR	ADEMOLA TAOFEEK	OGUNYEMI	MALE	15-DEC-1974	NULL	8037542760	TOgunyemi@slb.com	NULL	NULL
60514	CUS0060514	NENGIYEOFORI  WARIMATE	PORT HARCOURT	PORT HARCOURT	NULL	4800	BIAPU POLO COMPD,S.FILLED BORO	777	NULL	4806	GBB05734AA1	DRIVING.LICENSE	WARIMATE NENGIYEOFORI	FRSC	2006-02-16	\N	MED	NULL		MR	NENGIYEOFORI	WARIMATE	MALE	19-APR-1976	NULL		NULL	NULL	NULL
60514	CUS0060514	NENGIYEOFORI  WARIMATE	PORT HARCOURT	PORT HARCOURT	NULL	4800	BIAPU POLO COMPD,S.FILLED BORO	777	NULL	4806	GBB05734AA1	DRIVING.LICENSE	WARIMATE NENGIYEOFORI	FRSC	2006-02-16	\N	MED	NULL		MR	NENGIYEOFORI	WARIMATE	MALE	19-APR-1976	NULL		NULL	NULL	NULL
60614	CUS0060614	SEPARATED ACCOUNTS	002-PORT HARCOURT	PORT HARCOURT	NULL	4800	c.o NBM Bank	500682	NULL	4817	1122000	COMPANY.ID	SEPARATED ACCOUNTS	OTHERS	2000-12-01	\N	NULL	NULL		NULL	SEPARATED ACCOUNTS	SEPARATED ACCOUNTS	NULL	01-DEC-2000	NULL		NULL	NULL	NULL
60772	CUS0060772	JOY  PONDEI	YENAGOA BALYESA	YENAGOA	NULL	4200	MIN.OF ENVIRONMENT	777	NULL	4202	RV194264042	NATIONAL.ID	PONDEI JOY(SAL)	NIMC	2002-05-22	\N	MED	NULL		MRS	JOY	PONDEI	FEMALE	10-MAY-1970	NULL	8030992939	NULL	NULL	NULL
60844	CUS0060844	SIMEON JAMES  EGBESUKU	YENAGOA	YENAGOA	NULL	5000	MIN.OF FIN.ANDECON.PL.INT.REV.SE	777	NULL	5004	01.26.7.1745	COMPANY.ID	EGBESUKU SIMEON JAMES(SAL)	OTHERS	2002-06-05	\N	MED	NULL		MR	SIMEON JAMES	EGBESUKU	MALE	17-JUN-1960	NULL	8074238705	NULL	NULL	NULL
61165	CUS0061165	EDWIN  ONWENU	PORT HARCOURT	NULL	NULL	5000	24 CHUKWUODARA ST RUMUODARA	777	NULL	5004	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	EDWIN	ONWENU	MALE	09-MAY-1984	NULL	0	NULL	NULL	NULL
61822	CUS0061822	UZEVIE AKENGE NOBLE	YENAGOA	BAYELSA	NG	4800	4B CHIEF OBELE ST	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MR	UZEVIE	NOBLE	MALE	23-OCT-1962	NULL	8033465494	NULL	NULL	NULL
62150	CUS0062150	SARAH  AMIGBAM	YENAGOA	YENAGOA	NIG	5000	C.O BAYELSA PALMELEBELE	777	NULL	5004	NULL	NULL	NULL	NULL	\N	\N	LOW	VALUED.CUSTOMER	11	MRS	SARAH	AMIGBAM	FEMALE	25-APR-1978	NULL	7018942722	NULL	NULL	NULL
62558	CUS0062558	OBAH  WILLIAMS	YENAGOA	YENAGOA	NULL	4200	OFFICE OF THE SSG,GOVT.HOUSE	777	NULL	4207	RV194264042	NATIONAL.ID	WILLIAMS OBAH(SAL)	NIMC	2004-06-07	\N	MED	NULL		MR	OBAH	WILLIAMS	MALE	06-FEB-1978	NULL		NULL	NULL	NULL
62957	CUS0062957	STATE SCHOOL OTUOGORI STATE SCHOOL 	OGBIA LOCAL GOVT.ARE	NULL	NULL	4600	OGBIA TOWN	500706	NULL	4601	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	14	NULL	STATE SCHOOL OTUOGORI	STATE SCHOOL OTUOGORI	MALE		NULL		NULL	NULL	NULL
63010	CUS0063010	COMM.PRIMARY SCH.BUMOUNDI COMM.PRIM	EKPETIAMA LOCAL GOVT	NULL	NULL	4600	BUMOUNDI-EKPETIAMA	504752	NULL	4601	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	14	NULL	COMM.PRIMARY SCH.BUMOUNDI	COMM.PRIMARY SCH.BUMOUNDI	MALE		NULL		NULL	NULL	NULL
63055	CUS0063055	COMMUNITY PRIMARY SCHOOL TAREL COMM	EKEREMOR LOCAL GOVT.	NULL	NULL	4600	TARELA TOWN	505600	NULL	4601	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	14	NULL	COMMUNITY PRIMARY SCHOOL TAREL	COMMUNITY PRIMARY SCHOOL TAREL	MALE		NULL		NULL	NULL	NULL
63363	CUS0063363	ISHMAEL  NWOKORO	ABA	ABA	NULL	4300	68 TENANT RD	777	NULL	4304	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	ISHMAEL	NWOKORO	MALE		NULL		NULL	NULL	NULL
63381	CUS0063381	MARCEL KELECHI  NKPOZI	ABA	ABA	NULL	5900	201 OBOHIA RD	777	NULL	5905	NULL	NULL	NULL	NULL	\N	\N	LOW	NULL		MR	MARCEL KELECHI	NKPOZI	MALE	31-OCT-1996	NULL		NULL	NULL	NULL
63847	CUS0063847	FRANCIS CHUKWUMA  AGIM	ABA	ABA	NULL	4300	17 CEMETARY ROADBY 127B OKIGWE	777	NULL	4303	KAM04631AA2	DRIVING.LICENSE	AGIM FRANCIS CHUKWUMA	FRSC	2003-07-18	\N	MED	NULL		MR	FRANCIS CHUKWUMA	AGIM	MALE	27-DEC-1979	NULL	802228107	NULL	NULL	NULL
64776	CUS0064776	CHIKADIBIA M.  ONYIWA	ABA	ABA	NULL	5900	29 OKIGWE ROAD	777	NULL	5905	NULL	NULL	NULL	NULL	\N	\N	LOW	NULL		MR	CHIKADIBIA M.	ONYIWA	MALE	14-JUL-2003	NULL		NULL	NULL	NULL
64983	CUS0064983	EGBUTA UDEH NDUKWE	ABA	ABA	NIGERIA	4300	25 MBUSO ROADOFF NGWA ROAD	777	NULL	4304	NULL	NULL	NULL	NULL	\N	\N	LOW	VALUED.CUSTOMER	11	MR	EGBUTA	NDUKWE	MALE	12-JUN-1968	MARRIED	8032758828	NULL	NULL	NULL
65741	CUS0065741	EZE KINGSON  AKWARANDU	ABA	ABA	NULL	4300	NO.71 MARKET ROAD	777	NULL	4304	NULL	NULL	NULL	NULL	\N	\N	HIGH	NULL		MR	EZE KINGSON	AKWARANDU	MALE	05-JUN-1973	NULL		NULL	NULL	NULL
65849	CUS0065849	SEYI SAMUEL  FATINOYE	ABA	ABA	NULL	5000	1 YORK ST. BY PARK ROAD	777	NULL	5004	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	SEYI SAMUEL	FATINOYE	MALE		NULL		NULL	NULL	NULL
66152	CUS0066152	CHARLES OJIAKOR  UDEMEZUE	ONITSHA	ONITSHA	NULL	5000	21 ILO-OKOYE AV. ODUME LAYOUT	777	NULL	5004	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	CHARLES OJIAKOR	UDEMEZUE	MALE		NULL		NULL	NULL	NULL
66272	CUS0066272	CARDINAL ISAIAH  UMENNAIHE	ONITSHA	ONITSHA	NULL	4800	18 IHIONU STREET AWADA	777	NULL	4803	JBD4787AA1	DRIVING.LICENSE	ISAIAH CARDINAL UMENNAIHE	FRSC	2003-02-28	\N	MED	NULL		MR	CARDINAL ISAIAH	UMENNAIHE	MALE	17-DEC-1968	MARRIED		NULL	NULL	NULL
66377	CUS0066377	NONYE  ANUNOBI	ONITSHA	ONITSHA	NULL	4300	NO.9 LAWERENCE IWUAMADI STR.AW	777	NULL	4303	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MRS	NONYE	ANUNOBI	FEMALE	06-APR-1968	NULL		NULL	NULL	NULL
66917	CUS0066917	GRACIOUS POLLY INDUSTRIAL CO.L	ONITSHA,ANAMBRA STATE	ONITSHA	NULL	4300	24 OJUKWU ST FEGGE	777	NULL	4304	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	GRACOIUS POLLY INDUSTRIAL OC.L	GRACIOUS POLLY INDUSTRIAL CO.L	NULL		MARRIED	8036320183	NULL	NULL	NULL
66942	CUS0066942	ONA-JONES (NIGERIA) LIMITED	ASABA,DELTA STATE	ONITSHA	NIGERIA	5500	NO.1 JONAS OKAFOR CRESCENT	503522	NULL	5505	A1025405	PASSPORT	ONA-JONES (NIGERIA) LIMITED	NIS	2003-06-20	\N	MED	VALUED.CUSTOMER	14	MESSRS	ONA-JONAS NIGERIA LIMITED	ONA-JONES (NIGERIA) LIMITED	NULL		NULL	8033237627	NULL	NULL	NULL
67030	CUS0067030	ESTHER NKIRUKA  IGWE	ONITSHA	ONITSHA	NULL	4300	17A NTUEKE STREET AWADA	502543	NULL	4304	1485	COMPANY.ID	IGWE ESTHER NKIRUKA	OTHERS	2004-10-25	\N	MED	NULL		MISS	ESTHER NKIRUKA	IGWE	FEMALE	15-APR-1984	NULL		NULL	NULL	NULL
67069	CUS0067069	GODWIN EMMASON  IROABUCHI	ONITSHA	ONITSHA	NULL	4300	VINE OIL STATION ENU.ASABA EXP	777	NULL	4304	AK141256713	NATIONAL.ID	IROABUCHI GODWIN EMMASON	NIMC	2004-12-21	\N	MED	NULL		MR	GODWIN EMMASON	IROABUCHI	MALE	01-JAN-1978	NULL	8062843122	NULL	NULL	NULL
67160	CUS0067160	CHIDIEBERE  EZEAGU	ONITSHA	ONITSHA	NG	4800	20 OKOSI OMODI STR.WOLIWO L OU	502693	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	LOW	VALUED.CUSTOMER	13	MR	CHIDIEBERE	EZEAGU	MALE	02-MAY-2002	SINGLE		NULL	NULL	NULL
67526	CUS0067526	EDDUGO INDUSTRIES LIMITED	ONISHA	ONITSHA	NULL	5300	NO, 12A JEMIS STREET ONITSHA	777	NULL	5319	NULL	NULL	NULL	NULL	\N	\N	HIGH	VALUED.CUSTOMER	14	NULL	EDDUGO INDUSTRIES LIMITED	EDDUGO INDUSTRIES LIMITED	NULL		NULL	8045104115	NULL	NULL	NULL
68577	CUS0068577	OBASI  LAWRENCE OBASI	HEAD OFFICE IKOYI	NULL	NULL	4800	NBM BANK LTD	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	OBASI	LAWRENCE OBASI	MALE	16-APR-1964	NULL	0	NULL	NULL	NULL
68582	CUS0068582	UBANI  CHRISTIAN	TRANS AMADI 2 BRANCH	PORT HARCOURT	NULL	5300	STERLING BANK PLC	777	NULL	5318	GBB1020AB	DRIVING.LICENSE	CHRISTIAN UBANI	FRSC	2009-07-13	\N	MED	NULL		MR	UBANI	CHRISTIAN	MALE	02-JUL-1949	NULL		NULL	NULL	NULL
69188	CUS0069188	MARTIN CHUKWUDI  UDOYE	SURULERE,LAGOS	LAGOS	NULL	4200	59 MARTINSS STREET,IJESHATEDO	777	NULL	4207	A1650241	DRIVING.LICENSE	UDOYE MARTIN CHUKWUDI	FRSC	2006-09-08	\N	MED	VALUED.CUSTOMER	11	MR	MARTIN CHUKWUDI	UDOYE	MALE	31-JUL-1971	NULL		martzoye@yahoo.com	NULL	NULL
69870	CUS0069870	A.J ONYEMA ENT NIG	ACHARA LAYOUT ENUGU	ENUGU	NULL	5700	NO 37 OBIANODO STREET	777	NULL	5703	ENO20220	PASSPORT	A.J ONYEMA ENT NIG	NIS	2007-06-28	\N	LOW	NULL		MESSRS	A.J ONYEMA ENT NIG	A.J ONYEMA ENT NIG	NULL	26-JUN-2007	NULL	8036732304	NULL	NULL	NULL
70581	CUS0070581	SARKI MAHMUD USMAN 	NO 136 BUHARI CLOSE YANKABA KANO	KANO	566	4200	NO 136 BUHARI CLOSE YANKABA KANO	500851	NULL	4207	NULL	NULL	SARKI MAHMUD USMAN	.	\N	\N	MED	NULL		MR	SARKI	MAHMUD	FEMALE	27-AUG-1973	NULL	8033137955	xmood2@yahoo.com,	NULL	NULL
71524	CUS0071524	OZBIFYNE GLOBAL LIMITED  OZBIFYNE GLOBAL LIMITED	ABA	ABA	NULL	5200	668 HOSPITAL ROAD	777	NULL	5206	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	14	NULL	OZBIFYNE GLOBAL LIMITED	OZBIFYNE GLOBAL LIMITED	NULL		NULL		NULL	NULL	NULL
71529	CUS0071529	TAYE JOSHUA FATIMEHIN	ISHERI LASU EXPRESSWAY LAGOS	LAGOS	NIGERIA	5300	HOUSE 12 ROAD 17B DIAMOND EST.	777	NULL	5324	A01763551	DRIVING.LICENSE	FATIMEHIN TAYE JOSHUA	FRSC	2010-02-02	\N	MED	VALUED.CUSTOMER	12	MR	TAYE	FATIMEHIN	MALE	27-JAN-1966	NULL		tfatimehin@euroflowdesigns.com]	NULL	NULL
72385	CUS0072385	ABBAS SUNUSI  SADIQ	NASSARAWA	KANO	NULL	4200	NO 8 BELLO TERRACE ROAD	777	NULL	4207	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	ABBAS SUNUSI	SADIQ	MALE	25-JUN-1947	NULL		NULL	NULL	NULL
73110	CUS0073110	ASMAU  ABDULLATEEF	NAIBAWA	KANO	NULL	5200	NAIBAWA QTRS ALONG YANKIFI KN	777	NULL	5206	NULL	NULL	NULL	NULL	\N	\N	LOW	NULL		NULL	ASMAU	ABDULLATEEF	FEMALE	01-JUL-2004	NULL	8033305084	NULL	NULL	NULL
80626	CUS0080626	GABRIEL ADEWALE ALABA	14, EZEKIEL STR., IKEJA	LAGOS	NIGERIA	4800	14, EZEKIEL STR., IKEJA	777	NULL	4806	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MR	GABRIEL	ALABA	MALE	08-MAR-1974	MARRIED	8053083052	NULL	NULL	NULL
80781	CUS0080781	SONEYE DAMILOLA RACHEAL	LAGOS	NULL	NULL	5200	104 OBAFEMI AWOLOWO WAY IKEJA	777	NULL	5206	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MISS	SONEYE	RACHEAL	FEMALE		NULL		NULL	NULL	NULL
80818	CUS0080818	SOLEM MOTORS LIMITED	IKEJA LAGOS.	LAGOS	NIGERIA	6000	116 OBAFEMI AWOLOWO WAY	555	23401	6001	NULL	NULL	NULL	NULL	\N	\N	HIGH	VALUED.CUSTOMER	14	NULL	SOLEM MOTORS LIMITED	SOLEM MOTORS LIMITED	NULL	05-MAR-1999	NULL	8055246766	NULL	NULL	NULL
82930	CUS0082930	JUBRIL MOBOLAJI  LAWAL	GBAGADA LAGOS	LAGOS	NULL	4800	25 OLUJOBI STREET,NEAR CORONA	505564	NULL	4806	A2515650	PASSPORT	LAWAL JUBRIL MOBOLAJI	NIS	2014-02-10	\N	MED	VALUED.CUSTOMER	12	MR	JUBRIL MOBOLAJI	LAWAL	MALE	02-MAY-1968	NULL		bolaji.lawal@gtbank.com,]	NULL	NULL
84204	CUS0084204	BENDEL ABUBAKAR  MUSA	116 OJUDU OJOTA	LAGOS	NULL	4800	C.O GDS	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	BENDEL ABUBAKAR	MUSA	MALE	12-DEC-1976	NULL		NULL	NULL	NULL
87447	CUS0087447	ELOHOR MONICA  UBIKU	IKEJA	LAGOS	NULL	4200	11, ADEDEJI CLOSE, OPEBI	777	NULL	4202	A0514850	PASSPORT	UBIKU ELOHOR MONICA	NIS	2007-10-25	\N	MED	VALUED.CUSTOMER	11	MR	ELOHOR MONICA	UBIKU	MALE	07-DEC-1977	NULL	8033264991	NULL	NULL	NULL
88240	CUS0088240	OLALEKAN OKANLAWON LAWAL	ABUJA	FEDERAL CAPITAL TERRITORY	NULL	4200	BBLK 73 FLT 5 OAU QRTS WUSE 2	777	NULL	4207	NASS.PF.4632	COMPANY.ID	LAWAL OLALEKAN OKANLAWON	OTHERS	2007-10-31	\N	MED	VALUED.CUSTOMER	11	MR	OLALEKAN	LAWAL	MALE	05-JUN-1980	MARRIED	8167805114	NULL	NULL	NULL
91786	CUS0091786	ABUBAKAR GARUBA  LAWAL	APAPA	LAGOS	NULL	5700	27,ARAWOYABUNA STREET OLODI	777	NULL	5703	NS048793642	NATIONAL.ID	LAWAL ABUBAKAR GARUBA	NIMC	2006-05-24	\N	MED	NULL		ALHAJI	ABUBAKAR GARUBA	LAWAL	MALE	06-OCT-1961	NULL	8054498522	NULL	NULL	NULL
91936	CUS0091936	UCHENNA STEPHEN  NWAGU	SURULERE	LAGOS	NULL	5700	53 ABAYOMI STREET LAWASON	777	NULL	5703	IM079826117	NATIONAL.ID	NWAGU UCHENNA STEPHEN	NIMC	2006-11-06	\N	MED	NULL		MR	UCHENNA STEPHEN	NWAGU	MALE	06-JUN-1984	NULL	8037295311	NULL	NULL	NULL
92181	CUS0092181	INNOCENT ONORIODE  AGEZEH	APAPA	LAGOS	NULL	4900	35 TUNKARIMU STREET AJEGUNLE	777	NULL	4901	DT088331612	NATIONAL.ID	AGEZEH INNOCENT ONORIODE	NIMC	2007-03-01	\N	MED	VALUED.CUSTOMER	11	MR	INNOCENT ONORIODE	AGEZEH	MALE	25-FEB-1980	NULL	8038577755	inix2k@yahoo.co.uk	NULL	NULL
95952	CUS0095952	BASHIR MUHAMMAD  DAHIRU	GANDU KANO	KANO	NULL	4200	NO MAI UNGUWA STR SABUWAR	777	NULL	4207	KN084380153	NATIONAL.ID	BASHIR MUHD DAHIRU	NIMC	2007-12-14	\N	MED	NULL		MR	BASHIR MUHAMMAD	DAHIRU	MALE	03-MAY-1972	NULL		NULL	NULL	NULL
96116	CUS0096116	VIC FAME INT L LTD	PLAZA WUSE11 ABUJA	FEDERAL CAPITAL TERRITORY	NULL	5900	SUITE C8 1ST FLOOR SHERIFF	777	NULL	5901	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		NULL	VIC-FAME INT L LTD	VIC-FAME INT L LTD	NULL		NULL	8033176304	stevejoko@yahoo.com	NULL	NULL
97531	CUS0097531	OFURE SYLVIA  EGBASE	GWARIMPA ABUJA	FEDERAL CAPITAL TERRITORY	NULL	4200	HHSE 44 FLAT C SETRACO ESTATE	777	NULL	4202	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MISS	OFURE SYLVIA	EGBASE	FEMALE	01-APR-1985	NULL	8023580678	egbase85@yahoo.com	NULL	NULL
99415	CUS0099415	MADUBUIKE EMMANUEL  CHUKWU	UWANU ENUGU STATE.	ENUGU	NULL	4800	UWANI POLICE STATION ENUGU	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	MADUBUIKE EMMANUEL	CHUKWU	MALE	06-SEP-1983	MARRIED	8032791911	NULL	NULL	NULL
100014	CUS0100014	TOPE AYINKE  OLADIPUPO	LAGOS STATE	LAGOS	NULL	4900	116 IPAJA ROAD IPAJA	777	NULL	4921	OS452126992	NATIONAL.ID	OLADIPUPO TOPE AYINKE(SAL)	NIMC	2008-01-16	\N	MED	NULL		MISS	TOPE AYINKE	OLADIPUPO	FEMALE	11-NOV-1983	NULL		NULL	NULL	NULL
102668	CUS0102668	MARTIN ERAKPOW OROGUN	IKEJA LAGOS	LAGOS	NGR	4800	6, ABRAHAM AKINOLA STR	777	NULL	4806	AKR7309AE	DRIVING.LICENSE	OROGUN MARTIN ERAKPOW	FRSC	2008-01-28	\N	LOW	VALUED.CUSTOMER	12	MR	MARTIN	OROGUN	MALE	23-AUG-1967	NULL	8062609961	ademart99@yahoo.com	NULL	NULL
103682	CUS0103682	RILWANU MILO IBRAHIM	OPP NACB BANK TALATA MAFARA ZM	ZAMFARA	Nigeria	4200	TALATA MAFARA OPPOSITE MINI MK	503299	NULL	4207	A00072817	PASSPORT	RILWANU IBRAHIM MILO	NIS	2008-01-30	\N	MED	VALUED.CUSTOMER	11	MR	RILWANU	IBRAHIM	MALE	20-OCT-1960	NULL	8065282609	NULL	NULL	NULL
104952	CUS0104952	TANIMU AHMAD  SAIDU	KATSINA.	KATSINA	NULL	4200	NO.17 IBB WAY	503279	NULL	4207	KT106058127	NATIONAL.ID	SAIDU TANIMU	NIMC	2008-02-05	\N	MED	VALUED.CUSTOMER	13	MR	TANIMU AHMAD	SAIDU	MALE	17-MAY-1970	NULL	8087250125	NULL	NULL	NULL
107019	CUS0107019	MOUKARIM  UMAIYAH	KADUNA	KADUNA	NULL	4200	MMMINISTRY OF EDUCATION	777	NULL	4202	KD508532273	NATIONAL.ID	UMAIYAH MOUKARIM	NIMC	2008-02-14	\N	LOW	NULL		MRS	MOUKARIM	UMAIYAH	FEMALE	02-NOV-1981	NULL	8094946278	NULL	NULL	NULL
110104	CUS0110104	JULIE NOSA  OMOREGIE	OFF AMURE RD, BENIN CITY	BENIN	NG	4800	NO 14 TONY ANENIH AVENUE	502824	234	4803	AGL07216AA6	DRIVING.LICENSE	OMOREGIE JULIE NOSA	FRSC	2008-02-29	\N	MED	VALUED.CUSTOMER	11	MRS	JULIE NOSA	OMOREGIE	FEMALE	05-JUL-1958	NULL	0	NULL	NULL	NULL
114713	CUS0114713	ERNEST  UGWU	SANGO OTA	OGUN	NULL	4800	7 OLRUNKEMI STREET SANGO OTA	777	NULL	4803	OG786453241	NATIONAL.ID	UGWU ERNEST	NIMC	2007-03-16	\N	MED	NULL		MR	ERNEST	UGWU	MALE	15-SEP-1957	NULL	8038077089	NULL	NULL	NULL
114751	CUS0114751	OLAKUNLE TIMOTHY  OLASOJI	BALOGUN KETU IKOSI	LAGOS	NULL	4800	29 MOSHOOD STREET OFF JIMOH	777	NULL	4803	LG67521211	NATIONAL.ID	OLASOJI OLAKUNLE TIMOTHY	NIMC	2007-03-21	\N	MED	NULL		MR	OLAKUNLE TIMOTHY	OLASOJI	MALE	27-DEC-1980	NULL	8054017871	NULL	NULL	NULL
117043	CUS0117043	OLUWAFEMI AKINTAYO  ODEWUNMI	LEKKI LAGOS	LAGOS	NULL	4800	12 FREEDOM ROAD	777	NULL	4803	A0972074	PASSPORT	ODEWUNMI OLUWAFEMI AKINTAYO	NIS	2008-04-09	\N	MED	VALUED.CUSTOMER	11	MR	OLUWAFEMI AKINTAYO	ODEWUNMI	MALE	13-MAY-1979	NULL	8060631442	fodewunmi@yahoo.com	NULL	NULL
117810	CUS0117810	IBRAHIM OLALEKAN  OYINLOYE	LAGOS	LAGOS	NULL	4200	3, DOHERTY STR.	777	NULL	4207	3050745	COMPANY.ID	OYINLOYE IBRAHIM OLALEKAN	OTHERS	2008-04-14	\N	MED	VALUED.CUSTOMER	11	MR	IBRAHIM OLALEKAN	OYINLOYE	MALE	16-FEB-1979	NULL	7025340053	IBRAHIMLIKELEKAN@YAHOO.COM	NULL	NULL
131359	CUS0131359	KENNY OKORO  OTANIYUWA	RUMUCHAKARA CHOBA	PORT HARCOURT	NULL	4200	NO 9 WASOR STREET	777	NULL	4207	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	KENNY OKORO	OTANIYUWA	MALE	15-JUL-1975	SINGLE	8062455902	NULL	NULL	NULL
137255	CUS0137255	AKWUEBU OKOLIE APHHONSUS	2 GABRIEL CLOSE OJODU LAGOS	LAGOS	NULL	4200	25 HUMANI STREET SHOMOLU LAGOS	777	NULL	4207	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MESSRS	AKWUEBU	APHHONSUS	MALE	15-APR-1958	NULL		NULL	NULL	NULL
137482	CUS0137482	FRANKEN INT L INV.CO.LTD	AGEGE, LAGOS	LAGOS	NULL	4900	5 SOCILA CLUB ROAD NEW OKO OBA	777	NULL	4921	NULL	NULL	NULL	NULL	\N	\N	HIGH	VALUED.CUSTOMER	14	MESSRS	FRANKEN INTERNATIONAL INV.CO.	FRANKEN INTERNATIONAL INV.CO.	NULL	12-JAN-2001	NULL	8033338310	fraken_2004@yahoo.co.uk	NULL	NULL
147808	CUS0147808	AMBITION ELECT.& ALLIED PRO.NIG.LTD	E1818 ELECTOMAS BRIDGE HEAD	ONITSHA, ANAMBRA STATE	NIGERIA	5300	44 TONY UMEH STREET AWADA	500750	234	5312	NULL	NULL	AMBROSE EZEH	NULL	\N	\N	HIGH	VALUED.CUSTOMER	14	NULL	AMBITION ELET.AND ALLIED PRO.NIG	AMBITION ELET.AND ALLIED PRO NIG	NULL		NULL	8033315588	NULL	NULL	NULL
150420	CUS0150420	USAINI  GAJIDA	TOFA L.G.A.	KANO	NULL	5200	GAJIDA TOWN	777	NULL	5206	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	USAINI	GAJIDA	MALE	03-JUN-1968	NULL	8064705542	NULL	NULL	NULL
153699	CUS0153699	FIYINFOLUWA OLAITAN  FAGBEMI	IBADAN.	OSHUN	NULL	4900	NO 3 OLUWATEDO ST.ALAKIA	777	NULL	4921	KJA256346AB	DRIVING.LICENSE	FAGBEMI FIYINFOLUWA O.	FRSC	2008-10-22	\N	MED	NULL		MISS	FIYINFOLUWA OLAITAN	FAGBEMI	FEMALE	05-MAY-1990	NULL	8075913401	NULL	NULL	NULL
154512	CUS0154512	JOHNSON  ONIMISI	LAGOS	LAGOS	NULL	4800	66 APATA STREET SOMOLU	777	NULL	4803	LG01545512	NATIONAL.ID	ONIMISI JOHNSON	NIMC	2008-10-28	\N	MED	NULL		MR	JOHNSON	ONIMISI	MALE	15-JAN-1980	NULL	8023216960	NULL	NULL	NULL
156037	CUS0156037	BTRUS  EMMANUEL	SHOPPING COMPLEX,MAIDUGURI	MAIDUGURI	NULL	4200	SSHOP NO 34 UNIMAID COMMERCIAL	777	NULL	4202	BO116572296	NATIONAL.ID	EMMANUEL BITRUS	NIMC	2008-11-06	\N	MED	NULL		MR	BTRUS	EMMANUEL	MALE	19-SEP-1983	NULL	8073631971	NULL	NULL	NULL
156291	CUS0156291	ARIERHI ANTHONY EBIRERI	WARRI	WARRI	NG	4800	NO 11 OWHOKEOVO OKOLOBA ST	777	NULL	4803	BDG60707AA6	DRIVING.LICENSE	EBIRERI ANTHONY ARIERHI	FRSC	2008-11-10	\N	MED	VALUED.CUSTOMER	11	MR	ARIERHI	EBIRERI	MALE	21-SEP-1968	SINGLE	8077979953	NULL	NULL	NULL
205750	CUS0205750	USMAN  FATIMA	KADUNA	KADUNA	NULL	5000	C 11, ZONKWA ROAD U.RIMI KAD.	777	NULL	5004	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MISS	USMAN	FATIMA	FEMALE	25-SEP-1970	NULL		NULL	NULL	NULL
161881	CUS0161881	ETANG ANIETTE ENO	IJESHATEDE,LAGOS.	LAGOS	NULL	4800	112,MOGAJI STR.	500406	NULL	4817	GUS3327AB	DRIVING.LICENSE	ETANG ANIETTE ENO	FRSC	2008-12-19	\N	MED	NULL		MRS	ENO ANIETTE	ETANG	NULL	22-NOV-1962	NULL	8023643175	NULL	NULL	NULL
162003	CUS0162003	AHMAD MUHAMMAD  AJINGI	KUMBOTSO LGA KANO	KANO	NULL	5200	28 CHIRANCHI QTRS KUMBOTSO	777	NULL	5206	A3986111	PASSPORT	AJINGI AHMAD MUHAMMAD	NIS	2008-12-22	\N	MED	NULL		MR	AHMAD MUHAMMAD	AJINGI	MALE	25-MAR-1972	NULL	8023048184	NULL	NULL	NULL
162300	CUS0162300	MOSES JOHN  BAKUT	ZONE 2 ABUJA	FEDERAL CAPITAL TERRITORY	NULL	4200	PPLOT 516 MAMBOLO STREET WUSEA	500823	NULL	4207	A00639487	PASSPORT	BAKUT MOSES JOHN	NIS	2008-12-24	\N	MED	NULL		MR	MOSES JOHN	BAKUT	MALE	05-NOV-1969	NULL	8077110062	NULL	NULL	NULL
163251	CUS0163251	WAHEED OLANREWAJU ADEBAYO	IKOTUN	LAGOS	NULL	4800	170 IJAGEMO ROAD IJEGUN	777	NULL	4803	OG025614113	NATIONAL.ID	ADEBAYO OLANREWAJU WAHEED(SAL)	NIMC	2009-01-08	\N	MED	VALUED.CUSTOMER	11	MR	WAHEED	ADEBAYO	MALE	22-MAR-1978	NULL		NULL	NULL	NULL
169207	CUS0169207	AUGUSTINE OGOM NWAOBOSHI	73 DDPA ESTATE ASABA	ASABA	NIGERIA	4800	ISIEKE QTRS IBUSA DELTA STATE	777	NULL	4806	ASB1283AB	DRIVING.LICENSE	OGOM AUGUSTINE NWAOBOSHI	FRSC	2009-03-02	\N	HIGH	VALUED.CUSTOMER	13	MR	AUGUSTINE	NWAOBOSHI	MALE	10-AUG-1972	NULL		NULL	NULL	NULL
170002	CUS0170002	DANIEL ODAFEATERE  TINI	IKEJA,LAGOS.	LAGOS	NULL	4200	KOTS-91,ODUDUWA CRESCENT,GRA	777	NULL	4207	KOTS 9	NATIONAL.ID	TINI DANIEL ODAFEATERE(SAL AC)	NIMC	2009-03-10	\N	MED	NULL		MR	DANIEL ODAFEATERE	TINI	MALE	26-JUN-1985	NULL	8078052791	NULL	NULL	NULL
170222	CUS0170222	ANTHONIA  AMODU	235 IKORODU ROAD, ILUPEJU	LAGOS	NULL	4200	C.O AKINTOLA WILLIAMS DELOITTE	777	NULL	4207	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MISS	ANTHONIA	AMODU	FEMALE	24-AUG-1986	NULL	7080259955	tonia_amodu@yahoo.co.uk	NULL	NULL
172310	CUS0172310	IRABOR OSEZUA EJELE	GHANAAMA STR UNIPORT	PORT HARCOURT	NIGERIA	5100	NO 8 KUMASI STRRET	555	NULL	5101	GBB9242AB	DRIVING.LICENSE	EJELE OSEZUA IRABOR	FRSC	2009-03-25	\N	MED	VALUED.CUSTOMER	11	DR	IRABOR	EJELE	MALE	04-FEB-1984	NULL	7039555032	osezdomain@yahoo.com	NULL	NULL
172985	CUS0172985	UCHE PRINCEWILL  OBI	IKPOBA HILL, BENIN CITY	BENIN	NULL	4800	NO 121 BENIN AGBOR RD	777	NULL	4803	EPE05282AA	DRIVING.LICENSE	OBI UCHE PRINCEWILL	FRSC	2009-03-27	\N	MED	NULL		MR	UCHE PRINCEWILL	OBI	MALE	05-NOV-1975	NULL	8075353101	NULL	NULL	NULL
175901	CUS0175901	BLESSING ADEKUNLE  AROWOSAFE	IYANA IPAJA	LAGOS	NULL	5000	NO 4 BUNGALO AREA IFO	777	NULL	5004	A00757468	PASSPORT	AROWOSAFE BLESSING ADEKUNLE	NIS	2009-04-21	\N	MED	VALUED.CUSTOMER	11	MR	BLESSING ADEKUNLE	AROWOSAFE	MALE	01-OCT-1974	NULL	7067840481	NULL	NULL	NULL
177585	CUS0177585	AYINDE MUSILIU  ISHOLA	MUSHIN, LAGOS.	LAGOS	NULL	4200	7, ABOLADE STREET,OJUWOYE	777	NULL	4207	LG052750388	NATIONAL.ID	ISHOLA AYINDE MUSILIU	NIMC	2009-04-30	\N	MED	NULL		MR	AYINDE MUSILIU	ISHOLA	MALE	07-NOV-1955	MARRIED	8081088577	NULL	NULL	NULL
179330	CUS0179330	OLUDOLAPO OLUDARE  OGUNDAINI	HOSPITAL.	LAGOS	NULL	4800	1 RAIMI ADEDOKUN OFF GENERAL	777	NULL	4803	WRR1394AA	DRIVING.LICENSE	OGUNDAINI OLUDOLAPO OLUDARE	FRSC	2009-05-15	\N	MED	VALUED.CUSTOMER	11	MR	OLUDOLAPO OLUDARE	OGUNDAINI	MALE	07-APR-1968	NULL	8035316814	ogundaini@yahoo.com	NULL	NULL
179949	CUS0179949	EKUNDAYO SUNDAY  JIMOH	PIPELINE B.S, IDIMU, LAGOS	LAGOS	NULL	6200	6, ALHAJI KOSA STREET,	777	NULL	6202	KG064779565	NATIONAL.ID	JIMOH EKUNDAYO SUNDAY	NIMC	2009-05-21	\N	MED	NULL		MR	EKUNDAYO SUNDAY	JIMOH	MALE	02-APR-1974	NULL	8053733897	NULL	NULL	NULL
181013	CUS0181013	AYOMIKUN BUKOLA AJIMUDA	OGBA, LAGOS.	LAGOS	NIGERIA	4800	23,ATANDA OLU STREET OKE-IRA	555	NULL	4808	OD045092903	NATIONAL.ID	AJIMUDA AYOMIKUN BUKOLA	NIMC	2009-05-28	\N	NULL	VALUED.CUSTOMER	13	MISS	AYOMIKUN	AJIMUDA	FEMALE	09-APR-2009	NULL	8034252729	ayodele.ajimuda2016@gmail.com	NULL	NULL
182911	CUS0182911	DIRISU BROTHERS NIGERIA LIMITD	SATTALITE TOWN LAGOS	LAGOS	NULL	6200	INV LIMITED 20 MOBIL ROAD	777	NULL	6202	A0960233	PASSPORT	DIRISU BROTHERS NIGERIA LIMITD	NIS	2006-05-12	\N	HIGH	NULL		NULL	DIRISU BROTHERS NIGERIA LIMITD	DIRISU BROTHERS NIGERIA LIMITD	NULL	22-SEP-1994	NULL		NULL	NULL	NULL
183271	CUS0183271	UCHECHI HENRY UKONU	ASOKORO ABUJA F.C.T	FEDERAL CAPITAL TERRITORY	NIGERIA	4200	NONIBER TEN FATAI WILLIAM STRE	500803	234	4207	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MR	UCHECHI	UKONU	MALE	23-OCT-1981	NULL	0	NULL	NULL	NULL
183633	CUS0183633	STONESAND ELKEVINS ENG.CO LTD	MANDO KADUNA	KADUNA	NULL	4800	PLOT LI-5 CHIEF KELVIN UKAEGBU	508021	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	HIGH	VALUED.CUSTOMER	11	NULL	STONES AND ELKEVINS ENG.CO LTD	STONESAND ELKEVINS ENG.CO. LTD	NULL	04-NOV-1987	NULL	8034534256	NULL	NULL	NULL
184906	CUS0184906	BUKOLA ABIOYE  SANNI	AKURE	AKURE	NULL	4200	58,AKINIRANYE STR	777	NULL	4207	ODO926525579	NATIONAL.ID	SANNI ABIOYE BUKOLA	NIMC	2009-06-19	\N	MED	NULL		MISS	BUKOLA ABIOYE	SANNI	FEMALE	20-AUG-1983	SINGLE		NULL	NULL	NULL
186062	CUS0186062	EBERE CHARITY OBIAGWU	UNITY RD KANO	KANO	NIGERIA	4800	NO 15 UNITY ROAD	777	NULL	4806	AB583046027	NATIONAL.ID	OBIAGWU EBERE	NIMC	2009-06-26	\N	MED	VALUED.CUSTOMER	11	MISS	EBERE	OBIAGWU	FEMALE	22-JUN-1985	SINGLE	8152355859	NULL	NULL	NULL
191216	CUS0191216	MICHAEL  UDOH	APAPA	LAGOS	NULL	4900	20,CARDOSO ST.AJEGUNLE APAPA	777	NULL	4901	AK039224103	NATIONAL.ID	UDOH MICHAEL	NIMC	2009-07-24	\N	MED	VALUED.CUSTOMER	11	MR	MICHAEL	UDOH	MALE	21-DEC-1981	NULL	8062451252	NULL	NULL	NULL
194109	CUS0194109	SULEIMAN MUSA  FAROUK	ABUJA	FEDERAL CAPITAL TERRITORY	NULL	4200	C.O NATIONAL ASSEMBLY	777	NULL	4207	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	SULEIMAN MUSA	FAROUK	MALE	16-FEB-1969	NULL	8055263086	NULL	NULL	NULL
194141	CUS0194141	BULRMA ABDULAZIZ  GARIYO	AREA2 GARKI ABUJA	FEDERAL CAPITAL TERRITORY	NULL	4200	BLOCK 3FLAT 4 GONGOLA STREET	500802	NULL	4207	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	BULRMA ABDULAZIZ	GARIYO	MALE	01-OCT-1977	NULL	8033868544	NULL	NULL	NULL
201006	CUS0201006	SAMI DIB  RABIH	VICTORIA ISLAND	VICTORIA ISLAND	NULL	4200	21B ADEYEMO ALAKIJA STREET	777	NULL	4207	LND03517AA4	DRIVING.LICENSE	RABIH SAMI DIB	FRSC	2009-09-25	\N	MED	VALUED.CUSTOMER	11	MR	SAMI DIB	RABIH	MALE	02-MAY-1988	NULL		vishowroom@gmail.com,]	NULL	NULL
201906	CUS0201906	RAPHAEL AKINKUNMI  AKINBIYI	LAGOS	LAGOS	NULL	4200	PLOT C13.14 ROAD 26 VGC AJAH	777	NULL	4207	EKY58230AA7	DRIVING.LICENSE	AKINBIYI RAPHAEL AKINKUNMI	FRSC	2009-09-30	\N	MED	VALUED.CUSTOMER	11	MR	RAPHAEL AKINKUNMI	AKINBIYI	MALE	29-DEC-1979	NULL		pakirosky@yahoo.com,]	NULL	NULL
204246	CUS0204246	AKINDIJI RICHARD  FADEYI	MAFOLUKU	LAGOS	NULL	5200	18, AYOOLA SEMIDE ST.EWUTUNTUN	777	NULL	5206	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MR	AKINDIJI RICHARD	FADEYI	MALE	18-JAN-1956	NULL		rich_fad@yahoo.com]	NULL	NULL
204943	CUS0204943	LONGINUS NWAOGU ALARIKE	LAGOS	LAGOS	NIGERIA	4800	25 AJOSE STR AMUKOKO	777	NULL	4806	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MR	LONGINUS	ALARIKE	MALE	24-MAR-1950	NULL	8178779050	NULL	NULL	NULL
205663	CUS0205663	DANIEL FESTUS  UHANANGHO	KADUNA	KADUNA	NULL	6200	NO 19 MAKARANTA ST U.YELWA T..	777	NULL	6202	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	DANIEL FESTUS	UHANANGHO	MALE	01-NOV-1968	NULL		NULL	NULL	NULL
206027	CUS0206027	SSGP RABIU  GARBA	RIBADO CONT. KADUNA	KADUNA	NULL	4200	BLOCK 21 81 BARRACK FLAT 2	777	NULL	4202	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	SSGP RABIU	GARBA	MALE	15-MAY-1960	NULL	8057043690	NULL	NULL	NULL
209582	CUS0209582	EFE  KORHOKORHO	AREA COMMAND UGHELLI TOWN	ASABA	NULL	5200	NO 11 OLOHO STREET UGHELLUI	777	NULL	5206	DT456331	NATIONAL.ID	KORHOKORHO EFE	NIMC	2009-12-01	\N	MED	VALUED.CUSTOMER	11	MR	EFE	KORHOKORHO	MALE	04-MAY-1984	NULL		NULL	NULL	NULL
211760	CUS0211760	DOTSTEVE NIGERIA LIMITED	PORT HARCOURT RIVERS STATE	PORT HARCOURT	NULL	6200	NO.12 WORGU STREET D.LINE	500688	NULL	6202	PHC7689AA	DRIVING.LICENSE	DOTSTEVE NIGERIA LIMITED	FRSC	2009-12-17	\N	MED	NULL		NULL	DOTSTEVE NIGERIA LIMITED	DOTSTEVE NIGERIA LIMITED	NULL	20-FEB-2002	NULL		stebalog@yahoo.com]	NULL	NULL
212459	CUS0212459	MODUPE OLUWAKEMI  AYODELE	ISHERI	LAGOS	NULL	4200	PLOT6 BLK 34 MAGODO PHASE 1	500576	NULL	4207	A3449622A	PASSPORT	AYODELE MODUPE OLUWAKEMI	NIS	2009-12-23	\N	MED	VALUED.CUSTOMER	11	MISS	MODUPE OLUWAKEMI	AYODELE	FEMALE	14-NOV-1985	NULL	8088666446	modupeoluwakemi@yahoo.com	NULL	NULL
213866	CUS0213866	OMOLARA FLORENCE  ADEBAYO	IKEJA	LAGOS	NULL	4900	62 OPEBI ROAD,	500580	NULL	4921	BDG5499AA3	DRIVING.LICENSE	ADEBAYO OMOLARA FLORENCE	FRSC	2010-01-13	\N	MED	NULL		MISS	OMOLARA FLORENCE	ADEBAYO	FEMALE	24-SEP-1984	NULL	8050570910	NULL	NULL	NULL
216205	CUS0216205	AUGUSTINE OGBONNA  NWODO	ABULE EGBA	LAGOS	NULL	4300	NO 4 GBADAMOSI CLOSE U TURN	777	NULL	4304	SGM01648AA1	DRIVING.LICENSE	NWODO AUGUSTINE OGBONNA	FRSC	2010-02-01	\N	MED	NULL		MR	AUGUSTINE OGBONNA	NWODO	MALE	31-OCT-1976	NULL		NULL	NULL	NULL
216858	CUS0216858	SADIK ISIAKA  SADIK ISIAKA	NO.17-19 NIGER STREET KANO.	KANO	NULL	4800	ROYAL TROPICANA HOTEL	777	NULL	4806	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		NULL	SADIK ISIAKA	SADIK ISIAKA	MALE		NULL		NULL	NULL	NULL
217436	CUS0217436	ISAH ABDULKARIM  KUCHERI	AIRPORT,RD	KANO	NULL	4200	303 FLYING TRAINING SCHOOL	777	NULL	4207	KN369852145	NATIONAL.ID	KUCHERI  ISAH ABDULKARIM	NIMC	2007-05-10	\N	MED	NULL		MR	ISAH ABDULKARIM	KUCHERI	MALE	01-JAN-1970	NULL	7034565462	NULL	NULL	NULL
218312	CUS0218312	ARINZE  UNACHUKWUANUGO	OPP SIZZLERS FAST FOOD	WARRI	NULL	5200	0147 OKUMAGBA AVENUE	777	NULL	5206	ANI84691403	NATIONAL.ID	UNACHUKWUANUGO ARINZE	NIMC	2010-02-11	\N	NULL	NULL		MR	ARINZE	UNACHUKWUANUGO	MALE	18-JUN-1985	MARRIED		NULL	NULL	NULL
218842	CUS0218842	STARRING MATS IND LTD	NASSARAWA	KANO	NULL	5300	NO 178 INDEPENDENCE ROAD,BOMPA	777	NULL	5312	RC696546]A2728754	COMPANY.ID]PASSPORT	STARRING MATS IND LTD]STARRING MATS IND LTD	OTHERS]NIS	\N	\N	NULL	VALUED.CUSTOMER	13	NULL	STARRING MATS IND LTD	STARRING MATS IND LTD	NULL		NULL	8098216666	NULL	NULL	NULL
222669	CUS0222669	MARTINS TAIYE  ADEBAYO	ADP BNIN CITY	EDO	NULL	4800	34,OMOREGIE STR OFF OKO	777	NULL	4803	90F5B02A36296397719]UBJ22218AA	VOTERS.IDENTITY.CARD]DRIVING.LICENSE	ADEBAYO MARTINS TAIYE]ADEBAYO MARTINS TAIYE	INEC]FRSC	\N	\N	MED	VALUED.CUSTOMER	13	MR	MARTINS TAIYE	ADEBAYO	MALE	20-FEB-1982	NULL	8034436937	NULL	NULL	NULL
224477	CUS0224477	JOSEPH PADDY  KINGSLEY	IKOYI, LAGOS	LAGOS	NULL	5200	3B KURAMO CLOSE	777	NULL	5206	KD128525901	NATIONAL.ID	KINGSLEY JOSEPH PADDY	NIMC	2010-03-25	\N	MED	NULL		MR	JOSEPH PADDY	KINGSLEY	MALE	19-JUL-1984	NULL		NULL	NULL	NULL
227052	CUS0227052	ONYEKACHI GRACE  ANYANWU	CALABAR	CROSS RIVERS	NULL	4900	3,EKONG ETA ROAD	777	NULL	4921	CR.10A.1816	NATIONAL.ID	ANYANWU ONYEKACHI GRACE	NIMC	2010-04-14	\N	MED	VALUED.CUSTOMER	13	MRS	ONYEKACHI GRACE	ANYANWU	FEMALE	15-SEP-1984	NULL	80612551011	NULL	NULL	NULL
231376	CUS0231376	MURTALA FAROUQ SANI KAFINGA	GWALE	KANO	NIGERIA	5200	NO 52 JINGAU QTRS	777	NULL	5206	KN012053043	NATIONAL.ID	KAFINGA MURTALA F.	NIMC	2010-04-30	\N	MED	VALUED.CUSTOMER	11	MR	MURTALA	KAFINGA	MALE	24-DEC-1984	SINGLE	8039345450	NULL	NULL	NULL
233549	CUS0233549	MUNKAILA  IBRAHIM	GIMI-NINGI LOCAL GOVERNMENT	BAUCHI	NULL	4200	BESIDE GIMI PRIMARY SCHOOL	777	NULL	4207	BA109298248	NATIONAL.ID	IBRAHIM MUNKAILA	NIMC	2010-05-18	\N	MED	VALUED.CUSTOMER	11	MR	MUNKAILA	IBRAHIM	MALE	08-AUG-1983	NULL	8126166120	NULL	NULL	NULL
234424	CUS0234424	ONYEBUCHI CHIDIMMA	ONITSHA, ANAMBRA STATE	ONITSHA	NULL	6000	SCHOOL OF BASIC SCHOOL,	777	NULL	6005	AK185451573	NATIONAL.ID	ONYEBUCHI CHIDIMMA	NIMC	2010-05-24	\N	MED	NULL		MISS	CHIDIMMA	ONYEBUCHI	NULL	01-MAY-1986	NULL		NULL	NULL	NULL
236881	CUS0236881	FRANK UCHE  OSANEBI	WARRI	WARRI	NULL	5000	NO 147 WARRI SAPELE RD	777	NULL	5004	DT 077785156	NATIONAL.ID	OSANEBI FRANK UCHE	NIMC	2010-06-08	\N	MED	VALUED.CUSTOMER	11	MR	FRANK UCHE	OSANEBI	MALE	22-MAR-1980	NULL	7059873116	NULL	NULL	NULL
237240	CUS0237240	NKEIRUKA IKECHUKWU  ONYEGBULA	OLODI APAPA	LAGOS	NULL	4800	NO 36 AKOGUN STREET,	777	NULL	4803	APP06274AA6	DRIVING.LICENSE	ONYEGBULA NKEIRUKA IKECHUKWU	FRSC	2010-06-10	\N	LOW	VALUED.CUSTOMER	13	MR	NKEIRUKA IKECHUKWU	ONYEGBULA	MALE	10-OCT-2000	SINGLE	8020927378	NULL	NULL	NULL
237994	CUS0237994	TEMITAYO  AGUNBIADE	MURI OKUNOLA V.I LAGOS	LAGOS	NULL	4800	2205 ABIOLA AJAYI	777	NULL	4803	LGB39211AA1	DRIVING.LICENSE	AGUNBIADE TEMITAYO TAWAKALIT	FRSC	2010-06-16	\N	NULL	VALUED.CUSTOMER	11	MR	TEMITAYO	AGUNBIADE	MALE	06-SEP-1979	NULL	8052748366	NULL	NULL	NULL
241029	CUS0241029	PATIENCE TOLULOPE  JAYEOLA	CENTRE NEW SITE KANO	KANO	NULL	4900	BAYERO UNIVERSITY,STUDENT	777	NULL	4921	SCI.08.BIO.00551	COMPANY.ID	PATIENCE TOLULOPE JAYEOLA	OTHERS	2010-07-01	\N	MED	VALUED.CUSTOMER	11	MISS	PATIENCE TOLULOPE	JAYEOLA	FEMALE	13-DEC-1990	NULL	8065566583	NULL	NULL	NULL
241102	CUS0241102	HAKEEM ADEBAYO  SANNI	ISHERI	LAGOS	NULL	4200	10 SOKUNBI STREET	777	NULL	4207	OD058593589	NATIONAL.ID	SANNI HAKEEM ADEBAYO	NIMC	2010-07-02	\N	MED	VALUED.CUSTOMER	11	MR	HAKEEM ADEBAYO	SANNI	MALE	01-DEC-1974	NULL		sannidudu@yahoo.com,]	NULL	NULL
241162	CUS0241162	ABDULGANIYU  SHEHU	7 ADEMOLU STR,HOUSE 7 IBA EST	LAGOS	NULL	4800	NNO88.92 BROAD STREET LAGOS	777	NULL	4817	ED04122541	NATIONAL.ID	SHEHU ABDULGANIYU	NIMC	2010-07-02	\N	MED	NULL		MR	ABDULGANIYU	SHEHU	MALE	22-DEC-1963	NULL	8069440892	NULL	NULL	NULL
241840	CUS0241840	EKPE NTA BASSEY	CALABAR	CROSS RIVERS	NIGERIA	4900	139 OLD ODUKPANI LGA	508623	NULL	4921	A3478306A	PASSPORT	BASSEY EKPE NTA	NIS	2010-07-08	\N	HIGH	VALUED.CUSTOMER	11	MR	EKPE	BASSEY	MALE	13-JAN-1976	MARRIED	8033428543	NULL	NULL	NULL
242060	CUS0242060	CHINWENDU CLINICS AND MATERNITY  CHINWENDU CLINICS AND MATERNITY	129 OKIGWE ROAD ABA	ABA	NULL	6400	129 OKIGWE ROAD ABA	502596	NULL	6401	KAM08878AA	DRIVING.LICENSE	CHINWENDU CLINICS AND MATERNITY	FRSC	2010-07-09	\N	MED	VALUED.CUSTOMER	14	NULL	CHINWENDU CLINICS AND MATERNITY	CHINWENDU CLINICS AND MATERNITY	MALE		NULL	8033418221	NULL	NULL	NULL
242272	CUS0242272	DIAFE  EFE	CENTRAL HOSPITAL UGHELLI	WARRI	NULL	5200	6 UGHELLI WARRI ROAD	777	NULL	5206	DT513411280	NATIONAL.ID	EFE DIAFE	NIMC	2010-07-13	\N	MED	NULL		MISS	DIAFE	EFE	FEMALE	11-OCT-1977	SINGLE		NULL	NULL	NULL
242529	CUS0242529	OLUKAYODE OLUFEMI  ORUKOTAN	UTAKO, ABUJA.	FEDERAL CAPITAL TERRITORY	NULL	4900	MARLIMA CATHERING SERVICES	777	NULL	4902	OG040348573	NATIONAL.ID	ORUKOTAN OLUKAYODE O	NIMC	2010-07-14	\N	MED	NULL		MR	OLUKAYODE OLUFEMI	ORUKOTAN	MALE	30-SEP-1979	NULL		NULL	NULL	NULL
290316	CUS0290316	HABINELL RESOURCES	MGBUCHI RUKPOKWU PHC	PORT HARCOURT	NULL	4500	NO 1 IHUNWO CLOSE	777	NULL	4502	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		NULL	HABINELL RESOURCES	HABINELL RESOURCES	NULL		NULL	8035281035	NULL	NULL	NULL
244486	CUS0244486	DIVINE BLESSING  ALEXANDER	DIOBU	PORT HARCOURT	NIGERIAN	4200	89 AFIKPO STREET MILE 1	777	NULL	4207	AK671945017	NATIONAL.ID	ALEXANDER DIVINE BLESSING	NIMC	2010-07-30	\N	MED	VALUED.CUSTOMER	11	MRS	DIVINE BLESSING	ALEXANDER	FEMALE	04-JUL-1981	NULL	9083922286	NULL	NULL	NULL
245052	CUS0245052	SANI  KABIRU	NASARAWA SAMARU GUSAU	ZAMFARA	NULL	4200	MIN OF ENVIROMENT GUSAU	777	NULL	4207	ZF167529388	NATIONAL.ID	KABIRU SANI	NIMC	2010-08-04	\N	MED	NULL		MR	SANI	KABIRU	MALE	15-AUG-1973	MARRIED		NULL	NULL	NULL
246085	CUS0246085	LEKE DAVIES  OGUNBEMI	IJORA LAGOS	LAGOS	NULL	4800	WATER HOUSE IJORA LAGOS	777	NULL	4817	GBB5906AC	DRIVING.LICENSE	OGUNBEMI LEKE DAVIES	FRSC	2010-08-13	\N	MED	VALUED.CUSTOMER	11	MR	LEKE DAVIES	OGUNBEMI	MALE	15-AUG-1982	NULL	8030661519	lekedavies@yahoo.com	NULL	NULL
247086	CUS0247086	ABDULKARIMU AND SIBA ADIJATU JIMOH	STADIUM RD ILORIN	KWARA	NIGERIA	4900	NO 14 CIROMA CLOSE OFF 47	777	234	4921	SBG85819AAL	DRIVING.LICENSE	ALHAJ A K AND ALHAJA S A JIMOH	FRSC	2010-08-23	\N	MED	VALUED.CUSTOMER	11	MR.&.MRS	ABDULKARIMU	JIMOH	MALE	05-DEC-1942	NULL		NULL	NULL	NULL
247404	CUS0247404	IDAYATU AWENI  OLADEINDE	SABO ABEOKUTA	ABEOKUTA	NULL	5200	AOLAD STREET TEMIDIRE	777	NULL	5206	A00008141	PASSPORT	OLADEINDE IDAYATU AWENI	NIS	2010-08-25	\N	MED	NULL		MRS	IDAYATU AWENI	OLADEINDE	FEMALE	11-OCT-1964	MARRIED	8037251882	NULL	NULL	NULL
247784	CUS0247784	KOLAWOLE PAUL  AJIMUDA	MARINA LAGOS	LAGOS	NULL	5700	68 MARINA LAGOS	777	NULL	5706	OD024533347	NATIONAL.ID	AJIMUDA KOLAWOLE	NIMC	2010-08-27	\N	MED	NULL		MR	KOLAWOLE PAUL	AJIMUDA	MALE	07-JUL-1983	NULL	7062958614	NULL	NULL	NULL
248181	CUS0248181	JANET  OBIDA	MARINA LAGOS	LAGOS	NULL	4800	68 MARINA LAGOS	777	NULL	4803	ADK1844AB	DRIVING.LICENSE	OBIDA JANET(SAL)	FRSC	2010-08-31	\N	MED	NULL		MISS	JANET	OBIDA	FEMALE	26-JUL-1982	NULL	7064934274	NULL	NULL	NULL
248610	CUS0248610	TONY OGUGUA  OJIBAH	56D WATER WORKS RD OMAGBA ONITSHA	ANAMBRA	NIGERIA	4800	56D WATER WORKS RD OMAGBA ONITSHA	777	234	4803	A11745056	VOTERS.IDENTITY.CARD	OJIBAH TONY OGUGUA	INEC	2011-01-26	2020-12-31	MED	VALUED.CUSTOMER	11	MR	TONY OGUGUA	OJIBAH	MALE	26-JUN-1968	DIVORCED	7033213838	tonyojibah77@yahoo.co.uk	NULL	NULL
248783	CUS0248783	STEPHENSON SUNDAY  DADA	OFF ETETE RD, GRA, BENIN CITY	BENIN	NULL	5800	39B, AGBOROFO STREET	777	NULL	5801	A00365315	PASSPORT	DADA STEPHENSON SUNDAY	NIS	2010-09-07	\N	MED	VALUED.CUSTOMER	11	MR	STEPHENSON SUNDAY	DADA	MALE	18-SEP-1980	MARRIED	7031637772	NULL	NULL	NULL
249461	CUS0249461	SAMUEL ELO  ONOMUNO	WARRI	WARRI	NULL	5700	DD 19 I.W.O. QUARTERS	777	NULL	5706	SMK05976AA	DRIVING.LICENSE	ONOMUNO ELO SAMUEL	FRSC	2010-09-16	\N	MED	NULL		MR	SAMUEL ELO	ONOMUNO	MALE	04-NOV-1985	NULL	7033229102	NULL	NULL	NULL
250149	CUS0250149	OMOLOLA BUSOLA  ADETAYO	IKORODU	LAGOS	NULL	5300	1 OREMOLU ROAD, AGBELE	777	NULL	5310	A0104433	PASSPORT	ADETAYO OMOLOLA BUSOLA	NIS	2010-09-22	\N	MED	NULL		MISS	OMOLOLA BUSOLA	ADETAYO	FEMALE	27-APR-1987	NULL		NULL	NULL	NULL
250629	CUS0250629	SHEHU  DATTI	KATAGUM	BAUCHI	NULL	4200	SARDAUNA ROAD AZARE	777	NULL	4206	28092010	COMPANY.ID	DATTI SHEHU	OTHERS	2010-09-28	\N	MED	VALUED.CUSTOMER	11	MR	SHEHU	DATTI	NULL	20-JUN-1981	NULL	7065683479	NULL	NULL	NULL
250846	CUS0250846	OGEDENGBE  AYODELE	AKURE	AKURE	NULL	5700	10,OMONIYI ADEBOLA LAYOUT	777	NULL	5706	EK95124755	NATIONAL.ID	AYILOGE AYODELE OGEDENGBE	NIMC	2010-09-29	\N	MED	NULL		MESSRS	OGEDENGBE	AYODELE	MALE	04-JUN-1947	MARRIED		NULL	NULL	NULL
251232	CUS0251232	OLAYINKA ADEBOWALE  IBIDOJA	WOJI,PH	PORT HARCOURT	NULL	4200	13 SOLOMON OGBONDA STR,MINI	777	NULL	4207	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MR	OLAYINKA ADEBOWALE	IBIDOJA	MALE	27-APR-1970	NULL		yinkibid@yahoo.co.uk,]	NULL	NULL
251402	CUS0251402	JULIET OGBEIALU  UKA	ELELENWO PORTHARCOURT	PORT HARCOURT	NULL	4200	30 STREET ELIMINIGWE ESTATE	777	NULL	4207	DEG08952AA1	DRIVING.LICENSE	UKA JULIET OGBEIALU	FRSC	2006-11-13	\N	MED	NULL		MRS	JULIET OGBEIALU	UKA	FEMALE	25-JAN-1952	NULL	8024176506	NULL	NULL	NULL
251773	CUS0251773	KENNETH  SAALE KENNETH	PH	PORT HARCOURT	NULL	4200	W.SHIPA AFRICA-2 CIRCULAR	777	NULL	4207	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	KENNETH	SAALE KENNETH	MALE	27-JUL-1972	NULL		NULL	NULL	NULL
253847	CUS0253847	ODUNOLA KAFAYAT  MURITALA	ORE ONDO STATE	ORE	NIGERIA	4600	C.O AGIKSON FILLING STATION	500636	NULL	4604	OS610576015	NATIONAL.ID	MURITALA ODUNOLA KAFAYAT	NIMC	2010-10-15	\N	MED	VALUED.CUSTOMER	11	MISS	ODUNOLA KAFAYAT	MURITALA	FEMALE	11-FEB-1985	NULL		]	NULL	NULL
254323	CUS0254323	NNAMDI  NWANMOR	ONITSHA	ONITSHA	NULL	5700	N NO E.526 BRIDGE HEAD MKT	555	NULL	5706	AGL4433AA	DRIVING.LICENSE	NWANMOR NNAMDI	FRSC	2010-10-21	\N	MED	VALUED.CUSTOMER	11	MR	NNAMDI	NWANMOR	MALE	01-FEB-1974	MARRIED		NULL	NULL	NULL
254833	CUS0254833	OLAYEMI TARINABO  YOUSUO	WARRI	WARRI	NULL	6000	8 CHRISTIAN STREET EDJEBA	777	NULL	6004	UG.05.0412	COMPANY.ID	YOUSUO OLAYEMI TARINABO	OTHERS	2010-10-27	\N	MED	NULL		MISS	OLAYEMI TARINABO	YOUSUO	FEMALE	13-MAY-1987	SINGLE		NULL	NULL	NULL
255115	CUS0255115	MUHAMMAD HADI  MAMUNU	EMIRS PALACE RD, K.M.C	KANO	NULL	4800	NO.43 KANKAROFI QTRS.	777	NULL	4803	KN082641281	NATIONAL.ID	MAMUNU  HADI	NIMC	2010-10-29	\N	MED	VALUED.CUSTOMER	11	ALHAJI	MUHAMMAD HADI	MAMUNU	MALE	15-FEB-1955	NULL		NULL	NULL	NULL
258325	CUS0258325	IBRAHIM  TIJJANI	JIGAWA,JIGAWA STATE	JIGAWA	NULL	4800	KOFAR GABAS BABURA TOWN	777	NULL	4803	TEC.07.MEC.00072	COMPANY.ID	TIJJANI IBRAHIM	OTHERS	2010-11-30	\N	MED	VALUED.CUSTOMER	11	MR	IBRAHIM	TIJJANI	MALE	11-NOV-1988	NULL	8060121230	NULL	NULL	NULL
259452	CUS0259452	FOLASHADE  LATEEFAT	OLODI APAPA LAGOS	LAGOS	NULL	4800	11 BASIRU LANE OLODI APAPA	555	NULL	4803	OY06223957	NATIONAL.ID	OLANREWAJU LATEEFAT FOLASHADE	NIMC	2010-12-09	\N	NULL	NULL		MASTER	FOLASHADE	LATEEFAT	MALE	01-NOV-2010	NULL	8054284378	NULL	NULL	NULL
261587	CUS0261587	DEXTER AND HACHA INTER. LTD	ELEPARAWON	PORT HARCOURT	NULL	4900	3 TOMMY CLOSE	502387	NULL	4902	NULL	NULL	NULL	NULL	\N	\N	HIGH	NULL		NULL	DEXTER AND HACHA INTER. LTD	DEXTER AND HACHA INTER. LTD	NULL		NULL		NULL	NULL	NULL
262174	CUS0262174	TOYIN FLORENCE ODELEYE	AYETORO AREA OSOGBO	OSOGBO	NG	4800	NO 25 SHITU STREET	777	NULL	4803	AWK8016AB	DRIVING.LICENSE	ADEWOYE BISOLA	FRSC	2011-01-11	\N	MED	VALUED.CUSTOMER	11	MISS	TOYIN	ODELEYE	FEMALE	13-FEB-1982	SINGLE	7035853972	NULL	NULL	NULL
264717	CUS0264717	SALLAFIN ENTERPRISES	KADUNA.	KADUNA	NGN	4900	NNO.7 YUSUF ABOKI STREET,	503335	NULL	4902	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	14	NULL	SALLAFIN ENTERPRISES	SALLAFIN ENTERPRISES	NULL		NULL	8054437084	NULL	NULL	NULL
265998	CUS0265998	DAYO  IKUGBAIGBE	KETU	LAGOS	NGR	6200	39 IGBOHO STREET ALAPERE	777	NULL	6206	OS120436231	NATIONAL.ID	IKUGBAIGBE DAYO	NIMC	2011-02-11	\N	MED	VALUED.CUSTOMER	11	MR	DAYO	IKUGBAIGBE	MALE	04-OCT-1978	NULL		ikugbaigbedayo@yahoo.com,]	NULL	NULL
267254	CUS0267254	IKWUEZE OKWUDILI GODSWIN	NEW L.O ENUGU	ENUGU	NULL	4600	NO 6 OBIAGU ROAD OGUI	777	NULL	4604	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	OKWUDILI GODSWIN	IKWUEZE	NULL	22-JUN-1987	NULL		NULL	NULL	NULL
268539	CUS0268539	UMAR  	NASSARAWA LGA	KANO	NULL	5300	GIDAN MAISIKELI DAKATA QTRS	777	NULL	5318	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		NULL	UMAR	NULL	NULL	20-MAY-1950	NULL		NULL	NULL	NULL
271049	CUS0271049	UJU IFEOMA  UZOETUE	LAGOS	LAGOS	NULL	6200	11B ADEOYE STREET ORILE IGANMU	777	NULL	6201	AN672712127	NATIONAL.ID	UZOETUE UJU IFEOMA	NIMC	2011-03-25	\N	MED	VALUED.CUSTOMER	11	MISS	UJU IFEOMA	UZOETUE	FEMALE	23-JUN-1983	NULL	8062534049	ujuuzoetue@yahoo.com	NULL	NULL
272275	CUS0272275	BUSAYO OMOROYEWA  ADIGUN	OSOGBO, OSUN	OSHUN	NULL	5200	OBE S COMPOUND ILOBA	555	NULL	5205	FST41806AA5	DRIVING.LICENSE	ADIGUN BUSAYO OMOROYEWA	FRSC	2011-04-01	\N	MED	NULL		MISS	BUSAYO OMOROYEWA	ADIGUN	FEMALE	23-AUG-1989	NULL	8062966871	NULL	NULL	NULL
272869	CUS0272869	MOSES RAWEN  MAMEN	OFF DAWSON RD, BENIN CITY	BENIN	NULL	4800	2, OGHOGHO STREET	777	NULL	4803	ED57888899	NATIONAL.ID	MAMEN MOSES RAWEN	NIMC	2011-04-05	\N	MED	NULL		MR	MOSES RAWEN	MAMEN	MALE	04-DEC-1990	SINGLE	8184516710	NULL	NULL	NULL
273832	CUS0273832	ANAMEZE ANTHONY CHUKWUDI	26 OKIGWE ROAD, ABA	ABA	NULL	4200	C.O GUARDSMARK NIG.LIMITED	777	NULL	4207	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MR	ANAMEZE	CHUKWUDI	MALE	13-DEC-1982	NULL	8051055620	NULL	NULL	NULL
273941	CUS0273941	EMMANUELA ONYEIJEOMA  NNODIM	52 NWEKE STREET,UMUNGASI,ABA	ABA	NULL	4200	52 NWEKE STREET,UMUNGASI,ABA	777	NULL	4207	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MISS	EMMANUELA ONYEIJEOMA	NNODIM	FEMALE	17-SEP-1983	NULL		mnuelannodim@yahoo.com,]	NULL	NULL
274130	CUS0274130	CHINELO MEDLINE  IWUCHUKWU	OR NO.10 ST EUGENE STR,ABA	ABA	NIGERIA	4200	C.O PINESFIELD INV,30 JUBILEE	502534	NULL	4207	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MISS	CHINELO MEDLINE	IWUCHUKWU	FEMALE	10-OCT-1979	NULL		nelo4ever2004@yahoo.com]	NULL	NULL
274211	CUS0274211	SUNDAY OGOCHUKWU LINDA	23 BRIGHT STREET OFF 63 PH.RD	ABA	NULL	5900	23 BRIGHT STREET OFF 63 PH.RD	777	NULL	5904	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MISS	SUNDAY	LINDA	FEMALE	27-NOV-1983	NULL	8076426692	NULL	NULL	NULL
276002	CUS0276002	VERO  OLANREWAJU	LEKKI LAGOS	LAGOS	NULL	4800	7A ELETU STREET AWOYAYA	555	NULL	4803	ED0552976601	NATIONAL.ID	OLANREWAJU VERO	NIMC	2011-04-14	\N	MED	NULL		MRS	VERO	OLANREWAJU	FEMALE	25-NOV-1950	NULL	8024303328	NULL	NULL	NULL
277542	CUS0277542	MONILOLA OMOWUMI  ELUJOBA	AREA OSOGBO	OSOGBO	NULL	4800	NO 10 ADEWUYI STREET ALEKUWODO	777	NULL	4803	OS121905597	NATIONAL.ID	ELUJOBA MONILOLA OMOWUMI	NIMC	2011-04-27	\N	MED	NULL		MRS	MONILOLA OMOWUMI	ELUJOBA	FEMALE	21-FEB-1982	MARRIED	8067319254	NULL	NULL	NULL
279968	CUS0279968	YAHAYA  MOHAMMED	ABUJA	FEDERAL CAPITAL TERRITORY	NULL	4600	GWARIMPA	777	NULL	4604	56788	NATIONAL.ID	MOHAMMED YAHAYA (NYSC)	NIMC	2011-05-09	\N	MED	NULL		MR	YAHAYA	MOHAMMED	MALE	14-NOV-1984	NULL	8078289887	NULL	NULL	NULL
280221	CUS0280221	ERHABOR IYALEKHUE FRED 	149 ZONE B	LAGOS	NG	4800	149 ZONE B	501259	NULL	4803	CKK43572AA	DRIVING.LICENSE	ERHABOR IYALEKHUE FRED	.	2011-05-10	\N	MED	VALUED.CUSTOMER	11	MR	IYALEKHUE	ERHABOR	FEMALE	02-APR-1984	NULL	8053621199	crediblefred@gmail.com	NULL	NULL
281727	CUS0281727	SEDI  AUSTINE	HAYAN BUBA NEAR LIVING FAITH.	ZAMFARA	NULL	4200	AG FERERO TESHAN WAYA GUSAU	777	NULL	4202	EN627853331	NATIONAL.ID	AUSTINE SEDI	NIMC	2011-05-18	\N	MED	NULL		MR	SEDI	AUSTINE	MALE	22-MAR-1984	SINGLE	7061652631	NULL	NULL	NULL
281771	CUS0281771	SANUSI ALFA  SULEIMAN	FED.SEC ABUJA	FEDERAL CAPITAL TERRITORY	NULL	4200	NNATIONAL ECONOMIC INTELLIGENE	777	NULL	4207	NW014281298	NATIONAL.ID	SULEIMAN SANUSI ALFA	NIMC	2011-05-18	\N	MED	VALUED.CUSTOMER	13	MR	SANUSI ALFA	SULEIMAN	MALE	04-JUL-1983	NULL	8138378858	ALFA.SULEIMAN@YAHOO.COM	NULL	NULL
285105	CUS0285105	FRIDAY  NWORIE	ANAMBRA STATE.NIGERIA	ONITSHA	NULL	4800	URUAGU OBA NNEWI	777	NULL	4806	BN671658460	NATIONAL.ID	NWORIE FRIDAY	NIMC	2006-05-16	\N	MED	VALUED.CUSTOMER	11	MR	FRIDAY	NWORIE	NULL	16-MAY-1980	SINGLE		NULL	NULL	NULL
285177	CUS0285177	SUNDAY AND CHIZOBA  OKEKE	ANAMBRA.NIGERIA	ONITSHA	NULL	4200	1B OWERRI ROAD ONITSHA	777	NULL	4207	5455	COMPANY.ID	OKEKE SUNDAY AND CHIZOBA	OTHERS	2006-08-28	\N	MED	NULL		MR.&.MRS	SUNDAY AND CHIZOBA	OKEKE	MALE	05-SEP-1973	NULL		NULL	NULL	NULL
286268	CUS0286268	ADEBOWALE SAMUEL  OLAWOAGBA	IWAYA YABA	LAGOS	NULL	4800	117 AUDU BALE STREET	555	NULL	4803	OG059674141	NATIONAL.ID	OLAWOAGBA ADEBOWALE SAMUEL	NIMC	2011-06-13	\N	MED	NULL		MR	ADEBOWALE SAMUEL	OLAWOAGBA	MALE	21-JUL-1975	MARRIED	8060407380	NULL	NULL	NULL
286370	CUS0286370	VICTOR  ENOBAKHARE	OFF ST SAVIIOUR ROAD,BENIN	BENIN	NULL	6200	1 SAM ENOBAKHARE CRESCENT	555	NULL	6206	BEN32374AD1	DRIVING.LICENSE	ENOBAKHARE VICTOR	FRSC	2011-06-13	\N	MED	VALUED.CUSTOMER	11	MR	VICTOR	ENOBAKHARE	MALE	19-JAN-1982	SINGLE		doceno2003@yahoo.co.uk,]	NULL	NULL
286715	CUS0286715	BONIFACE EJEMBI  ADOKO	LAGOS	LAGOS	NULL	4800	2 GBALA STREET SOLUYI	555	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MR	BONIFACE EJEMBI	ADOKO	MALE	07-JUL-1970	NULL	8023313688	NULL	NULL	NULL
286938	CUS0286938	CHIZOBA SANDRA  EKENOBI	UGWUAGBA OBASI	ONITSHA	NULL	4600	5 OSUACHARA STREET	501366	NULL	4605	AN681873065	NATIONAL.ID	EKENOBI CHIZOBA SANDRA	NIMC	2011-06-16	\N	MED	NULL		MISS	CHIZOBA SANDRA	EKENOBI	FEMALE	23-NOV-1994	NULL		NULL	NULL	NULL
287055	CUS0287055	EZENWACHUKWU TITUS OBI	LAGOS	LAGOS	Nigeria	5300	19 IMMAM MEMUDU STR ORILE	555	NULL	5324	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MR	EZENWACHUKWU	OBI	MALE	25-AUG-1962	NULL	8098371579	NULL	NULL	NULL
287824	CUS0287824	ABUBAKAR ADEOLA  RAHMON	LAGOS	LAGOS	NULL	5300	NO 30A,ADEPEGBA STR,ABULE-EGBA	555	NULL	5324	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MR	ABUBAKAR ADEOLA	RAHMON	MALE	06-MAR-1988	NULL		abunuru@yahoo.com	NULL	NULL
288675	CUS0288675	OMOLOLA DORCAS BALOGUN	NULL	PHC	NIGERIA	4800	NO. 4 HOPE AVENUE WOJI	501200	234	4806	PHC21193AB02	DRIVING.LICENSE	BALOGUN OMOLOLA DORCAS	FRSC	2016-01-18	2019-09-13	MED	VALUED.CUSTOMER	11	MRS	OMOLOLA	BALOGUN	FEMALE	13-SEP-1978	DIVORCED	8168686217	lolabalogun53@yahoo.com	NULL	NULL
290086	CUS0290086	JEROMO GILBERT  AKHARIA	BENIN CITY	EDO	NULL	4500	5B ORO STREET OFF TV ROAD	777	NULL	4501	CRO71303281	NATIONAL.ID	AKHARIA JEROMO GILBERT	NIMC	2011-07-07	\N	MED	NULL		MR	JEROMO GILBERT	AKHARIA	MALE	23-MAR-1987	SINGLE	7068903902	NULL	NULL	NULL
290104	CUS0290104	SAMSON MONDAY  SOLOMON	SOLUYI GBAGADA.	LAGOS	NULL	4800	PLT23.SHOSANYA ST.	777	NULL	4803	OY174266867	NATIONAL.ID	SOLOMON SAMSON MONDAY	NIMC	2011-07-07	\N	MED	NULL		MR	SAMSON MONDAY	SOLOMON	MALE	10-JUL-1989	NULL		NULL	NULL	NULL
290126	CUS0290126	OLANIYI OLUBAYO OTTO	LAGOS	LAGOS	NIGERIA	5300	166 BORNO-WAY EBUTE-METTA	555	NULL	5319	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MR	OLANIYI	OTTO	MALE	01-AUG-1976	DIVORCED	8056232012	NULL	NULL	NULL
290173	CUS0290173	SAMUEL OLAMIJI  IDOWU	RD, SURULERE, LAGOS	LAGOS	NULL	4800	NO. 15A,FLAT 1, ALHAJI MASHA	777	NULL	4803	A3584546A	PASSPORT	IDOWU SAMUEL OLAMIJI	NIS	2011-07-07	\N	MED	VALUED.CUSTOMER	11	MR	SAMUEL OLAMIJI	IDOWU	MALE	24-APR-1981	NULL		sammorphy@yahoo.com,]	NULL	NULL
290219	CUS0290219	UCHENNA INNOCENT  ONWUMERE	BADIA	LAGOS	NULL	4900	22 GIWA STR	777	NULL	4902	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	UCHENNA INNOCENT	ONWUMERE	MALE	16-MAY-1982	NULL	8063234703	NULL	NULL	NULL
290311	CUS0290311	KABIRU  USMAN	BIRNIN MALAN BUNGUDU,ZAMFARA	ZAMFARA	NULL	4200	AGENCY FOR MASS EDUC.BOARD GUS	777	NULL	4202	GUS06120AA1	DRIVING.LICENSE	USMAN KABIRU	FRSC	2011-07-08	\N	MED	NULL		MR	KABIRU	USMAN	MALE	01-MAR-1979	MARRIED	8166640006	NULL	NULL	NULL
291068	CUS0291068	TEMILOLUWA OMOTOLA  SANYAOLU	EGAN IGANDO	LAGOS	NULL	5700	1,TOYIN OKE STR,OFF ISUTI STR,	777	NULL	5706	OY559177521	NATIONAL.ID	SANYAOLU TEMILOLUWA OMOTOLA	NIMC	2011-07-14	\N	MED	VALUED.CUSTOMER	11	MR	TEMILOLUWA OMOTOLA	SANYAOLU	MALE	27-APR-1993	NULL	0	NULL	NULL	NULL
291075	CUS0291075	THERESA OTOBONG  OKON	CALABAR	CROSS RIVERS	NULL	4900	24 ANASA RD OFF WAPI JUNCTION	555	NULL	4902	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MRS	THERESA OTOBONG	OKON	FEMALE	27-NOV-1989	NULL	8069305319	NULL	NULL	NULL
291335	CUS0291335	IMMA JOE GLOBAL RESOURCES LTD	ABA	ABA	NULL	4200	25 ISUNJABA ST. OFF 75 OSUS RD	509349	NULL	4207	NULL	NULL	NULL	NULL	\N	\N	HIGH	VALUED.CUSTOMER	14	MR	IMMA JOE GLOBAL RESOURCES LTD	IMMA JOE GLOBAL RESOURCES LTD	NULL	28-MAY-1977	NULL		immajoeglobal@gmail.com]	NULL	NULL
294702	CUS0294702	OLOLADE OLUWAKEMI OWOLABI	LAGOS	LAGOS	NG	4800	WATER HOUSE IJORA LAGOS	777	NULL	4803	APP05440AA1	DRIVING.LICENSE	OWOLABI OLOLADE OLUWAKEMI	FRSC	2011-08-03	\N	MED	VALUED.CUSTOMER	11	MISS	OLOLADE	OWOLABI	FEMALE	11-JUL-1986	NULL	8061612535	loly2g@yahoo.com	NULL	NULL
295152	CUS0295152	JOSHUA JOHN AUGUSTINE  AUGUSTINE	U. BORO SABO TASHA	KADUNA	NULL	4800	NNO 15 TUNGA STREET	503311	NULL	4803	KD134713625	NATIONAL.ID	JOSHUA J. AUGUSTINE	NIMC	2011-08-05	\N	MED	NULL		MR	JOSHUA JOHN AUGUSTINE	AUGUSTINE	MALE	08-FEB-1984	NULL	8064799095	NULL	NULL	NULL
296437	CUS0296437	FELGO(NIGERIA) LIMITED	FEGGE, ONITSHA	ONITSHA	NULL	5700	29A UBA STREET FEGGE, ONITSHA	777	NULL	5701	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		NULL	FELGO (NIGERIA) LIMITED	FELGO (NIGERIA) LIMITED	NULL		NULL	8033170382	FELGO@YAHOO.COM	NULL	NULL
296522	CUS0296522	CHETAUYA EMMANUEL IYKE	ONITSHA, ANAMBRA STATE	ONITSHA	NULL	4200	1 AKUNNE EGBUNIWE STR WOLIWO	777	NULL	4207	465	COMPANY.ID	CHETAUYA EMMANUEL IYKE	OTHERS	2006-08-25	\N	MED	NULL		MR	EMMANUEL	CHETAUYA	NULL	17-OCT-1982	NULL	8032145678	NULL	NULL	NULL
296678	CUS0296678	NWANOLUE JUDE NDUKA	ONITSHA, ANAMBRA STATE	ONITSHA	NULL	5700	16 AJASA STREET,ONITSHA	777	NULL	5701	2.23468E+11	NATIONAL.ID	NWANOLUE JUDE NDUKA	NIMC	2007-02-06	\N	MED	NULL		MR	JUDE	NWANOLUE	NULL	25-JUN-1975	NULL	8068179024	NULL	NULL	NULL
297000	CUS0297000	CORNER STONE INTL SCHL(THRIFT)	ASABA	ONITSHA	NULL	4300	336 JESUS SAVES ROAD	501366	NULL	4304	A003780379	PASSPORT	CORNER STONE INTL SCHL(THRIFT)	NIS	2011-08-15	\N	MED	VALUED.CUSTOMER	14	MESSRS	CORNER STONE INTL SCHL(THRIFT)	CORNER STONE INTL SCHL(THRIFT)	MALE	09-MAR-1962	NULL	7039888820	NULL	NULL	NULL
297043	CUS0297043	ACCESS ON TIME TRANSPORT LTD	OLODI APAPA	OWERRI	NULL	6000	NO 52 KIRIKIRI ROAD	500718	NULL	6001	AKD00793AA1	DRIVING.LICENSE	ACCESS ON TIME TRANSPORT LTD	FRSC	2011-08-15	\N	MED	VALUED.CUSTOMER	14	MESSRS	ACCESS ON TIME TRANSPORT LTD	ACCESS ON TIME TRANSPORT LTD	NULL		NULL		NULL	NULL	NULL
297138	CUS0297138	NGOZI  NWIMOH	VILLAGE AWKA ANAMBRA	AWKA	NULL	4800	5 NWOSHISHI LANE UMUDIOKA	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MRS	NGOZI	NWIMOH	FEMALE	29-APR-1983	NULL	8055082180	NULL	NULL	NULL
297293	CUS0297293	SHAKIRAT AMOPE  BABARINSA	ABEOKUTA	ABEOKUTA	NULL	4800	AREGBE VILLAGE	555	NULL	4803	OG512290157	NATIONAL.ID	BABARINSA SHAKIRAT AMOPE	NIMC	2011-08-17	\N	MED	NULL		MRS	SHAKIRAT AMOPE	BABARINSA	FEMALE	06-NOV-1965	NULL	7032420505	NULL	NULL	NULL
298621	CUS0298621	NDIFREKE AND GLORY  UMOH	1 ABUJA	FEDERAL CAPITAL TERRITORY	NULL	4800	HOUSE 8 ROAD 44 LUGBE FHA PHAS	555	NULL	4803	BDG05478AA1	DRIVING.LICENSE	UMOH NDIFREKE AND GLORY	FRSC	2011-08-25	\N	MED	VALUED.CUSTOMER	11	MR.&.MRS	NDIFREKE AND GLORY	UMOH	NULL	25-JAN-1980	NULL	8035883369	NULL	NULL	NULL
306659	CUS0306659	ROMANIA CHUKWUNIA JUWAH	AKOKA, YABA,	LAGOS STATE.	NIGERIA	4800	40, OLANREWAJU STREET,KEMIST B/S,	777	NULL	4804	A04111450	PASSPORT	JUWAH ROMANIA CHUKWUNIA	NIS	2012-08-16	2017-08-15	MED	VALUED.CUSTOMER	11	MRS	ROMANIA	JUWAH	FEMALE	07-JUN-1958	DIVORCED	8080803070	romania4sure@gmail.com	NULL	NULL
312851	CUS0312851	ISAIAH  DIMKA	YENAGOA	YENAGOA	NULL	4800	EBIS MECHANIC RD AMARATA	555	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	ISAIAH	DIMKA	NULL	14-MAY-1897	NULL		NULL	NULL	NULL
312856	CUS0312856	YUSUF  ABDU	KANO	KANO	NULL	4800	TOFA L.G.KANO	777	NULL	4803	KN089168415	NATIONAL.ID	ABDU YUSUF	NIMC	2011-11-23	\N	MED	NULL		MR	YUSUF	ABDU	MALE	04-JUN-1978	NULL	8080822015	NULL	NULL	NULL
312934	CUS0312934	HAKEEM GBADEBO  ODUOLA	OFF IREAKARI, ISOLO	LAGOS	NULL	5000	3 UZUEGBU CLOSE OLUBUNMI,	508819	NULL	5006	JJJ01166AA6	NATIONAL.ID	ODUOLA HAKEEM GBADEBO	NIMC	2011-11-24	\N	HIGH	VALUED.CUSTOMER	12	MR	HAKEEM GBADEBO	ODUOLA	MALE	20-JAN-1970	NULL	8025884431	info@hoggengineeringng.com	NULL	NULL
313342	CUS0313342	ABOSEDE FUNMILAYO  AKANNI	ILE OGBO, OSUN STATE	IWO	NULL	5300	AYEDIRE LOCALGOVT.	555	NULL	5316	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MRS	ABOSEDE FUNMILAYO	AKANNI	FEMALE	23-DEC-1985	MARRIED	8138729780	NULL	NULL	NULL
313423	CUS0313423	OYUN LOCAL GOVT LACA	ILEMONA	ILORIN	NULL	5000	OYUN LOCAL GOVT SEC	503594	NULL	5006	NULL	NULL	NULL	NULL	\N	\N	HIGH	NULL		NULL	OYUN LOCAL GOVT LACA	OYUN LOCAL GOVT LACA	NULL		NULL	8055955560	NULL	NULL	NULL
313543	CUS0313543	SUNDAY VICTOR  EKEFONI	PORT HARCOURT	Edo State	NG	4800	295B SURULERE WAY DOLPHIN ESTATE IK OYI LAGOS	500399	NULL	4804	A06345160	PASSPORT	EKEFONI VICTOR SUNDAY	NIS.	2010-05-28	2020-04-07	MED	VALUED.CUSTOMER	11	MR	SUNDAY VICTOR	EKEFONI	MALE	17-FEB-1978	SINGLE		ekefonivictor@yahoo.com]ekefonivictor@yahoo.com	NULL	NULL
313554	CUS0313554	ESTHER ADEBIMPE  BADEJO	BOWEN UNIVERSITY IWO OSUN	IWO	NULL	4800	DEPT OF SOCIOLOGY	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MISS	ESTHER ADEBIMPE	BADEJO	FEMALE	03-MAR-1995	SINGLE	8132159956	badejo_e@yahoo.com	NULL	NULL
313841	CUS0313841	UDODINMA AGU  MIRACLE	PORT HARCOURT	RIVERS	NULL	5300	EVERISTUS ELIONU S COMP.OYIGBO	777	NULL	5318	A03242225	PASSPORT	MIRACLE UDODINMA AGU	NIS	2011-09-01	\N	NULL	NULL		MISS	UDODINMA AGU	MIRACLE	FEMALE	01-AUG-2009	SINGLE		NULL	NULL	NULL
317122	CUS0317122	SAMSONDEEN  LANREWAJU  MOGBONJUBOLA	IJESHA	LAGOS	NULL	4800	3 MAKANJUOLA STR. IJESHA TEDO	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	HIGH	VALUED.CUSTOMER	11	MR	SAMSONDEEN  LANREWAJU	MOGBONJUBOLA	NULL	04-APR-1968	NULL	8029513378	NULL	NULL	NULL
317605	CUS0317605	IHEANACHO FERDINAND  CHIBUZO	YENAGOA	YENAGOA	NULL	4800	CORPERS LODGE YENAGOA	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	IHEANACHO FERDINAND	CHIBUZO	MALE	17-FEB-1985	NULL	8038131045	NULL	NULL	NULL
317930	CUS0317930	NNAMDI FREDRICK  NNEKE	YENAGOA	YENAGOA	NULL	4800	CORPERS LODGE YENAGOA	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	NNAMDI FREDRICK	NNEKE	MALE	02-SEP-1986	NULL	8064263740	NULL	NULL	NULL
321326	CUS0321326	TD  RAMESH CHANDRA	ICTORIA ISLAND	LAGOS	NULL	4800	8A WALTER CARRINGTONCRESCENT V	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	HIGH	NULL		MR	TD	RAMESH CHANDRA	MALE		NULL		NULL	NULL	NULL
322409	CUS0322409	HAMSA PUBLICATIONS	KANO.S.	KANO	NULL	6200	27 UNITY ROAD, KANO.,	777	NULL	6202	A0802855	PASSPORT	HAMSA PUBLICATIONS	NIS	2000-01-01	\N	MED	NULL		MR	HAMSA PUBLICATIONS	HAMSA PUBLICATIONS	NULL	06-JAN-1961	NULL		NULL	NULL	NULL
323063	CUS0323063	ADAORA  OFOMA ADAORA	WUSE ZONE6 ABUJA	NULL	NULL	4200	20.30 ALFAYAUM STREET,	777	NULL	4202	NULL	NULL	NULL	NULL	\N	\N	NULL	NULL		NULL	ADAORA	OFOMA ADAORA	MALE		NULL		NULL	NULL	NULL
323258	CUS0323258	A. MAHMUD  ABDULRAHMAN A. MAHMUD	BUJAABUJA	NULL	NULL	4200	C 17, IBRAHIM ADISAESTATE,  A	777	NULL	4202	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		NULL	A. MAHMUD	ABDULRAHMAN A. MAHMUD	MALE		NULL		NULL	NULL	NULL
323386	CUS0323386	SAIDU  LIKITA	GARK II, ABUJA	FEDERAL CAPITAL TERRITORY	NULL	4200	NIPOST AREA 10,GARKIABUJABUJA	777	NULL	4207	1604	COMPANY.ID	LIKITA SA ADU	OTHERS	2000-01-01	\N	MED	NULL		MR	SAIDU	LIKITA	MALE	16-APR-1975	NULL		NULL	NULL	NULL
324439	CUS0324439	RANAMI ABAH AND CO.  RANAMI ABAH AND CO.	PORT HARCOURT	PORT HARCOURT	NIGERIA	4200	4 FORCES AVENUE OLD GRA	777	NULL	4207	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	14	NULL	RANAMI ABAH AND CO.	RANAMI ABAH AND CO.	NULL		NULL		NULL	NULL	NULL
324689	CUS0324689	AMAECHI AUGUSTINE  EGWUATU	PORT HARCOURT	PORT HARCOURT	NULL	4200	N.A.O.C MILE 4,OFF AWUSE STR	777	NULL	4207	PHC59062AB33	DRIVING.LICENSE	EGWUATU AMAECHI AUGUSTINE	Driver's License	2021-04-08	\N	HIGH	VALUED.CUSTOMER	11	ENGR	AMAECHI AUGUSTINE	EGWUATU	MALE	03-AUG-1970	NULL	8033096229	NULL	NULL	NULL
325125	CUS0325125	ADEWALE RAZAQ  SANNI ADEWALE RAZAQ	GBAGADA.LAGOS	LAGOS	NULL	5200	18 ORIOLA ONALAJA ST SAWMILL	777	NULL	5206	OG056227461	NATIONAL.ID	SANNI ADEWALE RAZAQ	NIMC	2006-12-06	\N	MED	VALUED.CUSTOMER	11	MR	ADEWALE RAZAQ	SANNI ADEWALE RAZAQ	MALE	16-OCT-1971	MARRIED	8028315247	NULL	NULL	NULL
325147	CUS0325147	BEN-HERBERT  OZOMAH	ADELEYE STREET ILUPEJU LAGOS	LAGOS	NULL	5200	NO. 7 SERE CLOSE OFF ADEOLA	777	NULL	5206	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MR	BEN-HERBERT	OZOMAH	MALE	16-FEB-1972	SINGLE		benherberts@yahoo.com,]	NULL	NULL
325227	CUS0325227	EMMANUEL  NASAMU	KETU	LAGOS	NULL	5200	8 DOTUN OSUNKOYI WAY AGBOTI ES	777	NULL	5206	KTU4389AAS	DRIVING.LICENSE	NASAMU EMMANUEL OSIKHUEMHE	FRSC	2007-03-20	\N	MED	VALUED.CUSTOMER	12	MR	EMMANUEL	NASAMU	MALE	20-JUN-1976	NULL		emmynasamu@yahoo.com,]	NULL	NULL
326052	CUS0326052	IBRAHIM.A LAWAL.B IBRAHIM.G	LAGOS	LAGOS	NULL	4900	7,ADANLA STR,OKOKO	555	NULL	4902	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		NULL	IBRAHIM.A LAWAL.B IBRAHIM.G	IBRAHIM.A LAWAL.B IBRAHIM.G	NULL	01-FEB-1953	NULL	8035623292	NULL	NULL	NULL
327060	CUS0327060	OLUWAFEMI TAOFEEQ  OWOLABI	ESTATE AKURE	AKURE	NULL	4800	NO 37 OJUMU STREET IJAPO	777	NULL	4803	AO2456599	PASSPORT	OWOLABI OLUWAFEMI TAOFEEQ	NIS	2012-01-30	\N	MED	VALUED.CUSTOMER	11	MR	OLUWAFEMI TAOFEEQ	OWOLABI	MALE	10-JAN-1971	NULL	8033098274	NULL	NULL	NULL
327118	CUS0327118	GINIKACHI  NANIMEBILE	5 FACTORY ROAD ABA	ABA	NULL	4800	CHRIST EMBASSY ABA	555	NULL	4803	AB.14071985	NATIONAL.ID	NANIMEBILE GINIKACHI	NIMC	2012-01-30	\N	MED	VALUED.CUSTOMER	11	MISS	GINIKACHI	NANIMEBILE	FEMALE	14-JUL-1985	NULL		NULL	NULL	NULL
327159	CUS0327159	MY CHASE RESOURCES COMPANY LTD	ABK	ABEOKUTA	NULL	5300	8 SOMORIN STR ASERO ADATAN	555	NULL	5312	A00756930	PASSPORT	MY CHASE RESOURCES COMPANY LTD	NIS	2012-01-30	\N	MED	NULL		NULL	MY CHASE RESOURCES COMPANY LTD	MY CHASE RESOURCES COMPANY LTD	NULL		NULL		mychase4real@yahoocom.com	NULL	NULL
328796	CUS0328796	FADEKEMI OMOLARA  ADELAYI	OSHODI LAGOS	LAGOS	NULL	4800	11,ENIYANLONBINU	505486	NULL	4803	OO662245763	NATIONAL.ID	ADELAYI FADEKEMI OMOLARA	NIMC	2012-02-07	\N	MED	NULL		MRS	FADEKEMI OMOLARA	ADELAYI	FEMALE	27-JUL-1975	NULL	8034045114	NULL	NULL	NULL
330179	CUS0330179	KUBURAT ABOSEDE  TANIMOWO	SHASHA, AKOWONJO, LAGOS	LAGOS	NULL	4800	19, KASALI STREET, ORISUNBARE,	507492	NULL	4803	OS537294591	NATIONAL.ID	TANIMOWO KUBURAT ABOSEDE (SAL)	NIMC	2005-02-07	\N	MED	VALUED.CUSTOMER	11	MISS	KUBURAT ABOSEDE	TANIMOWO	FEMALE	06-MAR-1988	NULL	7036918537	NULL	NULL	NULL
330425	CUS0330425	DECEASED ESTATE OF LESSA BIMA  DECEASED ESTATE OF LESSA BIMA	NASSARAWA LGA	KANO	NULL	4800	HADEJIA ROAD GUNDUWAWA	777	NULL	4806	NULL	NULL	NULL	NULL	\N	\N	NULL	VALUED.CUSTOMER	11	MR	DECEASED ESTATE OF LESSA BIMA	DECEASED ESTATE OF LESSA BIMA	MALE	03-APR-1979	NULL		NULL	NULL	NULL
331017	CUS0331017	NURA YUSUF  BAYERO	NASSARAWA LGA	KANO	NULL	5300	SHARIA COURT OF APPEAL DEPT	777	NULL	5318	KN084913269	NATIONAL.ID	BAYERO NURA YUSUF	NIMC	2012-02-20	\N	MED	NULL		MR	NURA YUSUF	BAYERO	MALE	16-FEB-1965	NULL	8035907356	NULL	NULL	NULL
331190	CUS0331190	IFUANYA MAUDLYN  AGU	ALAFIA AVENUE EJIGBO	LAGOS	NULL	4900	5 RAMONI ONAKOYA ST OFF	555	NULL	4908	A3819923A	PASSPORT	AGU IFUANYA MAUDYLN	NIS	2012-02-21	\N	MED	VALUED.CUSTOMER	11	MISS	IFUANYA MAUDLYN	AGU	FEMALE	30-NOV-1985	NULL	8164069813	holygirl@yahoo.com	NULL	NULL
331498	CUS0331498	BESTBRIDGE INVESTMENT LTD	LAGOS STATE	LAGOS	NG	4800	393, BORNO WAY, ALAGOMEJI YABA	500442	NULL	4806	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	10	MISS	BESTBRIDGE INVESTMENT LTD	BESTBRIDGE INVESTMENT LTD	NULL	13-JAN-2012	NULL		bestbridgeinvestmentltd@gmail.com]	NULL	NULL
332081	CUS0332081	OGHENERUKEWE AGHO  ELVIS	ZUBA ABUJA	NULL	NULL	5000	BLOCK 102 MINISTERS  HILL	555	NULL	5001	SMK45204AA1	DRIVING.LICENSE	ELVIS OGHENERUKEWE AGHO	FRSC	2012-02-23	\N	MED	VALUED.CUSTOMER	11	MR	OGHENERUKEWE AGHO	ELVIS	MALE	24-FEB-1987	NULL	7066128236	NULL	NULL	NULL
332872	CUS0332872	MULIKAT IDOWU RUFFAI	46,AGARAWU STR,LAGOS.	LAGOS	NIGERIA	4800	C.O ASSOCIATION OF SHOP OWNERS	555	NULL	4803	GBE0558AA3	DRIVING.LICENSE	RUFFAI MULIKAT IDOWU	FRSC	2012-02-28	\N	MED	VALUED.CUSTOMER	11	MISS	MULIKAT	RUFFAI	FEMALE	12-SEP-1980	NULL	8033611127	NULL	NULL	NULL
333087	CUS0333087	SEGUN BAMIDELE ADEBIYI	48,ACCESS STREET,OWORONSHOKI	LAGOS	NIGERIA	4800	C.O ASSOCIATION OF SHOP OWNERS	555	NULL	4803	GBE0558AA3	DRIVING.LICENSE	ADEBIYI SEGUN BAMIDELE	FRSC	2012-02-28	\N	MED	VALUED.CUSTOMER	11	MR	SEGUN	ADEBIYI	MALE	20-DEC-1972	NULL		]	NULL	NULL
333264	CUS0333264	ADEBAYO IDOWU  POPOOLA	V.I LAGOS	LAGOS	NULL	4800	288 IDOWU MARTINS STREET	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	ADEBAYO IDOWU	POPOOLA	MALE	07-MAY-1970	NULL		NULL	NULL	NULL
333277	CUS0333277	NATHANIEL ONYEKACHI  ONUOHA	LAGOS	LAGOS	NULL	4800	NO 8 LAYINKA STREET AJEGUNLE	777	NULL	4803	RV051495946	NATIONAL.ID	ONUOHA NATHANIEL ONYEKACHI	NIMC	2012-02-29	\N	MED	NULL		MR	NATHANIEL ONYEKACHI	ONUOHA	MALE	05-MAY-1983	NULL	8068282052	NULL	NULL	NULL
333385	CUS0333385	PATRICK ABHULIMEN  EMMANUEL	B3 AREA 3 ABUJA	NULL	NULL	5300	PLOT 500 NDAMELA HOUSE SUITE	555	NULL	5318	KG126708835	NATIONAL.ID	EMMANUEL PATRICK ABHULIMEN	NIMC	2012-02-29	\N	MED	VALUED.CUSTOMER	11	MR	PATRICK ABHULIMEN	EMMANUEL	MALE	09-NOV-1990	NULL	8184052768	emmanuelabhulimen@yahoo.com	NULL	NULL
334828	CUS0334828	ABUBAKAR  KASIM	ABUJA	FEDERAL CAPITAL TERRITORY	NULL	4800	SHOP C22 AT TPP PLAZA WUSE 2	777	NULL	4803	GMI80459541	NATIONAL.ID	KASIM ABUBAKAR	NIMC	2012-03-07	\N	MED	NULL		MR	ABUBAKAR	KASIM	MALE	09-AUG-1990	NULL	8100082640	NULL	NULL	NULL
334862	CUS0334862	KAZEEM ISMAIL ADEKANMI	ALH. ADEKANMI'S HOUSE	ORE	NG	4600	ALH. ADEKANMI S HOUSE ALONG CAC NO 1, ROAD, 7, AYEPE STREET, ORE	502016	NULL	4605	NULL	NULL	ADEKANMI KAZEEM ISMAIL	.	\N	\N	MED	NULL		MR	KAZEEM	ADEKANMI	FEMALE	06-SEP-1970	DIVORCED	8163669230	adekanmikazeem19@gmail.com	NULL	NULL
335865	CUS0335865	OGUNOLA ADUKE FOLAKE	FAJOL IYANA MEIRAN LAGOS	FEDERAL CAPITAL TERRITORY	NULL	4600	NO 10 ADEOYE CLOSE BEHIND	777	NULL	4604	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MISS	OGUNOLA	FOLAKE	FEMALE	10-FEB-1993	NULL		]	NULL	NULL
382931	CUS0382931	IDAHOSA KELVIN  LOKPA	WARRI	WARRI	NULL	4900	14 OVIRI STR ALADJA	777	NULL	4902	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MR	IDAHOSA KELVIN	LOKPA	MALE	05-MAY-1979	NULL	8060323597	NULL	NULL	NULL
335893	CUS0335893	OLAJIDE OLAOREBIKAN  GEORGE	OWERRI	OWERRI	NIGERIA	4800	NO 34 WETHERAL ROAD	777	22	4803	AAB3964AC	NATIONAL.ID	GEORGE OLAJIDE OLAOREBIKAN	NIMC	2012-03-09	\N	HIGH	VALUED.CUSTOMER	11	MR	OLAJIDE OLAOREBIKAN	GEORGE	MALE	05-MAY-1980	NULL		]	NULL	NULL
335987	CUS0335987	ADETOYE ADETONA  OGUNDOYIN	ILORIN	ILORIN	NULL	4800	7A OBA ADESINA ROAD	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	ADETOYE ADETONA	OGUNDOYIN	MALE	01-JUN-1988	NULL	8163972699	NULL	NULL	NULL
336311	CUS0336311	ENO ENO ESSIEN	162 UYO RD IKOTEKPENE	AKWA IBOM	NG	5300	31 ABAK RD IKOTEKPENE	555	NULL	5318	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MR	ENO	ESSIEN	MALE	20-DEC-1980	NULL		NULL	NULL	NULL
336542	CUS0336542	GRACE ALERO  OGUNLI	GEOLIND NIG LTD	PORT HARCOURT	NULL	4800	71 NTA RD MGBUOGBA PHC	777	NULL	4803	2296057614	COMPANY.ID	OGUNLI GRACE ALERO-SAL	OTHERS	2012-03-13	\N	MED	NULL		MISS	GRACE ALERO	OGUNLI	FEMALE	28-OCT-1989	NULL	8134017800	NULL	NULL	NULL
338561	CUS0338561	SALAUDEEN OMOBOLANLE MUJIDAT	IDIMANGO ORE.	ORE	NULL	4900	MR AND MRS SAMUEL EWAGBA	503343	NULL	4921	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MISS	MUJIDAT OMOBOLANLE	SALAUDEEN	NULL	27-JUL-1990	NULL	8159312773	NULL	NULL	NULL
338681	CUS0338681	KOLCH GLOBAL RESOURCES LIMITED	RD AGUDA SURULER LAGOS.	LAGOS	NULL	5200	10 EFUTIDE STREET, OFF BROWN	777	NULL	5206	NULL	NULL	NULL	NULL	\N	\N	HIGH	VALUED.CUSTOMER	14	NULL	KOLCH GLOBAL RESOURCES LIMITED	KOLCH GLOBAL RESOURCES LIMITED	NULL		NULL		NULL	NULL	NULL
338718	CUS0338718	ELIZABETH  OKITA	LAGOS	LAGOS	NULL	4200	13 RHODES CRESCENT APAPA	555	NULL	4207	OGO25199165	NATIONAL.ID	OKITA ELIZABETH	NIMC	2012-03-21	\N	MED	NULL		MRS	ELIZABETH	OKITA	FEMALE	15-SEP-1986	MARRIED		NULL	NULL	NULL
338777	CUS0338777	ABDULLAHI  HASSAN	JIGAWA STATE	JIGAWA	NULL	4800	SUBEB GAGARAWA L.G.E.A	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	ABDULLAHI	HASSAN	MALE	20-MAR-1954	MARRIED		NULL	NULL	NULL
338843	CUS0338843	EGUONO FAVOUR  ONAKPOMA	ASABA	ASABA	NULL	4200	NO 9 AHAMEFULA STREET	555	NULL	4206	DT567110324	NATIONAL.ID	ONAKPOMA EGUONO FAVOUR	NIMC	2012-03-21	\N	MED	NULL		MRS	EGUONO FAVOUR	ONAKPOMA	FEMALE	06-NOV-1975	NULL	8130781947	NULL	NULL	NULL
339929	CUS0339929	ANIETI-MFON  BROWN	93 TRANS AMADI	PORT HARCOURT	NULL	4800	JEVINIK RESTRUANT	777	NULL	4803	BNY7057AA	DRIVING.LICENSE	BROWN ANIETI-MFON (SALARY)	FRSC	2012-03-23	\N	MED	NULL		MR	ANIETI-MFON	BROWN	FEMALE	15-OCT-1980	NULL		NULL	NULL	NULL
345325	CUS0345325	MOEC COMPANY LIMITED MOEC COMPANY L	ABIOLA IKEJA LAGOS	LAGOS	NIGERIA	5000	13 OLAIDE TOMORI STR OFF	777	NULL	5004	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	14	ALHAJI	MOEC COMPANY LIMITED	MOEC COMPANY LIMITED	MALE	02-MAY-2002	NULL	8023117519	NULL	NULL	NULL
346385	CUS0346385	SUNDAY  AJAYI	IKORODU	LAGOS	NULL	4800	221 OFFIN ORETA IGBOGBO	777	NULL	4803	OY198232173	NATIONAL.ID	AJAYI SUNDAY	NIMC	2012-04-03	\N	MED	NULL		MR	SUNDAY	AJAYI	MALE	21-JUL-1969	NULL	8055913358	NULL	NULL	NULL
346448	CUS0346448	JANEFRANCIS OLACHI  ODOEMENA	NTA CHOBA ROAD	PORT HARCOURT	NULL	4800	BLOOMBREED HIGH SCHOOL	777	NULL	4803	AKL27548AC1	DRIVING.LICENSE	ODOEMENA JANEFRANCIS O. (SAL)	FRSC	2012-04-03	\N	MED	VALUED.CUSTOMER	11	MISS	JANEFRANCIS OLACHI	ODOEMENA	FEMALE	29-AUG-1987	NULL		]	NULL	NULL
346519	CUS0346519	ESTHER EZEKIEL  MABAS	NULL	CROSS RIVERS	NULL	4800	NCCF FAMILY HOUSE,AKIBA	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	14	MISS	ESTHER EZEKIEL	MABAS	FEMALE	24-JUL-1982	NULL		NULL	NULL	NULL
353909	CUS0353909	SIMBIAT A. FUNKE  ABDULRAHEEM	CADASTRAL ZONE BO.GUDU ABUJA	NULL	NULL	5300	PLOT 1282 ADESOJI ADEREMI	502960	NULL	5318	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MRS	SIMBIAT A. FUNKE	ABDULRAHEEM	FEMALE	22-JAN-1968	NULL	8189787712	mummyspetdaycare@hotmail.com	NULL	NULL
363273	CUS0363273	JERRY JONATHAN GATAH	ADEKUNLE BUS STOP, EBUTE METTA	LAGOS	NIGERIA	4800	154, CEMENTARY BY CATER STREET	777	NULL	4803	DED08963AA]A2747363	DRIVING.LICENSE]VOTERS.IDENTITY.CARD	GATAH JERRY JONATHAN]GATAH JERRY JONATHAN	FRSC]INEC	\N	\N	MED	VALUED.CUSTOMER	11	MR	JERRY	GATAH	MALE	12-JUN-1985	NULL	8036970383	GATTAHJERRY@GMAIL.COM	NULL	NULL
364224	CUS0364224	OBIAGELI  OKAFOR	MOUNTAIN OF FIRE TO UNION BANK	AWKA	NULL	4200	UMUOKPU VILLAGE AWKA	555	NULL	4204	PHC0770AB	DRIVING.LICENSE	OKAFOR OBIAGELI	FRSC	2012-05-21	\N	MED	NULL		MRS	OBIAGELI	OKAFOR	FEMALE	18-FEB-1982	NULL	7065192018	NULL	NULL	NULL
364307	CUS0364307	ROLAND SUNDAY  OKERE	IKEJA	LAGOS	NULL	4800	70 OPEBI ROAD	555	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	ROLAND SUNDAY	OKERE	MALE	15-JUN-1976	NULL		NULL	NULL	NULL
364608	CUS0364608	MUKHTAR JIBRIL  MUHAMMAD	KANO	KANO	NULL	4800	M219 ABUBAKAR RIMI MARKET	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	MUKHTAR JIBRIL	MUHAMMAD	MALE	11-FEB-1985	NULL		NULL	NULL	NULL
365217	CUS0365217	HUSSAIN  MOHAMMED	GIDAN SAADU ZUNGUR,KANO.	KANO	NULL	4200	TRIUMPH PUBLISHING COMPANY	777	NULL	4207	NSR10164AB2	DRIVING.LICENSE	HUSSAIN MOHAMMED	FRSC	2007-02-12	\N	MED	NULL		MR	HUSSAIN	MOHAMMED	MALE	12-JUN-1940	NULL		NULL	NULL	NULL
365315	CUS0365315	SANI ABUBAKAR  SABO	KANO.	KANO	NULL	4200	NO.303A INDABAWA QUARTERS	777	NULL	4207	KN086934015	NATIONAL.ID	SANI ABUBAKAR SABO	NIMC	2007-03-08	\N	MED	NULL		MR	SANI ABUBAKAR	SABO	MALE	11-NOV-1980	NULL		NULL	NULL	NULL
372001	CUS0372001	SUNDAY OYEBISI  OYEDELE	AKURE	AKURE	NULL	4800	ROAD Q EXT OBA ILE ESTATE	502209	NULL	4803	3047	DRIVING.LICENSE	OYEDELE SUNDAY OYEBISI	FRSC	2012-06-14	\N	MED	NULL		MR	SUNDAY OYEBISI	OYEDELE	MALE	07-DEC-1986	NULL	8025268519	NULL	NULL	NULL
375130	CUS0375130	ONE TELECOMMUNICATION COMPANY	1,COMMERCIAL ROAD,APAPA,LAGOS.	LAGOS	NULL	5200	1ST FLR,AQUARIUS BLK,ELEGANZA	500481	NULL	5204	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	14	NULL	ONE TELECOMMUNICATION COMPANY	ONE TELECOMMUNICATION COMPANY	NULL	10-JAN-2002	NULL		chuxrosetta@yahoo.com]	NULL	NULL
375299	CUS0375299	SOMIARI DIENYE  JAJA	PORT HARCOURT	PORT HARCOURT	NULL	4800	22 ELEKWON CELELEWO STR GRA	777	NULL	4803	A02084085	PASSPORT	JAJA SOMIARI DIENYE	NIS	2012-06-25	\N	MED	NULL		MR	SOMIARI DIENYE	JAJA	MALE	27-APR-1979	NULL	8068369583	NULL	NULL	NULL
375826	CUS0375826	AISHAT ADERONKE KESHIRO	IJEBU-ODE,	OGUN STATE	NG	4800	6, ILORO STREET OFF NEW ROAD	555	NULL	4806	A02977940	PASSPORT	KESHIRO AISHAT ADERONKE	NIS	2011-06-08	\N	HIGH	VALUED.CUSTOMER	11	MISS	AISHAT	KESHIRO	FEMALE	25-NOV-1982	NULL	7036640857	ronkeshiro@yahoo.com	NULL	NULL
377282	CUS0377282	VALENTINE  SAAKAA	UTAKO	FEDERAL CAPITAL TERRITORY	NULL	4800	HOTEL DE BENTLEY	777	NULL	4803	DMA05046AA3	DRIVING.LICENSE	SAAKAA VALENTINE TERKIMBI	FRSC	2012-07-02	\N	MED	NULL		MR	VALENTINE	SAAKAA	MALE	26-JUN-1984	NULL		NULL	NULL	NULL
379522	CUS0379522	FOLORUNSHO  AKANDE	OGUDU	LAGOS	NULL	4800	PLT7 ALH MURI FOLAMI STR OGUDU	509014	NULL	4803	SMK07841AA6	DRIVING.LICENSE	AKANDE FOLORUNSHO	FRSC	2012-07-11	\N	MED	VALUED.CUSTOMER	11	MR	FOLORUNSHO	AKANDE	MALE	10-FEB-1970	NULL	8039551078	NULL	NULL	NULL
379797	CUS0379797	MICHAEL OLUWAGBENGA ILUYEMI	5,AJE STR.SABO YABA LAGOS	LAGOS	NULL	4800	5,AJE STR.SABO YABA LAGOS	500373	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MR	MICHAEL	ILUYEMI	MALE	15-OCT-1987	PARTNER	8034130960	NULL	NULL	NULL
546154	CUS0546154	DICK  EZENWA	NCHIA ELEME	PORT HARCOURT	NULL	4800	NO. 31 ALETO, MUYI COMP.	777	NULL	4806	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	DICK	EZENWA	MALE	01-FEB-1977	NULL		NULL	NULL	NULL
387382	CUS0387382	MUHAMMED INUWA WUSHISHI	GRA KADUNA	KADUNA	NG	4800	5 WURNO ROAD MALALI	777	NULL	4803	NW012186578	NATIONAL.ID	LT GEN WUSHISHI M I	NIMC	2012-07-31	\N	HIGH	NULL		RTD.GENERAL	MUHAMMED	WUSHISHI	MALE	01-JAN-1940	MARRIED	8055002000	NULL	NULL	NULL
387538	CUS0387538	SABI U UMAR  JA AFAR	KANO	KANO	NULL	4800	BABBAN LAYI KURNA JUNAIDU HOUS	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	SABI U UMAR	JA AFAR	MALE	15-FEB-1991	SINGLE		NULL	NULL	NULL
387825	CUS0387825	SILAS DENEN AYUA	KINGS VILLE COLLEGE,JAHI	FEDERAL CAPITAL TERRITORY	NG	4800	OPP RCCG, JAHI FCT	500798	NULL	4806	BN031885036	NATIONAL.ID	AYUA SILAS DENEN	NIMC	2012-07-31	\N	MED	VALUED.CUSTOMER	11	MR	SILAS	AYUA	MALE	27-MAY-1989	NULL	7038928349	ayuadenen@gmail.com	NULL	NULL
390941	CUS0390941	TIMIFA  MONDAY	BAYELSA	YENAGOA	NULL	4800	OLOGI VILLAGE OGBIA L . G .	777	NULL	4806	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	TIMIFA	MONDAY	MALE	13-OCT-1975	NULL	8080511237	NULL	NULL	NULL
393341	CUS0393341	ISAIAH JOEL  ISAIAH	8 EDIBURG STREET ABA	ABA	NULL	4800	8 EDINBURG STREET ABA	502535	NULL	4806	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	ISAIAH JOEL	ISAIAH	MALE	28-OCT-1973	NULL		NULL	NULL	NULL
393386	CUS0393386	OLIVER TAIWO  OTU	C.O MONUMENTAL GUARDS	LAGOS	NULL	4800	16 AYOOLA ST CLOSE 2 OWORONSHO	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	OLIVER TAIWO	OTU	MALE	16-FEB-1986	SINGLE	8060124537	NULL	NULL	NULL
395274	CUS0395274	OGECHUKWU CYNTHIA  OKEKE	PORT HACOURT	PORT HARCOURT	NULL	4900	OKIRIKA LOCAL GOVT COUNCIL	555	NULL	4921	RV.12B.1037	COMPANY.ID	OKEKE OGECHUKWU CYNTHIA	OTHERS	2012-07-02	\N	MED	NULL		MISS	OGECHUKWU CYNTHIA	OKEKE	FEMALE	28-JUL-1987	NULL	8064831982	NULL	NULL	NULL
396889	CUS0396889	FUKELLY CONST.COMPANY NIG.LTD	BAYELSA STATE	YENAGOA	NULL	4800	OPP. KARIS CAR WASH YENAGOA	777	NULL	4806	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		NULL	FUKELLY CONST.COMPANY NIG.LTD	FUKELLY CONST.COMPANY NIG.LTD	NULL		NULL	8065998949	NULL	NULL	NULL
397447	CUS0397447	SHUAIBU  ABUBAKAR	BAUCHI STATE	BAUCHI	NULL	4800	RAILWAY ROAD UNGUWAR BARWU	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MR	SHUAIBU	ABUBAKAR	NULL	01-JAN-1982	NULL	8160680144	NULL	NULL	NULL
397864	CUS0397864	OLAYEWOLE ROTIMI  OLAYEWOLE	LAGOS	NULL	NULL	4800	12 OSENI LIADI ST OKOTA LG	555	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	OLAYEWOLE ROTIMI	OLAYEWOLE	MALE	07-JUL-1984	NULL		NULL	NULL	NULL
399692	CUS0399692	VINU RESOURCES NIG	STR OFF AKUGBE RD BENIN CITY	EDO	NULL	4800	3 EWASIHA STREET OFF IKPONWOSA	777	NULL	4803	BEN35082AD1	DRIVING.LICENSE	VINU RESOURCES NIG	FRSC	2011-02-23	\N	MED	NULL		NULL	VINU RESOURCES NIG	VINU RESOURCES NIG	NULL	25-SEP-2009	NULL	8034123637	NULL	NULL	NULL
400470	CUS0400470	CHINEZE CHRISTIANA  ULE-CHIMBO	ELELENWO,PORT HARCOURT	PORT HARCOURT	NULL	4200	ROAD 1, PLOT 16, VICTORY ESTAE	777	NULL	4207	PHC5835CG	DRIVING.LICENSE	ULE-CHIMBO CHINEZE CHRISTIANA	FRSC	2007-05-30	\N	MED	VALUED.CUSTOMER	11	MRS	CHINEZE CHRISTIANA	ULE-CHIMBO	FEMALE	24-JUL-1972	NULL		chineze_uc@yahoo.com]	NULL	NULL
400538	CUS0400538	JOHN  CHIDI	BARRACK IBADAN	OYO	NULL	4800	BLOCK 8 ROOM 7 SANGO POLICE	555	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	JOHN	CHIDI	MALE	10-JUL-1989	NULL	8171165925	NULL	NULL	NULL
401973	CUS0401973	ABZ OIL AND GAS LIMITED  ABZ OIL AND GAS LIMITED	CANDOSO ROAD,IPAJA, LAGOS	LAGOS	NG	5500	7, RABIATU OGUNBIYI CLOSE	777	NULL	5505	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	14	ALHAJI	ABZ OIL AND GAS LIMITED	ABZ OIL AND GAS LIMITED	MALE	01-JAN-1992	NULL		]	NULL	NULL
401977	CUS0401977	ERINFOLAMI MONSURA  ERINFOLAMI	LAGOS	NULL	NULL	4800	BLOCK 4 FLT 2 GODMAN ESTATE OK	555	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MISS	ERINFOLAMI MONSURA	ERINFOLAMI	FEMALE	23-NOV-1992	NULL		shawlarh@yahoo.com,]	NULL	NULL
402380	CUS0402380	GABRIEL  AMUCHE	LAGOS	NULL	NULL	4800	59 ISOLO ROAD MUSHIN	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MR	GABRIEL	AMUCHE	MALE	05-OCT-1973	NULL		amuchegabriel@yahoo.com,]	NULL	NULL
403857	CUS0403857	BANQUET CHAMBERS NIG LTD BANQUET CH	IKEJA	LAGOS	NULL	4800	6 ALH LASISI JAKANDE RD	500365	NULL	4803	FKJ28757AA03	DRIVING.LICENSE	MBAH JOHN UCHENNA	FRSC	2013-11-28	2017-12-30	NULL	VALUED.CUSTOMER	14	MR	BANQUET CHAMBERS NIG LTD	BANQUET CHAMBERS NIG LTD	MALE	23-SEP-2011	MARRIED		banquetchambers@yahoo.com,]	NULL	NULL
403877	CUS0403877	BISOLA RISIKAT  FAGBEWESA	SURULERE LAGOS	LAGOS	NULL	4800	BLK 15,RABIATU THOMPSON ST.	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MRS	BISOLA RISIKAT	FAGBEWESA	FEMALE	04-JUL-1965	NULL		NULL	NULL	NULL
403929	CUS0403929	KOREDE MUFUTAU  LAOYE	IJEBU ODE, OGUN STATE	IJEBU-ODE	NULL	4900	46, IBADAN ROAD,	500614	NULL	4902	OY167077699	NATIONAL.ID	LAOYE KOREDE MUFUTAU	NIMC	2006-08-29	\N	MED	NULL		MR	KOREDE MUFUTAU	LAOYE	MALE	28-JAN-1981	NULL		NULL	NULL	NULL
405896	CUS0405896	ADEYERI SIKIRU  ADETUNJI	CELESTIAL CHURCH OF CHRIST PAR	NULL	NULL	4800	CELESTIAL CHURCH OF CHRIST PAR	777	NULL	4806	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	ADEYERI SIKIRU	ADETUNJI	MALE	15-JUN-1965	NULL	8135544022	NULL	NULL	NULL
405990	CUS0405990	AKINLOYE FAROUK  OWOLABI	ALNG IDIROKO RD, OTA	OGUN STATE	NIGERIA	4800	BLCK 1, PLOT 14 BACKVIEW, MOBIL RD	777	NULL	4803	FFE31283AA1	DRIVING.LICENSE	OWOLABI AKINLOYE .F-GLO	FRSC	2010-01-21	\N	MED	VALUED.CUSTOMER	11	MR	AKINLOYE FAROUK	OWOLABI	MALE	10-JAN-1983	NULL		owolabifarouk@yahoo.co.uk,]	NULL	NULL
407474	CUS0407474	RACHAEL OMOLOLA IFEKOYA	KETU	LAGOS	NIGERIA	4800	16 TINUBU STR ALAPERE	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MRS	RACHAEL	IFEKOYA	FEMALE	01-APR-1975	NULL	9159186100	ifekoya50@gmail.com	NULL	NULL
407602	CUS0407602	EJIKE TOBIAS  MADUBUIKE	ABULE OJA YABA, LAGOS	LAGOS	NULL	4800	NO 1 SULE STREET	777	NULL	4803	A01679892	PASSPORT	MADUBUIKE EJIKE TOBIAS	NIS	2010-01-04	\N	HIGH	VALUED.CUSTOMER	14	MR	EJIKE TOBIAS	MADUBUIKE	MALE	08-DEC-1979	NULL	212628000000	humble-toby@yahoo.com	NULL	NULL
407604	CUS0407604	ADEGOKE IDOWU ADIGUN	FED FIRE SERBV,ABUJA	FEDERAL CAPITAL TERRITORY	NG	4800	17 CBN QRTS IQ31 RD,FHA LUGBE	500798	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MR	ADEGOKE	ADIGUN	MALE	19-JAN-1983	NULL	8030507944	NULL	NULL	NULL
407621	CUS0407621	KPOGOMAYAM KEVIN MARLIN  DANIEL	BAYELSA	YENAGOA	NULL	4800	ALPHASTAR PAINT ELEBELE	555	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	KPOGOMAYAM KEVIN MARLIN	DANIEL	MALE	08-JUN-1993	NULL		NULL	NULL	NULL
408616	CUS0408616	OKON  EKPE	ADIABO	CALABAR	NULL	4800	1, EKPO OKON STR.	555	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	OKON	EKPE	MALE	15-JUN-1938	NULL	7039410814	NULL	NULL	NULL
408729	CUS0408729	TOCHI GENEVIEVE  DIM	LAGOS	LAGOS	NULL	4800	4 JEJELAIYE STREET OLODI APAPA	555	NULL	4806	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MISS	TOCHI GENEVIEVE	DIM	FEMALE	01-JAN-1994	SINGLE	7037443218	NULL	NULL	NULL
414213	CUS0414213	EMMANUEL CHINOMSO  NWOKEUKWU	OLD POST OFFICE LIBRARY AVENUE	ABIA	NULL	4800	UGORJI CHRIATIANA CHIDINMA CMP	555	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	EMMANUEL CHINOMSO	NWOKEUKWU	MALE	02-JUN-1994	NULL		NULL	NULL	NULL
431307	CUS0431307	OHIA OKEZIE CYPRAIN  OHIA	LAYOUT ENUGU	UYO	NULL	4800	15 B ABOMIMI CRESENT INDEPENDE	555	NULL	4806	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MR	OHIA OKEZIE CYPRAIN	OHIA	MALE	27-JUL-1984	NULL		j_justmail@yahoo.com]	NULL	NULL
414602	CUS0414602	MUYIDEEN MOROUNKEJI FOWORA	IJEBU IFE,	OGUN STATE	ng	4900	49, MISSION ROAD, OKELIWO QTRS	555	NULL	4902	OG022588411	NATIONAL.ID	FOWORA MOROUNKEJI MUYIDEEN	NIMC	2004-09-09	\N	MED	VALUED.CUSTOMER	11	MR	MUYIDEEN	FOWORA	MALE	22-JAN-1955	NULL	8052466256	NULL	NULL	NULL
418227	CUS0418227	OLUJINMI TOLANI  FOLARIN	CRESCENT OKE ADO IBADAN	NULL	NULL	4600	SW8.877 IBALEYE LODGE COLLEGE	555	NULL	4601	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MISS	OLUJINMI TOLANI	FOLARIN	FEMALE	31-AUG-1989	SINGLE	8135007341	sinmitolani@gmail.com	NULL	NULL
419551	CUS0419551	OSEMUDIAMEN EMMANUEL IBOI	EKENWAN RD	EDO	NG	4800	26 OSAGHEA OGUIGO AVENUE OFF	555	NULL	4806	90F5B10B72295959675	COMPANY.ID	IBOI OSEMUDIAMEN	OTHERS	2011-01-25	\N	LOW	VALUED.CUSTOMER	11	MR	OSEMUDIAMEN	IBOI	MALE	03-DEC-1982	NULL	9025676124	larryose04@yahoo.com	NULL	NULL
420340	CUS0420340	ADEOLA ADEBIMPE  KUSEMIJU	BANIKORO	LAGOS	NULL	4800	7 ALHAJI SALISU STREET	777	NULL	4803	MMK0091AA1	DRIVING.LICENSE	KUSEMIJU ADEOLA ADEBIMPE	FRSC	2000-01-01	\N	MED	VALUED.CUSTOMER	13	MRS	ADEOLA ADEBIMPE	KUSEMIJU	FEMALE	10-OCT-1975	NULL		rudix98@yahoo.com,]	NULL	NULL
420458	CUS0420458	BASIL CHIMEUDO  OKALANWA	ILASAMAJA MUSHIN	LAGOS	NULL	4800	10 TEMITOPE STREET	777	NULL	4803	JJJ4769AAA3	DRIVING.LICENSE	OKALANWA BASIL CHIMEUDO	FRSC	2004-11-04	\N	MED	NULL		MR	BASIL CHIMEUDO	OKALANWA	MALE	18-MAY-1978	NULL		NULL	NULL	NULL
421106	CUS0421106	OMOLARA OLUFUNKE  OGUNLADE	SATELITE TOWN	LAGOS	NULL	4200	CLOSE 9 HSE 12	500580	NULL	4207	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		NULL	OMOLARA OLUFUNKE	OGUNLADE	NULL	20-AUG-1964	NULL		NULL	NULL	NULL
422670	CUS0422670	HELEN  OWOEYE	KUJE ABUJA	FEDERAL CAPITAL TERRITORY	NG	4200	PLOT12/28, NEAR PALM GARDEN PEGI,	777	NULL	4207	4424	COMPANY.ID	OMOAGHE HELEN	OTHERS	2005-08-22	\N	HIGH	VALUED.CUSTOMER	11	MISS	HELEN	OWOEYE	FEMALE	16-MAR-1981	NULL	8065521944	helenomoaghe@gmail.com	NULL	NULL
422822	CUS0422822	NATIONAL SECONDARY SCHOOL LIMI NATI	ABJ NG	FEDERAL CAPITAL TERRITORY	NULL	4600	P O BOX 9349 ABUJA	777	NULL	4601	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	NULL	NATIONAL SECONDARY SCHOOL LIMI	NATIONAL SECONDARY SCHOOL LIMI	MALE		NULL	93141093	NULL	NULL	NULL
423023	CUS0423023	SUSAN NGOZI  ONYEADOR	PORT HARCOURT	PORT HARCOURT	NULL	4200	8 PRESBYTERIAN CLOSE STADIUM R	500686	NULL	4207	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	13	MISS	SUSAN NGOZI	ONYEADOR	NULL		NULL		NULL	NULL	NULL
423159	CUS0423159	COBJOFFA VENTURES	EASTERN BYE PASS	PORT HARCOURT	NULL	4900	NO 8 EASTERN BY PASS PORT HARC	500697	NULL	4921	NULL	NULL	NULL	NULL	\N	\N	HIGH	VALUED.CUSTOMER	14	NULL	COBJOFFA VENTURES	COBJOFFA VENTURES	NULL		MARRIED	8033097024	NULL	NULL	NULL
423207	CUS0423207	STELLA CHINYERE  ELLISON	UNIT 9 GOD S GRACE ESTATE RUMU	RIVERS	NULL	4200	UNIT 9 GOD S GRACE ESTATE RUMU	777	NULL	4207	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		NULL	STELLA CHINYERE	ELLISON	MALE		NULL		NULL	NULL	NULL
423490	CUS0423490	ROBERT OSAZEE  AMURE	WOJI VILLAGE	PORT HARCOURT	NULL	4200	10 2ND CREEK VIEW DRIVE WOJI	777	NULL	4207	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MR	ROBERT OSAZEE	AMURE	MALE	12-APR-1972	NULL	8038812311	robamure@sarenng.com	NULL	NULL
423564	CUS0423564	CHERISH UREH  LAWSON	RUMUOMOI	PORT HARCOURT	NULL	4200	53 OMOI-OROSI RD, RUMUOMOI	777	NULL	4207	BRS0838AC	DRIVING.LICENSE	LAWSON CHERISH UREH	FRSC	2004-11-23	\N	LOW	NULL		MISS	CHERISH UREH	LAWSON	FEMALE	22-AUG-2003	NULL	8037094984	NULL	NULL	NULL
423644	CUS0423644	BISTAR LIMITED BISTAR LIMITED 	127 TRANS AMADI IND. LAYOUT, P	RIVERS	NULL	4200	127 TRANS AMADI IND. LAYOUT, P	502379	NULL	4207	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	NULL	BISTAR LIMITED	BISTAR LIMITED	MALE		NULL		NULL	NULL	NULL
424379	CUS0424379	MOHAMMED DELE  BELGORE	LAGOS ISLAND	LAGOS	NULL	4800	7TH FLR ST NICOLAS HSE CATHOLI	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	MOHAMMED DELE	BELGORE	MALE		NULL		NULL	NULL	NULL
424758	CUS0424758	IPBC NIGERIA LIMITED	VICTORIA ISLAND LAGOS	LAGOS	NULL	5900	NO. 3 DANMOLE STR. PLOT NO. 16	777	NULL	5902	NULL	NULL	NULL	NULL	\N	\N	HIGH	VALUED.CUSTOMER	14	NULL	IPBC NIGERIA LIMITED	IPBC NIGERIA LIMITED	NULL		NULL		7917789@MULTILINKS.COM	NULL	NULL
424970	CUS0424970	AUGUSTINE  AGU	VICTORIA ISLAND LAGOS	LAGOS	NULL	4800	PLOT 17,LIGALI AYORINDE STREET	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	AUGUSTINE	AGU	MALE	01-OCT-1980	NULL		NULL	NULL	NULL
425481	CUS0425481	KEHINDE  DADA	ONDO STATE.	ONDO	NG	4800	13,ALIKADIRI STR,ALAGBAKA GRA.	777	NULL	4803	ODO96849449	NATIONAL.ID	DADA KEHINDE	NIMC	2004-10-26	\N	MED	VALUED.CUSTOMER	11	MR	KEHINDE	DADA	MALE	05-OCT-1975	MARRIED		NULL	NULL	NULL
425531	CUS0425531	ABIMBOLA AGNES  JOHNSON	FESTAC TOWN LAGOS	LAGOS	NULL	4800	41 ROAD D,CLOSE BLK 1, FLAT4,	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MRS	ABIMBOLA AGNES	JOHNSON	FEMALE		NULL		NULL	NULL	NULL
425738	CUS0425738	MERIDIAN POWER TOOLS LIMITED	IKOYI LAGOS	LAGOS	NULL	4800	332 1ST FLR CAPITAL BUILDING	777	NULL	4806	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		NULL	MERIDIAN POWER TOOLS LIMITED	MERIDIAN POWER TOOLS LIMITED	NULL		NULL		NULL	NULL	NULL
425974	CUS0425974	CORPORATE TELECOMMUNICTN AND ENG	AJAH LAGOS	LAGOS	NULL	5200	2 ANTHONY ETUKUDO AVENUE	777	NULL	5206	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		NULL	CORPORATE TELECOMMUNICTN AND ENG	CORPORATE TELECOMMUNICTN AND ENG	NULL		NULL		NULL	NULL	NULL
426013	CUS0426013	WAJERO SOLAPE FELICIA	LASPOTECH 1ST GATE IKORODU	LAGOS	NULL	4800	1 FALMOT STR LASUWON EST OFF	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MRS	WAJERO	FELICIA	NULL	18-SEP-1975	NULL	8028315014	NULL	NULL	NULL
426149	CUS0426149	LAGOON HOTEL AND SUITES	ADENIYI JONES LAGOS	LAGOS	NULL	4800	470 AKIN LAGUDA ST IKEJA OFF	777	NULL	4806	NULL	NULL	NULL	NULL	\N	\N	HIGH	VALUED.CUSTOMER	14	NULL	LAGOON HOTEL AND SUITES	LAGOON HOTEL AND SUITES	NULL	08-MAY-2006	NULL	8032413737	NULL	NULL	NULL
426406	CUS0426406	GLOBAL FLEET OILANDGAS LIMITED	VICTORIA ISLAND LAGOS	LAGOS	NULL	5500	25B AND C KAYODE ABRAHAM STR.	777	NULL	5503	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		NULL	GLOBAL FLEET OILANDGAS LIMITED	GLOBAL FLEET OILANDGAS LIMITED	NULL		NULL		NULL	NULL	NULL
427400	CUS0427400	OBIORA  UZOH	PALLACE WAY,ISOLO LAGOS	FEDERAL CAPITAL TERRITORY	NULL	4800	NO 14,SIJUWOLA STREET AGO	502960	NULL	4803	FCT.FCT.12C..1305	COMPANY.ID	UZOH OBIORA STANLEY	OTHERS	2012-11-21	\N	MED	VALUED.CUSTOMER	11	MR	OBIORA	UZOH	MALE	22-SEP-1989	NULL		NULL	NULL	NULL
428073	CUS0428073	MUYIWA  IDOWU	LAGOS	LAGOS	NULL	4800	48 BABANI STREET AJEGUNLE	777	NULL	4803	A02682489	PASSPORT	IDOWU MUYIWA	NIS	2011-02-21	\N	HIGH	NULL		MR	MUYIWA	IDOWU	MALE	14-JUN-1977	NULL	8029906502	NULL	NULL	NULL
428093	CUS0428093	CHARLES NDARAKE  OBONG	40, OPEBI ROAD IKEJA LAGOS	LAGOS	NULL	4800	ESS-AY HOLDINGS	777	NULL	4803	LAO-12-1454	COMPANY.ID	OBONG CHARLES NDARAKE (SAL)	OTHERS	2012-11-01	\N	MED	NULL		MR	CHARLES NDARAKE	OBONG	MALE	12-JUN-1974	NULL	8093231895	NULL	NULL	NULL
429795	CUS0429795	OLUWAFUNMILOLA OLAJUMOKE ADETAYO	BUS STOP, SAGAMU, OGUN	OGUN	NG	4300	2, PA SAM OLISA STREET, OMOLEYE	777	NULL	4305	OY12C2464	NATIONAL.ID	ELUTADE FUNMILOLA OLAJUMOKE	NIMC	2012-11-01	\N	MED	VALUED.CUSTOMER	11	MRS	OLUWAFUNMILOLA	ADETAYO	FEMALE	21-DEC-1986	NULL	8020999288	olajumokeelutade@yahoo.com	NULL	NULL
431357	CUS0431357	JENNIFER IFEANYICHUKWU  OKADE	NO 35 OGUNJIRIN STR. ARAROMI	LAGOS	NULL	4800	2, OWOLABI STR, ALAPERE MILE12	555	NULL	4803	PU24.13.05.023	NATIONAL.ID	OKADE JENNIFER IFEANYICHUKWU	NIMC	2011-01-31	\N	MED	VALUED.CUSTOMER	11	MISS	JENNIFER IFEANYICHUKWU	OKADE	FEMALE	13-SEP-1995	NULL		NULL	NULL	NULL
431994	CUS0431994	BJSS AZAGBENE	BAYELSA	YENAGOA	NULL	4600	BJSS AZAGBENE EKELGA	777	NULL	4601	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		NULL	BJSS AZAGBENE	BJSS AZAGBENE	NULL		NULL		NULL	NULL	NULL
436130	ONOEE	LOUIS EMEKA ONOCHIE	AWKA	ANAMBRA	NG	5000	31 MAJUO STREET	555	NULL	5004	AWK02055AA	DRIVING.LICENSE	ONOCHIE EMEKA LOUIS	FRSC	2011-02-21	\N	MED	VALUED.CUSTOMER	11	MR	LOUIS	ONOCHIE	MALE	23-OCT-1987	DIVORCED		louisonochie1987@gmail.com,]	NULL	NULL
436915	CUS0436915	DANIEL  BITRUS	YOLA	YOLA	NULL	4800	BADIRISA WARD, GIREI LGA	777	NULL	4803	90F5AFCFB6296212	COMPANY.ID	DANIEL BITRUS-SALARY	OTHERS	2011-01-28	\N	MED	VALUED.CUSTOMER	11	MR	DANIEL	BITRUS	NULL	21-JAN-1979	NULL	8095189255	NULL	NULL	NULL
439510	CUS0439510	MACLEANS CLARKSON  APIAFI	OFF OLUGBEDE STR.EGBEDA	LAGOS	NULL	4800	5,MAKINDE OGUNTONO STREET	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	MACLEANS CLARKSON	APIAFI	MALE	28-MAY-1979	NULL		NULL	NULL	NULL
440876	CUS0440876	SHADIAT ADUNNI  DAUDA	IJESHA	LAGOS	NULL	4800	11 OMILANI STREET	555	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	NULL	NULL		MRS	SHADIAT ADUNNI	DAUDA	NULL	07-JUL-1972	NULL		NULL	NULL	NULL
446412	CUS0446412	ALUMITECH	OSHODI IND ESTATE LAGOS	LAGOS	NULL	5300	PLOT 7 BLK H	500503	NULL	5304	4248283	PASSPORT	ALUMITECH	NIS	2007-02-27	\N	MED	NULL		NULL	ALUMITECH	ALUMITECH	NULL		NULL	7758505	NULL	NULL	NULL
447634	CUS0447634	ODUNAYO EUNICE  BETIKU	OKE-ARO, AKURE	AKURE	NULL	4800	MOTHER AND CHILD HOSPITAL	555	NULL	4803	KAA63209AB	DRIVING.LICENSE	BETIKU ODUNAYO EUNICE	FRSC	2011-02-22	\N	MED	VALUED.CUSTOMER	11	MRS	ODUNAYO EUNICE	BETIKU	FEMALE	09-DEC-1955	NULL		NULL	NULL	NULL
448107	CUS0448107	BAYERO JOURNAL OF COMMUNICATION	KANO	KANO	NULL	4600	DEPT OF MASS COMM,BUK	500864	NULL	4604	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	14	DR	BAYERO JOURNAL OF COMM.STUDIES	BAYERO JOURNAL OF COMM.STUDIES	MALE	21-SEP-2013	NULL		fatsuma@gmail.com,]	NULL	NULL
448239	CUS0448239	TITILAYO CLARA  ADEYEMO	OSOGBO	OSOGBO	NULL	4800	PHCN OSOGBO DISTRICT OFFICE	555	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	NULL	NULL		MRS	TITILAYO CLARA	ADEYEMO	FEMALE	27-JUL-1972	MARRIED	8039129528	NULL	NULL	NULL
457769	CUS0457769	ABIDEMI ROSELINE  OWOLABI	MAKURDI	MARKURDI	NULL	4800	13,ADIKPO STR,OPP. ANKPA WARD	777	NULL	4803	1234	FEP	OWOLABI ABIDEMI ROSELINE	EFCC	2013-02-11	\N	LOW	NULL		MISS	ABIDEMI ROSELINE	OWOLABI	FEMALE	09-AUG-1995	NULL		NULL	NULL	NULL
459165	CUS0459165	NELLY  PHILIPS	IBADAN.	OYO	NULL	4800	5.7A LEBANON CROSS RD.OGUNPA	555	NULL	4803	3RD PARTY-500002AA3	DRIVING.LICENSE	PHILIPS NELLY	FRSC	2010-02-17	\N	MED	VALUED.CUSTOMER	11	MRS	NELLY	PHILIPS	FEMALE	30-JUN-1976	NULL	8081623216	NULL	NULL	NULL
459212	CUS0459212	ROTIMI OLUWATOSIN  JOSHUA	YABA,LAGOS.	LAGOS	NULL	4800	26 OWODE STREET IWAYA	777	NULL	4806	1234	FEP	JOSHUA ROTIMI OLUWATOSIN	EFCC	2013-02-13	\N	LOW	NULL		MR	ROTIMI OLUWATOSIN	JOSHUA	NULL	26-OCT-1991	NULL		NULL	NULL	NULL
462093	CUS0462093	OLUWATOBILOBA  SUNDAY	LAGOS	ASABA	NULL	4200	17 AKOROFAYO STREET MILE 12	777	NULL	4206	1234	FEP	SUNDAY OLUWATOBILOBA	EFCC	2013-02-18	\N	LOW	NULL		MR	OLUWATOBILOBA	SUNDAY	MALE	15-SEP-1990	NULL		NULL	NULL	NULL
479646	CUS0479646	AGHADO KINGSLEY CHUKWUYEM 	AYETORO,ADO-ODO, OGUN	Delta State	NG	4800	19 PROGRESS AVENUE AYETORO OGUN STA^TE	500563	NULL	4804	18264720807	DRIVING.LICENSE	AGHADO KINGSLEY CHUKWUYEM	NIMC.	2010-11-29	2020-12-31	MED	VALUED.CUSTOMER	11	MR	KINGSLEY CHUKWUYEM	AGHADO	MALE	25-SEP-1975	NULL	8033929505	KINGSLEYAGHADO@GMAIL.COM	NULL	NULL
483025	CUS0483025	LINK EXPRESS LTD	LAGOS	LAGOS	NULL	4900	42,KARUNWI STREET,ABULE EGBA	555	NULL	4921	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	14	NULL	LINK EXPRESS LTD	LINK EXPRESS LTD	NULL		NULL	8055640038	NULL	NULL	NULL
483062	CUS0483062	CHIDIEBERE CHIJINDU  ERUGO	RUMUOKORO, PHC	PORT HARCOURT	NULL	4800	THE LORDS CHOSEN HQ	555	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	LOW	NULL		MR	CHIDIEBERE CHIJINDU	ERUGO	MALE	06-NOV-1970	NULL		NULL	NULL	NULL
483097	CUS0483097	MODESOLA DEBORAH  OMOKONGBE	AMUKOKO	LAGOS	NULL	4800	90 AGBAMU STR. AMUKOKO	500514	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	LOW	NULL		MR	MODESOLA DEBORAH	OMOKONGBE	MALE	10-OCT-1993	NULL	8176164399	NULL	NULL	NULL
484560	CUS0484560	VIVIAN  OKONKWO	ROAD BENIN CITY	BENIN	NULL	4800	NO.11,WELFARE ROAD OFF PUMEZ	777	NULL	4803	1234	FEP	OKONKWO VIVIAN	EFCC	2013-03-11	\N	LOW	NULL		MISS	VIVIAN	OKONKWO	FEMALE	07-AUG-1993	NULL		NULL	NULL	NULL
484561	CUS0484561	CHINOSO  CHIMA	AJAYI ROAD OGBA	LAGOS	NULL	4800	NO 33 AYANBODE CLOSE OFF	555	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	LOW	VALUED.CUSTOMER	13	MR	CHINOSO	CHIMA	MALE	16-MAY-2004	NULL		]	NULL	NULL
484614	CUS0484614	ESE  OGHENEGWEKW	BENIN CITY	BENIN	NULL	4800	OBA TOWN SAPELE ROAD	777	NULL	4803	1234	FEP	OGHENEGWEKW ESE	EFCC	2013-03-11	\N	LOW	NULL		MISS	ESE	OGHENEGWEKW	FEMALE	18-APR-1982	NULL	8107803603	NULL	NULL	NULL
484657	CUS0484657	OLAMILEKAN OLAREWAJU  ADEOGUN	OSHODI	LAGOS	NULL	4800	9 MAKINDE STR, MAFOLUKU,	555	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	LOW	VALUED.CUSTOMER	11	MR	OLAMILEKAN OLAREWAJU	ADEOGUN	MALE	05-JUL-1972	NULL		NULL	NULL	NULL
484662	CUS0484662	ANTHONY UCHENNA  OGHEE	JOS	PLATEAU	NULL	4800	89T ANGWAN LAMBU APATA JOS	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	ANTHONY UCHENNA	OGHEE	MALE	18-APR-1976	NULL		NULL	NULL	NULL
484783	CUS0484783	OBUSH  ATHANASIUS KEMJIKA	ISHERI-IDIMU	LAGOS	NULL	4800	NO8 LASU RD	501305	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	LOW	NULL		MR	OBUSH	ATHANASIUS KEMJIKA	MALE	13-SEP-1962	NULL	7034295454	NULL	NULL	NULL
486069	CUS0486069	OJUKWU ANTHONY OKECHUKWU	ESTATE, ABUJA	FEDERAL CAPITAL TERRITORY	NULL	4200	1 TONY ANTHONY LANE GWARIMPA	500809	NULL	4207	A1102359	PASSPORT	OJUKWU ANTHONY OKECHUKWU	NIS	2006-07-11	\N	MED	VALUED.CUSTOMER	11	MR	OJUKWU	OKECHUKWU	MALE	31-MAY-1963	NULL	8037877235	tonyojok@yahoo.co.uk	NULL	NULL
486082	CUS0486082	CHRISTIAN CHINWE  OKPE	ZONE 6 ABUJA	FEDERAL CAPITAL TERRITORY	NULL	4200	PLOT 2013 BISSAU STR,WUSE	777	NULL	4207	A1924169	PASSPORT	OKPE CHRISTIAN CHINWE	NIS	2006-07-24	\N	MED	NULL		MR	CHRISTIAN CHINWE	OKPE	MALE	12-AUG-1975	NULL	8037862749	NULL	NULL	NULL
486125	CUS0486125	MEGAPRAISES HOMEWARES LTD MEGAPRAIS	IRONSI STR MAITAMA	FEDERAL CAPITAL TERRITORY	NULL	6200	2 EUPHRATES ST OFF AGUIYI	777	NULL	6202	A2231217	PASSPORT	MEGAPRAISES HOMEWARES LTD	NIS	2006-09-01	\N	HIGH	VALUED.CUSTOMER	11	MESSRS	MEGAPRAISES HOMEWARES LTD	MEGAPRAISES HOMEWARES LTD	FEMALE	25-AUG-2005	NULL	8033115987	NULL	NULL	NULL
486205	CUS0486205	DARE  OLORUNFEMI	NEGRO CLOSE, MAITAMA	FEDERAL CAPITAL TERRITORY	NULL	4200	INDIAN HIGH COMMISSION,15 RIO	777	NULL	4207	ALD0597AA	PASSPORT	DARE OLORUNFEMI	NIS	2006-11-07	\N	MED	NULL		MR	DARE	OLORUNFEMI	MALE	10-MAY-1968	NULL	8055864382	NULL	NULL	NULL
491446	CUS0491446	SERVICES  IRICH NIGERIA SERVICES	ASABA	ASABA	NIGERIA	4500	1-3, SIMEON UDEH CRESENT, OFF	777	NULL	4501	NULL	DRIVING.LICENSE	ISAGBA RICHARD	FRSC	2011-02-22	\N	MED	NULL		MESSRS	SERVICES	IRICH NIGERIA SERVICES	MALE	03-SEP-1996	NULL	8066599008	NULL	NULL	NULL
495261	CUS0495261	EZERUKA INDUSTRIES LTD.	101 ST MICHAELS ROAD, ABA	ABA	NULL	4800	101 ST MICHAELS ROAD ABA	502535	NULL	4806	NULL	NULL	NULL	NULL	\N	\N	HIGH	VALUED.CUSTOMER	14	MR	EZERUKA INDUSTRIES LTD	EZERUKA INDUSTRIES LTD.	NULL		NULL		onyiimeg@yahoo.ca]	NULL	NULL
511521	CUS0511521	MFON UDO  AMOS	UYO	UYO	NULL	5300	222 ABAK ROAD	555	NULL	5318	NULL	NULL	NULL	NULL	\N	\N	LOW	NULL		MR	MFON UDO	AMOS	MALE	21-MAY-1985	NULL	8101348534	NULL	NULL	NULL
511819	CUS0511819	OLARIBIGBE ABULRAHMAN AGBABIAKA	LAGOS	LAGOS	Nigeria	4800	DD13,HFP WAY DOLPHIN EST IKOYI	500481	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	12	MR	OLARIBIGBE	AGBABIAKA	MALE	10-JAN-1990	NULL	8105124341	NULL	NULL	NULL
512446	CUS0512446	ABISOYE MARTINS  ONAGBESAN	OGUN STATE	IJEBU-ODE	NULL	4600	77 IBADAN RD IJEBU ODE	555	NULL	4601	1234	FEP	ONAGBESAN ABISOYE MARTINS	EFCC	2013-04-18	\N	LOW	NULL		MR	ABISOYE MARTINS	ONAGBESAN	MALE	23-JUL-1993	NULL		NULL	NULL	NULL
512744	CUS0512744	MEMUNAT OMOBOLANLE ODUNUGA	IKORODU	IJEBU-ODE	NG	4600	15 AJEGUNLE STRT.IMODI IJASI	555	NULL	4601	1234	FEP	ODUNUGA MEMUNAT OMOBOLANLE	EFCC	2013-04-18	\N	MED	VALUED.CUSTOMER	11	MISS	MEMUNAT	ODUNUGA	FEMALE	25-DEC-1990	PARTNER		NULL	NULL	NULL
512769	CUS0512769	AISHATU  HASSAN	JOS	PLATEAU	NULL	4800	83.16 YANDOKA STREET JOS	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MISS	AISHATU	HASSAN	FEMALE	21-DEC-1989	NULL		NULL	NULL	NULL
512815	CUS0512815	ADEMOLA BUNMI  ADELEKE	ILE-ILE BUSSTOP, KETU	LAGOS	NGN	4800	29, OLUWALOGBON STREET,	777	NULL	4803	KSF04097AA24	DRIVING.LICENSE	ADELEKE ADEMOLA BUNMI	FRSC	2017-07-28	2022-06-07	MED	VALUED.CUSTOMER	11	MR	ADEMOLA BUNMI	ADELEKE	MALE	07-JUN-1987	DIVORCED	8084298445	bunmiadeleke67@gmail.com	NULL	NULL
512883	CUS0512883	MARYJANE ADAOBI  OBIORAH	BABS ANIMASHAUN,S.L	LAGOS	NULL	4800	C.O NYSC	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	13	MRS	MARYJANE ADAOBI	OBIORAH	MALE	01-JAN-1991	NULL		]	NULL	NULL
512953	CUS0512953	EGBUNIKE BENJAMIN  ANENE	DAVNOTH OPP MIN OF WORKS ASABA	NULL	NULL	4800	2 SIR AUSTIN ST OFF OKPANAM	555	NULL	4806	DT078540056	NATIONAL.ID	ANENE EGBUNIKE BENJAMIN	NIMC	2005-06-30	\N	MED	VALUED.CUSTOMER	11	MR	EGBUNIKE BENJAMIN	ANENE	MALE	26-SEP-1989	NULL	8068814473	NULL	NULL	NULL
518787	CUS0518787	B.O. EGBEDIKE AND SONS NIG. LTD B.O	OFF RING ROAD, BENIN	BENIN	NULL	4900	23,29 MISSION ROAD	500779	NULL	4902	NULL	NULL	NULL	NULL	\N	\N	HIGH	VALUED.CUSTOMER	14	MISS	B.O. EGBEDIKE AND SONS NIG. LTD	B.O. EGBEDIKE AND SONS NIG. LTD	FEMALE	17-SEP-2008	NULL	8068794935	chukwudiegbedike@gmail.com	NULL	NULL
518806	CUS0518806	SPRINGTREE INTEGRATED SERV.LTD SPRI	WARRI	DELTA	NG	4900	22,WARRI-SAPELE RD,OPP.NAVAL BASE	555	NULL	4921	030DEF5BD6296060314	VOTERS.IDENTITY.CARD	OMATSEYE OMAGHOMI REAGAN	NIMC	2011-01-29	2020-12-31	HIGH	NULL		NULL	NULL	NULL	NULL		NULL		NULL	NULL	NULL
526102	CUS0526102	AQTANDA  OLUKAYODE	2 YOLAWA STREET OPP MALAM KATO	KANO	NULL	4600	BESIDE CBN QTRS OFF HADIJA RD	777	NULL	4601	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	AQTANDA	OLUKAYODE	NULL	07-JUN-1973	NULL		oatanda@vmobile-nigeria.com]	NULL	NULL
526264	CUS0526264	STANLEY EHIS  OKOSUN	NASARAWA LOCAL GOVT KANO	KANO	NULL	5200	KAWAJI QTRS KANO	777	NULL	5206	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	STANLEY EHIS	OKOSUN	MALE	19-AUG-1986	NULL		NULL	NULL	NULL
526352	CUS0526352	AMINU GARBA  DAN-BORNO	DAKATA QTRS KANO	KANO	NULL	5200	NO 98 K.NASSARAWA QTRS	777	NULL	5206	KN098708011	NATIONAL.ID	DAN-BORNO AMINU GARBA	NIMC	2007-03-16	\N	MED	NULL		ALHAJI	AMINU GARBA	DAN-BORNO	MALE	10-MAY-1957	NULL		NULL	NULL	NULL
526378	CUS0526378	JIBIRU  HARSI	S.GARI FAGGE .G.AREA KANO	KANO	NULL	5200	G.S.C.S. AIRPORT ROAD NEW ROAD	777	NULL	5206	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	JIBIRU	HARSI	NULL	22-FEB-1969	NULL	8026790724	NULL	NULL	NULL
526437	CUS0526437	LAWAN ABDULAZIZ  INUWA	MUNICIPAL LOCAL GOVT KANO	KANO	NULL	5200	NO 23 KURAWA QUARTERS	777	NULL	5206	B517629	PASSPORT	INUWA LAWAN ABDULAZIZ	NIS	2007-04-23	\N	MED	NULL		ALHAJI	LAWAN ABDULAZIZ	INUWA	MALE	08-OCT-1964	NULL	855713194	NULL	NULL	NULL
529071	CUS0529071	IDRIS YUSUF  IDRIS YUSUF	BAUCHI	BAUCHI	NULL	4800	UNGWAN MAJE STREET	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	LOW	VALUED.CUSTOMER	13	MR	IDRIS YUSUF	IDRIS YUSUF	MALE	01-FEB-1982	NULL	8127306616	NULL	NULL	NULL
529152	CUS0529152	ETHELBERT A.  ONUOHA	KANO	KANO	NULL	4800	22 MOHOGANY STREET NOMANSLAND	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	HIGH	VALUED.CUSTOMER	11	MR	ETHELBERT A.	ONUOHA	MALE	22-NOV-1974	NULL		]	NULL	NULL
529166	CUS0529166	AMAECHI SAMUEL ITF	ABIA STATE	ABIA	NULL	4800	10 IGBO STREET UMUAHIA	555	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	AMAECHI	ITF	MALE	10-APR-1954	NULL		NULL	NULL	NULL
534502	CUS0534502	DABO MUSA  	BLOCK 1	Kogi State	NG	4800	BLOCK 1, FLAT 2 CAUL CRICK CLOSE A^GEGE .	502229	NULL	4806	GGE49988AA11	NULL	DABO MUSA	FRSC.	\N	2020-07-09	MED	VALUED.CUSTOMER	11	MR	MUSA	DABO	MALE	07-SEP-1985	NULL	8180993639	DABS.BAL@GMAIL.COM	NULL	NULL
539577	CUS0539577	MATIAS  WORIMEGBE	IKEJA	LAGOS	NULL	4800	FED HIGHWAY PATHROL BARRACKS	555	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	LOW	NULL		MR	MATIAS	WORIMEGBE	MALE	25-DEC-1984	NULL		NULL	NULL	NULL
539709	CUS0539709	BEDE  OKEKE	ANAMBRA STATE	ONITSHA	NULL	4800	OPP ANAMBRA UNIVERSITY, ULI	502543	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	LOW	NULL		MR	BEDE	OKEKE	MALE	07-MAY-1975	NULL	8050357934	NULL	NULL	NULL
539969	CUS0539969	YEKINI AJIBADE ADEYINKA	IKORODU	LAGOS	NIGERIA	4800	22,SOLAJA STR,ISIU	555	NULL	4806	OY051078363	NATIONAL.ID	ADEYINKA YEKINI	NIMC	2005-05-11	\N	MED	VALUED.CUSTOMER	11	MR	YEKINI	ADEYINKA	MALE	13-FEB-1958	NULL	7081942775	NULL	NULL	NULL
539974	CUS0539974	GLADYS ELIZABETH WARRENS	LAGOS	LAGOS	NIGERIA	4800	12 MOBIL ROAD, IKOTA, AJAH	501441	NULL	4806	PU.24.08.05.020	VOTERS.IDENTITY.CARD	WARRENS GLADYS ELIZABETH	INEC	2011-01-26	\N	MED	VALUED.CUSTOMER	11	MRS	GLADYS	WARRENS	FEMALE	02-APR-1955	NULL		gladyswarrens@yahoo.com,]	NULL	NULL
540415	CUS0540415	ANTHONY ONWUKA  EMENYONU	PORT HARCOURT	PORT HARCOURT	NULL	4800	12 DEEPER LIFE RD, MGBUOSIMIN	555	NULL	4806	IM190260583	NATIONAL.ID	EMENYONU ANTHONY ONWUKA	NIMC	2006-11-10	\N	MED	VALUED.CUSTOMER	11	MR	ANTHONY ONWUKA	EMENYONU	MALE	11-AUG-1959	NULL	8037495122	NULL	NULL	NULL
541594	CUS0541594	AYODELE  OSISANYA	IJEBU ODE	IJEBU-ODE	NG	5000	13, ADENUGA STREET	555	234	5003	A00758421	PASSPORT	OSISANYA AYODELE	NIS	2009-01-13	\N	HIGH	VALUED.CUSTOMER	11	MR	AYODELE	OSISANYA	MALE	30-MAY-1975	NULL		ayodele.osisanya@gmail.com,]	NULL	NULL
541909	CUS0541909	ITUNU ADENIKE BELLO	SURULERE, LAGOS	LAGOS	NULL	4800	98 LAWANSON ROAD RAMONI B.ST	777	NULL	4804	A05011647	PASSPORT	ODEGBO-OLUKOYA ITUNU A.	NIS	2013-08-27	\N	LOW	VALUED.CUSTOMER	12	MISS	ITUNU	BELLO	FEMALE	09-AUG-1989	NULL	8169000578	tunzle@yahoo.com	NULL	NULL
545281	CUS0545281	HARUNA  BUKOLA	KANO	KANO	NG	4800	KUNTAU SCIENCE ACADEMY	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MR	HARUNA	BUKOLA	MALE	26-NOV-1979	NULL	8136870450	NULL	NULL	NULL
545774	CUS0545774	MUSTAPHA ISMAIL ISMAIL	KANO	KANO	NIGERIA	4800	SHEKA QTRS	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	LOW	VALUED.CUSTOMER	11	MR	MUSTAPHA	ISMAIL	MALE	10-OCT-1987	NULL	7069168701	ismailismailmustapha@yahoo.com	NULL	NULL
546184	CUS0546184	IDOLOR RESOURCES LIMITED	RUMUOMASI, PORT HARCOURT	PORT HARCOURT	NULL	4900	293 ABA.PH EXPRESS ROAD	503500	NULL	4921	PHC 9432AA	DRIVING.LICENSE	IDOLOR RESOURCES LIMITED	FRSC	2006-08-11	\N	MED	VALUED.CUSTOMER	14	NULL	IDOLOR RESOURCES LIMITED	IDOLOR RESOURCES LIMITED	NULL	31-DEC-2002	MARRIED		NULL	NULL	NULL
546290	CUS0546290	MBA CHUKWUMA  MBA CHUKWUMA	PRIMARY SCH, PORT HARCOURT	NULL	NULL	4200	AMADI AMA RAINBOW, BEHIND ARMY	777	NULL	4202	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		REVEREND	MBA CHUKWUMA	MBA CHUKWUMA	MALE	25-APR-1962	NULL	8033129818	NULL	NULL	NULL
547316	CUS0547316	HAMZA  YUSUF	BAUCHI	BAUCHI	NULL	4800	NASARAWA ODOJI AZARE BAUCHI	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	LOW	VALUED.CUSTOMER	13	MR	HAMZA	YUSUF	MALE	01-OCT-1975	MARRIED	8061168920	NULL	NULL	NULL
547440	CUS0547440	NANGOR PETER  NANYAK	ABBATTOIR, JOS	PLATEAU	NULL	4800	65, NAMUA, BEHIND COCIN CHURCH	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	NANGOR PETER	NANYAK	MALE	21-JAN-1985	NULL		NULL	NULL	NULL
547443	CUS0547443	CORNELINUS VICTOR  ANOCHIE	IGANMU	LAGOS	NULL	4800	11 ADEYEMI STR. ORILE	555	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	CORNELINUS VICTOR	ANOCHIE	MALE	30-MAY-1974	NULL	8180060204	NULL	NULL	NULL
548069	CUS0548069	ASUQUO GIDEON AKAN  ASUQUO	12 NUNG ANYANG UYO AKS	UYO	NULL	4800	NUNG OBIO AKAMA ANUA UYO	555	NULL	4806	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MR	ASUQUO GIDEON AKAN	ASUQUO	MALE	25-NOV-1995	NULL		NULL	NULL	NULL
548812	CUS0548812	SIKIRU ADEDAPO ADEKUNLE	PORTHARCOURT RIVER STATE	RIVERS	NIGERIA	4800	13 OKEMINI EXTENSION RUMUAGHAL	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MR	SIKIRU	ADEKUNLE	MALE	14-APR-1978	NULL		dapsonman@gmail.com]	NULL	NULL
551467	CUS0551467	BEDEMI SAMSON  SOWEIBOH	IKORODU	LAGOS	NULL	4800	20 SHAMUSIDEEN JAIYESEMI, AGA	555	NULL	4806	1234	FEP	SOWEIBOH BIDEMI SAMSON	EFCC	2013-06-21	\N	LOW	NULL		MR	BEDEMI SAMSON	SOWEIBOH	MALE	02-MAR-1992	NULL		NULL	NULL	NULL
551834	CUS0551834	ABIOLA ABIODUN  BABAJIDE	NNPC, APATA	OYO	NULL	4800	NO 10, OPEOLU SHOPPING COMPLEX	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	LOW	NULL		MR	ABIOLA ABIODUN	BABAJIDE	MALE	13-MAR-1992	NULL	8177589998	NULL	NULL	NULL
551850	CUS0551850	ITUNU CHRISTIANA  OSHO	ADEBISI TEMIDIRE STR, APATA,	OYO	NULL	4800	NO 12, MOJOYIN OLA L.OUT	555	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	LOW	NULL		MISS	ITUNU CHRISTIANA	OSHO	FEMALE	05-MAY-1997	NULL	7011351399	NULL	NULL	NULL
551884	CUS0551884	PAJODA NIGERIA LIMITED	ABUJA	FEDERAL CAPITAL TERRITORY	NIGERIA	4900	NO 10 EGBE IDI CLOSE GARKI 2	500809	NULL	4902	NULL	NULL	NULL	NULL	\N	\N	HIGH	VALUED.CUSTOMER	11	NULL	PAJODA NIGERIA LIMITED	PAJODA NIGERIA LIMITED	NULL		NULL	8032444181	NULL	NULL	NULL
555940	CUS0555940	RASHEED OLAKUNLE AMINU	LAGOS	LAGOS	NG	4800	35 SHOKUNBI STREET, MUSHIN	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MR	RASHEED	AMINU	MALE	08-APR-1976	NULL		abdulkunle2002@yahoo.com,]	NULL	NULL
557452	CUS0557452	MULIKAT AJOKE  MUTIU	EJIGBO	NULL	NULL	4800	5 AWOYEMI STR	500462	NULL	4803	1234	FEP	MUTIU MULIKAT AJOKE	EFCC	2013-06-28	\N	LOW	NULL		MRS	MULIKAT AJOKE	MUTIU	MALE	08-DEC-1974	NULL	8021235749	NULL	NULL	NULL
558092	CUS0558092	ATIKU MUHAMMAD ATIKU	KANO	KANO	NG	4800	26 DAUKI RD NASS GRA	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	LOW	VALUED.CUSTOMER	11	MR	ATIKU	ATIKU	MALE	31-MAR-1990	NULL		atikumuhammad46@yahoo.com,]	NULL	NULL
558917	CUS0558917	SOPHIA ORITSEBEMEWO  ORITSEGBONE	ASABA	ASABA	NULL	4800	NO.3 NWAMU CRES.UDA -LAYOUT	555	NULL	4803	1234	FEP	ORITSEGBONE SOPHIA ORITSEBEMEW	EFCC	2013-07-01	\N	LOW	NULL		MR	SOPHIA ORITSEBEMEWO	ORITSEGBONE	MALE	26-NOV-1995	NULL		NULL	NULL	NULL
560707	CUS0560707	ONENGIYEOFORI .P.  GEORGE	PHC	PORT HARCOURT	NULL	4800	26 HARBOUR RD	502380	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	LOW	NULL		MR	ONENGIYEOFORI .P.	GEORGE	MALE	30-JUL-1977	NULL	7062081088	NULL	NULL	NULL
560925	CUS0560925	DJEHOUNDE  GASTON	LAGOS	LAGOS	NULL	4300	RD 27 UGC LAGOS	555	NULL	4305	NULL	NULL	NULL	NULL	\N	\N	LOW	NULL		MR	DJEHOUNDE	GASTON	MALE	22-MAY-1994	NULL		NULL	NULL	NULL
564930	CUS0564930	NUHU  GARBA	JIGAWA	JIGAWA	NULL	4800	GWARAM KUKA QTRS	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	LOW	VALUED.CUSTOMER	13	MR	NUHU	GARBA	MALE	18-JUL-1973	MARRIED		NULL	NULL	NULL
565297	CUS0565297	IKECHUKWU  DAVID	T JUNCTION RUMUADAOLU	NULL	NULL	4800	T JUNCTION RUMUADAOLU	501708	NULL	4803	1234	FEP	DAVID IKECHUKWU	EFCC	2013-07-06	\N	LOW	NULL		MR	IKECHUKWU	DAVID	MALE	25-OCT-1967	NULL	7036294200	NULL	NULL	NULL
565382	CUS0565382	RACHAEL  DEYO	PORT HARCOURT	PORT HARCOURT	NULL	4800	18 MARKET LANE RUMUOMASI	555	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	LOW	NULL		MISS	RACHAEL	DEYO	FEMALE	24-APR-1986	NULL		NULL	NULL	NULL
565798	CUS0565798	AUSTINE  NDUBUEZE	RUMUOKORO	PORT HARCOURT	NULL	4800	36 NKPOLU STREET	555	NULL	4803	1234	FEP	NDUBUEZE AUSTINE	EFCC	2013-07-06	\N	LOW	NULL		MR	AUSTINE	NDUBUEZE	MALE	01-AUG-1992	NULL		NULL	NULL	NULL
566004	CUS0566004	FUAD  BADRU	IKORODU LAGOS	LAGOS	NULL	4800	15 JAMES DANIEL STREET	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MR	FUAD	BADRU	MALE		NULL		NULL	NULL	NULL
566207	CUS0566207	ADEPOJU  FOLORUNSO	EBUTE METTA LAGOS	LAGOS	NULL	4800	LSDPC EST BLK33 FLT7 GLOVER	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MR	ADEPOJU	FOLORUNSO	MALE	14-JAN-1974	MARRIED	8058909414	NULL	NULL	NULL
567182	CUS0567182	OLUWASEUN RUKAYAT  AROMASHODUN	VICTORIA ISLAND LAGOS	LAGOS	NULL	4800	PLOT 1415,ADETOKUNBO ADEMOLA	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	NULL		MISS	OLUWASEUN RUKAYAT	AROMASHODUN	FEMALE	07-JUL-1977	NULL		NULL	NULL	NULL
567372	CUS0567372	IMONODE SIMEON ABIOLA	ESTATE,OJODU	LAGOS	NULL	4900	32 KAYODE YUSUF STREET,MORGAN	500398	NULL	4921	NULL	NULL	NULL	NULL	\N	\N	LOW	NULL		MISS	IMONODE	ABIOLA	FEMALE	12-MAR-1997	NULL		abiolaimonode@yahoo.co.uk]	NULL	NULL
567415	CUS0567415	OLUWATOMIWA VICTOR  ODUTADE	OFF COKER ROAD, ILUPEJU LAGOS	LAGOS	NULL	4800	24,OBALODU STREET,	508601	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	NULL	VALUED.CUSTOMER	13	MR	OLUWATOMIWA VICTOR	ODUTADE	MALE	03-APR-2007	NULL		todutade@yahoo.co.uk]	NULL	NULL
568942	CUS0568942	OZIOMA FAVOUR  OBI	ABA ROAD	PORT HARCOURT	NULL	4800	NO 7 EBERI STREET	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	LOW	NULL		MISS	OZIOMA FAVOUR	OBI	MALE	01-AUG-1994	NULL	8063261147	NULL	NULL	NULL
569196	CUS0569196	OGBONNA OBI  OBOSI	ISI-UZO LGA HQ, IKEM	ENUGU	NULL	4800	NO.1,OBOSI CLOSE GRA EHA-AMUFU	502556	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MR	OGBONNA OBI	OBOSI	MALE	29-JUN-1963	NULL	8032874733	bonpayman@yahoo.com	NULL	NULL
569285	CUS0569285	OBINA WILLIAM  IKECHUKWU	8,CHIKE UB CLOSE,OFF SEDCO R	WARRI	NULL	4800	8,CHIKE UB CLOSE,OFF SEDCO RD	502844	NULL	4806	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MR	OBINA WILLIAM	IKECHUKWU	MALE	15-MAR-1988	NULL	9036489448	NULL	NULL	NULL
572230	CUS0572230	YASSAR IDREES  ADHAMA	KANO	KANO	NULL	4800	NO 19 LAMIDO JERRACE,NASS	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	LOW	VALUED.CUSTOMER	11	MR	YASSAR IDREES	ADHAMA	MALE	19-JAN-1992	NULL		]	NULL	NULL
572876	CUS0572876	BRIGHT FRIDAY  DANIEL	ORAZZI, PHC	PORT HARCOURT	NULL	4800	EKEMEWOR STREET	555	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	LOW	NULL		MISS	BRIGHT FRIDAY	DANIEL	FEMALE	29-SEP-1990	NULL		NULL	NULL	NULL
573036	CUS0573036	MALLAM EL-MUSTAPHA ISA	KUMBOTSO LGA	KANO	NULL	5300	CHARANCHI QTRS,KANO	777	NULL	5318	NULL	NULL	NULL	NULL	\N	\N	MED	VALUED.CUSTOMER	11	MR	MALLAM	ISA	MALE	01-JAN-1970	NULL		NULL	NULL	NULL
575303	CUS0575303	AYOTOYE AKINFENWA  AKINSOTO	LAGOS	ENUGU	NULL	4800	2A ROROBI STREET OLODI APAPA	555	NULL	4806	NULL	NULL	NULL	NULL	\N	\N	LOW	NULL		MR	AYOTOYE AKINFENWA	AKINSOTO	NULL	18-NOV-1994	NULL		NULL	NULL	NULL
575878	CUS0575878	OGONNA  JOHN	RUMUODUMAYA	PORT HARCOURT	NULL	4800	NO 2 EKIBORO	777	NULL	4803	1234	FEP	JOHN OGONNA	EFCC	2013-07-15	\N	LOW	NULL		MR	OGONNA	JOHN	MALE	26-NOV-1970	NULL		NULL	NULL	NULL
577374	CUS0577374	FATIMA  MUKHTAR	KANO	KANO	NULL	4800	NO 581 YAKASAI QTRS	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	LOW	VALUED.CUSTOMER	11	MRS	FATIMA	MUKHTAR	FEMALE	26-NOV-1991	NULL		fatimamukhtar25@gmail.com,]	NULL	NULL
578020	CUS0578020	NAFISA  MUSTAPHA	KANO	KANO	NULL	4800	NO 69 ISA RINGIM STR,SHARADA	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	LOW	VALUED.CUSTOMER	11	MR	NAFISA	MUSTAPHA	MALE	27-AUG-1992	NULL	8031924713	NULL	NULL	NULL
578334	CUS0578334	MODUPE LINDA  TAIWO	IBADAN	IBADAN	NULL	4600	UNIVERSITY OF IBADAN, IBADAN	555	NULL	4601	1234	FEP	TAIWO MODUPE LINDA	EFCC	2013-07-17	\N	LOW	NULL		MISS	MODUPE LINDA	TAIWO	MALE	10-AUG-1992	NULL		NULL	NULL	NULL
578375	CUS0578375	JENNIFER ANWULI OFUONYE	NG	WARRI	NIGERIA	4800	33A OGOJA ST,DSC WARRI	777	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	NULL	VALUED.CUSTOMER	11	MISS	JENNIFER	OFUONYE	FEMALE	06-JUN-1989	NULL	8067314468	juicybabe16@yahoo.com	NULL	NULL
578384	CUS0578384	AUGUSTINE  OBEZE	EST IGBOELERIN,LAGOS.	NULL	NULL	4800	16 OLANREWAJU STREET,ASHADE	501694	NULL	4803	NULL	NULL	NULL	NULL	\N	\N	LOW	NULL		MR	AUGUSTINE	OBEZE	MALE	02-JUN-1984	NULL		NULL	NULL	NULL
\.


--
-- Data for Name: st_stmt_entry; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.st_stmt_entry (id, stmt_entry_id, account_number, company_code, amt_lcy, transaction_code, their_reference, narrative, pl_category, customer_id, account_officer, product_category, value_date, currency, amount_fcy, exchange_rate, negotiated_ref_num, position_type, our_reference, reversal_marker, exposure_date, currency_market, department_code, trans_reference, system_id, booking_date, stmt_no, override, record_status, curr_no, inputter, date_time, authoriser, suspense_category, suspnse_value_date, suppress_position, crf_type, crf_txn_code, crf_currency, consol_key, crf_mat_date, crf_prod_cat, pm_type, dealer_desk, counterparty, liquidation_mode, repayment_date, repayment_type, repayment_amt, outstanding_bal, contract_int_rate, contract_int_key, cycle_forward, orig_local_equiv, original_amount, original_ccy, original_acct, original_exch_rate, exp_split_date, exp_split_amt, orig_amount_lcy, bank_sort_cde, cheque_number, chq_coll_id, drawn_account, accounting_date, pc_period_end, pc_applied, process_forward, aa_suspense_ref, pos_exp_date, rc_detail_id, tax_data, cus_pl_account, reserved_7, reserved_8, reserved_9, reserved_10, reserved_11, reserved_12, reserved_13, reserved_14, amount_deal_ccy, deal_ccy, deal_exch_rate, mask_print, mask_narrative, stmt1_date, stmt2_date, chq_type, tax_exch_rate, net_param, master_account, addl_trans_ref, interest_rate, dd_mandate_ref, dd_item_ref, dd_mandate_date, contract_bal_id, trade_date, processing_date, balance_type, aa_item_ref, accrual_data, orig_ccy_market, card_number, card_txn_detail, draft_payee_name, t24_load_date, efz_load_date, efz_co_code, business_date, date_time_custom, column_, status, user_id, updated_at) FROM stdin;
25	200897573121701.010002	2410907	NG0020006	-0.14	804	AA16123T3BW0	Deposit Interest??MAKEDUE?	\N	620931	514508	6601	20230102	NGN	\N	\N	\N	TR	0002410907	\N	2023-01-03	1	\N	AAACT23003WJ9H0HJQ	AAAA	20230103	200897573121701.01?1-3	\N	\N	1	69025_OFSUSER__OFS_AA.COB	1672521701.0489	69025_OFSUSER	\N	\N	\N	PAYDEPOSITINT	\N	\N	AC.1.TR.NGN.6601.514508.6000.6001.NG.4...CUR....NG0020006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	CLDEFAULT	\N	\N	\N	\N	\N	\N	\N	\N	2023-01-03	PAYDEPOSITINT	\N	\N	1	0	\N	\N	2023-01-04 00:00:00.000	2023-01-04 00:00:00.000	NG0020001	2023-01-03	2022-12-31 21:21:41.000	\N	draft	\N	\N
27	200964411997904.010001	26350571	NG0020076	2000.00	258	\N	BANK?NIP From 10000423010713235510225602?7027 Paycom PAYREF:1000042301071323?55102256027027 SENDER: onyebuchi ko?sarachukwu idika REMARK: Transf	\N	964103	1111	6009	20230109	NGN	\N	\N	\N	TR	FT23009H891S	\N	2023-01-09	1	110	FT23009H891S\\SBN	FT	20230109	NG0020001?200964411997904.00?1-2?NG0020076?200964411997904.01?1-2	\N	\N	1	44119_NIPINUSER__OFS_GCS	1673097904.0018	44119_NIPINUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6009.1111.4900.4902.NG.2...CUR...FEMALE.NG0020076	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26350571	\N	2023-01-09	CURBALANCE	ACCOUNTS-TRANSFERIN-ARRANGEMENT*20230109*NG0020076*AA161179SBLQ**DIRECT*AAACT23009J13VLVN0	\N	1	0	\N	\N	2023-01-10 00:00:00.000	2023-01-10 00:00:00.000	NG0020001	2023-01-09	2023-01-07 13:25:04.000	\N	draft	\N	\N
28	200966121150003.020001	21865690	NG0020065	2000.00	258	\N	BANK?NIP From 00001323010701055000068564?1554 GTBank Plc PAYREF:000685641554?SENDER: SAKA AFOLABI MUMEEN REMARK?: USSD NIP Transfer from 070661	\N	617370	501527	6009	20230109	NGN	\N	\N	\N	TR	FT23009FB13D	\N	2023-01-09	1	110	FT23009FB13D\\SBN	FT	20230109	NG0020001?200966121150003.01?1-2?NG0020065?200966121150003.02?1-2	\N	\N	1	61211_NIPINUSER__OFS_GCS	1673050003.0690	61211_NIPINUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6009.501527.4800.4806.NG.2...CUR...MALE.NG0020065	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	21865690	\N	2023-01-09	CURBALANCE	ACCOUNTS-TRANSFERIN-ARRANGEMENT*20230109*NG0020065*AA161170PY13**DIRECT*AAACT23009Q7PTQ8TZ	\N	1	0	\N	\N	2023-01-10 00:00:00.000	2023-01-10 00:00:00.000	NG0020001	2023-01-09	2023-01-07 00:06:43.000	\N	draft	\N	\N
29	200979703612259.010001	32664268	NG0020115	-120000.00	866	\N	NIBSS INSTANT PAYMENT TSS?OneBank Transfer from ULOMA OBUMA O?LOSUNDE to ULOMA OBUMA OLOSUNDE(TFR?FRM ULOMA OLOSUNDE)	\N	1387393	508056	6001	20230109	NGN	\N	\N	\N	TR	FT23009QT7B8	\N	2023-01-09	1	110	FT23009QT7B8\\SBN	FT	20230109	NG0020001?200979703612259.00?1-2?NG0020115?200979703612259.01?1-2	\N	\N	1	97036_NIPINUSER__OFS_GCS	1673212259.0065	97036_NIPINUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6001.515473.4800.4803.NG.1...CUR...FEMALE.NG0020115	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32664268	\N	2023-01-09	CURBALANCE	ACCOUNTS-ATMDRAW-ARRANGEMENT*20230109*NG0020115*AA16117JSKJ4**DIRECT*AAACT2300948C55HVV	\N	1	0	\N	\N	2023-01-10 00:00:00.000	2023-01-10 00:00:00.000	NG0020001	2023-01-09	2023-01-08 21:10:59.000	\N	draft	\N	\N
30	200964988291504.010001	29848796	NG0020131	-10.00	201	\N	NIPFEE/Trf 5000.00 frm JONATHAN BAR?NABAS to LENGKAT YAKUBU	\N	1204067	555	6001	20230109	NGN	\N	\N	\N	TR	FT23009ZC0LN	\N	2023-01-09	1	110	FT23009ZC0LN	FT	20230109	200964988291504.01?1?1	\N	\N	1	49882_NIPINUSER__OFS_GCS	1673091504.0811	49882_NIPINUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6001.509632.4800.4806.NG.2...CUR...MALE.NG0020131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	29848796	\N	2023-01-09	CURBALANCE	ACCOUNTS-DEBITFEE-ARRANGEMENT*20230109*NG0020131*AA161179Z0MD**DIRECT*AAACT23009L41TD794	\N	1	0	\N	\N	2023-01-10 00:00:00.000	2023-01-10 00:00:00.000	NG0020001	2023-01-09	2023-01-07 11:38:24.000	\N	draft	\N	\N
31	200904076977287.020001	29848796	NG0020131	-6.98	866	\N	MTN TELCO CHARGE ACCOUNT?MTN USSD charge for 01 01 2023	\N	1204067	555	6001	20230103	NGN	\N	\N	\N	TR	FT230038XFTN	\N	2023-01-03	1	110	FT230038XFTN\\SBN	FT	20230103	NG0020001?200904076977287.01?1-2?NG0020131?200904076977287.02?1-2	\N	\N	1	40769_NIPINUSER__OFS_GCS	1672577287.0964	40769_NIPINUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6001.509632.4800.4806.NG.2...CUR...MALE.NG0020131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	29848796	\N	2023-01-03	CURBALANCE	ACCOUNTS-ATMDRAW-ARRANGEMENT*20230103*NG0020131*AA161179Z0MD**DIRECT*AAACT23003GTCN4Z1H	\N	1	0	\N	\N	2023-01-04 00:00:00.000	2023-01-04 00:00:00.000	NG0020001	2023-01-03	2023-01-01 12:48:07.000	\N	draft	\N	\N
32	200987321081663.010001	29848796	NG0020131	6000.00	866	\N	NIBSS INSTANT PAYMENT TSS?Trf 6000.00 frm JONATHAN BARNABAS t?o AGU VIVIAN CHIOMA	\N	1204067	555	6001	20230109	NGN	\N	\N	\N	TR	FT23009G30DY	R	2023-01-09	1	110	FT23009G30DY\\SBN	FT	20230109	NG0020001?200987321081663.00?1-2?NG0020131?200987321081663.01?1-2???	\N	REVE	1	73210_VTELLUSER__OFS_GCS	1673281663.0266	73210_VTELLUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6001.509632.4800.4806.NG.2...CUR...MALE.NG0020131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SYSTEM	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	29848796	\N	2023-01-09	CURBALANCE	ACCOUNTS-ATMDRAW-ARRANGEMENT*20230109*NG0020131*AA161179Z0MD**DIRECT*AAACT23009HTQ1MM2K	\N	1	0	\N	\N	2023-01-10 00:00:00.000	2023-01-10 00:00:00.000	NG0020001	2023-01-09	2023-01-09 16:27:43.000	\N	draft	\N	\N
33	200987411281845.020001	89409843	NG0020118	-3300.00	866	\N	NIBSS INSTANT PAYMENT TSS?Trf 3300.00 frm HASSAN AHMED to MUS?TAPHA AMINAT	\N	15875498	777	6009	20230109	NGN	\N	\N	\N	TR	FT23009NLJQ0	\N	2023-01-09	1	110	FT23009NLJQ0\\SBN	FT	20230109	NG0020001?200987411281845.01?1-2?NG0020118?200987411281845.02?1-2	\N	\N	1	74112_NIPINUSER__OFS_GCS	1673281845.0240	74112_NIPINUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6009.500697.4800.4806.NG.1...CUR...MALE.NG0020118	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	89409843	\N	2023-01-09	CURBALANCE	ACCOUNTS-ATMDRAW-ARRANGEMENT*20230109*NG0020118*AA22175MHZ0H**DIRECT*AAACT23009VY25SNSB	\N	1	0	\N	\N	2023-01-10 00:00:00.000	2023-01-10 00:00:00.000	NG0020001	2023-01-09	2023-01-09 16:30:45.000	\N	draft	\N	\N
23	201096962382039.020001	29848796	NG0020131	-6.98	866	\N	MTN TELCO CHARGE ACCOUNT?MTN USSD charge for 20 01 2023	\N	1204067	555	6001	20230120	NGN	\N	\N	\N	TR	FT23020BHJC7	\N	2023-01-20	1	110	FT23020BHJC7\\SBN	FT	20230120	NG0020001?201096962382039.01?1-2?NG0020131?201096962382039.02?1-2	\N	\N	1	69623_NIPINUSER__OFS_GCS	1674182039.0895	69623_NIPINUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6001.509632.4800.4806.NG.2...CUR...MALE.NG0020131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	29848796	\N	2023-01-20	CURBALANCE	ACCOUNTS-ATMDRAW-ARRANGEMENT*20230120*NG0020131*AA161179Z0MD**DIRECT*AAACT23020T9H6CDD0	\N	1	0	\N	\N	2023-01-23 00:00:00.000	2023-01-21 00:00:00.000	NG0020001	2023-01-20	2023-01-20 02:33:59.000	\N	done	43	27-SEP-2023 05:17:52.869357 PM
26	201099817929214.020001	10476210	NG0020022	-5000.00	866	\N	NIBSS INSTANT PAYMENT TSS?OneBank Transfer from FOLORUNSO MIC?HAEL AGBOOLA to AGBOOLA FOLORUNSO M?ICHAEL	\N	6609872	500269	6001	20230120	NGN	\N	\N	\N	TR	FT23020SK0CW	\N	2023-01-20	1	110	FT23020SK0CW\\SBN	FT	20230120	NG0020001?201099817929214.01?1-2?NG0020022?201099817929214.02?1-2	\N	\N	1	98179_NIPINUSER__OFS_GCS	1674229214.0813	98179_NIPINUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6001.509488.4800.4806.NG.2...CUR...MALE.NG0020022	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10476210	\N	2023-01-20	CURBALANCE	ACCOUNTS-ATMDRAW-ARRANGEMENT*20230120*NG0020022*AA161172YVHB**DIRECT*AAACT230204P7GKBV0	\N	1	0	\N	\N	2023-01-23 00:00:00.000	2023-01-21 00:00:00.000	NG0020001	2023-01-20	2023-01-20 15:40:14.000	\N	done	43	27-SEP-2023 08:27:19.542225 PM
34	200972488275351.020001	89409843	NG0020118	-0.75	201	\N	VALUE ADDED TAX?NIPVAT/Trf 1800.00 frm HASSAN AHMED?to HAYATU YUNUSA	\N	15875498	777	6009	20230109	NGN	\N	\N	\N	TR	FT23009MQDWL	\N	2023-01-09	1	110	FT23009MQDWL\\SBN	FT	20230109	NG0020001?200972488275351.01?1-2?NG0020118?200972488275351.02?1-2	\N	\N	1	24882_NIPINUSER__OFS_GCS	1673175351.0728	24882_NIPINUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6009.500697.4800.4806.NG.1...CUR...MALE.NG0020118	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	89409843	\N	2023-01-09	CURBALANCE	ACCOUNTS-DEBITFEE-ARRANGEMENT*20230109*NG0020118*AA22175MHZ0H**DIRECT*AAACT2300991CDJTVN	\N	1	0	\N	\N	2023-01-10 00:00:00.000	2023-01-10 00:00:00.000	NG0020001	2023-01-09	2023-01-08 10:55:51.000	\N	draft	\N	\N
35	200983578777933.020001	89409843	NG0020118	35925.28	258	\N	BANK?DEC SALARY 2022 092023148591574	\N	15875498	500697	6009	20230109	NGN	\N	\N	\N	TR	FT230093M5WM	\N	2023-01-09	1	110	FT230093M5WM\\SBN	FT	20230109	NG0020001?200983578777933.01?1-2?NG0020118?200983578777933.02?1-4	\N	\N	1	35787_BULKTRAUSER__OFS_GCS	1673277933.0847	35787_BULKTRAUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6009.500697.4800.4806.NG.1...CUR...MALE.NG0020118	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	89409843	\N	2023-01-09	CURBALANCE	ACCOUNTS-TRANSFERIN-ARRANGEMENT*20230109*NG0020118*AA22175MHZ0H**DIRECT*AAACT23009F07GHZV5	\N	1	0	\N	\N	2023-01-10 00:00:00.000	2023-01-10 00:00:00.000	NG0020001	2023-01-09	2023-01-09 15:25:33.000	\N	draft	\N	\N
2	201225924962146.020001	29848796	NG0020131	-6.98	866	\N	MTN TELCO CHARGE ACCOUNT?MTN USSD charge for 02 02 2023	\N	1204067	555	6001	20230203	NGN	\N	\N	\N	TR	FT23034ZK9MD	\N	2023-02-03	1	110	FT23034ZK9MD\\SBN	FT	20230203	NG0020001?201225924962146.01?1-2?NG0020131?201225924962146.02?1-2	\N	\N	1	59249_NIPINUSER__OFS_GCS	1675362147.0075	59249_NIPINUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6001.509632.4800.4806.NG.2...CUR...MALE.NG0020131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	29848796	\N	2023-02-03	CURBALANCE	ACCOUNTS-ATMDRAW-ARRANGEMENT*20230203*NG0020131*AA161179Z0MD**DIRECT*AAACT23034PJLK7WB4	\N	1	0	\N	\N	2023-02-06 00:00:00.000	2023-02-04 00:00:00.000	NG0020001	2023-02-03	2023-02-02 18:22:27.000	\N	draft	\N	\N
4	200930036637931.020001	92269854	NG0020074	-1000.00	866	\N	Card fee for 0092269854	\N	16069982	777	6001	20230104	NGN	\N	\N	\N	TR	FT23004K110P	\N	2023-01-04	1	110	FT23004K110P\\SBN	FT	20230104	NG0020001?200930036637931.01?1?1?NG0020074?200930036637931.02?1-2	\N	\N	1	366_VTELLUSER__OFS_GCS	1672837931.0385	366_VTELLUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6001.777.4800.4806.NG.1......FEMALE.NG0020074	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	92269854	\N	2023-01-04	CURBALANCE	ACCOUNTS-ATMDRAW-ARRANGEMENT*20230104*NG0020074*AA2300418THT**DIRECT*AAACT23004043Z66T6	\N	1	0	\N	\N	2023-01-05 00:00:00.000	2023-01-05 00:00:00.000	NG0020001	2023-01-04	2023-01-04 13:12:11.000	\N	draft	\N	\N
5	200920822229065.020001	29848796	NG0020131	-0.52	866	\N	VALUE ADDED TAX?MTN USSD VAT for 03 01 2023	\N	1204067	555	6001	20230103	NGN	\N	\N	\N	TR	FT230033RJ6K	\N	2023-01-03	1	110	FT230033RJ6K\\SBN	FT	20230103	NG0020001?200920822229065.01?1-2?NG0020131?200920822229065.02?1-2	\N	\N	1	8222_NIPINUSER__OFS_GCS	1672729065.0218	8222_NIPINUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6001.509632.4800.4806.NG.2...CUR...MALE.NG0020131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	29848796	\N	2023-01-03	CURBALANCE	ACCOUNTS-ATMDRAW-ARRANGEMENT*20230103*NG0020131*AA161179Z0MD**DIRECT*AAACT230032ZMZZH6L	\N	1	0	\N	\N	2023-01-04 00:00:00.000	2023-01-04 00:00:00.000	NG0020001	2023-01-03	2023-01-03 06:57:45.000	\N	draft	\N	\N
7	200894847021725.000001	2403736	NG0020006	85.51	862	AA1612351VCN	Deposit Interest??MAKEDUE?	\N	620247	514508	6601	20230102	NGN	\N	\N	\N	TR	0002403736	\N	2023-01-02	1	\N	AAACT23003KM4CJC0D	AAAA	20230103	200894847021725.00?1-3	\N	\N	1	68988_OFSUSER__OFS_AA.COB	1672521725.0037	68988_OFSUSER	\N	\N	\N	PAYDEPOSITINT	\N	\N	AC.1.TR.NGN.6601.514508.5200.5206.NG.2...CUR....NG0020006	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	CLDEFAULT	\N	\N	\N	\N	\N	\N	\N	\N	2023-01-03	PAYDEPOSITINT	\N	\N	1	0	\N	\N	2023-01-04 00:00:00.000	2023-01-04 00:00:00.000	NG0020001	2023-01-03	2022-12-31 21:22:05.000	\N	draft	\N	\N
8	200931993941265.020001	29848796	NG0020131	-6.98	866	\N	MTN TELCO CHARGE ACCOUNT?MTN USSD charge for 04 01 2023	\N	1204067	555	6001	20230104	NGN	\N	\N	\N	TR	FT23004DYYGX	\N	2023-01-04	1	110	FT23004DYYGX\\SBN	FT	20230104	NG0020001?200931993941265.01?1-2?NG0020131?200931993941265.02?1-2	\N	\N	1	19939_NIPINUSER__OFS_GCS	1672841265.0939	19939_NIPINUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6001.509632.4800.4806.NG.2...CUR...MALE.NG0020131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	29848796	\N	2023-01-04	CURBALANCE	ACCOUNTS-ATMDRAW-ARRANGEMENT*20230104*NG0020131*AA161179Z0MD**DIRECT*AAACT2300477NQFGRS	\N	1	0	\N	\N	2023-01-05 00:00:00.000	2023-01-05 00:00:00.000	NG0020001	2023-01-04	2023-01-04 14:07:45.000	\N	draft	\N	\N
9	200927717764320.020001	89409843	NG0020118	-1.88	201	\N	VALUE ADDED TAX?NIPVAT/Trf 6150.00 frm HASSAN AHMED?to ABDULMALIK MUHAMMAD	\N	15875498	777	6009	20230103	NGN	\N	\N	\N	TR	FT23003LGZMT	\N	2023-01-03	1	110	FT23003LGZMT\\SBN	FT	20230103	NG0020001?200927717764320.01?1-2?NG0020118?200927717764320.02?1-2	\N	\N	1	77177_NIPINUSER__OFS_GCS	1672764320.0749	77177_NIPINUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6009.500697.4800.4806.NG.1...CUR...MALE.NG0020118	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	89409843	\N	2023-01-03	CURBALANCE	ACCOUNTS-DEBITFEE-ARRANGEMENT*20230103*NG0020118*AA22175MHZ0H**DIRECT*AAACT23003X1LQ31QH	\N	1	0	\N	\N	2023-01-04 00:00:00.000	2023-01-04 00:00:00.000	NG0020001	2023-01-03	2023-01-03 16:45:20.000	\N	draft	\N	\N
10	201489387703139.020001	32664268	NG0020115	-1.88	201	\N	VALUE ADDED TAX?NIPVAT/OneBank Transfer from ULOMA?OBUMA OLOSUNDE to ULOMA OBUMA OLOSU?NDE(TFR FRM ULOMA OLOSUNDE)	\N	1387393	508056	6001	20230301	NGN	\N	\N	\N	TR	FT23060SJD38	\N	2023-03-01	1	110	FT23060SJD38\\SBN	FT	20230301	NG0020001?201489387703139.01?1-2?NG0020115?201489387703139.02?1-2	\N	\N	1	93877_NIPINUSER__OFS_GCS	1677603139.0726	93877_NIPINUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6001.515473.4800.4803.NG.1...CUR...FEMALE.NG0020115	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32664268	\N	2023-03-01	CURBALANCE	ACCOUNTS-DEBITFEE-ARRANGEMENT*20230301*NG0020115*AA16117JSKJ4**DIRECT*AAACT2306033RQ4JMM	\N	1	0	\N	\N	2023-03-02 00:00:00.000	2023-03-02 00:00:00.000	NG0020001	2023-03-01	2023-02-28 16:52:19.000	\N	draft	\N	\N
11	201295982856808.020001	32664268	NG0020115	-4500.00	866	\N	PROSPER OBASI?OneBank Transfer from ULOMA OBUMA O?LOSUNDE to PROSPER OBASI(TFR FRM Mr?s ULOMA OLOSUNDE)	\N	1387393	508056	6001	20230209	NGN	\N	\N	\N	TR	FT23040PMQLF	\N	2023-02-09	1	110	FT23040PMQLF	FT	20230209	201295982856808.02?1-2?NG0020119?201295982856808.03?1-2?NG0020001?201295982856808.04?1-2	\N	\N	1	59828_NIPINUSER__OFS_GCS	1675956808.0251	59828_NIPINUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6001.515473.4800.4803.NG.1...CUR...FEMALE.NG0020115	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32664268	\N	2023-02-09	CURBALANCE	ACCOUNTS-ATMDRAW-ARRANGEMENT*20230209*NG0020115*AA16117JSKJ4**DIRECT*AAACT23040PR3S4YVC	\N	1	0	\N	\N	2023-02-10 00:00:00.000	2023-02-10 00:00:00.000	NG0020001	2023-02-09	2023-02-09 15:33:28.000	\N	draft	\N	\N
12	200891284184989.020001	29848796	NG0020131	-200.00	866	\N	CLICATELL ACCOUNT?PRN 93969882 GORC CLIC VTUP MTNN MT?NZERO	\N	1204067	555	6001	20230103	NGN	\N	\N	\N	TR	FT2300313XSM	\N	2023-01-03	1	110	FT2300313XSM\\SBN	FT	20230103	NG0020001?200891284184989.01?1-2?NG0020131?200891284184989.02?1-2	\N	\N	1	12841_VTUUSER__OFS_GCS	1672484989.0524	12841_VTUUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6001.509632.4800.4806.NG.2...CUR...MALE.NG0020131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	29848796	\N	2023-01-03	CURBALANCE	ACCOUNTS-ATMDRAW-ARRANGEMENT*20230103*NG0020131*AA161179Z0MD**DIRECT*AAACT230034NPL4GPL	\N	1	0	\N	\N	2023-01-04 00:00:00.000	2023-01-04 00:00:00.000	NG0020001	2023-01-03	2022-12-31 11:09:49.000	\N	draft	\N	\N
1	200994505960278.010001	92317638	NG0020074	-50.00	833	\N	NIPOST STAMP DUTIES?Capitalise Actvity For EMT Levy?EMT Levy TT23010S11L2	\N	16072635	513242	1004	20230110	NGN	\N	\N	\N	TR	FT23010BYLWJ	\N	2023-01-10	1	110	FT23010BYLWJ	FT	20230110	200994505960278.01?1-2	\N	\N	1	68888_OFSUSER__OFS_AA.COB	1673360278.0105	68888_OFSUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.1004.513242.4800.4804.NG.2.......NG0020074	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	92317638	\N	2023-01-10	CURBALANCE	ACCOUNTS-DEBITFEE-ARRANGEMENT*20230110*NG0020074*AA23010J8G47**DIRECT*AAACT23010JCQ1Z32H	\N	1	0	\N	\N	2023-01-11 00:00:00.000	2023-01-11 00:00:00.000	NG0020001	2023-01-10	2023-01-10 14:17:58.000	\N	done	43	05-OCT-2023 12:13:49.461595 PM
3	200983126895597.010001	32664268	NG0020115	-50.00	833	\N	STAMP DUTY COLLECTION ACCOUNT.?Capitalise Actvity For EMT Levy?EMT Levy FT23010KF10N	\N	1387393	508056	6001	20230110	NGN	\N	\N	\N	TR	FT23010VXH0Z	\N	2023-01-10	1	110	FT23010VXH0Z\\SBN	FT	20230110	NG0020001?200983126895597.00?1-2?NG0020115?200983126895597.01?1-2	\N	\N	1	68876_OFSUSER__OFS_AA.COB	1673295597.0035	68876_OFSUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6001.515473.4800.4803.NG.1...CUR...FEMALE.NG0020115	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	32664268	\N	2023-01-10	CURBALANCE	ACCOUNTS-DEBITFEE-ARRANGEMENT*20230110*NG0020115*AA16117JSKJ4**DIRECT*AAACT23010CCB246F6	\N	1	0	\N	\N	2023-01-11 00:00:00.000	2023-01-11 00:00:00.000	NG0020001	2023-01-10	2023-01-09 20:19:57.000	\N	done	43	05-OCT-2023 12:14:03.170874 PM
13	200913236867847.010001	89409843	NG0020118	-10.00	201	\N	NIPFEE/Trf 2600.00 frm HASSAN AHMED?to ABDULMALIK MUHAMMAD	\N	15875498	777	6009	20230103	NGN	\N	\N	\N	TR	FT23003KFLB2	\N	2023-01-03	1	110	FT23003KFLB2	FT	20230103	200913236867847.01?1?1	\N	\N	1	32368_NIPINUSER__OFS_GCS	1672667847.0302	32368_NIPINUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6009.500697.4800.4806.NG.1...CUR...MALE.NG0020118	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	89409843	\N	2023-01-03	CURBALANCE	ACCOUNTS-DEBITFEE-ARRANGEMENT*20230103*NG0020118*AA22175MHZ0H**DIRECT*AAACT23003CRQ622WW	\N	1	0	\N	\N	2023-01-04 00:00:00.000	2023-01-04 00:00:00.000	NG0020001	2023-01-03	2023-01-02 13:57:27.000	\N	draft	\N	\N
14	200905817977289.020001	29848796	NG0020131	-0.52	866	\N	VALUE ADDED TAX?MTN USSD VAT for 01 01 2023	\N	1204067	555	6001	20230103	NGN	\N	\N	\N	TR	FT230033ZN94	\N	2023-01-03	1	110	FT230033ZN94\\SBN	FT	20230103	NG0020001?200905817977289.01?1-2?NG0020131?200905817977289.02?1-2	\N	\N	1	58179_NIPINUSER__OFS_GCS	1672577289.0764	58179_NIPINUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6001.509632.4800.4806.NG.2...CUR...MALE.NG0020131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	29848796	\N	2023-01-03	CURBALANCE	ACCOUNTS-ATMDRAW-ARRANGEMENT*20230103*NG0020131*AA161179Z0MD**DIRECT*AAACT23003P4JVSTX6	\N	1	0	\N	\N	2023-01-04 00:00:00.000	2023-01-04 00:00:00.000	NG0020001	2023-01-03	2023-01-01 12:48:09.000	\N	draft	\N	\N
15	200891271413629.020001	79920543	NG0020174	20000.00	799	\N	SBN.ORDERING.CUST?Card transaction?000046822663,USD :KEMEDOUKUMO BALSAM NES	\N	15281640	510746	6009	20230103	NGN	\N	\N	\N	TR	FT23003RGZ2Q	\N	2023-01-03	1	110	FT23003RGZ2Q\\SBN	FT	20230103	NG0020001?200891271413629.01?1-2?NG0020174?200891271413629.02?1-2	\N	\N	1	12714_ATM.USR__OFS_ATM	1672513629.0520	12714_ATM.USR	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6009.510746.4800.4806.NG.2...CUR...FEMALE.NG0020174	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	79920543	\N	2023-01-03	CURBALANCE	ACCOUNTS-TRANSFERIN-ARRANGEMENT*20230103*NG0020174*AA2032557DCM**DIRECT*AAACT230034M7Z7M13	\N	1	0	\N	\N	2023-01-04 00:00:00.000	2023-01-04 00:00:00.000	NG0020001	2023-01-03	2022-12-31 19:07:09.000	\N	draft	\N	\N
17	201497052887065.020001	10476210	NG0020022	-100000.00	866	\N	NIBSS INSTANT PAYMENT TSS?OneBank Transfer from FOLORUNSO MIC?HAEL AGBOOLA to AKANNI AGBOOLA MOSE?S(fencecwirk)	\N	6609872	500269	6001	20230301	NGN	\N	\N	\N	TR	FT23060JG0VT	\N	2023-03-01	1	110	FT23060JG0VT\\SBN	FT	20230301	NG0020001?201497052887065.01?1-2?NG0020022?201497052887065.02?1-2	\N	\N	1	70528_NIPINUSER__OFS_GCS	1677687065.0432	70528_NIPINUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6001.500426.4800.4806.NG.2...CUR...MALE.NG0020022	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	10476210	\N	2023-03-01	CURBALANCE	ACCOUNTS-ATMDRAW-ARRANGEMENT*20230301*NG0020022*AA161172YVHB**DIRECT*AAACT23060TMPBC91S	\N	1	0	\N	\N	2023-03-02 00:00:00.000	2023-03-02 00:00:00.000	NG0020001	2023-03-01	2023-03-01 16:11:05.000	\N	draft	\N	\N
20	200938682441058.020001	29848796	NG0020131	-6000.00	866	\N	NIBSS INSTANT PAYMENT TSS?Trf 6000.00 frm JONATHAN BARNABAS t?o SUNDAY PATRICK ILOBA	\N	1204067	555	6001	20230104	NGN	\N	\N	\N	TR	FT23004WX3P8	\N	2023-01-04	1	110	FT23004WX3P8\\SBN	FT	20230104	NG0020001?200938682441058.01?1-2?NG0020131?200938682441058.02?1-2	\N	\N	1	86824_NIPINUSER__OFS_GCS	1672841058.0459	86824_NIPINUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6001.509632.4800.4806.NG.2...CUR...MALE.NG0020131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	29848796	\N	2023-01-04	CURBALANCE	ACCOUNTS-ATMDRAW-ARRANGEMENT*20230104*NG0020131*AA161179Z0MD**DIRECT*AAACT230040K98H8QN	\N	1	0	\N	\N	2023-01-05 00:00:00.000	2023-01-05 00:00:00.000	NG0020001	2023-01-04	2023-01-04 14:04:18.000	\N	draft	\N	\N
21	200923662072466.020001	29848796	NG0020131	-6.98	866	\N	MTN TELCO CHARGE ACCOUNT?MTN USSD charge for 03 01 2023	\N	1204067	555	6001	20230104	NGN	\N	\N	\N	TR	FT23004XF395	\N	2023-01-04	1	110	FT23004XF395\\SBN	FT	20230104	NG0020001?200923662072466.01?1-2?NG0020131?200923662072466.02?1-2	\N	\N	1	36620_NIPINUSER__OFS_GCS	1672772466.0621	36620_NIPINUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6001.509632.4800.4806.NG.2...CUR...MALE.NG0020131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	29848796	\N	2023-01-04	CURBALANCE	ACCOUNTS-ATMDRAW-ARRANGEMENT*20230104*NG0020131*AA161179Z0MD**DIRECT*AAACT23004F9MDR923	\N	1	0	\N	\N	2023-01-05 00:00:00.000	2023-01-05 00:00:00.000	NG0020001	2023-01-04	2023-01-03 19:01:06.000	\N	draft	\N	\N
57	201472833226442.000001	8523591	NG0020005	5.08	831	AA16117H1C56	Credit Interest??CAPITALISE?	\N	248181	512004	6001	20230224	NGN	\N	\N	\N	TR	0008523591	\N	2023-02-24	1	\N	AAACT23058B9798JF9	AAAA	20230227	201472833226442.00?1-2?1-2	\N	\N	1	69187_OFSUSER__OFS_AA.COB	1677526442.0415	69187_OFSUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6001.512004.4800.4803.NG.2...CUR...FEMALE.NG0020005	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	CLDEFAULT	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-27	CURBALANCE	\N	\N	1	0	\N	\N	2023-02-28 00:00:00.000	2023-02-28 00:00:00.000	NG0020001	2023-02-27	2023-02-27 19:34:02.000	\N	done	43	27-SEP-2023 04:32:58.732983 PM
59	200961035607972.020001	29848796	NG0020131	-100.00	866	\N	CLICATELL ACCOUNT?PRN 94401521 GORC CLIC VTUP MTNN MT?NZERO	\N	1204067	555	6001	20230109	NGN	\N	\N	\N	TR	FT230098988Y	\N	2023-01-09	1	110	FT230098988Y\\SBN	FT	20230109	NG0020001?200961035607972.01?1-2?NG0020131?200961035607972.02?1-2	\N	\N	1	10356_VTUUSER__OFS_GCS	1673107972.0887	10356_VTUUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6001.509632.4800.4806.NG.2...CUR...MALE.NG0020131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	29848796	\N	2023-01-09	CURBALANCE	ACCOUNTS-ATMDRAW-ARRANGEMENT*20230109*NG0020131*AA161179Z0MD**DIRECT*AAACT230093RP9XDPF	\N	1	0	\N	\N	2023-01-10 00:00:00.000	2023-01-10 00:00:00.000	NG0020001	2023-01-09	2023-01-07 16:12:52.000	\N	draft	\N	\N
61	201098260525791.020001	29848796	NG0020131	-10000.00	866	\N	NIBSS INSTANT PAYMENT TSS?Trf 10000.00 frm JONATHAN BARNABAS?to LENGKAT YAKUBU	\N	1204067	555	6001	20230120	NGN	\N	\N	\N	TR	FT23020YRCHC	\N	2023-01-20	1	110	FT23020YRCHC\\SBN	FT	20230120	NG0020001?201098260525791.01?1-2?NG0020131?201098260525791.02?1-2	\N	\N	1	82605_NIPINUSER__OFS_GCS	1674225792.0021	82605_NIPINUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6001.509632.4800.4806.NG.2...CUR...MALE.NG0020131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	29848796	\N	2023-01-20	CURBALANCE	ACCOUNTS-ATMDRAW-ARRANGEMENT*20230120*NG0020131*AA161179Z0MD**DIRECT*AAACT23020Z0RJZHVB	\N	1	0	\N	\N	2023-01-23 00:00:00.000	2023-01-21 00:00:00.000	NG0020001	2023-01-20	2023-01-20 14:43:12.000	\N	done	43	05-OCT-2023 12:07:49.122993 PM
60	201014299708824.020001	89409843	NG0020118	-3000.00	866	\N	NIBSS INSTANT PAYMENT TSS?Trf 3000.00 frm HASSAN AHMED to JOL?AYEMI KAZEEM OLAYEMI	\N	15875498	777	6009	20230112	NGN	\N	\N	\N	TR	FT2301266JQD	\N	2023-01-12	1	110	FT2301266JQD\\SBN	FT	20230112	NG0020001?201014299708824.01?1-2?NG0020118?201014299708824.02?1-2	\N	\N	1	42997_NIPINUSER__OFS_GCS	1673508824.0999	42997_NIPINUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6009.500697.4800.4806.NG.1...CUR...MALE.NG0020118	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	89409843	\N	2023-01-12	CURBALANCE	ACCOUNTS-ATMDRAW-ARRANGEMENT*20230112*NG0020118*AA22175MHZ0H**DIRECT*AAACT23012HMGMT11J	\N	1	0	\N	\N	2023-01-13 00:00:00.000	2023-01-13 00:00:00.000	NG0020001	2023-01-12	2023-01-12 07:33:44.000	\N	done	43	05-OCT-2023 12:07:49.157263 PM
18	200996180369916.020001	89409843	NG0020118	-4000.00	866	\N	NIBSS INSTANT PAYMENT TSS?Trf 4000.00 frm HASSAN AHMED to ABD?ULMALIK MUHAMMAD	\N	15875498	777	6009	20230110	NGN	\N	\N	\N	TR	FT23010CYF4M	\N	2023-01-10	1	110	FT23010CYF4M\\SBN	FT	20230110	NG0020001?200996180369916.01?1-2?NG0020118?200996180369916.02?1-2	\N	\N	1	61803_NIPINUSER__OFS_GCS	1673369916.0272	61803_NIPINUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6009.500697.4800.4806.NG.1...CUR...MALE.NG0020118	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	89409843	\N	2023-01-10	CURBALANCE	ACCOUNTS-ATMDRAW-ARRANGEMENT*20230110*NG0020118*AA22175MHZ0H**DIRECT*AAACT23010QGCP3VPD	\N	1	0	\N	\N	2023-01-11 00:00:00.000	2023-01-11 00:00:00.000	NG0020001	2023-01-10	2023-01-10 16:58:36.000	\N	done	43	05-OCT-2023 12:08:11.390939 PM
58	201472197626100.000001	25132200	NG0020015	0.48	831	AA16117Y80Y1	Credit Interest??CAPITALISE?	\N	877977	555	6009	20230224	NGN	\N	\N	\N	TR	0025132200	\N	2023-02-24	1	\N	AAACT230587ZM5P3RD	AAAA	20230227	201472197626100.00?1-2?1-2	\N	\N	1	69107_OFSUSER__OFS_AA.COB	1677526100.0695	69107_OFSUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6009.555.4800.4803.NG.2...CUR...MALE.NG0020015	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	CLDEFAULT	\N	\N	\N	\N	\N	\N	\N	\N	2023-02-27	CURBALANCE	\N	\N	1	0	\N	\N	2023-02-28 00:00:00.000	2023-02-28 00:00:00.000	NG0020001	2023-02-27	2023-02-27 19:28:20.000	\N	done	43	27-SEP-2023 04:32:58.692243 PM
24	201087623559482.020001	29848796	NG0020131	10000.00	258	\N	BANK?NIP From 10000423011920164710232185?0288 Paycom PAYREF:1000042301192016?47102321850288 SENDER: Nurudeen Top?e Tiamiyu REMARK: Transfer from	\N	1204067	509632	6001	20230120	NGN	\N	\N	\N	TR	FT230202TDD5	\N	2023-01-20	1	110	FT230202TDD5\\SBN	FT	20230120	NG0020001?201087623559482.01?1-2?NG0020131?201087623559482.02?1-2	\N	\N	1	76235_NIPINUSER__OFS_GCS	1674159482.0292	76235_NIPINUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6001.509632.4800.4806.NG.2...CUR...MALE.NG0020131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	29848796	\N	2023-01-20	CURBALANCE	ACCOUNTS-TRANSFERIN-ARRANGEMENT*20230120*NG0020131*AA161179Z0MD**DIRECT*AAACT23020WPZNGY09	\N	1	0	\N	\N	2023-01-23 00:00:00.000	2023-01-21 00:00:00.000	NG0020001	2023-01-20	2023-01-19 20:18:02.000	\N	done	43	27-SEP-2023 04:32:58.759518 PM
19	201192734990088.020001	26214303	NG0020076	1600.00	258	\N	BANK?NIP From 00001623013015463300008847?7883 First Bank of Nigeria PAYREF:1?01300008870703728 SENDER: NJOKU EKE?NEDIRICHUKWU C. REMARK: USSD NJ	\N	958863	509499	6001	20230130	NGN	\N	\N	\N	TR	FT23030CJ5CC	\N	2023-01-30	1	110	FT23030CJ5CC\\SBN	FT	20230130	NG0020001?201192734990088.01?1-2?NG0020076?201192734990088.02?1-2	\N	\N	1	27349_NIPINUSER__OFS_GCS	1675090088.0902	27349_NIPINUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6001.509499.4800.4803.NG.1...CUR...FEMALE.NG0020076	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	26214303	\N	2023-01-30	CURBALANCE	ACCOUNTS-TRANSFERIN-ARRANGEMENT*20230130*NG0020076*AA16117JQBNN**DIRECT*AAACT230309Y553R6Z	\N	1	0	\N	\N	2023-01-31 00:00:00.000	2023-01-31 00:00:00.000	NG0020001	2023-01-30	2023-01-30 14:48:08.000	\N	done	43	27-SEP-2023 04:28:01.700749 PM
62	201479292103402.010001	29848796	NG0020131	10000.00	866	\N	NIBSS INSTANT PAYMENT TSS?Trf 10000.00 frm JONATHAN BARNABAS?to ELIZABETH QUEEN SULE	\N	1204067	555	6001	20230227	NGN	\N	\N	\N	TR	FT23058YK817	R	2023-02-27	1	110	FT23058YK817\\SBN	FT	20230227	NG0020001?201479292103402.00?1-2?NG0020131?201479292103402.01?1-2???	\N	REVE	1	92921_VTELLUSER__OFS_GCS	1677503402.0326	92921_VTELLUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6001.509632.4800.4806.NG.2...CUR...MALE.NG0020131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	SYSTEM	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	29848796	\N	2023-02-27	CURBALANCE	ACCOUNTS-ATMDRAW-ARRANGEMENT*20230227*NG0020131*AA161179Z0MD**DIRECT*AAACT2305819S8K7TM	\N	1	0	\N	\N	2023-02-28 00:00:00.000	2023-02-28 00:00:00.000	NG0020001	2023-02-27	2023-02-27 13:10:02.000	\N	done	43	27-SEP-2023 04:32:30.411266 PM
63	201096067425618.020001	29848796	NG0020131	-20000.00	866	\N	NIBSS INSTANT PAYMENT TSS?Trf 20000.00 frm JONATHAN BARNABAS?to LENGKAT YAKUBU	\N	1204067	555	6001	20230120	NGN	\N	\N	\N	TR	FT23020CNW6D	\N	2023-01-20	1	110	FT23020CNW6D\\SBN	FT	20230120	NG0020001?201096067425618.01?1-2?NG0020131?201096067425618.02?1-2	\N	\N	1	60674_NIPINUSER__OFS_GCS	1674225618.0742	60674_NIPINUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6001.509632.4800.4806.NG.2...CUR...MALE.NG0020131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	29848796	\N	2023-01-20	CURBALANCE	ACCOUNTS-ATMDRAW-ARRANGEMENT*20230120*NG0020131*AA161179Z0MD**DIRECT*AAACT23020Q1N5CN47	\N	1	0	\N	\N	2023-01-23 00:00:00.000	2023-01-21 00:00:00.000	NG0020001	2023-01-20	2023-01-20 14:40:18.000	\N	done	43	27-SEP-2023 08:26:52.145929 PM
22	201186784485702.020001	29848796	NG0020131	-100.00	866	\N	CLICATELL ACCOUNT?PRN 95633842 GORC CLIC VTUP MTNN MT?NZERO	\N	1204067	555	6001	20230130	NGN	\N	\N	\N	TR	FT23030BSQ5N	\N	2023-01-30	1	110	FT23030BSQ5N\\SBN	FT	20230130	NG0020001?201186784485702.01?1-2?NG0020131?201186784485702.02?1-2	\N	\N	1	67844_VTUUSER__OFS_GCS	1674985702.0895	67844_VTUUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6001.509632.4800.4806.NG.2...CUR...MALE.NG0020131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	29848796	\N	2023-01-30	CURBALANCE	ACCOUNTS-ATMDRAW-ARRANGEMENT*20230130*NG0020131*AA161179Z0MD**DIRECT*AAACT23030SNFTJGVD	\N	1	0	\N	\N	2023-01-31 00:00:00.000	2023-01-31 00:00:00.000	NG0020001	2023-01-30	2023-01-29 09:48:22.000	\N	done	43	27-SEP-2023 10:24:12.158037 PM
16	201096836182090.020001	29848796	NG0020131	-0.75	201	\N	VALUE ADDED TAX?NIPVAT/Trf 1000.00 frm JONATHAN BAR?NABAS to EMMANUELLA NANDI BARNAAS	\N	1204067	555	6001	20230120	NGN	\N	\N	\N	TR	FT23020V3S4W	\N	2023-01-20	1	110	FT23020V3S4W\\SBN	FT	20230120	NG0020001?201096836182090.01?1-2?NG0020131?201096836182090.02?1-2	\N	\N	1	68361_NIPINUSER__OFS_GCS	1674182090.0290	68361_NIPINUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6001.509632.4800.4806.NG.2...CUR...MALE.NG0020131	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	29848796	\N	2023-01-20	CURBALANCE	ACCOUNTS-DEBITFEE-ARRANGEMENT*20230120*NG0020131*AA161179Z0MD**DIRECT*AAACT23020SV8D8PPB	\N	1	0	\N	\N	2023-01-23 00:00:00.000	2023-01-21 00:00:00.000	NG0020001	2023-01-20	2023-01-20 02:34:50.000	\N	done	43	28-SEP-2023 01:02:04.911951 PM
6	200995771767662.020001	89409843	NG0020118	-200.00	866	\N	CLICATELL ACCOUNT?PRN 94571857 GORC CLIC VTUP MTNN MT?NZERO	\N	15875498	777	6009	20230110	NGN	\N	\N	\N	TR	FT23010BV18R	\N	2023-01-10	1	110	FT23010BV18R\\SBN	FT	20230110	NG0020001?200995771767662.01?1-2?NG0020118?200995771767662.02?1-2	\N	\N	1	57717_VTUUSER__OFS_GCS	1673367662.0350	57717_VTUUSER	\N	\N	\N	CREDIT	\N	\N	AC.1.TR.NGN.6009.500697.4800.4806.NG.1...CUR...MALE.NG0020118	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	89409843	\N	2023-01-10	CURBALANCE	ACCOUNTS-ATMDRAW-ARRANGEMENT*20230110*NG0020118*AA22175MHZ0H**DIRECT*AAACT23010NZBG53Y9	\N	1	0	\N	\N	2023-01-11 00:00:00.000	2023-01-11 00:00:00.000	NG0020001	2023-01-10	2023-01-10 16:21:02.000	\N	done	43	05-OCT-2023 12:13:05.666678 PM
\.


--
-- Data for Name: staffs; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.staffs (id, staff_name, department, email, dept_email, staff_id, user_id, os_user) FROM stdin;
4829	JONATHAN	BUSINESS DEVELOPMENT	jonathan.o@novajii.com	\N	jonathan.o@novajii.com	\N	\N
4831	Chief Compliance Officer	BUSINESS DEVELOPMENT	chizo.o@novajii.com	\N	chizo.o@novajii.com	\N	\N
4832	JOY	BUSINESS DEVELOPMENT	kutesayo.j@novajii.com	\N	kutesayo.j@novajii.com	\N	\N
4833	TOBI	BUSINESS DEVELOPMENT	oluwatobi.obademi@sterling.ng	\N	oluwatobi.obademi@sterling.ng	101	oracle
4834	VICTOR	BUSINESS DEVELOPMENT	victor.i@novajii.com	\N	victor.i@novajii.com	\N	\N
4835	FAVOUR EFAM	BUSINESS DEVELOPMENT	favour.e@novajii.com	\N	favour.e@novajii.com	81	\N
4836	HANSON	BUSINESS DEVELOPMENT	hanson.e@novajii.com	\N	hanson.e@novajii.com	11	oracle1
4837	DAMARIS	OPERATIONS	chiamaka.c@novajii.com	\N	chiamaka.c@novajii.com	182	oracle
5509	CHARLES	BUSINESS DEVELOPMENT	charles.e@novajii.com	\N	charles.e@novajii.com	202	oracle
5277	NOVAJI INTROSERVE	COMPLIANCE	tech-support@novajii.com	\N	tech-support@novajii.com	43	oracle
4830	OPERATIONS	BUSINESS DEVELOPMENT	operations@novajii.com		operations@novajii.com		oracle
5469	Augustine Ejira	BUSINESS DEVELOPMENT	uche.l@novajii.com	\N	augustine.e@novajii.com	223	\N
3	Obi just	hanson@gmail.com	Compliance		2		orcale
\.


--
-- Data for Name: str_transactions; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.str_transactions (id, t_account_number, t_trans_number, t_location, transaction_description, t_teller, t_authorized, t_late_deposit, t_transmode_code, t_amount_local, t_source_client_type, t_source_type, t_source_funds_code, t_source_currency_code, t_source_foreign_amount, t_source_exchange_rate, t_source_country, t_source_institution_code, t_source_institution_name, t_source_account_number, t_source_account_name, t_source_person_first_name, t_source_person_last_name, t_source_entity_name, t_dest_client_type, t_dest_type, t_dest_funds_code, t_dest_currency_code, t_dest_foreign_amount, t_dest_exchange_rate, t_dest_country, t_dest_institution_code, t_dest_institution_name, t_dest_account_number, t_dest_account_name, t_dest_person_first_name, t_dest_person_last_name, t_dest_entity_name, tran_type, created_at, t_date_posting, t_value_date, t_date, t_client_number, t_gender, t_title, t_firstname, t_lastname, t_dob, t_phone, t_address, t_city, t_state, t_idnumber, t_idregdate, t_taxno, t_taxregdate, t_acctopndate, t_balance, row_ref, status, rule_id, reviewer, download_link, updated_at, encrypted_query) FROM stdin;
68189	1036030001	603101	KOFAR WAMBAI BRANCH	NIP FRM YAHAYA MOHAMMED  SANI MOBDK MULT	SYSTEM	SYSTEM	0	A	5000000	\N	\N	L	NGN	5000000	1	NG	12	KOFAR WAMBAI BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	5000000	1	NG	12	StanbicIBTC Bank	3195090	DK MULTI GLOBAL SERVICES LTD	\N	\N	\N	OTHERS	30-AUG-22 04.48.15.976526000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	DK MULTI GLOBAL SERVICES LTD	01-JAN-70 12.00.00.000000000 AM	8038659310	NO 162 LAYIN LABUN KAWA GAIDA  ZAWA CIKI GIDA                 KUMBOTSO LGA	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	23933725-0001	23933725-0001	25-JUL-22 12.00.00.000000000 AM	7130684.25	AAnpyKAAVAAAnbAAAB	\N	\N	\N	\N	\N	\N
68190	2518973	278544	KANO MM WAY BRANCH	NIP Online   WEB APP  Yahaya  Trf to FCM	SYSTEM	SYSTEM	0	A	10105155	\N	\N	L	NGN	10105155	1	NG	3	KANO MM WAY BRANCH	2518973	SANI MANAGGE AGRO ALLIED	\N	\N	\N	\N	\N	L	NGN	10105155	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.17.168431000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	SANI MANAGGE AGRO ALLIED	01-JAN-70 12.00.00.000000000 AM	8062402782	NO 315                         SANI MAINAGGE STREET	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	2501407-0001	2501407-0001	25-MAR-22 12.00.00.000000000 AM	1885.97	AAnpyKAAUAAF0F4AAA	\N	\N	\N	\N	\N	\N
68191	3179867	352551	HEAD OFFICE	NIP 15k   INTER BANK TRANSFER	SYSTEM	SYSTEM	0	A	10530000	\N	\N	L	NGN	10530000	1	NG	1	HEAD OFFICE	3179867	AL-FARIS GLOBAL ENTERPRISE	\N	\N	\N	\N	\N	L	NGN	10530000	1	NG	1	Sterling Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.18.794020000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	AL-FARIS GLOBAL ENTERPRISE	01-JAN-70 12.00.00.000000000 AM	8118078597	PLOT 1438 FLAT 2               DAKI BIYU AIRPORT ROAD         JABI	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	25300638-0001	25300638-0001	22-JUL-22 12.00.00.000000000 AM	3780127.25	AAnpyKAATAAASMzAAC	\N	\N	\N	\N	\N	\N
68192	1826071	403982	HEAD OFFICE	NIP Online   WEB APP  Boo Farmzone Afric	SYSTEM	SYSTEM	0	A	6513471	\N	\N	L	NGN	6513471	1	NG	1	HEAD OFFICE	1826071	FARM-ZONE AFRICA INTEGRATED SERVICES	\N	\N	\N	\N	\N	L	NGN	6513471	1	NG	1	Sterling Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.19.651814000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	FARM-ZONE AFRICA INTEGRATED SERVICES	01-JAN-70 12.00.00.000000000 AM	7035505284	NO 19C                         ICHIE MIKE STREET LEKKI        PHASE 1	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	23694291-0001	23694291-0001	08-NOV-21 12.00.00.000000000 AM	59492.28	AAnpyKAASAAAn8SAAB	\N	\N	\N	\N	\N	\N
68193	1360168	045725	SOKOTO BRANCH	NIP Online   WEB APP  ZAYShfa  Trf to JA	SYSTEM	SYSTEM	0	A	100000000	\N	\N	L	NGN	100000000	1	NG	6	SOKOTO BRANCH	1360168	AL-ADYAS GLOBAL RESOURCES LIMITED	\N	\N	\N	\N	\N	L	NGN	100000000	1	NG	6	JAIZ Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.20.290771000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	AL-ADYAS GLOBAL RESOURCES LIMITED	01-JAN-70 12.00.00.000000000 AM	8060606080	RSQ14                          A Y M PLAZA KOFAR ATIKU ROAD   AREA SOKOTO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	1015007154	1015007154	19-MAY-21 12.00.00.000000000 AM	4813068.36	AAnpyKAASAAAn8hAAA	\N	\N	\N	\N	\N	\N
68194	1826071	403984	HEAD OFFICE	NIP Online   WEB APP  Trf to Providus Ba	SYSTEM	SYSTEM	0	A	26000000	\N	\N	L	NGN	26000000	1	NG	1	HEAD OFFICE	1826071	FARM-ZONE AFRICA INTEGRATED SERVICES	\N	\N	\N	\N	\N	L	NGN	26000000	1	NG	1	Sterling Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.21.155887000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	FARM-ZONE AFRICA INTEGRATED SERVICES	01-JAN-70 12.00.00.000000000 AM	7035505284	NO 19C                         ICHIE MIKE STREET LEKKI        PHASE 1	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	23694291-0001	23694291-0001	08-NOV-21 12.00.00.000000000 AM	59492.28	AAnpyKAASAAAn9CAAC	\N	\N	\N	\N	\N	\N
68195	1826071	403986	HEAD OFFICE	NIP Online   WEB APP  Trf to Providus Ba	SYSTEM	SYSTEM	0	A	26000001	\N	\N	L	NGN	26000001	1	NG	1	HEAD OFFICE	1826071	FARM-ZONE AFRICA INTEGRATED SERVICES	\N	\N	\N	\N	\N	L	NGN	26000001	1	NG	1	Sterling Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.22.033083000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	FARM-ZONE AFRICA INTEGRATED SERVICES	01-JAN-70 12.00.00.000000000 AM	7035505284	NO 19C                         ICHIE MIKE STREET LEKKI        PHASE 1	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	23694291-0001	23694291-0001	08-NOV-21 12.00.00.000000000 AM	59492.28	AAnpyKAASAAAn9GAAB	\N	\N	\N	\N	\N	\N
68196	1826071	403988	HEAD OFFICE	NIP Online   WEB APP  Agent pay   aggreg	SYSTEM	SYSTEM	0	A	7468300	\N	\N	L	NGN	7468300	1	NG	1	HEAD OFFICE	1826071	FARM-ZONE AFRICA INTEGRATED SERVICES	\N	\N	\N	\N	\N	L	NGN	7468300	1	NG	1	Sterling Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.22.970087000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	FARM-ZONE AFRICA INTEGRATED SERVICES	01-JAN-70 12.00.00.000000000 AM	7035505284	NO 19C                         ICHIE MIKE STREET LEKKI        PHASE 1	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	23694291-0001	23694291-0001	08-NOV-21 12.00.00.000000000 AM	59492.28	AAnpyKAASAAAn9WAAB	\N	\N	\N	\N	\N	\N
68197	2459968	067491	HEAD OFFICE	Alh murtala zuru	SYSTEM	SYSTEM	0	A	5000000	\N	\N	L	NGN	5000000	1	NG	1	HEAD OFFICE	2459968	MURTALA MUHAMMED	\N	\N	\N	\N	\N	L	NGN	5000000	1	NG	1	Sterling Bank	2508048	SALISU MUHAMMAD	\N	\N	\N	OTHERS	30-AUG-22 04.48.24.114580000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	M	MR	MURTALA	MUHAMMED	25-JUL-79 12.00.00.000000000 AM	7030858684	22 BAWO ROAD KANO STATE        KANO                           KANO	KEBBI	KEBBI	A09944577	19-NOV-18 12.00.00.000000000 AM	\N	\N	18-MAR-22 12.00.00.000000000 AM	4415.62	AAnpyKAARAAAqK2AAC	\N	\N	\N	\N	\N	\N
68198	1036030001	603154	KOFAR WAMBAI BRANCH	NIP FRM IBRAHIM AMINU GALADANCI FBNMOBIL	SYSTEM	SYSTEM	0	A	7000000	\N	\N	L	NGN	7000000	1	NG	12	KOFAR WAMBAI BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	7000000	1	NG	12	StanbicIBTC Bank	2737684	BABA DUDU AGRO VENTUERS	\N	\N	\N	OTHERS	30-AUG-22 04.48.25.491380000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	BABA DUDU AGRO VENTUERS	01-JAN-70 12.00.00.000000000 AM	8065427424	168 U/GABAS HOTORO OFF         COL DAUDA STREET               NASSARAWA LGA	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24751288-001	24751288-001	05-MAY-22 12.00.00.000000000 AM	6293786.01	AAnpyKAARAAAqLiAAA	\N	\N	\N	\N	\N	\N
68181	1036030001	306081	KANO MM WAY BRANCH	NIP FRM LAWAN  GARBA TRFTrFRM LAWAN  GAR	SYSTEM	SYSTEM	0	A	5000000	\N	\N	L	NGN	5000000	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	5000000	1	NG	3	FCMB	1313841	AUDIDIAMOND GLOBAL AGENCY LTD	\N	\N	\N	OTHERS	30-AUG-22 04.48.07.803095000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	AUDIDIAMOND GLOBAL AGENCY LTD	01-JAN-70 12.00.00.000000000 AM	8094101975	C 47 SHARADA JUMMA MOSQUE BY   BUK ROAD KANO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	23825845-0001	23825845-0001	20-APR-21 12.00.00.000000000 AM	5006446.23	AAnpyKAAYAAAmrRAAC	\N	\N	\N	\N	\N	\N
68182	1036030001	306062	KANO MM WAY BRANCH	NIP FRM MABAB INTERNATIONAL LIMITED web	SYSTEM	SYSTEM	0	A	10000000	\N	\N	L	NGN	10000000	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	10000000	1	NG	3	FCMB	37603	MABAB PROPERTY LIMITED	\N	\N	\N	OTHERS	30-AUG-22 04.48.08.292568000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	MABAB PROPERTY LIMITED	01-JAN-70 12.00.00.000000000 AM	9099968999	NO 1 HOSPITAL ROAD, NASSARAWA  G.R.A. DANBATA HOUSE AUDU BAKO WAY. KANO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	22352143-0001	22352143-0001	06-FEB-20 12.00.00.000000000 AM	10686.1	AAnpyKAAYAAAmrjAAD	\N	\N	\N	\N	\N	\N
68183	1036030001	306127	KANO MM WAY BRANCH	NIP FRM MABAB INTERNATIONAL LIMITED web	SYSTEM	SYSTEM	0	A	10000000	\N	\N	L	NGN	10000000	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	10000000	1	NG	3	FCMB	37603	MABAB PROPERTY LIMITED	\N	\N	\N	OTHERS	30-AUG-22 04.48.08.762416000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	MABAB PROPERTY LIMITED	01-JAN-70 12.00.00.000000000 AM	9099968999	NO 1 HOSPITAL ROAD, NASSARAWA  G.R.A. DANBATA HOUSE AUDU BAKO WAY. KANO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	22352143-0001	22352143-0001	06-FEB-20 12.00.00.000000000 AM	10686.1	AAnpyKAAYAAAmr3AAC	\N	\N	\N	\N	\N	\N
68184	2518973	278536	KANO MM WAY BRANCH	NIP Online   WEB APP  Yahaya  Trf to FCM	SYSTEM	SYSTEM	0	A	5036400	\N	\N	L	NGN	5036400	1	NG	3	KANO MM WAY BRANCH	2518973	SANI MANAGGE AGRO ALLIED	\N	\N	\N	\N	\N	L	NGN	5036400	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.10.252700000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	SANI MANAGGE AGRO ALLIED	01-JAN-70 12.00.00.000000000 AM	8062402782	NO 315                         SANI MAINAGGE STREET	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	2501407-0001	2501407-0001	25-MAR-22 12.00.00.000000000 AM	1885.97	AAnpyKAAXAAAqwzAAA	\N	\N	\N	\N	\N	\N
68185	3179867	352526	HEAD OFFICE	okok   LOCAL TRANSFER	SYSTEM	SYSTEM	0	A	10230000	\N	\N	L	NGN	10230000	1	NG	1	HEAD OFFICE	3179867	AL-FARIS GLOBAL ENTERPRISE	\N	\N	\N	\N	\N	L	NGN	10230000	1	NG	1	Sterling Bank	3196640	INNOBASH INTEGRATED VENTURES	\N	\N	\N	OTHERS	30-AUG-22 04.48.12.173094000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	AL-FARIS GLOBAL ENTERPRISE	01-JAN-70 12.00.00.000000000 AM	8118078597	PLOT 1438 FLAT 2               DAKI BIYU AIRPORT ROAD         JABI	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	25300638-0001	25300638-0001	22-JUL-22 12.00.00.000000000 AM	3780127.25	AAnpyKAAXAAAqw9AAB	\N	\N	\N	\N	\N	\N
68186	864322	403973	HEAD OFFICE	NIP Online   WEB APP  Paynebt  Trf to JA	SYSTEM	SYSTEM	0	A	10230000	\N	\N	L	NGN	10230000	1	NG	1	HEAD OFFICE	864322	LAKECITY CONSULT LIMITED	\N	\N	\N	\N	\N	L	NGN	10230000	1	NG	1	Sterling Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.12.644911000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	LAKECITY CONSULT LIMITED	01-JAN-70 12.00.00.000000000 AM	8099873606	NO 11                          DURBAN STREET                  WUSE 2	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	10522606-0001	10522606-0001	11-NOV-20 12.00.00.000000000 AM	170761783.65	AAnpyKAAXAAAqxWAAB	\N	\N	\N	\N	\N	\N
68187	1036030001	306185	KANO MM WAY BRANCH	NIP FRM MABAB INTERNATIONAL LIMITED web	SYSTEM	SYSTEM	0	A	9999200	\N	\N	L	NGN	9999200	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	9999200	1	NG	3	FCMB	37603	MABAB PROPERTY LIMITED	\N	\N	\N	OTHERS	30-AUG-22 04.48.13.015012000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	MABAB PROPERTY LIMITED	01-JAN-70 12.00.00.000000000 AM	9099968999	NO 1 HOSPITAL ROAD, NASSARAWA  G.R.A. DANBATA HOUSE AUDU BAKO WAY. KANO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	22352143-0001	22352143-0001	06-FEB-20 12.00.00.000000000 AM	10686.1	AAnpyKAAXAAAqx4AAC	\N	\N	\N	\N	\N	\N
68188	2518973	278532	KANO MM WAY BRANCH	NIP Online   WEB APP  Yahaya  Trf to Pro	SYSTEM	SYSTEM	0	A	12250983	\N	\N	L	NGN	12250983	1	NG	3	KANO MM WAY BRANCH	2518973	SANI MANAGGE AGRO ALLIED	\N	\N	\N	\N	\N	L	NGN	12250983	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.14.382961000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	SANI MANAGGE AGRO ALLIED	01-JAN-70 12.00.00.000000000 AM	8062402782	NO 315                         SANI MAINAGGE STREET	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	2501407-0001	2501407-0001	25-MAR-22 12.00.00.000000000 AM	1885.97	AAnpyKAAWAAAkznAAA	\N	\N	\N	\N	\N	\N
68207	1036030001	603250	KOFAR WAMBAI BRANCH	NIP FRM KABARA SHEHU MALAM REF3012033880	SYSTEM	SYSTEM	0	A	5000000	\N	\N	L	NGN	5000000	1	NG	12	KOFAR WAMBAI BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	5000000	1	NG	12	StanbicIBTC Bank	2756399	GLOBAL FORTUNE ASSOCIATES NIG LTD	\N	\N	\N	OTHERS	30-AUG-22 04.48.36.376651000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	GLOBAL FORTUNE ASSOCIATES NIG LTD	01-JAN-70 12.00.00.000000000 AM	8030426080	NO 390 KABARA HOUSE            KMC                            KANO MUNICIPAL LGA	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	1018869576	1018869576	10-MAY-22 12.00.00.000000000 AM	5244814.6	AAnpyKAAJAAHC4RAAC	\N	\N	\N	\N	\N	\N
68199	1812069	083791	MAIDUGURI  BRANCH	000026220830000248000021350766	SYSTEM	SYSTEM	0	A	44500000	\N	\N	L	NGN	44500000	1	NG	9	MAIDUGURI  BRANCH	1812069	SHEHU A GONI GENERAL ENTERPRISES	\N	\N	\N	\N	\N	L	NGN	44500000	1	NG	9	Citi Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.26.408911000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	SHEHU A GONI GENERAL ENTERPRISES	01-JAN-70 12.00.00.000000000 AM	7039391098	NO 41                          MONDAY                         MARKET	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	22857850-0001	22857850-0001	01-NOV-21 12.00.00.000000000 AM	59997.86	AAnpyKAAQAAAqKKAAA	\N	\N	\N	\N	\N	\N
68200	3234630	111863	SOKOTO BRANCH	NIP transfer	SYSTEM	SYSTEM	0	A	7000000	\N	\N	L	NGN	7000000	1	NG	6	SOKOTO BRANCH	3234630	LAWALI MUAZU	\N	\N	\N	\N	\N	L	NGN	7000000	1	NG	6	JAIZ Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.28.414596000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	M	COMR	LAWALI	MUAZU	17-JUN-86 12.00.00.000000000 AM	8038032394	NO 15 AFTER KABIRU             BIGI HOUSE ARKILLA             LIMAN AREA	BIRNIN KEBBI	KEBBI	10797485523	12-JUN-19 12.00.00.000000000 AM	\N	\N	03-AUG-22 12.00.00.000000000 AM	3646.6	AAnpyKAAQAAAqKRAAB	\N	\N	\N	\N	\N	\N
68201	1812069	083789	MAIDUGURI  BRANCH	NIP G   INTER BANK TRANSFER	SYSTEM	SYSTEM	0	A	17071750	\N	\N	L	NGN	17071750	1	NG	9	MAIDUGURI  BRANCH	1812069	SHEHU A GONI GENERAL ENTERPRISES	\N	\N	\N	\N	\N	L	NGN	17071750	1	NG	9	Citi Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.29.416569000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	SHEHU A GONI GENERAL ENTERPRISES	01-JAN-70 12.00.00.000000000 AM	7039391098	NO 41                          MONDAY                         MARKET	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	22857850-0001	22857850-0001	01-NOV-21 12.00.00.000000000 AM	59997.86	AAnpyKAAQAAAqKkAAC	\N	\N	\N	\N	\N	\N
68202	1036030001	468670	MAIDUGURI  BRANCH	NIP FRM SHEHU A GONI GENERAL ENTERPRIS N	SYSTEM	SYSTEM	0	A	17071750	\N	\N	L	NGN	17071750	1	NG	9	MAIDUGURI  BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	17071750	1	NG	9	Citi Bank	1855398	GAJIMI GONI IBRAHIM	\N	\N	\N	OTHERS	30-AUG-22 04.48.30.534572000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	M	MR	GAJIMI	IBRAHIM	02-JUN-82 12.00.00.000000000 AM	8023666313	NO 89                          CUSTOM AREA                    NEAR MAMI MARKET	MAIDUGURI	BORNO	MAD18994AA88	05-JUN-18 12.00.00.000000000 AM	\N	\N	16-NOV-21 12.00.00.000000000 AM	54974011.18	AAnpyKAAQAAAqLtAAB	\N	\N	\N	\N	\N	\N
68203	2903454	391986	KANO MM WAY BRANCH	NIP Abba to gambo fafa   INTER BANK TRAN	SYSTEM	SYSTEM	0	A	17466112	\N	\N	L	NGN	17466112	1	NG	3	KANO MM WAY BRANCH	2903454	ABBAN JAMMEL GENERAL MACHINES	\N	\N	\N	\N	\N	L	NGN	17466112	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.32.053712000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	ABBAN JAMMEL GENERAL MACHINES	01-JAN-70 12.00.00.000000000 AM	8104060678	NO 59 MURTALA MUHAMMAD WAY     FAGGE WAPA KANO STATE          KANO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	22301380-0001	22301380-0001	07-JUN-22 12.00.00.000000000 AM	1707073.62	AAnpyKAAPAAAqHwAAA	\N	\N	\N	\N	\N	\N
68204	1880978	352647	HEAD OFFICE	NIP h	SYSTEM	SYSTEM	0	A	10000000	\N	\N	L	NGN	10000000	1	NG	1	HEAD OFFICE	1880978	IBRAHIM GARANCHI HAMZA	\N	\N	\N	\N	\N	L	NGN	10000000	1	NG	1	Sterling Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.33.034007000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	22657136855	M	MR	IBRAHIM	HAMZA	29-APR-87 12.00.00.000000000 AM	8146666661	NO 34                          KINSHASA STREET                WUSE ZONE 6	GUSAU	ZAMFARA	\N	01-JAN-70 12.00.00.000000000 AM	\N	\N	24-NOV-21 12.00.00.000000000 AM	15665965.09	AAnpyKAAOAAGzO+AAA	\N	\N	\N	\N	\N	\N
68205	1709257	893445	KANO MM WAY BRANCH	NIP Mobile   Afy	SYSTEM	SYSTEM	0	A	5000000	\N	\N	L	NGN	5000000	1	NG	3	KANO MM WAY BRANCH	1709257	YAKUBU MOHAMMED ADAMU	\N	\N	\N	\N	\N	L	NGN	5000000	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.33.815446000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	22482033198	M	MR	YAKUBU	ADAMU	02-FEB-75 12.00.00.000000000 AM	7012222515	GABARI QTRS                    DUTSE JIGAWA                   JIGAWA STATE	HADEJIA	JIGAWA	A11889043	26-JUL-21 12.00.00.000000000 AM	\N	\N	30-SEP-21 12.00.00.000000000 AM	187067.7	AAnpyKAANAAA2IPAAB	\N	\N	\N	\N	\N	\N
68206	2351426	099326	SABON GARI BRANCH	NIP Material    INTER BANK TRANSFER	SYSTEM	SYSTEM	0	A	28000000	\N	\N	L	NGN	28000000	1	NG	11	SABON GARI BRANCH	2351426	HAPPY HOME UNIVERSAL RICE RESOURCES	\N	\N	\N	\N	\N	L	NGN	28000000	1	NG	11	Unity Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.35.025562000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	HAPPY HOME UNIVERSAL RICE RESOURCES	01-JAN-70 12.00.00.000000000 AM	8033550064	N0 30160                       COMMERCIAL AREA                NASSARAWA	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	23981251-0001	23981251-0001	28-FEB-22 12.00.00.000000000 AM	106767868.09	AAnpyKAALAAFkVDAAC	\N	\N	\N	\N	\N	\N
68208	1036030001	632042	HEAD OFFICE	NIP FRM BSIT INTER TRADE App house no 6	SYSTEM	SYSTEM	0	A	10000000	\N	\N	L	NGN	10000000	1	NG	1	HEAD OFFICE	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	10000000	1	NG	1	Sterling Bank	1481320	HAIMBRIDGE LIMITED	\N	\N	\N	OTHERS	30-AUG-22 04.48.37.104068000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	HAIMBRIDGE LIMITED	01-JAN-70 12.00.00.000000000 AM	8133839041	PLOT 288                       ADUVE STYREET                  JAHI DISTRICT	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	19813871-0001	19813871-0001	09-JUL-21 12.00.00.000000000 AM	90752956.23	AAnpyKAAJAAHC58AAA	\N	\N	\N	\N	\N	\N
68209	1963521	403990	HEAD OFFICE	WEB APP     Trf to DEM BANK HIFZULLAH MU	SYSTEM	SYSTEM	0	A	7300000	\N	\N	L	NGN	7300000	1	NG	3	HEAD OFFICE	1963521	HUKUMULLAH M SHARIF ENTERPRISES	\N	\N	\N	\N	\N	L	NGN	7300000	1	NG	1	Sterling Bank	1819611	HIFZULLAH MUNZALI SHARIF	\N	\N	\N	OTHERS	30-AUG-22 04.48.38.053714000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	M	MR	HIFZULLAH	SHARIF	01-JAN-92 12.00.00.000000000 AM	8063305041	NO 396 ISLAMIYYA 5303 D7230    UNGOGO KANO STATE              KANO	KANO	KANO	A10655528	18-JUN-19 12.00.00.000000000 AM	\N	\N	05-NOV-21 12.00.00.000000000 AM	15600153.58	AAnpyKABOAAAtOZAAB	\N	\N	\N	\N	\N	\N
68210	1963521	278569	KANO MM WAY BRANCH	WEB APP     Trf to DEM BANK HIFZULLAH MU	SYSTEM	SYSTEM	0	A	7300000	\N	\N	L	NGN	7300000	1	NG	3	KANO MM WAY BRANCH	1963521	HUKUMULLAH M SHARIF ENTERPRISES	\N	\N	\N	\N	\N	L	NGN	7300000	1	NG	1	Sterling Bank	1819611	HIFZULLAH MUNZALI SHARIF	\N	\N	\N	OTHERS	30-AUG-22 04.48.39.066797000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	HUKUMULLAH M SHARIF ENTERPRISES	01-JAN-70 12.00.00.000000000 AM	8063305041	396 ISLAMIYYAA S303 D720076    RIMIN GATA KANO                KANO STATE	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	1059112597	1059112597	16-DEC-21 12.00.00.000000000 AM	91.09	AAnpyKABOAAAtOZAAC	\N	\N	\N	\N	\N	\N
68211	3072975	278570	KANO MM WAY BRANCH	NIP Online   WEB APP  Trf to Access Bank	SYSTEM	SYSTEM	0	A	19060000	\N	\N	L	NGN	19060000	1	NG	3	KANO MM WAY BRANCH	3072975	BASHIR AHMED IBRAHIM	\N	\N	\N	\N	\N	L	NGN	19060000	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.40.517026000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	M	MR	BASHIR	IBRAHIM	01-JUN-89 12.00.00.000000000 AM	8036375350	NO 1                           LAYIN ADO BAYERO GATE 1        KOFAR DAWANAU DANISHE	DALA	KANO	60120472139	02-FEB-20 12.00.00.000000000 AM	\N	\N	01-JUL-22 12.00.00.000000000 AM	899396.9	AAnpyKABOAAAtOhAAB	\N	\N	\N	\N	\N	\N
68212	3072975	278572	KANO MM WAY BRANCH	NIP Online   WEB APP  Ibbmaiturare  Trf	SYSTEM	SYSTEM	0	A	5964596	\N	\N	L	NGN	5964596	1	NG	3	KANO MM WAY BRANCH	3072975	BASHIR AHMED IBRAHIM	\N	\N	\N	\N	\N	L	NGN	5964596	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.42.095125000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	M	MR	BASHIR	IBRAHIM	01-JUN-89 12.00.00.000000000 AM	8036375350	NO 1                           LAYIN ADO BAYERO GATE 1        KOFAR DAWANAU DANISHE	DALA	KANO	60120472139	02-FEB-20 12.00.00.000000000 AM	\N	\N	01-JUL-22 12.00.00.000000000 AM	899396.9	AAnpyKABOAAAtOlAAA	\N	\N	\N	\N	\N	\N
68213	3047838	058193	GOMBE BRANCH	NIP Online   WEB APP  Peak 14 g  Trf to	SYSTEM	SYSTEM	0	A	9500000	\N	\N	L	NGN	9500000	1	NG	8	GOMBE BRANCH	3047838	SHUGABA DAN MUSA GENERAL MERCHANDISE	\N	\N	\N	\N	\N	L	NGN	9500000	1	NG	8	POLARIS BANK	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.43.865310000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	SHUGABA DAN MUSA GENERAL MERCHANDISE	01-JAN-70 12.00.00.000000000 AM	7061616222	ABUJA LOWCOST GOMBE            BYPASS GALDIMARI	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	25236638-0001	25236638-0001	24-JUN-22 12.00.00.000000000 AM	1219155.24	AAnpyKABOAAAtOlAAC	\N	\N	\N	\N	\N	\N
68214	1036030001	307179	KANO MM WAY BRANCH	NIP FRM ISIEKWENU VENTURES TUD  IBGUTOCO	SYSTEM	SYSTEM	0	A	6337186	\N	\N	L	NGN	6337186	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	6337186	1	NG	3	FCMB	3072975	BASHIR AHMED IBRAHIM	\N	\N	\N	OTHERS	30-AUG-22 04.48.45.799192000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	M	MR	BASHIR	IBRAHIM	01-JUN-89 12.00.00.000000000 AM	8036375350	NO 1                           LAYIN ADO BAYERO GATE 1        KOFAR DAWANAU DANISHE	DALA	KANO	60120472139	02-FEB-20 12.00.00.000000000 AM	\N	\N	01-JUL-22 12.00.00.000000000 AM	899396.9	AAnpyKABNAAAtOuAAB	\N	\N	\N	\N	\N	\N
68215	1036030001	307161	KANO MM WAY BRANCH	NIP FRM ISIEKWENU VENTURES TUD  IBGUTOCO	SYSTEM	SYSTEM	0	A	11551000	\N	\N	L	NGN	11551000	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	11551000	1	NG	3	FCMB	3072975	BASHIR AHMED IBRAHIM	\N	\N	\N	OTHERS	30-AUG-22 04.48.47.157529000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	M	MR	BASHIR	IBRAHIM	01-JUN-89 12.00.00.000000000 AM	8036375350	NO 1                           LAYIN ADO BAYERO GATE 1        KOFAR DAWANAU DANISHE	DALA	KANO	60120472139	02-FEB-20 12.00.00.000000000 AM	\N	\N	01-JUL-22 12.00.00.000000000 AM	899396.9	AAnpyKABNAAAtPAAAC	\N	\N	\N	\N	\N	\N
68216	1036030001	077791	SOKOTO BRANCH	NIP FRM A M D AND SONS NIGERIA LTD TRFAm	SYSTEM	SYSTEM	0	A	5000000	\N	\N	L	NGN	5000000	1	NG	6	SOKOTO BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	5000000	1	NG	6	JAIZ Bank	1224732	A M D &amp, SONS NIGERIA LIMITED	\N	\N	\N	OTHERS	30-AUG-22 04.48.47.905859000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	A M D &amp, SONS NIGERIA LIMITED	01-JAN-70 12.00.00.000000000 AM	8037673030	NO 22/23                       SULTAN BELLO ROAD SOKOTO       SOKOTOO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	16997700-0001	16997700-0001	09-MAR-21 12.00.00.000000000 AM	175958.49	AAnpyKABLAAAumiAAD	\N	\N	\N	\N	\N	\N
68172	1360168	045717	SOKOTO BRANCH	NIP Online   WEB APP  Zshfa2  Trf to JAI	SYSTEM	SYSTEM	0	A	100000000	\N	\N	L	NGN	100000000	1	NG	6	SOKOTO BRANCH	1360168	AL-ADYAS GLOBAL RESOURCES LIMITED	\N	\N	\N	\N	\N	L	NGN	100000000	1	NG	6	JAIZ Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.47.59.999340000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	AL-ADYAS GLOBAL RESOURCES LIMITED	01-JAN-70 12.00.00.000000000 AM	8060606080	RSQ14                          A Y M PLAZA KOFAR ATIKU ROAD   AREA SOKOTO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	1015007154	1015007154	19-MAY-21 12.00.00.000000000 AM	4813068.36	AAnpyKAA2AAAoiwAAC	\N	\N	\N	\N	\N	\N
68173	1036030001	305968	KANO MM WAY BRANCH	NIP FRM MUSAF  UMAR TRFMusabFRM MUSAF  U	SYSTEM	SYSTEM	0	A	10000000	\N	\N	L	NGN	10000000	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	10000000	1	NG	3	FCMB	1242419	BEGAYU ENTERPRISES	\N	\N	\N	OTHERS	30-AUG-22 04.48.00.921226000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	BEGAYU ENTERPRISES	01-JAN-70 12.00.00.000000000 AM	8155555554	NO 10 TANKO SHATIMA            KANO                           KANO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24541320-0001	24541320-0001	17-MAR-21 12.00.00.000000000 AM	1282636.25	AAnpyKAA2AAAojsAAA	\N	\N	\N	\N	\N	\N
68174	1360168	045723	SOKOTO BRANCH	NIP Online   WEB APP  Zshafa2  Trf to JA	SYSTEM	SYSTEM	0	A	80000000	\N	\N	L	NGN	80000000	1	NG	6	SOKOTO BRANCH	1360168	AL-ADYAS GLOBAL RESOURCES LIMITED	\N	\N	\N	\N	\N	L	NGN	80000000	1	NG	6	JAIZ Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.01.804079000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	AL-ADYAS GLOBAL RESOURCES LIMITED	01-JAN-70 12.00.00.000000000 AM	8060606080	RSQ14                          A Y M PLAZA KOFAR ATIKU ROAD   AREA SOKOTO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	1015007154	1015007154	19-MAY-21 12.00.00.000000000 AM	4813068.36	AAnpyKAAaAAF0CFAAA	\N	\N	\N	\N	\N	\N
68175	2015544	073831	KOFAR WAMBAI BRANCH	NIP Online   WEB APP  K  Trf to ZENITH B	SYSTEM	SYSTEM	0	A	9800000	\N	\N	L	NGN	9800000	1	NG	12	KOFAR WAMBAI BRANCH	2015544	AMANI UNIVERSAL RICE LIMITED	\N	\N	\N	\N	\N	L	NGN	9800000	1	NG	12	StanbicIBTC Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.03.240509000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	AMANI UNIVERSAL RICE LIMITED	01-JAN-70 12.00.00.000000000 AM	8039317398	NO. 80/82 TAFAWA BALEWA ROAD   BOMPAI KANO                    NASSARAWA LGA	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	20263771-0001	20263771-0001	29-DEC-21 12.00.00.000000000 AM	47318164.64	AAnpyKAAaAAF0CwAAB	\N	\N	\N	\N	\N	\N
68176	1360168	045721	SOKOTO BRANCH	NIP Online   WEB APP  Zshafa3  Trf to JA	SYSTEM	SYSTEM	0	A	100000000	\N	\N	L	NGN	100000000	1	NG	6	SOKOTO BRANCH	1360168	AL-ADYAS GLOBAL RESOURCES LIMITED	\N	\N	\N	\N	\N	L	NGN	100000000	1	NG	6	JAIZ Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.03.992159000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	AL-ADYAS GLOBAL RESOURCES LIMITED	01-JAN-70 12.00.00.000000000 AM	8060606080	RSQ14                          A Y M PLAZA KOFAR ATIKU ROAD   AREA SOKOTO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	1015007154	1015007154	19-MAY-21 12.00.00.000000000 AM	4813068.36	AAnpyKAAaAAF0DGAAC	\N	\N	\N	\N	\N	\N
68177	1994244	278529	KANO MM WAY BRANCH	WEB APP  Snsi  saddik 3  Trf to DEM BANK	SYSTEM	SYSTEM	0	A	28000000	\N	\N	L	NGN	28000000	1	NG	3	KANO MM WAY BRANCH	1994244	HATTA AGRO ALLIED AND FARMS	\N	\N	\N	\N	\N	L	NGN	28000000	1	NG	3	FCMB	1835624	SEDEEQ GENERAL FARM ENTERPRISE	\N	\N	\N	OTHERS	30-AUG-22 04.48.04.963380000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	HATTA AGRO ALLIED AND FARMS	01-JAN-70 12.00.00.000000000 AM	8030909019	NO 17                          NAGODA ROAD KOFAR WAMBAI       MARKET FAGGE	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	1062833221	1062833221	23-DEC-21 12.00.00.000000000 AM	51689667.95	AAnpyKAAaAAF0DaAAA	\N	\N	\N	\N	\N	\N
68178	1036030001	306082	KANO MM WAY BRANCH	NIP FRM MABAB INTERNATIONAL LIMITED web	SYSTEM	SYSTEM	0	A	10000000	\N	\N	L	NGN	10000000	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	10000000	1	NG	3	FCMB	37603	MABAB PROPERTY LIMITED	\N	\N	\N	OTHERS	30-AUG-22 04.48.05.315582000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	MABAB PROPERTY LIMITED	01-JAN-70 12.00.00.000000000 AM	9099968999	NO 1 HOSPITAL ROAD, NASSARAWA  G.R.A. DANBATA HOUSE AUDU BAKO WAY. KANO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	22352143-0001	22352143-0001	06-FEB-20 12.00.00.000000000 AM	10686.1	AAnpyKAAZAAF0CHAAD	\N	\N	\N	\N	\N	\N
68179	1036030001	603038	KOFAR WAMBAI BRANCH	NIP FRM MAIMUNA ISIYAKA RABIU ENTERPRI T	SYSTEM	SYSTEM	0	A	26280000	\N	\N	L	NGN	26280000	1	NG	12	KOFAR WAMBAI BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	26280000	1	NG	12	StanbicIBTC Bank	2015544	AMANI UNIVERSAL RICE LIMITED	\N	\N	\N	OTHERS	30-AUG-22 04.48.06.470583000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	AMANI UNIVERSAL RICE LIMITED	01-JAN-70 12.00.00.000000000 AM	8039317398	NO. 80/82 TAFAWA BALEWA ROAD   BOMPAI KANO                    NASSARAWA LGA	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	20263771-0001	20263771-0001	29-DEC-21 12.00.00.000000000 AM	47318164.64	AAnpyKAAZAAF0C2AAC	\N	\N	\N	\N	\N	\N
68180	1036030001	306132	KANO MM WAY BRANCH	NIP FRM MABAB INTERNATIONAL LIMITED web	SYSTEM	SYSTEM	0	A	10000000	\N	\N	L	NGN	10000000	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	10000000	1	NG	3	FCMB	37603	MABAB PROPERTY LIMITED	\N	\N	\N	OTHERS	30-AUG-22 04.48.07.014129000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	MABAB PROPERTY LIMITED	01-JAN-70 12.00.00.000000000 AM	9099968999	NO 1 HOSPITAL ROAD, NASSARAWA  G.R.A. DANBATA HOUSE AUDU BAKO WAY. KANO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	22352143-0001	22352143-0001	06-FEB-20 12.00.00.000000000 AM	10686.1	AAnpyKAAYAAAmrEAAD	\N	\N	\N	\N	\N	\N
68219	2916593	278578	KANO MM WAY BRANCH	NIP Online   WEB APP  Ay  Trf to Fidelit	SYSTEM	SYSTEM	0	A	26825000	\N	\N	L	NGN	26825000	1	NG	3	KANO MM WAY BRANCH	2916593	NBA MULTI PURPOSE COMANY NIG	\N	\N	\N	\N	\N	L	NGN	26825000	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.50.132625000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	NBA MULTI PURPOSE COMANY NIG	01-JAN-70 12.00.00.000000000 AM	8032605293	NO 449                         MANDAWARI SABON TITI           BERUIT ROAD	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24808054-0001	24808054-0001	09-JUN-22 12.00.00.000000000 AM	206023198.35	AAnpyKABLAAAum/AAA	\N	\N	\N	\N	\N	\N
68220	37603	278574	KANO MM WAY BRANCH	NIP Online   WEB APP  Transfer  Trf to F	SYSTEM	SYSTEM	0	A	50000000	\N	\N	L	NGN	50000000	1	NG	3	KANO MM WAY BRANCH	37603	MABAB PROPERTY LIMITED	\N	\N	\N	\N	\N	L	NGN	50000000	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.50.472474000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	MABAB PROPERTY LIMITED	01-JAN-70 12.00.00.000000000 AM	9099968999	NO 1 HOSPITAL ROAD, NASSARAWA  G.R.A. DANBATA HOUSE AUDU BAKO WAY. KANO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	22352143-0001	22352143-0001	06-FEB-20 12.00.00.000000000 AM	10686.1	AAnpyKABLAAAunWAAB	\N	\N	\N	\N	\N	\N
68221	2508048	067592	HEAD OFFICE	NIP Mobile   Salisu shagamu	SYSTEM	SYSTEM	0	A	5000000	\N	\N	L	NGN	5000000	1	NG	1	HEAD OFFICE	2508048	SALISU MUHAMMAD	\N	\N	\N	\N	\N	L	NGN	5000000	1	NG	1	Sterling Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.51.651039000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	M	MR	SALISU	MUHAMMAD	12-OCT-82 12.00.00.000000000 AM	8035690393	GADA BIYU AREA HOUSE NO 6      GUSAU ZAMFARA STATE            ZAMFARA	GUSAU	ZAMFARA	5298202630981894	24-MAR-22 12.00.00.000000000 AM	\N	\N	24-MAR-22 12.00.00.000000000 AM	8821.98	AAnpyKABLAAAunhAAA	\N	\N	\N	\N	\N	\N
68222	2057797	181979	ABUJA CORPORATE BRANCH	NIP Online   WEB APP  Bd  Trf to FCMB SE	SYSTEM	SYSTEM	0	A	6000000	\N	\N	L	NGN	6000000	1	NG	2	ABUJA CORPORATE BRANCH	2057797	A4J INTEGRATED SERVICES LIMITED	\N	\N	\N	\N	\N	L	NGN	6000000	1	NG	2	Keystone Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.52.952081000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	A4J INTEGRATED SERVICES LIMITED	01-JAN-70 12.00.00.000000000 AM	8035307513	NO 20                          OTUKPO STREET                  AREA 11 GARKI	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	23817509-0001	23817509-0001	07-JAN-22 12.00.00.000000000 AM	778130.85	AAnpyKABKAAAuW5AAA	\N	\N	\N	\N	\N	\N
68223	1036030001	307291	KANO MM WAY BRANCH	NIP FRM ADEDOYIN SEGUN LATEEF via GTWORL	SYSTEM	SYSTEM	0	A	7130000	\N	\N	L	NGN	7130000	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	7130000	1	NG	3	FCMB	1002477	GARBA ISAH ABDULLAHI	\N	\N	\N	OTHERS	30-AUG-22 04.48.53.455767000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	22150478117	M	MR	GARBA	ABDULLAHI	13-OCT-78 12.00.00.000000000 AM	8033171758	NO 127 SANI MAINAGGE QUATERS   KANO                           GIDAN KANKARABUS STOP	KANO	KANO	EKY61511AA03	28-DEC-17 12.00.00.000000000 AM	\N	\N	16-DEC-20 12.00.00.000000000 AM	49993739.33	AAnpyKABKAAAuXVAAB	\N	\N	\N	\N	\N	\N
68224	3089799	070208	SABON GARI BRANCH	NIP Online   WEB APP  Deposit for 300bag	SYSTEM	SYSTEM	0	A	15000000	\N	\N	L	NGN	15000000	1	NG	11	SABON GARI BRANCH	3089799	ABBA ABDULRAHMAN ISAH	\N	\N	\N	\N	\N	L	NGN	15000000	1	NG	11	Unity Bank	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.55.947366000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	M	MR	ABBA	ISAH	02-APR-91 12.00.00.000000000 AM	8035480761	179 GWAMMAJA                   QRTS GWAMMAJA                  GIRLS SEC SCH	GWALE	KANO	41413649597	04-JUL-22 12.00.00.000000000 AM	\N	\N	04-JUL-22 12.00.00.000000000 AM	734449.53	AAnpyKABKAAAuXsAAB	\N	\N	\N	\N	\N	\N
68343	1030100001	641053	HEAD OFFICE	09FG2208301019396756ISADY  ONLINE  TO TA	SYSTEM	SYSTEM	0	A	5000000	\N	\N	L	NGN	5000000	1	NG	1	HEAD OFFICE	1030100001	ETRANZACT RECEIVABLE	\N	\N	\N	\N	\N	L	NGN	5000000	1	NG	1	Sterling Bank	1515834	KLIMATT NIG LTD	\N	\N	\N	OTHERS	30-AUG-22 04.51.57.238642000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	KLIMATT NIG LTD	01-JAN-70 12.00.00.000000000 AM	8036096249	NO 9                           AMINU SALE CRESCENT            KATAMPE EXTENSION	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	1051423950	1051423950	26-JUL-21 12.00.00.000000000 AM	38348265.49	AAnpyKAA7AAHcK7AAA	\N	\N	\N	\N	\N	\N
68344	1036030001	439186	ABUJA CORPORATE BRANCH	NIP FRM EL YAYI ENTERPRISES B	SYSTEM	SYSTEM	0	A	15000000	\N	\N	L	NGN	15000000	1	NG	2	ABUJA CORPORATE BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	15000000	1	NG	2	Keystone Bank	299801	LUBELL AGRO ALLIED SERVICES LTD	\N	\N	\N	OTHERS	30-AUG-22 04.51.57.372473000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	LUBELL AGRO ALLIED SERVICES LTD	01-JAN-70 12.00.00.000000000 AM	8033299791	NO 15                          MAGADISHU STREET               WUSE ZONE 4	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	23795683-0001	23795683-0001	13-AUG-20 12.00.00.000000000 AM	58379787	AAnpyKAA7AAHcLnAAD	\N	\N	\N	\N	\N	\N
68345	1036030001	307929	KANO MM WAY BRANCH	NIP FRM VOC MULTILINK SERVICES COB TRF F	SYSTEM	SYSTEM	0	A	16000000	\N	\N	L	NGN	16000000	1	NG	3	KANO MM WAY BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	16000000	1	NG	3	FCMB	1885241	AA ALIYU MUKHTAR ENTERPRISES	\N	\N	\N	OTHERS	30-AUG-22 04.51.58.159870000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	AA ALIYU MUKHTAR ENTERPRISES	01-JAN-70 12.00.00.000000000 AM	9069627743	NO 37B HAIJYA AMINA HOUSE     BEIRUT ROAD KANO               KANO STATE	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24289324-0001	24289324-0001	25-NOV-21 12.00.00.000000000 AM	1276.03	AAnpyKAA7AAHcL/AAB	\N	\N	\N	\N	\N	\N
68272	2040120001	163570	HEAD OFFICE	NIPPAYSETTL5THSESS_29TH_AUG	SYSTEM	SYSTEM	0	A	3156398726.85	\N	\N	L	NGN	3156398726.85	1	NG	1	HEAD OFFICE	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	\N	\N	L	NGN	3156398726.85	1	NG	1	Sterling Bank	1031210001	TAJBANK LTD	\N	\N	\N	OTHERS	30-AUG-22 04.50.02.575962000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	TAJBANK LTD	01-JAN-70 12.00.00.000000000 AM	0	PLOT 72 AHMADU BELLO WAY       BENUE PLAZA                    CBD	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	2126083-0001	2126083-0001	30-SEP-19 12.00.00.000000000 AM	-853975088.46	AAnpyKAAQAAG+KOAAA	\N	\N	\N	\N	\N	\N
68273	1031210001	163571	HEAD OFFICE	NIPRECSETTL5THSESS_29TH_AUG	SYSTEM	SYSTEM	0	A	2956642602.22	\N	\N	L	NGN	2956642602.22	1	NG	1	HEAD OFFICE	1031210001	TAJBANK LTD	\N	\N	\N	\N	\N	L	NGN	2956642602.22	1	NG	1	Sterling Bank	1036030001	NIP Receivable Acc	\N	\N	\N	OTHERS	30-AUG-22 04.50.03.219323000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	TAJBANK LTD	01-JAN-70 12.00.00.000000000 AM	0	PLOT 72 AHMADU BELLO WAY       BENUE PLAZA                    CBD	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	2126083-0001	2126083-0001	30-SEP-19 12.00.00.000000000 AM	-853975088.46	AAnpyKAAQAAG+KOAAB	\N	\N	\N	\N	\N	\N
68274	2040120001	163572	HEAD OFFICE	NIPPAYSETTL1ST.SESS_30TH_AUG	SYSTEM	SYSTEM	0	A	746008776.77	\N	\N	L	NGN	746008776.77	1	NG	1	HEAD OFFICE	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	\N	\N	L	NGN	746008776.77	1	NG	1	Sterling Bank	1031210001	TAJBANK LTD	\N	\N	\N	OTHERS	30-AUG-22 04.50.03.998371000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	TAJBANK LTD	01-JAN-70 12.00.00.000000000 AM	0	PLOT 72 AHMADU BELLO WAY       BENUE PLAZA                    CBD	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	2126083-0001	2126083-0001	30-SEP-19 12.00.00.000000000 AM	-853975088.46	AAnpyKAAQAAG+KYAAA	\N	\N	\N	\N	\N	\N
68275	2916593	278613	KANO MM WAY BRANCH	NIP Online   WEB APP  Aay  Trf to Fideli	SYSTEM	SYSTEM	0	A	21700000	\N	\N	L	NGN	21700000	1	NG	3	KANO MM WAY BRANCH	2916593	NBA MULTI PURPOSE COMANY NIG	\N	\N	\N	\N	\N	L	NGN	21700000	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.50.05.676396000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	NBA MULTI PURPOSE COMANY NIG	01-JAN-70 12.00.00.000000000 AM	8032605293	NO 449                         MANDAWARI SABON TITI           BERUIT ROAD	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24808054-0001	24808054-0001	09-JUN-22 12.00.00.000000000 AM	206023198.35	AAnpyKAAPAAHwDfAAA	\N	\N	\N	\N	\N	\N
68276	1031210001	163574	HEAD OFFICE	NIPPAYSETTL1ST.SESS_30TH_AUG	SYSTEM	SYSTEM	0	A	396365501.39	\N	\N	L	NGN	396365501.39	1	NG	1	HEAD OFFICE	1031210001	TAJBANK LTD	\N	\N	\N	\N	\N	L	NGN	396365501.39	1	NG	1	Sterling Bank	1036030001	NIP Receivable Acc	\N	\N	\N	OTHERS	30-AUG-22 04.50.06.531084000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	TAJBANK LTD	01-JAN-70 12.00.00.000000000 AM	0	PLOT 72 AHMADU BELLO WAY       BENUE PLAZA                    CBD	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	2126083-0001	2126083-0001	30-SEP-19 12.00.00.000000000 AM	-853975088.46	AAnpyKAAPAAHwD2AAA	\N	\N	\N	\N	\N	\N
68277	1036030001	438985	ABUJA CORPORATE BRANCH	NIP FRM INSTANT TRAVELS AND TOURISM LT A	SYSTEM	SYSTEM	0	A	5000000	\N	\N	L	NGN	5000000	1	NG	2	ABUJA CORPORATE BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	5000000	1	NG	2	Keystone Bank	24478	ARINOLA AFRICAN SHOP SERVICES	\N	\N	\N	OTHERS	30-AUG-22 04.50.06.565115000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	ARINOLA AFRICAN SHOP SERVICES	01-JAN-70 12.00.00.000000000 AM	8033525192	NO 4,                          TENNESSE CRESCENT,             MAITAMA,	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	19857868	19857868	09-JAN-20 12.00.00.000000000 AM	5878532.14	AAnpyKAAOAAHwCaAAC	\N	\N	\N	\N	\N	\N
68278	1030080005	307576	KANO MM WAY BRANCH	N 00000017167 TRSF IFO WARREN	SYSTEM	SYSTEM	0	A	152257200	\N	\N	L	NGN	152257200	1	NG	1	KANO MM WAY BRANCH	1030080005	NAPS CBN SETTLEMENT ACCOUNT	\N	\N	\N	\N	\N	L	NGN	152257200	1	NG	3	FCMB	148631	WARREN BRADSTREET ENTERPRISES	\N	\N	\N	OTHERS	30-AUG-22 04.50.07.107465000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	WARREN BRADSTREET ENTERPRISES	01-JAN-70 12.00.00.000000000 AM	8036365600	NO 9                           SAMBAJO STREET                 SANI MAINAGGE	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	2231298-0001	2231298-0001	22-JUN-20 12.00.00.000000000 AM	275484.9	AAnpyKAAOAAHwDQAAA	\N	\N	\N	\N	\N	\N
68279	1030080005	637195	HEAD OFFICE	N 00000017167 TRSF IFO WARREN	SYSTEM	SYSTEM	0	A	152257200	\N	\N	L	NGN	152257200	1	NG	1	HEAD OFFICE	1030080005	NAPS CBN SETTLEMENT ACCOUNT	\N	\N	\N	\N	\N	L	NGN	152257200	1	NG	3	FCMB	148631	WARREN BRADSTREET ENTERPRISES	\N	\N	\N	OTHERS	30-AUG-22 04.50.07.594422000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	WARREN BRADSTREET ENTERPRISES	01-JAN-70 12.00.00.000000000 AM	8036365600	NO 9                           SAMBAJO STREET                 SANI MAINAGGE	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	2231298-0001	2231298-0001	22-JUN-20 12.00.00.000000000 AM	275484.9	AAnpyKAAOAAHwDQAAB	\N	\N	\N	\N	\N	\N
68280	1030080005	307577	KANO MM WAY BRANCH	CIBS MADUS COMMODITIES NIG LTD To ABBAMA	SYSTEM	SYSTEM	0	A	20000000	\N	\N	L	NGN	20000000	1	NG	1	KANO MM WAY BRANCH	1030080005	NAPS CBN SETTLEMENT ACCOUNT	\N	\N	\N	\N	\N	L	NGN	20000000	1	NG	3	FCMB	3073721	ABBAMASU COMPANY	\N	\N	\N	OTHERS	30-AUG-22 04.50.09.256393000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	ABBAMASU COMPANY	01-JAN-70 12.00.00.000000000 AM	7036229808	NO. 1125 UNGOGGO	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	22865004-0001	22865004-0001	30-JUN-22 12.00.00.000000000 AM	30155048.34	AAnpyKAAOAAHwDYAAC	\N	\N	\N	\N	\N	\N
68225	2916593	278582	KANO MM WAY BRANCH	NIP Online   WEB APP  Aay  Trf to Access	SYSTEM	SYSTEM	0	A	8722058	\N	\N	L	NGN	8722058	1	NG	3	KANO MM WAY BRANCH	2916593	NBA MULTI PURPOSE COMANY NIG	\N	\N	\N	\N	\N	L	NGN	8722058	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.57.473476000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	NBA MULTI PURPOSE COMANY NIG	01-JAN-70 12.00.00.000000000 AM	8032605293	NO 449                         MANDAWARI SABON TITI           BERUIT ROAD	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24808054-0001	24808054-0001	09-JUN-22 12.00.00.000000000 AM	206023198.35	AAnpyKABKAAAuXvAAA	\N	\N	\N	\N	\N	\N
68226	2916593	278584	KANO MM WAY BRANCH	NIP Online   WEB APP  Aay  Trf to Access	SYSTEM	SYSTEM	0	A	23208434	\N	\N	L	NGN	23208434	1	NG	3	KANO MM WAY BRANCH	2916593	NBA MULTI PURPOSE COMANY NIG	\N	\N	\N	\N	\N	L	NGN	23208434	1	NG	3	FCMB	2040120001	NIP PAYABLE ACCOUNT	\N	\N	\N	OTHERS	30-AUG-22 04.48.58.938478000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	NBA MULTI PURPOSE COMANY NIG	01-JAN-70 12.00.00.000000000 AM	8032605293	NO 449                         MANDAWARI SABON TITI           BERUIT ROAD	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	24808054-0001	24808054-0001	09-JUN-22 12.00.00.000000000 AM	206023198.35	AAnpyKABKAAAuXvAAC	\N	\N	\N	\N	\N	\N
68227	1138569	404004	HEAD OFFICE	WEB APP  supply office equipment  Trf to	SYSTEM	SYSTEM	0	A	10000000	\N	\N	L	NGN	10000000	1	NG	1	HEAD OFFICE	1138569	KAMA INTEGRATED SERVICES LTD	\N	\N	\N	\N	\N	L	NGN	10000000	1	NG	1	Sterling Bank	2986028	UTHMAN UMAR MUHAMMAD	\N	\N	\N	OTHERS	30-AUG-22 04.48.59.978672000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	KAMA INTEGRATED SERVICES LTD	01-JAN-70 12.00.00.000000000 AM	8063431107	NO 1                           FIRST AVENUE, DRIVE FORT ROYAL  ESTATE, AIR PORT ROAD	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	11967404-0001	11967404-0001	02-FEB-21 12.00.00.000000000 AM	13734.75	AAnpyKABKAAAuX6AAB	\N	\N	\N	\N	\N	\N
68346	1036030001	603101	KOFAR WAMBAI BRANCH	NIP FRM YAHAYA MOHAMMED  SANI MOBDK MULT	SYSTEM	SYSTEM	0	A	5000000	\N	\N	L	NGN	5000000	1	NG	12	KOFAR WAMBAI BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	5000000	1	NG	12	StanbicIBTC Bank	3195090	DK MULTI GLOBAL SERVICES LTD	\N	\N	\N	OTHERS	30-AUG-22 04.48.15.976526000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	DK MULTI GLOBAL SERVICES LTD	01-JAN-70 12.00.00.000000000 AM	8038659310	NO 162 LAYIN LABUN KAWA GAIDA  ZAWA CIKI GIDA                 KUMBOTSO LGA	\N	\N	\N	01-JAN-70 12.00.00.000000000 AM	23933725-0001	23933725-0001	25-JUL-22 12.00.00.000000000 AM	7130684.25	AAnpyKAAVAAAnbAAAB	\N	\N	\N	\N	\N	\N
68171	16602	000232	KANO MM WAY BRANCH	\N	SYSTEM	SYSTEM	0	A	10000000	\N	\N	L	NGN	10000000	1	NG	3	KANO MM WAY BRANCH	16602	HAFSATU ABBA ADO BAYERO	\N	\N	\N	\N	\N	L	NGN	10000000	1	NG	\N	Others	\N	\N	\N	\N	\N	OTHERS	30-AUG-22 04.47.59.029867000 PM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	22329617297	F	HAJIYA	HAFSATU	BAYERO	12-APR-43 12.00.00.000000000 AM	8035517340	NO 1                           EMIR PALACE KANO               EMI PALACE	KANO	KANO	A10188248	19-FEB-19 12.00.00.000000000 AM	\N	\N	18-DEC-19 12.00.00.000000000 AM	10000974.85	AAnpyKAAJAAAAglAAB	5	\N	\N	\N	\N	\N
1	103601996	603101	KOFAR WAMBAI BRANCH	NIP FRM YAHAYA MOHAMMED  SANI MOBDK MULT	SYSTEM	SYSTEM	0	A	5000000	\N	\N	L	NGN	5000000	1	NG	12	KOFAR WAMBAI BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	5000000	1	NG	12	StanbicIBTC Bank	3195090	DK MULTI GLOBAL SERVICES LTD	\N	\N	\N	OTHERS	2023-08-28 14:52:00	test test test	testing again	testing	\N	\N	MESSR	\N	DK MULTI GLOBAL SERVICES LTD	date of birth	8038659310	NO 162 LAYIN LABUN KAWA GAIDA  ZAWA CIKI GIDA                 KUMBOTSO LGA	\N	\N	\N		23933725-0001	23933725-0001	t_comp_date	7130684.25	AAnpyKAAVAAAnbAAAB	3	\N	\N	http://46.101.23.167/icomply_webservices/public/index.php/api/send-request?sql=update str_transactions set status=3 where id=1;	2023-10-03 11:33:37	\N
3	115536031	603101	KOFAR WAMBAI BRANCH	NIP FRM YAHAYA MOHAMMED  SANI MOBDK MULT	SYSTEM	SYSTEM	0	A	5000000	\N	\N	L	NGN	5000000	1	NG	12	KOFAR WAMBAI BRANCH	1036030001	NIP Receivable Acc	\N	\N	\N	\N	\N	L	NGN	5000000	1	NG	12	StanbicIBTC Bank	3195090	DK MULTI GLOBAL SERVICES LTD	\N	\N	\N	OTHERS	2023-08-28 14:52:00	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	30-AUG-22 12.00.00.000000000 AM	\N	\N	MESSR	\N	DK MULTI GLOBAL SERVICES LTD	01-JAN-70 12.00.00.000000000 AM	8038659310	NO 162 LAYIN LABUN KAWA GAIDA  ZAWA CIKI GIDA                 KUMBOTSO LGA	\N	\N	\N		23933725-0001	23933725-0001	25-JUL-22 12.00.00.000000000 AM	7130684.25	AAnpyKAAVAAAnbAAAB	3	\N	\N	http://127.0.0.1:8000/api/send-request?sql=update str_transactions set status=3 where id=3;	2023-10-02 15:16:36	\N
\.


--
-- Data for Name: team; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.team (id, name, email, staff_id, created_at, updated_at) FROM stdin;
42	DOMESTIC OPERATIONS			10-MAY-22 12.28.28.159215000 PM	\N
43	BUSINESS BANKING			10-MAY-22 12.28.28.159215000 PM	\N
46	INTERNAL AUDIT			10-MAY-22 12.28.28.159215000 PM	\N
48	FINANCIAL CONTROL			10-MAY-22 12.28.28.159215000 PM	\N
50	PUBLIC SECTOR			10-MAY-22 12.28.28.159215000 PM	\N
51	RETAIL BANKING			10-MAY-22 12.28.28.159215000 PM	\N
54	INFORMATION SECURITY			10-MAY-22 12.28.28.159215000 PM	\N
56	SHARIAH AUDIT			10-MAY-22 12.28.28.159215000 PM	\N
57	RISK MANAGEMENT			10-MAY-22 12.28.28.159215000 PM	\N
58	SHARIAH DEPARTMENT			10-MAY-22 12.28.28.159215000 PM	\N
59	TRANSFORMATION			10-MAY-22 12.28.28.159215000 PM	\N
60	APPLICATION DEVELOPMENT			10-MAY-22 12.28.28.159215000 PM	\N
62	CONTACT CENTER			10-MAY-22 12.28.28.159215000 PM	\N
63	MD'S DIRECTORATE			10-MAY-22 12.28.28.159215000 PM	\N
66	E-BUSINESS			10-MAY-22 12.28.28.159215000 PM	\N
67	MARKETING			10-MAY-22 12.28.28.159215000 PM	\N
68	PRIVATE BANKING			10-MAY-22 12.28.28.159215000 PM	\N
69	OPERATIONS-NASS			10-MAY-22 12.28.28.159215000 PM	\N
71	CUSTOMER SERVICE			10-MAY-22 12.28.28.159215000 PM	\N
72	FOREIGN OPERATIONS			10-MAY-22 12.28.28.159215000 PM	\N
74	OPERATIONS-KANO			10-MAY-22 12.28.28.159215000 PM	\N
77	HUMAN RESOURCES			10-MAY-22 12.28.28.159215000 PM	\N
78	CORPORATE SERVICES			10-MAY-22 12.28.28.159215000 PM	\N
87	LEGAL			10-MAY-22 12.28.28.159215000 PM	\N
89	Head office			10-MAY-22 12.28.28.159215000 PM	\N
91	OPERATIONS-LAGOS			10-MAY-22 12.28.28.159215000 PM	\N
92	DEVELOPMENT FINANCE			10-MAY-22 12.28.28.159215000 PM	\N
94	INFORMATION TECHNONOLOGY			10-MAY-22 12.28.28.159215000 PM	\N
95	TREASURY			10-MAY-22 12.28.28.159215000 PM	\N
96	TREASURY OPERATIONS			10-MAY-22 12.28.28.159215000 PM	\N
97	ED BUSINESS DEVELOPMENT, DIRECTORATE			10-MAY-22 12.28.28.159215000 PM	\N
98	E-BANKING OPERATIONS			10-MAY-22 12.28.28.159215000 PM	\N
99	INTERNATIONAL OPERATIONS			10-MAY-22 12.28.28.159215000 PM	\N
100	CORPORATE TREASURY			10-MAY-22 12.28.28.159215000 PM	\N
101	BUSINESS DEVELOPMENT			10-MAY-22 12.28.28.159215000 PM	\N
102	AGRIC BUSINESS			10-MAY-22 12.28.28.159215000 PM	\N
104	BUISNESS BANKING GROUP			10-MAY-22 12.28.28.159215000 PM	\N
105	MARKETING COMMUNICATIONS			10-MAY-22 12.28.28.159215000 PM	\N
44	COMPLIANCE	compliancegroup@tajbank.com			\N
1	INTERNAL CONTROL	internalcontrolunit@tajbank.com			\N
41	OPERATIONS	Hansoneyuren@Gmail.Com	56		\N
107	TAJMALL			10-MAY-22 12.28.28.159215000 PM	\N
\.


--
-- Data for Name: testest; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.testest (name) FROM stdin;
food
house
trial


test5666
testyyyyyyyyyyy
testyyyyyyyyyyy
testjhvbvbhjn

title



tvhbjkl,
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: icomply
--

COPY public.users (id, email, firstname, lastname, password, username, created_at, roles, status, phone, group_id, failed_login_attempts, team_id, branch_access, report_access, app_id, os_user) FROM stdin;
101	charles.e@novajii.com	CHARLES	EKPO	25F9E794323B453885F5181F1B624D0B	charles.e@novajii.com	\N	\N	active	\N	\N	\N	\N	NG0010001:NG0020001:NG0020002:NG0020003:NG0020004:NG0020005:NG0020006:NG0020007:NG0020008:NG0020009:NG0020010:NG0020011:NG0020012:NG0020013:NG0020014:NG0020015:NG0020016:NG0020017:NG0020018:NG0020019:NG0020020:NG0020021:NG0020022:NG0020023:NG0020024:NG0020025:NG0020026:NG0020027:NG0020028:NG0020029:NG0020030:NG0020031:NG0020032:NG0020033:NG0020034:NG0020035:NG0020036:NG0020037:NG0020038:NG0020039:NG0020040:NG0020041:NG0020042:NG0020043:NG0020044:NG0020045:NG0020046:NG0020047:NG0020048:NG0020049:NG0020050:NG0020051:NG0020052:NG0020053:NG0020054:NG0020055:NG0020056:NG0020057:NG0020058:NG0020059:NG0020060:NG0020061:NG0020062:NG0020063:NG0020064:NG0020065:NG0020066:NG0020067:NG0020068:NG0020069:NG0020070:NG0020071:NG0020072:NG0020073:NG0020074:NG0020075:NG0020076:NG0020077:NG0020078:NG0020079:NG0020080:NG0020081:NG0020082:NG0020083:NG0020084:NG0020085:NG0020086:NG0020087:NG0020088:NG0020089:NG0020090:NG0020091:NG0020092:NG0020093:NG0020094:NG0020095:NG0020096:NG0020097:NG0020098:NG0020099:NG0020100:NG0020101:NG0020102:NG0020103:NG0020104:NG0020105:NG0020106:NG0020107:NG0020108:NG0020109:NG0020110:NG0020111:NG0020112:NG0020113:NG0020114:NG0020115:NG0020116:NG0020117:NG0020118:NG0020119:NG0020120:NG0020121:NG0020122:NG0020123:NG0020124:NG0020125:NG0020126:NG0020127:NG0020128:NG0020129:NG0020130:NG0020131:NG0020132:NG0020133:NG0020134:NG0020135:NG0020136:NG0020137:NG0020138:NG0020139:NG0020140:NG0020141:NG0020142:NG0020143:NG0020144:NG0020145:NG0020146:NG0020147:NG0020148:NG0020149:NG0020150:NG0020151:NG0020152:NG0020153:NG0020154:NG0020155:NG0020156:NG0020157:NG0020158:NG0020159:NG0020160:NG0020161:NG0020162:NG0020163:NG0020164:NG0020165:NG0020166:NG0020167:NG0020168:NG0020169:NG0020170:NG0020171:NG0020172:NG0020173:NG0020174:NG0020175:NG0020176:NG0020177:NG0020178:NG0020179:NG0020180:NG0020555:NG0020556:NG0020557	1:2:5:61:101:4:3:81	106:102	\N
11	hanson.e@novajii.com	HANSON	Ogundele Stephen	280AB0357953BB958362096D40CB2E78	hanson.e@novajii.com	13-APR-22 01.00.00.000000000 AM	Regular User	active	123456789	\N	\N	1	NG0010001:NG0020001:NG0020002:NG0020003:NG0020004:NG0020005:NG0020006:NG0020007:NG0020008:NG0020009:NG0020010:NG0020011:NG0020012:NG0020013:NG0020014:NG0020015:NG0020016:NG0020017:NG0020018:NG0020019:NG0020020:NG0020021:NG0020022:NG0020023:NG0020024:NG0020025:NG0020026:NG0020027:NG0020028:NG0020029:NG0020030:NG0020031:NG0020032:NG0020033:NG0020034:NG0020035:NG0020036:NG0020037:NG0020038:NG0020039:NG0020040:NG0020041:NG0020042:NG0020043:NG0020044:NG0020045:NG0020046:NG0020047:NG0020048:NG0020049:NG0020050:NG0020051:NG0020052:NG0020053:NG0020054:NG0020055:NG0020056:NG0020057:NG0020058:NG0020059:NG0020060:NG0020061:NG0020062:NG0020063:NG0020064:NG0020065:NG0020066:NG0020067:NG0020068:NG0020069:NG0020070:NG0020071:NG0020072:NG0020073:NG0020074:NG0020075:NG0020076:NG0020077:NG0020078:NG0020079:NG0020080:NG0020081:NG0020082:NG0020083:NG0020084:NG0020085:NG0020086:NG0020087:NG0020088:NG0020089:NG0020090:NG0020091:NG0020092:NG0020093:NG0020094:NG0020095:NG0020096:NG0020097:NG0020098:NG0020099:NG0020100:NG0020101:NG0020102:NG0020103:NG0020104:NG0020105:NG0020106:NG0020107:NG0020108:NG0020109:NG0020110:NG0020111:NG0020112:NG0020113:NG0020114:NG0020115:NG0020116:NG0020117:NG0020118:NG0020119:NG0020120:NG0020121:NG0020122:NG0020123:NG0020124:NG0020125:NG0020126:NG0020127:NG0020128:NG0020129:NG0020130:NG0020131:NG0020132:NG0020133:NG0020134:NG0020135:NG0020136:NG0020137:NG0020138:NG0020139:NG0020140:NG0020141:NG0020142:NG0020143:NG0020144:NG0020145:NG0020146:NG0020147:NG0020148:NG0020149:NG0020150:NG0020151:NG0020152:NG0020153:NG0020154:NG0020155:NG0020156:NG0020157:NG0020158:NG0020159:NG0020160:NG0020161:NG0020162:NG0020163:NG0020164:NG0020165:NG0020166:NG0020167:NG0020168:NG0020169:NG0020170:NG0020171:NG0020172:NG0020173:NG0020174:NG0020175:NG0020176:NG0020177:NG0020178:NG0020179:NG0020180:NG0020555:NG0020556:NG0020557	\N	106:102	\N
21	olowolagbatobi@gmail.com	Oluwatobi	Olowolagba	280AB0357953BB958362096D40CB2E78	olowolagbatobi@gmail.com	13-APR-22 01.00.00.000000000 AM	Regular User	active	8126233858	21	\N	1	\N	\N	106:102	\N
43	tech-support@novajii.com	NOVAJI INTROSERVE	Introserve	280AB0357953BB958362096D40CB2E78	tech-support@novajii.com	13-APR-22 01.00.00.000000000 AM	Super Admin	active	7066192100	1	\N	1	NG0010001:NG0020001:NG0020002:NG0020003:NG0020004:NG0020005:NG0020006:NG0020007:NG0020008:NG0020009:NG0020010:NG0020011:NG0020012:NG0020013:NG0020014:NG0020015:NG0020016:NG0020017:NG0020018:NG0020019:NG0020020:NG0020021:NG0020022:NG0020023:NG0020024:NG0020025:NG0020026:NG0020027:NG0020028:NG0020029:NG0020030:NG0020031:NG0020032:NG0020033:NG0020034:NG0020035:NG0020036:NG0020037:NG0020038:NG0020039:NG0020040:NG0020041:NG0020042:NG0020043:NG0020044:NG0020045:NG0020046:NG0020047:NG0020048:NG0020049:NG0020050:NG0020051:NG0020052:NG0020053:NG0020054:NG0020055:NG0020056:NG0020057:NG0020058:NG0020059:NG0020060:NG0020061:NG0020062:NG0020063:NG0020064:NG0020065:NG0020066:NG0020067:NG0020068:NG0020069:NG0020070:NG0020071:NG0020072:NG0020073:NG0020074:NG0020075:NG0020076:NG0020077:NG0020078:NG0020079:NG0020080:NG0020081:NG0020082:NG0020083:NG0020084:NG0020085:NG0020086:NG0020087:NG0020088:NG0020089:NG0020090:NG0020091:NG0020092:NG0020093:NG0020094:NG0020095:NG0020096:NG0020097:NG0020098:NG0020099:NG0020100:NG0020101:NG0020102:NG0020103:NG0020104:NG0020105:NG0020106:NG0020107:NG0020108:NG0020109:NG0020110:NG0020111:NG0020112:NG0020113:NG0020114:NG0020115:NG0020116:NG0020117:NG0020118:NG0020119:NG0020120:NG0020121:NG0020122:NG0020123:NG0020124:NG0020125:NG0020126:NG0020127:NG0020128:NG0020129:NG0020130:NG0020131:NG0020132:NG0020133:NG0020134:NG0020135:NG0020136:NG0020137:NG0020138:NG0020139:NG0020140:NG0020141:NG0020142:NG0020143:NG0020144:NG0020145:NG0020146:NG0020147:NG0020148:NG0020149:NG0020150:NG0020151:NG0020152:NG0020153:NG0020154:NG0020155:NG0020156:NG0020157:NG0020158:NG0020159:NG0020160:NG0020161:NG0020162:NG0020163:NG0020164:NG0020165:NG0020166:NG0020167:NG0020168:NG0020169:NG0020170:NG0020171:NG0020172:NG0020173:NG0020174:NG0020175:NG0020176:NG0020177:NG0020178:NG0020179:NG0020180:NG0020555:NG0020556:NG0020557	1:2:5:61:4:3:81	106:102	\N
61	test@domian.com	Oluwatobi	Olowolagba	280AB0357953BB958362096D40CB2E78	test@domian.com	13-APR-22 01.00.00.000000000 AM	Regular User	active	8107282467	21	\N	1	\N	\N	106:102	\N
121	compliance@gmail.com	test	test	280AB0357953BB958362096D40CB2E78	compliance@gmail.com	\N	\N	active	\N	\N	\N	\N	\N	\N	106:102	\N
162	abba.fauziya3236@mycompany.co	ABBA FAUZIYA	\N	\N	ABBA.FAUZIYA3236@MYCOMPANY.CO	19-AUG-22 02.36.17.640777000 PM	\N	active	\N	\N	\N	\N	\N	1:2:5:61:101:81	106:102	\N
202	charles.e@novajii.com	CHARLES	\N	\N	charles.e@novajii.com	\N	\N	active	\N	\N	\N	\N	NG0020002:NG0020003:NG0010001	61	106	oracle
223	augustine.e@novajii.com	Augustine Ejira	\N	\N	augustine.e@novajii.com	\N	\N	active	\N	\N	\N	\N	\N	\N	106	Macos
182	chiamaka.c@novajii.com	DAMARIS	\N	\N	chiamaka.c@novajii.com	13-APR-23 08.25.10.699134000 AM	\N	active	\N	\N	\N	\N	NG0020001:NG0010001	1:2:5:61:101:4:3:81	106	\N
81	favour.e@novajii.com	FAVOUR EFAM	Azeez	25F9E794323B453885F5181F1B624D0B	favour.e@novajii.com	13-APR-22 01.00.00.000000000 AM	Regular User	active	\N	21	\N	1	NG0020028:NG0020020:NG0020121:NG0020115:NG0020122:NG0020016:NG0020031:NG0020041:NG0020015:NG0020116:NG0020021:NG0020002:NG0020043:NG0020123:NG0020095:NG0020180:NG0020073:NG0020166:NG0020040:NG0020135:NG0020058:NG0020018:NG0020022:NG0020107:NG0020087:NG0020125:NG0020145:NG0020064:NG0020103:NG0020088:NG0020167:NG0020036:NG0020013:NG0020141:NG0020045:NG0020075:NG0020038:NG0020104:NG0020106:NG0020042:NG0020091:NG0020017:NG0020160:NG0020154:NG0020085:NG0020004:NG0020094:NG0020025:NG0020032:NG0020139:NG0020140:NG0020046:NG0020065:NG0020178:NG0020011:NG0020089:NG0020072:NG0020150:NG0020113:NG0020057:NG0020177:NG0020136:NG0020114:NG0020090:NG0020048:NG0020034:NG0020138:NG0020079:NG0020164:NG0020557:NG0020158:NG0020006:NG0020062:NG0020086:NG0020033:NG0020060:NG0020052:NG0020009:NG0020003:NG0020005:NG0020074:NG0020051:NG0020044:NG0020019:NG0020168:NG0020175:NG0020110:NG0020039:NG0020169:NG0020067:NG0020012:NG0020069:NG0020071:NG0020053:NG0020179:NG0020078:NG0020163:NG0020162:NG0020008:NG0020142:NG0020144:NG0020170:NG0020137:NG0020156:NG0020047:NG0020030:NG0020153:NG0020151:NG0020157:NG0020132:NG0020029:NG0020092:NG0020147:NG0020165:NG0020159:NG0020146:NG0020130:NG0020097:NG0020007:NG0020066:NG0020117:NG0020126:NG0020143:NG0020108:NG0020083:NG0020149:NG0020037:NG0020063:NG0020134:NG0020096:NG0020152:NG0020102:NG0020055:NG0020105:NG0020056:NG0020124:NG0020050:NG0020049:NG0020061:NG0020173:NG0020111:NG0020080:NG0020068:NG0020100:NG0020118:NG0020128:NG0020082:NG0020176:NG0020093:NG0020070:NG0020084:NG0020081:NG0020127:NG0020098:NG0020023:NG0020076:NG0020129:NG0020172:NG0020024:NG0020014:NG0020148:NG0020109:NG0020077:NG0020133:NG0020054:NG0020155:NG0020131:NG0020010:NG0020556:NG0010001:NG0020001:NG0020161:NG0020027:NG0020035:NG0020101:NG0020120:NG0020555:NG0020112:NG0020026:NG0020059:NG0020119:NG0020174:NG0020171:NG0020099	1:2:5:61:101:4:3:81	106:102	\N
222	lebechiuchey@gmail.com	\N	\N	\N	\N	\N	\N	active	\N	\N	\N	\N	\N	1:2:5:61:101:4:3:81	106	\N
\.


--
-- Name: alert_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.alert_id_seq', 240, true);


--
-- Name: am_account_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.am_account_type_id_seq', 1, false);


--
-- Name: am_customer_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.am_customer_account_id_seq', 1, false);


--
-- Name: am_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.am_customer_id_seq', 1, false);


--
-- Name: am_customer_profile_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.am_customer_profile_customer_id_seq', 1, false);


--
-- Name: am_customer_transaction_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.am_customer_transaction_profile_id_seq', 1, false);


--
-- Name: am_dormant_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.am_dormant_accounts_id_seq', 1, false);


--
-- Name: am_staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.am_staff_id_seq', 1, false);


--
-- Name: aml_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.aml_report_id_seq', 1, false);


--
-- Name: app_pep_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.app_pep_accounts_id_seq', 1, false);


--
-- Name: case_management_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.case_management_id_seq', 225, true);


--
-- Name: case_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.case_status_id_seq', 3, true);


--
-- Name: cases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.cases_id_seq', 1, false);


--
-- Name: cases_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.cases_id_seq1', 6, true);


--
-- Name: compliance_checklist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.compliance_checklist_id_seq', 1, false);


--
-- Name: compliance_stat_categ_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.compliance_stat_categ_id_seq', 7, true);


--
-- Name: compliance_statistics_new_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.compliance_statistics_new_id_seq', 45, true);


--
-- Name: comply_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.comply_id_seq', 1, false);


--
-- Name: ctl_alert_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.ctl_alert_group_id_seq', 3, true);


--
-- Name: ctl_collections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.ctl_collections_id_seq', 1, false);


--
-- Name: ctl_document_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.ctl_document_id_seq', 116, true);


--
-- Name: ctl_system_allocation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.ctl_system_allocation_id_seq', 8, true);


--
-- Name: ctl_system_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.ctl_system_category_id_seq', 13, true);


--
-- Name: ctl_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.ctl_system_id_seq', 4, true);


--
-- Name: ctr_report_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.ctr_report_types_id_seq', 1, false);


--
-- Name: department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.department_id_seq', 13, true);


--
-- Name: download_notifier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.download_notifier_id_seq', 39, true);


--
-- Name: download_queue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.download_queue_id_seq', 106, true);


--
-- Name: exception_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.exception_category_id_seq', 1, false);


--
-- Name: exception_frequency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.exception_frequency_id_seq', 6, true);


--
-- Name: exception_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.exception_logs_id_seq', 1, false);


--
-- Name: exception_process_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.exception_process_id_seq', 21, true);


--
-- Name: exception_process_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.exception_process_id_seq1', 22, true);


--
-- Name: exception_process_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.exception_process_status_id_seq', 1, false);


--
-- Name: exception_process_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.exception_process_type_id_seq', 16, true);


--
-- Name: exception_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.exception_status_id_seq', 1, false);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 2, true);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.jobs_id_seq', 33, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.migrations_id_seq', 58, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 53, true);


--
-- Name: priority_level_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.priority_level_id_seq', 3, true);


--
-- Name: st_stmt_entry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.st_stmt_entry_id_seq', 1, false);


--
-- Name: staffs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.staffs_id_seq', 3, true);


--
-- Name: str_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.str_transactions_id_seq', 3, true);


--
-- Name: teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.teams_id_seq', 1, false);


--
-- Name: users_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: icomply
--

SELECT pg_catalog.setval('public.users_id_seq1', 1, false);


--
-- Name: alert alert_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.alert
    ADD CONSTRAINT alert_pkey PRIMARY KEY (id);


--
-- Name: am_account_type am_account_type_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.am_account_type
    ADD CONSTRAINT am_account_type_pkey PRIMARY KEY (id);


--
-- Name: am_customer_account am_customer_account_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.am_customer_account
    ADD CONSTRAINT am_customer_account_pkey PRIMARY KEY (id);


--
-- Name: am_customer_bvn am_customer_bvn_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.am_customer_bvn
    ADD CONSTRAINT am_customer_bvn_pkey PRIMARY KEY (customer_id);


--
-- Name: am_customer_education_level am_customer_education_level_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.am_customer_education_level
    ADD CONSTRAINT am_customer_education_level_pkey PRIMARY KEY (id);


--
-- Name: am_customer_individual_profile am_customer_individual_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.am_customer_individual_profile
    ADD CONSTRAINT am_customer_individual_profile_pkey PRIMARY KEY (id);


--
-- Name: am_customer_language am_customer_language_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.am_customer_language
    ADD CONSTRAINT am_customer_language_pkey PRIMARY KEY (id);


--
-- Name: am_customer_phone am_customer_phone_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.am_customer_phone
    ADD CONSTRAINT am_customer_phone_pkey PRIMARY KEY (row_id);


--
-- Name: am_customer_priority am_customer_priority_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.am_customer_priority
    ADD CONSTRAINT am_customer_priority_pkey PRIMARY KEY (customer_id);


--
-- Name: am_customer_tier am_customer_tier_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.am_customer_tier
    ADD CONSTRAINT am_customer_tier_pkey PRIMARY KEY (tier_id);


--
-- Name: am_customer_transaction_profile am_customer_transaction_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.am_customer_transaction_profile
    ADD CONSTRAINT am_customer_transaction_profile_pkey PRIMARY KEY (id);


--
-- Name: am_dormant_accounts am_dormant_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.am_dormant_accounts
    ADD CONSTRAINT am_dormant_accounts_pkey PRIMARY KEY (id);


--
-- Name: am_staff am_staff_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.am_staff
    ADD CONSTRAINT am_staff_pkey PRIMARY KEY (id);


--
-- Name: aml_report aml_report_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.aml_report
    ADD CONSTRAINT aml_report_pkey PRIMARY KEY (id);


--
-- Name: app_pep_accounts app_pep_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.app_pep_accounts
    ADD CONSTRAINT app_pep_accounts_pkey PRIMARY KEY (id);


--
-- Name: cache cache_key_unique; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_key_unique UNIQUE (key);


--
-- Name: case_management case_management_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.case_management
    ADD CONSTRAINT case_management_pkey PRIMARY KEY (id);


--
-- Name: case_status case_status_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.case_status
    ADD CONSTRAINT case_status_pkey PRIMARY KEY (id);


--
-- Name: cases cases_pkey1; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.cases
    ADD CONSTRAINT cases_pkey1 PRIMARY KEY (id);


--
-- Name: compliance_checklist compliance_checklist_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.compliance_checklist
    ADD CONSTRAINT compliance_checklist_pkey PRIMARY KEY (id);


--
-- Name: compliance_stat_categ compliance_stat_categ_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.compliance_stat_categ
    ADD CONSTRAINT compliance_stat_categ_pkey PRIMARY KEY (id);


--
-- Name: compliance_statistics compliance_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.compliance_statistics
    ADD CONSTRAINT compliance_statistics_pkey PRIMARY KEY (id);


--
-- Name: comply comply_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.comply
    ADD CONSTRAINT comply_pkey PRIMARY KEY (id);


--
-- Name: ctl_branch ctl_branch_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.ctl_branch
    ADD CONSTRAINT ctl_branch_pkey PRIMARY KEY (branch_code);


--
-- Name: ctl_collections ctl_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.ctl_collections
    ADD CONSTRAINT ctl_collections_pkey PRIMARY KEY (id);


--
-- Name: ctl_control_officer ctl_control_officer_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.ctl_control_officer
    ADD CONSTRAINT ctl_control_officer_pkey PRIMARY KEY (id);


--
-- Name: ctl_currency ctl_currency_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.ctl_currency
    ADD CONSTRAINT ctl_currency_pkey PRIMARY KEY (currency_id);


--
-- Name: ctl_document ctl_document_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.ctl_document
    ADD CONSTRAINT ctl_document_pkey PRIMARY KEY (id);


--
-- Name: ctl_document_type ctl_document_type_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.ctl_document_type
    ADD CONSTRAINT ctl_document_type_pkey PRIMARY KEY (id);


--
-- Name: ctl_overdrawn_accounts ctl_overdrawn_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.ctl_overdrawn_accounts
    ADD CONSTRAINT ctl_overdrawn_accounts_pkey PRIMARY KEY (customer_id);


--
-- Name: ctl_system_category ctl_system_category_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.ctl_system_category
    ADD CONSTRAINT ctl_system_category_pkey PRIMARY KEY (id);


--
-- Name: ctl_system ctl_system_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.ctl_system
    ADD CONSTRAINT ctl_system_pkey PRIMARY KEY (id);


--
-- Name: ctl_alert_group ctr_alert_group_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.ctl_alert_group
    ADD CONSTRAINT ctr_alert_group_pkey PRIMARY KEY (id);


--
-- Name: ctr_report_types ctr_report_types_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.ctr_report_types
    ADD CONSTRAINT ctr_report_types_pkey PRIMARY KEY (id);


--
-- Name: ctr_transactions ctr_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.ctr_transactions
    ADD CONSTRAINT ctr_transactions_pkey PRIMARY KEY (id);


--
-- Name: department department_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (id);


--
-- Name: download_notifier download_notifier_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.download_notifier
    ADD CONSTRAINT download_notifier_pkey PRIMARY KEY (id);


--
-- Name: download_queue download_queue_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.download_queue
    ADD CONSTRAINT download_queue_pkey PRIMARY KEY (id);


--
-- Name: exception_category exception_category_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.exception_category
    ADD CONSTRAINT exception_category_pkey PRIMARY KEY (id);


--
-- Name: exception_frequency exception_frequency_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.exception_frequency
    ADD CONSTRAINT exception_frequency_pkey PRIMARY KEY (id);


--
-- Name: exceptions_logs exception_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.exceptions_logs
    ADD CONSTRAINT exception_logs_pkey PRIMARY KEY (id);


--
-- Name: exception_process_ exception_process_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.exception_process_
    ADD CONSTRAINT exception_process_pkey PRIMARY KEY (id);


--
-- Name: exception_process exception_process_pkey1; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.exception_process
    ADD CONSTRAINT exception_process_pkey1 PRIMARY KEY (id);


--
-- Name: exception_process_status exception_process_status_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.exception_process_status
    ADD CONSTRAINT exception_process_status_pkey PRIMARY KEY (id);


--
-- Name: exception_process_type exception_process_type_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.exception_process_type
    ADD CONSTRAINT exception_process_type_pkey PRIMARY KEY (id);


--
-- Name: exception_status exception_status_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.exception_status
    ADD CONSTRAINT exception_status_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: am_customer_profile mytable_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.am_customer_profile
    ADD CONSTRAINT mytable_pkey PRIMARY KEY (customer_id);


--
-- Name: am_customer_email mytable_pkey1; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.am_customer_email
    ADD CONSTRAINT mytable_pkey1 PRIMARY KEY (customer_id);


--
-- Name: compliance_statisticss mytable_pkey2; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.compliance_statisticss
    ADD CONSTRAINT mytable_pkey2 PRIMARY KEY (id);


--
-- Name: overdrawn_accounts overdrawn_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.overdrawn_accounts
    ADD CONSTRAINT overdrawn_accounts_pkey PRIMARY KEY (customer_name);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: priority_level priority_level_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.priority_level
    ADD CONSTRAINT priority_level_pkey PRIMARY KEY (id);


--
-- Name: st_stmt_entry st_stmt_entry_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.st_stmt_entry
    ADD CONSTRAINT st_stmt_entry_pkey PRIMARY KEY (id);


--
-- Name: staffs staffs_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.staffs
    ADD CONSTRAINT staffs_pkey PRIMARY KEY (id);


--
-- Name: str_transactions str_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.str_transactions
    ADD CONSTRAINT str_transactions_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey1; Type: CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey1 PRIMARY KEY (id);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: icomply
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: icomply
--

CREATE INDEX password_resets_email_index ON public.password_resets USING btree (email);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: icomply
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: case_management case_management_department_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: icomply
--

ALTER TABLE ONLY public.case_management
    ADD CONSTRAINT case_management_department_id_foreign FOREIGN KEY (department_id) REFERENCES public.department(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

