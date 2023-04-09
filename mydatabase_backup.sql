--
-- PostgreSQL database dump
--

-- Dumped from database version 13.9 (Debian 13.9-0+deb11u1)
-- Dumped by pg_dump version 13.9 (Debian 13.9-0+deb11u1)

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
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin (
    id bigint NOT NULL,
    chat_id bigint
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admins_id_seq OWNER TO postgres;

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admin.id;


--
-- Name: appointments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appointments (
    id bigint NOT NULL,
    barber_id bigint NOT NULL,
    chat_id bigint NOT NULL,
    date text,
    start_time text NOT NULL,
    end_time text NOT NULL,
    service_id integer NOT NULL,
    confirmed boolean DEFAULT false NOT NULL,
    confirmed_at text,
    booked_date text
);


ALTER TABLE public.appointments OWNER TO postgres;

--
-- Name: appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.appointments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appointments_id_seq OWNER TO postgres;

--
-- Name: appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.appointments_id_seq OWNED BY public.appointments.id;


--
-- Name: barbers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.barbers (
    barber_chat_id bigint NOT NULL,
    barber_info text,
    team_id bigint,
    barber_id bigint NOT NULL,
    name text,
    location text
);


ALTER TABLE public.barbers OWNER TO postgres;

--
-- Name: barbers_barber_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.barbers_barber_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.barbers_barber_id_seq OWNER TO postgres;

--
-- Name: barbers_barber_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.barbers_barber_id_seq OWNED BY public.barbers.barber_id;


--
-- Name: canceled_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.canceled_orders (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    canceled_at text NOT NULL
);


ALTER TABLE public.canceled_orders OWNER TO postgres;

--
-- Name: canceled_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.canceled_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.canceled_orders_id_seq OWNER TO postgres;

--
-- Name: canceled_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.canceled_orders_id_seq OWNED BY public.canceled_orders.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messages (
    message_id bigint NOT NULL,
    chat_id bigint,
    client_chat_id bigint,
    client_message_id bigint
);


ALTER TABLE public.messages OWNER TO postgres;

--
-- Name: pricing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pricing (
    id bigint NOT NULL,
    service_id bigint NOT NULL,
    barber_id bigint NOT NULL,
    price bigint
);


ALTER TABLE public.pricing OWNER TO postgres;

--
-- Name: pricing_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pricing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pricing_id_seq OWNER TO postgres;

--
-- Name: pricing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pricing_id_seq OWNED BY public.pricing.id;


--
-- Name: requesting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requesting (
    id bigint NOT NULL,
    barber_chat_id bigint NOT NULL,
    client_id bigint NOT NULL,
    booked_date text,
    to_barber boolean DEFAULT true NOT NULL,
    message_id bigint
);


ALTER TABLE public.requesting OWNER TO postgres;

--
-- Name: schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schedule (
    id bigint NOT NULL,
    barber_id bigint NOT NULL,
    start_time text NOT NULL,
    end_time text NOT NULL
);


ALTER TABLE public.schedule OWNER TO postgres;

--
-- Name: schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.schedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.schedule_id_seq OWNER TO postgres;

--
-- Name: schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.schedule_id_seq OWNED BY public.schedule.id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    id bigint NOT NULL,
    key_name text NOT NULL,
    duration real DEFAULT 1.0 NOT NULL
);


ALTER TABLE public.services OWNER TO postgres;

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_id_seq OWNER TO postgres;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teams (
    team_id bigint NOT NULL,
    team_name text NOT NULL,
    team_description text,
    lattitude real NOT NULL,
    longitude real NOT NULL
);


ALTER TABLE public.teams OWNER TO postgres;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teams_team_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO postgres;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: unavailable_date; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unavailable_date (
    id bigint NOT NULL,
    barber_id bigint NOT NULL,
    start_time text,
    end_time text,
    whole_day boolean DEFAULT true NOT NULL,
    created_at text NOT NULL,
    day text NOT NULL
);


