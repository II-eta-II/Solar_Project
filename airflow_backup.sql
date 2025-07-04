--
-- PostgreSQL database dump
--

-- Dumped from database version 13.21 (Debian 13.21-1.pgdg120+1)
-- Dumped by pg_dump version 13.21 (Debian 13.21-1.pgdg120+1)

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
-- Name: ab_permission; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.ab_permission (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.ab_permission OWNER TO airflow;

--
-- Name: ab_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.ab_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_permission_id_seq OWNER TO airflow;

--
-- Name: ab_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.ab_permission_id_seq OWNED BY public.ab_permission.id;


--
-- Name: ab_permission_view; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.ab_permission_view (
    id integer NOT NULL,
    permission_id integer,
    view_menu_id integer
);


ALTER TABLE public.ab_permission_view OWNER TO airflow;

--
-- Name: ab_permission_view_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.ab_permission_view_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_permission_view_id_seq OWNER TO airflow;

--
-- Name: ab_permission_view_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.ab_permission_view_id_seq OWNED BY public.ab_permission_view.id;


--
-- Name: ab_permission_view_role; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.ab_permission_view_role (
    id integer NOT NULL,
    permission_view_id integer,
    role_id integer
);


ALTER TABLE public.ab_permission_view_role OWNER TO airflow;

--
-- Name: ab_permission_view_role_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.ab_permission_view_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_permission_view_role_id_seq OWNER TO airflow;

--
-- Name: ab_permission_view_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.ab_permission_view_role_id_seq OWNED BY public.ab_permission_view_role.id;


--
-- Name: ab_register_user; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.ab_register_user (
    id integer NOT NULL,
    first_name character varying(256) NOT NULL,
    last_name character varying(256) NOT NULL,
    username character varying(512) NOT NULL,
    password character varying(256),
    email character varying(512) NOT NULL,
    registration_date timestamp without time zone,
    registration_hash character varying(256)
);


ALTER TABLE public.ab_register_user OWNER TO airflow;

--
-- Name: ab_register_user_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.ab_register_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_register_user_id_seq OWNER TO airflow;

--
-- Name: ab_register_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.ab_register_user_id_seq OWNED BY public.ab_register_user.id;


--
-- Name: ab_role; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.ab_role (
    id integer NOT NULL,
    name character varying(64) NOT NULL
);


ALTER TABLE public.ab_role OWNER TO airflow;

--
-- Name: ab_role_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.ab_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_role_id_seq OWNER TO airflow;

--
-- Name: ab_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.ab_role_id_seq OWNED BY public.ab_role.id;


--
-- Name: ab_user; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.ab_user (
    id integer NOT NULL,
    first_name character varying(256) NOT NULL,
    last_name character varying(256) NOT NULL,
    username character varying(512) NOT NULL,
    password character varying(256),
    active boolean,
    email character varying(512) NOT NULL,
    last_login timestamp without time zone,
    login_count integer,
    fail_login_count integer,
    created_on timestamp without time zone,
    changed_on timestamp without time zone,
    created_by_fk integer,
    changed_by_fk integer
);


ALTER TABLE public.ab_user OWNER TO airflow;

--
-- Name: ab_user_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.ab_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_user_id_seq OWNER TO airflow;

--
-- Name: ab_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.ab_user_id_seq OWNED BY public.ab_user.id;


--
-- Name: ab_user_role; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.ab_user_role (
    id integer NOT NULL,
    user_id integer,
    role_id integer
);


ALTER TABLE public.ab_user_role OWNER TO airflow;

--
-- Name: ab_user_role_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.ab_user_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_user_role_id_seq OWNER TO airflow;

--
-- Name: ab_user_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.ab_user_role_id_seq OWNED BY public.ab_user_role.id;


--
-- Name: ab_view_menu; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.ab_view_menu (
    id integer NOT NULL,
    name character varying(250) NOT NULL
);


ALTER TABLE public.ab_view_menu OWNER TO airflow;

--
-- Name: ab_view_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.ab_view_menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ab_view_menu_id_seq OWNER TO airflow;

--
-- Name: ab_view_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.ab_view_menu_id_seq OWNED BY public.ab_view_menu.id;


--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO airflow;

--
-- Name: callback_request; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.callback_request (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    priority_weight integer NOT NULL,
    callback_data json NOT NULL,
    callback_type character varying(20) NOT NULL,
    processor_subdir character varying(2000)
);


ALTER TABLE public.callback_request OWNER TO airflow;

--
-- Name: callback_request_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.callback_request_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.callback_request_id_seq OWNER TO airflow;

--
-- Name: callback_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.callback_request_id_seq OWNED BY public.callback_request.id;


--
-- Name: connection; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.connection (
    id integer NOT NULL,
    conn_id character varying(250) NOT NULL,
    conn_type character varying(500) NOT NULL,
    description text,
    host character varying(500),
    schema character varying(500),
    login text,
    password text,
    port integer,
    is_encrypted boolean,
    is_extra_encrypted boolean,
    extra text
);


ALTER TABLE public.connection OWNER TO airflow;

--
-- Name: connection_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.connection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.connection_id_seq OWNER TO airflow;

--
-- Name: connection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.connection_id_seq OWNED BY public.connection.id;


--
-- Name: dag; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.dag (
    dag_id character varying(250) NOT NULL,
    root_dag_id character varying(250),
    is_paused boolean,
    is_subdag boolean,
    is_active boolean,
    last_parsed_time timestamp with time zone,
    last_pickled timestamp with time zone,
    last_expired timestamp with time zone,
    scheduler_lock boolean,
    pickle_id integer,
    fileloc character varying(2000),
    processor_subdir character varying(2000),
    owners character varying(2000),
    dag_display_name character varying(2000),
    description text,
    default_view character varying(25),
    schedule_interval text,
    timetable_description character varying(1000),
    dataset_expression json,
    max_active_tasks integer NOT NULL,
    max_active_runs integer,
    max_consecutive_failed_dag_runs integer NOT NULL,
    has_task_concurrency_limits boolean NOT NULL,
    has_import_errors boolean DEFAULT false,
    next_dagrun timestamp with time zone,
    next_dagrun_data_interval_start timestamp with time zone,
    next_dagrun_data_interval_end timestamp with time zone,
    next_dagrun_create_after timestamp with time zone
);


ALTER TABLE public.dag OWNER TO airflow;

--
-- Name: dag_code; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.dag_code (
    fileloc_hash bigint NOT NULL,
    fileloc character varying(2000) NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    source_code text NOT NULL
);


ALTER TABLE public.dag_code OWNER TO airflow;

--
-- Name: dag_owner_attributes; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.dag_owner_attributes (
    dag_id character varying(250) NOT NULL,
    owner character varying(500) NOT NULL,
    link character varying(500) NOT NULL
);


ALTER TABLE public.dag_owner_attributes OWNER TO airflow;

--
-- Name: dag_pickle; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.dag_pickle (
    id integer NOT NULL,
    pickle bytea,
    created_dttm timestamp with time zone,
    pickle_hash bigint
);


ALTER TABLE public.dag_pickle OWNER TO airflow;

--
-- Name: dag_pickle_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.dag_pickle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dag_pickle_id_seq OWNER TO airflow;

--
-- Name: dag_pickle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.dag_pickle_id_seq OWNED BY public.dag_pickle.id;


--
-- Name: dag_priority_parsing_request; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.dag_priority_parsing_request (
    id character varying(32) NOT NULL,
    fileloc character varying(2000) NOT NULL
);


ALTER TABLE public.dag_priority_parsing_request OWNER TO airflow;

--
-- Name: dag_run; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.dag_run (
    id integer NOT NULL,
    dag_id character varying(250) NOT NULL,
    queued_at timestamp with time zone,
    execution_date timestamp with time zone NOT NULL,
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    state character varying(50),
    run_id character varying(250) NOT NULL,
    creating_job_id integer,
    external_trigger boolean,
    run_type character varying(50) NOT NULL,
    conf bytea,
    data_interval_start timestamp with time zone,
    data_interval_end timestamp with time zone,
    last_scheduling_decision timestamp with time zone,
    dag_hash character varying(32),
    log_template_id integer,
    updated_at timestamp with time zone,
    clear_number integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.dag_run OWNER TO airflow;

--
-- Name: dag_run_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.dag_run_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dag_run_id_seq OWNER TO airflow;

--
-- Name: dag_run_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.dag_run_id_seq OWNED BY public.dag_run.id;


--
-- Name: dag_run_note; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.dag_run_note (
    user_id integer,
    dag_run_id integer NOT NULL,
    content character varying(1000),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.dag_run_note OWNER TO airflow;

--
-- Name: dag_schedule_dataset_alias_reference; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.dag_schedule_dataset_alias_reference (
    alias_id integer NOT NULL,
    dag_id character varying(250) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.dag_schedule_dataset_alias_reference OWNER TO airflow;

--
-- Name: dag_schedule_dataset_reference; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.dag_schedule_dataset_reference (
    dataset_id integer NOT NULL,
    dag_id character varying(250) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.dag_schedule_dataset_reference OWNER TO airflow;

--
-- Name: dag_tag; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.dag_tag (
    name character varying(100) NOT NULL,
    dag_id character varying(250) NOT NULL
);


ALTER TABLE public.dag_tag OWNER TO airflow;

--
-- Name: dag_warning; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.dag_warning (
    dag_id character varying(250) NOT NULL,
    warning_type character varying(50) NOT NULL,
    message text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.dag_warning OWNER TO airflow;

--
-- Name: dagrun_dataset_event; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.dagrun_dataset_event (
    dag_run_id integer NOT NULL,
    event_id integer NOT NULL
);


ALTER TABLE public.dagrun_dataset_event OWNER TO airflow;

--
-- Name: dataset; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.dataset (
    id integer NOT NULL,
    uri character varying(3000) NOT NULL,
    extra json NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    is_orphaned boolean DEFAULT false NOT NULL
);


ALTER TABLE public.dataset OWNER TO airflow;

--
-- Name: dataset_alias; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.dataset_alias (
    id integer NOT NULL,
    name character varying(3000) NOT NULL
);


ALTER TABLE public.dataset_alias OWNER TO airflow;

--
-- Name: dataset_alias_dataset; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.dataset_alias_dataset (
    alias_id integer NOT NULL,
    dataset_id integer NOT NULL
);


ALTER TABLE public.dataset_alias_dataset OWNER TO airflow;

--
-- Name: dataset_alias_dataset_event; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.dataset_alias_dataset_event (
    alias_id integer NOT NULL,
    event_id integer NOT NULL
);


ALTER TABLE public.dataset_alias_dataset_event OWNER TO airflow;

--
-- Name: dataset_alias_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.dataset_alias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dataset_alias_id_seq OWNER TO airflow;

--
-- Name: dataset_alias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.dataset_alias_id_seq OWNED BY public.dataset_alias.id;


--
-- Name: dataset_dag_run_queue; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.dataset_dag_run_queue (
    dataset_id integer NOT NULL,
    target_dag_id character varying(250) NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.dataset_dag_run_queue OWNER TO airflow;

--
-- Name: dataset_event; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.dataset_event (
    id integer NOT NULL,
    dataset_id integer NOT NULL,
    extra json NOT NULL,
    source_task_id character varying(250),
    source_dag_id character varying(250),
    source_run_id character varying(250),
    source_map_index integer DEFAULT '-1'::integer,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.dataset_event OWNER TO airflow;

--
-- Name: dataset_event_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.dataset_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dataset_event_id_seq OWNER TO airflow;

--
-- Name: dataset_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.dataset_event_id_seq OWNED BY public.dataset_event.id;


--
-- Name: dataset_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.dataset_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dataset_id_seq OWNER TO airflow;

--
-- Name: dataset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.dataset_id_seq OWNED BY public.dataset.id;


--
-- Name: import_error; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.import_error (
    id integer NOT NULL,
    "timestamp" timestamp with time zone,
    filename character varying(1024),
    stacktrace text,
    processor_subdir character varying(2000)
);


ALTER TABLE public.import_error OWNER TO airflow;

--
-- Name: import_error_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.import_error_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.import_error_id_seq OWNER TO airflow;

--
-- Name: import_error_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.import_error_id_seq OWNED BY public.import_error.id;


--
-- Name: job; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.job (
    id integer NOT NULL,
    dag_id character varying(250),
    state character varying(20),
    job_type character varying(30),
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    latest_heartbeat timestamp with time zone,
    executor_class character varying(500),
    hostname character varying(500),
    unixname character varying(1000)
);


ALTER TABLE public.job OWNER TO airflow;

--
-- Name: job_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.job_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_id_seq OWNER TO airflow;

--
-- Name: job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.job_id_seq OWNED BY public.job.id;


--
-- Name: log; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.log (
    id integer NOT NULL,
    dttm timestamp with time zone,
    dag_id character varying(250),
    task_id character varying(250),
    map_index integer,
    event character varying(60),
    execution_date timestamp with time zone,
    run_id character varying(250),
    owner character varying(500),
    owner_display_name character varying(500),
    extra text,
    try_number integer
);


ALTER TABLE public.log OWNER TO airflow;

--
-- Name: log_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_id_seq OWNER TO airflow;

--
-- Name: log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.log_id_seq OWNED BY public.log.id;


--
-- Name: log_template; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.log_template (
    id integer NOT NULL,
    filename text NOT NULL,
    elasticsearch_id text NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.log_template OWNER TO airflow;

--
-- Name: log_template_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.log_template_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_template_id_seq OWNER TO airflow;

--
-- Name: log_template_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.log_template_id_seq OWNED BY public.log_template.id;


--
-- Name: rendered_task_instance_fields; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.rendered_task_instance_fields (
    dag_id character varying(250) NOT NULL,
    task_id character varying(250) NOT NULL,
    run_id character varying(250) NOT NULL,
    map_index integer DEFAULT '-1'::integer NOT NULL,
    rendered_fields json NOT NULL,
    k8s_pod_yaml json
);


ALTER TABLE public.rendered_task_instance_fields OWNER TO airflow;

--
-- Name: serialized_dag; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.serialized_dag (
    dag_id character varying(250) NOT NULL,
    fileloc character varying(2000) NOT NULL,
    fileloc_hash bigint NOT NULL,
    data json,
    data_compressed bytea,
    last_updated timestamp with time zone NOT NULL,
    dag_hash character varying(32) NOT NULL,
    processor_subdir character varying(2000)
);


ALTER TABLE public.serialized_dag OWNER TO airflow;

--
-- Name: session; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.session (
    id integer NOT NULL,
    session_id character varying(255),
    data bytea,
    expiry timestamp without time zone
);


ALTER TABLE public.session OWNER TO airflow;

--
-- Name: session_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.session_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.session_id_seq OWNER TO airflow;

--
-- Name: session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.session_id_seq OWNED BY public.session.id;


--
-- Name: sla_miss; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.sla_miss (
    task_id character varying(250) NOT NULL,
    dag_id character varying(250) NOT NULL,
    execution_date timestamp with time zone NOT NULL,
    email_sent boolean,
    "timestamp" timestamp with time zone,
    description text,
    notification_sent boolean
);


ALTER TABLE public.sla_miss OWNER TO airflow;

--
-- Name: slot_pool; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.slot_pool (
    id integer NOT NULL,
    pool character varying(256),
    slots integer,
    description text,
    include_deferred boolean NOT NULL
);


ALTER TABLE public.slot_pool OWNER TO airflow;

--
-- Name: slot_pool_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.slot_pool_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.slot_pool_id_seq OWNER TO airflow;

--
-- Name: slot_pool_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.slot_pool_id_seq OWNED BY public.slot_pool.id;


--
-- Name: task_fail; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.task_fail (
    id integer NOT NULL,
    task_id character varying(250) NOT NULL,
    dag_id character varying(250) NOT NULL,
    run_id character varying(250) NOT NULL,
    map_index integer DEFAULT '-1'::integer NOT NULL,
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    duration integer
);


ALTER TABLE public.task_fail OWNER TO airflow;

--
-- Name: task_fail_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.task_fail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_fail_id_seq OWNER TO airflow;

--
-- Name: task_fail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.task_fail_id_seq OWNED BY public.task_fail.id;


--
-- Name: task_instance; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.task_instance (
    task_id character varying(250) NOT NULL,
    dag_id character varying(250) NOT NULL,
    run_id character varying(250) NOT NULL,
    map_index integer DEFAULT '-1'::integer NOT NULL,
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    duration double precision,
    state character varying(20),
    try_number integer,
    max_tries integer DEFAULT '-1'::integer,
    hostname character varying(1000),
    unixname character varying(1000),
    job_id integer,
    pool character varying(256) NOT NULL,
    pool_slots integer NOT NULL,
    queue character varying(256),
    priority_weight integer,
    operator character varying(1000),
    custom_operator_name character varying(1000),
    queued_dttm timestamp with time zone,
    queued_by_job_id integer,
    pid integer,
    executor character varying(1000),
    executor_config bytea,
    updated_at timestamp with time zone,
    rendered_map_index character varying(250),
    external_executor_id character varying(250),
    trigger_id integer,
    trigger_timeout timestamp without time zone,
    next_method character varying(1000),
    next_kwargs json,
    task_display_name character varying(2000)
);


ALTER TABLE public.task_instance OWNER TO airflow;

--
-- Name: task_instance_history; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.task_instance_history (
    id integer NOT NULL,
    task_id character varying(250) NOT NULL,
    dag_id character varying(250) NOT NULL,
    run_id character varying(250) NOT NULL,
    map_index integer DEFAULT '-1'::integer NOT NULL,
    try_number integer NOT NULL,
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    duration double precision,
    state character varying(20),
    max_tries integer DEFAULT '-1'::integer,
    hostname character varying(1000),
    unixname character varying(1000),
    job_id integer,
    pool character varying(256) NOT NULL,
    pool_slots integer NOT NULL,
    queue character varying(256),
    priority_weight integer,
    operator character varying(1000),
    custom_operator_name character varying(1000),
    queued_dttm timestamp with time zone,
    queued_by_job_id integer,
    pid integer,
    executor character varying(1000),
    executor_config bytea,
    updated_at timestamp with time zone,
    rendered_map_index character varying(250),
    external_executor_id character varying(250),
    trigger_id integer,
    trigger_timeout timestamp without time zone,
    next_method character varying(1000),
    next_kwargs json,
    task_display_name character varying(2000)
);


ALTER TABLE public.task_instance_history OWNER TO airflow;

--
-- Name: task_instance_history_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.task_instance_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_instance_history_id_seq OWNER TO airflow;

--
-- Name: task_instance_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.task_instance_history_id_seq OWNED BY public.task_instance_history.id;


--
-- Name: task_instance_note; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.task_instance_note (
    user_id integer,
    task_id character varying(250) NOT NULL,
    dag_id character varying(250) NOT NULL,
    run_id character varying(250) NOT NULL,
    map_index integer NOT NULL,
    content character varying(1000),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.task_instance_note OWNER TO airflow;

--
-- Name: task_map; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.task_map (
    dag_id character varying(250) NOT NULL,
    task_id character varying(250) NOT NULL,
    run_id character varying(250) NOT NULL,
    map_index integer NOT NULL,
    length integer NOT NULL,
    keys json,
    CONSTRAINT ck_task_map_task_map_length_not_negative CHECK ((length >= 0))
);


ALTER TABLE public.task_map OWNER TO airflow;

--
-- Name: task_outlet_dataset_reference; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.task_outlet_dataset_reference (
    dataset_id integer NOT NULL,
    dag_id character varying(250) NOT NULL,
    task_id character varying(250) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.task_outlet_dataset_reference OWNER TO airflow;

--
-- Name: task_reschedule; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.task_reschedule (
    id integer NOT NULL,
    task_id character varying(250) NOT NULL,
    dag_id character varying(250) NOT NULL,
    run_id character varying(250) NOT NULL,
    map_index integer DEFAULT '-1'::integer NOT NULL,
    try_number integer NOT NULL,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone NOT NULL,
    duration integer NOT NULL,
    reschedule_date timestamp with time zone NOT NULL
);


ALTER TABLE public.task_reschedule OWNER TO airflow;

--
-- Name: task_reschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.task_reschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_reschedule_id_seq OWNER TO airflow;

--
-- Name: task_reschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.task_reschedule_id_seq OWNED BY public.task_reschedule.id;


--
-- Name: trigger; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.trigger (
    id integer NOT NULL,
    classpath character varying(1000) NOT NULL,
    kwargs text NOT NULL,
    created_date timestamp with time zone NOT NULL,
    triggerer_id integer
);


ALTER TABLE public.trigger OWNER TO airflow;

--
-- Name: trigger_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.trigger_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trigger_id_seq OWNER TO airflow;

--
-- Name: trigger_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.trigger_id_seq OWNED BY public.trigger.id;


--
-- Name: variable; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.variable (
    id integer NOT NULL,
    key character varying(250),
    val text,
    description text,
    is_encrypted boolean
);


ALTER TABLE public.variable OWNER TO airflow;

--
-- Name: variable_id_seq; Type: SEQUENCE; Schema: public; Owner: airflow
--

CREATE SEQUENCE public.variable_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.variable_id_seq OWNER TO airflow;

--
-- Name: variable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airflow
--

ALTER SEQUENCE public.variable_id_seq OWNED BY public.variable.id;


--
-- Name: xcom; Type: TABLE; Schema: public; Owner: airflow
--

CREATE TABLE public.xcom (
    dag_run_id integer NOT NULL,
    task_id character varying(250) NOT NULL,
    map_index integer DEFAULT '-1'::integer NOT NULL,
    key character varying(512) NOT NULL,
    dag_id character varying(250) NOT NULL,
    run_id character varying(250) NOT NULL,
    value bytea,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.xcom OWNER TO airflow;

--
-- Name: ab_permission id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_permission ALTER COLUMN id SET DEFAULT nextval('public.ab_permission_id_seq'::regclass);


--
-- Name: ab_permission_view id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_permission_view ALTER COLUMN id SET DEFAULT nextval('public.ab_permission_view_id_seq'::regclass);


--
-- Name: ab_permission_view_role id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_permission_view_role ALTER COLUMN id SET DEFAULT nextval('public.ab_permission_view_role_id_seq'::regclass);


--
-- Name: ab_register_user id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_register_user ALTER COLUMN id SET DEFAULT nextval('public.ab_register_user_id_seq'::regclass);


--
-- Name: ab_role id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_role ALTER COLUMN id SET DEFAULT nextval('public.ab_role_id_seq'::regclass);


--
-- Name: ab_user id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_user ALTER COLUMN id SET DEFAULT nextval('public.ab_user_id_seq'::regclass);


--
-- Name: ab_user_role id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_user_role ALTER COLUMN id SET DEFAULT nextval('public.ab_user_role_id_seq'::regclass);


--
-- Name: ab_view_menu id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_view_menu ALTER COLUMN id SET DEFAULT nextval('public.ab_view_menu_id_seq'::regclass);


--
-- Name: callback_request id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.callback_request ALTER COLUMN id SET DEFAULT nextval('public.callback_request_id_seq'::regclass);


--
-- Name: connection id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.connection ALTER COLUMN id SET DEFAULT nextval('public.connection_id_seq'::regclass);


--
-- Name: dag_pickle id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_pickle ALTER COLUMN id SET DEFAULT nextval('public.dag_pickle_id_seq'::regclass);


--
-- Name: dag_run id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_run ALTER COLUMN id SET DEFAULT nextval('public.dag_run_id_seq'::regclass);


--
-- Name: dataset id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dataset ALTER COLUMN id SET DEFAULT nextval('public.dataset_id_seq'::regclass);


--
-- Name: dataset_alias id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dataset_alias ALTER COLUMN id SET DEFAULT nextval('public.dataset_alias_id_seq'::regclass);


--
-- Name: dataset_event id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dataset_event ALTER COLUMN id SET DEFAULT nextval('public.dataset_event_id_seq'::regclass);


--
-- Name: import_error id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.import_error ALTER COLUMN id SET DEFAULT nextval('public.import_error_id_seq'::regclass);


--
-- Name: job id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.job ALTER COLUMN id SET DEFAULT nextval('public.job_id_seq'::regclass);


--
-- Name: log id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.log ALTER COLUMN id SET DEFAULT nextval('public.log_id_seq'::regclass);


--
-- Name: log_template id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.log_template ALTER COLUMN id SET DEFAULT nextval('public.log_template_id_seq'::regclass);


--
-- Name: session id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.session ALTER COLUMN id SET DEFAULT nextval('public.session_id_seq'::regclass);


--
-- Name: slot_pool id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.slot_pool ALTER COLUMN id SET DEFAULT nextval('public.slot_pool_id_seq'::regclass);


--
-- Name: task_fail id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_fail ALTER COLUMN id SET DEFAULT nextval('public.task_fail_id_seq'::regclass);


--
-- Name: task_instance_history id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_instance_history ALTER COLUMN id SET DEFAULT nextval('public.task_instance_history_id_seq'::regclass);


--
-- Name: task_reschedule id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_reschedule ALTER COLUMN id SET DEFAULT nextval('public.task_reschedule_id_seq'::regclass);


--
-- Name: trigger id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.trigger ALTER COLUMN id SET DEFAULT nextval('public.trigger_id_seq'::regclass);


--
-- Name: variable id; Type: DEFAULT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.variable ALTER COLUMN id SET DEFAULT nextval('public.variable_id_seq'::regclass);


--
-- Data for Name: ab_permission; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.ab_permission (id, name) FROM stdin;
1	can_edit
2	can_read
3	can_create
4	can_delete
5	menu_access
\.


--
-- Data for Name: ab_permission_view; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.ab_permission_view (id, permission_id, view_menu_id) FROM stdin;
1	1	4
2	2	4
3	1	5
4	2	5
5	1	6
6	2	6
7	3	8
8	2	8
9	1	8
10	4	8
11	5	9
12	5	10
13	3	11
14	2	11
15	1	11
16	4	11
17	5	12
18	2	13
19	5	14
20	2	15
21	5	16
22	2	17
23	5	18
24	2	19
25	5	20
26	3	23
27	2	23
28	1	23
29	4	23
30	5	23
31	5	24
32	2	25
33	5	25
34	2	26
35	5	26
36	3	27
37	2	27
38	1	27
39	4	27
40	1	28
41	5	27
42	4	28
43	2	28
44	5	29
45	5	30
46	4	30
47	2	30
48	3	31
49	3	30
50	2	31
51	1	31
52	4	31
53	5	31
54	2	32
55	5	32
56	2	33
57	5	33
58	2	34
59	5	34
60	3	35
61	2	35
62	1	35
63	4	35
64	5	35
65	2	36
66	5	36
67	4	36
68	1	36
69	2	37
70	5	37
71	2	38
72	5	38
73	3	39
74	2	39
75	1	39
76	4	39
77	5	39
78	2	40
79	4	40
80	5	40
81	5	42
82	5	46
83	5	47
84	5	48
85	5	49
86	5	50
87	4	46
88	2	46
89	1	46
90	2	42
91	2	51
92	2	48
93	2	47
94	2	52
95	2	53
96	2	54
97	2	55
98	3	48
99	4	48
100	1	56
101	4	56
102	2	56
103	5	57
104	4	57
105	2	57
106	3	57
\.


--
-- Data for Name: ab_permission_view_role; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.ab_permission_view_role (id, permission_view_id, role_id) FROM stdin;
1	1	1
2	2	1
3	3	1
4	4	1
5	5	1
6	6	1
7	7	1
8	8	1
9	9	1
10	10	1
11	11	1
12	12	1
13	13	1
14	14	1
15	15	1
16	16	1
17	17	1
18	18	1
19	19	1
20	20	1
21	21	1
22	22	1
23	23	1
24	24	1
25	25	1
26	26	1
27	27	1
28	28	1
29	29	1
30	30	1
31	31	1
32	32	1
33	33	1
34	34	1
35	35	1
36	36	1
37	37	1
38	38	1
39	39	1
40	41	1
41	44	1
42	48	1
43	50	1
44	51	1
45	52	1
46	53	1
47	54	1
48	55	1
49	56	1
50	57	1
51	58	1
52	59	1
53	60	1
54	61	1
55	62	1
56	63	1
57	64	1
58	65	1
59	66	1
60	67	1
61	68	1
62	69	1
63	70	1
64	71	1
65	72	1
66	73	1
67	74	1
68	75	1
69	76	1
70	77	1
71	78	1
72	79	1
73	80	1
74	81	1
75	82	1
76	83	1
77	84	1
78	85	1
79	86	1
80	88	3
81	90	3
82	91	3
83	27	3
84	92	3
85	93	3
86	74	3
87	94	3
88	95	3
89	32	3
90	4	3
91	3	3
92	6	3
93	5	3
94	65	3
95	50	3
96	96	3
97	78	3
98	97	3
99	31	3
100	82	3
101	81	3
102	30	3
103	84	3
104	83	3
105	85	3
106	86	3
107	33	3
108	66	3
109	53	3
110	88	4
111	90	4
112	91	4
113	27	4
114	92	4
115	93	4
116	74	4
117	94	4
118	95	4
119	32	4
120	4	4
121	3	4
122	6	4
123	5	4
124	65	4
125	50	4
126	96	4
127	78	4
128	97	4
129	31	4
130	82	4
131	81	4
132	30	4
133	84	4
134	83	4
135	85	4
136	86	4
137	33	4
138	66	4
139	53	4
140	89	4
141	87	4
142	48	4
143	51	4
144	52	4
145	26	4
146	28	4
147	29	4
148	98	4
149	88	5
150	90	5
151	91	5
152	27	5
153	92	5
154	93	5
155	74	5
156	94	5
157	95	5
158	32	5
159	4	5
160	3	5
161	6	5
162	5	5
163	65	5
164	50	5
165	96	5
166	78	5
167	97	5
168	31	5
169	82	5
170	81	5
171	30	5
172	84	5
173	83	5
174	85	5
175	86	5
176	33	5
177	66	5
178	53	5
179	89	5
180	87	5
181	48	5
182	51	5
183	52	5
184	26	5
185	28	5
186	29	5
187	98	5
188	58	5
189	44	5
190	59	5
191	64	5
192	77	5
193	70	5
194	41	5
195	72	5
196	80	5
197	60	5
198	61	5
199	62	5
200	63	5
201	73	5
202	75	5
203	76	5
204	69	5
205	71	5
206	36	5
207	37	5
208	38	5
209	39	5
210	79	5
211	99	5
212	88	1
213	90	1
214	91	1
215	92	1
216	93	1
217	94	1
218	95	1
219	96	1
220	97	1
221	89	1
222	87	1
223	98	1
224	99	1
\.


--
-- Data for Name: ab_register_user; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.ab_register_user (id, first_name, last_name, username, password, email, registration_date, registration_hash) FROM stdin;
\.


--
-- Data for Name: ab_role; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.ab_role (id, name) FROM stdin;
1	Admin
2	Public
3	Viewer
4	User
5	Op
\.


--
-- Data for Name: ab_user; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.ab_user (id, first_name, last_name, username, password, active, email, last_login, login_count, fail_login_count, created_on, changed_on, created_by_fk, changed_by_fk) FROM stdin;
1	Airflow	Admin	airflow	pbkdf2:sha256:260000$qmOKkQ9MY9yBLiEO$ac09e7b8ccef31367407eb4f063b660d88aef8735934433b0661db338e12cbd2	t	airflowadmin@example.com	2025-06-13 14:12:48.621676	1	0	2025-06-13 14:11:45.86416	2025-06-13 14:11:45.864175	\N	\N
\.


--
-- Data for Name: ab_user_role; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.ab_user_role (id, user_id, role_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: ab_view_menu; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.ab_view_menu (id, name) FROM stdin;
1	IndexView
2	UtilView
3	LocaleView
4	Passwords
5	My Password
6	My Profile
7	AuthDBView
8	Users
9	List Users
10	Security
11	Roles
12	List Roles
13	User Stats Chart
14	User's Statistics
15	Permissions
16	Actions
17	View Menus
18	Resources
19	Permission Views
20	Permission Pairs
21	AutocompleteView
22	Airflow
23	DAG Runs
24	Browse
25	Jobs
26	Audit Logs
27	Variables
28	DAG:d_01_hour
29	Admin
30	DAG Run:d_01_hour
31	Task Instances
32	Task Reschedules
33	Triggers
34	Configurations
35	Connections
36	SLA Misses
37	Plugins
38	Providers
39	Pools
40	XComs
41	DagDependenciesView
42	DAG Dependencies
43	RedocView
44	DevView
45	DocsView
46	DAGs
47	Cluster Activity
48	Datasets
49	Documentation
50	Docs
51	DAG Code
52	ImportError
53	DAG Warnings
54	Task Logs
55	Website
56	DAG:d_02_update_data
57	DAG Run:d_02_update_data
\.


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.alembic_version (version_num) FROM stdin;
5f2621c13b39
\.


--
-- Data for Name: callback_request; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.callback_request (id, created_at, priority_weight, callback_data, callback_type, processor_subdir) FROM stdin;
\.


--
-- Data for Name: connection; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.connection (id, conn_id, conn_type, description, host, schema, login, password, port, is_encrypted, is_extra_encrypted, extra) FROM stdin;
1	solar_mysql	mysql	瘞?情鞈?	host.docker.internal	agr_cwa	eta	password	3307	f	f	
\.


--
-- Data for Name: dag; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.dag (dag_id, root_dag_id, is_paused, is_subdag, is_active, last_parsed_time, last_pickled, last_expired, scheduler_lock, pickle_id, fileloc, processor_subdir, owners, dag_display_name, description, default_view, schedule_interval, timetable_description, dataset_expression, max_active_tasks, max_active_runs, max_consecutive_failed_dag_runs, has_task_concurrency_limits, has_import_errors, next_dagrun, next_dagrun_data_interval_start, next_dagrun_data_interval_end, next_dagrun_create_after) FROM stdin;
d_01_hour	\N	t	f	t	2025-06-13 06:16:15.992002+00	\N	\N	\N	\N	/opt/airflow/dags/d_01_hour.py	/opt/airflow/dags	admin	\N	get data every hour from agr_cwa	grid	"30 * * * *"	At 30 minutes past the hour	null	16	16	0	f	f	2025-06-13 04:30:00+00	2025-06-13 04:30:00+00	2025-06-13 05:30:00+00	2025-06-13 05:30:00+00
d_02_update_data	\N	f	f	t	2025-06-13 06:16:22.978143+00	\N	\N	\N	\N	/opt/airflow/dags/d_02_update_data.py	/opt/airflow/dags	admin	\N	parse data and upload to database	grid	"45 * * * *"	At 45 minutes past the hour	null	16	16	0	f	f	2025-06-13 05:45:00+00	2025-06-13 05:45:00+00	2025-06-13 06:45:00+00	2025-06-13 06:45:00+00
\.


--
-- Data for Name: dag_code; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.dag_code (fileloc_hash, fileloc, last_updated, source_code) FROM stdin;
13192431935666126	/opt/airflow/dags/d_01_hour.py	2025-06-13 06:12:10.96697+00	from datetime import datetime, timedelta\n\nfrom airflow import DAG\nfrom airflow.decorators import dag, task\nfrom airflow.operators.python import PythonOperator\nfrom tasks.a_hour import getOneHourData\n\n\ndefault_args = {\n    "owner": "admin",\n    "depends_on_past": False,\n    "email": ["your_email@example.com"],\n    "email_on_failure": False,\n    "email_on_retry": False,\n    "retries": 1,\n    "retry_delay": timedelta(minutes=5)\n}\n\n@dag(\n    "d_01_hour",\n    default_args=default_args,\n    description="get data every hour from agr_cwa",\n    schedule="30 * * * *",\n    start_date=datetime(2025, 5, 16),\n    catchup=False,\n)\ndef task1():\n    getOneHourData()\n\ndag = task1()
102218532393125	/opt/airflow/dags/d_02_update_data.py	2025-06-13 06:14:17.205634+00	from tasks.update_data import update_data\nfrom datetime import datetime, timedelta\nfrom airflow.decorators import dag, task\n\ndefault_args = {\n    "owner": "admin",\n    "depends_on_past": False,\n    "email": ["your_email@example.com"],\n    "email_on_failure": False,\n    "email_on_retry": False,\n    "retries": 1,\n    "retry_delay": timedelta(minutes=5)\n}\n\n@dag(\n    "d_02_update_data",\n    default_args=default_args,\n    description="parse data and upload to database",\n    schedule="45 * * * *",\n    start_date=datetime(2025, 6, 12),\n    catchup=False,\n)\ndef task1():\n    update_data()\n\ndag = task1()
\.


--
-- Data for Name: dag_owner_attributes; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.dag_owner_attributes (dag_id, owner, link) FROM stdin;
\.


--
-- Data for Name: dag_pickle; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.dag_pickle (id, pickle, created_dttm, pickle_hash) FROM stdin;
\.


--
-- Data for Name: dag_priority_parsing_request; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.dag_priority_parsing_request (id, fileloc) FROM stdin;
\.


--
-- Data for Name: dag_run; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.dag_run (id, dag_id, queued_at, execution_date, start_date, end_date, state, run_id, creating_job_id, external_trigger, run_type, conf, data_interval_start, data_interval_end, last_scheduling_decision, dag_hash, log_template_id, updated_at, clear_number) FROM stdin;
4	d_02_update_data	2025-06-13 06:14:27.335185+00	2025-06-13 06:14:27.301568+00	2025-06-13 06:14:28.242111+00	2025-06-13 06:14:30.551931+00	success	manual__2025-06-13T06:14:27.301568+00:00	\N	t	manual	\\x80057d942e	2025-06-13 04:45:00+00	2025-06-13 05:45:00+00	2025-06-13 06:14:30.549353+00	06a2fae3f98e7085022027fade5f77ad	2	2025-06-13 06:14:30.552866+00	0
2	d_02_update_data	2025-06-13 06:14:23.116761+00	2025-06-13 04:45:00+00	2025-06-13 06:14:23.198534+00	2025-06-13 06:14:26.503183+00	success	scheduled__2025-06-13T04:45:00+00:00	1	f	scheduled	\\x80057d942e	2025-06-13 04:45:00+00	2025-06-13 05:45:00+00	2025-06-13 06:14:26.499748+00	06a2fae3f98e7085022027fade5f77ad	2	2025-06-13 06:14:26.504676+00	0
1	d_02_update_data	2025-06-13 06:14:22.281644+00	2025-06-13 06:14:22.19339+00	2025-06-13 06:14:23.198996+00	2025-06-13 06:14:26.518013+00	success	manual__2025-06-13T06:14:22.193390+00:00	\N	t	manual	\\x80057d942e	2025-06-13 04:45:00+00	2025-06-13 05:45:00+00	2025-06-13 06:14:26.51443+00	06a2fae3f98e7085022027fade5f77ad	2	2025-06-13 06:14:26.519424+00	0
3	d_02_update_data	2025-06-13 06:14:24.745124+00	2025-06-13 06:14:24.709638+00	2025-06-13 06:14:25.100206+00	2025-06-13 06:14:28.298237+00	success	manual__2025-06-13T06:14:24.709638+00:00	\N	t	manual	\\x80057d942e	2025-06-13 04:45:00+00	2025-06-13 05:45:00+00	2025-06-13 06:14:28.295241+00	06a2fae3f98e7085022027fade5f77ad	2	2025-06-13 06:14:28.299173+00	0
\.


--
-- Data for Name: dag_run_note; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.dag_run_note (user_id, dag_run_id, content, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: dag_schedule_dataset_alias_reference; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.dag_schedule_dataset_alias_reference (alias_id, dag_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: dag_schedule_dataset_reference; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.dag_schedule_dataset_reference (dataset_id, dag_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: dag_tag; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.dag_tag (name, dag_id) FROM stdin;
\.


--
-- Data for Name: dag_warning; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.dag_warning (dag_id, warning_type, message, "timestamp") FROM stdin;
\.


--
-- Data for Name: dagrun_dataset_event; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.dagrun_dataset_event (dag_run_id, event_id) FROM stdin;
\.


--
-- Data for Name: dataset; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.dataset (id, uri, extra, created_at, updated_at, is_orphaned) FROM stdin;
\.


--
-- Data for Name: dataset_alias; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.dataset_alias (id, name) FROM stdin;
\.


--
-- Data for Name: dataset_alias_dataset; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.dataset_alias_dataset (alias_id, dataset_id) FROM stdin;
\.


--
-- Data for Name: dataset_alias_dataset_event; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.dataset_alias_dataset_event (alias_id, event_id) FROM stdin;
\.


--
-- Data for Name: dataset_dag_run_queue; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.dataset_dag_run_queue (dataset_id, target_dag_id, created_at) FROM stdin;
\.


--
-- Data for Name: dataset_event; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.dataset_event (id, dataset_id, extra, source_task_id, source_dag_id, source_run_id, source_map_index, "timestamp") FROM stdin;
\.


--
-- Data for Name: import_error; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.import_error (id, "timestamp", filename, stacktrace, processor_subdir) FROM stdin;
\.


--
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.job (id, dag_id, state, job_type, start_date, end_date, latest_heartbeat, executor_class, hostname, unixname) FROM stdin;
1	\N	success	SchedulerJob	2025-06-13 06:12:08.956633+00	2025-06-13 06:16:46.10059+00	2025-06-13 06:16:40.031028+00	\N	b0358b19128a	airflow
3	d_02_update_data	success	LocalTaskJob	2025-06-13 06:14:24.603331+00	2025-06-13 06:14:26.128351+00	2025-06-13 06:14:24.548812+00	\N	b0358b19128a	airflow
2	d_02_update_data	success	LocalTaskJob	2025-06-13 06:14:24.581832+00	2025-06-13 06:14:26.252835+00	2025-06-13 06:14:24.521446+00	\N	b0358b19128a	airflow
4	d_02_update_data	success	LocalTaskJob	2025-06-13 06:14:26.595678+00	2025-06-13 06:14:27.936161+00	2025-06-13 06:14:26.53022+00	\N	b0358b19128a	airflow
5	d_02_update_data	success	LocalTaskJob	2025-06-13 06:14:29.423824+00	2025-06-13 06:14:30.586155+00	2025-06-13 06:14:29.346022+00	\N	b0358b19128a	airflow
\.


--
-- Data for Name: log; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.log (id, dttm, dag_id, task_id, map_index, event, execution_date, run_id, owner, owner_display_name, extra, try_number) FROM stdin;
1	2025-06-13 06:11:40.343859+00	\N	\N	\N	cli_users_create	\N	\N	root	\N	{"host_name": "eef2cf9a3a33", "full_command": "['/home/airflow/.local/bin/airflow', 'users', 'create', '--username', 'airflow', '--firstname', 'Airflow', '--lastname', 'Admin', '--email', 'airflowadmin@example.com', '--role', 'Admin', '--password', '********']"}	\N
2	2025-06-13 06:11:59.225034+00	\N	\N	\N	cli_check	\N	\N	airflow	\N	{"host_name": "dda624996453", "full_command": "['/home/airflow/.local/bin/airflow', 'db', 'check']"}	\N
3	2025-06-13 06:11:59.288851+00	\N	\N	\N	cli_check	\N	\N	airflow	\N	{"host_name": "b0358b19128a", "full_command": "['/home/airflow/.local/bin/airflow', 'db', 'check']"}	\N
4	2025-06-13 06:12:03.13321+00	\N	\N	\N	cli_webserver	\N	\N	airflow	\N	{"host_name": "dda624996453", "full_command": "['/home/airflow/.local/bin/airflow', 'webserver']"}	\N
5	2025-06-13 06:12:06.931259+00	\N	\N	\N	cli_scheduler	\N	\N	airflow	\N	{"host_name": "b0358b19128a", "full_command": "['/home/airflow/.local/bin/airflow', 'scheduler']"}	\N
6	2025-06-13 06:12:54.466136+00	\N	\N	\N	connection.create	\N	\N	airflow	Airflow Admin	{}	\N
7	2025-06-13 06:13:41.854364+00	\N	\N	\N	connection.create	\N	\N	airflow	Airflow Admin	{"conn_id": "solqr_mysql", "conn_type": "mysql", "description": "\\u6c23\\u8c61\\u8cc7\\u6599", "host": "host.docker.internal", "schema": "agr_cwa", "login": "eta", "password": "***", "port": "3307", "extra": ""}	\N
8	2025-06-13 06:14:02.596691+00	\N	\N	\N	connection.edit	\N	\N	airflow	Airflow Admin	{"pk": "1"}	\N
9	2025-06-13 06:14:10.812785+00	\N	\N	\N	connection.edit	\N	\N	airflow	Airflow Admin	{"conn_id": "solar_mysql", "conn_type": "mysql", "description": "\\u6c23\\u8c61\\u8cc7\\u6599", "host": "host.docker.internal", "schema": "agr_cwa", "login": "eta", "password": "***", "port": "3307", "extra": "", "pk": "1"}	\N
10	2025-06-13 06:14:22.160523+00	d_02_update_data	\N	\N	trigger	\N	\N	airflow	Airflow Admin	{"redirect_url": "/home"}	\N
11	2025-06-13 06:14:23.383307+00	d_02_update_data	update_data	\N	cli_task_run	\N	\N	airflow	\N	{"host_name": "b0358b19128a", "full_command": "['/home/airflow/.local/bin/airflow', 'scheduler']"}	\N
12	2025-06-13 06:14:23.382787+00	d_02_update_data	update_data	\N	cli_task_run	\N	\N	airflow	\N	{"host_name": "b0358b19128a", "full_command": "['/home/airflow/.local/bin/airflow', 'scheduler']"}	\N
13	2025-06-13 06:14:24.645053+00	d_02_update_data	\N	\N	trigger	\N	\N	airflow	Airflow Admin	{"redirect_url": "/home"}	\N
14	2025-06-13 06:14:24.787045+00	d_02_update_data	update_data	-1	running	2025-06-13 04:45:00+00	scheduled__2025-06-13T04:45:00+00:00	admin	\N	\N	1
15	2025-06-13 06:14:24.826681+00	d_02_update_data	update_data	-1	running	2025-06-13 06:14:22.19339+00	manual__2025-06-13T06:14:22.193390+00:00	admin	\N	\N	1
16	2025-06-13 06:14:24.884748+00	d_02_update_data	update_data	\N	cli_task_run	\N	\N	airflow	\N	{"host_name": "b0358b19128a", "full_command": "['/home/airflow/.local/bin/airflow', 'scheduler']"}	\N
17	2025-06-13 06:14:24.92698+00	d_02_update_data	update_data	\N	cli_task_run	\N	\N	airflow	\N	{"host_name": "b0358b19128a", "full_command": "['/home/airflow/.local/bin/airflow', 'scheduler']"}	\N
18	2025-06-13 06:14:25.311837+00	d_02_update_data	update_data	\N	cli_task_run	\N	\N	airflow	\N	{"host_name": "b0358b19128a", "full_command": "['/home/airflow/.local/bin/airflow', 'scheduler']"}	\N
19	2025-06-13 06:14:25.809626+00	d_02_update_data	update_data	-1	success	2025-06-13 06:14:22.19339+00	manual__2025-06-13T06:14:22.193390+00:00	admin	\N	\N	1
20	2025-06-13 06:14:25.854941+00	d_02_update_data	update_data	-1	success	2025-06-13 04:45:00+00	scheduled__2025-06-13T04:45:00+00:00	admin	\N	\N	1
21	2025-06-13 06:14:26.815886+00	d_02_update_data	update_data	-1	running	2025-06-13 06:14:24.709638+00	manual__2025-06-13T06:14:24.709638+00:00	admin	\N	\N	1
22	2025-06-13 06:14:26.926582+00	d_02_update_data	update_data	\N	cli_task_run	\N	\N	airflow	\N	{"host_name": "b0358b19128a", "full_command": "['/home/airflow/.local/bin/airflow', 'scheduler']"}	\N
23	2025-06-13 06:14:27.271222+00	d_02_update_data	\N	\N	trigger	\N	\N	airflow	Airflow Admin	{"redirect_url": "/home"}	\N
24	2025-06-13 06:14:27.58081+00	d_02_update_data	update_data	-1	success	2025-06-13 06:14:24.709638+00	manual__2025-06-13T06:14:24.709638+00:00	admin	\N	\N	1
25	2025-06-13 06:14:28.451141+00	d_02_update_data	update_data	\N	cli_task_run	\N	\N	airflow	\N	{"host_name": "b0358b19128a", "full_command": "['/home/airflow/.local/bin/airflow', 'scheduler']"}	\N
26	2025-06-13 06:14:29.652748+00	d_02_update_data	update_data	-1	running	2025-06-13 06:14:27.301568+00	manual__2025-06-13T06:14:27.301568+00:00	admin	\N	\N	1
27	2025-06-13 06:14:29.763389+00	d_02_update_data	update_data	\N	cli_task_run	\N	\N	airflow	\N	{"host_name": "b0358b19128a", "full_command": "['/home/airflow/.local/bin/airflow', 'scheduler']"}	\N
28	2025-06-13 06:14:30.373297+00	d_02_update_data	update_data	-1	success	2025-06-13 06:14:27.301568+00	manual__2025-06-13T06:14:27.301568+00:00	admin	\N	\N	1
\.


--
-- Data for Name: log_template; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.log_template (id, filename, elasticsearch_id, created_at) FROM stdin;
1	{{ ti.dag_id }}/{{ ti.task_id }}/{{ ts }}/{{ try_number }}.log	{dag_id}-{task_id}-{execution_date}-{try_number}	2025-06-13 06:11:33.946444+00
2	dag_id={{ ti.dag_id }}/run_id={{ ti.run_id }}/task_id={{ ti.task_id }}/{% if ti.map_index >= 0 %}map_index={{ ti.map_index }}/{% endif %}attempt={{ try_number }}.log	{dag_id}-{task_id}-{run_id}-{map_index}-{try_number}	2025-06-13 06:11:33.946468+00
\.


--
-- Data for Name: rendered_task_instance_fields; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.rendered_task_instance_fields (dag_id, task_id, run_id, map_index, rendered_fields, k8s_pod_yaml) FROM stdin;
d_02_update_data	update_data	manual__2025-06-13T06:14:22.193390+00:00	-1	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null
d_02_update_data	update_data	scheduled__2025-06-13T04:45:00+00:00	-1	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null
d_02_update_data	update_data	manual__2025-06-13T06:14:24.709638+00:00	-1	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null
d_02_update_data	update_data	manual__2025-06-13T06:14:27.301568+00:00	-1	{"templates_dict": null, "op_args": [], "op_kwargs": {}}	null
\.


--
-- Data for Name: serialized_dag; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.serialized_dag (dag_id, fileloc, fileloc_hash, data, data_compressed, last_updated, dag_hash, processor_subdir) FROM stdin;
d_01_hour	/opt/airflow/dags/d_01_hour.py	13192431935666126	{"__version": 1, "dag": {"timetable": {"__type": "airflow.timetables.interval.CronDataIntervalTimetable", "__var": {"expression": "30 * * * *", "timezone": "Asia/Taipei"}}, "start_date": 1747324800.0, "default_args": {"__var": {"owner": "admin", "depends_on_past": false, "email": ["your_email@example.com"], "email_on_failure": false, "email_on_retry": false, "retries": 1, "retry_delay": {"__var": 300.0, "__type": "timedelta"}}, "__type": "dict"}, "_dag_id": "d_01_hour", "_default_view": "grid", "fileloc": "/opt/airflow/dags/d_01_hour.py", "_description": "get data every hour from agr_cwa", "edge_info": {}, "_task_group": {"_group_id": null, "prefix_group_id": true, "tooltip": "", "ui_color": "CornflowerBlue", "ui_fgcolor": "#000", "children": {"getOneHourData": ["operator", "getOneHourData"]}, "upstream_group_ids": [], "downstream_group_ids": [], "upstream_task_ids": [], "downstream_task_ids": []}, "timezone": "Asia/Taipei", "catchup": false, "_processor_dags_folder": "/opt/airflow/dags", "tasks": [{"__var": {"retry_delay": 300.0, "downstream_task_ids": [], "task_id": "getOneHourData", "owner": "admin", "email_on_failure": false, "email": ["your_email@example.com"], "template_ext": [], "_needs_expansion": false, "email_on_retry": false, "pool": "default_pool", "on_failure_fail_dagrun": false, "is_setup": false, "weight_rule": "downstream", "ui_color": "#ffefeb", "start_from_trigger": false, "retries": 1, "ui_fgcolor": "#000", "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "template_fields": ["templates_dict", "op_args", "op_kwargs"], "_log_config_logger_name": "airflow.task.operators", "is_teardown": false, "_task_type": "_PythonDecoratedOperator", "_task_module": "airflow.decorators.python", "_operator_name": "@task", "_is_empty": false, "start_trigger_args": null, "op_args": [], "op_kwargs": {}}, "__type": "operator"}], "dag_dependencies": [], "params": []}}	\N	2025-06-13 06:12:09.876331+00	32b632b41893a4a04b0011d945081b63	/opt/airflow/dags
d_02_update_data	/opt/airflow/dags/d_02_update_data.py	102218532393125	{"__version": 1, "dag": {"timetable": {"__type": "airflow.timetables.interval.CronDataIntervalTimetable", "__var": {"expression": "45 * * * *", "timezone": "Asia/Taipei"}}, "start_date": 1749657600.0, "default_args": {"__var": {"owner": "admin", "depends_on_past": false, "email": ["your_email@example.com"], "email_on_failure": false, "email_on_retry": false, "retries": 1, "retry_delay": {"__var": 300.0, "__type": "timedelta"}}, "__type": "dict"}, "_dag_id": "d_02_update_data", "_default_view": "grid", "fileloc": "/opt/airflow/dags/d_02_update_data.py", "_description": "parse data and upload to database", "edge_info": {}, "_task_group": {"_group_id": null, "prefix_group_id": true, "tooltip": "", "ui_color": "CornflowerBlue", "ui_fgcolor": "#000", "children": {"update_data": ["operator", "update_data"]}, "upstream_group_ids": [], "downstream_group_ids": [], "upstream_task_ids": [], "downstream_task_ids": []}, "timezone": "Asia/Taipei", "catchup": false, "_processor_dags_folder": "/opt/airflow/dags", "tasks": [{"__var": {"retry_delay": 300.0, "downstream_task_ids": [], "task_id": "update_data", "owner": "admin", "email_on_failure": false, "email": ["your_email@example.com"], "template_ext": [], "_needs_expansion": false, "email_on_retry": false, "pool": "default_pool", "on_failure_fail_dagrun": false, "is_setup": false, "weight_rule": "downstream", "ui_color": "#ffefeb", "start_from_trigger": false, "retries": 1, "ui_fgcolor": "#000", "template_fields_renderers": {"templates_dict": "json", "op_args": "py", "op_kwargs": "py"}, "template_fields": ["templates_dict", "op_args", "op_kwargs"], "_log_config_logger_name": "airflow.task.operators", "is_teardown": false, "_task_type": "_PythonDecoratedOperator", "_task_module": "airflow.decorators.python", "_operator_name": "@task", "_is_empty": false, "start_trigger_args": null, "op_args": [], "op_kwargs": {}}, "__type": "operator"}], "dag_dependencies": [], "params": []}}	\N	2025-06-13 06:14:16.629699+00	06a2fae3f98e7085022027fade5f77ad	/opt/airflow/dags
\.


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.session (id, session_id, data, expiry) FROM stdin;
1	b6df7467-92c3-40c9-82a9-48ad97858d35	\\x80049563000000000000007d94288c0a5f7065726d616e656e7494888c065f667265736894898c0a637372665f746f6b656e948c2864306263356632316362346333323030356365386135613139336236666263333564336639616139948c066c6f63616c65948c02656e94752e	2025-07-13 06:12:43.647401
2	e29ee839-cabb-4cf9-a2cd-ee43958f846e	\\x8004954e010000000000007d94288c0a5f7065726d616e656e7494888c065f667265736894888c0a637372665f746f6b656e948c2864306263356632316362346333323030356365386135613139336236666263333564336639616139948c066c6f63616c65948c02656e948c085f757365725f6964944b018c035f6964948c806665323030643039666162306531386436623366313566613537653332363833633735613862313564336264333365363935663931396637373030616130303666633636343464663038393966646138346431383539356333373762373435316336623134373866623933666561366465373162646364333433393832643233948c116461675f7374617475735f66696c746572948c03616c6c948c0c706167655f686973746f7279945d948c26687474703a2f2f6c6f63616c686f73743a383038302f636f6e6e656374696f6e2f6c6973742f9461752e	2025-07-13 06:15:29.318185
\.


--
-- Data for Name: sla_miss; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.sla_miss (task_id, dag_id, execution_date, email_sent, "timestamp", description, notification_sent) FROM stdin;
\.


--
-- Data for Name: slot_pool; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.slot_pool (id, pool, slots, description, include_deferred) FROM stdin;
1	default_pool	128	Default pool	f
\.


--
-- Data for Name: task_fail; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.task_fail (id, task_id, dag_id, run_id, map_index, start_date, end_date, duration) FROM stdin;
\.


--
-- Data for Name: task_instance; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.task_instance (task_id, dag_id, run_id, map_index, start_date, end_date, duration, state, try_number, max_tries, hostname, unixname, job_id, pool, pool_slots, queue, priority_weight, operator, custom_operator_name, queued_dttm, queued_by_job_id, pid, executor, executor_config, updated_at, rendered_map_index, external_executor_id, trigger_id, trigger_timeout, next_method, next_kwargs, task_display_name) FROM stdin;
update_data	d_02_update_data	manual__2025-06-13T06:14:22.193390+00:00	-1	2025-06-13 06:14:24.799122+00	2025-06-13 06:14:25.808345+00	1.009223	success	1	1	b0358b19128a	airflow	3	default_pool	1	default	1	_PythonDecoratedOperator	@task	2025-06-13 06:14:23.305346+00	1	282	\N	\\x80057d942e	2025-06-13 06:14:25.89176+00	\N	\N	\N	\N	\N	\N	update_data
update_data	d_02_update_data	scheduled__2025-06-13T04:45:00+00:00	-1	2025-06-13 06:14:24.775208+00	2025-06-13 06:14:25.854062+00	1.078854	success	1	1	b0358b19128a	airflow	2	default_pool	1	default	1	_PythonDecoratedOperator	@task	2025-06-13 06:14:23.305346+00	1	280	\N	\\x80057d942e	2025-06-13 06:14:25.938966+00	\N	\N	\N	\N	\N	\N	update_data
update_data	d_02_update_data	manual__2025-06-13T06:14:24.709638+00:00	-1	2025-06-13 06:14:26.804488+00	2025-06-13 06:14:27.579053+00	0.774565	success	1	1	b0358b19128a	airflow	4	default_pool	1	default	1	_PythonDecoratedOperator	@task	2025-06-13 06:14:25.231251+00	1	286	\N	\\x80057d942e	2025-06-13 06:14:27.676099+00	\N	\N	\N	\N	\N	\N	update_data
update_data	d_02_update_data	manual__2025-06-13T06:14:27.301568+00:00	-1	2025-06-13 06:14:29.61405+00	2025-06-13 06:14:30.372689+00	0.758639	success	1	1	b0358b19128a	airflow	5	default_pool	1	default	1	_PythonDecoratedOperator	@task	2025-06-13 06:14:28.390945+00	1	290	\N	\\x80057d942e	2025-06-13 06:14:30.45619+00	\N	\N	\N	\N	\N	\N	update_data
\.


--
-- Data for Name: task_instance_history; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.task_instance_history (id, task_id, dag_id, run_id, map_index, try_number, start_date, end_date, duration, state, max_tries, hostname, unixname, job_id, pool, pool_slots, queue, priority_weight, operator, custom_operator_name, queued_dttm, queued_by_job_id, pid, executor, executor_config, updated_at, rendered_map_index, external_executor_id, trigger_id, trigger_timeout, next_method, next_kwargs, task_display_name) FROM stdin;
\.


--
-- Data for Name: task_instance_note; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.task_instance_note (user_id, task_id, dag_id, run_id, map_index, content, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: task_map; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.task_map (dag_id, task_id, run_id, map_index, length, keys) FROM stdin;
\.


--
-- Data for Name: task_outlet_dataset_reference; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.task_outlet_dataset_reference (dataset_id, dag_id, task_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: task_reschedule; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.task_reschedule (id, task_id, dag_id, run_id, map_index, try_number, start_date, end_date, duration, reschedule_date) FROM stdin;
\.


--
-- Data for Name: trigger; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.trigger (id, classpath, kwargs, created_date, triggerer_id) FROM stdin;
\.


--
-- Data for Name: variable; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.variable (id, key, val, description, is_encrypted) FROM stdin;
\.


--
-- Data for Name: xcom; Type: TABLE DATA; Schema: public; Owner: airflow
--

COPY public.xcom (dag_run_id, task_id, map_index, key, dag_id, run_id, value, "timestamp") FROM stdin;
\.


--
-- Name: ab_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.ab_permission_id_seq', 5, true);


--
-- Name: ab_permission_view_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.ab_permission_view_id_seq', 106, true);


--
-- Name: ab_permission_view_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.ab_permission_view_role_id_seq', 224, true);


--
-- Name: ab_register_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.ab_register_user_id_seq', 1, false);


--
-- Name: ab_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.ab_role_id_seq', 5, true);


--
-- Name: ab_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.ab_user_id_seq', 1, true);


--
-- Name: ab_user_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.ab_user_role_id_seq', 1, true);


--
-- Name: ab_view_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.ab_view_menu_id_seq', 57, true);


--
-- Name: callback_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.callback_request_id_seq', 1, false);


--
-- Name: connection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.connection_id_seq', 1, true);


--
-- Name: dag_pickle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.dag_pickle_id_seq', 1, false);


--
-- Name: dag_run_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.dag_run_id_seq', 4, true);


--
-- Name: dataset_alias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.dataset_alias_id_seq', 1, false);


--
-- Name: dataset_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.dataset_event_id_seq', 1, false);


--
-- Name: dataset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.dataset_id_seq', 1, false);


--
-- Name: import_error_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.import_error_id_seq', 1, true);


--
-- Name: job_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.job_id_seq', 5, true);


--
-- Name: log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.log_id_seq', 28, true);


--
-- Name: log_template_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.log_template_id_seq', 2, true);


--
-- Name: session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.session_id_seq', 2, true);


--
-- Name: slot_pool_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.slot_pool_id_seq', 1, true);


--
-- Name: task_fail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.task_fail_id_seq', 1, false);


--
-- Name: task_instance_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.task_instance_history_id_seq', 1, false);


--
-- Name: task_reschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.task_reschedule_id_seq', 1, false);


--
-- Name: trigger_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.trigger_id_seq', 1, false);


--
-- Name: variable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airflow
--

SELECT pg_catalog.setval('public.variable_id_seq', 1, false);


--
-- Name: ab_permission ab_permission_name_uq; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_permission
    ADD CONSTRAINT ab_permission_name_uq UNIQUE (name);


--
-- Name: ab_permission ab_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_permission
    ADD CONSTRAINT ab_permission_pkey PRIMARY KEY (id);


--
-- Name: ab_permission_view ab_permission_view_permission_id_view_menu_id_uq; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_permission_id_view_menu_id_uq UNIQUE (permission_id, view_menu_id);


--
-- Name: ab_permission_view ab_permission_view_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_pkey PRIMARY KEY (id);


--
-- Name: ab_permission_view_role ab_permission_view_role_permission_view_id_role_id_uq; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_permission_view_id_role_id_uq UNIQUE (permission_view_id, role_id);


--
-- Name: ab_permission_view_role ab_permission_view_role_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_pkey PRIMARY KEY (id);


--
-- Name: ab_register_user ab_register_user_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_register_user
    ADD CONSTRAINT ab_register_user_pkey PRIMARY KEY (id);


--
-- Name: ab_register_user ab_register_user_username_uq; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_register_user
    ADD CONSTRAINT ab_register_user_username_uq UNIQUE (username);


--
-- Name: ab_role ab_role_name_uq; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_role
    ADD CONSTRAINT ab_role_name_uq UNIQUE (name);


--
-- Name: ab_role ab_role_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_role
    ADD CONSTRAINT ab_role_pkey PRIMARY KEY (id);


--
-- Name: ab_user ab_user_email_uq; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_email_uq UNIQUE (email);


--
-- Name: ab_user ab_user_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_pkey PRIMARY KEY (id);


--
-- Name: ab_user_role ab_user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_pkey PRIMARY KEY (id);


--
-- Name: ab_user_role ab_user_role_user_id_role_id_uq; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_user_id_role_id_uq UNIQUE (user_id, role_id);


--
-- Name: ab_user ab_user_username_uq; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_username_uq UNIQUE (username);


--
-- Name: ab_view_menu ab_view_menu_name_uq; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_view_menu
    ADD CONSTRAINT ab_view_menu_name_uq UNIQUE (name);


--
-- Name: ab_view_menu ab_view_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_view_menu
    ADD CONSTRAINT ab_view_menu_pkey PRIMARY KEY (id);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: callback_request callback_request_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.callback_request
    ADD CONSTRAINT callback_request_pkey PRIMARY KEY (id);


--
-- Name: connection connection_conn_id_uq; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.connection
    ADD CONSTRAINT connection_conn_id_uq UNIQUE (conn_id);


--
-- Name: connection connection_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.connection
    ADD CONSTRAINT connection_pkey PRIMARY KEY (id);


--
-- Name: dag_code dag_code_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_code
    ADD CONSTRAINT dag_code_pkey PRIMARY KEY (fileloc_hash);


--
-- Name: dag_owner_attributes dag_owner_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_owner_attributes
    ADD CONSTRAINT dag_owner_attributes_pkey PRIMARY KEY (dag_id, owner);


--
-- Name: dag_pickle dag_pickle_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_pickle
    ADD CONSTRAINT dag_pickle_pkey PRIMARY KEY (id);


--
-- Name: dag dag_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag
    ADD CONSTRAINT dag_pkey PRIMARY KEY (dag_id);


--
-- Name: dag_priority_parsing_request dag_priority_parsing_request_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_priority_parsing_request
    ADD CONSTRAINT dag_priority_parsing_request_pkey PRIMARY KEY (id);


--
-- Name: dag_run dag_run_dag_id_execution_date_key; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_run
    ADD CONSTRAINT dag_run_dag_id_execution_date_key UNIQUE (dag_id, execution_date);


--
-- Name: dag_run dag_run_dag_id_run_id_key; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_run
    ADD CONSTRAINT dag_run_dag_id_run_id_key UNIQUE (dag_id, run_id);


--
-- Name: dag_run_note dag_run_note_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_run_note
    ADD CONSTRAINT dag_run_note_pkey PRIMARY KEY (dag_run_id);


--
-- Name: dag_run dag_run_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_run
    ADD CONSTRAINT dag_run_pkey PRIMARY KEY (id);


--
-- Name: dag_tag dag_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_tag
    ADD CONSTRAINT dag_tag_pkey PRIMARY KEY (name, dag_id);


--
-- Name: dag_warning dag_warning_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_warning
    ADD CONSTRAINT dag_warning_pkey PRIMARY KEY (dag_id, warning_type);


--
-- Name: dagrun_dataset_event dagrun_dataset_event_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dagrun_dataset_event
    ADD CONSTRAINT dagrun_dataset_event_pkey PRIMARY KEY (dag_run_id, event_id);


--
-- Name: dataset_alias_dataset_event dataset_alias_dataset_event_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dataset_alias_dataset_event
    ADD CONSTRAINT dataset_alias_dataset_event_pkey PRIMARY KEY (alias_id, event_id);


--
-- Name: dataset_alias_dataset dataset_alias_dataset_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dataset_alias_dataset
    ADD CONSTRAINT dataset_alias_dataset_pkey PRIMARY KEY (alias_id, dataset_id);


--
-- Name: dataset_alias dataset_alias_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dataset_alias
    ADD CONSTRAINT dataset_alias_pkey PRIMARY KEY (id);


--
-- Name: dataset_event dataset_event_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dataset_event
    ADD CONSTRAINT dataset_event_pkey PRIMARY KEY (id);


--
-- Name: dataset dataset_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dataset
    ADD CONSTRAINT dataset_pkey PRIMARY KEY (id);


--
-- Name: dataset_dag_run_queue datasetdagrunqueue_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dataset_dag_run_queue
    ADD CONSTRAINT datasetdagrunqueue_pkey PRIMARY KEY (dataset_id, target_dag_id);


--
-- Name: dag_schedule_dataset_alias_reference dsdar_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_schedule_dataset_alias_reference
    ADD CONSTRAINT dsdar_pkey PRIMARY KEY (alias_id, dag_id);


--
-- Name: dag_schedule_dataset_reference dsdr_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_schedule_dataset_reference
    ADD CONSTRAINT dsdr_pkey PRIMARY KEY (dataset_id, dag_id);


--
-- Name: import_error import_error_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.import_error
    ADD CONSTRAINT import_error_pkey PRIMARY KEY (id);


--
-- Name: job job_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- Name: log log_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.log
    ADD CONSTRAINT log_pkey PRIMARY KEY (id);


--
-- Name: log_template log_template_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.log_template
    ADD CONSTRAINT log_template_pkey PRIMARY KEY (id);


--
-- Name: rendered_task_instance_fields rendered_task_instance_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.rendered_task_instance_fields
    ADD CONSTRAINT rendered_task_instance_fields_pkey PRIMARY KEY (dag_id, task_id, run_id, map_index);


--
-- Name: serialized_dag serialized_dag_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.serialized_dag
    ADD CONSTRAINT serialized_dag_pkey PRIMARY KEY (dag_id);


--
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (id);


--
-- Name: session session_session_id_key; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_session_id_key UNIQUE (session_id);


--
-- Name: sla_miss sla_miss_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.sla_miss
    ADD CONSTRAINT sla_miss_pkey PRIMARY KEY (task_id, dag_id, execution_date);


--
-- Name: slot_pool slot_pool_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.slot_pool
    ADD CONSTRAINT slot_pool_pkey PRIMARY KEY (id);


--
-- Name: slot_pool slot_pool_pool_uq; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.slot_pool
    ADD CONSTRAINT slot_pool_pool_uq UNIQUE (pool);


--
-- Name: task_fail task_fail_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_fail
    ADD CONSTRAINT task_fail_pkey PRIMARY KEY (id);


--
-- Name: task_instance_history task_instance_history_dtrt_uq; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_instance_history
    ADD CONSTRAINT task_instance_history_dtrt_uq UNIQUE (dag_id, task_id, run_id, map_index, try_number);


--
-- Name: task_instance_history task_instance_history_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_instance_history
    ADD CONSTRAINT task_instance_history_pkey PRIMARY KEY (id);


--
-- Name: task_instance_note task_instance_note_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_instance_note
    ADD CONSTRAINT task_instance_note_pkey PRIMARY KEY (task_id, dag_id, run_id, map_index);


--
-- Name: task_instance task_instance_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_instance
    ADD CONSTRAINT task_instance_pkey PRIMARY KEY (dag_id, task_id, run_id, map_index);


--
-- Name: task_map task_map_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_map
    ADD CONSTRAINT task_map_pkey PRIMARY KEY (dag_id, task_id, run_id, map_index);


--
-- Name: task_reschedule task_reschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_reschedule
    ADD CONSTRAINT task_reschedule_pkey PRIMARY KEY (id);


--
-- Name: task_outlet_dataset_reference todr_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_outlet_dataset_reference
    ADD CONSTRAINT todr_pkey PRIMARY KEY (dataset_id, dag_id, task_id);


--
-- Name: trigger trigger_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.trigger
    ADD CONSTRAINT trigger_pkey PRIMARY KEY (id);


--
-- Name: variable variable_key_uq; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.variable
    ADD CONSTRAINT variable_key_uq UNIQUE (key);


--
-- Name: variable variable_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.variable
    ADD CONSTRAINT variable_pkey PRIMARY KEY (id);


--
-- Name: xcom xcom_pkey; Type: CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.xcom
    ADD CONSTRAINT xcom_pkey PRIMARY KEY (dag_run_id, task_id, map_index, key);


--
-- Name: dag_id_state; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX dag_id_state ON public.dag_run USING btree (dag_id, state);


--
-- Name: idx_ab_register_user_username; Type: INDEX; Schema: public; Owner: airflow
--

CREATE UNIQUE INDEX idx_ab_register_user_username ON public.ab_register_user USING btree (lower((username)::text));


--
-- Name: idx_ab_user_username; Type: INDEX; Schema: public; Owner: airflow
--

CREATE UNIQUE INDEX idx_ab_user_username ON public.ab_user USING btree (lower((username)::text));


--
-- Name: idx_dag_run_dag_id; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_dag_run_dag_id ON public.dag_run USING btree (dag_id);


--
-- Name: idx_dag_run_queued_dags; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_dag_run_queued_dags ON public.dag_run USING btree (state, dag_id) WHERE ((state)::text = 'queued'::text);


--
-- Name: idx_dag_run_running_dags; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_dag_run_running_dags ON public.dag_run USING btree (state, dag_id) WHERE ((state)::text = 'running'::text);


--
-- Name: idx_dag_schedule_dataset_alias_reference_dag_id; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_dag_schedule_dataset_alias_reference_dag_id ON public.dag_schedule_dataset_alias_reference USING btree (dag_id);


--
-- Name: idx_dag_schedule_dataset_reference_dag_id; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_dag_schedule_dataset_reference_dag_id ON public.dag_schedule_dataset_reference USING btree (dag_id);


--
-- Name: idx_dag_tag_dag_id; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_dag_tag_dag_id ON public.dag_tag USING btree (dag_id);


--
-- Name: idx_dag_warning_dag_id; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_dag_warning_dag_id ON public.dag_warning USING btree (dag_id);


--
-- Name: idx_dagrun_dataset_events_dag_run_id; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_dagrun_dataset_events_dag_run_id ON public.dagrun_dataset_event USING btree (dag_run_id);


--
-- Name: idx_dagrun_dataset_events_event_id; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_dagrun_dataset_events_event_id ON public.dagrun_dataset_event USING btree (event_id);


--
-- Name: idx_dataset_alias_dataset_alias_dataset_id; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_dataset_alias_dataset_alias_dataset_id ON public.dataset_alias_dataset USING btree (dataset_id);


--
-- Name: idx_dataset_alias_dataset_alias_id; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_dataset_alias_dataset_alias_id ON public.dataset_alias_dataset USING btree (alias_id);


--
-- Name: idx_dataset_alias_dataset_event_alias_id; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_dataset_alias_dataset_event_alias_id ON public.dataset_alias_dataset_event USING btree (alias_id);


--
-- Name: idx_dataset_alias_dataset_event_event_id; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_dataset_alias_dataset_event_event_id ON public.dataset_alias_dataset_event USING btree (event_id);


--
-- Name: idx_dataset_dag_run_queue_target_dag_id; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_dataset_dag_run_queue_target_dag_id ON public.dataset_dag_run_queue USING btree (target_dag_id);


--
-- Name: idx_dataset_id_timestamp; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_dataset_id_timestamp ON public.dataset_event USING btree (dataset_id, "timestamp");


--
-- Name: idx_fileloc_hash; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_fileloc_hash ON public.serialized_dag USING btree (fileloc_hash);


--
-- Name: idx_job_dag_id; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_job_dag_id ON public.job USING btree (dag_id);


--
-- Name: idx_job_state_heartbeat; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_job_state_heartbeat ON public.job USING btree (state, latest_heartbeat);


--
-- Name: idx_log_dag; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_log_dag ON public.log USING btree (dag_id);


--
-- Name: idx_log_dttm; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_log_dttm ON public.log USING btree (dttm);


--
-- Name: idx_log_event; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_log_event ON public.log USING btree (event);


--
-- Name: idx_log_task_instance; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_log_task_instance ON public.log USING btree (dag_id, task_id, run_id, map_index, try_number);


--
-- Name: idx_name_unique; Type: INDEX; Schema: public; Owner: airflow
--

CREATE UNIQUE INDEX idx_name_unique ON public.dataset_alias USING btree (name);


--
-- Name: idx_next_dagrun_create_after; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_next_dagrun_create_after ON public.dag USING btree (next_dagrun_create_after);


--
-- Name: idx_root_dag_id; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_root_dag_id ON public.dag USING btree (root_dag_id);


--
-- Name: idx_task_fail_task_instance; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_task_fail_task_instance ON public.task_fail USING btree (dag_id, task_id, run_id, map_index);


--
-- Name: idx_task_outlet_dataset_reference_dag_id; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_task_outlet_dataset_reference_dag_id ON public.task_outlet_dataset_reference USING btree (dag_id);


--
-- Name: idx_task_reschedule_dag_run; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_task_reschedule_dag_run ON public.task_reschedule USING btree (dag_id, run_id);


--
-- Name: idx_task_reschedule_dag_task_run; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_task_reschedule_dag_task_run ON public.task_reschedule USING btree (dag_id, task_id, run_id, map_index);


--
-- Name: idx_uri_unique; Type: INDEX; Schema: public; Owner: airflow
--

CREATE UNIQUE INDEX idx_uri_unique ON public.dataset USING btree (uri);


--
-- Name: idx_xcom_key; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_xcom_key ON public.xcom USING btree (key);


--
-- Name: idx_xcom_task_instance; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX idx_xcom_task_instance ON public.xcom USING btree (dag_id, task_id, run_id, map_index);


--
-- Name: job_type_heart; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX job_type_heart ON public.job USING btree (job_type, latest_heartbeat);


--
-- Name: sm_dag; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX sm_dag ON public.sla_miss USING btree (dag_id);


--
-- Name: ti_dag_run; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX ti_dag_run ON public.task_instance USING btree (dag_id, run_id);


--
-- Name: ti_dag_state; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX ti_dag_state ON public.task_instance USING btree (dag_id, state);


--
-- Name: ti_job_id; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX ti_job_id ON public.task_instance USING btree (job_id);


--
-- Name: ti_pool; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX ti_pool ON public.task_instance USING btree (pool, state, priority_weight);


--
-- Name: ti_state; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX ti_state ON public.task_instance USING btree (state);


--
-- Name: ti_state_lkp; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX ti_state_lkp ON public.task_instance USING btree (dag_id, task_id, run_id, state);


--
-- Name: ti_trigger_id; Type: INDEX; Schema: public; Owner: airflow
--

CREATE INDEX ti_trigger_id ON public.task_instance USING btree (trigger_id);


--
-- Name: ab_permission_view ab_permission_view_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.ab_permission(id);


--
-- Name: ab_permission_view_role ab_permission_view_role_permission_view_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_permission_view_id_fkey FOREIGN KEY (permission_view_id) REFERENCES public.ab_permission_view(id);


--
-- Name: ab_permission_view_role ab_permission_view_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_permission_view_role
    ADD CONSTRAINT ab_permission_view_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id);


--
-- Name: ab_permission_view ab_permission_view_view_menu_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_permission_view
    ADD CONSTRAINT ab_permission_view_view_menu_id_fkey FOREIGN KEY (view_menu_id) REFERENCES public.ab_view_menu(id);


--
-- Name: ab_user ab_user_changed_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_changed_by_fk_fkey FOREIGN KEY (changed_by_fk) REFERENCES public.ab_user(id);


--
-- Name: ab_user ab_user_created_by_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_user
    ADD CONSTRAINT ab_user_created_by_fk_fkey FOREIGN KEY (created_by_fk) REFERENCES public.ab_user(id);


--
-- Name: ab_user_role ab_user_role_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.ab_role(id);


--
-- Name: ab_user_role ab_user_role_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.ab_user_role
    ADD CONSTRAINT ab_user_role_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: dag_owner_attributes dag.dag_id; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_owner_attributes
    ADD CONSTRAINT "dag.dag_id" FOREIGN KEY (dag_id) REFERENCES public.dag(dag_id) ON DELETE CASCADE;


--
-- Name: dag_run_note dag_run_note_dr_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_run_note
    ADD CONSTRAINT dag_run_note_dr_fkey FOREIGN KEY (dag_run_id) REFERENCES public.dag_run(id) ON DELETE CASCADE;


--
-- Name: dag_run_note dag_run_note_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_run_note
    ADD CONSTRAINT dag_run_note_user_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: dag_tag dag_tag_dag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_tag
    ADD CONSTRAINT dag_tag_dag_id_fkey FOREIGN KEY (dag_id) REFERENCES public.dag(dag_id) ON DELETE CASCADE;


--
-- Name: dagrun_dataset_event dagrun_dataset_event_dag_run_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dagrun_dataset_event
    ADD CONSTRAINT dagrun_dataset_event_dag_run_id_fkey FOREIGN KEY (dag_run_id) REFERENCES public.dag_run(id) ON DELETE CASCADE;


--
-- Name: dagrun_dataset_event dagrun_dataset_event_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dagrun_dataset_event
    ADD CONSTRAINT dagrun_dataset_event_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.dataset_event(id) ON DELETE CASCADE;


--
-- Name: dataset_alias_dataset dataset_alias_dataset_alias_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dataset_alias_dataset
    ADD CONSTRAINT dataset_alias_dataset_alias_id_fkey FOREIGN KEY (alias_id) REFERENCES public.dataset_alias(id) ON DELETE CASCADE;


--
-- Name: dataset_alias_dataset dataset_alias_dataset_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dataset_alias_dataset
    ADD CONSTRAINT dataset_alias_dataset_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES public.dataset(id) ON DELETE CASCADE;


--
-- Name: dataset_alias_dataset_event dataset_alias_dataset_event_alias_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dataset_alias_dataset_event
    ADD CONSTRAINT dataset_alias_dataset_event_alias_id_fkey FOREIGN KEY (alias_id) REFERENCES public.dataset_alias(id) ON DELETE CASCADE;


--
-- Name: dataset_alias_dataset_event dataset_alias_dataset_event_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dataset_alias_dataset_event
    ADD CONSTRAINT dataset_alias_dataset_event_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.dataset_event(id) ON DELETE CASCADE;


--
-- Name: dag_warning dcw_dag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_warning
    ADD CONSTRAINT dcw_dag_id_fkey FOREIGN KEY (dag_id) REFERENCES public.dag(dag_id) ON DELETE CASCADE;


--
-- Name: dataset_dag_run_queue ddrq_dag_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dataset_dag_run_queue
    ADD CONSTRAINT ddrq_dag_fkey FOREIGN KEY (target_dag_id) REFERENCES public.dag(dag_id) ON DELETE CASCADE;


--
-- Name: dataset_dag_run_queue ddrq_dataset_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dataset_dag_run_queue
    ADD CONSTRAINT ddrq_dataset_fkey FOREIGN KEY (dataset_id) REFERENCES public.dataset(id) ON DELETE CASCADE;


--
-- Name: dataset_alias_dataset ds_dsa_alias_id; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dataset_alias_dataset
    ADD CONSTRAINT ds_dsa_alias_id FOREIGN KEY (alias_id) REFERENCES public.dataset_alias(id) ON DELETE CASCADE;


--
-- Name: dataset_alias_dataset ds_dsa_dataset_id; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dataset_alias_dataset
    ADD CONSTRAINT ds_dsa_dataset_id FOREIGN KEY (dataset_id) REFERENCES public.dataset(id) ON DELETE CASCADE;


--
-- Name: dag_schedule_dataset_alias_reference dsdar_dag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_schedule_dataset_alias_reference
    ADD CONSTRAINT dsdar_dag_id_fkey FOREIGN KEY (dag_id) REFERENCES public.dag(dag_id) ON DELETE CASCADE;


--
-- Name: dag_schedule_dataset_alias_reference dsdar_dataset_alias_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_schedule_dataset_alias_reference
    ADD CONSTRAINT dsdar_dataset_alias_fkey FOREIGN KEY (alias_id) REFERENCES public.dataset_alias(id) ON DELETE CASCADE;


--
-- Name: dag_schedule_dataset_reference dsdr_dag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_schedule_dataset_reference
    ADD CONSTRAINT dsdr_dag_id_fkey FOREIGN KEY (dag_id) REFERENCES public.dag(dag_id) ON DELETE CASCADE;


--
-- Name: dag_schedule_dataset_reference dsdr_dataset_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_schedule_dataset_reference
    ADD CONSTRAINT dsdr_dataset_fkey FOREIGN KEY (dataset_id) REFERENCES public.dataset(id) ON DELETE CASCADE;


--
-- Name: dataset_alias_dataset_event dss_de_alias_id; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dataset_alias_dataset_event
    ADD CONSTRAINT dss_de_alias_id FOREIGN KEY (alias_id) REFERENCES public.dataset_alias(id) ON DELETE CASCADE;


--
-- Name: dataset_alias_dataset_event dss_de_event_id; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dataset_alias_dataset_event
    ADD CONSTRAINT dss_de_event_id FOREIGN KEY (event_id) REFERENCES public.dataset_event(id) ON DELETE CASCADE;


--
-- Name: rendered_task_instance_fields rtif_ti_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.rendered_task_instance_fields
    ADD CONSTRAINT rtif_ti_fkey FOREIGN KEY (dag_id, task_id, run_id, map_index) REFERENCES public.task_instance(dag_id, task_id, run_id, map_index) ON DELETE CASCADE;


--
-- Name: task_fail task_fail_ti_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_fail
    ADD CONSTRAINT task_fail_ti_fkey FOREIGN KEY (dag_id, task_id, run_id, map_index) REFERENCES public.task_instance(dag_id, task_id, run_id, map_index) ON DELETE CASCADE;


--
-- Name: task_instance task_instance_dag_run_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_instance
    ADD CONSTRAINT task_instance_dag_run_fkey FOREIGN KEY (dag_id, run_id) REFERENCES public.dag_run(dag_id, run_id) ON DELETE CASCADE;


--
-- Name: task_instance_history task_instance_history_ti_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_instance_history
    ADD CONSTRAINT task_instance_history_ti_fkey FOREIGN KEY (dag_id, task_id, run_id, map_index) REFERENCES public.task_instance(dag_id, task_id, run_id, map_index) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: dag_run task_instance_log_template_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.dag_run
    ADD CONSTRAINT task_instance_log_template_id_fkey FOREIGN KEY (log_template_id) REFERENCES public.log_template(id);


--
-- Name: task_instance_note task_instance_note_ti_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_instance_note
    ADD CONSTRAINT task_instance_note_ti_fkey FOREIGN KEY (dag_id, task_id, run_id, map_index) REFERENCES public.task_instance(dag_id, task_id, run_id, map_index) ON DELETE CASCADE;


--
-- Name: task_instance_note task_instance_note_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_instance_note
    ADD CONSTRAINT task_instance_note_user_fkey FOREIGN KEY (user_id) REFERENCES public.ab_user(id);


--
-- Name: task_instance task_instance_trigger_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_instance
    ADD CONSTRAINT task_instance_trigger_id_fkey FOREIGN KEY (trigger_id) REFERENCES public.trigger(id) ON DELETE CASCADE;


--
-- Name: task_map task_map_task_instance_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_map
    ADD CONSTRAINT task_map_task_instance_fkey FOREIGN KEY (dag_id, task_id, run_id, map_index) REFERENCES public.task_instance(dag_id, task_id, run_id, map_index) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: task_reschedule task_reschedule_dr_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_reschedule
    ADD CONSTRAINT task_reschedule_dr_fkey FOREIGN KEY (dag_id, run_id) REFERENCES public.dag_run(dag_id, run_id) ON DELETE CASCADE;


--
-- Name: task_reschedule task_reschedule_ti_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_reschedule
    ADD CONSTRAINT task_reschedule_ti_fkey FOREIGN KEY (dag_id, task_id, run_id, map_index) REFERENCES public.task_instance(dag_id, task_id, run_id, map_index) ON DELETE CASCADE;


--
-- Name: task_outlet_dataset_reference todr_dag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_outlet_dataset_reference
    ADD CONSTRAINT todr_dag_id_fkey FOREIGN KEY (dag_id) REFERENCES public.dag(dag_id) ON DELETE CASCADE;


--
-- Name: task_outlet_dataset_reference todr_dataset_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.task_outlet_dataset_reference
    ADD CONSTRAINT todr_dataset_fkey FOREIGN KEY (dataset_id) REFERENCES public.dataset(id) ON DELETE CASCADE;


--
-- Name: xcom xcom_task_instance_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airflow
--

ALTER TABLE ONLY public.xcom
    ADD CONSTRAINT xcom_task_instance_fkey FOREIGN KEY (dag_id, task_id, run_id, map_index) REFERENCES public.task_instance(dag_id, task_id, run_id, map_index) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

