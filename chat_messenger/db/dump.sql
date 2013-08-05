--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 2, true);


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: list_of_employee; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE list_of_employee (
    id character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    user_name character varying(255) NOT NULL
);


ALTER TABLE public.list_of_employee OWNER TO postgres;

--
-- Data for Name: list_of_employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO list_of_employee VALUES ('2013-7304', 'Sto. Rosario', 'Ken', 'Vilar', 'qwe', 'kenvilar');
INSERT INTO list_of_employee VALUES ('2013-1295', 'Tibanga', 'Carlo', 'Apas', 'carloapas', 'kokocarlo');


--
-- Name: list_of_employee_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY list_of_employee
    ADD CONSTRAINT list_of_employee_id_key UNIQUE (id);


--
-- Name: list_of_employee_password_user_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY list_of_employee
    ADD CONSTRAINT list_of_employee_password_user_name_key UNIQUE (password, user_name);


--
-- Name: list_of_employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY list_of_employee
    ADD CONSTRAINT list_of_employee_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

