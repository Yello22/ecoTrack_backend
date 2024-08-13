--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg120+1)
-- Dumped by pg_dump version 16.3 (Debian 16.3-1.pgdg120+1)

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
-- Name: Roles; Type: TYPE; Schema: public; Owner: myuser
--

CREATE TYPE public."Roles" AS ENUM (
    'admin',
    'customer'
);


ALTER TYPE public."Roles" OWNER TO myuser;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Activity; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public."Activity" (
    id character(25) NOT NULL,
    description text,
    "carbonEmission" double precision NOT NULL,
    "userId" character(25) NOT NULL,
    "activityTypeId" character(25) NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "deletedAt" timestamp(3) without time zone
);


ALTER TABLE public."Activity" OWNER TO myuser;

--
-- Name: ActivityType; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public."ActivityType" (
    id character(25) NOT NULL,
    name character varying(50) NOT NULL,
    "carbonFactor" double precision NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "deletedAt" timestamp(3) without time zone
);


ALTER TABLE public."ActivityType" OWNER TO myuser;

--
-- Name: Challenge; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public."Challenge" (
    id character(25) NOT NULL,
    title character varying(100) NOT NULL,
    description text,
    "startDate" timestamp(3) without time zone NOT NULL,
    "endDate" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "deletedAt" timestamp(3) without time zone
);


ALTER TABLE public."Challenge" OWNER TO myuser;

--
-- Name: EnvironmentalData; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public."EnvironmentalData" (
    id character(25) NOT NULL,
    location character varying(100) NOT NULL,
    "airQuality" integer NOT NULL,
    temperature double precision NOT NULL,
    humidity double precision NOT NULL,
    "timestamp" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "deletedAt" timestamp(3) without time zone
);


ALTER TABLE public."EnvironmentalData" OWNER TO myuser;

--
-- Name: Notification; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public."Notification" (
    id character(25) NOT NULL,
    content text NOT NULL,
    read boolean DEFAULT false NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "deletedAt" timestamp(3) without time zone,
    "userId" character(25) NOT NULL
);


ALTER TABLE public."Notification" OWNER TO myuser;

--
-- Name: Suggestion; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public."Suggestion" (
    id character(25) NOT NULL,
    content text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "deletedAt" timestamp(3) without time zone,
    "userId" character(25) NOT NULL
);


ALTER TABLE public."Suggestion" OWNER TO myuser;

