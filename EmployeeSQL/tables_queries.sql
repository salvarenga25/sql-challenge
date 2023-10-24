--
-- PostgreSQL database dump
--

-- Dumped from database version 13.12
-- Dumped by pg_dump version 15.1

-- Started on 2023-10-24 15:03:33 EDT

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



-- Database: Employee_DB

-- DROP DATABASE IF EXISTS "Employee_DB";
CREATE DATABASE "Employee_DB"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;




CREATE TABLE public.departments (
    dept_no character varying(6) NOT NULL,
    dept_name character varying(100)
);

ALTER TABLE public.departments OWNER TO postgres;



CREATE TABLE public.dept_emp (
    emp_no bigint,
    dept_no character varying(6)
);

ALTER TABLE public.dept_emp OWNER TO postgres;


CREATE TABLE public.dept_manager (
    dept_no character varying(6),
    emp_no bigint
);

ALTER TABLE public.dept_manager OWNER TO postgres;


CREATE TABLE public.employees (
    emp_no bigint NOT NULL,
    emp_title_id character varying(7) NOT NULL,
    birth_date date,
    first_name character varying(100),
    last_name character varying(100),
    sex "char",
    hire_date date
);

ALTER TABLE public.employees OWNER TO postgres;



CREATE TABLE public.salaries (
    emp_no bigint,
    salary integer
);

ALTER TABLE public.salaries OWNER TO postgres;



CREATE TABLE public.titles (
    title_id character varying(6) NOT NULL,
    title character varying(100) NOT NULL
);


ALTER TABLE public.titles OWNER TO postgres;



-----------------------------------------------------------
-- ADDING CONSTRAINTS FOR PRIMRY AND FOREIGN KEYS
-----------------------------------------------------------

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_dept_no_dept_no1_key UNIQUE (dept_no) INCLUDE (dept_no);

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (dept_no);

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT emp_no UNIQUE (emp_no) INCLUDE (emp_no);

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (emp_no);

ALTER TABLE ONLY public.titles
    ADD CONSTRAINT titles_pkey PRIMARY KEY (title_id);



ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT "FK_DEPT_NO" FOREIGN KEY (dept_no) REFERENCES public.departments(dept_no) NOT VALID;

ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT "FK_DEPT_NO" FOREIGN KEY (dept_no) REFERENCES public.departments(dept_no) NOT VALID;

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT "FK_EMP_NO" FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no) NOT VALID;

ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT "FK_EMP_NO" FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no);

ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT "FK_EMP_NO" FOREIGN KEY (emp_no) REFERENCES public.employees(emp_no) NOT VALID;

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT emp_title_id FOREIGN KEY (emp_title_id) REFERENCES public.titles(title_id);