ALTER TABLE public.unavailable_date OWNER TO postgres;

--
-- Name: unavailable_date_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.unavailable_date_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unavailable_date_id_seq OWNER TO postgres;

--
-- Name: unavailable_date_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.unavailable_date_id_seq OWNED BY public.unavailable_date.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    "time" text
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: admin id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);


--
-- Name: appointments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments ALTER COLUMN id SET DEFAULT nextval('public.appointments_id_seq'::regclass);


--
-- Name: barbers barber_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.barbers ALTER COLUMN barber_id SET DEFAULT nextval('public.barbers_barber_id_seq'::regclass);


--
-- Name: canceled_orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.canceled_orders ALTER COLUMN id SET DEFAULT nextval('public.canceled_orders_id_seq'::regclass);


--
-- Name: pricing id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pricing ALTER COLUMN id SET DEFAULT nextval('public.pricing_id_seq'::regclass);


--
-- Name: schedule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedule ALTER COLUMN id SET DEFAULT nextval('public.schedule_id_seq'::regclass);


--
-- Name: services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Name: unavailable_date id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unavailable_date ALTER COLUMN id SET DEFAULT nextval('public.unavailable_date_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin (id, chat_id) FROM stdin;
6	546939487
13	5812777725
\.


--
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.appointments (id, barber_id, chat_id, date, start_time, end_time, service_id, confirmed, confirmed_at, booked_date) FROM stdin;
21	3	3	2023-01-07 15:42:02.533580	12	13	2	f	25:00	8.1.2023
22	3	3	2023-01-07 23:27:53.681882	14	15	2	f	25:00	8.1.2023
23	3	3	2023-01-07 23:28:10.229297	22	23	2	f	25:00	15.1.2023
24	3	3	2023-01-10 16:26:36.748706	10	11	2	f	25:00	12.1.2023
25	3	3	2023-01-11 21:13:56.830309	14	15	2	f	25:00	3
26	3	3	2023-01-11 21:19:56.003193	15	16	2	f	25:00	12.1.2023
27	3	3	2023-01-11 21:20:16.816941	16	17	2	f	25:00	20.1.2023
28	3	3	2023-01-18 11:27:35.125311	15	16	2	f	25:00	19.1.2023
29	3	3	2023-01-18 11:28:57.703551	15	16	2	f	25:00	19.1.2023
31	3	5337656690	2023-01-18 16:52:39.695918	15	16	1	f	25:00	19.1.2023
32	3	5337656690	2023-01-19 10:05:32.459506	15	16	1	f	25:00	21.1.2023
35	3	5337656690	2023-01-19 10:32:10.934934	19	20	2	f	25:00	26.1.2023
36	3	546939487	2023-01-19 22:48:39.851903	15	16	1	f	25:00	20.1.2023
37	3	546939487	2023-01-20 14:12:14.741451	19	20	1	f	25:00	21.1.2023
38	3	546939487	2023-01-20 14:12:49.826191	15	16	1	f	25:00	21.1.2023
39	3	546939487	2023-01-20 14:20:55.060178	16	17	2	f	25:00	21.1.2023
40	3	546939487	2023-01-20 14:21:41.690766	16	17	2	f	25:00	21.1.2023
41	3	546939487	2023-01-20 14:24:04.011477	15	16	2	f	25:00	21.1.2023
33	3	5337656690	2023-01-19 10:08:24.864161	19	20	1	t	2023-01-26 12:20:56.026496	27.1.2023
34	3	5337656690	2023-01-19 10:15:57.768290	15	16	2	t	2023-01-26 12:20:58.121495	27.1.2023
42	3	157565756	2023-01-26 22:43:43.774265	23	24	1	t	2023-01-26 22:44:26.152094	27.1.2023
43	3	157565756	2023-01-26 22:44:49.000791	20	21	1	f	25:00	27.1.2023
44	3	270812935	2023-01-26 22:45:03.382038	18	19	1	f	25:00	1
45	3	157565756	2023-01-26 22:45:21.005503	20	21	2	f	25:00	29.1.2023
46	3	270812935	2023-01-26 22:47:03.041041	17	18	2	f	25:00	29.1.2023
47	3	157565756	2023-01-26 22:47:44.501029	20	21	1	f	25:00	31.1.2023
48	3	157565756	2023-01-26 22:47:55.018611	23	24	2	f	25:00	31.1.2023
49	3	270812935	2023-01-26 22:48:04.549207	10	11	1	f	25:00	30.1.2023
50	3	157565756	2023-01-26 22:48:23.736187	22	23	2	f	25:00	29.1.2023
51	3	157565756	2023-01-26 22:48:47.858431	16	17	2	f	25:00	26.1.2023
52	3	157565756	2023-01-26 22:50:27.483689	23	24	2	f	25:00	31.1.2023
57	3	270812935	2023-01-26 22:57:52.527635	11	12	1	f	25:00	27.1.2023
58	3	1778235111	2023-01-30 13:42:14.721143	19	20	2	f	25:00	31.1.2023
59	3	1778235111	2023-01-30 13:48:30.626696	19	20	2	f	25:00	31.1.2023
60	3	1778235111	2023-01-30 14:02:49.508652	19	20	1	f	25:00	31.1.2023
61	3	1778235111	2023-01-30 14:03:30.858424	22	23	2	f	25:00	31.1.2023
62	3	270812935	2023-01-30 14:13:45.114791	20	21	1	f	25:00	31.1.2023
63	3	546939487	2023-01-30 14:19:53.231750	19	20	1	f	25:00	31.1.2023
64	3	546939487	2023-01-30 14:20:33.552476	19	20	2	f	25:00	31.1.2023
65	3	546939487	2023-01-30 14:21:36.537439	22	23	1	f	25:00	31.1.2023
66	3	546939487	2023-01-30 14:22:28.540037	18	19	1	f	25:00	31.1.2023
67	3	546939487	2023-01-30 14:42:20.225704	18	19	1	f	25:00	31.1.2023
68	3	546939487	2023-01-30 14:42:56.576977	18	19	2	f	25:00	31.1.2023
69	3	546939487	2023-01-30 14:43:19.792787	18	19	1	f	25:00	31.1.2023
71	3	546939487	2023-01-30 16:15:44.289266	18	19	1	f	25:00	31.1.2023
76	3	270812935	2023-01-31 13:11:02.113811	19	20	1	t	2023-01-31 13:11:11.099306	31.1.2023
70	3	546939487	2023-01-30 15:18:50.213900	19	20	2	t	2023-01-30 16:16:44.688144	31.1.2023
72	3	546939487	2023-01-30 16:17:21.493565	19	20	1	f	25:00	31.1.2023
77	3	270812935	2023-01-31 13:11:39.044511	22	23	2	f	25:00	31.1.2023
73	3	546939487	2023-01-30 16:18:42.882345	19	20	1	f	25:00	31.1.2023
78	3	546939487	2023-02-01 15:57:35.564911	15	16	1	f	25:00	2.2.2023
79	3	868136530	2023-02-12 21:30:31.083917	16	17	1	f	25:00	16.2.2023
80	3	868136530	2023-02-12 21:32:40.717558	12	13	1	f	25:00	16.2.2023
74	3	546939487	2023-01-30 16:23:33.814308	15	16	2	f	25:00	31.1.2023
75	3	546939487	2023-01-30 16:24:46.219251	18	19	2	t	2023-01-30 16:25:08.741390	31.1.2023
81	3	868136530	2023-02-12 21:33:33.327670	13	14	1	t	2023-02-12 21:33:45.143987	17.2.2023
82	3	868136530	2023-02-12 21:34:10.867771	16	17	2	t	2023-02-12 21:34:37.235922	18.2.2023
83	3	868136530	2023-02-13 14:24:17.430671	16	17	1	f	25:00	16.2.2023
84	3	868136530	2023-02-13 14:25:12.681226	15	16	1	f	25:00	15.2.2023
90	3	868136530	2023-02-13 17:15:39.797532	15	16	2	f	25:00	15.2.2023
91	3	868136530	2023-02-13 18:14:41.474218	16	17	1	f	25:00	15.2.2023
92	3	868136530	2023-02-13 18:15:23.554558	17	18	2	t	2023-02-13 18:15:54.446615	16.2.2023
93	3	157565756	2023-02-21 23:05:21.409987	11	12	1	t	2023-02-21 23:05:29.195500	22.2.2023
94	3	157565756	2023-02-21 23:06:03.594520	13	14	2	f	25:00	22.2.2023
95	3	157565756	2023-02-21 23:06:41.324890	15	16	1	f	25:00	28.2.2023
96	3	868136530	2023-02-21 23:11:44.403773	19	20	2	f	25:00	22.2.2023
97	3	270812935	2023-02-21 23:12:32.676812	18	19	2	t	2023-02-21 23:12:46.432180	23.2.2023
98	3	270812935	2023-02-21 23:13:20.397008	15	16	1	f	25:00	23.2.2023
99	3	868136530	2023-02-21 23:13:42.204592	18	19	2	f	25:00	23.2.2023
100	3	270812935	2023-02-21 23:14:31.907974	15	16	1	t	2023-02-21 23:14:34.992842	28.2.2023
101	3	270812935	2023-02-21 23:17:03.278109	19	20	1	t	2023-02-21 23:17:07.879902	23.2.2023
102	3	157565756	2023-02-21 23:20:55.621704	23	24	2	f	25:00	22.2.2023
103	3	270812935	2023-02-21 23:29:27.164466	22	23	1	t	2023-02-21 23:29:31.823721	24.2.2023
104	3	157565756	2023-02-21 23:29:48.002508	 9	10	1	f	25:00	21.2.2023
107	3	868136530	2023-02-22 16:09:35.798856	22	23	2	f	25:00	23.2.2023
108	3	868136530	2023-02-22 16:18:01.980426	15	16	2	f	25:00	23.2.2023
109	3	868136530	2023-02-22 16:53:59.030232	19	20	1	f	25:00	24.2.2023
111	3	868136530	2023-02-22 16:54:41.553976	20	21	2	f	25:00	24.2.2023
112	3	868136530	2023-02-22 16:56:13.129551	20	21	2	t	2023-02-22 16:56:48.504785	23.2.2023
113	3	868136530	2023-02-23 10:24:50.828659	18	19	1	f	25:00	28.2.2023
114	3	868136530	2023-02-23 11:26:18.381027	 9	10	2	t	2023-02-23 11:26:26.107319	25.2.2023
115	3	868136530	2023-02-23 11:26:49.660074	22	23	2	t	2023-02-23 11:26:53.285737	26.2.2023
116	3	868136530	2023-02-23 11:27:11.172480	22	23	2	t	2023-02-23 11:27:14.742695	24.2.2023
117	3	868136530	2023-02-23 11:27:28.554513	22	23	2	t	2023-02-23 11:28:23.168096	24.2.2023
118	3	868136530	2023-02-23 11:37:39.170627	21	22	2	t	2023-02-23 11:37:45.246050	24.2.2023
119	3	868136530	2023-02-23 15:50:42.551338	16	17	1	f	25:00	26.2.2023
120	3	868136530	2023-02-23 15:57:50.302765	 9	10	1	t	2023-02-23 15:58:22.590692	26.2.2023
121	3	868136530	2023-02-23 15:58:34.780709	10	11	1	t	2023-02-23 15:58:36.487697	26.2.2023
122	3	868136530	2023-02-23 15:58:47.353212	12	13	1	t	2023-02-23 15:58:48.990702	26.2.2023
123	3	868136530	2023-02-23 15:58:59.930678	13	14	1	t	2023-02-23 15:59:01.372347	26.2.2023
124	3	868136530	2023-02-23 15:59:15.635694	14	15	1	t	2023-02-23 15:59:17.306513	26.2.2023
125	3	868136530	2023-02-23 15:59:28.070778	15	16	1	t	2023-02-23 15:59:29.580471	26.2.2023
126	3	868136530	2023-02-23 15:59:39.193352	16	17	1	t	2023-02-23 15:59:41.040504	26.2.2023
127	3	868136530	2023-02-23 15:59:51.160315	17	18	1	t	2023-02-23 15:59:52.568484	26.2.2023
128	3	868136530	2023-02-23 16:00:03.933198	18	19	1	t	2023-02-23 16:00:07.687030	26.2.2023
129	3	868136530	2023-02-23 16:00:15.352580	19	20	1	t	2023-02-23 16:00:16.610220	26.2.2023
130	3	868136530	2023-02-23 16:00:27.334260	20	21	1	t	2023-02-23 16:00:28.630427	26.2.2023
131	3	868136530	2023-02-23 16:00:41.670571	21	22	1	t	2023-02-23 16:00:43.485356	26.2.2023
132	3	868136530	2023-02-24 12:00:44.137187	16	17	1	t	2023-02-24 12:00:48.609072	28.2.2023
133	3	157565756	2023-03-07 22:14:17.896633	 9	10	1	f	25:00	7.3.2023
134	3	157565756	2023-03-07 22:14:37.776734	 9	10	1	t	2023-03-07 22:14:40.554529	7.3.2023
135	3	157565756	2023-03-07 22:14:53.805597	10	11	1	t	2023-03-07 22:15:02.073332	7.3.2023
136	3	157565756	2023-03-07 22:15:15.151167	11	12	1	f	25:00	7.3.2023
137	3	157565756	2023-03-07 22:15:55.617711	11	12	1	f	25:00	7.3.2023
138	3	270812935	2023-03-07 22:15:55.972007	11	12	1	f	25:00	7.3.2023
139	3	157565756	2023-03-07 22:18:11.290191	17	18	1	f	25:00	7.3.2023
140	3	157565756	2023-03-07 22:18:11.656341	17	18	1	f	25:00	7.3.2023
141	3	157565756	2023-03-07 22:19:35.750034	17	18	1	t	2023-03-07 22:19:43.947870	soat 17
143	3	157565756	2023-03-07 22:20:04.154863	17	18	1	t	2023-03-07 22:20:13.702431	7.3.2023
144	3	270812935	2023-03-07 22:20:22.966605	23	24	1	f	25:00	7.3.2023
142	3	157565756	2023-03-07 22:19:44.939139	17	18	1	t	2023-03-07 22:43:18.167315	8.3.2023
146	3	270812935	2023-03-07 23:04:17.500522	11	12	1	t	2023-03-07 23:04:25.020449	23.3.2023
147	3	270812935	2023-03-07 23:04:40.880846	12	13	1	f	25:00	7.3.2023
149	3	157565756	2023-03-17 23:14:23.091842	16	17	1	f	25:00	23.3.2023
151	3	868136530	2023-03-23 11:36:43.705114	15	16	1	t	2023-03-23 11:36:47.872243	30.3.2023
152	3	270812935	2023-03-24 09:11:21.041543	10	11	1	f	25:00	24.3.2023
153	3	270812935	2023-03-24 09:11:49.062968	15	16	1	t	2023-03-24 09:11:54.751167	soat 15
105	3	868136530	2023-02-22 10:47:11.573614	15	16	2	t	2023-03-25 03:47:41.331859	25.3.2023
150	3	868136530	2023-03-17 23:15:33.476151	16	17	1	t	2023-03-25 06:47:29.180772	31.3.2023
145	3	270812935	2023-03-07 22:43:23.855094	15	16	1	t	2023-03-24 09:11:59.207824	24.3.2023
154	3	157565756	2023-03-26 07:51:44.022844	17	18	1	f	25:00	26.3.2023
156	3	157565756	2023-03-26 07:52:17.506858	18	19	1	f	25:00	26.3.2023
148	3	270812935	2023-03-17 23:14:12.866370	14	15	1	t	2023-03-25 03:47:36.326005	29.3.2023
110	3	868136530	2023-02-22 16:54:20.197685	15	16	2	t	2023-03-25 03:47:39.171079	31.3.2023
106	3	868136530	2023-02-22 10:56:19.383964	22	23	2	t	2023-03-25 03:47:40.332437	31.3.2023
155	3	157565756	2023-03-26 07:51:57.640384	17	18	1	t	2023-03-26 07:52:01.152643	26.3.2023
\.


--
-- Data for Name: barbers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.barbers (barber_chat_id, barber_info, team_id, barber_id, name, location) FROM stdin;
5337656690	Info qanaqadir	0	3	Abdumalik	41.277799,69.219158
157565756	Something new	0	4	Name	50.425301,10.161617
\.


--
-- Data for Name: canceled_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.canceled_orders (id, order_id, canceled_at) FROM stdin;
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.messages (message_id, chat_id, client_chat_id, client_message_id) FROM stdin;
2764	5337656690	868136530	2763
2776	5337656690	868136530	2775
4128	5337656690	868136530	4127
4533	5337656690	868136530	4532
4562	5337656690	868136530	4561
3592	5337656690	157565756	3590
3609	5337656690	157565756	3608
3619	5337656690	157565756	3618
3635	5337656690	868136530	3634
3645	5337656690	270812935	3644
3660	5337656690	270812935	3659
3673	5337656690	868136530	3672
3703	5337656690	270812935	3701
3712	5337656690	270812935	3711
3733	5337656690	157565756	3732
3766	5337656690	270812935	3765
3777	5337656690	157565756	3776
3961	5337656690	868136530	3960
3981	5337656690	868136530	3980
4142	5337656690	868136530	4141
4175	5337656690	868136530	4174
4276	5337656690	868136530	4275
4293	5337656690	868136530	4292
4304	5337656690	868136530	4303
4320	5337656690	868136530	4319
4368	5337656690	868136530	4367
4408	5337656690	868136530	4407
4419	5337656690	868136530	4418
4430	5337656690	868136530	4429
4441	5337656690	868136530	4440
4510	5337656690	868136530	4509
4968	5337656690	868136530	4967
5011	5337656690	868136530	5010
5022	5337656690	868136530	5021
5033	5337656690	868136530	5032
5044	5337656690	868136530	5043
5055	5337656690	868136530	5054
5066	5337656690	868136530	5065
5077	5337656690	868136530	5076
5088	5337656690	868136530	5087
5099	5337656690	868136530	5098
5110	5337656690	868136530	5109
5121	5337656690	868136530	5120
5132	5337656690	868136530	5131
6004	5337656690	868136530	6003
6947	5337656690	157565756	6946
6957	5337656690	157565756	6956
6968	5337656690	157565756	6967
6979	5337656690	157565756	6978
6994	5337656690	157565756	6993
7021	5337656690	157565756	7020
7045	5337656690	157565756	7044
7053	5337656690	157565756	7052
7061	5337656690	157565756	7059
7071	5337656690	270812935	7070
7180	5337656690	270812935	7179
7306	5337656690	270812935	7305
7319	5337656690	270812935	7318
7641	5337656690	270812935	7640
7657	5337656690	157565756	7656
7686	5337656690	868136530	7685
7859	5337656690	868136530	7858
7886	5337656690	270812935	7885
7899	5337656690	270812935	7898
7998	5337656690	157565756	7997
8006	5337656690	157565756	8005
8017	5337656690	157565756	8016
\.


--
-- Data for Name: pricing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pricing (id, service_id, barber_id, price) FROM stdin;
35	1	3	50000
36	1	4	50000
37	2	4	50000
\.


--
-- Data for Name: requesting; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.requesting (id, barber_chat_id, client_id, booked_date, to_barber, message_id) FROM stdin;
105	5337656690	868136530	25.3.2023	t	3960
142	5337656690	157565756	8.3.2023	t	7050
145	5337656690	270812935	24.3.2023	t	7178
149	5337656690	157565756	23.3.2023	t	7655
153	5337656690	270812935	soat 15	t	7896
156	5337656690	157565756	26.3.2023	t	8016
\.


--
-- Data for Name: schedule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schedule (id, barber_id, start_time, end_time) FROM stdin;
1	3	9	23
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (id, key_name, duration) FROM stdin;
1	soch olish	1
2	soqol olish	0.5
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teams (team_id, team_name, team_description, lattitude, longitude) FROM stdin;
\.


--
-- Data for Name: unavailable_date; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.unavailable_date (id, barber_id, start_time, end_time, whole_day, created_at, day) FROM stdin;
1	3	10	13	t	20.02.2023	25.2.2023
2	3	11	12	f	20.03.2023	26.2.2023
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, user_id, "time") FROM stdin;
6	868136530	\N
10	546939487	\N
11	157565756	\N
12	5337656690	\N
13	5812777725	\N
14	270812935	\N
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admins_id_seq', 1, false);


