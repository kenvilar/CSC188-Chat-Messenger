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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: authority; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE authority (
    id bigint NOT NULL,
    version bigint NOT NULL,
    authority character varying(255) NOT NULL
);


ALTER TABLE public.authority OWNER TO postgres;

--
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE employee (
    id bigint NOT NULL,
    version bigint NOT NULL,
    account_expired boolean NOT NULL,
    account_locked boolean NOT NULL,
    address character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    password_expired boolean NOT NULL,
    username character varying(255) NOT NULL
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- Name: employee_authority; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE employee_authority (
    authority_id bigint NOT NULL,
    employee_id bigint NOT NULL
);


ALTER TABLE public.employee_authority OWNER TO postgres;

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

SELECT pg_catalog.setval('hibernate_sequence', 27, true);


--
-- Name: message; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE message (
    id bigint NOT NULL,
    version bigint NOT NULL,
    date_created timestamp without time zone NOT NULL,
    message character varying(255) NOT NULL,
    receiver_id bigint NOT NULL,
    sender_id bigint NOT NULL
);


ALTER TABLE public.message OWNER TO postgres;

--
-- Name: profile; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE profile (
    id bigint NOT NULL,
    version bigint NOT NULL,
    address character varying(255) NOT NULL,
    age character varying(255),
    civil_status character varying(255) NOT NULL,
    gender character varying(255) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.profile OWNER TO postgres;

--
-- Data for Name: authority; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO employee VALUES (21, 0, false, false, 'Sto. Rosario', true, 'Ken', 'Vilar', 'bb0854daad371bf77f35569f8b4864a335f2d87fbfbebe74189e0171e301187d', false, 'kenvilar');
INSERT INTO employee VALUES (27, 0, false, false, 'Palao', true, 'Jervey', 'Benitez', '165f7626c49c0c1fb24865236fe89377fef0d9ba90df735f4e8a91e87accf0a2', false, 'jerveybenitez');


--
-- Data for Name: employee_authority; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: message; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO message VALUES (22, 0, '2013-08-19 14:10:19.342', 'asdasd', 21, 21);
INSERT INTO message VALUES (23, 0, '2013-08-19 14:10:26.942', 'asdasd', 21, 21);
INSERT INTO message VALUES (24, 0, '2013-08-19 14:10:29.412', '', 21, 21);
INSERT INTO message VALUES (25, 0, '2013-08-19 14:10:30.258', '', 21, 21);
INSERT INTO message VALUES (26, 0, '2013-08-19 14:10:32.261', '', 21, 21);


--
-- Data for Name: profile; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: authority_authority_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY authority
    ADD CONSTRAINT authority_authority_key UNIQUE (authority);


--
-- Name: authority_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY authority
    ADD CONSTRAINT authority_pkey PRIMARY KEY (id);


--
-- Name: employee_authority_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY employee_authority
    ADD CONSTRAINT employee_authority_pkey PRIMARY KEY (authority_id, employee_id);


--
-- Name: employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- Name: employee_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT employee_username_key UNIQUE (username);


--
-- Name: message_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY message
    ADD CONSTRAINT message_pkey PRIMARY KEY (id);


--
-- Name: profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY profile
    ADD CONSTRAINT profile_pkey PRIMARY KEY (id);


--
-- Name: fk38eb0007466c58fb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY message
    ADD CONSTRAINT fk38eb0007466c58fb FOREIGN KEY (receiver_id) REFERENCES employee(id);


--
-- Name: fk38eb0007c5a9faf5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY message
    ADD CONSTRAINT fk38eb0007c5a9faf5 FOREIGN KEY (sender_id) REFERENCES employee(id);


--
-- Name: fkefe1e6f2a5af3e38; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employee_authority
    ADD CONSTRAINT fkefe1e6f2a5af3e38 FOREIGN KEY (authority_id) REFERENCES authority(id);


--
-- Name: fkefe1e6f2fa3aafdc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employee_authority
    ADD CONSTRAINT fkefe1e6f2fa3aafdc FOREIGN KEY (employee_id) REFERENCES employee(id);


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