--
-- Name: TokenWhiteList; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public."TokenWhiteList" (
    id text NOT NULL,
    "userId" text NOT NULL,
    "accessToken" text,
    "refreshToken" text,
    "refreshTokenId" text,
    "expiredAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."TokenWhiteList" OWNER TO myuser;

--
-- Name: User; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public."User" (
    id text NOT NULL,
    email text NOT NULL,
    phone text,
    "firstName" text,
    "lastName" text,
    password text NOT NULL,
    roles public."Roles"[] DEFAULT ARRAY['customer'::public."Roles"],
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."User" OWNER TO myuser;

--
-- Name: UserChallenge; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public."UserChallenge" (
    id character(25) NOT NULL,
    "userId" character(25) NOT NULL,
    "challengeId" character(25) NOT NULL,
    completed boolean DEFAULT false NOT NULL,
    "completionDate" timestamp(3) without time zone,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."UserChallenge" OWNER TO myuser;

--
-- Name: UserEnvironmentalData; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public."UserEnvironmentalData" (
    id character(25) NOT NULL,
    "userId" character(25) NOT NULL,
    "environmentalDataId" character(25) NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."UserEnvironmentalData" OWNER TO myuser;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: myuser
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO myuser;

--
-- Data for Name: Activity; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public."Activity" (id, description, "carbonEmission", "userId", "activityTypeId", "createdAt", "updatedAt", "deletedAt") FROM stdin;
clz1kghjw00088qzyclfcntly	Diner du soir	20	clz158jab00008q40d8odkxrh	clz1jsz3a00068qzycir1jird	2024-07-25 17:47:35.517	2024-07-25 17:47:35.517	\N
\.


--
-- Data for Name: ActivityType; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public."ActivityType" (id, name, "carbonFactor", "createdAt", "updatedAt", "deletedAt") FROM stdin;
clz1js2vz00008qzylpukfdsw	Conduite	12	2024-07-25 17:28:36.767	2024-07-25 17:28:36.767	\N
clz1jsioh00028qzyq34lfvyt	Petit déjeuner	12	2024-07-25 17:28:57.233	2024-07-25 17:28:57.233	\N
clz1jss0e00048qzymw6paamw	Déjeuner	6	2024-07-25 17:29:09.326	2024-07-25 17:29:09.326	\N
clz1jsz3a00068qzycir1jird	Diner	10	2024-07-25 17:29:18.503	2024-07-25 17:29:18.503	\N
\.


--
-- Data for Name: Challenge; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public."Challenge" (id, title, description, "startDate", "endDate", "createdAt", "updatedAt", "deletedAt") FROM stdin;
\.


--
-- Data for Name: EnvironmentalData; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public."EnvironmentalData" (id, location, "airQuality", temperature, humidity, "timestamp", "createdAt", "updatedAt", "deletedAt") FROM stdin;
\.


--
-- Data for Name: Notification; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public."Notification" (id, content, read, "createdAt", "updatedAt", "deletedAt", "userId") FROM stdin;
\.


--
-- Data for Name: Suggestion; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public."Suggestion" (id, content, "createdAt", "updatedAt", "deletedAt", "userId") FROM stdin;
\.


--
-- Data for Name: TokenWhiteList; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public."TokenWhiteList" (id, "userId", "accessToken", "refreshToken", "refreshTokenId", "expiredAt", "createdAt", "updatedAt") FROM stdin;
clz71u9ww00008qnta4mzopgi	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjI2MTE4MywiZXhwIjoxODA4NjYxMTgzfQ.tcwOnocskEMzy2X-hCUgbmFblfiQrejRwBOAR5_O-cA	\N	2024-07-30 13:53:03.151	2024-07-29 13:53:03.153	2024-07-29 13:53:03.153
clz71u9x100028qntpwtgblg3	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjI2MTE4MywiZXhwIjoxNzIyNTYxMTgzfQ.GGJH3QkVcd5hmgB2hjOsT_wWpVfYp0i3RloO6cLdjuU	\N	clz71u9ww00008qnta4mzopgi	2024-07-29 13:58:03.156	2024-07-29 13:53:03.157	2024-07-29 13:53:03.157
clz7287k100048qntrgnpb8vb	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjI2MTgzMywiZXhwIjoxODA4NjYxODMzfQ.ZOD78VEmJ7ZaEqbd1EUkwGPuTCtTLRjb3E3DJgax0L0	\N	2024-07-30 14:03:53.278	2024-07-29 14:03:53.281	2024-07-29 14:03:53.281
clz7287kh00068qntul60ms40	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjI2MTgzMywiZXhwIjoxNzIyNTYxODMzfQ.5GvPP0Ti0-bKlR2AAuxwqTAxJ0Cd2AqhviHQ7VcGzZU	\N	clz7287k100048qntrgnpb8vb	2024-07-29 14:08:53.296	2024-07-29 14:03:53.298	2024-07-29 14:03:53.298
clz737oho00088qnt44gcltzu	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjI2MzQ4OCwiZXhwIjoxODA4NjYzNDg4fQ.lrBNJwBpYmh8IxTKKMrwHRywnlnfPAZ8hCI4Qlqdr8g	\N	2024-07-30 14:31:28.182	2024-07-29 14:31:28.187	2024-07-29 14:31:28.187
clz737ohw000a8qnte0d1qp44	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjI2MzQ4OCwiZXhwIjoxNzIyNTYzNDg4fQ.qWvtQKQqU405VC6Q9hxtDAFjq2lYvn2VjTMY9x5DdTo	\N	clz737oho00088qnt44gcltzu	2024-07-29 14:36:28.195	2024-07-29 14:31:28.197	2024-07-29 14:31:28.197
clz73rgk7000c8qntn23d6x58	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjI2NDQxMSwiZXhwIjoxODA4NjY0NDExfQ.99h8_SpT2EC4Oi51nZPObogDA7NABTlMEqksXiz6jGo	\N	2024-07-30 14:46:51.028	2024-07-29 14:46:51.031	2024-07-29 14:46:51.031
clz73rgkz000e8qntuaet7rp0	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjI2NDQxMSwiZXhwIjoxNzIyNTY0NDExfQ.GKwA4SxwknAk0274FfBxk69f3OF7PF2OXtOIcmxufIE	\N	clz73rgk7000c8qntn23d6x58	2024-07-29 14:51:51.058	2024-07-29 14:46:51.059	2024-07-29 14:46:51.059
clz73s7eb000g8qnt5rbcl01b	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjI2NDQ0NSwiZXhwIjoxODA4NjY0NDQ1fQ.0C2Tc_rdX4swu8lEEVZNMR8po9a33gqg8BpyviOln3s	\N	2024-07-30 14:47:25.811	2024-07-29 14:47:25.812	2024-07-29 14:47:25.812
clz73s7eg000i8qntiwu994av	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjI2NDQ0NSwiZXhwIjoxNzIyNTY0NDQ1fQ.l5fZkZEt2roKQnNHh9v1oZYJUrDWjfnLi8ki97COfbc	\N	clz73s7eb000g8qnt5rbcl01b	2024-07-29 14:52:25.815	2024-07-29 14:47:25.816	2024-07-29 14:47:25.816
clz73splt000k8qntvm6viwrb	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjI2NDQ2OSwiZXhwIjoxODA4NjY0NDY5fQ.6X6h2pn0phCk7pl68W_a_Cgsth8PCxyi2BacY81ACbY	\N	2024-07-30 14:47:49.408	2024-07-29 14:47:49.409	2024-07-29 14:47:49.409
clz73splx000m8qnte4t2ny0u	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjI2NDQ2OSwiZXhwIjoxNzIyNTY0NDY5fQ.no29V3L7OYt560492HhWaWWRU1SD4D1La5XBDGCl_Bc	\N	clz73splt000k8qntvm6viwrb	2024-07-29 14:52:49.412	2024-07-29 14:47:49.413	2024-07-29 14:47:49.413
clz73ux77000o8qnt4qb69pkt	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjI2NDU3MiwiZXhwIjoxODA4NjY0NTcyfQ.yDRRXiW9Dgvk-33pZTOQV9mcJblCNphQqznmIgbzTN0	\N	2024-07-30 14:49:32.562	2024-07-29 14:49:32.564	2024-07-29 14:49:32.564
clz73ux7b000q8qntfh9rdn09	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjI2NDU3MiwiZXhwIjoxNzIyNTY0NTcyfQ.TKkiFam90UPssGVQCwtPKeayIuKuW6ec5elX8Q_w88U	\N	clz73ux77000o8qnt4qb69pkt	2024-07-29 14:54:32.566	2024-07-29 14:49:32.567	2024-07-29 14:49:32.567
clz73uywc000s8qnt49m8khmd	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjI2NDU3NCwiZXhwIjoxODA4NjY0NTc0fQ.lBGnUVk6H-vTJbY6hmsQk2OLW9vodP3iRyN6WEsBIbY	\N	2024-07-30 14:49:34.763	2024-07-29 14:49:34.764	2024-07-29 14:49:34.764
clz73uywu000u8qntc4cpjt6a	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjI2NDU3NCwiZXhwIjoxNzIyNTY0NTc0fQ.Depj-etlQ95ewhvBdYAR_ZP-vbk2xbDqWzPLe1q6lCc	\N	clz73uywc000s8qnt49m8khmd	2024-07-29 14:54:34.782	2024-07-29 14:49:34.783	2024-07-29 14:49:34.783
clz740njw000w8qnte22i8rnw	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjI2NDgzOSwiZXhwIjoxODA4NjY0ODM5fQ.eugVLIUsaVpwTPth-qekhsxaP9C9UoKNkHvRV2EZMCc	\N	2024-07-30 14:53:59.992	2024-07-29 14:53:59.995	2024-07-29 14:53:59.995
clz740nk6000y8qntosjc2cp9	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjI2NDgzOSwiZXhwIjoxNzIyNTY0ODM5fQ.6ZFSN0mfYIR814JmHPO3NzTwfJWbCQ8BgIAB152PDpM	\N	clz740njw000w8qnte22i8rnw	2024-07-29 14:59:00.005	2024-07-29 14:54:00.006	2024-07-29 14:54:00.006
clz782w2z00008qoxluf9wer1	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjI3MTY2MiwiZXhwIjoxODA4NjcxNjYyfQ.itKvPtGO4vIxJNQwYTGa1jnjMseRWVNJ7udB5vOx1iQ	\N	2024-07-30 16:47:42.819	2024-07-29 16:47:42.827	2024-07-29 16:47:42.827
clz782w3800028qox6574wf1q	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjI3MTY2MiwiZXhwIjoxNzIyNTcxNjYyfQ.UR6La8k5M7l82ZRZMcPGVoyzSbNsTHh_bG8-X1AhJmw	\N	clz782w2z00008qoxluf9wer1	2024-07-29 16:52:42.835	2024-07-29 16:47:42.837	2024-07-29 16:47:42.837
clz782y2n00048qoxoek27le7	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjI3MTY2NSwiZXhwIjoxODA4NjcxNjY1fQ.8yF7NoiXrSO3gy9NyJOmCBGwyLFLF7Z7di7rz4ks0cc	\N	2024-07-30 16:47:45.406	2024-07-29 16:47:45.408	2024-07-29 16:47:45.408
clz782y2s00068qoxje7wdopt	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjI3MTY2NSwiZXhwIjoxNzIyNTcxNjY1fQ.uPZIdS8nLyCyI8C_r4PEapCWwnkLKmXVkOSBEh0rbuE	\N	clz782y2n00048qoxoek27le7	2024-07-29 16:52:45.411	2024-07-29 16:47:45.413	2024-07-29 16:47:45.413
clz7avu0e00088qoxov6r9wz9	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjI3NjM3MiwiZXhwIjoxODA4Njc2MzcyfQ.0hMWjvgkmWtirfCKGlQ2jEOri_ZatNsboE_XlBx7ykM	\N	2024-07-30 18:06:12.397	2024-07-29 18:06:12.398	2024-07-29 18:06:12.398
clz7avu0m000a8qoxd92ws52d	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjI3NjM3MiwiZXhwIjoxNzIyNTc2MzcyfQ.veujFeRL-Wek3xd5x18GDkYljPNN3OeA87Q6PzkB4Sg	\N	clz7avu0e00088qoxov6r9wz9	2024-07-29 18:11:12.403	2024-07-29 18:06:12.407	2024-07-29 18:06:12.407
clz7ayhat000c8qoxdsvew712	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjI3NjQ5NSwiZXhwIjoxODA4Njc2NDk1fQ.AvXoDsW9RKmXeNKyA5Ekt_g3gpj4GWHt2dotQbrH4FU	\N	2024-07-30 18:08:15.892	2024-07-29 18:08:15.893	2024-07-29 18:08:15.893
clz7ayhax000e8qoxtpwmj77t	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjI3NjQ5NSwiZXhwIjoxNzIyNTc2NDk1fQ.c3x_cfpMXPHjMVhpIK97duaefjThuusZ04dRk4oAPNA	\N	clz7ayhat000c8qoxdsvew712	2024-07-29 18:13:15.896	2024-07-29 18:08:15.897	2024-07-29 18:08:15.897
clz7azuky000g8qoxd3dkfeqk	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjI3NjU1OSwiZXhwIjoxODA4Njc2NTU5fQ.PdozAeBgnRsPp_XAVCKoxCmUE5xUlRNOB6z8GsqYQXI	\N	2024-07-30 18:09:19.76	2024-07-29 18:09:19.762	2024-07-29 18:09:19.762
clz7azul2000i8qoxn81qr1h1	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjI3NjU1OSwiZXhwIjoxNzIyNTc2NTU5fQ.jHj-VwJT5WovS-mOmzOTzpRZgohYomGvUf0cZqNvtBA	\N	clz7azuky000g8qoxd3dkfeqk	2024-07-29 18:14:19.765	2024-07-29 18:09:19.767	2024-07-29 18:09:19.767
clz83d6je00008qeflado7ka6	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjMyNDIxMSwiZXhwIjoxODA4NzI0MjExfQ.U754FtjOGrIcG863WSkeZgY8yySlmEEHuH8WsmbFsPQ	\N	2024-07-31 07:23:31.031	2024-07-30 07:23:31.034	2024-07-30 07:23:31.034
clz83d6jz00028qef55v8d8xg	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjMyNDIxMSwiZXhwIjoxNzIyNjI0MjExfQ.Vuipx4XjFkuBs5V695oY-XnsN1AZ1z0_ICIPMOkNXqU	\N	clz83d6je00008qeflado7ka6	2024-07-30 07:28:31.052	2024-07-30 07:23:31.055	2024-07-30 07:23:31.055
clz83d8cf00048qefu88161b0	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjMyNDIxMywiZXhwIjoxODA4NzI0MjEzfQ.cThFkc0cO-whT-KSfdPGaSko2sL_iv3WTgBrkYOSZAg	\N	2024-07-31 07:23:33.374	2024-07-30 07:23:33.376	2024-07-30 07:23:33.376
clz83d8cn00068qefisd5pdzc	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjMyNDIxMywiZXhwIjoxNzIyNjI0MjEzfQ.wQhIKHiqeSlHX34GqP-CIlmVh6tfX7fl0NmB5av9eIg	\N	clz83d8cf00048qefu88161b0	2024-07-30 07:28:33.381	2024-07-30 07:23:33.383	2024-07-30 07:23:33.383
clz83dhju00088qef5d2i27kf	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjMyNDIyNSwiZXhwIjoxODA4NzI0MjI1fQ.xs61VsbpQxSesA4vjeM7pZCPBl-sh4DUyZ4jQwh0FlE	\N	2024-07-31 07:23:45.305	2024-07-30 07:23:45.306	2024-07-30 07:23:45.306
clz83dhk6000a8qef2vhp52uv	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjMyNDIyNSwiZXhwIjoxNzIyNjI0MjI1fQ.u93HaJl-_XF2q09xsSbBEIqCzqTGRTmjxmHzSvNMQxk	\N	clz83dhju00088qef5d2i27kf	2024-07-30 07:28:45.317	2024-07-30 07:23:45.318	2024-07-30 07:23:45.318
clz83dis4000c8qefq0cs1ju8	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjMyNDIyNiwiZXhwIjoxODA4NzI0MjI2fQ.CZ99lBKKQiHH_FXqBStbQPGaYkCa4jR-PWFxuDps_5M	\N	2024-07-31 07:23:46.898	2024-07-30 07:23:46.9	2024-07-30 07:23:46.9
clz83dis9000e8qef3kpv6hmm	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjMyNDIyNiwiZXhwIjoxNzIyNjI0MjI2fQ.CxX8w1eocKhDVF_Kb2x5SoczGsZbKO7rBE4Ls3gh9RY	\N	clz83dis4000c8qefq0cs1ju8	2024-07-30 07:28:46.904	2024-07-30 07:23:46.905	2024-07-30 07:23:46.905
clz83eyah000g8qefbaa9sox4	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjMyNDI5MywiZXhwIjoxODA4NzI0MjkzfQ.lniCzquAZv8sB_KrLF8CA16DSHZgzq1yUh7FO9DkVRA	\N	2024-07-31 07:24:53.656	2024-07-30 07:24:53.658	2024-07-30 07:24:53.658
clz83eyam000i8qefd7rabh3z	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjMyNDI5MywiZXhwIjoxNzIyNjI0MjkzfQ.wDyZG4zJYa8fmU9DKgIAO-j17hcYdCCgByfU7trAmzA	\N	clz83eyah000g8qefbaa9sox4	2024-07-30 07:29:53.661	2024-07-30 07:24:53.663	2024-07-30 07:24:53.663
clz83gh2e000k8qeftb6lo642	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjMyNDM2NCwiZXhwIjoxODA4NzI0MzY0fQ.CjIJmLXLG_JSWr3ElIUougWsB8i_bPxKYjyat1bOMLk	\N	2024-07-31 07:26:04.645	2024-07-30 07:26:04.646	2024-07-30 07:26:04.646
clz83gh2h000m8qefe3pmo557	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjMyNDM2NCwiZXhwIjoxNzIyNjI0MzY0fQ.kaMiMPRWE7i3wzOkjpVygo1dXc5d1W-i6gX2LjpKf_c	\N	clz83gh2e000k8qeftb6lo642	2024-07-30 07:31:04.649	2024-07-30 07:26:04.65	2024-07-30 07:26:04.65
clz83i8kb000o8qefo9337yq6	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjMyNDQ0NiwiZXhwIjoxODA4NzI0NDQ2fQ.dbR_HXcUQ9IvW0aZRFhwpqw1pr5Gk6mXn_ZozcW22hk	\N	2024-07-31 07:27:26.939	2024-07-30 07:27:26.94	2024-07-30 07:27:26.94
clz83i8kn000q8qef2j1fgapo	103f5ae6-bb47-4d8a-a1fb-85dac22df58e	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEwM2Y1YWU2LWJiNDctNGQ4YS1hMWZiLTg1ZGFjMjJkZjU4ZSIsImVtYWlsIjoicmFrb3RvQGdtYWlsLmNvbSIsInJvbGVzIjpbImN1c3RvbWVyIl0sImlhdCI6MTcyMjMyNDQ0NiwiZXhwIjoxNzIyNjI0NDQ2fQ.Wbew-2A82Mz8EZ269zNiSZ0ve9Hsi-9oXk2h9N62LGc	\N	clz83i8kb000o8qefo9337yq6	2024-07-30 07:32:26.95	2024-07-30 07:27:26.951	2024-07-30 07:27:26.951
clz9qn7gy00008q7rff0bdbcg	clz8d906u000a8qltigzgylf3	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MjM3NzYsImV4cCI6MTgwODgyMzc3Nn0.RD9emQg6NIZ2eLpqG9N41ASpsvyACxPwWdVJ2uHY0Aw	\N	2024-08-01 11:02:56.123	2024-07-31 11:02:56.146	2024-07-31 11:02:56.146
clz9qn7hd00028q7rgzaqe0ie	clz8d906u000a8qltigzgylf3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MjM3NzYsImV4cCI6MTcyMjcyMzc3Nn0.Audvyj3Ca8nZf-6RI5qKQKtv17w_CJ_4Tw7Wd0KVzqw	\N	clz9qn7gy00008q7rff0bdbcg	2024-07-31 11:07:56.16	2024-07-31 11:02:56.162	2024-07-31 11:02:56.162
clz9qou8q00048q7roettdlhj	clz8d906u000a8qltigzgylf3	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MjM4NTIsImV4cCI6MTgwODgyMzg1Mn0.1PCXYtUiGSoEaHjthHgXmwe5wbPNW79zf86Z7jwdOIE	\N	2024-08-01 11:04:12.313	2024-07-31 11:04:12.315	2024-07-31 11:04:12.315
clz9qou8w00068q7rhpayul6r	clz8d906u000a8qltigzgylf3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MjM4NTIsImV4cCI6MTcyMjcyMzg1Mn0.7efjD1PtkNiJevushoCswQFIidranNdr8EJ6aFCu_hY	\N	clz9qou8q00048q7roettdlhj	2024-07-31 11:09:12.318	2024-07-31 11:04:12.32	2024-07-31 11:04:12.32
clz9qqm6o00088q7rhalhn2qc	clz8d906u000a8qltigzgylf3	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MjM5MzUsImV4cCI6MTgwODgyMzkzNX0.frOiXj1twvJYs6CrAXVRwSEQ3F1ws7iCjsENhY-1IZo	\N	2024-08-01 11:05:35.183	2024-07-31 11:05:35.185	2024-07-31 11:05:35.185
clz9qqm6u000a8q7r1h369ys4	clz8d906u000a8qltigzgylf3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MjM5MzUsImV4cCI6MTcyMjcyMzkzNX0.6oNQNKo0NfmftK7G6UzD-uOuEHoUzFaCezWK4gtRoBw	\N	clz9qqm6o00088q7rhalhn2qc	2024-07-31 11:10:35.188	2024-07-31 11:05:35.191	2024-07-31 11:05:35.191
clz9s0ufa00008q6m7t4u4f8l	clz8d906u000a8qltigzgylf3	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MjYwOTIsImV4cCI6MTgwODgyNjA5Mn0.k0UwBRToEtF2DQ7bhZIMMGx6y-mb5_UXkOCWxUc2IBA	\N	2024-08-01 11:41:32.029	2024-07-31 11:41:32.038	2024-07-31 11:41:32.038
clz9s0ufj00028q6mi34n3jgx	clz8d906u000a8qltigzgylf3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MjYwOTIsImV4cCI6MTcyMjcyNjA5Mn0.M6acDVgaZgRiTaoNm3rDuxndEYxhxxNx9ZzMZl5JOig	\N	clz9s0ufa00008q6m7t4u4f8l	2024-07-31 11:46:32.045	2024-07-31 11:41:32.047	2024-07-31 11:41:32.047
clz9s41zy00048q6m9e0k2fq6	clz8d906u000a8qltigzgylf3	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MjYyNDEsImV4cCI6MTgwODgyNjI0MX0.384oq6aLgcPao_KRToyudle4CZxf6skEuJdHJYz6Rc4	\N	2024-08-01 11:44:01.821	2024-07-31 11:44:01.823	2024-07-31 11:44:01.823
clz9s420400068q6mi1ewul02	clz8d906u000a8qltigzgylf3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MjYyNDEsImV4cCI6MTcyMjcyNjI0MX0.a-fpvekwwDR6fKHiB5Qzbq8UKwwfeIEuf7F-GFiXHk0	\N	clz9s41zy00048q6m9e0k2fq6	2024-07-31 11:49:01.827	2024-07-31 11:44:01.829	2024-07-31 11:44:01.829
clz9s4d8a00088q6meyhuesm2	clz8d906u000a8qltigzgylf3	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MjYyNTYsImV4cCI6MTgwODgyNjI1Nn0.UAGrAQcZFU0bGsvf5FV5gJD34RT1nbyj8FHFqryFTtc	\N	2024-08-01 11:44:16.377	2024-07-31 11:44:16.378	2024-07-31 11:44:16.378
clz9s4d8f000a8q6mbyv7tf31	clz8d906u000a8qltigzgylf3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MjYyNTYsImV4cCI6MTcyMjcyNjI1Nn0.1gVCMHQibrowoY6jl1pQoP6mlCjZOzT3JlDk6Kdo2p4	\N	clz9s4d8a00088q6meyhuesm2	2024-07-31 11:49:16.382	2024-07-31 11:44:16.383	2024-07-31 11:44:16.383
clz9t3rq0000c8q6mx5qv6gje	clz8d906u000a8qltigzgylf3	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0Mjc5MDgsImV4cCI6MTgwODgyNzkwOH0.YNhZ1fVI0rA3_Aq0eiAnoPGilk1hBUkEkHsmHTAfVDY	\N	2024-08-01 12:11:48.119	2024-07-31 12:11:48.12	2024-07-31 12:11:48.12
clz9t3rq6000e8q6m2aocot23	clz8d906u000a8qltigzgylf3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0Mjc5MDgsImV4cCI6MTcyMjcyNzkwOH0.ax1sxNfBwvsgSP3W38mBTxAaqDyBq9rKztLevn9vqBY	\N	clz9t3rq0000c8q6mx5qv6gje	2024-07-31 12:16:48.126	2024-07-31 12:11:48.127	2024-07-31 12:11:48.127
clz9tlw27000g8q6m50vfblmf	clz8d906u000a8qltigzgylf3	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0Mjg3NTMsImV4cCI6MTgwODgyODc1M30.A0yZmdp9mIoIA76YaWQ5h8Kc7hF7CntmEaXxtntqQdA	\N	2024-08-01 12:25:53.55	2024-07-31 12:25:53.551	2024-07-31 12:25:53.551
clz9tlw2c000i8q6mc70y1kwc	clz8d906u000a8qltigzgylf3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0Mjg3NTMsImV4cCI6MTcyMjcyODc1M30.0hRkXgWdaPNP6QH89IVPcbnTcfv-sODh3ggEOzU0jm4	\N	clz9tlw27000g8q6m50vfblmf	2024-07-31 12:30:53.555	2024-07-31 12:25:53.557	2024-07-31 12:25:53.557
clz9tm8eh000k8q6micoaynj2	clz8d906u000a8qltigzgylf3	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0Mjg3NjksImV4cCI6MTgwODgyODc2OX0.rqlIsZl9hFPExcGdcCfluOsO7xnYSMw2imvlMs8aTpg	\N	2024-08-01 12:26:09.544	2024-07-31 12:26:09.545	2024-07-31 12:26:09.545
clz9tm8el000m8q6mzrjbukxh	clz8d906u000a8qltigzgylf3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0Mjg3NjksImV4cCI6MTcyMjcyODc2OX0.gvzkohYJDtkEbh63rmRnmqcY169cC7ke0PFLETDv5J8	\N	clz9tm8eh000k8q6micoaynj2	2024-07-31 12:31:09.548	2024-07-31 12:26:09.55	2024-07-31 12:26:09.55
clz9tqg9800008qxdmq8uutkh	clz8d906u000a8qltigzgylf3	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0Mjg5NjYsImV4cCI6MTgwODgyODk2Nn0.kXgfHkHKOn4Bps-VbX2maloU9FKfl7mqN91NHhQc8Zw	\N	2024-08-01 12:29:26.343	2024-07-31 12:29:26.348	2024-07-31 12:29:26.348
clz9tqg9e00028qxdtk3wkysr	clz8d906u000a8qltigzgylf3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0Mjg5NjYsImV4cCI6MTcyMjcyODk2Nn0.QKkN94ZEi1lmRrnBI_uDbR4BB3A4DFLhGkq8K7380bQ	\N	clz9tqg9800008qxdmq8uutkh	2024-07-31 12:34:26.353	2024-07-31 12:29:26.355	2024-07-31 12:29:26.355
clz9tu62n00048qxdqwzw6d06	clz8d906u000a8qltigzgylf3	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MjkxMzksImV4cCI6MTgwODgyOTEzOX0.cjD1PBwpZosHSV867LZoe2YlTDzqjqmck_pI_yUofrU	\N	2024-08-01 12:32:19.774	2024-07-31 12:32:19.775	2024-07-31 12:32:19.775
clz9tu62s00068qxdpnfxblmf	clz8d906u000a8qltigzgylf3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MjkxMzksImV4cCI6MTcyMjcyOTEzOX0.vhNm78XoV1Zz2im8u6-zB7nbB7_NctkCs6NHvcoTKdo	\N	clz9tu62n00048qxdqwzw6d06	2024-07-31 12:37:19.779	2024-07-31 12:32:19.781	2024-07-31 12:32:19.781
clz9um12y00088qxd953b2ybu	clz8d906u000a8qltigzgylf3	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MzA0MzksImV4cCI6MTgwODgzMDQzOX0.FqpyEgAhVulo7vRQ7A-mnNlAUDhuFpFaCigE0niYZ54	\N	2024-08-01 12:53:59.672	2024-07-31 12:53:59.674	2024-07-31 12:53:59.674
clz9um135000a8qxd9y8ulops	clz8d906u000a8qltigzgylf3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MzA0MzksImV4cCI6MTcyMjczMDQzOX0.ygcvbN9gF93rNC2bFy4XzdlSJcOuRSoy6DNDAVoRJRk	\N	clz9um12y00088qxd953b2ybu	2024-07-31 12:58:59.68	2024-07-31 12:53:59.681	2024-07-31 12:53:59.681
clz9um67m000c8qxdh6fu30n0	clz8d906u000a8qltigzgylf3	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MzA0NDYsImV4cCI6MTgwODgzMDQ0Nn0.nV7roRYliHPSdbWrKGZjDPxmQsyN5vTHU_BgZm5A060	\N	2024-08-01 12:54:06.321	2024-07-31 12:54:06.323	2024-07-31 12:54:06.323
clz9um67v000e8qxdw4f9tvub	clz8d906u000a8qltigzgylf3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MzA0NDYsImV4cCI6MTcyMjczMDQ0Nn0.ileKKetfNPLlT3DhQ2p7dT8BBPEbVh-TSaw0392F9xY	\N	clz9um67m000c8qxdh6fu30n0	2024-07-31 12:59:06.327	2024-07-31 12:54:06.328	2024-07-31 12:54:06.328
clz9upcgj000g8qxdr4zvjtf2	clz8d906u000a8qltigzgylf3	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MzA1OTQsImV4cCI6MTgwODgzMDU5NH0.yLxfjZSOV5s1TRkHdXec41N41J73F8H_pNhIKVgGPXU	\N	2024-08-01 12:56:34.387	2024-07-31 12:56:34.388	2024-07-31 12:56:34.388
clz9upcgn000i8qxdit3792me	clz8d906u000a8qltigzgylf3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MzA1OTQsImV4cCI6MTcyMjczMDU5NH0.zJu7eLdPN7I1pqKJHY2GwQ6aorFovZRoReTprzOHv0s	\N	clz9upcgj000g8qxdr4zvjtf2	2024-07-31 13:01:34.391	2024-07-31 12:56:34.392	2024-07-31 12:56:34.392
clz9upgja000k8qxd3s3gtvrj	clz8d906u000a8qltigzgylf3	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MzA1OTksImV4cCI6MTgwODgzMDU5OX0.gk_0p78LzDu0eQf9wudKd2dYcdil1YhG1Kwk4vm_-ZY	\N	2024-08-01 12:56:39.67	2024-07-31 12:56:39.671	2024-07-31 12:56:39.671
clz9upglv000m8qxdl3bl8dcf	clz8d906u000a8qltigzgylf3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MzA1OTksImV4cCI6MTcyMjczMDU5OX0.evWRp4xHy2xA_jy7Yjfrv0LcwZAvuNuabRH6hvTplTY	\N	clz9upgja000k8qxd3s3gtvrj	2024-07-31 13:01:39.762	2024-07-31 12:56:39.763	2024-07-31 12:56:39.763
clz9xlsc1000o8qxdk2p3ep6w	clz8d906u000a8qltigzgylf3	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MzU0NjcsImV4cCI6MTgwODgzNTQ2N30.WzuUNFNuYCqMuzQHUASLLK2AbAvqpWlLURRg3qrI9TI	\N	2024-08-01 14:17:47.181	2024-07-31 14:17:47.185	2024-07-31 14:17:47.185
clz9xlsca000q8qxdxa793pim	clz8d906u000a8qltigzgylf3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MzU0NjcsImV4cCI6MTcyMjczNTQ2N30.nkcktxznwSMnvcOtMUx4DisB0NZP088uK847ZOAw3vU	\N	clz9xlsc1000o8qxdk2p3ep6w	2024-07-31 14:22:47.194	2024-07-31 14:17:47.195	2024-07-31 14:17:47.195
clz9xo1nd000s8qxdwgv3lfym	clz8d906u000a8qltigzgylf3	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MzU1NzIsImV4cCI6MTgwODgzNTU3Mn0._FjTrndPwKll3fv_aktFur7tI7JSfsIOTuRbHEr9vb8	\N	2024-08-01 14:19:32.567	2024-07-31 14:19:32.569	2024-07-31 14:19:32.569
clz9xo1nn000u8qxdsj59nf8b	clz8d906u000a8qltigzgylf3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MzU1NzIsImV4cCI6MTcyMjczNTU3Mn0.Z17GQNO8Q5IVYsvfdIBDyadmkWFO_RqylGOKQsKfqAE	\N	clz9xo1nd000s8qxdwgv3lfym	2024-07-31 14:24:32.578	2024-07-31 14:19:32.579	2024-07-31 14:19:32.579
clz9xuq9w000w8qxdqog3xlgy	clz8d906u000a8qltigzgylf3	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MzU4ODQsImV4cCI6MTgwODgzNTg4NH0.aqqIgrJ8z8qJpx0pQUPRY0LM1NTb974hQ10M56ISIZg	\N	2024-08-01 14:24:44.419	2024-07-31 14:24:44.421	2024-07-31 14:24:44.421
clz9xuqa7000y8qxdd5p7ua4x	clz8d906u000a8qltigzgylf3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MzU4ODQsImV4cCI6MTcyMjczNTg4NH0.GTOf3iJ09qvuyIgV0Eybdd70vjnUgbVbRoNVu4euA4E	\N	clz9xuq9w000w8qxdqog3xlgy	2024-07-31 14:29:44.43	2024-07-31 14:24:44.431	2024-07-31 14:24:44.431
clz9xw3f800108qxdj9ry8fub	clz8d906u000a8qltigzgylf3	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MzU5NDgsImV4cCI6MTgwODgzNTk0OH0.4GczPAqndqVa_mC2Zew7T6PEgxZCr3cVzuOyMjDOeW8	\N	2024-08-01 14:25:48.115	2024-07-31 14:25:48.116	2024-07-31 14:25:48.116
clz9xw3fc00128qxdz8bvcxjc	clz8d906u000a8qltigzgylf3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MzU5NDgsImV4cCI6MTcyMjczNTk0OH0.HPSHHP6giZFj2dKlUCWvJDhgHNnqjRbgYmzlSWQOlS8	\N	clz9xw3f800108qxdj9ry8fub	2024-07-31 14:30:48.119	2024-07-31 14:25:48.121	2024-07-31 14:25:48.121
clz9xzjni00148qxdgagltpss	clz8d906u000a8qltigzgylf3	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MzYxMDksImV4cCI6MTgwODgzNjEwOX0.Goe0ken9lAZ8n37wY9sBJHrsL4R0Fm_OF4DppWkZrbA	\N	2024-08-01 14:28:29.118	2024-07-31 14:28:29.119	2024-07-31 14:28:29.119
clz9xzjnm00168qxdm2d5axba	clz8d906u000a8qltigzgylf3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MzYxMDksImV4cCI6MTcyMjczNjEwOX0.2t6TkPyHoSmBszTLh-UQrps1Rzu9T01Eh4lDkOtm-aA	\N	clz9xzjni00148qxdgagltpss	2024-07-31 14:33:29.122	2024-07-31 14:28:29.123	2024-07-31 14:28:29.123
clz9y1k9700188qxdfhpin5b3	clz8d906u000a8qltigzgylf3	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MzYyMDMsImV4cCI6MTgwODgzNjIwM30.5bnV2hNYFmuVWIUptrg61CMd1Zn_-bIG-125b9ZB1_c	\N	2024-08-01 14:30:03.21	2024-07-31 14:30:03.211	2024-07-31 14:30:03.211
clz9y1k9a001a8qxdsvypq9xg	clz8d906u000a8qltigzgylf3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MzYyMDMsImV4cCI6MTcyMjczNjIwM30.Yx1Mz9ux_CC8UAFqbNT7N41Q7sxQqncFrzXk-tW-CeE	\N	clz9y1k9700188qxdfhpin5b3	2024-07-31 14:35:03.214	2024-07-31 14:30:03.215	2024-07-31 14:30:03.215
clz9yc314001c8qxde2krw8mb	clz8d906u000a8qltigzgylf3	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MzY2OTQsImV4cCI6MTgwODgzNjY5NH0.HTFskYC2FMLgtPa5mIyqPESI9eFTwZsop-uv7K8-t60	\N	2024-08-01 14:38:14.102	2024-07-31 14:38:14.105	2024-07-31 14:38:14.105
clz9yc31d001e8qxdrekbmoas	clz8d906u000a8qltigzgylf3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MzY2OTQsImV4cCI6MTcyMjczNjY5NH0.llDYGY4kvgYFf4wghnt3Z_H_LgjkSMP_Tec6erpzHRY	\N	clz9yc314001c8qxde2krw8mb	2024-07-31 14:43:14.112	2024-07-31 14:38:14.113	2024-07-31 14:38:14.113
clz9yfjrj001g8qxdeo58ho0x	clz8d906u000a8qltigzgylf3	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MzY4NTUsImV4cCI6MTgwODgzNjg1NX0.C1MY0YvZhMIXSU7cy5dVZhfN_cclT5zA5JuYbbLQzhg	\N	2024-08-01 14:40:55.757	2024-07-31 14:40:55.76	2024-07-31 14:40:55.76
clz9yfjrw001i8qxdfkq0n2au	clz8d906u000a8qltigzgylf3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MzY4NTUsImV4cCI6MTcyMjczNjg1NX0.CHIEphCqnTUw2OpM73i0aNzeAwJ1STDeDRNYr2HL0RI	\N	clz9yfjrj001g8qxdeo58ho0x	2024-07-31 14:45:55.771	2024-07-31 14:40:55.772	2024-07-31 14:40:55.772
clz9yj40p001k8qxd3688u58n	clz8d906u000a8qltigzgylf3	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MzcwMjEsImV4cCI6MTgwODgzNzAyMX0.KsssPLQzBqHz9Hjt0740K1KFZTprqO6K_FMEuk8xe0s	\N	2024-08-01 14:43:41.977	2024-07-31 14:43:41.978	2024-07-31 14:43:41.978
clz9yj40u001m8qxdkib0vchq	clz8d906u000a8qltigzgylf3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0MzcwMjEsImV4cCI6MTcyMjczNzAyMX0.Scuki5Z5e-rWEjFABveQQYjI8aR1HEZS2EdTsDrv_70	\N	clz9yj40p001k8qxd3688u58n	2024-07-31 14:48:41.981	2024-07-31 14:43:41.982	2024-07-31 14:43:41.982
clza3fk5e00008qkfufwojdyw	clz8d906u000a8qltigzgylf3	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0NDUyNTQsImV4cCI6MTgwODg0NTI1NH0.iQLu8i5dP58pYi-YH0g4qo_7OO9whlw2o0zfJQuUryY	\N	2024-08-01 17:00:54.331	2024-07-31 17:00:54.338	2024-07-31 17:00:54.338
clza3fk5u00028qkf1hyo3im6	clz8d906u000a8qltigzgylf3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0NDUyNTQsImV4cCI6MTcyMjc0NTI1NH0.IZLUTiTgJ1ESqp2sAT-vgyofQu0S-qmxmWR_s-m76W0	\N	clza3fk5e00008qkfufwojdyw	2024-07-31 17:05:54.349	2024-07-31 17:00:54.355	2024-07-31 17:00:54.355
clza3fs2800048qkf9vesjed5	clz8d906u000a8qltigzgylf3	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0NDUyNjQsImV4cCI6MTgwODg0NTI2NH0.LLEz5iXGzav7VWAyqNIsHL-mMXxWk1jKN9gNJigjBbY	\N	2024-08-01 17:01:04.591	2024-07-31 17:01:04.592	2024-07-31 17:01:04.592
clza3fs2l00068qkf3b7iwucv	clz8d906u000a8qltigzgylf3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0NDUyNjQsImV4cCI6MTcyMjc0NTI2NH0.7ljx9v2PWfztEIxyRA1jDzuvu_fiWUim9ntZLL7AVeM	\N	clza3fs2800048qkf9vesjed5	2024-07-31 17:06:04.603	2024-07-31 17:01:04.605	2024-07-31 17:01:04.605
clza3jx4300088qkfhwbthfmb	clz8d906u000a8qltigzgylf3	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0NDU0NTcsImV4cCI6MTgwODg0NTQ1N30.MhOO83X94MPrUt1MGh1qjqU9uL7JQdWcswAvPGvj2n0	\N	2024-08-01 17:04:17.762	2024-07-31 17:04:17.764	2024-07-31 17:04:17.764
clza3jx47000a8qkfnm4h9ni1	clz8d906u000a8qltigzgylf3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0NDU0NTcsImV4cCI6MTcyMjc0NTQ1N30.cPlfHxM6vMXXhmWpZb0swtxKvhTYYg7wL53CWJnN1UM	\N	clza3jx4300088qkfhwbthfmb	2024-07-31 17:09:17.767	2024-07-31 17:04:17.768	2024-07-31 17:04:17.768
clza3m35n000c8qkf674q5cxu	clz8d906u000a8qltigzgylf3	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0NDU1NTgsImV4cCI6MTgwODg0NTU1OH0.fte59sCmrHIiNloPq5s_jRSwO13IKQkZfdTt_218eWQ	\N	2024-08-01 17:05:58.906	2024-07-31 17:05:58.907	2024-07-31 17:05:58.907
clza3m35x000e8qkfdyacxrxd	clz8d906u000a8qltigzgylf3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI0NDU1NTgsImV4cCI6MTcyMjc0NTU1OH0.-AZzILkkQYwDJyPbbDwRL3Lw_TjOhBN6U9f8CRm-sEw	\N	clza3m35n000c8qkf674q5cxu	2024-07-31 17:10:58.917	2024-07-31 17:05:58.918	2024-07-31 17:05:58.918
clzbnlenq00008qlvb69zdbm8	clz8d906u000a8qltigzgylf3	\N	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI1Mzk1ODUsImV4cCI6MTgwODkzOTU4NX0.zoikIXNPiBe3lDHm4DoiaT8fhA-Ep9vX4mEpEoCH7ls	\N	2024-08-02 19:13:05.654	2024-08-01 19:13:05.655	2024-08-01 19:13:05.655
clzbnleo000028qlv0i23m0zq	clz8d906u000a8qltigzgylf3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImNsejhkOTA2dTAwMGE4cWx0aWd6Z3lsZjMiLCJlbWFpbCI6InJhemFybzI5NEBnbWFpbC5jb20iLCJyb2xlcyI6WyJjdXN0b21lciJdLCJpYXQiOjE3MjI1Mzk1ODUsImV4cCI6MTcyMjgzOTU4NX0.9nIa9aPf2VTxP4tbd8VFFz7esI63uXvC26EaV61rxJo	\N	clzbnlenq00008qlvb69zdbm8	2024-08-01 19:18:05.663	2024-08-01 19:13:05.664	2024-08-01 19:13:05.664
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public."User" (id, email, phone, "firstName", "lastName", password, roles, "createdAt", "updatedAt") FROM stdin;
103f5ae6-bb47-4d8a-a1fb-85dac22df58e	rakoto@gmail.com	\N	Rakoto-first-name	Rakoto	$2b$10$QOcOTNucoY.Ff2mi.3ZOTOv.j1KiofOD8pp6PTEeXNxBUJRwvfAHe	{customer}	2024-07-25 07:21:09.767	2024-07-25 07:21:09.767
ed27dac2-e05b-43d9-ac6d-ef90d69c3087	rasoa@gmail.com	\N	Rasoa-first-name	Rasoa	$2b$10$3EBMYxfQOxRm3zAOUDivfuMI2PwNU2roZVjwqN7zvg/kHoggeIivO	{customer}	2024-07-25 09:04:22.232	2024-07-25 09:04:22.232
d2b4f07a-918b-4100-a491-904e5d649617	ranaivo@gmail.com	\N	Ranaivo-first-name	Ranaivo	$2b$10$GSm3ViA3pKOISoBuYT2jkOTCIu6mANXTci4l9exFunGstSBclGJie	{customer}	2024-07-25 10:40:49.805	2024-07-25 10:40:49.805
clz158jab00008q40d8odkxrh	rivo@gmail.com	\N	Rivo-first-name	Rivo	$2b$10$CijUtXkCb.kq5wR7ZloIdO.fESYjHCsHSMHtGMXXcMSUIMDAYP4iO	{customer}	2024-07-25 10:41:30.275	2024-07-25 10:41:30.275
clz898f61000w8qef6d060v1w	naivo@gmail.com	\N	Naivo-first-name	Naivo	$2b$10$QWt9Ody6WukboVdn5wBfqevRbpQ/RSPeQsS0XizqEXLIvYXglC0yC	{customer}	2024-07-30 10:07:46.633	2024-07-30 10:07:46.633
clz8d906u000a8qltigzgylf3	razaro294@gmail.com	\N	Raz	Steven	$2b$10$u5PFT0Ffj/sLgmwn9cf8f.EtrKAOHEObb9EHRYjmCahzdoU9CCFUW	{customer}	2024-07-30 12:00:12.342	2024-07-30 12:00:12.342
\.


--
-- Data for Name: UserChallenge; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public."UserChallenge" (id, "userId", "challengeId", completed, "completionDate", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: UserEnvironmentalData; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public."UserEnvironmentalData" (id, "userId", "environmentalDataId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: myuser
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
1a116939-28dd-4f7f-ac52-dda026005cef	85d23b080dcafcaa5d1bdb4e11cee5754d056eb2e042d51aca09743fedc11c07	2024-07-25 06:53:46.698995+00	20240725065322_init	\N	\N	2024-07-25 06:53:46.674373+00	1
090ee55c-93cc-4747-b011-b83fa333c53f	4f926d2b1bef5252fc3948734a3e6ca47deec8ce1f5bb3d2bc661ef982243939	2024-07-25 07:04:18.200956+00	20240725070418_init	\N	\N	2024-07-25 07:04:18.1439+00	1
\.


--
-- Name: ActivityType ActivityType_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."ActivityType"
    ADD CONSTRAINT "ActivityType_pkey" PRIMARY KEY (id);


--
-- Name: Activity Activity_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."Activity"
    ADD CONSTRAINT "Activity_pkey" PRIMARY KEY (id);


--
-- Name: Challenge Challenge_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."Challenge"
    ADD CONSTRAINT "Challenge_pkey" PRIMARY KEY (id);


--
-- Name: EnvironmentalData EnvironmentalData_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."EnvironmentalData"
    ADD CONSTRAINT "EnvironmentalData_pkey" PRIMARY KEY (id);


--
-- Name: Notification Notification_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."Notification"
    ADD CONSTRAINT "Notification_pkey" PRIMARY KEY (id);


--
-- Name: Suggestion Suggestion_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."Suggestion"
    ADD CONSTRAINT "Suggestion_pkey" PRIMARY KEY (id);


--
-- Name: TokenWhiteList TokenWhiteList_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."TokenWhiteList"
    ADD CONSTRAINT "TokenWhiteList_pkey" PRIMARY KEY (id);


--
-- Name: UserChallenge UserChallenge_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."UserChallenge"
    ADD CONSTRAINT "UserChallenge_pkey" PRIMARY KEY (id);


--
-- Name: UserEnvironmentalData UserEnvironmentalData_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."UserEnvironmentalData"
    ADD CONSTRAINT "UserEnvironmentalData_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: myuser
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: Activity Activity_activityTypeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."Activity"
    ADD CONSTRAINT "Activity_activityTypeId_fkey" FOREIGN KEY ("activityTypeId") REFERENCES public."ActivityType"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Activity Activity_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."Activity"
    ADD CONSTRAINT "Activity_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Notification Notification_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."Notification"
    ADD CONSTRAINT "Notification_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Suggestion Suggestion_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."Suggestion"
    ADD CONSTRAINT "Suggestion_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: UserChallenge UserChallenge_challengeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."UserChallenge"
    ADD CONSTRAINT "UserChallenge_challengeId_fkey" FOREIGN KEY ("challengeId") REFERENCES public."Challenge"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: UserChallenge UserChallenge_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."UserChallenge"
    ADD CONSTRAINT "UserChallenge_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: UserEnvironmentalData UserEnvironmentalData_environmentalDataId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."UserEnvironmentalData"
    ADD CONSTRAINT "UserEnvironmentalData_environmentalDataId_fkey" FOREIGN KEY ("environmentalDataId") REFERENCES public."EnvironmentalData"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: UserEnvironmentalData UserEnvironmentalData_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: myuser
--

ALTER TABLE ONLY public."UserEnvironmentalData"
    ADD CONSTRAINT "UserEnvironmentalData_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