--
-- Name: appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.appointments_id_seq', 156, true);


--
-- Name: barbers_barber_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.barbers_barber_id_seq', 7, true);


--
-- Name: canceled_orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.canceled_orders_id_seq', 1, false);


--
-- Name: pricing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pricing_id_seq', 37, true);


--
-- Name: schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.schedule_id_seq', 30, true);


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.services_id_seq', 2, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 1, false);


--
-- Name: unavailable_date_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.unavailable_date_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 14, true);


--
-- Name: admin admins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: appointments appointments_id_id1_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_id_id1_key UNIQUE (id) INCLUDE (id);


--
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id);


--
-- Name: barbers barber_chat; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.barbers
    ADD CONSTRAINT barber_chat UNIQUE (barber_chat_id) INCLUDE (barber_chat_id);


--
-- Name: barbers barbers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.barbers
    ADD CONSTRAINT barbers_pkey PRIMARY KEY (barber_id);


--
-- Name: canceled_orders canceled_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.canceled_orders
    ADD CONSTRAINT canceled_orders_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (message_id);


--
-- Name: pricing pricing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pricing
    ADD CONSTRAINT pricing_pkey PRIMARY KEY (id);


--
-- Name: requesting requesting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requesting
    ADD CONSTRAINT requesting_pkey PRIMARY KEY (id);


--
-- Name: schedule schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: unavailable_date unavailable_date_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unavailable_date
    ADD CONSTRAINT unavailable_date_pkey PRIMARY KEY (id);


--
-- Name: users user_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_id UNIQUE (user_id) INCLUDE (user_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: pricing barbe_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pricing
    ADD CONSTRAINT barbe_id FOREIGN KEY (barber_id) REFERENCES public.barbers(barber_id);


--
-- Name: schedule barber_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT barber_id FOREIGN KEY (barber_id) REFERENCES public.barbers(barber_id) NOT VALID;


--
-- Name: unavailable_date barber_idsi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unavailable_date
    ADD CONSTRAINT barber_idsi FOREIGN KEY (barber_id) REFERENCES public.barbers(barber_id) NOT VALID;


--
-- Name: admin id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT id FOREIGN KEY (id) REFERENCES public.users(id);


--
-- Name: requesting idlar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requesting
    ADD CONSTRAINT idlar FOREIGN KEY (id) REFERENCES public.appointments(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: canceled_orders order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.canceled_orders
    ADD CONSTRAINT order_id FOREIGN KEY (order_id) REFERENCES public.appointments(id);


--
-- Name: pricing ser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pricing
    ADD CONSTRAINT ser_id FOREIGN KEY (service_id) REFERENCES public.services(id);


--
-- PostgreSQL database dump complete
--

