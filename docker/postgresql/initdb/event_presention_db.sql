--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 11.5 (Ubuntu 11.5-1)

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

SET default_with_oids = false;

--
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone,
    address text,
    contact character varying
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: TABLE client; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.client IS 'Store client data';


--
-- Name: COLUMN client.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.client.name IS 'client''s name';


--
-- Name: client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_id_seq OWNER TO postgres;

--
-- Name: client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.client_id_seq OWNED BY public.client.id;


--
-- Name: event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event (
    id integer NOT NULL,
    name character varying NOT NULL,
    start_datetime timestamp without time zone NOT NULL,
    end_datetime timestamp without time zone NOT NULL,
    location text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone,
    id_client integer,
    is_checkout_required boolean DEFAULT false,
    attendance_target integer
);


ALTER TABLE public.event OWNER TO postgres;

--
-- Name: TABLE event; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.event IS 'store event''s data';


--
-- Name: COLUMN event.start_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event.start_datetime IS 'event''s start datetime';


--
-- Name: COLUMN event.end_datetime; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event.end_datetime IS 'event''s end datetime';


--
-- Name: COLUMN event.location; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.event.location IS 'event''s location';


--
-- Name: event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_id_seq OWNER TO postgres;

--
-- Name: event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_id_seq OWNED BY public.event.id;


--
-- Name: journalist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.journalist (
    id integer NOT NULL,
    name character varying NOT NULL,
    birth_date timestamp without time zone,
    card_number character varying,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone,
    id_media integer,
    id_journalist_category integer,
    phone character varying,
    email character varying,
    journalist_code character varying
);


ALTER TABLE public.journalist OWNER TO postgres;

--
-- Name: TABLE journalist; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.journalist IS 'Store journalist data';


--
-- Name: COLUMN journalist.birth_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.journalist.birth_date IS 'birth date of journalist';


--
-- Name: COLUMN journalist.card_number; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.journalist.card_number IS 'journalist''s RFID Card Number';


--
-- Name: journalist_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.journalist_category (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone
);


ALTER TABLE public.journalist_category OWNER TO postgres;

--
-- Name: COLUMN journalist_category.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.journalist_category.name IS 'category name';


--
-- Name: journalist_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.journalist_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.journalist_category_id_seq OWNER TO postgres;

--
-- Name: journalist_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.journalist_category_id_seq OWNED BY public.journalist_category.id;


--
-- Name: journalist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.journalist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.journalist_id_seq OWNER TO postgres;

--
-- Name: journalist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.journalist_id_seq OWNED BY public.journalist.id;


--
-- Name: media; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.media (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone,
    domain character varying
);


ALTER TABLE public.media OWNER TO postgres;

--
-- Name: TABLE media; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.media IS 'Store media data';


--
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.media_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.media_id_seq OWNER TO postgres;

--
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.media_id_seq OWNED BY public.media.id;


--
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu (
    id integer NOT NULL,
    name character varying,
    page character varying,
    id_menu_category smallint
);


ALTER TABLE public.menu OWNER TO postgres;

--
-- Name: menu_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_category (
    id smallint NOT NULL,
    name character varying,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone
);


ALTER TABLE public.menu_category OWNER TO postgres;

--
-- Name: menu_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_category_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_category_id_seq OWNER TO postgres;

--
-- Name: menu_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_category_id_seq OWNED BY public.menu_category.id;


--
-- Name: menu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_id_seq OWNER TO postgres;

--
-- Name: menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_id_seq OWNED BY public.menu.id;


--
-- Name: presence_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.presence_list (
    id_journalist integer NOT NULL,
    id_event integer NOT NULL,
    is_present boolean DEFAULT false,
    presence_datetime timestamp without time zone,
    created_at timestamp without time zone DEFAULT now(),
    checkout_datetime timestamp without time zone,
    is_checked_out boolean DEFAULT false,
    is_additional boolean DEFAULT false
);


ALTER TABLE public.presence_list OWNER TO postgres;

--
-- Name: sub_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sub_menu (
    id integer NOT NULL,
    name character varying,
    page character varying,
    id_menu integer
);


ALTER TABLE public.sub_menu OWNER TO postgres;

--
-- Name: sub_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sub_menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sub_menu_id_seq OWNER TO postgres;

--
-- Name: sub_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sub_menu_id_seq OWNED BY public.sub_menu.id;


--
-- Name: user_level; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_level (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone
);


ALTER TABLE public.user_level OWNER TO postgres;

--
-- Name: user_level_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_level_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_level_id_seq OWNER TO postgres;

--
-- Name: user_level_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_level_id_seq OWNED BY public.user_level.id;


--
-- Name: user_privillage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_privillage (
    created_at timestamp without time zone DEFAULT now(),
    id_menu integer,
    id_sub_menu integer,
    id_user_system integer
);


ALTER TABLE public.user_privillage OWNER TO postgres;

--
-- Name: user_system; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_system (
    id integer NOT NULL,
    name character varying,
    username character varying,
    password character varying,
    is_active boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone,
    id_user_level integer
);


ALTER TABLE public.user_system OWNER TO postgres;

--
-- Name: user_system_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_system_id_seq OWNER TO postgres;

--
-- Name: user_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_system_id_seq OWNED BY public.user_system.id;


--
-- Name: client id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client ALTER COLUMN id SET DEFAULT nextval('public.client_id_seq'::regclass);


--
-- Name: event id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event ALTER COLUMN id SET DEFAULT nextval('public.event_id_seq'::regclass);


--
-- Name: journalist id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journalist ALTER COLUMN id SET DEFAULT nextval('public.journalist_id_seq'::regclass);


--
-- Name: journalist_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journalist_category ALTER COLUMN id SET DEFAULT nextval('public.journalist_category_id_seq'::regclass);


--
-- Name: media id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media ALTER COLUMN id SET DEFAULT nextval('public.media_id_seq'::regclass);


--
-- Name: menu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu ALTER COLUMN id SET DEFAULT nextval('public.menu_id_seq'::regclass);


--
-- Name: menu_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_category ALTER COLUMN id SET DEFAULT nextval('public.menu_category_id_seq'::regclass);


--
-- Name: sub_menu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_menu ALTER COLUMN id SET DEFAULT nextval('public.sub_menu_id_seq'::regclass);


--
-- Name: user_level id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_level ALTER COLUMN id SET DEFAULT nextval('public.user_level_id_seq'::regclass);


--
-- Name: user_system id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_system ALTER COLUMN id SET DEFAULT nextval('public.user_system_id_seq'::regclass);


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (id, name, created_at, updated_at, address, contact) FROM stdin;
1	PT BenQ Teknologi Indonesia	2019-11-19 16:50:35.011123	\N	Jakarta - Indonesia	ratna.rahayu@benq.com
2	PT. Xiaomi Communications Indonesia	2019-11-19 17:31:26.82349	\N	Jl. Pantai Indah Kapuk No.9, RT.7/RW.2, Kamal Muara, Kec. Penjaringan, Kota Jkt Utara, Daerah Khusus Ibukota Jakarta 14470	Stephanie@xiaomi.com
3	Bell	2019-11-26 16:42:05.171835	\N		ytan@bellflight.com
4	Global Sources Electronics Indonesia	2019-12-04 11:05:22.383221	\N		
5	Red Hat	2019-12-11 15:49:36.562201	\N		
6	Adroady Media	2019-12-19 15:55:57.424753	\N		
\.


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event (id, name, start_datetime, end_datetime, location, created_at, updated_at, id_client, is_checkout_required, attendance_target) FROM stdin;
1	BenQ Press Conference 2019	2019-11-20 09:30:00	2019-11-20 14:00:00	Pullman Hotel Central Park	2019-11-19 16:51:35.520944	\N	1	t	\N
2	Media Coffee Talk with Alvin Tse	2019-11-21 15:00:00	2019-11-21 19:00:00	William’s – Casual Dining (SCBD)\r\nJl. Tulodong Atas No.28, RT.6/RW.3, Senayan,Jakarta Selatan\r\n	2019-11-19 17:34:36.87878	\N	2	t	\N
3	Coffee Talk with Alvin Tse - Xiaomi Indonesia (Techno Reviewer)	2019-11-22 15:30:00	2019-11-22 18:00:00	Kila Kila By Akasya\r\nJl, Jendral Sudirman Kav 52-53 SCBD Gedung\r\nLot 4 7th Floor, Senayan, \r\nJakarta 12190\r\n	2019-11-22 11:03:11.403521	2019-11-22 11:03:32	2	f	\N
4	Bell & PTDI Press Conference	2019-11-27 10:00:00	2019-11-27 12:30:00	Shangri la Hotel, Jakarta	2019-11-26 16:49:06.797509	\N	3	f	20
5	Media Launch Xiaomi Redmi 8 Series	2019-12-04 12:00:00	2019-12-04 15:00:00	Hallf Patiunus \r\nJl. Pati Unus No. F4, RT.4/RW.4, Kebayoran Baru\r\nJakarta Selatan 12120\r\n	2019-12-03 10:44:47.44314	\N	2	f	80
7	Global Sources Electronics Indonesia - Day 2	2019-12-06 09:00:00	2019-12-07 17:00:00	Hall B, Jakarta Convention Center, Jakata Pusat	2019-12-06 09:44:46.131883	2019-12-06 09:47:06	4	f	15
6	Global Sources Electronics Indonesia - Day 1	2019-12-05 08:00:00	2019-12-07 18:00:00	Hall B, Jakarta Convention Center, Jakarta Pusat	2019-12-04 11:07:25.177832	2019-12-06 09:49:49	4	t	70
8	Global Sources Electronics Indonesia - Day 3	2019-12-07 09:00:00	2019-12-07 17:00:00	Hall B, Jakarta Convention Center, Jakarta Pusat	2019-12-06 09:45:38.906931	2019-12-06 09:50:04	4	f	15
9	Media Rendezvous with Xiaomi	2019-12-11 12:00:00	2019-12-11 16:00:00	100 Eatery & Bar, Dasar, Hotel Century Park\r\n Jl. Pintu Satu Senayan, RT.1/RW.3, Gelora, Jakarta Pusat, 10270\r\n	2019-12-09 14:45:29.513841	2019-12-09 14:45:51	2	f	30
10	Red Hat Open Innovation Labs 	2019-12-12 08:00:00	2019-12-12 23:00:00	The Westin Jakarta, Jalan Haji R. Rasuna Said No.Kav. C-22 A, Karet Kuningan,  Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12940	2019-12-11 15:53:05.926382	\N	5	f	12
11	Media Conference Adroady 2020 Expansion Plan	2019-12-20 12:00:00	2019-12-20 17:00:00	Grand Sahid Jaya, Candi Prambanan Room, lt 2\r\nJl. Jend. Sudirman No.Kav. 86 Karet Tengsin, Jakarta Pusat 	2019-12-19 15:58:36.30568	2019-12-20 11:44:36	6	f	30
13	Press Conference Xiaomi New Smartphone	2020-01-04 15:30:00	2020-01-04 17:00:00	The Fools Jakarta, the Foundary No. 8 SCBD Lot 8\r\nJl. Jend. Sudirman, Jakarta Selatan, Senayan, Jakarta Selatan 12190\r\n	2020-01-02 09:27:11.045495	\N	2	f	30
12	Xiaomi New Product Launch New World Concert	2020-01-04 17:00:00	2020-01-04 19:00:00	@Livespace SCBD\r\nLot 8 SCBD, Jl. Jend. Sudirman, Jakarta Selatan, Senayan, Jakarta Selatan 12190\r\n	2020-01-02 09:26:17.695761	2020-01-02 09:27:42	2	f	80
\.


--
-- Data for Name: journalist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.journalist (id, name, birth_date, card_number, created_at, updated_at, id_media, id_journalist_category, phone, email, journalist_code) FROM stdin;
1	Ahmad Sanusi	1970-01-01 00:00:00	\N	2019-11-19 16:57:10.004598	\N	359	2	0813 8857 3555	sanusi.pulsa@gmail.com	
2	Faya	1970-01-01 00:00:00	\N	2019-11-19 16:57:44.455212	\N	583	2	081212431555	Faya@detik.com	
4	Ilham	1970-01-01 00:00:00	\N	2019-11-19 16:57:56.077527	\N	184	2	08170004300	ilham.putranto@gmail.com	
12	Hiru	1970-01-01 00:00:00	\N	2019-11-19 17:01:25.577768	\N	353	2	0811988450	hiru.muhammad@gmail.com	
13	Iskandar	1970-01-01 00:00:00	\N	2019-11-19 17:01:41.786748	\N	167	2	0812 8122 7660	iskandar814@gmail.com	
15	Wandari	1970-01-01 00:00:00	\N	2019-11-19 17:02:07.404171	\N	332	2	085722618518	wandari@mediaindonesia.com	
16	Bayu	1970-01-01 00:00:00	\N	2019-11-19 17:02:34.477951	\N	445	2		Bayu.dwa@gmail.com	
18	Dommara	1970-01-01 00:00:00	\N	2019-11-19 17:03:20.398585	\N	432	2	081364106343	dommarahs@gmail.com	
19	Christi	2019-11-19 00:00:00	\N	2019-11-19 17:04:06.618846	\N	569	2	0857 4372 1808	christi667@gmail.com	
20	Iman Aulia	2019-11-19 00:00:00	\N	2019-11-19 17:04:09.955509	\N	179	2	088218699998	iman.aulia@arenalte.com	
21	Demis	1970-01-01 00:00:00	\N	2019-11-19 17:04:26.733006	\N	478	2	087889100898	demis.rizky@gmail.com	
23	Shelbi	2019-11-19 00:00:00	\N	2019-11-19 17:04:59.480372	\N	569	2	087770108113	shelbi.aja@gmail.com	
25	Tanaya	1970-01-01 00:00:00	\N	2019-11-19 17:05:14.199224	\N	579	2	081224113056	tanaya.khairunnisa@gmail.com	
26	Setia Gunawan	2019-11-19 00:00:00	\N	2019-11-19 17:05:48.550881	\N	134	2	08129662008	setia.gunawan@me.com	
28	Erwin	1970-01-01 00:00:00	\N	2019-11-19 17:06:13.134106	\N	117	2	0811147639	ezachri@gmail.com	
29	Denny Mahardi	2019-11-19 00:00:00	\N	2019-11-19 17:06:31.511751	\N	417	2	08568300645	d_mahardy@yahoo.com	
30	Imam	1970-01-01 00:00:00	\N	2019-11-19 17:07:01.040904	\N	186	2	081584312072	imasu2000@gmail.com	
34	Yosa Chandra	1970-01-01 00:00:00	\N	2019-11-19 17:08:29.271894	\N	324	2	081280659520	yosa.maulana@swamail.com	
35	Kama Aritya	2019-11-19 00:00:00	\N	2019-11-19 17:08:50.315838	\N	507	2	081905060607	kama.grid@gmail.com	
38	Gede	1970-01-01 00:00:00	\N	2019-11-19 17:09:52.082135	\N	465	2	081585852914	gede.dharma@jakpost.com	
39	Rindy	2019-11-19 00:00:00	\N	2019-11-19 17:10:24.408849	\N	492	2	082111016589	rindy.rich@gmail.com	
40	Healza	2019-11-19 00:00:00	\N	2019-11-19 17:11:06.151118	\N	565	2	085646703132	healzakh@urbanasia.media	
42	Vera Yuningsih	1970-01-01 00:00:00	\N	2019-11-19 17:12:02.702141	\N	107	2	08119670038	vera.indopos2013@gmail.com	
43	Sontry	2019-11-19 00:00:00	\N	2019-11-19 17:12:24.701081	\N	446	2	0856 7877 429 	sontry.stephanus@beritasatumedia.com	
45	Reza Wahyudi	1970-01-01 00:00:00	\N	2019-11-19 17:12:35.591061	\N	54	2	0818660529	reza.wahyudi@gmail.com	
46	Aria Gardhadipura	2019-11-19 00:00:00	\N	2019-11-19 17:12:58.825945	\N	399	2	085659705875	aria@techinasia.com	
47	Achmad Lutfi	2019-11-19 00:00:00	\N	2019-11-19 17:13:04.951906	\N	518	2	0856 1908 589	loebassist@gmail.com	
51	Ilham	2019-11-19 00:00:00	\N	2019-11-19 17:13:55.608809	\N	271	2	0813 7435 1086	ilham@jawapos.com	
56	Natisha	2019-11-19 00:00:00	\N	2019-11-19 17:15:09.80994	\N	110	2	0813 1541 8447	tisha.sudarwanto@yahoo.com	
58	Dean	2019-11-19 00:00:00	\N	2019-11-19 17:15:19.005359	\N	246	2		deansyr@gmail.com	
62	Dythia	2019-11-19 00:00:00	\N	2019-11-19 17:16:04.178684	\N	182	2	0815 1440 3771	dythia@suara.com	
64	Aditya Panji	1970-01-01 00:00:00	\N	2019-11-19 17:16:57.618612	\N	146	2	08119890355	aditya.panji@gmail.com	
65	Bayu	2019-11-19 00:00:00	\N	2019-11-19 17:17:05.129615	\N	89	2	0813 7508 8971	bayu@idntimes.com	
66	Sony	2019-11-19 00:00:00	\N	2019-11-19 17:17:38.697538	\N	295	2			
69	Ali	2019-11-19 00:00:00	\N	2019-11-19 17:18:18.105781	\N	457	2	0818 741 668	ali@tempo.co.id	
52	Karyoto	2019-11-19 00:00:00	1944201029	2019-11-19 17:14:02.252751	2019-12-07 14:07:00	106	2	0818934935	kang_boo@yahoo.com	
24	Dicky	2019-11-19 00:00:00	0234065199	2019-11-19 17:05:04.101264	2019-11-20 09:47:41	503	2	0815 1621 855	dicky@tplusmagz.com	
59	Eko Sutriyanto	2019-11-19 00:00:00	3713772783	2019-11-19 17:15:37.863093	2019-12-04 11:15:49	532	2	0811507795	ekosutriyanto@yahoo.com	
68	Rizki Sandi	2019-11-19 00:00:00	3421499735	2019-11-19 17:17:46.689728	2019-12-20 13:51:42	58	2	081779044379	rizkisandisaputra28@gmail.com	
9	Dian	1970-01-01 00:00:00	1030983055	2019-11-19 17:00:18.623896	2019-11-20 10:01:12	224	2	085882487618	dian@jagatreview.com	
37	Endah	2019-11-19 00:00:00	2978982640	2019-11-19 17:09:49.377102	2019-11-20 10:08:14	437	2	08568988389	endah.tu@gmail.com	
50	Sonny	2019-11-19 00:00:00	3616041553	2019-11-19 17:13:31.566239	2019-12-07 14:02:27	103	2	087825973788	inanewssonny@gmail.com	
44	Dedy Sofan	2019-11-19 00:00:00	0846958761	2019-11-19 17:12:25.587701	2019-11-20 10:25:46	233	2	0817 6972 377	dedysofan@gmail.com	
36	Kristian	2019-11-19 00:00:00	0174221060	2019-11-19 17:09:19.560481	2019-11-20 10:43:53	592	2	0813 1030 0777	kristian@yangcanggih.com	
53	Siti Sarifah Aliyah	1970-01-01 00:00:00	\N	2019-11-19 17:14:20.052755	2020-01-02 10:18:54	572	2	081284472779	sarie.kemsaw@gmail.com	
11	Indra Khairuddin	1970-01-01 00:00:00	0952130677	2019-11-19 17:00:52.709177	2020-01-04 16:10:14	464	2	0811856015	indra@selular.co.id	
60	Imam Ali	2019-11-19 00:00:00	1415696143	2019-11-19 17:15:47.769512	2019-11-20 11:58:15	191	2	081296683444	imam.ali@pricebook.co.id	
48	Adi Fida	1970-01-01 00:00:00	1630425295	2019-11-19 17:13:09.445208	2019-11-21 15:24:27	583	2	08999914587	adi.fida@detik.com	
10	Vina	1970-01-01 00:00:00	1413291631	2019-11-19 17:00:46.014183	2020-01-04 15:53:10	575	2	0878 2476 7513	novina.putri@viva.co.id	
27	Fauzan	2019-11-19 00:00:00	2214457699	2019-11-19 17:05:48.812199	2019-11-21 15:27:02	383	2	0856 4200 3544	fauzan.jamaludin@kly.id	
14	Faisal	1970-01-01 00:00:00	1116974575	2019-11-19 17:02:06.791384	2019-11-21 15:31:31	445	2	0813 2074 5514	mfaisal.hadip@gmail.com	
3	Mediana	1970-01-01 00:00:00	1165579017	2019-11-19 16:57:46.358767	2019-11-21 15:51:39	38	2	087755192603	medcecil@gmail.com	
6	Eka Santika	1970-01-01 00:00:00	\N	2019-11-19 16:59:28.866161	2019-11-25 10:24:37	556	2	0856 9916 588	ekasanthika@gmail.com	
8	Reska	1970-01-01 00:00:00	1349779321	2019-11-19 17:00:07.680882	2019-11-27 10:55:55	54	2	0813 8326 0656	reska.koko@gmail.com	
17	Mamduh	1970-01-01 00:00:00	0923698389	2019-11-19 17:03:19.773057	2019-12-04 13:23:54	316	2	0857 1802 6966	mamduh90@gmail.com	
54	Dini Listiyani	2019-11-19 00:00:00	1681918415	2019-11-19 17:14:38.336797	2019-12-04 13:26:49	142	2	0896 5495 6227	dinilistiyani@gmail.com	
22	Dayu	2019-11-19 00:00:00	4274332015	2019-11-19 17:04:39.750793	2019-12-04 13:31:51	151	2		Dayu@infokomputer.com	
33	Bambang Dwi Atmoko	2019-11-19 00:00:00	0460342735	2019-11-19 17:08:13.152359	2019-12-04 14:00:01	267	2	08170170211	mrbambang@gizmologi.com	
32	Bayu Aditya Putra	2019-11-19 00:00:00	2417564469	2019-11-19 17:07:44.199407	2019-12-07 14:01:36	522	2	08984163778	contact@trenteknologi.com	
41	Herry	2019-11-19 00:00:00	\N	2019-11-19 17:11:35.639534	2019-12-07 12:22:48	136	2	087886547634	herrybarus@yahoo.com.au	
31	Iwan Ramos Siallagan	2019-11-19 00:00:00	0036316111	2019-11-19 17:07:01.638844	2019-12-20 14:26:21	480	2	0858 1030 6494	iwan@mobitekno.com	
63	Intan Rakhmayanti	2019-11-19 00:00:00	2053512025	2019-11-19 17:16:36.641607	2020-01-04 15:53:00	35	2	0813 3054 0025	intanrkhmynti@gmail.com	
61	Ibnu Naufal	1970-01-01 00:00:00	3117137551	2019-11-19 17:15:54.70777	2020-01-04 15:55:35	165	2	0899 8439 849	ibnu.naufal@gmail.com	
71	Wiku	1970-01-01 00:00:00	\N	2019-11-19 17:18:49.507491	\N	573	2	08112296243	wiku@dailysocial.id	
73	Eno	2019-11-19 00:00:00	\N	2019-11-19 17:19:27.086078	\N	572	2	0852 1444 1916	enovercetti@gmail.com	
74	Irham	1970-01-01 00:00:00	\N	2019-11-19 17:19:33.983048	\N	224	2	089610263507	irham@jagatreview.com	
76	Wiwiek Juwono	2019-11-19 00:00:00	\N	2019-11-19 17:20:16.730782	\N	55	2	08161868124	wiek@tabloidpcplus.com	
77	Alfreds	2019-11-19 00:00:00	\N	2019-11-19 17:20:17.233666	\N	415	2	0812 9082 6369	alfreds.tuter@yahoo.co.id	
81	Andy	2019-11-19 00:00:00	\N	2019-11-19 17:21:07.65397	\N	65	1	0821 1144 6201	andyindonezya@gmail.com	
82	Aditya Wasa Wirman	2019-11-19 00:00:00	\N	2019-11-19 17:21:22.781479	\N	76	2	081286569656	aditya@droidlime.com	
83	Eko	2019-11-19 00:00:00	\N	2019-11-19 17:21:33.746596	\N	253	1	0818 4615 26	eko.adiwaluyo@markplusinc.com	
85	Fisamawati	2019-11-19 00:00:00	\N	2019-11-19 17:21:58.848578	\N	281	1	0818 0603 9777	fisamawati4@gmail.com	
87	Cindy	2019-11-19 00:00:00	\N	2019-11-19 17:22:26.939745	\N	370	2	0852 1164 8296	cindy@katadata.co.id	
88	Iqbal	2019-11-19 00:00:00	\N	2019-11-19 17:22:53.327194	\N	549	2	0819 0866 6537	m.iqbal@cnbcindonesia.com'	
89	Febri 	1970-01-01 00:00:00	\N	2019-11-19 17:23:05.625499	\N	179	2	081907161524	sundarifebriani@gmail.com	
91	Edi	1970-01-01 00:00:00	\N	2019-11-19 17:24:15.210649	\N	184	2	081310104191	iniemailedi@gmail.com	
92	Kintan Lestari	2019-11-19 00:00:00	\N	2019-11-19 17:29:43.118679	\N	599	2	083894870632	kintanlestari@urbanasia.com	
93	Hendy	2019-11-20 00:00:00	0442726323	2019-11-20 08:55:11.078467	2019-11-20 08:56:27	4	2	0899123456778	hendy@gmail.com	
96	Gino	2019-11-20 00:00:00	0946282287	2019-11-20 09:45:06.641675	2019-11-20 09:45:39	332	2			
134	Kushindarto	1970-01-01 00:00:00	0477585991	2019-11-20 11:25:06.406375	2020-01-04 17:52:54	243	2	0817 6666 232	darto@jangantulalit.com	
72	Andriza Hamzah	2019-11-19 00:00:00	1422671951	2019-11-19 17:19:04.678044	2019-12-11 12:07:52	108	2	081511377191	hamzahija@yahoo.com	
98	Wahyu	2019-11-20 00:00:00	3918785071	2019-11-20 10:03:19.464752	2019-11-20 10:03:30	179	2	087885269553	wahyu_couple@yahoo.com	
99	Wahyu Nextren	2019-11-20 00:00:00	1784125167	2019-11-20 10:06:42.831194	2019-11-20 10:06:53	507	2		waygrid.id@gmail.com	
75	Dimas Galih Windujati	2019-11-19 00:00:00	2560244527	2019-11-19 17:19:52.124855	2019-11-21 15:14:20	573	2	0816 191 6633	dimas@dailysocial.id	
100	Desmal	2019-11-20 00:00:00	0726910415	2019-11-20 10:09:39.936695	2019-11-20 10:09:50	480	2			
101	Eky	2019-11-20 00:00:00	3003777004	2019-11-20 10:13:39.544344	2019-11-20 10:14:06	446	2	081298494850	niketutresky@gmail.com	
102	Yusuf	2019-11-20 00:00:00	0105580711	2019-11-20 10:16:54.427028	2019-11-20 10:17:07	271	2	081934108440	yusufaldian31@gmail.com	
103	Yuni	2019-11-20 00:00:00	4161780431	2019-11-20 10:19:25.647198	2019-11-20 10:20:05	464	2	081311435466	yuni@selular.co.id	
104	Junaidi	2019-11-20 00:00:00	4079287759	2019-11-20 10:26:48.545348	2019-11-20 10:27:00	184	2		katikjoe@gmail.com	
105	Iman	2019-11-20 00:00:00	4159152431	2019-11-20 10:33:26.192978	2019-11-20 10:33:46	79	2	081213060687	iman.toko@hotmail.com	
106	Yusuf	2019-11-20 00:00:00	0883899977	2019-11-20 10:39:00.899091	2019-11-20 10:39:13	58	2		yusuftirtayasa35@gmail.com	
107	Arini fazrin	1970-01-01 00:00:00	\N	2019-11-20 11:02:16.830461	\N	464	2	085706076686	arinifazrin236@gmail.com	
112	Deni Sukma	1970-01-01 00:00:00	\N	2019-11-20 11:09:44.655662	\N	179	2	081381296657	deni.sukma7@gmail.com	
113	Yopik	1970-01-01 00:00:00	\N	2019-11-20 11:10:46.041236	\N	76	2	085921484828	yopik@droidlime.com	
115	Jihan Nasir	1970-01-01 00:00:00	\N	2019-11-20 11:11:55.985327	\N	166	2	081284843110	jihan.nasir87@gmail.com	
117	Oki Subrata	1970-01-01 00:00:00	\N	2019-11-20 11:14:19.366407	\N	184	2	087770019804	okisubrata@gmail.com	
118	Fauzi Rasyad	1970-01-01 00:00:00	\N	2019-11-20 11:15:08.811582	\N	172	2	08999538524	fauzi@teknojurnal.com	
120	Anggun	1970-01-01 00:00:00	\N	2019-11-20 11:16:41.32078	\N	229	2	085727363281	tigatanpanama@gmail.com	
121	Saliki	1970-01-01 00:00:00	\N	2019-11-20 11:17:09.875964	\N	251	2	081807565552	saliki@genmuda.com	
122	Agung	1970-01-01 00:00:00	\N	2019-11-20 11:17:42.600181	\N	63	2	0856 4365 7915	apratnyawan@gmail.com	
123	Tuty Endah Pertiwi	1970-01-01 00:00:00	\N	2019-11-20 11:18:15.410782	\N	134	2	0812 963 88 56	tepioc@yahoo.com	
124	Setia Gunawan	1970-01-01 00:00:00	\N	2019-11-20 11:19:03.886959	\N	134	2	0812 9662 008	setia.gunawan@me.com	
125	Dayu	1970-01-01 00:00:00	\N	2019-11-20 11:19:30.23361	\N	151	2	0818 0897 6129	dayu@infokomputer.com	
126	Adam Rizal	1970-01-01 00:00:00	\N	2019-11-20 11:20:29.966514	\N	151	2	0813 3644 9995	adamrizallulhaq@yahoo.com	
127	Cakra	1970-01-01 00:00:00	\N	2019-11-20 11:20:57.637267	\N	151	2	0818 609 290	cakra@infokomputer.com	
129	Liana Threestayanti	1970-01-01 00:00:00	\N	2019-11-20 11:22:00.756793	\N	151	2	0815 8409 0387	lili@infokomputer.com	
132	Yufianto Gunawan	1970-01-01 00:00:00	\N	2019-11-20 11:23:51.750085	\N	224	2	0812 8657 3759	gunawan@jagatreview.com	
133	Rifqi Sulthan	1970-01-01 00:00:00	\N	2019-11-20 11:24:23.275902	\N	224	2	0812 1367 7671	rifqi@jagatreview.com	
135	Epi Kusnara	1970-01-01 00:00:00	\N	2019-11-20 11:25:39.374496	\N	235	2	0813 2097 5116	epi.kusnara@mainspring.technology	
136	Satria Aji Purwoko	1970-01-01 00:00:00	\N	2019-11-20 11:26:08.400566	\N	235	2	0822 1338 0366	satriaji96@gmail.com	
7	Adhitya Wibawa	1970-01-01 00:00:00	1261152463	2019-11-19 16:59:31.573847	2019-11-20 11:28:06	172	2	085711211668	adhitya@teknojurnal.com	
80	Eko Lannueardy	1970-01-01 00:00:00	2665191599	2019-11-19 17:21:03.565197	2019-11-21 15:15:31	76	2	085810307962	lannue@droidlime.com	
110	Maul	1970-01-01 00:00:00	3896446671	2019-11-20 11:06:25.221193	2019-11-21 15:25:49	521	2	0818882960	mauliasalamuddin@gmail.com	
108	Firman Nugraha	1970-01-01 00:00:00	0342440079	2019-11-20 11:03:44.147334	2019-11-21 15:38:39	172	2	087770105348	firman@gadgetren.com	
130	Dedy Irvan	1970-01-01 00:00:00	2072912585	2019-11-20 11:22:38.111476	2019-11-21 15:43:27	224	2	0818 922 952	dedy@jagatreview.com	
84	Dian Iskandar	1970-01-01 00:00:00	0924026421	2019-11-19 17:21:47.433856	2019-11-21 16:20:50	359	2	081280070800	iskpage@gmail.com	
78	Syamhudi	2019-11-19 00:00:00	1943510853	2019-11-19 17:20:44.424744	2019-11-27 09:39:55	363	2	0813 8915 5359	syam_hudi@yahoo.com	
131	Friska Suryawinata S	1970-01-01 00:00:00	0093354185	2019-11-20 11:23:15.431253	2019-12-04 13:15:23	224	2	0817 6454 250	friska@jagatreview.com	
79	Arie	2019-11-19 00:00:00	1923280303	2019-11-19 17:20:52.08342	2019-12-04 13:26:04	409	2	089653236137	arie@techdaily.id	
109	Choi	1970-01-01 00:00:00	1220581839	2019-11-20 11:05:03.918742	2019-12-04 13:54:30	417	2	081290001305	choirurizkia@technologue.id	
95	Icha	2019-11-20 00:00:00	0810763119	2019-11-20 09:02:18.928399	2019-12-05 09:17:25	599	2			
86	Hadiyah, SP	2019-11-19 00:00:00	0681106031	2019-11-19 17:22:23.199201	2019-12-07 14:06:06	598	2	081218318502	dyrasymu@gmail.com	
128	Rafki	1970-01-01 00:00:00	0230205623	2019-11-20 11:21:28.851983	2019-12-07 13:57:34	151	2	0812 8593 6661	01rafki@gmail.com	
97	Erlan	2019-11-20 00:00:00	0681879119	2019-11-20 09:51:12.042684	2019-12-20 13:29:00	432	2	0815 1171 1743	erlanmart@gmail.com	
114	Zihan Fajrin	1970-01-01 00:00:00	0092338089	2019-11-20 11:11:20.184577	2020-01-04 16:00:18	507	2	08989457847	zihanfajrin27@gmail.com	
119	Riswan Abidin	1970-01-01 00:00:00	0458768943	2019-11-20 11:15:56.402284	2020-01-04 17:24:03	673	4	085778443455	riswan@rswn.me	
138	Tedi Yuni Alriyanto	1970-01-01 00:00:00	\N	2019-11-20 11:30:21.289405	\N	191	2	0838 7460 7774	tedi@pricebook.co.id	
140	Evan	1970-01-01 00:00:00	\N	2019-11-20 11:31:38.4429	\N	191	2	0812 9733 2242	evan@pricebook.co.id	
141	Endy Tresnadi	1970-01-01 00:00:00	\N	2019-11-20 11:32:19.367457	\N	191	2	0899 7431 549	endy.tresnadi@gmail.com	
142	Bagus	1970-01-01 00:00:00	\N	2019-11-20 11:32:42.860181	\N	191	2	0877 8874 6814	bagus.notoagung@pricebook.com	
143	Gan Gan Anugrah Abadi	1970-01-01 00:00:00	\N	2019-11-20 11:33:16.19316	\N	191	2	0819 1118 1523	gangan.anugrah@pricebook.co.id	
145	Hari	1970-01-01 00:00:00	\N	2019-11-20 11:34:23.314042	\N	367	2	'0853 2040 0807	redaksi.review1st@gmail.com	
148	Uday Rayana	1970-01-01 00:00:00	\N	2019-11-20 11:35:41.639972	\N	464	2	0811 924 970	uday@selular.co.id	
149	Iman	1970-01-01 00:00:00	\N	2019-11-20 11:36:28.276201	\N	464	2	0857 2221 1129	iman@selular.co.id	
151	Samin	1970-01-01 00:00:00	\N	2019-11-20 11:37:21.354536	\N	464	2	0817 991 3548	samin@selular.co.id	
153	Galing Kusumojati	1970-01-01 00:00:00	\N	2019-11-20 11:39:01.523682	\N	359	2	0856 4547 2771	galing@tabloidpulsa.co.id	
154	Doan Andhika H.	1970-01-01 00:00:00	\N	2019-11-20 11:39:27.568307	\N	359	2	0811 241 588	doan@tabloidpulsa.co.id	
155	Anwar	1970-01-01 00:00:00	\N	2019-11-20 11:39:51.527546	\N	359	2	0811 8800 788	anwar.aburizal@gmail.com	
156	Albert Tarigan	1970-01-01 00:00:00	\N	2019-11-20 11:41:09.705644	\N	432	2	0813 1774 9573	albert.tarigan@gmail.com	
157	Lalu Ahmad Hamdani	1970-01-01 00:00:00	\N	2019-11-20 11:41:41.66824	\N	432	2	0878 6482 4864	laluhamdani01@gmail.com	
158	Lely Maulida	1970-01-01 00:00:00	\N	2019-11-20 11:42:16.352585	\N	432	2	0821 022 773	lelymaulida21@gmail.com	
159	Dinda Ayu	1970-01-01 00:00:00	\N	2019-11-20 11:42:46.294525	\N	432	2	0816 1763 6992	dindaayuwidya@gmail.com	
160	Endah	1970-01-01 00:00:00	\N	2019-11-20 11:43:52.512741	\N	437	2	0888 89 88 389	redaksi@teknogav.com	
161	Nurul	1970-01-01 00:00:00	\N	2019-11-20 11:45:17.193362	\N	522	2	0857 7528 1950	nurul@trenteknologi.com	
162	Ida Farida	1970-01-01 00:00:00	\N	2019-11-20 11:45:50.946535	\N	445	2	0856 7535 573	ida.farida20@gmail.com	
164	Dwiyan Budi Sulistyo	1970-01-01 00:00:00	\N	2019-11-20 11:48:33.038298	\N	503	2	0817 0334 3711	aditsheila.sheila@gmail.com	
165	Farhan	1970-01-01 00:00:00	\N	2019-11-20 11:49:17.23972	\N	493	2	0896 0838 8609	farhanzchri@gmail.com	
166	Irianto	1970-01-01 00:00:00	\N	2019-11-20 11:49:58.499602	\N	560	2	0813 1675 0530	bhenzo@gmail.com	
167	Ridwan	1970-01-01 00:00:00	\N	2019-11-20 11:50:50.101391	\N	560	2	0812 8499 7415	ridwan@thee.co.id	
168	Renhard	1970-01-01 00:00:00	\N	2019-11-20 11:51:20.694447	\N	592	2	0812 9811 0812	renhardharjanto@gmail.com	
170	Deddy	1970-01-01 00:00:00	\N	2019-11-20 11:57:26.724231	\N	542	3	0877 7143 1036	udadeddy@gmail.com	
171	Kinanti Nuke	1970-01-01 00:00:00	\N	2019-11-20 11:58:10.394591	\N	542	3	0811 2814 396	kinantinuke@gmail.com	
172	Indri Wulandari	1970-01-01 00:00:00	\N	2019-11-20 11:58:38.15021	\N	188	3	0812 8345 6485	indriwulan86@gmail.com	
174	Gilang	1970-01-01 00:00:00	\N	2019-11-20 12:00:25.643158	\N	347	3	0819 0823 2056	gilang.mpgmedia@gmail.com	
175	Adam	1970-01-01 00:00:00	\N	2019-11-20 12:00:44.874051	\N	347	3	0812 8813 5920	aliadammalik@gmail.com	
176	Hana	1970-01-01 00:00:00	\N	2019-11-20 12:01:39.730667	\N	563	3	0856 903 4864	hana.devarianti@cosmopolitan.co.id	
177	Auli	1970-01-01 00:00:00	\N	2019-11-20 12:02:04.213284	\N	14	3	0899 8828 286	auli.hadi@gcmgroup.id	
178	Rima Sekarani	1970-01-01 00:00:00	\N	2019-11-20 12:02:30.408625	\N	19	3	0856 4367 1694	sekarani90@gmail.com	
179	Heru	2019-11-20 00:00:00	0567581817	2019-11-20 12:18:48.050197	2019-11-20 12:19:35	518	2		heru.theruru2@gmail.com	
180	Desman Mendrofa	1970-01-01 00:00:00	\N	2019-11-20 13:46:12.90754	\N	148	3	0812 6514 5087	desman.femina@gmail.com	
182	Ariesta Dian	1970-01-01 00:00:00	\N	2019-11-20 13:47:21.976077	\N	153	3	0838 9220 5005	vinsensia.dianawati@kly.id	
183	Anisha	1970-01-01 00:00:00	\N	2019-11-20 13:47:43.039713	\N	153	3	0857 1120 1895	saktianputrianisha@gmail.com	
184	Fitri Andiani	1970-01-01 00:00:00	\N	2019-11-20 13:48:16.32488	\N	153	3	0812 86547424	fitri.andiani@kly.id	
185	Anindya	1970-01-01 00:00:00	\N	2019-11-20 13:48:44.127803	\N	18	3	0813 1405 2661	anindya.paramita@herpersbazzar.co.id	
186	Andhini Puteri	1970-01-01 00:00:00	\N	2019-11-20 13:49:09.590167	\N	153	3	0813 1481 0747	andhiniputeri@herwold.co.id	
181	Adinda Tri Wardhani	1970-01-01 00:00:00	\N	2019-11-20 13:46:56.01113	2019-11-20 13:49:39	22	3	0817 0072 308	adinda.wardhani@kly.id	
187	Olivia	1970-01-01 00:00:00	\N	2019-11-20 13:50:11.400381	\N	22	3	0812 5252 3461	livveintedos@gmail.com	
188	Fitria Sofyani	1970-01-01 00:00:00	\N	2019-11-20 13:50:43.788346	\N	237	3	0856 1005 645	fitria@trinaya.com	
189	Fenly Anafary	1970-01-01 00:00:00	\N	2019-11-20 13:51:12.491566	\N	237	3	0878 8732 2204	fenly.anafary@trinaya.com	
190	Aniza Pratwi	1970-01-01 00:00:00	\N	2019-11-20 13:51:41.719836	\N	237	3	0878 8920 7337	anizapratiwi15@gmail.com	
191	Rerre Adysti	1970-01-01 00:00:00	\N	2019-11-20 13:52:08.496994	\N	21	3	0878 7119 8064	rerre@pamperpop.com	
192	Dewi Susanti	1970-01-01 00:00:00	\N	2019-11-20 13:52:40.125403	\N	341	3	0852 1949 9727	dewi@registryindonesia.com	
193	Wistaria Triana	1970-01-01 00:00:00	\N	2019-11-20 13:53:09.854852	\N	339	3	0812 9123 9162	taria@tabloidbintang.com	
194	Ully	1970-01-01 00:00:00	\N	2019-11-20 13:53:36.46013	\N	339	3	0813 8990 1733	liee.sagita@yahoo.com	
195	Naomi	1970-01-01 00:00:00	\N	2019-11-20 13:54:06.044756	\N	350	3	0817 0165 485	naomi@yahoo.com	
196	Huda	1970-01-01 00:00:00	\N	2019-11-20 13:54:25.991961	\N	350	3	0812 3275 1165	hudanyata@gmail.com	
198	Karin Yunia	1970-01-01 00:00:00	\N	2019-11-20 13:55:15.794817	\N	348	3	0878 8957 4182	karin.yunia@gmx.com	
199	Reylando	1970-01-01 00:00:00	\N	2019-11-20 13:55:39.281984	\N	348	3	0815 8090 205	reylandoekaputra@gmail.com	
200	Dewi Anggraeni	1970-01-01 00:00:00	\N	2019-11-20 13:56:07.205197	\N	348	3	0857 1881 4442	dewianggraeni1992@gmail.com	
201	Dewi	1970-01-01 00:00:00	\N	2019-11-20 13:56:34.6102	\N	348	3	0818 609 329	syafrianis1210@gmail.com	
150	Khoirunnisa	1970-01-01 00:00:00	2814072911	2019-11-20 11:36:58.60053	2019-11-21 15:17:49	464	2	0838 8020 042	nisa@selular.co.id	
146	Ahmad	1970-01-01 00:00:00	0308310607	2019-11-20 11:34:46.24678	2019-12-04 12:47:26	367	2	0896 3702 9086	ogadaliv@gmail.com	
147	Steven	1970-01-01 00:00:00	1667165799	2019-11-20 11:35:15.068256	2019-12-04 13:21:10	380	2	0812 1890 707	steven.irwandi@gmail.com	
139	Nurabdillah	1970-01-01 00:00:00	1525110639	2019-11-20 11:31:06.604928	2019-12-04 13:47:20	191	2	0878 7769 8545	nur.abdilla@pricebook.co.id	
163	Naufal Mamduh	1970-01-01 00:00:00	2945097807	2019-11-20 11:47:40.55445	2019-12-07 13:59:03	445	2	0812 9112 8130	naufal.mamduh@gmail.com	
152	Aldrin Syaifullah	1970-01-01 00:00:00	3727037487	2019-11-20 11:38:21.530301	2019-12-07 13:57:52	359	2	0813 9999 8669	aldrinsymu@gmail.com	
197	Kartika	1970-01-01 00:00:00	0886910393	2019-11-20 13:54:50.64755	2019-12-11 13:01:08	350	3	0822 4409 9315	kartikatpnyata@gmail.com	
169	Yossie Dwi Prananto	1970-01-01 00:00:00	1978945295	2019-11-20 11:51:49.609844	2020-01-04 15:32:02	592	2	0856 8554 002	yossiedp@gmail.com	
144	Agung Tri Wibowo	1970-01-01 00:00:00	3089229219	2019-11-20 11:33:49.593507	2020-01-04 18:50:41	191	2	0878 0976 1891	agung.triwibowo@pricebook.co.id	
202	Syanne	1970-01-01 00:00:00	\N	2019-11-20 13:57:06.178447	\N	590	3	0819 706 445	ssusita@yahoo.com	
203	Tanto	1970-01-01 00:00:00	\N	2019-11-20 13:57:28.232748	\N	576	3	0856 1555 400	dhartanto@destin.com	
204	Yopie	1970-01-01 00:00:00	\N	2019-11-20 13:57:48.523316	\N	576	3	0811 8671 307	yopi@destinasian.com	
205	Dedy Sofan	1970-01-01 00:00:00	\N	2019-11-20 13:58:08.888066	\N	233	3	0817 6972 377	dedysofan@gmail.com	
206	Sopian	1970-01-01 00:00:00	\N	2019-11-20 13:58:27.955892	\N	233	3	0813 1843 0407	sopian.male.id@gmail.com	
207	Gading P	1970-01-01 00:00:00	\N	2019-11-20 13:58:48.181623	\N	233	3	0819 0800 9002	gading20.male.id@gmail.com	
208	Yudha Satrio Hutomo	1970-01-01 00:00:00	\N	2019-11-20 13:59:20.246956	\N	233	3	0896 5045 6078	yudasatrio07@gmail.com	
209	Mayla	1970-01-01 00:00:00	\N	2019-11-20 13:59:39.353628	\N	233	3	0812 9145 4817	mayladevia99@gmail.com	
212	M. Wahyu Hidayat	1970-01-01 00:00:00	\N	2019-11-20 14:06:14.313107	\N	167	2	0856 5969 0689	wahyuhidayat@liputan6.com	
213	Damar	1970-01-01 00:00:00	\N	2019-11-20 14:06:36.032619	\N	167	2	0817 686 4689	agustinusmario@ymail.com	
214	Yuslianson	1970-01-01 00:00:00	\N	2019-11-20 14:07:04.479635	\N	167	2	0818 0615 1940	yuslianson@kmkonline.co.id	
215	Yudha	1970-01-01 00:00:00	\N	2019-11-20 14:07:43.52114	\N	54	2	0856 9302 2330	pratomoyudha70@gmail.com	
218	Anggoro Suryo	1970-01-01 00:00:00	\N	2019-11-20 14:09:47.787675	\N	583	2	0813 8027 2100	anggoro@detik.com	
94	Donnie	2019-11-20 00:00:00	1848171375	2019-11-20 08:59:46.857547	2019-11-20 14:17:21	409	2		donniepratama08@gmail.com	
221	Joshua Michael S	1970-01-01 00:00:00	\N	2019-11-20 14:38:40.062233	\N	383	2	0821 1171 3051	michaeljoshua098@gmail.com	
222	M.Fikrie	1970-01-01 00:00:00	\N	2019-11-20 14:39:41.898114	\N	146	2	M.Fikrie	muhammad.fikrie@kumparan.com	
225	Leo Dwi Atmoko	1970-01-01 00:00:00	\N	2019-11-20 14:42:35.581083	\N	478	1	0812 9575 4205	leodwijatmiko@gmail.com	
226	Fauzan	1970-01-01 00:00:00	\N	2019-11-20 14:43:43.350368	\N	478	2	081310481883	myownoase@gmail.com	
116	Iqbal	1970-01-01 00:00:00	0240138743	2019-11-20 11:12:41.81152	2019-11-21 15:27:20	184	2	08158112518	muhamad.babay@gmail.com	
241	Michael Prajanto	1970-01-01 00:00:00	0790107813	2019-11-22 11:19:22.2693	2019-11-22 15:42:57	610	4	0858 8554 1535	mprajanto@hotmail.com	
227	Oik	1970-01-01 00:00:00	1288059695	2019-11-21 15:30:42.585635	2019-11-21 15:32:56	54	2	0856 8894 904	oik.yusuf@kompas.co.id	
219	Cahyandaru Kuncorojati	1970-01-01 00:00:00	3631494127	2019-11-20 14:35:00.573183	2019-11-21 15:35:14	316	2	0856 9711 0608	cahyandaru.kuncorojati@gmail.com'	
228	Tangguh	1970-01-01 00:00:00	\N	2019-11-21 15:40:30.632298	\N	417	2	087808423273	tangguhyudh@gmail.com	
223	Bianda Ludwianto	1970-01-01 00:00:00	4050096581	2019-11-20 14:40:05.892066	2019-11-21 15:51:04	146	2	0856 9267 2993	bianda.ludwianto@kumparan.com	
211	Agustin	1970-01-01 00:00:00	1795400527	2019-11-20 14:05:41.754856	2019-11-21 15:56:56	167	2	0812 2445 5072	agustin.wardani@gmail.com	
250	Fenny	2019-11-22 00:00:00	\N	2019-11-22 16:06:34.959661	\N	604	2			
229	Fidin	1970-01-01 00:00:00	1902518671	2019-11-21 15:57:30.803931	2019-11-21 15:59:14	12	2	0813 8899 9850	mujahid.fidinillah@detik.com	
67	Danang Arradian	1970-01-01 00:00:00	3156894159	2019-11-19 17:17:46.331989	2019-11-21 16:03:36	101	2	087888824441	xevildanx@gmail.com	
230	Malvin Nathaniel	1970-01-01 00:00:00	\N	2019-11-22 11:08:57.22331	\N	600	4	0811 3209 198	bit.id@yahoo.com	
235	Hadi Gunawan	1970-01-01 00:00:00	\N	2019-11-22 11:11:11.351207	\N	606	4	0818 0669 0630	hadi@gadgetgaul.com	
236	Ilham Subki Wijaya	1970-01-01 00:00:00	\N	2019-11-22 11:11:35.530846	\N	607	4	0812 1234 2963	info@gaptech.id	
238	Saktishwara Balakresna 	1970-01-01 00:00:00	\N	2019-11-22 11:18:50.498545	\N	609	4	0817 0017 187	kartolodankumar@gmail.com	
239	Saktishwara Balakresna 	1970-01-01 00:00:00	\N	2019-11-22 11:18:50.510038	\N	609	4	0817 0017 187	kartolodankumar@gmail.com	
240	Saktishwara Balakresna 	1970-01-01 00:00:00	\N	2019-11-22 11:18:50.516018	\N	609	4	0817 0017 187	kartolodankumar@gmail.com	
246	Krida	1970-01-01 00:00:00	\N	2019-11-22 11:21:41.908247	\N	615	4	0856 888 0668	krida@teknologue.com	
247	Hendrik Gunawan	1970-01-01 00:00:00	\N	2019-11-22 11:22:07.74751	\N	517	4	0897 9454 010	hendrik@trendingtek.com	
232	Arbi 	1970-01-01 00:00:00	2073078777	2019-11-22 11:09:54.343583	2019-11-22 16:33:06	602	4	0857 7938 1888	me@dhiar.com	
245	Taufik N	1970-01-01 00:00:00	2546779023	2019-11-22 11:20:55.336522	2019-11-22 15:34:28	614	4	0813 1690 8177	taufiknobo@gmail.com	
234	Fenny Astri	1970-01-01 00:00:00	2888293999	2019-11-22 11:10:47.685508	2019-11-22 16:06:44	604	4	0857 7337 7367	gadgetempire.id@gmail.com	
231	Billy Billfakkar	1970-01-01 00:00:00	1674151375	2019-11-22 11:09:22.857267	2019-11-22 16:18:51	601	4	0811 1013 309	billydolmen@gmail.com	
249	Melisa Novianti	1970-01-01 00:00:00	0229391823	2019-11-22 11:23:48.9659	2019-11-22 16:21:52	617	4	0857 8152 8670	melisanoviantiwijaya@gmail.com	
256	Herry	1970-01-01 00:00:00	\N	2019-11-25 10:03:27.698348	\N	58	2	0838 9406 3131	gerrygerger19@gmail.com	
237	Divvy	1970-01-01 00:00:00	2934406991	2019-11-22 11:18:03.00248	2019-11-22 16:29:22	608	4	081319180027	divyanza@gadgetainment.com 	
251	Dhiar Lukito Adhi	2019-11-22 00:00:00	\N	2019-11-22 16:34:31.539323	\N	602	4	0857 7938 1888	me@dhiar.com	
244	Ario Pratomo	1970-01-01 00:00:00	4293668943	2019-11-22 11:20:32.999063	2019-11-22 17:00:50	613	4	0818 8331 07	ario_pratomo@yahoo.com	
253	Denny	1970-01-01 00:00:00	\N	2019-11-25 10:01:02.136616	\N	58	2	0856 4880 1244	denny.iswanto90@gmail.com	
254	Vidyandini	1970-01-01 00:00:00	\N	2019-11-25 10:02:14.043088	\N	58	2	0837 5402 335	agivonia@gmail.com	
255	Afifah	1970-01-01 00:00:00	\N	2019-11-25 10:02:40.980294	\N	58	2	0896 0117 0316	afifahassyathiriy@gmail.com	
257	Dhera Arizona Pratiwi	1970-01-01 00:00:00	\N	2019-11-25 10:04:01.258006	\N	58	2	0858 1975 5153	dhearizona@gmail.com	
258	Wayan	1970-01-01 00:00:00	\N	2019-11-25 10:04:25.332234	\N	58	2	0853 9995 6462	wayanadhi96@gmail.com	
260	Dayu	1970-01-01 00:00:00	\N	2019-11-25 10:05:08.857035	\N	58	2	0812 9939 9786	aitaayoe86@gmail.com	
261	Chodijah F	1970-01-01 00:00:00	\N	2019-11-25 10:05:34.021026	\N	58	3	0813 1379 8636	dije0493@gmail.com	
262	Suryanto	1970-01-01 00:00:00	\N	2019-11-25 10:06:22.921911	\N	110	2	0813 8271 9074	suryantob@gmail.com	
242	Putu Reza	1970-01-01 00:00:00	0789982287	2019-11-22 11:19:50.434726	2020-01-04 18:28:53	611	4	0815 7439 6998	puturez@gmail.com	
210	Andina	1970-01-01 00:00:00	1437093893	2019-11-20 14:05:17.393548	2019-12-04 13:09:48	167	2	0812 1348 3140	librianty.andina@gmail.com	
217	Lukman	1970-01-01 00:00:00	0952132085	2019-11-20 14:09:06.397725	2019-12-04 13:15:38	573	2	0878 8487 1712	lukman@dailysocial.net	
216	Bill Clinten	1970-01-01 00:00:00	2612833295	2019-11-20 14:08:11.549272	2019-12-04 13:16:11	54	2	0897 2657 182	billclintens@gmail.com	
248	Eka Putri Alvi Syahrina	1970-01-01 00:00:00	0092181561	2019-11-22 11:22:39.13848	2019-12-04 13:56:17	616	4	0899 6350 396	arrinish@gmail.com	
233	Mikhail Surjadi	1970-01-01 00:00:00	4236857967	2019-11-22 11:10:18.444395	2020-01-04 17:07:10	603	4	0857 1900 7312	gadgetapaid@gmail.com	
259	Tria S	1970-01-01 00:00:00	1246971140	2019-11-25 10:04:47.118139	2019-12-11 13:04:39	58	2	0813 8413 3412	kesitria@gmail.com	
220	Luthfi Anggraeni	1970-01-01 00:00:00	2159844047	2019-11-20 14:35:34.808411	2020-01-04 15:14:19	316	2	081514217211	lu.anggraeni@gmail.com	
243	Anton N	1970-01-01 00:00:00	0971891151	2019-11-22 11:20:11.017148	2020-01-04 18:34:44	612	4	0812 9598 8805	pizza.gadgetyt@gmail.com	
263	Royke	1970-01-01 00:00:00	\N	2019-11-25 10:06:58.268681	\N	110	1	0821 1018 3028	royke.antara@gmail.com	
264	Arindra Meodia	1970-01-01 00:00:00	\N	2019-11-25 10:07:22.629732	\N	110	2	0815 2136 943	a_meodia@yahoo.com	
265	Ida Nurcahyani	1970-01-01 00:00:00	\N	2019-11-25 10:07:49.88048	\N	110	2	0821 1601 3287	vivalaida03@gmail.com	
266	Citro	1970-01-01 00:00:00	\N	2019-11-25 10:08:13.180742	\N	110	2	0852 6482 1331	citroatmoko@gmail.com	
267	Aliyah Rahma	1970-01-01 00:00:00	\N	2019-11-25 10:08:41.08877	\N	110	2	0811 8688 780	alyarahma1312@gmail.com	
268	Ani Apriliani	1970-01-01 00:00:00	\N	2019-11-25 10:09:08.188023	\N	110	2	0822 9801 5505	aniapriliani8@gmail.com	
269	Rr. Cornea Khairany	1970-01-01 00:00:00	\N	2019-11-25 10:16:05.391808	\N	110	5	0856 1206 700	ck.rany@gmail.com	
271	Fathur Rochman	1970-01-01 00:00:00	\N	2019-11-25 10:16:57.428975	\N	110	3	0878 8245 8565	fathurrochman23@gmail.com	
272	Andi Firdaus	1970-01-01 00:00:00	\N	2019-11-25 10:17:23.835085	\N	110	3	0815 929 6409	andifirdaus.antara@gmail.com	
273	A Rauf	1970-01-01 00:00:00	\N	2019-11-25 10:18:21.890664	\N	110	6	0812 9551 4848	raufadipati@gmail.com	
274	Devi	1970-01-01 00:00:00	\N	2019-11-25 10:18:52.639642	\N	110	7	08563290275	devinindy@gmail.com	
276	Yudo Dahono	1970-01-01 00:00:00	\N	2019-11-25 10:19:59.674573	\N	446	2	0856 7877 429	yudo.dahono@beritasatumedia.com	
277	Sontry	1970-01-01 00:00:00	\N	2019-11-25 10:20:23.914108	\N	446	2	0856 7877 429 	sontry.stephanus@beritasatumedia.com	
278	Imam Muzakir	1970-01-01 00:00:00	\N	2019-11-25 10:20:52.927967	\N	446	1	0812 836 2381	imam.muzakir@investor.co.id	
279	Wulan	1970-01-01 00:00:00	\N	2019-11-25 10:23:04.533154	\N	446	1	082112317576	eny_wulandari@investor.co.id	
280	Ervina	1970-01-01 00:00:00	\N	2019-11-25 10:23:37.892424	\N	556	2	0856 9226 1650	ervina.ini@gmail.com	
282	Hafidz Mukti Ahmad	1970-01-01 00:00:00	\N	2019-11-25 10:24:24.355158	\N	556	2	0812 8129 6756	hafidz.mukti@cnnindonesia.com	
283	Agnes	1970-01-01 00:00:00	\N	2019-11-25 10:25:08.000783	\N	556	2	0899 7816 258	agnessavithri@gmail.com	
284	Ulfa Arieza	1970-01-01 00:00:00	\N	2019-11-25 10:25:39.956278	\N	556	6	0813 2925 7729	ulfaarieza@gmail.com	
285	Elis	1970-01-01 00:00:00	\N	2019-11-25 10:26:04.329129	\N	556	3	0857 2896 5312	redaksi-gayahidup@cnnindonesia.com	
286	Yoga Wisesa	1970-01-01 00:00:00	\N	2019-11-25 10:26:41.228169	\N	573	2	0852 2020 0565	yoga.wisesa@dailysocial.net	
287	Yenny	1970-01-01 00:00:00	\N	2019-11-25 10:27:09.124088	\N	573	2	0877 8619 2624	yenny@dailysocial.net	
288	Marsya	1970-01-01 00:00:00	\N	2019-11-25 10:27:36.78623	\N	573	3	0856 1067 359	marsya@dailysocial.id	
289	Ryza	1970-01-01 00:00:00	\N	2019-11-25 10:28:12.1128	\N	573	3	0899 5653 023	ryza@dailysocial.id	
290	Ellavie Ichlasa A	1970-01-01 00:00:00	\N	2019-11-25 10:28:49.858906	2019-11-25 10:29:13	573	8	0856 4046 1768	ellavie.ichlasa@gmail.com	
291	Ardhi Suryadhi	1970-01-01 00:00:00	\N	2019-11-25 10:30:00.396733	\N	583	2	0815 8414 3744	ardhi@detik.com	
292	Nabila	1970-01-01 00:00:00	\N	2019-11-25 10:30:21.165124	\N	583	2	0878 5969 9955	billa.nurinabilla@gmail.com	
293	Angga	1970-01-01 00:00:00	\N	2019-11-25 10:30:40.871316	\N	583	2	0821 2245 1983	angga@detik.com	
294	Fino	1970-01-01 00:00:00	\N	2019-11-25 10:31:10.454389	\N	583	2	0822 6611 2824	fino@detik.com	
295	Virgina Maulita	1970-01-01 00:00:00	\N	2019-11-25 10:31:49.074608	\N	583	2	0852 4445 5596	virgina.maulita@gmail.com	
296	Agus	1970-01-01 00:00:00	\N	2019-11-25 10:32:19.664831	\N	583	2	0838 1673 6665	agustriharyanto13@gmail.com	
297	Imron	1970-01-01 00:00:00	\N	2019-11-25 10:32:43.390841	\N	583	2	0859 3901 5770	muhamad.imron@detik.com	
298	Kris Fathoni	1970-01-01 00:00:00	\N	2019-11-25 10:34:07.228549	\N	583	9	0812 8558 540	kris@detik.com	
299	Frieda	1970-01-01 00:00:00	\N	2019-11-25 10:34:34.918389	\N	583	7	0856 4882 2945	frieda.isyana@detik.com	
300	Rengga	1970-01-01 00:00:00	\N	2019-11-25 10:35:02.35514	\N	583	1	0878 2102 2773	rengga@detik.com	
301	Achmad Dwi Afriyadi	1970-01-01 00:00:00	\N	2019-11-25 10:38:15.27342	\N	583	1	085640367246	achmad.dwi@detik.com	
302	Komario Bahar	1970-01-01 00:00:00	\N	2019-11-25 10:38:44.664938	\N	583	3	0856 7669 825	mario@detik.com	
303	Hestianingsih	1970-01-01 00:00:00	\N	2019-11-25 10:39:16.857096	\N	583	3	0878 8552 2502	hesti@wolipop.com	
304	Andi Anisa	1970-01-01 00:00:00	\N	2019-11-25 10:39:49.233652	\N	583	12	0856 8787 991	andiannisa@detik.com	
305	Ridwan	1970-01-01 00:00:00	\N	2019-11-25 10:40:34.31447	\N	583	11	089660948685	ridwan.arifin@detik.com	
306	Chandra	1970-01-01 00:00:00	\N	2019-11-25 10:41:05.254608	\N	267	2	0818 727 233	chandra@gizmologi.com	
307	Eny Wulandari	1970-01-01 00:00:00	\N	2019-11-25 10:41:32.991884	\N	267	2	0819 3214 9760	enywulandari@gizmologi.com	
308	Endah Uktolseja	1970-01-01 00:00:00	\N	2019-11-25 10:42:01.701462	\N	267	2	0856 8988 389	endah.tu@gmail.com	
309	Margith Damanik	1970-01-01 00:00:00	\N	2019-11-25 10:42:45.063187	\N	89	1	0813 7508 8971	margith.damanik@idntimes.com	
310	Ikhsan	1970-01-01 00:00:00	\N	2019-11-25 10:43:25.516883	\N	165	2	08111 87436	ikhsan.suryakusumah@gmail.com	
311	Agus Priatna	1970-01-01 00:00:00	\N	2019-11-25 10:43:55.519578	\N	165	2	0857 1704 0225	aguspriatna26@yahoo.co.id	
312	Mohammad Fadil	1970-01-01 00:00:00	\N	2019-11-25 10:44:21.766731	\N	165	2	0813 7065 9124	mfadilsend@gmail.com	
313	Tika	1970-01-01 00:00:00	\N	2019-11-25 10:44:44.980997	\N	165	3	0813 1461 2238	mia_tikamaniesz@yahoo.com	
314	Vien	1970-01-01 00:00:00	\N	2019-11-25 11:00:07.224534	\N	142	3	0813 8108 0043	dm_vien@yahoo.co.id	
315	Iwan Kurniawan	1970-01-01 00:00:00	\N	2019-11-25 11:00:48.249003	\N	200	2	0813 8166 9118	iwan5180@gmail.com	
316	Rian	1970-01-01 00:00:00	\N	2019-11-25 11:01:40.35609	\N	271	2	0857 8244 6378	rian.alfianto@jawapos.com	
317	Dhimas	1970-01-01 00:00:00	\N	2019-11-25 11:02:05.761753	\N	271	2	0817 0303 1717	dhimas@jawapos.com	
318	Hasmi Rifani	1970-01-01 00:00:00	\N	2019-11-25 11:03:29.929401	\N	271	2	0852 5176 5787	hasmy@jawapos.com	
319	Bintang	1970-01-01 00:00:00	\N	2019-11-25 11:04:15.253624	\N	271	2	0812 8252 1177	bintang.rahmat@jawapos.com	
320	Dedy Sofyan	1970-01-01 00:00:00	\N	2019-11-25 11:04:49.652336	\N	288	2	0812 8969 8982	dedysofyan777@gmail.com	
321	Mesya	1970-01-01 00:00:00	\N	2019-11-25 11:05:07.495918	\N	288	3		mesyamohamad@gmail.com	
323	Murti	1970-01-01 00:00:00	\N	2019-11-25 11:06:17.768869	\N	54	2	0853 2016 1574	murtalingg@gmail.com	
324	Anna	1970-01-01 00:00:00	\N	2019-11-25 11:06:49.516345	\N	54	1	0819 3299 1412	ana@kompas.com	
325	Pramdia	1970-01-01 00:00:00	\N	2019-11-25 11:07:13.777392	\N	54	1	0878 8275 7474	arhandopram@yahoo.com	
327	Sastri	1970-01-01 00:00:00	\N	2019-11-25 11:08:30.456048	\N	54	9	0812 2250 666	anindiati.sastri@gmail.com	
328	Yunan	1970-01-01 00:00:00	\N	2019-11-25 11:08:59.879183	\N	54	7	0813 9263 2226	yunantowijiutomo@gmail.com	
322	Wahyunanda	1970-01-01 00:00:00	0899447225	2019-11-25 11:05:49.963726	2020-01-04 15:04:24	54	2	0822 4277 7662	wahyunanda22@gmail.com	
281	Joe	1970-01-01 00:00:00	2889387663	2019-11-25 10:23:59.346395	2019-12-04 13:57:03	556	2	0822 8282 0412	jonathan.patrick@cnnindonesia.com	
270	Maria Cicilia Galuh	1970-01-01 00:00:00	2848870649	2019-11-25 10:16:28.734571	2020-01-04 17:53:26	110	3	0856 9506 0290	galuh.pradhita@gmail.com	
275	Herman	1970-01-01 00:00:00	2952463919	2019-11-25 10:19:31.273229	2020-01-04 15:38:26	446	2	0817 0115 087	hermanberitasatu@gmail.com	
329	Ellyvon	1970-01-01 00:00:00	\N	2019-11-25 11:09:36.673036	2019-11-25 11:10:01	54	13	0853 5744 6746	ellyvonpranita@gmail.com	
330	Farren	1970-01-01 00:00:00	\N	2019-11-25 11:10:37.719077	\N	54	13	0812 3193 9559	farrensahertian@gmail.com	
331	M. Wendiyanto Saputro	1970-01-01 00:00:00	\N	2019-11-25 11:11:31.008324	\N	146	1	0811 8989 734	wendiyanto.saputro@kumparan.com	
332	Aria Sankhyaandi	1970-01-01 00:00:00	\N	2019-11-25 11:12:06.412794	\N	146	9	08170789259	aria.sankhyaadi@kumparan.com	
333	Andari Novianti	1970-01-01 00:00:00	\N	2019-11-25 11:12:30.110887	\N	146	9	085779317938	andari.novianti@kumparan.com	
334	Fitria	1970-01-01 00:00:00	\N	2019-11-25 11:12:59.373967	\N	146	3	0812 1208 1241		
335	Elsa	1970-01-01 00:00:00	\N	2019-11-25 11:13:20.245857	\N	146	3	0812 6275 1133	elsa.toruan@gmail.com	
336	Alfaddillah	1970-01-01 00:00:00	\N	2019-11-25 11:13:56.967941	\N	146	13	0812 9185 2265	alfaddillahdillah@gmail.com	
337	Allbi Ferdian	1970-01-01 00:00:00	\N	2019-11-25 11:14:24.143008	\N	146	13	0895 2809 4036	habib.ferdian@kumparan.com	
338	Angga Yuniar	1970-01-01 00:00:00	\N	2019-11-25 11:15:02.211124	\N	167	1	0821 2271 0025	anggayuniar2504@gmail.com	
339	Arthur Gideon	1970-01-01 00:00:00	\N	2019-11-25 11:15:27.16852	\N	167	1	0856 9115 1555	arthur.gideon@kly.id	
340	Pebrianto Eko Wicaksono	1970-01-01 00:00:00	\N	2019-11-25 11:16:02.747884	\N	167	1	0812 9739 3520	pebrianto.wicaksono@kly.id	
341	Tommy	1970-01-01 00:00:00	\N	2019-11-25 11:16:40.93242	\N	167	1	0815 8575 7335	tommy.kurnia@kly.id	
342	Luthfie	1970-01-01 00:00:00	\N	2019-11-25 11:17:11.408906	\N	167	5	0812 8270 9951	luthfie.febrianto@kly.id	
343	Dinny	1970-01-01 00:00:00	\N	2019-11-25 11:17:36.450609	\N	167	3		mutiah.dinny@gmail.com	
344	Nadya	1970-01-01 00:00:00	\N	2019-11-25 11:18:01.75934	\N	167	3	0812 8016 2720	novi.nadya@kly.id	
345	Raden Trimutia Hatta	1970-01-01 00:00:00	\N	2019-11-25 11:18:26.283558	\N	167	1	0812 1004 1181		
346	Happy Ferdian	1970-01-01 00:00:00	\N	2019-11-25 11:18:53.127817	\N	167	1	0812 8709 2016	happy.utomo@kly.id	
347	Dio Prasasti	1970-01-01 00:00:00	\N	2019-11-25 11:19:34.140632	\N	167	7	0813 1967 7803	dio.prasasti@kly.id	
348	Giovani Dio Prasasti	1970-01-01 00:00:00	\N	2019-11-25 11:20:00.195296	\N	167	7	0813 1957 7803	giovanidiopras@gmail.com	
349	Harwanto Bimo	1970-01-01 00:00:00	\N	2019-11-25 11:20:46.977357	\N	383	2	0812 8225 2244	bimo@merdeka.com	
350	Azzura	1970-01-01 00:00:00	\N	2019-11-25 11:21:09.776583	\N	383	2	0877 7762 2865	azzura@merdeka.com	
351	Herly	1970-01-01 00:00:00	\N	2019-11-25 11:23:40.450886	\N	316	2	0811 992 9592	herly.hardiyanto@medcom.id	
352	M. Dimas Prasetianing	1970-01-01 00:00:00	\N	2019-11-25 11:24:06.204283	\N	316	2	0838 7131 1444	dimasprasetianing@gmail.com	
353	Yatin Suleha	1970-01-01 00:00:00	\N	2019-11-25 11:24:34.299135	\N	316	2	0812 1969 1830	yatinsuleha@gmail.com	
354	Suci Sedya Utami	1970-01-01 00:00:00	\N	2019-11-25 11:25:52.823682	\N	316	1	0812 9036 6808	ssedyautami@gmail.com	
355	Desi Angriani	1970-01-01 00:00:00	\N	2019-11-25 11:26:20.521198	\N	316	1	0852 6351 9867	desiangriani90@gmail.com	
356	Ade Hapsari	1970-01-01 00:00:00	\N	2019-11-25 11:26:47.366537	\N	316	1	0812 9575 8383	ekonomi.metrotvnews@gmail.com	
357	Ayu	1970-01-01 00:00:00	\N	2019-11-25 11:27:08.246882	\N	316	3	0811 1010 186	annisaayuartanti@gmail.com	
358	Prima	1970-01-01 00:00:00	\N	2019-11-25 11:27:49.034328	\N	518	1	0857 2418 3451	fauzi.prima@gmail.com	
359	Sismailla	1970-01-01 00:00:00	\N	2019-11-25 11:28:16.194987	\N	518	1	0811 903 8000	sismailla.sari@mncgroup.com	
360	Dewi Kania	1970-01-01 00:00:00	\N	2019-11-25 11:28:46.165363	\N	518	1	0812 8460 1104	dewikkania@gmail.com	
361	Tiara Putri	1970-01-01 00:00:00	\N	2019-11-25 11:29:19.176583	\N	518	12	0812 9481 1740	adelinetiara@hotmail.com	
362	Kiky	1970-01-01 00:00:00	\N	2019-11-25 11:29:44.432164	\N	518	3	0857 7043 3165	pradytaananda71@gmail.com	
363	Fian Firatmaja	1970-01-01 00:00:00	\N	2019-11-25 11:30:46.726535	\N	569	2	0813 1515 8496	fian@rol.republika.co.id	
364	Farah Noersativa	1970-01-01 00:00:00	\N	2019-11-25 11:31:15.344917	\N	569	2	0822 2145 7878	farahnoersativa@gmail.com	
365	Umi	1970-01-01 00:00:00	\N	2019-11-25 11:31:39.637116	\N	569	2	0897 584 1535	umi@rol.republika.co.id	
366	Heri	1970-01-01 00:00:00	\N	2019-11-25 11:35:26.522783	\N	415	2	0878 8757 0204	heri.firm@gmail.com	
367	Tian	1970-01-01 00:00:00	\N	2019-11-25 11:36:04.240698	\N	415	2	0813 4831 0320	simanungkalitc@gmail.com	
368	Adryanto	1970-01-01 00:00:00	\N	2019-11-25 11:37:18.404677	\N	35	1	0877 7762 8399	andryand76@gmail.com	
369	Tikno	1970-01-01 00:00:00	\N	2019-11-25 11:37:43.905226	\N	35	2	081806703763	sutiknoab03@gmail.com	
370	Wahyu BS	1970-01-01 00:00:00	\N	2019-11-25 11:38:07.40487	\N	35	2	0877 8097 0088	wwwahyu_bs@yahoo.com	
372	Lintang	1970-01-01 00:00:00	\N	2019-11-25 11:40:07.104527	\N	182	2	0811 9844 545	lintangsiltyautami@gmail.com	
374	Rinaldi Aban	1970-01-01 00:00:00	\N	2019-11-25 11:40:55.694162	\N	182	2	0813 1722 3495	rinaldiaban@yahoo.com	
375	Insan Akbar K.	1970-01-01 00:00:00	\N	2019-11-25 11:41:19.93541	\N	182	1	0817 9116 642	insan@suara.com	
376	Imron Fajar	1970-01-01 00:00:00	\N	2019-11-25 11:42:29.163343	\N	182	1	0822 9779 4330	imron.fajar12@gmail.com	
377	Risna	1970-01-01 00:00:00	\N	2019-11-25 11:44:35.181588	\N	182	3	0815 9550 506	risnahalidi@gmail.com	
378	Ririn	1970-01-01 00:00:00	\N	2019-11-25 11:44:55.702537	\N	182	3	0811 109 313		
379	M. Reza	1970-01-01 00:00:00	\N	2019-11-25 11:45:19.970756	\N	182	7	0812 8445 7130	mreza.sulaiman@gmail.com	
380	Job Palar	1970-01-01 00:00:00	\N	2019-11-25 11:46:01.869228	\N	6	1	0816 1475 647	jobpalar@gmail.com	
382	Caecilia Eersta	1970-01-01 00:00:00	\N	2019-11-25 11:47:02.309741	\N	457	1	0813 1782 8785	eerstacaecilia@gmail.com	
383	Rini Kustiani	1970-01-01 00:00:00	\N	2019-11-25 11:47:30.806297	\N	457	3	0815 9019 868	murida@gmail.com	
384	Uteng Iskandar	1970-01-01 00:00:00	\N	2019-11-25 11:48:04.571089	\N	497	2	0815 608 8971	uteng@tirto.id	
385	Ivan	1970-01-01 00:00:00	\N	2019-11-25 11:48:27.403572	\N	497	2	0816 4608 1947	ivan@tirto.id	
386	Ahmad	1970-01-01 00:00:00	\N	2019-11-25 11:48:50.792445	\N	497	2	0859 5648 0043	ahmad@tirto.id	
387	Dea	1970-01-01 00:00:00	\N	2019-11-25 11:49:11.597234	\N	497	2	0878 7878 1867	deakadiza@gmail.com	
388	Fadil	1970-01-01 00:00:00	\N	2019-11-25 11:50:25.199986	\N	532	2	0812 8575 2096	fadil.drl@gmail.com	
389	Puji	1970-01-01 00:00:00	\N	2019-11-25 11:51:05.692898	\N	565	2	0812 3245 8471	puji@urbanasia.media	
390	Ardha Franstiya	1970-01-01 00:00:00	\N	2019-11-25 11:51:33.218132	\N	565	2	0857 1829 2304	ardha@urbanasia.media	
391	Laras	1970-01-01 00:00:00	\N	2019-11-25 11:51:56.621399	\N	565	2	0822 9956 0831	griskalaras@urbanasia.com	
393	Ranny	1970-01-01 00:00:00	\N	2019-11-25 14:20:05.048464	\N	572	2	0857 8091 1283	ranny.utami@metranet.co.id	
394	Ajeng	1970-01-01 00:00:00	\N	2019-11-25 14:20:26.490942	\N	572	3	0812 9041 4669	birgittaajeng@gmail.com	
395	Al Amin	1970-01-01 00:00:00	\N	2019-11-25 14:20:59.400754	\N	575	2	0852 8427 7564		
381	Moh Khory Alfarizi	1970-01-01 00:00:00	1673823457	2019-11-25 11:46:37.867549	2019-12-04 13:15:15	457	2	0853 2411 6666	mohkhorya@gmail.com	
373	Tivan	1970-01-01 00:00:00	1042484249	2019-11-25 11:40:27.632163	2020-01-04 15:24:57	182	2	0896 6091 1146	vivavan09@gmail.com	
396	Arrijal	1970-01-01 00:00:00	\N	2019-11-25 14:21:33.117967	\N	575	11	085213369641	arrijalrachman@gmail.com	
398	Kintani Tunjung Sar	1970-01-01 00:00:00	\N	2019-11-25 14:23:01.142585	\N	575	2	0856 7246 054	kintani.tunjung@viva.co.id	
399	Lazuardhi	1970-01-01 00:00:00	\N	2019-11-25 14:23:25.707372	\N	575	2	0812 9666 1479	ardhi_lazuardhi@yahoo.com	
400	Fikri Halim	1970-01-01 00:00:00	\N	2019-11-25 14:23:48.139751	\N	575	2	0823 1097 8554	fikri.halim@viva.co.id	
401	Rintan	1970-01-01 00:00:00	\N	2019-11-25 14:24:09.199196	\N	575	3	0815 8164 668	puspitasari.rintan@gmail.com	
402	Bimo	1970-01-01 00:00:00	\N	2019-11-25 14:24:30.912522	\N	575	7	0896 5763 7165	bimofundrika@gmail.com	
403	Uthe	1970-01-01 00:00:00	\N	2019-11-25 14:24:55.648802	\N	575	1	0856 1961 312		
406	Dhiany	1970-01-01 00:00:00	\N	2019-11-25 14:27:00.637324	\N	478	6	0812 2065 9359	ms.dhiany@gmail.com	
407	Sholahuddin Al-Ayyubi	1970-01-01 00:00:00	\N	2019-11-25 14:27:35.275214	\N	478	1	0821 2424 0020	yubie.spi@gmail.com	
408	Dwi Prasetya	1970-01-01 00:00:00	\N	2019-11-25 14:28:01.994689	\N	478	1	0856 4730 6445	dwi.prasetya@bisnis.com	
410	Rahman	1970-01-01 00:00:00	\N	2019-11-25 14:28:48.483274	\N	478	1	0823 9364 5164	rahmansese2008@gmail.com	
411	Yayus	1970-01-01 00:00:00	\N	2019-11-25 14:29:11.898155	\N	478	1	0818 125 920	yay_86@yahoo.com	
412	Jody	1970-01-01 00:00:00	\N	2019-11-25 14:29:35.890855	\N	478	1	0821 7168 6699	felixjody@gmail.com	
413	Wibi Pangestu Pratama	1970-01-01 00:00:00	\N	2019-11-25 14:30:03.099544	\N	478	1	08122255357	wibipp@gmail.com	
414	Tika	1970-01-01 00:00:00	\N	2019-11-25 14:30:31.157308	\N	478	1	0895 3968 409 35	tikachu16@gmail.com	
415	Arief Hermawan	1970-01-01 00:00:00	\N	2019-11-25 14:31:00.022517	\N	478	1	0812 1226 6092	ariefhermawan.p@gmail.com	
416	Himawan	1970-01-01 00:00:00	\N	2019-11-25 14:31:41.00767	\N	478	1	0857 4711 6101	nugrahahimawan@gmail.com	
417	Deandra Syarizka	1970-01-01 00:00:00	\N	2019-11-25 14:33:08.800279	\N	478	2	085695437388	deandra.syarizka@bisnis.com	
418	Fauzan	1970-01-01 00:00:00	\N	2019-11-25 14:33:32.200511	\N	478	2	081310481883	myownoase@gmail.com	
419	Syaiful	1970-01-01 00:00:00	\N	2019-11-25 14:34:01.598237	\N	478	2	0822 4960 3437	millahsyaiful@gmail.com	
420	Leo Dwi Jatmiko	1970-01-01 00:00:00	\N	2019-11-25 14:34:51.913652	\N	478	2	081295754205	leodwijatmiko@gmail.com	
421	Pandu	1970-01-01 00:00:00	\N	2019-11-25 14:35:19.839901	\N	478	6	0896 8105 3544	pandugumilar90@gmail.com	
422	Ayu	1970-01-01 00:00:00	\N	2019-11-25 14:35:54.832172	\N	478	6	0822 7709 7892	ayunurcaya@gmail.com	
423	Gloria Fransisca K. Lawi	1970-01-01 00:00:00	\N	2019-11-25 14:36:24.420594	\N	478	3	0812 1985 3057	gloria.fransisca@bisnis.com	
424	Etha	1970-01-01 00:00:00	\N	2019-11-25 14:36:51.629216	\N	478	3	0812 6336 9249	ethabisnisindonesia@gmail.com	
425	David Eka	1970-01-01 00:00:00	\N	2019-11-25 14:37:26.146543	\N	478	10	0812 7593 0353	davidekaissetiabudi@gmail.com	
426	Bambang Supriyanto	1970-01-01 00:00:00	\N	2019-11-25 14:40:36.316025	\N	482	1	0818 929 359	bambang.supriyanto@bisnis.com	
427	Dewi	1970-01-01 00:00:00	\N	2019-11-25 14:40:58.005143	\N	482	1	0818 0823 0835	and.riani20@gmail.com	
428	Fathi Nur	1970-01-01 00:00:00	\N	2019-11-25 14:41:23.669642	\N	478	1	081317507753	fathi.bisnis@gmail.com	
429	Gde Rahadhi	1970-01-01 00:00:00	\N	2019-11-25 14:42:03.936914	\N	484	1	0817 636 06 54	gde_bali2001@yahoo.com	
430	Moch Ade M	1970-01-01 00:00:00	\N	2019-11-25 14:42:47.20063	\N	475	1	0817 141 713	mochamad_ademaulidin@yahoo.com	
431	Yessar Rosendar	1970-01-01 00:00:00	\N	2019-11-25 14:47:30.388289	\N	156	1	0857 8008 5838	yessar@forbesindonesia.com	
432	Alvin	1970-01-01 00:00:00	\N	2019-11-25 14:48:01.424291	\N	150	1	0813 8065 7234	alvin.majalahfranchise2015@gmail.com	
433	Moses	1970-01-01 00:00:00	\N	2019-11-25 14:48:28.913505	\N	150	1	0812 9755 2106	msefitzpatrick1@gmail.com	
434	Emanuel	1970-01-01 00:00:00	\N	2019-11-25 14:49:37.113428	\N	186	1	0812 8859 3477	eman_kure@yahoo.com	
435	Muslim	1970-01-01 00:00:00	\N	2019-11-25 14:49:58.382548	\N	186	1	0817 740 743	abdul_muslim@investor.co.id	
437	Nida	1970-01-01 00:00:00	\N	2019-11-25 14:50:57.403094	\N	186	1	0813 8147 4409	niidassahara@gmail.com	
438	Ayu	1970-01-01 00:00:00	\N	2019-11-25 14:51:17.230767	\N	186	1	081315033768	retno.ayu88@gmail.com	
439	Mardiana Maknun	1970-01-01 00:00:00	\N	2019-11-25 14:51:45.388962	\N	186	3	0813 8145 2844	nana_makmun@yahoo.com	
440	Arnold	1970-01-01 00:00:00	\N	2019-11-25 14:52:06.959223	\N	364	1	0856 2639 737	siraitarnold@gmail.com	
441	Desy Setyowati	1970-01-01 00:00:00	\N	2019-11-25 14:53:03.394164	\N	370	1		desysetyowati.desh@gmail.com	
442	Reily	1970-01-01 00:00:00	\N	2019-11-25 14:53:25.118698	\N	370	1	0812 2014 6631	mreilyp@gmail.com	
443	Febrina Ratna Iskana	1970-01-01 00:00:00	\N	2019-11-25 14:53:50.099853	\N	370	1	0878 7854 775	ratnaiskana20@gmail.com	
444	Verda Nano Setiawan	1970-01-01 00:00:00	\N	2019-11-25 14:54:09.443151	\N	370	1	0822 2824 8167	verdanano99@gmail.com	
445	Fariha Sulmaihati	1970-01-01 00:00:00	\N	2019-11-25 14:54:40.164562	\N	370	6	081333821856	farah@katadata.co.id	
446	Cindy	1970-01-01 00:00:00	\N	2019-11-25 14:55:01.04562	\N	370	2	0852 1164 8296	cindy@katadata.co.id	
447	Klaudia	1970-01-01 00:00:00	\N	2019-11-25 14:57:20.687178	\N	65	1	0857 4045 9201	klaudirani@gmail.com	
448	Galva	1970-01-01 00:00:00	\N	2019-11-25 14:57:39.427028	\N	65	1	0857 3670 0128	galvan.yudistira@gmail.com	
449	Denisa	1970-01-01 00:00:00	\N	2019-11-25 14:57:56.214587	\N	65	1	0812 8586 9461	denisaeka13@gmail.com	
450	Febrina Iskana	1970-01-01 00:00:00	\N	2019-11-25 14:58:17.124688	\N	65	1	0878 7585 4775	ratnaiskana20@gmail.com	
451	Ridwan Mulyana	1970-01-01 00:00:00	\N	2019-11-25 14:58:39.018491	\N	65	1	087723757596	nanda_mulyana55@yahoo.com	
452	Cheppy M	1970-01-01 00:00:00	\N	2019-11-25 14:59:00.67205	\N	65	1		cheppym@yahoo.co	
454	Ika	1970-01-01 00:00:00	\N	2019-11-25 14:59:42.896888	\N	65	1	0856-4253-7759		
455	Filemon Agung	1970-01-01 00:00:00	\N	2019-11-25 15:00:07.089541	\N	65	6	0823 1232 0329	hadiward10@gmail.com	
456	Kenia	1970-01-01 00:00:00	\N	2019-11-25 15:00:30.38876	\N	65	3	0823 2963 2330	nareriska@gmail.com	
457	Dody Lukdi	1970-01-01 00:00:00	\N	2019-11-25 15:00:52.856748	\N	206	1	0812 8863 632	ceoindonesia76@gmail.com	
458	Eko Adiwaluyo	1970-01-01 00:00:00	\N	2019-11-25 15:01:26.610707	\N	253	1	0818 4615 26	eko.adiwaluyo@markplusinc.com	
459	Jaka	1970-01-01 00:00:00	\N	2019-11-25 15:02:01.303605	\N	253	1	0818 201 958	jaka.perdana@markplusinc.com	
460	Clara	1970-01-01 00:00:00	\N	2019-11-25 15:02:21.517489	\N	253	1	0897 8611 391	claraseob@gmail.com	
461	Estu	1970-01-01 00:00:00	\N	2019-11-25 15:03:04.372559	\N	253	1	0812 9125 1384	estu.maranti@gmail.com	
462	Hendra Soeprajitno	1970-01-01 00:00:00	\N	2019-11-25 15:03:35.142577	\N	253	1	0816 197 3687	hendra.soeprajitno@markplusinc.com	
404	Robiawan	1970-01-01 00:00:00	2918549999	2019-11-25 14:25:47.713581	2019-11-27 11:05:14	584	2	0819 0801 2000	robiawan@gmail.com	
409	Nurul Hidayat	1970-01-01 00:00:00	0951200303	2019-11-25 14:28:27.898992	2019-12-04 14:16:05	478	1	0856 9700 9763	nurul.hidayat@bisnis.co.id	
397	Misrohatun Hasanah	1970-01-01 00:00:00	2990356228	2019-11-25 14:22:29.84169	2019-12-12 12:01:09	575	2	0896 4444 8761	misrohatun@gmail.com	
405	Demis Rizky Gosta	1970-01-01 00:00:00	\N	2019-11-25 14:26:33.759929	2019-12-26 09:28:46	478	2	0878 8910 0898	demis.rizky@bisnis.com	
463	Ramadhan Triwijanarko	1970-01-01 00:00:00	\N	2019-11-25 15:04:05.344595	\N	253	1	0856 4150 7756	ramadhan.triwijanarko@markplusinc.com	
464	Hafiz	1970-01-01 00:00:00	\N	2019-11-25 15:06:09.793592	\N	253	1	0857 1567 9555	pal.hafiz@gmail.com	
465	Nadia	1970-01-01 00:00:00	\N	2019-11-25 15:06:29.170258	\N	253	1	0813 2464 6968	nadiaindrisy@gmail.com	
466	Abel	1970-01-01 00:00:00	\N	2019-11-25 15:06:51.646589	\N	253	1	082298422712	abelsyanas@yahoo.co.id	
467	Sigit	1970-01-01 00:00:00	\N	2019-11-25 15:07:13.128604	\N	253	1	0812 9020 9616	musafirmuda@gmail.com	
468	Tony	1970-01-01 00:00:00	\N	2019-11-25 15:07:34.621486	\N	281	1	0812 9747 4106	tonyburhan72@gmail.com	
469	Cecep Supriadi	1970-01-01 00:00:00	\N	2019-11-25 15:08:05.721297	\N	281	1	0857 1510 0150	checsu@yahoo.com	
470	Hanindio	1970-01-01 00:00:00	\N	2019-11-25 15:08:31.703975	\N	281	1	0899 168 468	hanindio90@gmail.com	
471	Moh. Agus Mahribi	1970-01-01 00:00:00	\N	2019-11-25 15:08:58.433733	\N	281	1	0812 8848 7951	abie@majalahmarketing.com	
472	Fisamawati	1970-01-01 00:00:00	\N	2019-11-25 15:17:17.985343	\N	281	1	0818 0603 9777	fisamawati4@gmail.com	
474	Dwi Wulandari	1970-01-01 00:00:00	\N	2019-11-25 15:18:37.622762	\N	440	1	0817 188 938	dwi.wulandari@gmail.com	
475	Ihsan Sulaiman	1970-01-01 00:00:00	\N	2019-11-25 15:19:03.620957	\N	440	1	0812 940 4869	ihsan.sulaiman@swamail.com	
476	Bani	1970-01-01 00:00:00	\N	2019-11-25 15:19:35.977277	\N	492	1	0858 8096 6872	nabhani_yongkru@yahoo.co.id	
477	Widi	1970-01-01 00:00:00	\N	2019-11-25 15:19:52.323381	\N	492	1	0815 1123 7318		
479	Jeihan Kahfi	1970-01-01 00:00:00	\N	2019-11-25 15:20:45.383047	\N	324	1	0877 8543 3234	jeihan.kahfi@swamail.com	
480	Nerissa Arviana	1970-01-01 00:00:00	\N	2019-11-25 15:21:06.942723	\N	324	1	0857 8025 3456	nerissa.arviana@swamail.com	
481	Anastasia	1970-01-01 00:00:00	\N	2019-11-25 15:21:44.9877	\N	324	1	0895 3744 63757	anastasia.anggoro@swamail.com	
482	Herning	1970-01-01 00:00:00	\N	2019-11-25 15:22:01.90066	\N	324	1	0812 9491 631	herningb@gmail.com	
483	Nisrina Salma	2019-11-25 00:00:00	\N	2019-11-25 15:22:32.069648	\N	324	1	0895 3356 22514	nisrina.salma@swamail.com	
484	Hana	1970-01-01 00:00:00	\N	2019-11-25 15:23:10.897332	\N	324	1	0857 2863 6907	andi.hana@swamail.com	
485	Niken	1970-01-01 00:00:00	\N	2019-11-25 15:23:29.854097	\N	324	1		sri.niken@swamail.com	
486	Boyke P. Siregar	1970-01-01 00:00:00	\N	2019-11-25 15:24:02.791595	\N	579	1	0813 2121 2857	boyke.siregar@yahoo.com	
487	Sufri	1970-01-01 00:00:00	\N	2019-11-25 15:24:44.107588	\N	579	1	0812 9950 945	suf_ri@yahoo.com	
488	Abdul Farid	1970-01-01 00:00:00	\N	2019-11-26 14:43:54.524477	\N	160	1	0856 1563 403	f.abdulfarid@gmail.com	
489	Dani Okta	1970-01-01 00:00:00	\N	2019-11-26 14:44:33.210361	\N	246	1	0815 1984 6009	daniokta@gatra.com	
490	Qonita Azzahra	1970-01-01 00:00:00	\N	2019-11-26 14:45:02.842011	\N	246	1	0897 5946 020	qonitaazzahra88@gmail.com	
491	Sumarno	1970-01-01 00:00:00	\N	2019-11-26 14:45:34.52643	\N	439	1	0815 8608 0678	marno1singgalang@gmail.com	
492	Ari	1970-01-01 00:00:00	\N	2019-11-26 14:46:04.9229	\N	107	1	0812 1059 1059	safar.indopos@gmail.com	
493	Adrianto	1970-01-01 00:00:00	\N	2019-11-26 14:46:29.806272	\N	107	1	0813 1956 8181	adri@indopos.co.id	
494	Cholis	1970-01-01 00:00:00	\N	2019-11-26 14:46:55.716386	\N	107	1	0856 733 7351	cholisfaizisobari@gmail.com	
495	Nurman Amrizal	1970-01-01 00:00:00	\N	2019-11-26 14:47:24.383433	\N	107	1	0821 3931 5014	nurmanamrizal@gmail.com	
496	Nindy	1970-01-01 00:00:00	\N	2019-11-26 14:47:45.643726	\N	107	1	0813 1610 8547	nindy.indopos@gmail.com	
497	Dewi	1970-01-01 00:00:00	\N	2019-11-26 14:48:07.828123	\N	107	3	0877 8501 3137	dw_mar@yahoo.co.id	
498	Andhika	1970-01-01 00:00:00	\N	2019-11-26 14:48:41.852934	\N	255	1	0817 865 100	andhika_listya@yahoo.com	
499	Vera	1970-01-01 00:00:00	\N	2019-11-26 14:49:07.932672	\N	255	1	0896 0561 4826	vezajawapos@gmail.com	
500	Gita	1970-01-01 00:00:00	\N	2019-11-26 14:49:30.480728	\N	255	1	08577 8133 387	gitansari@gmail.com	
501	Rizky Agrasyah Putra	1970-01-01 00:00:00	\N	2019-11-26 14:49:54.883974	\N	255	1	0812 9399 9001	rizky@jawapost.co.id	
502	Anisa	1970-01-01 00:00:00	\N	2019-11-26 14:50:17.02005	\N	257	1	0856 2973 040	anissatulumah@gmail.com	
503	Rieska	1970-01-01 00:00:00	\N	2019-11-26 14:51:21.319424	\N	255	3	0812 8386 9772	marieska@jawapos.com	
504	Ridwan Nanda M	1970-01-01 00:00:00	\N	2019-11-26 14:51:48.190781	\N	260	1	0877 2375 7596	nanda_mulyana55@yahoo.co.id	
505	Yusuf Aldian	1970-01-01 00:00:00	\N	2019-11-26 14:52:17.475769	\N	260	1	0819 3410 8440	yusufaldian31@gmail.com	
506	Gesit Ariyanto	1970-01-01 00:00:00	\N	2019-11-26 14:53:12.2558	\N	38	1	0812 1244 7640	gesit_kompas@yahoo.com	
507	Pamela Citra Oktoria	1970-01-01 00:00:00	\N	2019-11-26 14:53:58.745166	\N	38	1	0818 0746 6791	pamela.oktoria@kompas.com	
508	Wawan H Prabowo	1970-01-01 00:00:00	\N	2019-11-26 14:55:09.601012	\N	38	1		wak@kompas.co.id	
509	Ayu	1970-01-01 00:00:00	\N	2019-11-26 14:55:57.159568	\N	38	1	0813 1787 0414	ayu.pratiwi@kompas.com	
510	Ino	1970-01-01 00:00:00	\N	2019-11-26 14:56:15.564341	\N	38	1	0856 1640 037	ino.julianto@kompas.com	
511	Aris	1970-01-01 00:00:00	\N	2019-11-26 14:56:35.033331	\N	38	1	0811 900 1311	aris.prasetyo@kompas.id	
512	Sita	1970-01-01 00:00:00	\N	2019-11-26 14:56:54.545994	\N	38	1	0812 9463 1326	sita.nurazmi@kompas.com	
513	Sucipto	1970-01-01 00:00:00	\N	2019-11-26 14:57:16.588759	\N	38	1	0857 1623 3502	cipto@kompas.com	
514	Prayogi	1970-01-01 00:00:00	\N	2019-11-26 14:57:40.491067	\N	38	1	0852 1044 0033	prayogi.sulistyo@kompas.com	
515	Reno	1970-01-01 00:00:00	\N	2019-11-26 14:58:00.089802	\N	38	1	0812 9463 1370	lorenzo.anugrah@kompas.com	
516	Fajar Ramadhan	1970-01-01 00:00:00	\N	2019-11-26 14:58:23.371307	\N	38	1	0858 1770 3148	fajar.ramadhan@kompas.com	
517	Arya Dwiangga	1970-01-01 00:00:00	\N	2019-11-26 14:58:52.419852	\N	38	1	081299216542	aryomdn@gmail.com	
519	Elsa	1970-01-01 00:00:00	\N	2019-11-26 14:59:38.588873	\N	38	2	0852 9384 9761	elsaleba@gmail.com	
520	Didit	1970-01-01 00:00:00	\N	2019-11-26 15:00:00.373204	\N	38	2	0811 871 432	didit.putra@kompas.com	
521	Raditya	1970-01-01 00:00:00	\N	2019-11-26 15:00:43.102893	\N	38	1	081553718903	rabumi@gmail.com	
523	Imam Kurniadi	1970-01-01 00:00:00	\N	2019-11-26 15:01:41.449408	\N	79	1	0812 1306 0687	iman.toko@hotmail.com	
524	M Fachri	1970-01-01 00:00:00	\N	2019-11-26 15:02:09.034192	\N	79	1	0812 926 9924	dzaira1803@yahoo.com	
525	Gemma	1970-01-01 00:00:00	\N	2019-11-26 15:02:29.618645	\N	79	1	0896 5366 2154	gepurbaya@gmail.com	
526	Dini	1970-01-01 00:00:00	\N	2019-11-26 15:03:09.633473	\N	79	6	0812 2729 950	dinidaniswari@gmail.com 	
527	Puri	1970-01-01 00:00:00	\N	2019-11-26 15:03:35.495261	\N	79	1	0812-8084-1000	purianna7285@gmail.com'	
528	Iman	1970-01-01 00:00:00	\N	2019-11-26 15:04:35.778499	\N	101	1	0878 7857 1550	imanfirmansyah1989@gmail.com	
529	Dyah Ayu Pamela	1970-01-01 00:00:00	\N	2019-11-26 15:06:44.466142	\N	101	3	0878 8882 0523	dyahpamela@gmail.com	
530	Firman Atmakusuma	1970-01-01 00:00:00	\N	2019-11-26 15:07:21.293926	\N	117	1	0899 9962 926	firmana@tempo.co.id	
518	Judith	1970-01-01 00:00:00	3967525999	2019-11-26 14:59:18.301995	2019-12-05 10:56:23	38	2	0819 0434 4000	mpjudithj@hotmail.com	
522	Haryo Brono	1970-01-01 00:00:00	3932044943	2019-11-26 15:01:15.620184	2019-12-20 14:04:28	79	1	0812 180 3568	haryobrono@hotmail.com	
533	Praga Utama	1970-01-01 00:00:00	\N	2019-11-26 15:08:34.928261	\N	117	1	0856 2422 9376	praga.utama@gmail.com	
534	Abi	1970-01-01 00:00:00	\N	2019-11-26 15:08:55.986622	\N	117	1	0813 1709 4948	m.abimulya@gmail.com	
535	M. Kurniawan	1970-01-01 00:00:00	\N	2019-11-26 15:10:09.910225	\N	332	1	0813 9666 9404	mkurniawan06@gmail.com	
536	Irene Harty	1970-01-01 00:00:00	\N	2019-11-26 15:10:37.918503	\N	332	1	0815 1007 8096	irene@mediaindonesia.com	
537	Gino Franki Hadi	1970-01-01 00:00:00	\N	2019-11-26 15:11:05.278864	\N	332	1	0821115567279	ginofranki@gmail.com	
538	Andhika	1970-01-01 00:00:00	\N	2019-11-26 15:11:26.891959	\N	332	1	0857 1802 9134	andhika9prasetyo@gmail.com	
539	Eni	1970-01-01 00:00:00	\N	2019-11-26 15:11:46.56654	\N	332	3	0857 1080 2012	eni@mediaindonesia.com	
540	Indri Yani	1970-01-01 00:00:00	\N	2019-11-26 15:12:19.191626	\N	332	7	0878 8337 4839	indriyani.26691@gmail.com	
542	Merry	1970-01-01 00:00:00	\N	2019-11-26 15:13:06.124055	\N	122	1	0857 7706 2450	merrymrs.neimo@yaho.com	
543	Mohamad Qori Haliana	1970-01-01 00:00:00	\N	2019-11-26 15:13:30.876002	\N	122	1	0815 1401 7165	mohamadqori@gmail.com	
544	Ali	1970-01-01 00:00:00	\N	2019-11-26 15:13:48.895602	\N	122	1	0856 177 6450	baalwi.ali@gmail.com	
545	Vidita	1970-01-01 00:00:00	\N	2019-11-26 15:14:38.755518	\N	353	2	0818 757 751	viditaloveschelsea@gmail.com	
546	Nora	1970-01-01 00:00:00	\N	2019-11-26 15:15:03.397309	\N	353	2	0812 1269 6974	itsnora@yahoo.com	
547	Gumanti	1970-01-01 00:00:00	\N	2019-11-26 15:15:25.68921	\N	353	2	0896 9621 0646	awaliyahgumanti@gmail.com	
548	Eric Iskandarsjah Z	1970-01-01 00:00:00	\N	2019-11-26 15:15:47.285031	\N	353	1	0821 3332 9733	ericiskandarmail@gmail.com	
549	Budi Raharjo	1970-01-01 00:00:00	\N	2019-11-26 15:16:10.624266	\N	353	1	0816 1393 047	raharjobudi@yahoo.com;	
550	Yogi Ardhi	1970-01-01 00:00:00	\N	2019-11-26 15:16:43.962124	\N	353	1	0812 8877 9168	yogiardhi@gmail.com	
551	Unggul Wirawan	1970-01-01 00:00:00	\N	2019-11-26 15:17:19.597152	\N	175	1	0812 800 9983	unggul@suarapembaruan.com	
553	Lilis	1970-01-01 00:00:00	\N	2019-11-26 15:19:24.424886	\N	581	3	0812 996 3407	lis_setya@yahoo.com	
554	Vinni	1970-01-01 00:00:00	\N	2019-11-26 15:19:41.937217	\N	581	3	0812 9022 0725	vinnyamelia@gmail.com	
556	Yudha Putera	1970-01-01 00:00:00	\N	2019-11-26 15:20:31.003115	\N	443	2	0815 1611 810	yudha.putera@mncgroup.com	
557	Natasya Febrita	1970-01-01 00:00:00	\N	2019-11-26 15:20:58.224708	\N	443	2	0813 1911 0623	natasya.febrita@mncgroup.com	
558	Rifki Rifaldi	1970-01-01 00:00:00	\N	2019-11-26 15:21:21.400468	\N	443	2	0877 8153 9234	jasengrifki27@gmail.com	
559	Didiet	1970-01-01 00:00:00	\N	2019-11-26 15:21:51.304432	\N	443	2	0821 1008 3338	didietdimasaditya78@gmail.com	
560	Syifa	1970-01-01 00:00:00	\N	2019-11-26 15:29:39.164878	\N	524	3	0822 9980 7547	syifa@brilio.net	
561	Rini	1970-01-01 00:00:00	\N	2019-11-26 15:30:11.487738	\N	533	3	0815 9019 868	murida@gmail.com	
562	Sandy	1970-01-01 00:00:00	\N	2019-11-26 15:32:04.467404	\N	60	3	0821 2407 5088	sandy.adam@kly.id	
563	Dina N	1970-01-01 00:00:00	\N	2019-11-26 15:32:31.269614	\N	60	3	0852 1395 8532	dinanzhfh@gmail.com	
564	Ratih Permatasari	1970-01-01 00:00:00	\N	2019-11-26 15:32:54.038993	\N	60	3	0878 8049 3151	ratih.permatasari78@yahoo.com	
565	Mutiara	1970-01-01 00:00:00	\N	2019-11-26 15:33:42.211319	\N	60	3	0813 8183 0311	mutiarashar@gmail.com	
566	Vika	1970-01-01 00:00:00	\N	2019-11-26 15:34:01.486752	\N	60	3	0896 5612 0018	vikanoviantiumar@gmail.com	
567	Anya	1970-01-01 00:00:00	\N	2019-11-26 15:34:22.334077	\N	60	3	0818 0752 2142	rramadhanty08@gmail.com	
568	Alfi	1970-01-01 00:00:00	\N	2019-11-26 15:35:23.026462	\N	60	3	0878 8282 8970	alfisalima.putri@gmail.com	
571	Andi Mardana	1970-01-01 00:00:00	\N	2019-11-26 15:44:31.712718	\N	315	3	0852 4778 3730	andimardana@gmail.com	
573	Bagus Haryo	1970-01-01 00:00:00	\N	2019-11-26 15:45:17.161929	\N	356	3	0899 3921 342	bagus@kapanlagi.com	
574	Agus Siswanto	1970-01-01 00:00:00	\N	2019-11-26 15:45:42.363984	\N	289	3	0815 1689 761	agus.arkamedia@gmail.com	
575	Niken Ari	1970-01-01 00:00:00	\N	2019-11-26 15:46:04.825779	\N	155	3	0838 9790 1830	niken.ari@idntimes.com	
576	Rara Peni Asih	1970-01-01 00:00:00	\N	2019-11-26 15:46:28.153454	\N	155	3	0812 9586 5439	rara.asih@idntimes.com	
577	Grace Kelly	1970-01-01 00:00:00	\N	2019-11-26 15:46:48.728418	\N	155	3	0813 9911 6961	grace@idntimes.com	
578	Vidya	1970-01-01 00:00:00	\N	2019-11-26 15:47:09.250565	\N	155	3	0856 9464 7565	vidya.tarigan@idntimes.com	
579	Andriza Hamzah	1970-01-01 00:00:00	\N	2019-11-26 15:47:31.963728	\N	108	3	0815 1137 7191	hamzahija@yahoo.com	
580	Anjar Saputra	1970-01-01 00:00:00	\N	2019-11-26 15:48:00.218064	\N	305	7	0859 2070 0574	saputra.anjar4@gmail.com	
581	Anton	1970-01-01 00:00:00	\N	2019-11-26 15:48:23.080909	\N	305	7	0812 9825 1121	antoniusalexander8@gmail.com	
582	Denis	1970-01-01 00:00:00	\N	2019-11-26 15:48:42.392757	\N	254	3	0857 7788 5771	dennisaden@ymail.com	
583	Wita	1970-01-01 00:00:00	\N	2019-11-26 15:49:02.324661	\N	254	3	0878 8908 1595	witanurfitri613@gmail.com	
584	Adhitya Pratama	1970-01-01 00:00:00	\N	2019-11-26 15:49:44.15056	\N	310	3	0821 2203 5262	pepeaditya@gmail.com	
585	Annisa	1970-01-01 00:00:00	\N	2019-11-26 15:50:00.846363	\N	331	3	0819 692 152	annisa.karnesyia@haibunda.com	
586	Bambang P	1970-01-01 00:00:00	\N	2019-11-26 15:50:21.179796	\N	73	3	085218504131	home.diary1@gmail.com	
587	Yudis	1970-01-01 00:00:00	\N	2019-11-26 15:50:40.879321	\N	77	3	0811 927 733	yudiasis@yahoo.com	
588	Erly	1970-01-01 00:00:00	\N	2019-11-26 15:51:15.053899	\N	86	3	0817 104 555	erly_wid@yahoo.com	
589	Maulina	1970-01-01 00:00:00	\N	2019-11-26 15:51:36.18251	\N	86	3	0858 1722 0443	maulina@gramedia-majalah.com	
590	Juanda	1970-01-01 00:00:00	\N	2019-11-26 15:52:07.711289	\N	86	3	08567773778	 ajuanda@gridnetwork.id	
591	Pius	1970-01-01 00:00:00	\N	2019-11-26 15:52:29.530538	\N	211	3	0813 8225 4684	pio.klobor@gmail.com	
592	Harini Ratna Ningsih	1970-01-01 00:00:00	\N	2019-11-26 15:53:00.632157	\N	211	3	0857 1062 1755	propertyandthecity@gmail.com	
593	Dedy	1970-01-01 00:00:00	\N	2019-11-26 15:53:24.724814	\N	429	3	0856 8800 305	dedy.mulyadi@rumahhokie.com	
594	Adhitya Putra Pratama	1970-01-01 00:00:00	\N	2019-11-26 15:53:48.560951	\N	429	3	0821 2203 5262	adhitya.putra@rumahhokie.com	
595	Tussie	1970-01-01 00:00:00	\N	2019-11-26 15:54:17.169766	\N	485	3	0816 1321 966	aulika.tussie@yahoo.com	
596	Vonda	1970-01-01 00:00:00	\N	2019-11-26 15:54:38.52592	\N	485	3	0856 9469 7874	vondanabilla@gmail.com	
597	Beno Beniko	1970-01-01 00:00:00	\N	2019-11-26 15:55:05.61512	\N	481	3	0818 406 648	benobeniko@yahoo.com	
572	Hajidah Eka	1970-01-01 00:00:00	1888119653	2019-11-26 15:44:54.383419	2019-12-11 12:03:42	315	3	0822 1353 3425	hajidahekaa@gmail.com	
552	Dipa	1970-01-01 00:00:00	2635267951	2019-11-26 15:19:03.016863	2019-12-04 14:01:45	581	1	0856 9166 1908	dipaanggara@gmail.com	
569	Dian Eka	1970-01-01 00:00:00	0814889639	2019-11-26 15:35:53.146974	2019-12-04 14:14:18	225	3	0812 1285 4286	kramotak17@yahoo.com	
531	Maya Nawangwulan	1970-01-01 00:00:00	0230302743	2019-11-26 15:07:43.296347	2019-12-05 11:41:35	117	1	0812 8716 6061	maya.nawangwulan@tempo.co.id	
532	Afrilia	1970-01-01 00:00:00	1645842619	2019-11-26 15:08:07.072734	2019-12-07 13:55:18	117	1	0856 9185 8892	afriliasuryanis@gmail.com	
570	Eny	1970-01-01 00:00:00	0037319428	2019-11-26 15:43:29.38413	2019-12-11 13:26:50	29	3	0822 2029 2424	eny.widayati@gmail.com	
598	Ryan Cesar	1970-01-01 00:00:00	\N	2019-11-26 15:55:25.854321	\N	481	3	0898 8201 498	fatchesar@gmail.com	
599	Amelia	1970-01-01 00:00:00	\N	2019-11-26 15:55:48.503889	\N	489	3	0857 1716 9315	dear.amelputeri@gmail.com	
600	Susi Wijayanti	1970-01-01 00:00:00	\N	2019-11-26 15:56:16.627208	\N	423	3	081 2288 7782	soesiwijaya@yahoo.com	
601	Robert Christanto Halim	1970-01-01 00:00:00	\N	2019-11-26 15:56:39.474983	\N	423	3	0817 995 1984	robert@rumah.com	
602	Evi	1970-01-01 00:00:00	\N	2019-11-26 15:56:57.330635	\N	423	3	081213120392	evi@rumah.com	
603	Maria Kusrini	1970-01-01 00:00:00	\N	2019-11-26 15:58:01.178973	\N	596	3	0857 2978 5138	maria.kusrini@yukmakan.com	
604	Lolita	1970-01-01 00:00:00	\N	2019-11-26 15:58:26.374729	\N	50	3	0812 9170 9122	lolytaputri23@gmail.com	
605	Dwi	1970-01-01 00:00:00	\N	2019-11-26 15:58:57.479326	\N	436	3	0859 5953 7915	dwidombleh@gmail.com	
606	Endy Poerwanto	1970-01-01 00:00:00	\N	2019-11-26 16:00:17.690113	\N	495	9	0823 1162 7172	redaksibisniswisata@gmail.com	
607	Radit	1970-01-01 00:00:00	\N	2019-11-26 16:00:42.67319	\N	580	9	0878 7851 5136	rbasuki@destinasian.com	
611	Yuri Hamza	1970-01-01 00:00:00	\N	2019-11-26 16:03:46.917926	\N	53	8	0815 1312 8888	yurinaga@akugamer.com	
612	Andre	1970-01-01 00:00:00	\N	2019-11-26 16:04:17.154771	\N	97	8	0821 1480 7770	andre.erlangga@duniaku.net	
613	Kaila	1970-01-01 00:00:00	\N	2019-11-26 16:04:42.906934	\N	97	8	0821 3773 3920	kaila@duniaku.net	
614	Michael Samuel	1970-01-01 00:00:00	\N	2019-11-26 16:05:08.961984	\N	129	8	0855 1434 713	michael@esports.id	
615	Panji Pangestu	1970-01-01 00:00:00	\N	2019-11-26 16:06:09.686057	\N	536	8	0857 7578 3488	panjipngst@exploid.gg	
616	Lulut	1970-01-01 00:00:00	\N	2019-11-26 16:06:43.833757	\N	222	8	0878 3870 3274	ladiars15@yahoo.com	
617	A. Agus Pratama	1970-01-01 00:00:00	\N	2019-11-26 16:07:14.23266	\N	215	8	0856 9558 8768	agus@gamescore.id	
618	Rio	1970-01-01 00:00:00	\N	2019-11-26 16:07:39.848119	\N	205	8	0852 7134 8676	info@gamebrott.com	
619	Rully Albinar	1970-01-01 00:00:00	\N	2019-11-26 16:08:06.778909	\N	320	8	0821 1407 0093	rully@gudanggaming.com	
621	Jefri Sibarani	1970-01-01 00:00:00	\N	2019-11-26 16:08:53.790096	\N	262	8	0822 6040 8169	jefri.sibarani@duniaku.net	
622	Valya	1970-01-01 00:00:00	\N	2019-11-26 16:09:24.419752	\N	262	8	0899 972 0147	valya.annisya@ggwp.id	
623	Amel Septiani	1970-01-01 00:00:00	\N	2019-11-26 16:09:53.01783	\N	300	8	0896 0809 3081	amelsept93@gmail.com	
624	Giovannia Whelly	1970-01-01 00:00:00	\N	2019-11-26 16:10:16.581742	\N	300	8	0822 9808 4800	redaksigridgames@gmail.com	
627	Muhammad Akbar	1970-01-01 00:00:00	\N	2019-11-26 16:11:28.191644	\N	84	8	0822 9481 636	akbar.priono@dailysocial.id	
628	Daniel	1970-01-01 00:00:00	\N	2019-11-26 16:11:48.689135	\N	127	8	0812 1093 4985	indonesiagamingarena@gmail.com	
629	Alvin Josef	1970-01-01 00:00:00	\N	2019-11-26 16:12:14.012565	\N	162	8	0821 4009 1449	alvin.josef@gmail.com	
630	Olla	1970-01-01 00:00:00	\N	2019-11-26 16:12:34.294745	\N	115	8	0858 9909 1272	olla.abdillah@indogamers.com	
631	Ikhsan	1970-01-01 00:00:00	\N	2019-11-26 16:12:58.736037	\N	113	8	0813 1644 6237	iksanokita@gmail.com	
632	Estu Purto Wibowo	1970-01-01 00:00:00	\N	2019-11-26 16:13:30.657311	\N	391	8	0856 9531 3895	estu@metaco.gg	
633	Fakry Naras Wahidi	1970-01-01 00:00:00	\N	2019-11-26 16:14:00.037884	\N	133	8	0856 9730 7106	masterfakry@kotakgame.com	
634	Belly Hariyanto Putra	1970-01-01 00:00:00	\N	2019-11-26 16:15:38.299348	\N	391	8	0821 1461 2004	belly,putra76@gmail.com	
636	Viktor	1970-01-01 00:00:00	\N	2019-11-26 16:16:26.058409	\N	427	8	0821 1239 8712	berita@techpod.tech	
637	Sontry	2019-11-26 00:00:00	\N	2019-11-26 17:05:06.303381	\N	446	14	0856 7877 429 	sontry.stephanus@beritasatumedia.com	
640	Teguh Sudarisman	2019-11-26 00:00:00	\N	2019-11-26 17:11:48.424922	\N	337	14	0813 1055 7733	kalstarmagazine@gmail.com	
641	Dian Triasari	2019-11-26 00:00:00	\N	2019-11-26 17:12:56.358358	\N	145	14	0815 165 2209	d.iann@yahoo.com	
644	Beni Adrian	2019-11-26 00:00:00	\N	2019-11-26 17:16:07.507935	\N	620	14	081318010296		
645	Roni	2019-11-26 00:00:00	\N	2019-11-26 17:16:47.13405	\N	628	14		roni.airspace@gmail.com	
646	Turiman Sofyan	2019-11-26 00:00:00	\N	2019-11-26 17:18:24.13824	2019-11-26 17:19:01	629	14	081319093939	toery_sofyan@yahoo.com	
647	Harry Tanoso	2019-11-26 00:00:00	\N	2019-11-26 17:22:14.530146	\N	232	14	0878 7863 8238	ozon_365@yahoo.com	
638	Gatot	2019-11-26 00:00:00	\N	2019-11-26 17:10:14.849627	2019-11-26 17:31:07	630	14	0812-9676-618	cafeangkasa@gmail.com	
649	Elvis	2019-11-27 00:00:00	1759079727	2019-11-27 09:36:16.943635	2019-11-27 09:36:44	6	1		elvoctav@gmail.com	
650	Reni	2019-11-27 00:00:00	\N	2019-11-27 09:57:28.715031	\N	623	14	08161135537	renirohma@gmail.com	
642	Reni	2019-11-26 00:00:00	0272406663	2019-11-26 17:14:19.224907	2019-11-27 09:57:56	623	14	 0815-8607-8803	hello.indoaviation@gmail.com	
643	Septian	2019-11-26 00:00:00	3771553625	2019-11-26 17:15:23.313335	2019-11-27 12:35:43	620	14	08561239968 	remigius.septian@gmail.com 	
651	Haryo Adjie	2019-11-27 00:00:00	0015152207	2019-11-27 10:01:07.604982	2019-11-27 10:05:12	624	14	08176756843	redaksi.indomiliter@gmail.com	
652	Erika	2019-11-27 00:00:00	1123865327	2019-11-27 10:06:52.880602	2019-11-27 10:08:22	54	2	081294631177	erika.kurnia@kompas.com	
653	Irvan	2019-11-27 00:00:00	1642694059	2019-11-27 10:12:46.932855	2019-11-27 10:13:11	621	14		irvankhaldun@gmail.com	
648	Galih	2019-11-27 00:00:00	1781870852	2019-11-27 09:34:32.457276	2019-11-27 10:14:30	553	2	08128389757	galihputra.gp78@gmail.com	
453	Amalia	1970-01-01 00:00:00	4162234585	2019-11-25 14:59:22.931474	2019-11-27 10:19:30	65	1	082110764017	amalianurfi@gmail.com	
654	Arief Miswanto	2019-11-27 00:00:00	0133161839	2019-11-27 10:22:16.30484	2019-11-27 10:25:58	618	14	087884408350	marketing@majalahbandara.com	
655	Riska	2019-11-27 00:00:00	2365316911	2019-11-27 10:23:36.567976	2019-11-27 10:26:51	618	14	081287925499	marketing@majalahbandara.com	
656	Jarot	2019-11-27 00:00:00	0490458767	2019-11-27 10:33:46.844534	2019-11-27 10:34:22	370	14	082214608868	dimasjarotbayu@gmail.com	
657	Ade Irma	2019-11-27 00:00:00	3125551620	2019-11-27 10:37:05.648966	2019-11-27 10:38:02	110	14	08562325675	jujunida@gmail.com	
658	Rara Subekti	2019-11-27 00:00:00	3174430223	2019-11-27 10:39:18.286726	2019-11-27 10:39:33	353	14	085780054157	rarasubektirep@gmail.com	
252	Arbie Marwan	1970-01-01 00:00:00	4230089475	2019-11-25 10:00:02.583182	2019-11-27 10:47:40	52	2	0823 3471 2788	arbie.marwan@gmail.com	
659	Irman Robiawan	2019-11-27 00:00:00	\N	2019-11-27 11:04:25.63909	\N	584	14	081908012000	robiawan@gmail.com	
639	Herawati Saragih	2019-11-26 00:00:00	3037017002	2019-11-26 17:11:08.19407	2019-11-27 11:28:05	561	14	0818 887 823	herawati.saragih@agencyfish.com	
620	Gerry Eka	1970-01-01 00:00:00	3781000527	2019-11-26 16:08:30.107069	2019-12-04 14:08:41	262	8	0821 1402 0320	beta2404@gmail.com	
625	Oky	1970-01-01 00:00:00	0636304495	2019-11-26 16:10:41.761828	2019-12-04 13:47:39	352	8	0896 5360 8345	oky@hardwareholic.com	
609	Ignatius Feery	1970-01-01 00:00:00	0291693479	2019-11-26 16:01:43.812292	2019-12-11 12:13:01	499	9	0813 1140 5592	editor@tourismvaganza.com	
610	Pasha	1970-01-01 00:00:00	1363575887	2019-11-26 16:02:12.03453	2019-12-11 13:19:25	589	9	0812 8010 5562	pasha_yudha@gmail.com	
626	Dicky	1970-01-01 00:00:00	0237055543	2019-11-26 16:11:06.376494	2020-01-04 17:47:22	352	8	0813 1085 5671	dicky@hardwareholic.com	
635	Reza Novri	1970-01-01 00:00:00	2036145231	2019-11-26 16:16:03.522267	2020-01-04 17:48:05	529	8	0856 9335 2530	novri@overclockingid.com	
661	Rahamat	2019-11-27 00:00:00	\N	2019-11-27 11:21:07.110539	\N	628	14	081281770985	rahchmatkartakusuma@ymail.co	
662	Rachmat	2019-11-27 00:00:00	2419535855	2019-11-27 11:22:48.427693	2019-11-27 11:23:17	628	14	081281770985	rachmatkartakusuma@ymail.com	
478	Eva Martha Rahayu	1970-01-01 00:00:00	1345050767	2019-11-25 15:20:21.964929	2019-11-27 11:43:56	324	1	0816 18 65 64 9	evamartha_rahayu@yahoo.com	
663	Imam	2019-11-27 00:00:00	\N	2019-11-27 11:57:04.843414	\N	186	14	081584312072	imasu2000@gmail.com	
664	Ade P Marboen	2019-11-27 00:00:00	\N	2019-11-27 12:23:01.921015	\N	110	14	081353814678	whodareswins.el.alamien@gmail.com	
665	Fadil	1970-01-01 00:00:00	\N	2019-12-03 10:57:59.682616	\N	264	2	0878 8649 7059	fadhil@jawapos.com	
667	Romi	1970-01-01 00:00:00	\N	2019-12-03 11:05:03.838542	\N	76	2			
668	Patardo	1970-01-01 00:00:00	\N	2019-12-03 11:09:35.662747	\N	432	2	0878 7656 0764	hieronimuspatar@gmail.com	
670	Helmi	1970-01-01 00:00:00	\N	2019-12-03 11:15:29.253315	\N	631	2	0812 1810 7455	adityasuhelmi2626@gmail.com	
671	Achmad	1970-01-01 00:00:00	\N	2019-12-03 11:17:33.197067	\N	597	2	0898 6328 230	trinoto.master@gmail.com	
676	Ahmad Lutfi	2019-12-04 00:00:00	\N	2019-12-04 11:12:43.905713	\N	518	15	08561908589	loebassist@gmail.com	
677	Edy Prama	2019-12-04 00:00:00	\N	2019-12-04 11:17:13.476694	\N	271	15	089682387068	edyprama@gmail.com	
678	Kurnia	2019-12-04 00:00:00	\N	2019-12-04 11:18:42.002056	\N	370	15		trikurniay@gmail.com	
679	Putri	2019-12-04 00:00:00	\N	2019-12-04 11:22:17.906199	\N	89	15		restu.putri@idntimes.com	
680	Sarah Yuniarni	2019-12-04 00:00:00	\N	2019-12-04 11:24:08.478004	\N	635	15	0822 3183 7026	sarahyuniarni@dealstreetasia.com	
681	Ichwan Chasani	2019-12-04 00:00:00	\N	2019-12-04 11:26:11.330408	\N	581	15	0812 9022 0744	ichasanie@gmail.com	
684	Hermawan	2019-12-04 00:00:00	\N	2019-12-04 11:34:29.407021	\N	128	15	0818740268	her_2d@yahoo.com	
685	Arif Rahman	2019-12-04 00:00:00	\N	2019-12-04 11:44:10.355517	\N	566	15	08129599389	sumarip@gmail.com	
686	Fahrul	2019-12-04 00:00:00	\N	2019-12-04 11:55:23.279776	\N	594	15		fahrul.anwar@youngster.id	
687	Widya Anggita	2019-12-04 00:00:00	\N	2019-12-04 12:08:58.146164	\N	372	15	085273957131	putriwidyaanggita@yahoo.com	
688	Sifa	1970-01-01 00:00:00	\N	2019-12-04 12:11:20.355409	\N	275	1	0853 5212 3498	sifamaulida26@gmail.com	
689	Jaju	2019-12-04 00:00:00	\N	2019-12-04 12:25:06.619748	\N	548	15	089673128087	wahyu@cnbcindonesia.com	
690	Fajar	2019-12-04 00:00:00	\N	2019-12-04 12:25:52.452299	\N	637	15	081293851914	fyrasdianto@gmail.com	
691	Bimo Andhika	2019-12-04 00:00:00	\N	2019-12-04 12:29:33.316687	\N	227	15	085691352307	bimo@101jakfm.com	
692	Nirmala	2019-12-04 00:00:00	\N	2019-12-04 12:30:30.816985	\N	45	15	085710102435	nirma.pasfm@gmail.com	
693	Ilona	2019-12-04 00:00:00	\N	2019-12-04 12:33:08.480803	\N	43	15	0812189116021	silvi.lonatrg@gmail.com	
695	Ario Panca Wibowo	2019-12-04 00:00:00	\N	2019-12-04 12:36:05.673188	\N	278	15	081585366626	ario.pancawibowo@mncgroup.com	
697	Miranda Saragih	2019-12-04 00:00:00	\N	2019-12-04 12:38:12.688495	\N	453	15	0817 9840 256	mirandasaragih@gmail.com	
698	Hanif	2019-12-04 00:00:00	\N	2019-12-04 12:38:52.95268	\N	496	15	08562616339	bayaallegiance@yahoo.com	
699	Pradhita	2019-12-04 00:00:00	\N	2019-12-04 12:39:38.560777	\N	513	15	081281828200	pradhita.wulandari@ochanneltv.com	
700	Emzy Ardiwinata	2019-12-04 00:00:00	\N	2019-12-04 12:41:08.107315	\N	140	15	082219165575	emzygermany@gmail.com	
701	Noviana	2019-12-04 00:00:00	\N	2019-12-04 12:41:55.1329	\N	12	15	081281909636	noviiana93@gmail.com	
702	Nuansa Rama Dhika	2019-12-04 00:00:00	\N	2019-12-04 12:43:01.214945	\N	57	15	081212969117	nuansaramadhika@gmail.com	
703	Indra E. Gunawan	2019-12-04 00:00:00	\N	2019-12-04 12:44:49.342253	\N	326	15	0819 1018 1954	rayrizqi@gmail.com	
704	Elsa Faradila Chandra	2019-12-04 00:00:00	\N	2019-12-04 12:46:23.310409	\N	505	15	082113223596	elsafchandra@gmail.com	
705	Abdul Rahman	2019-12-04 00:00:00	\N	2019-12-04 12:47:15.823837	\N	574	15	085299150598	abdulrahman2908@gmail.com	
710	Helmi	1970-01-01 00:00:00	1075632431	2019-12-04 13:08:07.15669	2019-12-04 13:08:29	445	2	083899868390	helmi.reinaldi@telset.id	
706	Diah 	2019-12-04 00:00:00	36151881753615188175	2019-12-04 12:48:37.425246	2019-12-04 12:49:00	60	15	089695881318	diahtamayanti@gmail.com	
708	Danang Setiaji	2019-12-04 00:00:00	\N	2019-12-04 12:53:26.013223	\N	422	15	083873121705	danangsetiaji32@gmail.com	
707	Ferry	1970-01-01 00:00:00	3646909893	2019-12-04 12:52:55.282131	2019-12-04 12:54:38	639	2	0856 9888 077	gwigwicom@gmail.com	
675	Gatut	1970-01-01 00:00:00	1084935887	2019-12-04 10:27:50.631119	2019-12-04 13:02:07	634	2	0812 1399 2411	rio.modifikasi@gmail.com	
709	Rangga	1970-01-01 00:00:00	\N	2019-12-04 13:03:45.520853	\N	478	2	0895 3290 73963	mranggaradityaa@gmail.com	
711	Sekar	1970-01-01 00:00:00	2260955105	2019-12-04 13:10:31.941436	2019-12-04 13:10:40	38	2		sekar.gandhawangi@kompas.com	
666	Arif	1970-01-01 00:00:00	02213267690221326769	2019-12-03 11:03:38.334593	2019-12-04 13:06:48	549	2	0821 1294 2329		
224	Aulia Rahman N	1970-01-01 00:00:00	2510321541	2019-11-20 14:40:45.795541	2019-12-04 13:16:14	146	2	0813 9847 5283	aulia.nugraha@kumparan.com	
392	Hani	1970-01-01 00:00:00	1004497391	2019-11-25 14:19:43.704443	2020-01-04 15:35:21	572	2	0877 8250 7220	hani.nurfajrina@metranet.co.id	
712	Rizka M	1970-01-01 00:00:00	0387922629	2019-12-04 13:13:48.99658	2019-12-04 13:14:16	493	2	089696242094	marhani.rizka@gmail.com	
713	Putri Zakia	1970-01-01 00:00:00	\N	2019-12-04 13:17:08.28821	\N	54	2	08124877647	putrizakiasalsabila07@gmail.com	
714	Shinta Virgianti	2019-12-04 00:00:00	\N	2019-12-04 13:19:03.865463	\N	498	15	085692307343	shinta.virgianti@mncgroup.com	
715	Stevanus	2019-12-04 00:00:00	\N	2019-12-04 13:19:57.987134	\N	235	2	08986693585	stefanus.wiratama@mainspring.technologi	
57	Pernita Hestin	1970-01-01 00:00:00	2890293839	2019-11-19 17:15:13.332135	2019-12-04 13:35:40	518	2	081386535363	hestinpernita@gmail.com	
669	Mirza	1970-01-01 00:00:00	1521739311	2019-12-03 11:15:06.087516	2019-12-04 13:36:25	631	2	0818 0873 2828	tombloisme@gmail.com	
717	Alvin 	2019-12-04 00:00:00	\N	2019-12-04 13:44:30.061982	\N	601	4	081283314080		
541	Alfian Sidik	1970-01-01 00:00:00	0320557743	2019-11-26 15:12:47.8944	2019-12-04 13:51:28	329	1	0813 1445 4932	alfian_sidik@yahoo.com	
111	Arief Burhanuddin	1970-01-01 00:00:00	3211457337	2019-11-20 11:08:47.796462	2020-01-04 17:02:50	102	2	0811959551	arief.burhanuddin@gmail.com	
682	Ghani	2019-12-04 00:00:00	2309451873	2019-12-04 11:27:44.956496	2019-12-04 14:21:41	332	15		ghanignr@gmail.com	
674	Roy	1970-01-01 00:00:00	2506487279	2019-12-03 14:56:06.037801	2020-01-02 09:25:27	383	2	081298255046	royridho20@gmail.com	
694	Manda	2019-12-04 00:00:00	4162825113	2019-12-04 12:34:10.564854	2019-12-05 11:10:23	638	15		mandariska.popfm@gmail.com	
660	Agus Aryanto	2019-11-27 00:00:00	3317560943	2019-11-27 11:16:49.465032	2019-12-07 12:43:06	579	14	085266757688	4905.aryanto@gmail.com	
696	Bella	2019-12-04 00:00:00	23845267052384526705	2019-12-04 12:36:38.221139	2019-12-05 11:24:21	649	15	081317575235	bella@macroad.com	
683	Hendra Sudjana	2019-12-04 00:00:00	1599547919	2019-12-04 11:33:37.061637	2019-12-07 13:57:03	382	15	08128078138	hendra_liaw@yahoo.co.id	
672	Imam M	1970-01-01 00:00:00	1366234095	2019-12-03 11:22:20.418147	2020-01-04 16:55:04	632	2	0815 9164 626	imoeloek@gmail.com	
326	Putri	1970-01-01 00:00:00	3307331487	2019-11-25 11:07:36.460042	2020-01-04 17:27:33	54	1	0856 2400 2044	putrisyifan@gmail.com	
718	Reyhan	2019-12-04 00:00:00	3662022293	2019-12-04 13:55:11.158403	2019-12-04 13:55:27	89	15	081294631039	achmad.reyhan@idntimes.com	
719	Fani	2019-12-04 00:00:00	1347882921	2019-12-04 13:56:00.208788	2019-12-04 13:56:31	608	4	081703366222	funqfani@gmail.com	
720	Adam	1970-01-01 00:00:00	\N	2019-12-04 14:15:51.973009	\N	640	4			
721	Ghani	1970-01-01 00:00:00	\N	2019-12-04 14:21:17.993941	\N	332	2		ghanignr@gmail.com	
722	Ade	1970-01-01 00:00:00	\N	2019-12-04 14:35:43.878311	\N	267	2		zakitroniks@gmail.com	
673	Grek	1970-01-01 00:00:00	01028361030102836103	2019-12-03 11:24:05.712856	2019-12-04 14:36:56	633	2			
723	Yosi Wyoso	2019-12-04 00:00:00	\N	2019-12-04 18:43:21.271895	\N	42	15	087880134553	yosiwyoso@gmail.com	
724	Hari Setianto	2019-12-04 00:00:00	\N	2019-12-04 18:44:34.275163	\N	414	15	0818829001	harisetu212@gmail.com	
725	Jessica Jaganathan	2019-12-04 00:00:00	\N	2019-12-04 20:12:12.481238	\N	479	15	6568703822	jessica.jaganathan@thomsonrouters.com	
726	Yoga Rusmana	2019-12-04 00:00:00	\N	2019-12-04 20:13:27.324292	\N	512	15	081514306650	yrusmana@bloomberg.net	
727	Andinia Nobel	2019-12-04 00:00:00	\N	2019-12-04 20:14:24.506774	\N	1	15	02180657803	anobel@oxfordbusinessgroup.com	
728	Asep Budiman	2019-12-04 00:00:00	\N	2019-12-04 20:15:08.160636	\N	122	15	081395206113	asepbudimansyah@gmail.com	
729	Kemal	2019-12-04 00:00:00	\N	2019-12-04 20:16:26.957411	\N	527	15	0811233311	kemalpermana@gmail.com	
762	Verry Vernon	2019-12-05 00:00:00	1855100417	2019-12-05 15:02:30.113103	2019-12-07 14:08:03	175	2	081283238347	verryvernon@gmail.com	
747	Agung	1970-01-01 00:00:00	3986256591	2019-12-05 10:57:41.845475	2019-12-07 13:47:42	583	2		agungpambudhy@detik.com	
733	Emral Firdiansyah	2019-12-05 00:00:00	\N	2019-12-05 09:31:24.602278	\N	186	15	082298859482	emr4lsyah@gmail.com	
738	Sejahtera Sembiring	1970-01-01 00:00:00	3441925231	2019-12-05 10:01:44.710841	2019-12-07 13:56:47	98	1	08128491231	sejahtera@petromindo.com	
735	Hendri	1970-01-01 00:00:00	\N	2019-12-05 09:47:05.13182	\N	86	2			
736	Iqbal	1970-01-01 00:00:00	\N	2019-12-05 09:47:25.523181	\N	86	2			
737	Mohammad Defrizal	2019-12-05 00:00:00	23931755532393175553	2019-12-05 09:59:58.262411	2019-12-05 10:00:16	446	2	0817177203	defrizal@globeasia.com	
555	Ilham	1970-01-01 00:00:00	2821331919	2019-11-26 15:20:11.590509	2019-12-07 13:58:14	443	2	0895 3441 64304	achmad.ilham@mncgroup.com	
741	Cardiffa Bertyana Robby 	2019-12-05 00:00:00	1721601007	2019-12-05 10:39:19.406657	2019-12-07 14:11:19	642	2	081806071676	cardiffa.robby@hot932fm.com	
739	Andryanto Wisnuwidodo	2019-12-05 00:00:00	08301276050830127605	2019-12-05 10:24:31.266796	2019-12-05 10:25:29	35	1	087777628399	andriyanto.widodo@mncgroup.com	
767	Muhammad Fadhil Achmadi	2019-12-06 00:00:00	0878560161	2019-12-06 10:37:06.182508	2019-12-07 14:13:14	659	2	087887171567	pr@bncc.net	
765	Ismail	2019-12-05 00:00:00	3961640537	2019-12-05 17:10:50.639298	2019-12-07 14:11:58	658	2	08129189532	abyathal84@gmail.com	
742	Desty Eryanti	2019-12-05 00:00:00	1512905476	2019-12-05 10:40:05.193074	2019-12-05 10:40:45	643	2	081320736698	desty.eryanti@mustang88fm	
743	Fery	2019-12-05 00:00:00	0710956871	2019-12-05 10:47:50.447605	2019-12-05 10:48:26	167	2	0811253552	feryjournalist@gmail.com	
745	Andi	1970-01-01 00:00:00	\N	2019-12-05 10:50:46.885251	\N	249	2	0813 8051 4581	andi@gayagaul.com	
746	Deddy	1970-01-01 00:00:00	3433779445	2019-12-05 10:52:19.563786	2019-12-05 10:52:47	163	2	0812 9619 1619	redaksi@portalsains.org	
757	Kiki	1970-01-01 00:00:00	1344804303	2019-12-05 13:29:14.037211	2019-12-07 13:49:08	54	6	0877640543058746	k91black@gmail.com	
748	Putri Raya	2019-12-05 00:00:00	\N	2019-12-05 11:00:08.05181	2019-12-07 13:50:39	648	2	085691465654	putriraya81@gmail.com	
750	Alif Ichwan	1970-01-01 00:00:00	\N	2019-12-05 11:16:15.757292	\N	38	1		alif.ichwan@kompas.com	
753	Tias	2019-12-05 00:00:00	1230544495	2019-12-05 11:38:07.335516	2019-12-05 11:38:41	650	2	081315974721	indratyast340@yahoo.com	
752	Sulistyo Yulianto	1970-01-01 00:00:00	0174740228	2019-12-05 11:37:49.00197	2019-12-05 11:38:45	651	1		sulistyoyulianto@outlook.com	
754	Maya	1970-01-01 00:00:00	\N	2019-12-05 11:41:19.1633	\N	653	2		nurmayasihole03@gmail.com	
749	Gandhi Natanendra	2019-12-05 00:00:00	3154407663	2019-12-05 11:12:09.422545	2019-12-07 13:49:41	54	1	081225703656	gandhi.natanendra@kompas.com	
436	Emral	1970-01-01 00:00:00	2570884143	2019-11-25 14:50:26.777538	2019-12-07 13:52:32	186	1	0822 9885 9482	emr4lsyah@gmail.com	
759	Christy	2019-12-05 00:00:00	\N	2019-12-05 13:42:37.477817	\N	654	15	085894222186	bundachristy7@gmail.com	
763	Iis	2019-12-05 00:00:00	1270256735	2019-12-05 15:36:26.228708	2019-12-05 15:36:52	655	2	081280850848	iisdiah1010@gmail.com	
760	Bisri	2019-12-05 00:00:00	16469000111646900011164690001131969868951646900011	2019-12-05 14:40:40.41765	2019-12-05 14:41:20	58	10	083898826979	mhbisri93@gmail.com	
761	Rahma 	2019-12-05 00:00:00	0678551925	2019-12-05 14:45:53.751575	2019-12-07 13:55:53	569	2	08116668688	rsulistya92@gmail.com	
756	Sri Kusmayanti	2019-12-05 00:00:00	2384472481	2019-12-05 12:17:28.93687	2019-12-07 14:08:14	45	2	08156221597	srii.pasfm@gmail.com	
768	Giodio Nathanael Pratama	2019-12-06 00:00:00	4050116629	2019-12-06 10:38:25.155999	2019-12-06 10:39:07	659	2	082248069914	pr@bncc.net	
770	Oktarina Paramitha S	2019-12-06 00:00:00	\N	2019-12-06 14:05:46.450468	2019-12-07 14:13:58	566	2	081212678272	oktarinaps@cyberthreat.id	
764	Andi	2019-12-05 00:00:00	2055175428	2019-12-05 15:38:27.319951	2019-12-05 15:39:09	656	2	085282897653	x3nody@gmail.com	
772	Sayyidina Takwa	2019-12-06 00:00:00	3351919663	2019-12-06 15:48:56.480358	2019-12-07 14:14:31	103	15	083895713438	Adininanews@gmail.com	
766	Ismail 	2019-12-05 00:00:00	\N	2019-12-05 17:13:19.519035	\N	510	2	08129189532	ismail64@rocketmail.com	
769	Muhammad Zubeir	2019-12-06 00:00:00	\N	2019-12-06 13:50:55.139903	\N	660	2	085779793231	m.zubairrr@gmail.com	
775	Ricco	2019-12-07 00:00:00	\N	2019-12-07 10:57:02.244422	2019-12-07 14:15:58	659	2	081553081235	riccoccir05@gmail.com	
771	Helmi Romdhoni	2019-12-06 00:00:00	2061639471	2019-12-06 15:47:24.46835	2019-12-07 14:14:44	103	15	081316883878	helmiromdhoni@yahoo.com	
751	Wisnu	1970-01-01 00:00:00	0291643279	2019-12-05 11:22:04.075932	2019-12-12 14:17:18	332	1	08159226724	wisnuas75@yahoo.com	
774	Geral	2019-12-07 00:00:00	4050354389	2019-12-07 10:55:43.752938	2019-12-07 10:56:06	659	2	087833906227	grldt11@gmail.com	
776	Ricco	2019-12-07 00:00:00	\N	2019-12-07 10:57:49.733419	\N	659	2	081553081235	riccoccir05@gmail.com	4050260341
732	Aisyah	2019-12-05 00:00:00	1156548631	2019-12-05 09:28:44.879985	2019-12-07 13:46:42	583	2	087786420368	aisyah.kamaliah@detik.com	
755	Doni	1970-01-01 00:00:00	\N	2019-12-05 11:54:25.272988	2019-12-07 13:51:04	465	1	082113111638	tjpdons@gmail.com	
758	Bisma Septalisma	2019-12-05 00:00:00	2821878735	2019-12-05 13:37:51.032294	2019-12-07 13:51:24	556	2	089630415677	bisma.septalisma@cnnindonesia.com	
731	Danang Soeminto	2019-12-05 00:00:00	\N	2019-12-05 09:27:01.11773	2019-12-07 13:58:39	443	2	081294460733	danang.soeminto@mncgroup.com	
730	Daniel	2019-12-05 00:00:00	1705703471	2019-12-05 08:51:17.231948	2019-12-07 14:06:26	437	2	081519989165	daniel_suroyo@yahoo.com	
777	Randi	2019-12-07 00:00:00	\N	2019-12-07 10:58:29.13464	2019-12-07 14:16:12	659	2	081290222214	randi@bncc.net	3661070901
773	Muhamad Rifani Wibisono	2019-12-06 00:00:00	0108973263	2019-12-06 16:55:06.249961	2019-12-07 16:25:03	569	2	085972841009	muhamadrifaniwibisono@gmail.com	
744	Andromeda	2019-12-05 00:00:00	0928218021	2019-12-05 10:50:04.701445	2019-12-11 15:52:28	131	3	08118588965	pinkkorset@yahoo.com	
734	Endang Muchtar	2019-12-05 00:00:00	0961729807	2019-12-05 09:32:15.038435	2019-12-07 13:54:58	478	2	081932262388	endang@bisnis.co.id	
740	Amandhani Dassad	1970-01-01 00:00:00	0815901463	2019-12-05 10:38:26.419776	2019-12-07 14:11:11	641	1	081284723346	amandhani.dassad@987genfm.com	
778	Ahmad Fadli	2019-12-07 00:00:00	\N	2019-12-07 14:17:49.445521	\N	136	2			
780	Lintang Rowe	1970-01-01 00:00:00	\N	2019-12-09 14:55:04.1581	\N	661	9	0877 8077 3882	emaillintang@gmail.com	
781	Timmi Febrin	1970-01-01 00:00:00	\N	2019-12-09 14:56:05.958791	\N	143	9	0852 1044 4435	febrin_t@yahoo.com	
782	Roy Wicaksono	1970-01-01 00:00:00	\N	2019-12-09 14:57:19.183092	\N	258	9	0856 95 444 525	roy.radjaini@gmail.com	
783	Dany	1970-01-01 00:00:00	\N	2019-12-09 14:58:29.830015	\N	325	9	0857 2904 9169	dany@guideku.com	
784	Nina Loasana	1970-01-01 00:00:00	\N	2019-12-09 14:59:28.086338	\N	465	9	0857 2830 1391	hinata.loasana@gmail.com	
785	Tri Wibowo	1970-01-01 00:00:00	\N	2019-12-09 15:00:54.546413	\N	32	9	0812 3604 4326	tri.wibowo1977@gmail.com	
786	Budi Hendrawan	1970-01-01 00:00:00	\N	2019-12-10 11:18:27.429637	\N	514	9	0897 9399 773	hendra@travelexpose.com	
787	Edhie Rianto	1970-01-01 00:00:00	\N	2019-12-10 11:20:16.840947	\N	662	9	0812-9738-556	edhie-rianto@traveltextonline.com	
788	Ibonk	1970-01-01 00:00:00	\N	2019-12-10 11:21:28.003033	\N	591	9	0819 0829 1145	ibonk@xposeindonesia.com	
789	Didi	1970-01-01 00:00:00	\N	2019-12-10 11:22:32.669426	\N	663	9	0817 9401 397	editor@pristamedia.com	
790	Him	1970-01-01 00:00:00	\N	2019-12-10 11:23:38.3706	\N	78	9	0812 221 7882	him@indonesia.travel	
608	Irma	1970-01-01 00:00:00	08782715990878271599	2019-11-26 16:01:13.205806	2019-12-11 11:41:19	487	9	0818 0776 1955	irmasupena1803@gmail.com	
791	Yudasmoro M	1970-01-01 00:00:00	\N	2019-12-11 11:59:43.34086	\N	665	9	081808174044	yudasmoro@traveletc.id	
792	Adit	1970-01-01 00:00:00	2664762927	2019-12-11 12:34:52.334464	2019-12-11 12:35:34	453	2		aditya.muwangga@mncgroup.com	
793	Iffa	1970-01-01 00:00:00	4140474167	2019-12-11 12:44:37.452265	2019-12-11 12:45:11	153	3	081290128480	iffahrahmaah@gmail.com	
817	Hanan	2019-12-20 00:00:00	411933959941193395994119339599	2019-12-20 14:41:07.745277	2019-12-20 14:41:48	670	2	08129073253	hanan.hatta@gmail.com	
811	Silfi	2019-12-20 00:00:00	1456042383	2019-12-20 13:19:37.673887	2019-12-20 13:22:13	246	2	087814923797	imamatulsilfia@gmail.com	
795	Mega	1970-01-01 00:00:00	1513101591	2019-12-11 13:02:57.831209	2019-12-11 13:03:47	155	3	081228920303	mega@idntimes.com	
796	Fatim	2019-12-11 00:00:00	0312257167	2019-12-11 13:09:00.371903	2019-12-11 13:09:13	542	3	088211558106	fathkarramah@gmail.com	
794	Hani	1970-01-01 00:00:00	3616100911	2019-12-11 13:01:20.148274	2019-12-11 13:11:25	666	3	081945177395	haninyata@gmail.com	
798	Ayu Palupi	2019-12-11 00:00:00	0840109316	2019-12-11 13:14:15.547423	2019-12-11 13:14:31	278	3	08117998808	ayu.nugrayanti	
797	Fajri	1970-01-01 00:00:00	1612942095	2019-12-11 13:13:53.612988	2019-12-11 13:14:47	577	3	08119002704	muhammad.fajri@mncgroup.com	
799	Ria	2019-12-11 00:00:00	0322058895	2019-12-11 13:41:24.54878	2019-12-11 13:42:16	188	3	082124292773	ria.juwita@pranagroup.id	
800	Widyadhana	2019-12-11 00:00:00	\N	2019-12-11 15:55:42.435243	\N	569	3	085799863846	widyadhana97@gmail.com	
801	Syakdiah	2019-12-12 00:00:00	3877330863	2019-12-12 11:42:49.232605	2019-12-12 11:43:21	478	2	081511323435	halimatus.syakdiah@bisnis.com	
802	Kamilah Adawiyah	2019-12-12 00:00:00	\N	2019-12-12 11:46:35.357297	\N	478	15	081218537240	kamilah.adawiyah@bisnis.com	
137	Rizki Romdonnie	1970-01-01 00:00:00	1308696431	2019-11-20 11:28:40.835043	2019-12-12 12:29:02	480	2	0896 2698 6725	rizki.romdonnie@gmail.com	
803	Noer Kusumawardhani	2019-12-12 00:00:00	0267664151	2019-12-12 12:33:36.767758	2019-12-12 12:33:54	353	2	085697684929	noerqk@gmail.com	
804	Pebrianto Eko Wicaksono	1970-01-01 00:00:00	\N	2019-12-19 16:04:34.697778	\N	167	10	0812 9739 3520	pebrianto.wicaksono@kly.id	
805	Fajar	1970-01-01 00:00:00	\N	2019-12-19 16:07:49.168871	\N	122	1	0821 1008 3756		
806	Agung Hidayat 	1970-01-01 00:00:00	\N	2019-12-19 16:12:38.464768	\N	65	1	0852-7891-3527	agunghidayatisme@gmail.com	
716	Fahmi	2019-12-04 00:00:00	26586747352658674735	2019-12-04 13:28:13.200733	2019-12-20 12:49:21	507	2	08996396030	prasetyofahmi13@gmail.com	
808	Nugi	1970-01-01 00:00:00	2841483407	2019-12-20 13:01:58.681433	2019-12-20 13:02:23	668	11	087777340155	anugrahguntik@gmail.com	
810	Adhitya Wibawa	1970-01-01 00:00:00	\N	2019-12-20 13:15:30.906193	\N	178	2	085711211668	adhitya@teknojurnal.com	
818	Sonny	1970-01-01 00:00:00	3402894063	2019-12-20 14:41:09.701245	2019-12-20 14:41:52	103	2	081385466918	sonnywibzpoenya@gmail.com	
473	Lia	1970-01-01 00:00:00	1338766223	2019-11-25 15:17:40.044463	2019-12-20 13:33:52	281	1	0857 1509 7197	lialiliyanti@gmail.com	
809	Adhitya Wibawa	1970-01-01 00:00:00	0383687087	2019-12-20 13:15:24.379595	2019-12-20 13:16:12	178	2	085711211668	adhitya@teknojurnal.com	
812	Bernadinus  Adi Pramudita	2019-12-20 00:00:00	2005447503	2019-12-20 13:52:29.283147	2019-12-20 13:53:05	579	1	0858 9163 4548	bernadinus.pramudita@gmail.com	
807	Laras	1970-01-01 00:00:00	\N	2019-12-19 16:19:05.820585	2019-12-20 14:53:13	667	3	0878-8879-6002	laraszabhr12@gmail.com	
813	Tony Burhanudin	2019-12-20 00:00:00	0656089527	2019-12-20 14:10:25.972643	2019-12-20 14:11:12	281	1	081297474106	tonyburhan72@gmail.com	
815	Yogi Wiriawan	1970-01-01 00:00:00	\N	2019-12-20 14:25:14.197773	\N	669	1	081297952144	mohamad.yogi@mdmedia.co.id	
814	Puti	2019-12-20 00:00:00	4019203599	2019-12-20 14:25:08.193495	2019-12-20 14:25:50	669	2	081288651986	puti.natasya@gmail.com	
816	Faisal	1970-01-01 00:00:00	0440689924	2019-12-20 14:36:00.817025	2019-12-20 14:36:14	566	1	081283492271	faisalhafid971@gmail.com	
819	Abdullah Azzam	1970-01-01 00:00:00	\N	2019-12-20 15:33:10.897859	\N	478	1			
822	Chandra	2020-01-04 00:00:00	2482929039	2020-01-04 15:09:31.67716	2020-01-04 15:09:44	432	2			
820	Christ	1970-01-01 00:00:00	0382640879	2020-01-02 10:03:24.200333	2020-01-04 15:55:57	224	2	0898 9784 235	chris@jagatreview.com	
823	Herry SW	1970-01-01 00:00:00	0379460431	2020-01-04 15:36:21.009406	2020-01-04 15:38:22	672	4	0811 709 900	hsw@hsw9900.com	
824	Lucky Sebastian	1970-01-01 00:00:00	2053574793	2020-01-04 15:40:07.307884	2020-01-04 17:01:42	672	4	0811 2158 259	luckysebastian@gmail.com	
825	Alesa	1970-01-01 00:00:00	\N	2020-01-04 17:08:38.800712	\N	609	4	0811112402	all3sa@gmail.com	
173	Stevy Widia	1970-01-01 00:00:00	1350321593	2019-11-20 12:00:03.58522	2020-01-04 17:21:42	594	3	0813 1028 1493	widia.stevy@gmail.com	
826	Endah	1970-01-01 00:00:00	\N	2020-01-04 17:26:01.828262	\N	478	2		endah@bisnis.com	
779	Didi Sulistyo	2019-12-07 00:00:00	4284307759	2019-12-07 17:45:19.214541	2020-01-04 17:44:49	191	2	081905928005	didi.sulistyo@pricebook.co.id	
821	Yudhi	1970-01-01 00:00:00	3310144783	2020-01-03 10:28:44.508445	2020-01-04 17:45:31	671	2	0856 9770 0922	yudhi.anto@bukalapak.com	
827	Farid	1970-01-01 00:00:00	\N	2020-01-04 17:44:13.185322	2020-01-04 17:52:25	675	4	087872279002	faridrasyid101@gmail.com	
828	Ahmad Sirojuddin	1970-01-01 00:00:00	\N	2020-01-04 18:02:24.152146	\N	501	2	081294301275	errobbany.co@gmail.com	
55	Drean	2019-11-19 00:00:00	0694008655	2019-11-19 17:14:44.924012	2020-01-04 18:31:39	246	2	08121313474	dreanmikhsan@gmail.com	
371	Liberty Jemadu	1970-01-01 00:00:00	\N	2019-11-25 11:39:39.626783	2020-01-07 17:34:29	182	11	0852 1070 2747	liberty_j22@yahoo.com	
\.


--
-- Data for Name: journalist_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.journalist_category (id, name, created_at, updated_at) FROM stdin;
2	Tech	2019-11-19 16:55:04.970933	2019-11-19 16:56:09
1	Business	2019-11-19 16:55:00.070912	2019-11-19 16:56:21
3	Lifestyle	2019-11-20 11:52:10.818114	\N
4	Techno Reviewer	2019-11-22 11:04:05.926109	\N
5	Sport	2019-11-25 10:14:56.759691	\N
6	Industry	2019-11-25 10:17:43.15922	\N
7	Health	2019-11-25 10:17:49.634646	\N
8	Gaming	2019-11-25 10:29:03.19117	\N
9	Travel	2019-11-25 10:33:00.00659	\N
10	Finance	2019-11-25 10:35:15.920434	\N
11	Otomotif	2019-11-25 10:35:30.659118	\N
12	Kuliner	2019-11-25 10:35:40.855206	\N
13	Sains	2019-11-25 11:09:46.113732	\N
14	Flight	2019-11-26 16:50:13.916731	\N
15	General	2019-12-04 11:11:51.737914	\N
\.


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.media (id, name, created_at, updated_at, domain) FROM stdin;
1	Oxford Business	2019-11-19 16:22:44.211296	\N	
2	ARDAN RADIO 105,9FM 	2019-11-19 16:22:45.183247	\N	
3	Padang Ekspres	2019-11-19 16:23:01.444471	\N	
4	1health.id	2019-11-19 16:23:01.482216	\N	
5	Harian Umum Rakyat Sumbar	2019-11-19 16:23:02.702234	\N	
6	Sinarharapan.net	2019-11-19 16:23:07.192331	\N	Sinarharapan.net
7	Devenews.com	2019-11-19 16:23:07.60107	\N	Devenews.com
8	Harian Warta Bali	2019-11-19 16:23:08.64608	\N	
9	Padang TV	2019-11-19 16:23:12.975943	\N	
10	Harian88.com	2019-11-19 16:23:14.094578	\N	
11	Sinarpagiindonesia.com	2019-11-19 16:23:15.31347	\N	Sinarpagiindonesia.com
12	20detik.com	2019-11-19 16:23:15.52705	\N	
13	HARIANKOTA.COM	2019-11-19 16:23:19.500919	\N	
14	DEWI 	2019-11-19 16:23:22.563098	\N	
15	Palembang Pos	2019-11-19 16:23:23.598224	\N	
16	Sindo FM Bandung	2019-11-19 16:23:25.107469	\N	
17	Sindo Makassar	2019-11-19 16:23:30.984817	\N	
18	Harpers Bazaar Indonesia	2019-11-19 16:23:31.14641	\N	
19	Dewiku.com	2019-11-19 16:23:32.789111	\N	Dewiku.com
20	Medan FM 96.3 	2019-11-19 16:23:33.060405	\N	
21	Pamperpop.com	2019-11-19 16:23:34.663437	\N	Pamperpop.com
22	Her World	2019-11-19 16:23:36.514368	\N	
23	Sindo Weekly	2019-11-19 16:23:37.210493	\N	
24	Klik Positif	2019-11-19 16:23:38.464537	\N	klikpositif.com
25	Hernawan.net	2019-11-19 16:23:43.946397	\N	
26	Panorama	2019-11-19 16:23:46.60755	\N	
27	Digination.id	2019-11-19 16:23:47.573935	\N	Digination.id
28	Acara.co.id	2019-11-19 16:23:47.888953	\N	
29	Hidupgaya.co	2019-11-19 16:23:52.115712	\N	
30	Sindo	2019-11-19 16:23:54.491141	\N	Sindonews.com
31	Acehterkini.com	2019-11-19 16:23:58.533405	\N	
32	Paradiso	2019-11-19 16:23:59.070692	\N	
33	Digital Camera	2019-11-19 16:23:59.594644	\N	
34	Klikgame.com	2019-11-19 16:24:02.090085	\N	klikgame.com
35	Sindonews.com	2019-11-19 16:24:05.141656	\N	Sindonews.com
36	Adventurose.com	2019-11-19 16:24:11.102379	\N	
37	Digital News Asia	2019-11-19 16:24:11.310457	\N	
38	Kompas	2019-11-19 16:24:12.107879	\N	
39	Parenting.dream.co.id	2019-11-19 16:24:14.648332	\N	Parenting.dream.co.id
40	Dimassuyatno.com	2019-11-19 16:24:19.693254	\N	Dimassuyatno.com
41	AirMagz	2019-11-19 16:24:22.106813	\N	
42	Skala+	2019-11-19 16:24:23.714182	\N	
43	Kompas TV	2019-11-19 16:24:24.169025	\N	
44	Dokterdigital.com	2019-11-19 16:24:28.006759	\N	Dokterdigital.com
45	Pas FM	2019-11-19 16:24:29.318099	\N	
46	SKH Bandarlampungnews	2019-11-19 16:24:30.239233	\N	
47	Doktersehat.com	2019-11-19 16:24:35.260513	\N	Doktersehat.com
48	Akses.co	2019-11-19 16:24:38.319528	\N	akses.co
49	Himedik.com	2019-11-19 16:24:39.027734	\N	
50	Passionmedia	2019-11-19 16:24:48.599348	\N	Passionmedia.co.id
51	Histla.com	2019-11-19 16:24:49.252197	\N	
52	Aktual.com	2019-11-19 16:25:03.897817	\N	aktual.com
53	Akugamer.com	2019-11-19 16:25:20.534612	\N	akugamer.com
54	Kompas.com	2019-11-19 16:25:23.862645	\N	Kompas.com
55	PC Plus	2019-11-19 16:25:30.187504	\N	
56	PCTren.com	2019-11-19 16:25:34.825789	\N	
57	Hitech	2019-11-19 16:25:36.218989	\N	
58	Akurat.co	2019-11-19 16:25:36.263339	\N	akurat.co
59	Metro24Jam	2019-11-19 16:25:36.791473	\N	https://www.metro24jam.com/
60	Dream.co.id	2019-11-19 16:25:38.192696	\N	Dream.co.id
61	Kompasiana.com	2019-11-19 16:25:38.924876	\N	Kompasiana.com
62	Pekanbaru MX	2019-11-19 16:25:41.135046	\N	
63	HiTekno.com	2019-11-19 16:25:42.031613	\N	
64	Pekanbaru Pos	2019-11-19 16:25:45.445718	\N	
65	Kontan	2019-11-19 16:25:45.738271	\N	
66	 Hitsss.com	2019-11-19 16:25:47.506722	\N	
67	dreamers.id	2019-11-19 16:25:49.079156	\N	dreamers.id
68	Pena Sumatera	2019-11-19 16:25:49.9253	\N	
69	Koran Bernas	2019-11-19 16:25:53.780627	\N	
70	Home & Décor	2019-11-19 16:25:54.330611	\N	
71	Pertamax7.com	2019-11-19 16:25:56.808588	\N	Pertamax7.com
72	Drivenhype.com	2019-11-19 16:25:58.64046	\N	Drivenhype.com
73	Homediary	2019-11-19 16:26:00.13867	\N	
74	Koran Dialog	2019-11-19 16:26:01.843971	\N	
75	Pertamina Media	2019-11-19 16:26:02.828324	\N	
76	Droidlime.com	2019-11-19 16:26:06.769427	\N	Droidlime.com
77	House Estate	2019-11-19 16:26:07.091347	\N	
78	Pesona Indonesia	2019-11-19 16:26:08.469902	\N	
79	Koran Jakarta	2019-11-19 16:26:12.061907	\N	
80	Dunia-energi.com	2019-11-19 16:26:12.623829	\N	
81	Bandarlampungnews	2019-11-19 16:26:13.195267	\N	http://www.bandarlampungnews.com/
82	Alpanews.com	2019-11-19 16:26:13.807807	\N	alpanews.com
83	Petra FM	2019-11-19 16:26:13.832868	\N	
84	Hybrid.co.id	2019-11-19 16:26:16.049777	\N	
85	Petro Edge	2019-11-19 16:26:19.561307	\N	
86	Idea	2019-11-19 16:26:21.500606	\N	
87	Andalas	2019-11-19 16:26:23.61238	\N	
88	Petro Energy	2019-11-19 16:26:24.782287	\N	
89	IDNTimes.com	2019-11-19 16:26:27.139373	\N	
90	Koran Merapi Pembaruan	2019-11-19 16:26:27.283965	\N	
91	SONORA FM YOGYAKARTA	2019-11-19 16:26:27.675893	\N	
92	Duniagames.co.id	2019-11-19 16:26:28.948067	\N	Duniagames.co.id
93	Idteknoku.com	2019-11-19 16:26:33.969682	\N	
94	Sooperboy.com	2019-11-19 16:26:34.696637	\N	Sooperboy.com
95	Android Ranah Minang	2019-11-19 16:26:34.706149	\N	
96	Koran Rakyat	2019-11-19 16:26:37.020103	\N	
97	Duniaku.net	2019-11-19 16:26:38.354601	\N	Duniaku.net
98	Petromindo	2019-11-19 16:26:38.367409	\N	Petromindo.com
99	Inacraftmagz.com	2019-11-19 16:26:39.669487	\N	
100	Starberita.com	2019-11-19 16:26:41.029961	\N	Starberita.com
101	Koran Sindo	2019-11-19 16:26:43.822687	\N	
102	Android-indonesia.com	2019-11-19 16:26:43.838733	\N	
103	Inanews.com	2019-11-19 16:26:45.49146	\N	
104	Starnews Radio	2019-11-19 16:26:47.07297	\N	
105	Pewarta-indonesia.com (PPWI)	2019-11-19 16:26:49.2868	\N	Pewarta-indonesia.com
106	Eksekutif.id	2019-11-19 16:26:50.387185	\N	Eksekutif.id
107	Indo Pos	2019-11-19 16:26:52.146385	\N	
108	stylish-one.com	2019-11-19 16:26:53.748118	\N	stylish-one.com
109	Koran Sindo Manado	2019-11-19 16:26:54.482517	\N	
111	Pewarta.co	2019-11-19 16:26:56.522531	\N	Pewarta.co
112	Elle Decoration	2019-11-19 16:26:59.058899	\N	
113	Indoesports.com	2019-11-19 16:26:59.369219	\N	
114	PGN	2019-11-19 16:27:02.287943	\N	
115	IndoGamers.com	2019-11-19 16:27:04.729359	\N	
116	Antara Kalbar	2019-11-19 16:27:05.799812	\N	
117	Koran Tempo	2019-11-19 16:27:07.991403	2019-11-19 17:18:47	
118	Elle Indonesia	2019-11-19 16:27:13.544924	\N	
119	Emitennews.com	2019-11-19 16:27:22.057377	\N	Emitennews.com
120	Koran Wawasan	2019-11-19 16:27:25.603562	\N	
121	Energy World	2019-11-19 16:27:28.331653	\N	
122	Pikiran Rakyat	2019-11-19 16:27:30.825211	\N	www.pikiran-rakyat.com
123	energynusantara.com	2019-11-19 16:27:35.575625	\N	energynusantara.com
124	Indonesia Design	2019-11-19 16:27:38.91217	\N	
125	KoranIndonesia.id	2019-11-19 16:27:42.943111	\N	Koranindonesia.id
126	ESDM.go.id	2019-11-19 16:27:43.007587	\N	ESDM.go.id
127	Indonesia Gaming Arena	2019-11-19 16:27:44.328751	\N	
128	Indonesia Shang Bao	2019-11-19 16:27:49.527103	\N	
129	Esports.id	2019-11-19 16:27:49.811217	\N	Esports.id
110	Antaranews	2019-11-19 16:26:56.234563	2019-11-19 16:27:50	Antaranews.com
130	Suara Merdeka	2019-11-19 16:27:51.650329	\N	https://www.suaramerdeka.com/
132	Indonesiatatler.com	2019-11-19 16:27:54.596523	\N	
133	Kotakgame.com	2019-11-19 16:27:57.343783	\N	Kotakgame.com
134	Indotelko.com	2019-11-19 16:28:00.228898	\N	
135	Planetyar.com	2019-11-19 16:28:04.851819	\N	Planetyar.com
136	Industry.co.id	2019-11-19 16:28:05.452605	\N	
137	Krjogja.com	2019-11-19 16:28:09.359515	\N	Krjogja.com
138	FAJAR BALI	2019-11-19 16:28:10.012505	\N	
139	Platts.com	2019-11-19 16:28:10.186725	\N	Platts.com
140	ANTV	2019-11-19 16:28:10.912006	\N	
141	iNews TV	2019-11-19 16:28:11.53267	\N	
142	iNews.id	2019-11-19 16:28:16.692623	\N	
143	Female My Trip	2019-11-19 16:28:17.403607	\N	
144	Suara Merdeka Biro Kota Semarang	2019-11-19 16:28:20.200054	\N	https://www.suaramerdeka.com/
145	Infligt Magazine Sriwijaya	2019-11-19 16:28:22.598751	\N	
146	Kumparan.com	2019-11-19 16:28:23.935138	\N	Kumparan.com
147	Info Bank	2019-11-19 16:28:28.450213	\N	
148	Femina.co.id	2019-11-19 16:28:32.00615	\N	Femina.co.id
149	Pojoksulsel.com (Jawa Pos News Network /JPNN Group)	2019-11-19 16:28:32.60457	\N	
150	Info Franchise	2019-11-19 16:28:33.898079	\N	
151	Info Komputer	2019-11-19 16:28:39.196681	\N	
152	Pontianak Post	2019-11-19 16:28:39.449676	\N	
153	Fimela.com	2019-11-19 16:28:39.463132	\N	Fimela.com
154	Infobdg	2019-11-19 16:28:45.171214	\N	
155	Popbela.com	2019-11-19 16:28:45.619404	\N	
156	Forbes Indonesia	2019-11-19 16:28:45.925824	\N	
157	Suara Nusantara	2019-11-19 16:28:49.347499	\N	https://suaranusantara.com/
158	Aplikasi-android.net	2019-11-19 16:28:49.890925	\N	Aplikasi-android.net
159	infoSumbar	2019-11-19 16:28:50.269418	\N	
160	Forum	2019-11-19 16:28:54.498562	\N	
161	Lintasmedan.com	2019-11-19 16:28:55.427838	\N	lintasmedan.com
162	Inigame.id	2019-11-19 16:28:58.327846	\N	
163	Portalsains.org	2019-11-19 16:29:03.316044	\N	Portalsains.org
164	Arcom.co.id	2019-11-19 16:29:03.681684	\N	Arcom.co.id
165	Inilah.com	2019-11-19 16:29:04.22904	\N	
166	GadgetDiva.id	2019-11-19 16:29:04.683088	\N	GadgetDiva.id
167	Liputan6.com	2019-11-19 16:29:04.779483	\N	Liputan6.com
168	Inilahkoran	2019-11-19 16:29:09.342127	\N	
169	POS BALI	2019-11-19 16:29:09.829693	\N	
170	Arek TV Jatim	2019-11-19 16:29:12.189275	\N	
171	Listrik Indonesia	2019-11-19 16:29:13.400498	\N	
172	Gadgetren.com	2019-11-19 16:29:13.869254	\N	Gadgetren.com
173	PR Fotografer	2019-11-19 16:29:15.164742	\N	
174	Inside Internasional Industrial	2019-11-19 16:29:15.553256	\N	
175	Suara Pembaruan	2019-11-19 16:29:17.055953	\N	https://sp.beritasatu.com/
176	PR Newswire Asia	2019-11-19 16:29:19.959406	\N	
177	Inspira Groups	2019-11-19 16:29:21.187862	\N	
178	Teknojurnal.com	2019-11-19 16:29:21.417327	\N	Teknojurnal.com
179	Arenalte.com	2019-11-19 16:29:21.999605	\N	Arenalte.com
180	Lite FM	2019-11-19 16:29:23.892191	\N	
181	Prestige Indonesia	2019-11-19 16:29:24.765414	\N	
182	Suara	2019-11-19 16:29:26.57184	\N	Suara.com
183	IntiWarta.Com	2019-11-19 16:29:26.697796	\N	
184	Gadgetsquad.id	2019-11-19 16:29:28.265009	\N	Gadgetsquad.id
185	Priangga.web.id	2019-11-19 16:29:30.47	\N	Priangga.web.id
186	Investor Daily	2019-11-19 16:29:31.629621	\N	
187	Suarakarya.id	2019-11-19 16:29:32.683626	\N	Suarakarya.id
188	Gadis.co.id	2019-11-19 16:29:34.891352	\N	Gadis.co.id
189	Arifdoit.com	2019-11-19 16:29:35.792918	\N	Arifdoit.com
190	Lostinparadise.web.id	2019-11-19 16:29:38.09197	\N	Lostinparadise.web.id
191	Pricebook	2019-11-19 16:29:38.19708	\N	Pricebook.co.id
192	IPPF (Independent Power Producers Forum)	2019-11-19 16:29:38.559993	\N	
193	Suarakawan.com	2019-11-19 16:29:41.07847	\N	Suarakawan.com
194	Printex	2019-11-19 16:29:42.543249	\N	
196	Property & Bank	2019-11-19 16:29:47.668022	\N	
197	Magazine.job-like.com	2019-11-19 16:29:48.35429	\N	Magazine.job-like.com
198	Suaratangerang.com	2019-11-19 16:29:48.45332	\N	Suaratangerang.com
199	Galamedia	2019-11-19 16:29:49.214152	\N	
200	Itoday.co.id	2019-11-19 16:29:49.389804	\N	
201	Property Indonesia	2019-11-19 16:29:53.027087	\N	
202	Arifwahyu.com	2019-11-19 16:29:53.918084	\N	Arifwahyu.com
203	Sugengmu.org	2019-11-19 16:29:55.288155	\N	Sugengmu.org
204	Ituaja.com	2019-11-19 16:29:55.392621	\N	
205	Gamebrott.com	2019-11-19 16:29:56.784636	\N	Gamebrott.com
206	Majalah CEO	2019-11-19 16:29:58.481714	\N	
207	Property Inside	2019-11-19 16:29:58.61181	\N	
208	Itv-channel.com	2019-11-19 16:30:00.541142	\N	
209	GameQQ.net	2019-11-19 16:30:04.040011	\N	GameQQ.net
210	Asatu.id	2019-11-19 16:30:04.346414	\N	Asatu.id
211	Propertyandthecity.com	2019-11-19 16:30:04.796351	\N	Propertyandthecity.com
212	Jabar Ekspres	2019-11-19 16:30:05.726347	\N	
213	Majalah Ouch!	2019-11-19 16:30:05.791605	\N	
215	Gamescore.id	2019-11-19 16:30:11.544567	\N	Gamescore.id
216	Jabartoday.com	2019-11-19 16:30:13.385125	\N	
217	Majalahkartini.co.id	2019-11-19 16:30:14.479778	\N	Majalahkartini.co.id
218	PRSSNI	2019-11-19 16:30:15.064781	\N	
219	Aura.co.id	2019-11-19 16:30:17.309395	\N	Aura.co.id
220	Jagatgadget.com	2019-11-19 16:30:18.503686	\N	
221	Sumatera Hari Ini	2019-11-19 16:30:19.556461	\N	
222	Gamestation.id	2019-11-19 16:30:19.663237	\N	Gamestation.id
223	Majalahpraise.com	2019-11-19 16:30:23.441622	\N	Majalahpraise.com
224	Jagatreview.com	2019-11-19 16:30:23.688155	\N	
225	Ganlop.com	2019-11-19 16:30:27.092826	\N	Ganlop.com
226	Auto Radio 88.9 Fm Bandung	2019-11-19 16:30:27.260671	\N	
227	Jak FM	2019-11-19 16:30:28.229005	\N	
228	Makassar Terkini	2019-11-19 16:30:29.977181	\N	
229	Gantinama.com	2019-11-19 16:30:34.795727	\N	Gantinama.com
214	Provoke-online.com	2019-11-19 16:30:10.573421	2019-11-19 16:42:16	Provoke-online.com
230	PulsaTV.com	2019-11-19 16:30:34.999942	\N	
231	Autodigest.co	2019-11-19 16:30:36.49468	\N	Autodigest.co
232	Jakartakita.com	2019-11-19 16:30:37.652202	\N	
233	Male.co.id	2019-11-19 16:30:39.430892	\N	Male.co.id
234	GaptekUpdate.com	2019-11-19 16:30:42.464247	\N	GaptekUpdate.com
235	 Jalantikus.com	2019-11-19 16:30:42.904913	\N	
236	Sumedang Ekspres (Jawa Pos Group)	2019-11-19 16:30:43.097792	\N	https://www.sumedangekspres.com/
237	Marieclaire.co.id	2019-11-19 16:30:47.415718	\N	Marieclaire.co.id
238	Jambi Ekspres	2019-11-19 16:30:48.267221	\N	
239	BloggerBanua.com	2019-11-19 16:30:52.781769	\N	BloggerBanua.com
240	Jambiindependent.com	2019-11-19 16:30:53.473402	\N	
241	Sumut Pos	2019-11-19 16:30:54.972309	\N	Sumutpos.co
242	Pungkyprayitno.com	2019-11-19 16:30:56.66189	\N	
243	Jangantulalit.com	2019-11-19 16:30:58.648762	\N	
244	Autonetmagz.com	2019-11-19 16:31:00.58446	\N	Autonetmagz.com
245	Radar Bandung	2019-11-19 16:31:01.065967	\N	
246	Gatra.com	2019-11-19 16:31:02.049139	\N	Gatra.com
247	Jarwadi.me	2019-11-19 16:31:03.728013	\N	
248	Jateng Pos	2019-11-19 16:31:09.068413	\N	
249	Gayagaul.com	2019-11-19 16:31:09.639917	\N	Gayagaul.com
250	JATENG POS	2019-11-19 16:31:14.684215	\N	
251	Genmuda.com	2019-11-19 16:31:15.578142	\N	Genmuda.com
252	Surabaya TV	2019-11-19 16:31:16.719836	\N	http://surabayatv.tv/
254	Ayahbunda	2019-11-19 16:31:17.420627	\N	
255	Jawa Pos	2019-11-19 16:31:19.919968	\N	
256	Get Lost	2019-11-19 16:31:22.360848	\N	
257	Jawa Pos Koran	2019-11-19 16:31:25.088633	\N	
258	Getaway!	2019-11-19 16:31:28.202614	\N	
259	Ayooberita.com	2019-11-19 16:31:30.526725	\N	Ayooberita.com
260	Jawa Pos Metropolitan	2019-11-19 16:31:31.601071	\N	
261	Jawa Pos Radar Semarang	2019-11-19 16:31:36.809178	\N	
262	GGWP.id	2019-11-19 16:31:37.875298	\N	GGWP.id
263	Surabayapost.id	2019-11-19 16:31:38.397094	\N	Surabayapost.id
264	Jawapos	2019-11-19 16:31:42.218018	\N	
265	Radar Bute	2019-11-19 16:31:44.456105	\N	
266	Bairuindra.com	2019-11-19 16:31:45.485736	\N	Bairuindra.com
267	Gizmologi.id	2019-11-19 16:31:45.797363	\N	Gizmologi.id
268	Jawapos Radar Jogja	2019-11-19 16:31:47.459995	\N	
269	Radar Cirebon	2019-11-19 16:31:50.220348	\N	
270	Global FM.Bali	2019-11-19 16:31:52.491508	\N	
271	Jawapos.com	2019-11-19 16:31:52.971022	\N	
272	Radar Kaltim	2019-11-19 16:31:54.626864	\N	
273	Bali News Network	2019-11-19 16:31:55.672454	\N	
274	Global News	2019-11-19 16:31:57.697006	\N	
275	Jawapostv	2019-11-19 16:31:58.798424	\N	
276	Radar Makassar	2019-11-19 16:31:59.15522	\N	
277	Surat Kabar Gebrak	2019-11-19 16:32:00.902379	\N	
278	Global Radio	2019-11-19 16:32:03.114026	\N	
279	Radar Semarang	2019-11-19 16:32:03.323144	\N	
280	JEK TV	2019-11-19 16:32:04.089422	\N	
281	Majalah Marketing	2019-11-19 16:32:05.230754	\N	Marketing.co.id
282	Bali Post	2019-11-19 16:32:06.207898	\N	
283	Radar Surabaya	2019-11-19 16:32:08.461501	\N	
284	Global TV	2019-11-19 16:32:08.536622	\N	
285	Journaljakarta.id	2019-11-19 16:32:09.215742	\N	
286	Radar Tasikmalaya	2019-11-19 16:32:12.241271	\N	
287	Globe Asia	2019-11-19 16:32:13.93535	\N	
288	JPNN.com	2019-11-19 16:32:15.237532	\N	
289	Marketplus.co.id	2019-11-19 16:32:18.631967	\N	Marketplus.co.id
290	GoHitz.com	2019-11-19 16:32:20.707206	\N	GoHitz.com
291	Bali Tribune	2019-11-19 16:32:23.283166	\N	
292	JTV	2019-11-19 16:32:24.791749	\N	
293	RadarOnline.id	2019-11-19 16:32:25.523254	\N	
294	Surya	2019-11-19 16:32:26.841664	\N	https://surabaya.tribunnews.com/
295	Markettrack.id	2019-11-19 16:32:28.163151	\N	Markettrack.id
296	Julajuli.com-ss media	2019-11-19 16:32:31.686637	\N	
297	GOOWES.co	2019-11-19 16:32:31.832745	\N	GOOWES.co
298	Juraganreview.com	2019-11-19 16:32:36.780605	\N	
299	Radio Ardan	2019-11-19 16:32:38.755532	\N	
300	Gridgames	2019-11-19 16:32:39.33005	\N	
301	Bandungnewsphoto.com	2019-11-19 16:32:39.867315	\N	Bandungnewsphoto.com
302	Matatelinga.com	2019-11-19 16:32:41.525062	\N	Matatelinga.com
303	Jurnal Sumatra	2019-11-19 16:32:42.426778	\N	
304	Radio Mercury	2019-11-19 16:32:43.759039	\N	
305	GridHealth.id	2019-11-19 16:32:47.238267	\N	GridHealth.id
306	JurnalAsia.id	2019-11-19 16:32:47.697892	\N	
307	Radio PRFM Bdg	2019-11-19 16:32:48.244631	\N	
308	Cakrawala Susindra	2019-11-19 16:32:48.497028	\N	Susindra.com
309	Medan Bisnis	2019-11-19 16:32:50.374663	\N	
310	Griya Asri	2019-11-19 16:32:52.298369	\N	
311	Radio SONORA Bdg	2019-11-19 16:32:52.942403	\N	
312	Jurnaltrans.com	2019-11-19 16:32:53.066074	\N	
313	Sutoro.web.id	2019-11-19 16:32:54.76822	\N	Sutoro.web.id
314	GTV	2019-11-19 16:32:57.83393	\N	
315	Jurnas.com	2019-11-19 16:32:58.194122	\N	
316	Medcom.id	2019-11-19 16:32:59.398697	\N	Medcom.id
317	Batak Pos Bersinar	2019-11-19 16:32:59.776653	\N	
318	Radio SPFM Makassar	2019-11-19 16:33:00.241753	\N	
319	Kabarbisnis.com	2019-11-19 16:33:03.31458	\N	
320	Gudanggaming.com	2019-11-19 16:33:04.009129	\N	Gudanggaming.com
321	Radio Trijaya FM Palembang	2019-11-19 16:33:04.734287	\N	
322	KabarMedan.com	2019-11-19 16:33:08.809413	\N	
323	Rahmiaziza.com	2019-11-19 16:33:09.507846	\N	
324	SWA	2019-11-19 16:33:11.285784	\N	Swa.co.id
325	Guideku.com	2019-11-19 16:33:11.564851	\N	Guideku.com
326	Raka FM	2019-11-19 16:33:13.385794	\N	
327	BedahGadget.com	2019-11-19 16:33:13.52926	\N	BedahGadget.com
328	Kabarpadang.com	2019-11-19 16:33:14.261619	\N	
329	Rakyat merdeka	2019-11-19 16:33:17.43625	\N	
330	Swara.tunaiku.com	2019-11-19 16:33:18.070559	\N	Swara.tunaiku.com
331	Haibunda.com	2019-11-19 16:33:19.230513	\N	Haibunda.com
332	Media Indonesia	2019-11-19 16:33:19.372736	\N	Mediaindonesia.com
333	kalsel.antaranews.com	2019-11-19 16:33:19.946032	\N	
334	RBTV	2019-11-19 16:33:22.12052	\N	
335	Berempat.com	2019-11-19 16:33:23.446583	\N	Berempat.com
336	HALUAN RIAU	2019-11-19 16:33:25.292466	\N	
337	Kalstar	2019-11-19 16:33:25.330292	\N	
338	Realitas	2019-11-19 16:33:26.016053	\N	
339	Tabloid Bintang Indonesia	2019-11-19 16:33:27.333257	\N	
340	MEDIA SEMARANG	2019-11-19 16:33:28.520359	\N	
341	Registry Indonesia	2019-11-19 16:33:29.588026	\N	
342	Kanalsatu.com	2019-11-19 16:33:31.279797	\N	
343	Tabloid Destinasi Bandung	2019-11-19 16:33:33.146818	\N	
344	Kantor Berita Antara Biro Jabar	2019-11-19 16:33:36.780859	\N	
345	Media Surabaya	2019-11-19 16:33:36.916336	\N	
346	Berita Jateng	2019-11-19 16:33:36.961855	\N	Berita Jateng
347	Hangoutindo.com	2019-11-19 16:33:37.171742	\N	Hangoutindo.com
348	Tabloid Wanita Indonesia	2019-11-19 16:33:38.604341	\N	
349	Kapanlagi Network	2019-11-19 16:33:42.55332	\N	
350	Tabloidnyata.com	2019-11-19 16:33:44.276512	\N	Tabloidnyata.com
351	Mediacenter.riau.go.id	2019-11-19 16:33:44.888833	\N	Mediacenter.riau.go.id
352	Hardwareholic.com	2019-11-19 16:33:45.224529	\N	Hardwareholic.com
353	Republika	2019-11-19 16:33:47.012089	\N	www.republika.co.id
354	Berita Kota Makassar	2019-11-19 16:33:48.360124	\N	
355	Berita Kota Makassar	2019-11-19 16:33:48.365914	\N	
356	Kapanlagi.com	2019-11-19 16:33:48.87738	\N	
357	Harian Bangsa	2019-11-19 16:33:50.747763	\N	
358	Mediaindonesia.com	2019-11-19 16:33:53.270487	\N	Mediaindonesia.com
359	PULSA	2019-11-19 16:33:53.893535	\N	Tabloidpulsa.co.id
360	Republika TV	2019-11-19 16:33:57.261205	\N	
361	Kaskus	2019-11-19 16:33:58.012086	\N	
362	Harian Berita Khatulistiwa	2019-11-19 16:33:58.779776	\N	
363	Mediaprofesi.com	2019-11-19 16:34:02.606081	\N	Mediaprofesi.com
364	Kata Data	2019-11-19 16:34:05.208467	\N	
365	Berita Metro	2019-11-19 16:34:05.683046	\N	
366	Harian Central	2019-11-19 16:34:06.127214	\N	
367	Review1st.com	2019-11-19 16:34:08.058405	\N	
368	Memorandum	2019-11-19 16:34:09.629145	\N	
369	Harian Fajar	2019-11-19 16:34:12.734451	\N	
370	Katadata.co.id	2019-11-19 16:34:14.066497	\N	
371	Meprindo Media Group	2019-11-19 16:34:16.395395	\N	
372	Berita Satu TV	2019-11-19 16:34:16.542189	\N	
373	Harian Go Cakrawala	2019-11-19 16:34:18.01407	\N	
374	Katasumbar.com	2019-11-19 16:34:19.464619	\N	
375	Tamasya	2019-11-19 16:34:21.198724	\N	Tamasyaku.com
376	Berita Sore	2019-11-19 16:34:24.522467	\N	
377	Kedaulatan Rakyat	2019-11-19 16:34:25.450561	\N	
378	Harian Haluan	2019-11-19 16:34:26.373476	\N	
379	Tambang	2019-11-19 16:34:27.271718	\N	
380	ReviewCorner.id	2019-11-19 16:34:30.112854	\N	
381	Keluargabiru.com	2019-11-19 16:34:31.149233	\N	
382	Harian Indonesia	2019-11-19 16:34:32.332776	\N	
383	Merdeka.com	2019-11-19 16:34:33.894915	\N	Merdeka.com
384	Tangerangnews.com	2019-11-19 16:34:34.345632	\N	
385	Riau Pos	2019-11-19 16:34:34.40771	\N	
386	Beritabuana.co	2019-11-19 16:34:36.670385	\N	Beritabuana.co
387	Kincir.com	2019-11-19 16:34:37.427576	\N	
388	Rikaverry	2019-11-19 16:34:38.275147	\N	
389	Harian Jogja	2019-11-19 16:34:39.193249	\N	
390	Rilisiana.com	2019-11-19 16:34:42.591067	\N	
391	Metaco.gg	2019-11-19 16:34:42.883014	\N	Metaco.gg
392	Kiss FM	2019-11-19 16:34:43.070364	\N	
393	Rockomotif.com	2019-11-19 16:34:46.586187	\N	
394	Beritadewata.com	2019-11-19 16:34:48.507316	\N	Beritadewata.com
395	Metro Bali	2019-11-19 16:34:49.446143	\N	
396	Kiss FM Medan	2019-11-19 16:34:49.804696	\N	
397	Harian Jurnal Asia	2019-11-19 16:34:50.089391	\N	
398	RRI	2019-11-19 16:34:50.574264	\N	
399	Tech In Asia	2019-11-19 16:34:53.415716	\N	techinasia.com
400	RRI MEDAN	2019-11-19 16:34:54.655917	\N	
401	Harian KOMENTAR	2019-11-19 16:34:55.509041	\N	
402	Metro Pembaharuan	2019-11-19 16:34:56.246462	\N	
403	KLCBS Radio Bandung	2019-11-19 16:34:56.736264	\N	
404	RRI On Line	2019-11-19 16:34:58.783459	\N	
405	Harian Koran Kaltim	2019-11-19 16:35:00.199445	\N	
406	Metro TV	2019-11-19 16:35:03.441787	\N	
407	Beritajatim.com	2019-11-19 16:35:04.960109	\N	Beritajatim.com
408	Harian Kun Dian Ri Bao	2019-11-19 16:35:05.161214	\N	
409	Techdaily.id	2019-11-19 16:35:07.066717	\N	Techdaily.id
410	Harian Medan Pos	2019-11-19 16:35:10.416879	\N	
411	Metro24jam	2019-11-19 16:35:10.422901	\N	
412	Techijau.com	2019-11-19 16:35:10.853147	\N	
413	Harian METRO	2019-11-19 16:35:16.382895	\N	
414	Techno Konstruksi	2019-11-19 16:35:17.909862	\N	
415	RRI.co.id	2019-11-19 16:35:22.487619	\N	
416	Harian Orbit	2019-11-19 16:35:22.894602	\N	
417	Technologue.id	2019-11-19 16:35:24.637978	\N	Technologue.id
418	Beritajatim.com	2019-11-19 16:35:25.912706	\N	Beritajatim.com
419	RTV	2019-11-19 16:35:27.389968	\N	
420	Metrojateng.com	2019-11-19 16:35:27.429003	\N	Metrojateng.com
421	Harian Pagi Jambi Independent	2019-11-19 16:35:28.184015	\N	
422	Technosightz.com	2019-11-19 16:35:31.371228	\N	Technosightz.com
423	Rumah.com	2019-11-19 16:35:31.610567	\N	
424	Harian Portibi DNP	2019-11-19 16:35:33.908314	\N	
425	Migasnesia.com	2019-11-19 16:35:36.864962	\N	Migasnesia.com
426	Rumah123.com	2019-11-19 16:35:37.952796	\N	
427	Techpod	2019-11-19 16:35:38.244403	\N	
428	HARIAN RADAR PEKALONGAN	2019-11-19 16:35:39.202546	\N	
429	Rumahhokie.com	2019-11-19 16:35:43.280809	\N	
430	Mimbar Umum	2019-11-19 16:35:43.623301	\N	
431	Harian SIB Medan	2019-11-19 16:35:44.408186	\N	
432	Tek.id	2019-11-19 16:35:46.263791	\N	Tek.id
433	Rumahku	2019-11-19 16:35:47.138938	\N	
434	Harian Sinar Indonesia	2019-11-19 16:35:49.520986	\N	
435	Miner's Life	2019-11-19 16:35:49.985725	\N	
436	Sajiansedap.grid.id	2019-11-19 16:35:50.942406	\N	
437	Teknogav.com	2019-11-19 16:35:52.968414	\N	Teknogav.com
438	Samarinda Pos	2019-11-19 16:35:54.696063	\N	
439	Harian Singgalang	2019-11-19 16:35:55.155177	\N	
440	Mix Marketing	2019-11-19 16:35:56.271017	\N	
441	Teknojurnal.com	2019-11-19 16:35:59.449792	\N	Teknojurnal.com
442	Harian Sumut24	2019-11-19 16:36:00.125822	\N	
443	MNC Channels Auto & Gadget	2019-11-19 16:36:02.54536	\N	
444	Harian Surya	2019-11-19 16:36:05.198941	\N	
445	Telset.id	2019-11-19 16:36:06.317202	\N	Telset.id
446	Beritasatu.com	2019-11-19 16:36:07.380119	\N	Beritasatu.com
447	MNC Channels Games	2019-11-19 16:36:09.227628	\N	
448	Sandiiswahyudi.com	2019-11-19 16:36:10.775408	\N	Sandiiswahyudi.com
449	Harian Topmetro	2019-11-19 16:36:11.293683	\N	
450	Harian Tribun	2019-11-19 16:36:16.290844	\N	
451	Beritasurabaya.net	2019-11-19 16:36:21.244239	\N	Beritasurabaya.net
452	Harian Umum Palembang Ekspres	2019-11-19 16:36:22.386867	\N	
453	MNC Radio	2019-11-19 16:36:25.215373	\N	
454	Sayangianak.com	2019-11-19 16:36:28.835417	\N	Sayangianak.com
455	MNC Trijaya	2019-11-19 16:36:32.720599	\N	
456	Beritasurabayaonline.net	2019-11-19 16:36:35.414379	\N	Beritasurabayaonline.net
457	TEMPO	2019-11-19 16:36:36.32795	\N	Tempo.co
458	SCTV	2019-11-19 16:36:37.514668	\N	
459	MNC TV	2019-11-19 16:36:38.42242	\N	
460	SCTV Jogjakarta	2019-11-19 16:36:41.906233	\N	
461	Mobil123.com	2019-11-19 16:36:46.309192	\N	Mobil123.com
462	SE 88,1 FM	2019-11-19 16:36:46.4197	\N	
463	BeritaTeknologi.com	2019-11-19 16:36:46.598564	\N	BeritaTeknologi.com
464	Selular.ID	2019-11-19 16:36:51.166622	\N	Selular.ID
465	The Jakarta Post	2019-11-19 16:36:53.097124	\N	thejakartapost.com
466	Mobileague.id	2019-11-19 16:36:54.599517	\N	Mobileague.id
467	Bintang Home	2019-11-19 16:36:57.983428	\N	
468	Semarangcoret.com	2019-11-19 16:36:58.53922	\N	Semarangcoret.com
469	Mobiliari Group	2019-11-19 16:37:00.678768	\N	
470	The Oil & Gas Year	2019-11-19 16:37:00.688608	\N	
471	Sentra listrik	2019-11-19 16:37:03.319904	\N	
195	Gadtorade	2019-11-19 16:29:43.007179	2019-11-19 16:37:06	
472	Theasianparent.com	2019-11-19 16:37:07.11365	\N	Theasianparent.com
474	Mobilkomersial.com	2019-11-19 16:37:09.008696	\N	Mobilkomersial.com
475	Biskom	2019-11-19 16:37:09.653686	\N	
476	Bisnis Bali	2019-11-19 16:37:18.238745	\N	
477	Mobilmotor	2019-11-19 16:37:20.650616	\N	
478	Bisnis Indonesia	2019-11-19 16:37:27.436607	\N	
479	Thomson Routers	2019-11-19 16:37:27.636792	\N	https://www.thomsonreuters.com/
480	Mobitekno.com	2019-11-19 16:37:29.448591	\N	Mobitekno.com
481	Momdadi.com	2019-11-19 16:37:36.604277	\N	Momdadi.com
482	Bisnis Indonesia Weekend	2019-11-19 16:37:39.258706	\N	
483	Monitor.co.id	2019-11-19 16:37:45.775968	\N	Monitor.co.id
484	Bisnis Jakarta	2019-11-19 16:37:47.365498	\N	
485	Mother & Baby	2019-11-19 16:37:53.96243	\N	
486	Bisnis Surabaya	2019-11-19 16:37:56.095439	\N	
487	My Trip	2019-11-19 16:37:59.598417	\N	
488	Bisnis TV	2019-11-19 16:38:06.116989	\N	
489	Nakita.id	2019-11-19 16:38:08.605081	\N	Nakita.id
490	Tips Gadget	2019-11-19 16:38:12.300397	\N	
491	Bisnis.com	2019-11-19 16:38:16.975383	\N	Bisnis.com
492	Neraca	2019-11-19 16:38:18.708554	\N	
473	Siar.com	2019-11-19 16:37:07.83341	2019-11-19 16:38:19	Siar.com
493	TipsPintar.com	2019-11-19 16:38:21.955375	\N	TipsPintar.com
494	Tiras.co	2019-11-19 16:38:28.291154	\N	Tiras.co
495	Bisniswisata.co.id	2019-11-19 16:38:28.632272	\N	Bisniswisata.co.id
253	Marketeers	2019-11-19 16:31:16.73322	2019-11-19 16:38:31	Marketeers.com
496	NET TV	2019-11-19 16:38:32.464948	\N	
497	Tirto.id	2019-11-19 16:38:35.021361	\N	Tirto.id
498	Network	2019-11-19 16:38:38.603085	\N	
499	Tourismvaganza.com	2019-11-19 16:38:40.602255	\N	Tourismvaganza.com
500	News Today	2019-11-19 16:38:45.953668	\N	
501	BlackXperience.com	2019-11-19 16:38:49.879232	\N	BlackXperience.com
502	News.Babe.co.id	2019-11-19 16:38:52.640427	\N	
503	Tplus	2019-11-19 16:38:54.379455	\N	http://www.tplus.id/
504	Newsmodo.com	2019-11-19 16:38:59.116612	\N	
505	Trans7	2019-11-19 16:39:00.260193	\N	
506	Blogdokter.net	2019-11-19 16:39:01.83957	\N	Blogdokter.net
507	Nextren.grid.id	2019-11-19 16:39:07.923737	\N	Nextren.grid.id
508	NGONOO.COM	2019-11-19 16:39:16.133844	\N	NGONOO.COM
509	BloggerBorneo.Com	2019-11-19 16:39:16.643201	\N	BloggerBorneo.Com
510	Travelounge	2019-11-19 16:39:17.518057	\N	https://travelounge.co/
511	Nova	2019-11-19 16:39:24.73569	\N	
512	Bloomberg	2019-11-19 16:39:29.323076	\N	
513	O Channel	2019-11-19 16:39:31.385064	\N	
514	Travelxpose	2019-11-19 16:39:37.536737	\N	https://www.travelxpose.com/
515	Obrolanbisnis.com	2019-11-19 16:39:39.830666	\N	Obrolanbisnis.com
516	OilGas	2019-11-19 16:39:48.785315	\N	
517	Trendingtek	2019-11-19 16:40:01.150039	\N	https://www.trendingtek.com/
518	Okezone.com	2019-11-19 16:40:01.604714	\N	Okezone.com
519	Booze Magazine	2019-11-19 16:40:06.671349	\N	
520	Otodriver.com	2019-11-19 16:40:10.126986	\N	Otodriver.com
521	Trendtech.id	2019-11-19 16:40:11.277436	\N	Trendtech.id
522	Trenteknologi.com	2019-11-19 16:40:17.104515	\N	Trenteknologi.com
523	Otosia.com	2019-11-19 16:40:17.997312	\N	Otosia.com
524	Brilio.net	2019-11-19 16:40:24.381761	\N	Brilio.net
525	Otospirit.com	2019-11-19 16:40:26.072009	\N	Otospirit.com
526	Ototrend.com	2019-11-19 16:40:34.546274	\N	Ototrend.com
527	Tribun Jabar	2019-11-19 16:40:35.381424	\N	https://jabar.tribunnews.com/
528	Bumi Skk Migas	2019-11-19 16:40:36.646331	\N	
529	Overclockingid.com	2019-11-19 16:40:43.298735	\N	Overclockingid.com
530	Bungo Pos	2019-11-19 16:40:49.16034	\N	
531	Bute Ekspres	2019-11-19 16:41:00.029423	\N	
532	Tribunnews	2019-11-19 16:41:00.48091	\N	https://tribunnews.com/
533	Cantika.com	2019-11-19 16:41:07.694415	\N	
534	Carmudi.co.id	2019-11-19 16:41:17.227954	\N	Carmudi.co.id
535	Tribun Jatim	2019-11-19 16:41:27.597516	\N	https://jatim.tribunnews.com/
536	Exploid.gg	2019-11-19 16:41:30.240117	\N	Exploid.gg
537	Carvaganza.com	2019-11-19 16:41:35.93863	\N	Carvaganza.com
538	Tribun Jogja	2019-11-19 16:41:45.555202	\N	https://jogja.tribunnews.com/
539	Celebesonlina.com	2019-11-19 16:41:47.544613	\N	Celebesonlina.com
540	Centroone.com	2019-11-19 16:42:01.517942	\N	Centroone.com
541	Tribun Manado	2019-11-19 16:42:08.739444	\N	https://manado.tribunnews.com/
542	Cewekbanget.grid.id	2019-11-19 16:42:19.071639	\N	Cewekbanget.grid.id
543	Tribun Sumsel	2019-11-19 16:42:24.967857	\N	https://sumsel.tribunnews.com/
544	City Radio 95.9 FM Medan	2019-11-19 16:42:42.394171	\N	
545	Tribun Timur	2019-11-19 16:42:54.390846	\N	https://makassar.tribunnews.com/
546	CMO Asia	2019-11-19 16:43:08.84717	\N	
547	Trinaya Media	2019-11-19 16:43:18.073406	\N	
548	CNBC TV	2019-11-19 16:43:18.658088	\N	
131	Pinkkorset.com	2019-11-19 16:27:53.012965	2019-11-19 16:43:27	Pinkkorset.com
549	Cnbcindonesia.com	2019-11-19 16:43:35.798582	\N	Cnbcindonesia.com
550	Trinusantarareporter	2019-11-19 16:43:37.368093	\N	
551	Tuxlin Blog 	2019-11-19 16:43:50.420447	\N	tuxlin.com
552	TV One	2019-11-19 16:43:55.870702	\N	
553	CNN TV	2019-11-19 16:43:56.358261	\N	
554	TVRI Yogya	2019-11-19 16:44:02.855977	\N	
555	Uji-dulu.com	2019-11-19 16:44:09.718263	\N	Uji-dulu.com
556	CNNIndonesia.com	2019-11-19 16:44:17.126388	\N	CNNIndonesia.com
557	Coal Asia	2019-11-19 16:44:27.128841	\N	
558	Ujung Pandang Express	2019-11-19 16:44:32.069039	\N	http://upeks.fajar.co.id/
559	Petromindo.com	2019-11-19 16:44:32.836858	\N	Petromindo.com
560	Unbox.id	2019-11-19 16:44:38.742594	\N	Unbox.id
561	Colours of Garuda Indonesia	2019-11-19 16:44:39.453197	\N	
562	Uniekkaswarganti.com	2019-11-19 16:44:46.88987	\N	Uniekkaswarganti.com
563	Cosmopolitan	2019-11-19 16:44:48.944774	\N	
564	Upstream Oil & Gas	2019-11-19 16:44:52.825439	\N	
565	Urbanasia.media	2019-11-19 16:44:59.272811	\N	Urbanasia.media
566	Cyberthreat.id	2019-11-19 16:44:59.353224	\N	Cyberthreat.id
567	DAAI TV	2019-11-19 16:45:11.627708	\N	
568	urbandigital.id	2019-11-19 16:45:11.750617	\N	urbandigital.id
569	Republika.co.id	2019-11-19 16:45:12.872072	\N	Republika.co.id
570	Urbannewsid.com	2019-11-19 16:45:18.81644	\N	Urbannewsid.com
571	Daily Oktagon	2019-11-19 16:45:19.998946	\N	
572	Uzone.id	2019-11-19 16:45:25.453985	\N	Uzone.id
573	Dailysocial.id	2019-11-19 16:45:31.386436	\N	
574	Virgin Radio Jakarta	2019-11-19 16:45:32.271623	\N	
575	Viva.co.id	2019-11-19 16:45:38.17346	\N	Viva.co.id
576	Daman	2019-11-19 16:45:41.942167	\N	
577	Vradio	2019-11-19 16:45:44.436111	\N	
578	Dealstreet Asia	2019-11-19 16:45:57.608225	\N	
579	Warta Ekonomi	2019-11-19 16:46:03.563147	\N	Wartaekonomi.co.id
580	DestinAsiaMediaGroup	2019-11-19 16:46:19.118079	\N	
581	Warta Kota	2019-11-19 16:46:20.139397	\N	https://wartakota.tribunnews.com/
582	Wartaevent.com	2019-11-19 16:46:26.607803	\N	Wartaevent.com
583	Detik.com	2019-11-19 16:46:26.646776	\N	Detik.com
584	Wartapenanews.com	2019-11-19 16:46:38.643629	\N	Wartapenanews.com
585	Waspada	2019-11-19 16:47:05.941724	\N	http://waspada.id/
586	Waspadamedan.com	2019-11-19 16:47:12.099389	\N	Waspadamedan.com
587	Wawasan	2019-11-19 16:47:18.50906	\N	
588	Widyantiyuliandari.com	2019-11-19 16:47:24.487867	\N	Widyantiyuliandari.com
589	Wisatatabloid.com	2019-11-19 16:47:40.986991	\N	
590	Womantalk.com	2019-11-19 16:47:46.868571	\N	Womantalk.com
591	Xpose Indonesia	2019-11-19 16:47:51.974365	\N	
592	Yangcanggih.com	2019-11-19 16:47:57.9562	\N	Yangcanggih.com
593	Yohank.com	2019-11-19 16:48:06.022831	\N	Yohank.com
594	Youngster.id	2019-11-19 16:48:17.006491	\N	Youngster.id
595	Yourbandung	2019-11-19 16:48:24.989034	\N	
597	Zonagadget.co.id	2019-11-19 16:48:37.506287	\N	Zonagadget.co.id
596	Yukmakan	2019-11-19 16:48:29.998892	2019-11-19 16:49:09	https://www.yukmakan.com/
598	Alphanews	2019-11-19 17:21:44.877957	\N	
599	Urbanasia	2019-11-19 17:28:42.49588	\N	urbanasia.com
600	Best Indo Tech 	2019-11-22 11:05:02.206565	\N	Youtube
601	Billy Dolmen	2019-11-22 11:05:16.395452	\N	Youtube
602	DHIARCOM	2019-11-22 11:05:26.971078	\N	Youtube
603	GadgetApa	2019-11-22 11:05:36.545313	\N	Youtube
604	GadgetEmpire	2019-11-22 11:05:47.446364	\N	Youtube
605	Gadgetin	2019-11-22 11:05:56.965845	\N	Youtube
606	GadgetGaul.com	2019-11-22 11:06:06.356648	\N	Youtube
607	Gaptech.id	2019-11-22 11:06:19.867491	\N	Youtube
608	Gadgetainment	2019-11-22 11:06:43.079801	\N	Youtube
609	K2 Gadget	2019-11-22 11:06:50.226876	\N	Youtube
610	NerdReview	2019-11-22 11:07:02.381237	\N	Youtube
611	Project Review	2019-11-22 11:07:12.008562	\N	Youtube
612	Pizza Gadget	2019-11-22 11:07:20.486359	\N	Youtube
613	Sheggario	2019-11-22 11:07:30.259196	\N	Youtube
614	Taufik Nobo	2019-11-22 11:07:41.221518	\N	Youtube
615	Teknologue	2019-11-22 11:07:52.290752	\N	Youtube
616	Arrinish	2019-11-22 11:08:03.602551	\N	Youtube
617	Mellisa Novianti	2019-11-22 11:24:08.845728	\N	Youtube
618	Majalahbandara.com	2019-11-26 16:34:44.704272	\N	majalahbandara.com
619	Dirgantara.co.id	2019-11-26 16:36:11.085231	\N	
620	Angkasa.news	2019-11-26 16:37:32.727742	\N	Angkasa.news
621	Airmagz.com	2019-11-26 16:37:48.13444	\N	www.Airmagz.com
622	Aviasi Magazine	2019-11-26 16:38:55.96245	\N	www.aviasimagazine.com
623	Indo Aviation	2019-11-26 16:39:23.707695	\N	https://indoaviation.asia/
624	Indo Militer	2019-11-26 16:39:51.476815	\N	www.indomiliter.com
625	Airport.id	2019-11-26 16:40:01.684194	\N	Airport.id
626	Colours of Garuda Indonesia	2019-11-26 16:57:15.027913	\N	
627	Infligt Magazine Sriwijaya	2019-11-26 16:58:03.027708	\N	
628	AirSpace Review	2019-11-26 16:58:36.375099	\N	
629	Majalah Transportasi	2019-11-26 16:58:55.128689	\N	
630	Terbang.id	2019-11-26 16:59:37.03848	\N	www.Terbang.id
631	Telset TV	2019-12-03 11:14:32.667953	\N	
632	KenjoY	2019-12-03 11:21:30.632445	\N	Youtube
633	Up to date IDN	2019-12-03 11:23:22.186658	\N	Youtube
634	DrivenHype.com	2019-12-04 10:27:03.251993	\N	DrivenHype.com
635	DealSteetAsia	2019-12-04 11:23:17.614778	\N	
636	Berita Satu TV	2019-12-04 12:08:04.338985	\N	
637	MNC Trijaya FM	2019-12-04 12:25:19.442402	\N	
638	POP FM	2019-12-04 12:33:48.817155	\N	
639	GwiGwi	2019-12-04 12:52:40.24802	\N	
640	Massmobi	2019-12-04 14:15:35.258292	\N	Youtube
641	GenFM	2019-12-05 10:37:47.700057	\N	
642	Hot 93,2 FM	2019-12-05 10:38:19.3534	\N	
643	Mustang 88,0 FM	2019-12-05 10:38:56.218379	\N	
644	Mustang 88,0 FM	2019-12-05 10:38:56.256199	\N	
645	GayaGaul.com	2019-12-05 10:50:25.331384	\N	
646	Beritasatu TV	2019-12-05 10:51:33.815955	\N	
647	Portalsains.org	2019-12-05 10:51:54.524891	\N	
648	Jakarta Globe	2019-12-05 10:59:13.883638	\N	
649	Macro Ad	2019-12-05 11:23:42.189595	\N	Macroad.com
650	Merdeka 45	2019-12-05 11:37:11.247374	\N	
651	Poros Nusantara	2019-12-05 11:37:17.488035	\N	
652	Lira.com	2019-12-05 11:39:55.513502	\N	
653	Lira.com	2019-12-05 11:40:47.520078	\N	Lira.com
654	ninmediatvdesa	2019-12-05 13:40:48.883701	\N	
655	Suara Headline	2019-12-05 15:35:36.595385	\N	
656	Jak One	2019-12-05 15:37:34.735612	\N	
657	Asary TV	2019-12-05 17:09:24.763812	\N	
658	Asy'ari TV	2019-12-05 17:09:53.874112	\N	
659	File Magz	2019-12-06 10:36:19.082891	\N	filemagz.com
660	Indonesiainside.id	2019-12-06 13:50:24.998998	\N	
661	Destinasi Indonesia	2019-12-09 14:54:35.142767	\N	
662	Traveltext.id	2019-12-10 11:19:00.681508	\N	
663	Liburan Online	2019-12-10 11:22:07.079852	\N	
664	Pesona Indonesia	2019-12-10 11:22:56.455103	\N	
665	Traveletc.id	2019-12-11 11:58:53.94631	\N	
666	Tabloid Nyata	2019-12-11 13:11:05.414606	\N	
667	Woop.id	2019-12-19 16:18:15.689326	\N	
668	Garduoto.com	2019-12-20 13:00:53.147406	\N	
669	MD Media	2019-12-20 14:24:16.689759	\N	
670	Autos.id	2019-12-20 14:39:54.069134	\N	
671	Bukareview	2020-01-03 10:28:08.464372	\N	
672	Influencer	2020-01-04 15:36:58.041209	\N	
673	RiswanZone	2020-01-04 17:23:15.418126	\N	
674	Tekreviewer.com	2020-01-04 17:42:58.820924	\N	
675	Gadgetalk	2020-01-04 17:51:33.807643	\N	
\.


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu (id, name, page, id_menu_category) FROM stdin;
1	User Management	\N	1
2	Data Management	\N	1
3	Presence	presence	2
4	Report	report	2
\.


--
-- Data for Name: menu_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_category (id, name, created_at, updated_at) FROM stdin;
1	ADMINISTRATION	2019-10-28 16:36:16.99258	\N
2	FEATURE	2019-10-28 16:36:16.99258	\N
\.


--
-- Data for Name: presence_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.presence_list (id_journalist, id_event, is_present, presence_datetime, created_at, checkout_datetime, is_checked_out, is_additional) FROM stdin;
30	1	f	\N	2019-11-19 17:36:03.63624	\N	f	f
3	1	f	\N	2019-11-19 17:36:08.607516	\N	f	f
12	1	f	\N	2019-11-19 17:36:12.825136	\N	f	f
15	1	f	\N	2019-11-19 17:36:17.489139	\N	f	f
21	1	f	\N	2019-11-19 17:36:20.821814	\N	f	f
25	1	f	\N	2019-11-19 17:36:27.150721	\N	f	f
28	1	f	\N	2019-11-19 17:36:31.521485	\N	f	f
34	1	f	\N	2019-11-19 17:36:46.085873	\N	f	f
38	1	f	\N	2019-11-19 17:36:49.742662	\N	f	f
2	1	f	\N	2019-11-19 17:36:59.620565	\N	f	f
6	1	f	\N	2019-11-19 17:37:13.15068	\N	f	f
8	1	f	\N	2019-11-19 17:37:16.919133	\N	f	f
1	1	f	\N	2019-11-19 17:37:18.211676	\N	f	f
10	1	f	\N	2019-11-19 17:37:23.092955	\N	f	f
13	1	f	\N	2019-11-19 17:37:27.165682	\N	f	f
4	1	f	\N	2019-11-19 17:37:32.585476	\N	f	f
17	1	f	\N	2019-11-19 17:37:32.965852	\N	f	f
19	1	f	\N	2019-11-19 17:37:44.771671	\N	f	f
27	1	f	\N	2019-11-19 17:38:01.574749	\N	f	f
43	1	f	\N	2019-11-19 17:38:06.900453	\N	f	f
11	1	f	\N	2019-11-19 17:38:10.879426	\N	f	f
47	1	f	\N	2019-11-19 17:38:12.051559	\N	f	f
51	1	f	\N	2019-11-19 17:38:20.845282	\N	f	f
14	1	f	\N	2019-11-19 17:38:22.854177	\N	f	f
54	1	f	\N	2019-11-19 17:38:25.839776	\N	f	f
18	1	f	\N	2019-11-19 17:38:29.565283	\N	f	f
56	1	f	\N	2019-11-19 17:38:30.447395	\N	f	f
20	1	f	\N	2019-11-19 17:38:38.004204	\N	f	f
22	1	f	\N	2019-11-19 17:38:44.131575	\N	f	f
62	1	f	\N	2019-11-19 17:38:44.448422	\N	f	f
63	1	f	\N	2019-11-19 17:38:55.558709	\N	f	f
26	1	f	\N	2019-11-19 17:38:57.836322	\N	f	f
65	1	f	\N	2019-11-19 17:39:01.022489	\N	f	f
29	1	f	\N	2019-11-19 17:39:05.325826	\N	f	f
31	1	f	\N	2019-11-19 17:39:11.966854	\N	f	f
68	1	f	\N	2019-11-19 17:39:22.493506	\N	f	f
33	1	f	\N	2019-11-19 17:39:24.454746	\N	f	f
35	1	f	\N	2019-11-19 17:39:31.332334	\N	f	f
69	1	f	\N	2019-11-19 17:39:36.633657	\N	f	f
64	1	f	\N	2019-11-19 17:39:41.623012	\N	f	f
73	1	f	\N	2019-11-19 17:39:46.921163	\N	f	f
77	1	f	\N	2019-11-19 17:39:55.600178	\N	f	f
39	1	f	\N	2019-11-19 17:39:56.236159	\N	f	f
78	1	f	\N	2019-11-19 17:39:59.364817	\N	f	f
40	1	f	\N	2019-11-19 17:40:03.385389	\N	f	f
81	1	f	\N	2019-11-19 17:40:04.128642	\N	f	f
83	1	f	\N	2019-11-19 17:40:08.120252	\N	f	f
41	1	f	\N	2019-11-19 17:40:10.171322	\N	f	f
85	1	f	\N	2019-11-19 17:40:12.518261	\N	f	f
87	1	f	\N	2019-11-19 17:40:17.619842	\N	f	f
88	1	f	\N	2019-11-19 17:40:21.506636	\N	f	f
46	1	f	\N	2019-11-19 17:40:23.780692	\N	f	f
82	1	f	\N	2019-11-19 17:40:32.355445	\N	f	f
55	1	f	\N	2019-11-19 17:40:48.611901	\N	f	f
79	1	f	\N	2019-11-19 17:40:57.554677	\N	f	f
91	2	f	\N	2019-11-20 11:04:02.501635	\N	f	f
110	2	t	2019-11-21 15:25:52	2019-11-20 11:06:29.870337	\N	f	f
75	1	t	2019-11-20 09:33:51	2019-11-19 17:39:51.007445	\N	f	f
50	1	t	2019-11-20 09:46:37	2019-11-19 17:40:32.086933	\N	f	f
96	1	t	2019-11-20 09:46:48	2019-11-20 09:46:46.18561	\N	f	f
24	1	t	2019-11-20 09:48:09	2019-11-19 17:38:51.235473	\N	f	f
59	1	t	2019-11-20 09:50:40	2019-11-19 17:38:34.683333	\N	f	f
97	1	t	2019-11-20 09:51:58	2019-11-20 09:51:58.430226	\N	f	f
66	1	f	\N	2019-11-19 17:41:01.444629	\N	f	f
33	2	t	2019-11-21 15:26:04	2019-11-20 11:02:48.641149	\N	f	f
52	1	t	2019-11-20 09:58:32	2019-11-19 17:40:38.163383	\N	f	f
95	1	t	2019-11-20 10:00:49	2019-11-20 10:00:49.82668	\N	f	f
9	1	t	2019-11-20 10:01:52	2019-11-19 17:38:02.089794	\N	f	f
98	1	t	2019-11-20 10:04:03	2019-11-20 10:04:03.015738	\N	f	f
99	1	t	2019-11-20 10:06:56	2019-11-20 10:06:56.583287	\N	f	f
37	1	t	2019-11-20 10:08:15	2019-11-19 17:39:44.637791	\N	f	f
94	1	t	2019-11-20 10:09:04	2019-11-20 10:09:04.605482	\N	f	f
100	1	t	2019-11-20 10:10:01	2019-11-20 10:10:01.048749	\N	f	f
101	1	t	2019-11-20 10:14:08	2019-11-20 10:14:08.16873	\N	f	f
32	1	t	2019-11-20 10:15:29	2019-11-19 17:39:18.39597	\N	f	f
102	1	t	2019-11-20 10:17:21	2019-11-20 10:17:21.493636	\N	f	f
103	1	t	2019-11-20 10:19:44	2019-11-20 10:19:44.407344	\N	f	f
45	2	f	\N	2019-11-20 10:20:22.642752	\N	f	f
13	2	f	\N	2019-11-20 10:20:38.336315	\N	f	f
10	2	f	\N	2019-11-20 10:20:54.650718	\N	f	f
17	2	f	\N	2019-11-20 10:21:10.173755	\N	f	f
57	2	f	\N	2019-11-20 10:21:18.477916	\N	f	f
64	2	f	\N	2019-11-20 10:21:28.787522	\N	f	f
21	2	f	\N	2019-11-20 10:21:49.882264	\N	f	f
44	1	t	2019-11-20 10:25:47	2019-11-19 17:40:16.723999	\N	f	f
104	1	t	2019-11-20 10:27:31	2019-11-20 10:26:53.166849	\N	f	f
105	1	t	2019-11-20 10:33:44	2019-11-20 10:33:44.290465	\N	f	f
106	1	t	2019-11-20 10:40:08	2019-11-20 10:40:08.772716	\N	f	f
36	1	t	2019-11-20 10:44:02	2019-11-19 17:39:37.571741	\N	f	f
74	2	f	\N	2019-11-20 11:00:46.177398	\N	f	f
107	2	f	\N	2019-11-20 11:02:23.291971	\N	f	f
89	2	f	\N	2019-11-20 11:02:56.955545	\N	f	f
109	2	f	\N	2019-11-20 11:05:09.942587	\N	f	f
18	2	f	\N	2019-11-20 11:05:27.053394	\N	f	f
27	2	t	2019-11-21 15:27:31	2019-11-20 10:20:47.589082	\N	f	f
7	1	t	2019-11-20 11:28:40	2019-11-19 17:37:40.812232	\N	f	f
61	1	t	2019-11-20 11:28:45	2019-11-19 17:38:16.947164	\N	f	f
60	1	t	2019-11-20 11:58:32	2019-11-19 17:40:55.135994	\N	f	f
179	1	t	2019-11-20 12:19:05	2019-11-20 12:19:05.718959	\N	f	f
75	2	t	2019-11-21 15:14:39	2019-11-20 11:00:39.862293	\N	f	f
80	2	t	2019-11-21 15:16:05	2019-11-20 11:00:53.747054	\N	f	f
150	2	t	2019-11-21 15:18:12	2019-11-21 15:18:12.495278	\N	f	f
53	2	t	2019-11-21 15:20:41	2019-11-21 15:20:41.409253	\N	f	f
48	2	t	2019-11-21 15:24:45	2019-11-20 10:20:30.765964	\N	f	f
116	2	t	2019-11-21 15:27:37	2019-11-21 15:27:37.891742	\N	f	f
227	2	t	2019-11-21 15:31:24	2019-11-21 15:31:24.063695	\N	f	f
14	2	t	2019-11-21 15:31:39	2019-11-20 11:04:09.954418	\N	f	f
219	2	t	2019-11-21 15:35:21	2019-11-21 15:35:21.452485	\N	f	f
24	2	t	2019-11-21 15:38:16	2019-11-20 11:04:17.034596	\N	f	f
108	2	t	2019-11-21 15:38:53	2019-11-20 11:03:50.789449	\N	f	f
156	2	t	2019-11-21 15:39:35	2019-11-21 15:39:35.245923	\N	f	f
228	2	t	2019-11-21 15:40:43	2019-11-21 15:40:43.920229	\N	f	f
130	2	t	2019-11-21 15:43:47	2019-11-21 15:43:47.703785	\N	f	f
98	2	t	2019-11-21 15:45:35	2019-11-21 15:45:35.01274	\N	f	f
223	2	t	2019-11-21 15:51:22	2019-11-21 15:51:22.843142	\N	f	f
3	2	t	2019-11-21 15:51:52	2019-11-20 10:21:40.119995	\N	f	f
211	2	t	2019-11-21 15:56:53	2019-11-21 15:56:53.937046	\N	f	f
229	2	t	2019-11-21 15:57:56	2019-11-21 15:57:56.186139	\N	f	f
226	2	t	2019-11-21 16:00:44	2019-11-21 16:00:44.62504	\N	f	f
67	2	t	2019-11-21 16:03:44	2019-11-20 10:21:35.986915	\N	f	f
84	2	t	2019-11-21 16:21:26	2019-11-20 11:01:00.764104	\N	f	f
235	3	f	\N	2019-11-22 11:25:17.873284	\N	f	f
234	3	t	2019-11-22 16:06:00	2019-11-22 11:25:09.870288	\N	f	f
232	3	t	2019-11-22 16:29:04	2019-11-22 11:25:01.687144	\N	f	f
237	3	t	2019-11-22 16:31:01	2019-11-22 11:25:26.179822	\N	f	f
238	3	f	\N	2019-11-22 11:25:45.655041	\N	f	f
246	3	f	\N	2019-11-22 11:26:14.92088	\N	f	f
247	3	f	\N	2019-11-22 11:26:22.439146	\N	f	f
245	3	t	2019-11-22 15:34:37	2019-11-22 11:26:08.921317	\N	f	f
241	3	t	2019-11-22 15:44:20	2019-11-22 11:25:53.869313	\N	f	f
230	3	t	2019-11-22 16:03:45	2019-11-22 11:24:42.115175	\N	f	f
231	3	t	2019-11-22 16:19:05	2019-11-22 11:24:55.33815	\N	f	f
249	3	t	2019-11-22 16:22:05	2019-11-22 11:26:30.955326	\N	f	f
244	3	t	2019-11-22 17:01:46	2019-11-22 11:26:03.515535	\N	f	f
12	4	f	\N	2019-11-26 17:00:41.1972	\N	f	f
15	4	f	\N	2019-11-26 17:00:50.457291	\N	f	f
21	4	f	\N	2019-11-26 17:01:03.717104	\N	f	f
28	4	f	\N	2019-11-26 17:02:00.699469	\N	f	f
479	4	f	\N	2019-11-26 17:02:15.916658	\N	f	f
284	4	f	\N	2019-11-26 17:03:24.108761	\N	f	f
397	4	f	\N	2019-11-26 17:03:43.984422	\N	f	f
61	4	f	\N	2019-11-26 17:05:18.345	\N	f	f
51	4	f	\N	2019-11-26 17:05:41.037521	\N	f	f
54	4	f	\N	2019-11-26 17:05:56.147885	\N	f	f
371	4	f	\N	2019-11-26 17:06:13.869736	\N	f	f
384	4	f	\N	2019-11-26 17:07:14.418707	\N	f	f
77	4	f	\N	2019-11-26 17:08:11.386473	\N	f	f
81	4	f	\N	2019-11-26 17:08:43.98836	\N	f	f
458	4	f	\N	2019-11-26 17:08:57.048564	\N	f	f
85	4	f	\N	2019-11-26 17:09:07.016061	\N	f	f
39	4	f	\N	2019-11-26 17:09:19.033398	\N	f	f
638	4	f	\N	2019-11-26 17:10:21.347098	\N	f	f
640	4	f	\N	2019-11-26 17:12:10.244068	\N	f	f
641	4	f	\N	2019-11-26 17:13:02.701698	\N	f	f
645	4	f	\N	2019-11-26 17:16:57.573757	\N	f	f
646	4	f	\N	2019-11-26 17:18:31.757162	\N	f	f
41	4	f	\N	2019-11-26 17:20:14.392156	\N	f	f
66	4	f	\N	2019-11-26 17:20:53.355379	\N	f	f
647	4	f	\N	2019-11-26 17:25:59.732973	\N	f	f
648	4	t	2019-11-27 09:35:16	2019-11-27 09:35:16.186694	\N	f	t
649	4	t	2019-11-27 09:37:12	2019-11-27 09:37:12.263992	\N	f	t
78	4	t	2019-11-27 09:40:05	2019-11-26 17:08:19.026767	\N	f	f
642	4	t	2019-11-27 09:58:04	2019-11-26 17:14:26.381711	\N	f	f
651	4	t	2019-11-27 10:02:03	2019-11-27 10:02:03.551466	\N	f	t
52	4	t	2019-11-27 10:04:36	2019-11-26 17:20:47.561152	\N	f	f
652	4	t	2019-11-27 10:07:29	2019-11-27 10:07:29.664684	\N	f	t
653	4	t	2019-11-27 10:13:36	2019-11-27 10:13:36.729709	\N	f	t
453	4	t	2019-11-27 10:19:44	2019-11-27 10:19:44.414919	\N	f	t
537	4	t	2019-11-27 10:21:18	2019-11-27 10:21:18.030076	\N	f	t
381	4	t	2019-11-27 10:21:23	2019-11-27 10:21:23.771516	\N	f	t
655	4	t	2019-11-27 10:24:16	2019-11-27 10:24:16.40103	\N	f	t
654	4	t	2019-11-27 10:24:23	2019-11-27 10:22:49.029611	\N	f	t
86	4	t	2019-11-27 10:24:45	2019-11-26 17:20:29.584091	\N	f	f
135	5	f	\N	2019-12-03 11:05:30.237928	\N	f	f
658	4	t	2019-11-27 10:39:45	2019-11-27 10:39:45.034435	\N	f	t
657	4	t	2019-11-27 10:39:51	2019-11-27 10:39:51.367137	\N	f	t
656	4	t	2019-11-27 10:39:58	2019-11-27 10:34:50.220048	\N	f	f
643	4	t	2019-11-27 10:40:47	2019-11-26 17:15:31.663603	\N	f	f
252	4	t	2019-11-27 10:47:55	2019-11-26 17:07:04.340342	\N	f	f
8	4	t	2019-11-27 10:56:30	2019-11-26 17:03:32.281912	\N	f	f
100	4	t	2019-11-27 10:58:41	2019-11-26 17:20:00.181917	\N	f	f
370	4	t	2019-11-27 11:03:42	2019-11-27 11:03:42.226163	\N	f	t
659	4	t	2019-11-27 11:05:37	2019-11-27 11:05:37.471839	\N	f	t
59	4	t	2019-11-27 11:11:10	2019-11-26 17:06:06.344539	\N	f	f
660	4	t	2019-11-27 11:17:32	2019-11-27 11:17:32.264536	\N	f	t
106	4	t	2019-11-27 11:23:23	2019-11-26 17:06:52.059773	\N	f	f
50	4	t	2019-11-27 11:23:29	2019-11-26 17:20:38.457397	\N	f	f
662	4	t	2019-11-27 11:23:35	2019-11-27 11:22:58.147346	\N	f	t
639	4	t	2019-11-27 11:28:19	2019-11-26 17:12:02.87562	\N	f	f
478	4	t	2019-11-27 11:44:12	2019-11-27 11:44:12.619109	\N	f	t
30	4	t	2019-11-27 11:57:25	2019-11-26 17:02:09.5026	\N	f	f
664	4	t	2019-11-27 12:24:07	2019-11-27 12:24:07.685611	\N	f	t
8	5	f	\N	2019-12-03 10:56:06.143621	\N	f	f
211	5	f	\N	2019-12-03 10:56:29.532726	\N	f	f
665	5	f	\N	2019-12-03 10:58:08.573239	\N	f	f
264	5	f	\N	2019-12-03 10:58:23.755617	\N	f	f
10	5	f	\N	2019-12-03 10:58:39.929438	\N	f	f
385	5	f	\N	2019-12-03 10:59:14.404709	\N	f	f
223	5	f	\N	2019-12-03 10:59:24.80433	\N	f	f
363	5	f	\N	2019-12-03 10:59:36.742781	\N	f	f
67	5	f	\N	2019-12-03 10:59:57.727532	\N	f	f
3	5	f	\N	2019-12-03 11:00:20.27146	\N	f	f
530	5	f	\N	2019-12-03 11:00:30.729399	\N	f	f
545	5	f	\N	2019-12-03 11:02:33.533086	\N	f	f
30	5	f	\N	2019-12-03 11:03:51.941282	\N	f	f
75	5	f	\N	2019-12-03 11:04:06.869894	\N	f	f
82	5	f	\N	2019-12-03 11:04:26.149353	\N	f	f
667	5	f	\N	2019-12-03 11:05:09.519683	\N	f	f
40	5	f	\N	2019-12-03 11:05:57.752495	\N	f	f
117	5	f	\N	2019-12-03 11:06:38.551755	\N	f	f
14	5	f	\N	2019-12-03 11:06:46.433893	\N	f	f
35	5	f	\N	2019-12-03 11:07:38.082911	\N	f	f
26	5	f	\N	2019-12-03 11:07:44.434876	\N	f	f
146	5	t	2019-12-04 12:49:34	2019-12-03 11:10:40.582197	\N	f	f
668	5	t	2019-12-04 12:52:37	2019-12-03 11:09:42.0391	\N	f	f
61	5	t	2019-12-04 12:59:47	2019-12-03 10:59:00.840141	\N	f	f
392	5	t	2019-12-04 12:55:46	2019-12-03 11:06:10.393169	\N	f	f
666	5	t	2019-12-04 13:06:58	2019-12-03 11:03:44.931117	\N	f	f
115	5	t	2019-12-04 13:10:36	2019-12-03 11:10:49.450994	\N	f	f
111	5	t	2019-12-04 13:11:22	2019-12-03 11:10:24.24492	\N	f	f
275	5	t	2019-12-04 13:11:57	2019-12-03 11:10:30.874601	\N	f	f
116	5	t	2019-12-04 13:12:06	2019-12-03 11:06:32.902696	\N	f	f
373	5	t	2019-12-04 13:12:20	2019-12-03 10:58:54.709347	\N	f	f
37	5	t	2019-12-04 13:16:54	2019-12-03 11:10:54.863486	\N	f	f
150	5	t	2019-12-04 13:18:05	2019-12-03 11:04:17.712913	\N	f	f
217	5	t	2019-12-04 13:18:12	2019-12-03 11:05:20.707777	\N	f	f
147	5	t	2019-12-04 13:21:21	2019-12-03 11:07:31.980125	\N	f	f
24	5	t	2019-12-04 13:24:17	2019-12-03 11:06:54.349707	\N	f	f
54	5	t	2019-12-04 13:26:59	2019-12-03 10:59:32.457149	\N	f	f
79	5	t	2019-12-04 13:27:40	2019-12-03 11:07:25.19781	\N	f	f
169	5	t	2019-12-04 13:30:58	2019-12-03 11:09:50.586922	\N	f	f
84	5	t	2019-12-04 13:33:01	2019-12-03 11:04:00.460074	\N	f	f
226	5	t	2019-12-04 13:34:32	2019-12-03 10:59:51.828663	\N	f	f
57	5	t	2019-12-04 13:35:55	2019-12-03 10:58:46.934135	\N	f	f
98	5	t	2019-12-04 13:36:15	2019-12-03 11:06:17.586054	\N	f	f
110	5	t	2019-12-04 13:36:21	2019-12-03 11:09:55.621686	\N	f	f
59	5	t	2019-12-04 13:46:49	2019-12-03 10:56:36.266112	\N	f	f
139	5	t	2019-12-04 13:48:24	2019-12-03 11:07:10.466331	\N	f	f
134	5	t	2019-12-04 13:48:32	2019-12-03 11:10:17.308888	\N	f	f
100	5	t	2019-12-04 13:48:51	2019-12-03 11:07:04.071632	\N	f	f
541	5	t	2019-12-04 13:51:46	2019-12-03 11:02:43.80518	\N	f	f
281	5	t	2019-12-04 14:00:28	2019-12-03 10:56:19.729199	\N	f	f
552	5	t	2019-12-04 14:02:39	2019-12-03 11:02:47.463106	\N	f	f
63	5	t	2019-12-04 14:20:32	2019-12-03 10:59:06.48812	\N	f	f
106	5	t	2019-12-04 14:31:10	2019-12-03 10:59:42.767955	\N	f	f
42	5	t	2019-12-04 17:14:13	2019-12-03 11:02:55.405928	\N	f	f
381	5	t	2019-12-04 17:14:50	2019-12-03 10:58:15.911291	\N	f	f
109	5	t	2019-12-04 17:16:21	2019-12-03 11:07:58.347466	\N	f	f
486	5	f	\N	2019-12-03 11:16:13.346213	\N	f	f
78	5	f	\N	2019-12-03 11:16:18.753431	\N	f	f
620	5	f	\N	2019-12-03 11:16:25.433538	\N	f	f
482	5	f	\N	2019-12-03 11:16:46.838554	\N	f	f
165	5	f	\N	2019-12-03 11:16:53.618966	\N	f	f
671	5	f	\N	2019-12-03 11:17:39.734247	\N	f	f
556	5	f	\N	2019-12-03 16:43:48.762611	\N	f	f
220	5	f	\N	2019-12-04 10:58:33.009774	\N	f	f
280	6	f	\N	2019-12-04 11:08:56.013701	\N	f	f
294	6	f	\N	2019-12-04 11:09:03.487352	\N	f	f
17	6	f	\N	2019-12-04 11:09:09.737407	\N	f	f
8	6	f	\N	2019-12-04 11:09:19.571415	\N	f	f
13	6	f	\N	2019-12-04 11:09:29.329642	\N	f	f
676	6	f	\N	2019-12-04 11:12:58.135031	\N	f	f
53	6	f	\N	2019-12-04 11:13:39.872424	\N	f	f
59	6	f	\N	2019-12-04 11:14:08.85433	\N	f	f
63	6	f	\N	2019-12-04 11:14:49.618814	\N	f	f
62	6	f	\N	2019-12-04 11:15:03.963721	\N	f	f
61	6	f	\N	2019-12-04 11:15:16.346156	\N	f	f
54	6	f	\N	2019-12-04 11:15:25.239062	\N	f	f
677	6	f	\N	2019-12-04 11:17:22.756058	\N	f	f
258	6	f	\N	2019-12-04 11:17:34.26635	\N	f	f
363	6	f	\N	2019-12-04 11:17:43.67229	\N	f	f
64	6	f	\N	2019-12-04 11:17:49.871978	\N	f	f
678	6	f	\N	2019-12-04 11:18:54.518389	\N	f	f
679	6	f	\N	2019-12-04 11:22:29.770652	\N	f	f
88	6	f	\N	2019-12-04 11:24:16.736609	\N	f	f
680	6	f	\N	2019-12-04 11:24:22.389699	\N	f	f
28	6	f	\N	2019-12-04 11:24:34.936041	\N	f	f
497	6	f	\N	2019-12-04 11:24:48.68362	\N	f	f
681	6	f	\N	2019-12-04 11:26:17.56626	\N	f	f
682	6	f	\N	2019-12-04 11:27:59.811471	\N	f	f
3	6	f	\N	2019-12-04 11:30:08.798592	\N	f	f
522	6	f	\N	2019-12-04 11:30:23.927195	\N	f	f
546	6	f	\N	2019-12-04 11:30:49.813386	\N	f	f
19	6	f	\N	2019-12-04 11:30:56.750782	\N	f	f
38	6	f	\N	2019-12-04 11:31:09.957093	\N	f	f
541	6	f	\N	2019-12-04 11:32:47.415225	\N	f	f
684	6	f	\N	2019-12-04 11:34:54.49791	\N	f	f
21	6	f	\N	2019-12-04 11:39:09.228067	\N	f	f
420	6	f	\N	2019-12-04 11:39:19.7587	\N	f	f
30	6	f	\N	2019-12-04 11:39:28.015061	\N	f	f
81	6	f	\N	2019-12-04 11:39:40.055449	\N	f	f
453	6	f	\N	2019-12-04 11:39:45.990802	\N	f	f
482	6	f	\N	2019-12-04 11:39:55.915701	\N	f	f
41	6	f	\N	2019-12-04 11:40:12.586762	\N	f	f
486	6	f	\N	2019-12-04 11:40:17.244489	\N	f	f
471	6	f	\N	2019-12-04 11:40:34.095131	\N	f	f
458	6	f	\N	2019-12-04 11:40:46.148426	\N	f	f
475	6	f	\N	2019-12-04 11:40:52.475622	\N	f	f
39	6	f	\N	2019-12-04 11:41:02.248896	\N	f	f
574	6	f	\N	2019-12-04 11:41:11.257126	\N	f	f
112	6	f	\N	2019-12-04 11:41:28.765428	\N	f	f
26	6	f	\N	2019-12-04 11:41:46.226372	\N	f	f
9	6	f	\N	2019-12-04 11:41:59.661297	\N	f	f
133	6	f	\N	2019-12-04 11:42:17.913128	\N	f	f
14	6	f	\N	2019-12-04 11:42:52.898071	\N	f	f
137	6	f	\N	2019-12-04 11:43:02.002994	\N	f	f
24	6	f	\N	2019-12-04 11:43:07.429768	\N	f	f
79	6	f	\N	2019-12-04 11:44:20.300139	\N	f	f
37	6	f	\N	2019-12-04 11:44:25.668434	\N	f	f
157	6	f	\N	2019-12-04 11:44:39.75512	\N	f	f
11	6	f	\N	2019-12-04 11:44:45.520914	\N	f	f
29	6	f	\N	2019-12-04 11:44:52.35605	\N	f	f
217	6	f	\N	2019-12-04 11:44:59.983292	\N	f	f
287	6	f	\N	2019-12-04 11:45:05.603433	\N	f	f
129	6	f	\N	2019-12-04 11:45:57.522757	\N	f	f
33	6	f	\N	2019-12-04 11:46:03.936402	\N	f	f
136	6	f	\N	2019-12-04 11:46:17.094722	\N	f	f
36	6	f	\N	2019-12-04 11:46:22.441534	\N	f	f
46	6	f	\N	2019-12-04 11:46:27.306559	\N	f	f
111	6	f	\N	2019-12-04 11:46:38.677781	\N	f	f
82	6	f	\N	2019-12-04 11:46:45.591523	\N	f	f
4	6	f	\N	2019-12-04 11:47:37.051284	\N	f	f
7	6	f	\N	2019-12-04 11:47:43.978065	\N	f	f
166	6	f	\N	2019-12-04 11:47:49.519377	\N	f	f
625	6	f	\N	2019-12-04 11:47:57.531019	\N	f	f
626	6	f	\N	2019-12-04 11:48:06.543439	\N	f	f
115	6	f	\N	2019-12-04 11:48:12.560558	\N	f	f
35	6	f	\N	2019-12-04 11:48:33.712999	\N	f	f
60	6	f	\N	2019-12-04 11:48:49.815465	\N	f	f
139	6	f	\N	2019-12-04 11:49:08.912173	\N	f	f
671	6	f	\N	2019-12-04 11:49:33.16795	\N	f	f
174	6	f	\N	2019-12-04 11:50:04.960955	\N	f	f
180	6	f	\N	2019-12-04 11:50:11.265453	\N	f	f
193	6	f	\N	2019-12-04 11:50:25.225959	\N	f	f
184	6	f	\N	2019-12-04 11:50:38.033772	\N	f	f
197	6	f	\N	2019-12-04 11:50:51.687198	\N	f	f
200	6	f	\N	2019-12-04 11:50:56.857133	\N	f	f
171	6	f	\N	2019-12-04 11:51:01.984045	\N	f	f
121	6	f	\N	2019-12-04 11:51:08.278427	\N	f	f
563	6	f	\N	2019-12-04 11:51:50.998054	\N	f	f
577	6	f	\N	2019-12-04 11:52:56.329103	\N	f	f
612	6	f	\N	2019-12-04 11:53:05.088728	\N	f	f
560	6	f	\N	2019-12-04 11:53:13.220465	\N	f	f
570	6	f	\N	2019-12-04 11:53:46.910213	\N	f	f
571	6	f	\N	2019-12-04 11:53:56.687726	\N	f	f
647	6	f	\N	2019-12-04 12:06:28.588337	\N	f	f
72	6	f	\N	2019-12-04 12:06:35.423098	\N	f	f
66	6	f	\N	2019-12-04 12:06:43.05679	\N	f	f
430	6	f	\N	2019-12-04 12:06:49.111033	\N	f	f
489	6	f	\N	2019-12-04 12:06:54.38939	\N	f	f
688	6	f	\N	2019-12-04 12:26:14.284982	\N	f	f
367	6	f	\N	2019-12-04 12:26:29.184656	\N	f	f
691	6	f	\N	2019-12-04 12:29:43.412411	\N	f	f
692	6	f	\N	2019-12-04 12:31:20.300131	\N	f	f
675	5	t	2019-12-04 13:02:25	2019-12-04 10:28:00.813158	\N	f	f
218	5	t	2019-12-04 13:05:59	2019-12-04 11:24:00.536379	\N	f	f
670	5	t	2019-12-04 13:08:38	2019-12-04 11:33:58.758969	\N	f	f
210	5	t	2019-12-04 13:10:15	2019-12-04 10:36:12.440117	\N	f	f
674	5	t	2019-12-04 13:12:07	2019-12-03 14:56:21.534902	\N	f	f
44	5	t	2019-12-04 13:38:40	2019-12-03 11:17:56.524035	\N	f	f
235	5	t	2019-12-04 13:50:44	2019-12-03 11:20:09.603156	\N	f	f
241	5	t	2019-12-04 13:46:32	2019-12-03 11:22:37.972532	\N	f	f
625	5	t	2019-12-04 13:47:48	2019-12-04 10:28:07.84224	\N	f	f
245	5	t	2019-12-04 14:06:03	2019-12-03 11:23:00.016528	\N	f	f
672	5	t	2019-12-04 14:08:08	2019-12-03 11:22:25.801066	\N	f	f
673	5	t	2019-12-04 14:37:24	2019-12-03 11:26:59.962633	\N	f	f
496	5	t	2019-12-04 16:44:09	2019-12-03 11:36:54.527202	\N	f	f
367	5	t	2019-12-04 16:55:05	2019-12-03 11:16:32.187773	\N	f	f
78	6	t	2019-12-05 09:03:05	2019-12-04 11:54:30.690704	\N	f	f
52	6	t	2019-12-05 09:22:08	2019-12-04 11:54:06.130128	\N	f	f
163	6	t	2019-12-05 09:33:43	2019-12-04 11:42:45.937244	\N	f	f
152	6	t	2019-12-05 09:44:14	2019-12-04 11:44:30.473445	\N	f	f
86	6	t	2019-12-05 09:44:18	2019-12-04 11:54:10.856179	\N	f	f
32	6	t	2019-12-05 09:54:57	2019-12-04 11:43:15.074809	\N	f	f
555	6	t	2019-12-05 09:57:11	2019-12-04 12:07:45.417044	\N	f	f
50	6	t	2019-12-05 10:19:42	2019-12-04 12:07:00.174298	\N	f	f
134	6	t	2019-12-05 10:30:19	2019-12-04 11:46:11.001832	\N	f	f
696	6	t	2019-12-05 11:21:14	2019-12-04 12:36:47.5691	\N	f	f
695	6	f	\N	2019-12-04 12:36:54.635167	\N	f	f
693	6	f	\N	2019-12-04 12:37:20.301685	\N	f	f
697	6	f	\N	2019-12-04 12:38:18.779475	\N	f	f
698	6	f	\N	2019-12-04 12:39:03.283558	\N	f	f
699	6	f	\N	2019-12-04 12:39:45.558857	\N	f	f
320	6	f	\N	2019-12-04 12:40:04.735858	\N	f	f
40	6	f	\N	2019-12-04 12:40:12.939755	\N	f	f
528	6	f	\N	2019-12-04 12:40:23.767371	\N	f	f
551	6	f	\N	2019-12-04 12:40:30.180171	\N	f	f
700	6	f	\N	2019-12-04 12:41:14.491518	\N	f	f
701	6	f	\N	2019-12-04 12:42:02.524539	\N	f	f
703	6	f	\N	2019-12-04 12:44:56.193113	\N	f	f
706	5	t	2019-12-04 12:49:29	2019-12-04 12:49:29.270006	\N	f	t
705	6	f	\N	2019-12-04 12:50:14.548153	\N	f	f
233	5	t	2019-12-04 12:51:43	2019-12-04 12:51:43.483563	\N	f	t
707	5	t	2019-12-04 12:53:38	2019-12-04 12:53:38.247749	\N	f	t
569	6	f	\N	2019-12-04 12:56:19.473872	\N	f	f
555	5	t	2019-12-04 13:02:00	2019-12-03 11:16:40.515256	\N	f	f
709	5	t	2019-12-04 13:04:00	2019-12-04 13:04:00.474153	\N	f	t
711	5	t	2019-12-04 13:12:01	2019-12-04 13:12:01.120687	\N	f	t
712	5	t	2019-12-04 13:14:54	2019-12-04 13:14:54.553276	\N	f	t
224	5	t	2019-12-04 13:16:22	2019-12-04 13:16:22.127473	\N	f	t
216	5	t	2019-12-04 13:18:19	2019-12-04 13:18:19.537022	\N	f	t
713	5	t	2019-12-04 13:18:30	2019-12-04 13:18:30.427843	\N	f	t
714	6	f	\N	2019-12-04 13:19:13.068976	\N	f	f
715	5	t	2019-12-04 13:20:39	2019-12-04 13:20:39.569607	\N	f	t
522	5	t	2019-12-04 13:22:04	2019-12-03 11:16:07.356062	\N	f	f
17	5	t	2019-12-04 13:24:12	2019-12-04 10:58:27.251504	\N	f	f
228	5	t	2019-12-04 13:25:26	2019-12-04 13:25:26.06722	\N	f	t
32	5	t	2019-12-04 13:32:54	2019-12-03 11:07:16.528898	\N	f	f
397	5	t	2019-12-04 13:35:37	2019-12-04 13:35:37.687638	\N	f	t
669	5	t	2019-12-04 13:36:30	2019-12-03 11:15:36.833163	\N	f	f
231	5	t	2019-12-04 13:36:57	2019-12-04 13:36:57.804911	\N	f	t
246	5	t	2019-12-04 13:37:02	2019-12-04 13:37:02.757788	\N	f	t
237	5	t	2019-12-04 13:42:27	2019-12-03 11:20:30.703145	\N	f	f
717	5	t	2019-12-04 13:44:38	2019-12-04 13:44:38.987712	\N	f	t
80	5	t	2019-12-04 13:48:31	2019-12-04 13:48:31.041351	\N	f	t
718	5	t	2019-12-04 13:55:52	2019-12-04 13:55:52.464594	\N	f	t
248	5	t	2019-12-04 13:56:38	2019-12-04 13:56:38.071674	\N	f	t
270	5	t	2019-12-04 13:57:17	2019-12-04 13:57:17.464461	\N	f	t
33	5	t	2019-12-04 14:00:24	2019-12-03 11:05:36.13998	\N	f	f
232	5	t	2019-12-04 14:04:24	2019-12-04 14:04:24.216125	\N	f	t
316	5	t	2019-12-04 14:05:12	2019-12-04 14:05:12.253825	\N	f	t
229	5	t	2019-12-04 14:06:14	2019-12-04 14:06:14.024112	\N	f	t
234	5	t	2019-12-04 14:07:04	2019-12-03 11:20:20.618867	\N	f	f
720	5	t	2019-12-04 14:16:45	2019-12-04 14:16:45.387671	\N	f	t
409	5	t	2019-12-04 14:20:17	2019-12-04 14:17:06.460988	\N	f	t
721	5	t	2019-12-04 14:22:17	2019-12-04 14:22:17.367936	\N	f	t
722	5	t	2019-12-04 14:37:18	2019-12-04 14:37:18.433783	\N	f	t
520	5	t	2019-12-04 15:00:32	2019-12-04 15:00:32.557669	\N	f	t
499	5	t	2019-12-04 16:44:05	2019-12-04 16:44:05.373348	\N	f	t
166	5	t	2019-12-04 16:55:00	2019-12-03 11:10:07.125135	\N	f	f
755	6	t	2019-12-05 11:55:41	2019-12-05 11:55:41.017035	\N	f	t
569	5	t	2019-12-04 17:14:46	2019-12-03 11:17:50.035263	\N	f	f
125	5	t	2019-12-04 17:14:56	2019-12-04 13:32:26.157094	\N	f	t
719	5	t	2019-12-04 17:20:17	2019-12-04 17:20:17.316924	\N	f	t
131	5	t	2019-12-04 17:21:42	2019-12-04 17:21:42.946134	\N	f	t
723	6	f	\N	2019-12-04 18:43:35.119265	\N	f	f
724	6	f	\N	2019-12-04 18:44:41.616825	\N	f	f
623	6	f	\N	2019-12-04 18:44:47.819935	\N	f	f
725	6	f	\N	2019-12-04 20:12:49.837474	\N	f	f
726	6	f	\N	2019-12-04 20:13:34.204406	\N	f	f
727	6	f	\N	2019-12-04 20:14:33.553256	\N	f	f
635	6	f	\N	2019-12-04 20:17:01.049711	\N	f	f
629	6	f	\N	2019-12-04 20:17:14.664922	\N	f	f
627	6	f	\N	2019-12-04 20:17:20.363264	\N	f	f
400	6	f	\N	2019-12-04 20:17:32.258266	\N	f	f
358	6	f	\N	2019-12-04 20:17:37.859804	\N	f	f
340	6	f	\N	2019-12-04 20:17:46.125674	\N	f	f
730	6	t	2019-12-05 08:52:34	2019-12-05 08:52:34.713069	\N	f	t
275	6	t	2019-12-05 09:02:07	2019-12-05 09:02:07.247331	\N	f	t
95	6	t	2019-12-05 09:18:00	2019-12-05 09:18:00.034125	\N	f	t
716	6	t	2019-12-05 09:21:52	2019-12-05 09:20:39.261836	\N	f	t
220	6	t	2019-12-05 09:24:04	2019-12-05 09:24:04.0186	\N	f	t
732	6	t	2019-12-05 09:29:26	2019-12-05 09:29:26.185359	\N	f	t
734	6	t	2019-12-05 09:33:38	2019-12-05 09:33:38.223043	\N	f	t
436	6	t	2019-12-05 09:43:03	2019-12-05 09:32:31.652323	\N	f	t
735	6	t	2019-12-05 09:47:44	2019-12-05 09:47:44.200129	\N	f	t
736	6	t	2019-12-05 09:47:49	2019-12-05 09:47:49.008708	\N	f	t
683	6	t	2019-12-05 09:54:28	2019-12-04 11:33:50.271903	\N	f	f
731	6	t	2019-12-05 09:56:32	2019-12-05 09:27:48.999993	\N	f	t
128	6	t	2019-12-05 09:58:14	2019-12-05 09:58:14.715013	\N	f	t
737	6	t	2019-12-05 10:01:12	2019-12-05 10:01:12.027484	\N	f	t
738	6	t	2019-12-05 10:02:51	2019-12-05 10:02:51.09581	\N	f	t
100	6	t	2019-12-05 10:08:03	2019-12-05 10:08:03.200174	\N	f	t
532	6	t	2019-12-05 10:15:43	2019-12-05 10:15:43.366056	\N	f	t
739	6	t	2019-12-05 10:25:17	2019-12-05 10:25:17.539925	\N	f	t
741	6	t	2019-12-05 10:41:17	2019-12-05 10:41:17.181819	\N	f	t
740	6	t	2019-12-05 10:42:35	2019-12-05 10:42:35.788249	\N	f	t
742	6	t	2019-12-05 10:43:01	2019-12-05 10:43:01.620911	\N	f	t
743	6	t	2019-12-05 10:49:21	2019-12-05 10:49:21.937202	\N	f	t
745	6	t	2019-12-05 10:51:01	2019-12-05 10:51:01.459949	\N	f	t
744	6	t	2019-12-05 10:53:10	2019-12-05 10:50:29.171836	\N	f	t
746	6	t	2019-12-05 10:53:41	2019-12-05 10:53:41.8549	\N	f	t
747	6	t	2019-12-05 11:00:01	2019-12-05 11:00:01.31232	\N	f	t
748	6	t	2019-12-05 11:00:38	2019-12-05 11:00:38.273952	\N	f	t
694	6	t	2019-12-05 11:11:34	2019-12-04 12:37:01.57218	\N	f	f
749	6	t	2019-12-05 11:13:33	2019-12-05 11:13:33.643544	\N	f	t
750	6	t	2019-12-05 11:17:01	2019-12-05 11:17:01.853464	\N	f	t
751	6	t	2019-12-05 11:24:09	2019-12-05 11:24:09.293321	\N	f	t
752	6	t	2019-12-05 11:39:43	2019-12-05 11:39:43.970567	\N	f	t
754	6	t	2019-12-05 11:42:48	2019-12-05 11:42:48.045551	\N	f	t
756	6	t	2019-12-05 12:18:22	2019-12-05 12:18:22.520213	\N	f	t
757	6	t	2019-12-05 13:31:01	2019-12-05 13:31:01.460697	\N	f	t
758	6	t	2019-12-05 13:38:27	2019-12-05 13:38:27.11777	\N	f	t
761	6	t	2019-12-05 14:46:58	2019-12-05 14:46:58.87344	\N	f	t
760	6	t	2019-12-05 14:47:05	2019-12-05 14:47:05.576444	\N	f	t
762	6	t	2019-12-05 15:10:48	2019-12-05 15:04:09.102154	\N	f	t
764	6	t	2019-12-05 15:40:10	2019-12-05 15:39:25.597068	\N	f	t
763	6	t	2019-12-05 15:40:23	2019-12-05 15:37:11.561303	\N	f	t
766	6	t	2019-12-05 17:13:28	2019-12-05 17:13:28.556094	\N	f	t
765	6	t	2019-12-05 17:13:33	2019-12-05 17:13:33.439289	\N	f	t
767	7	t	2019-12-06 15:32:18	2019-12-06 10:37:36.422033	\N	f	f
770	7	t	2019-12-06 15:32:26	2019-12-06 14:06:16.386272	\N	f	f
769	7	t	2019-12-06 15:32:30	2019-12-06 13:51:58.247273	\N	f	f
768	7	t	2019-12-06 15:32:35	2019-12-06 10:39:37.551763	\N	f	f
771	7	t	2019-12-06 15:50:22	2019-12-06 15:50:22.631495	\N	f	t
772	7	t	2019-12-06 15:50:29	2019-12-06 15:50:29.638309	\N	f	t
773	7	t	2019-12-06 16:55:31	2019-12-06 16:55:31.626351	\N	f	t
774	8	t	2019-12-07 12:20:10	2019-12-07 12:20:10.165483	\N	f	t
777	8	t	2019-12-07 12:20:48	2019-12-07 12:20:48.927272	\N	f	t
776	8	t	2019-12-07 12:21:01	2019-12-07 12:21:01.349818	\N	f	t
482	10	f	\N	2019-12-11 16:02:08.29564	\N	f	f
100	8	t	2019-12-07 12:42:28	2019-12-07 12:42:28.504845	\N	f	t
660	8	t	2019-12-07 12:43:48	2019-12-07 12:43:48.386511	\N	f	t
41	8	f	\N	2019-12-07 12:12:27.213889	\N	f	t
778	8	t	2019-12-07 14:18:27	2019-12-07 14:18:27.486696	\N	f	t
144	8	t	2019-12-07 17:44:09	2019-12-07 17:44:09.63316	\N	f	t
779	8	t	2019-12-07 17:45:31	2019-12-07 17:45:31.609465	\N	f	t
560	9	f	\N	2019-12-09 14:47:01.489295	\N	f	f
562	9	f	\N	2019-12-09 14:47:15.701967	\N	f	f
575	9	f	\N	2019-12-09 14:47:48.773715	\N	f	f
184	9	f	\N	2019-12-09 14:48:29.671575	\N	f	f
194	9	f	\N	2019-12-09 14:49:04.975403	\N	f	f
202	9	f	\N	2019-12-09 14:49:28.210622	\N	f	f
377	9	f	\N	2019-12-09 14:49:37.088265	\N	f	f
314	9	f	\N	2019-12-09 14:49:43.150419	\N	f	f
335	9	f	\N	2019-12-09 14:50:07.763715	\N	f	f
383	9	f	\N	2019-12-09 14:50:17.784616	\N	f	f
361	9	f	\N	2019-12-09 14:51:00.379287	\N	f	f
121	9	f	\N	2019-12-09 14:51:08.932557	\N	f	f
171	9	f	\N	2019-12-09 14:51:30.17889	\N	f	f
172	9	f	\N	2019-12-09 14:51:38.549619	\N	f	f
261	9	f	\N	2019-12-09 14:51:45.9565	\N	f	f
285	9	f	\N	2019-12-09 14:51:52.248225	\N	f	f
288	9	f	\N	2019-12-09 14:51:58.556134	\N	f	f
303	9	f	\N	2019-12-09 14:52:16.646245	\N	f	f
539	9	f	\N	2019-12-09 14:52:26.658639	\N	f	f
606	9	f	\N	2019-12-09 14:52:34.156064	\N	f	f
298	9	f	\N	2019-12-09 14:53:03.528788	\N	f	f
780	9	f	\N	2019-12-09 14:55:14.032017	\N	f	f
781	9	f	\N	2019-12-09 14:56:22.030896	\N	f	f
782	9	f	\N	2019-12-09 14:58:01.03529	\N	f	f
783	9	f	\N	2019-12-09 14:58:36.190416	\N	f	f
439	9	f	\N	2019-12-09 14:58:49.562426	\N	f	f
784	9	f	\N	2019-12-09 14:59:36.40898	\N	f	f
362	9	f	\N	2019-12-09 14:59:56.585632	\N	f	f
786	9	f	\N	2019-12-10 11:18:36.636275	\N	f	f
10	9	f	\N	2019-12-10 11:20:44.485283	\N	f	f
789	9	f	\N	2019-12-10 11:22:38.190413	\N	f	f
788	9	f	\N	2019-12-10 11:22:44.25604	\N	f	f
790	9	f	\N	2019-12-10 11:23:51.659219	\N	f	f
327	9	f	\N	2019-12-10 11:24:04.044437	\N	f	f
313	9	f	\N	2019-12-10 11:24:11.433978	\N	f	f
453	10	f	\N	2019-12-11 16:02:13.729046	\N	f	f
608	9	t	2019-12-11 11:43:11	2019-12-09 14:59:44.770557	\N	f	f
791	9	t	2019-12-11 12:04:44	2019-12-11 12:00:15.976999	\N	f	t
572	9	t	2019-12-11 12:11:48	2019-12-09 14:51:21.248499	\N	f	f
72	9	t	2019-12-11 12:11:56	2019-12-09 14:51:13.260978	\N	f	f
9	10	f	\N	2019-12-11 16:03:03.828341	\N	f	f
609	9	t	2019-12-11 12:15:53	2019-12-10 11:17:26.016275	\N	f	f
792	9	t	2019-12-11 12:35:51	2019-12-11 12:35:51.18306	\N	f	t
793	9	t	2019-12-11 12:44:45	2019-12-11 12:44:45.719967	\N	f	t
100	10	f	\N	2019-12-11 16:03:12.805808	\N	f	f
785	9	t	2019-12-11 12:52:33	2019-12-10 11:17:13.882589	\N	f	f
197	9	t	2019-12-11 13:01:32	2019-12-09 14:49:20.91399	\N	f	f
259	9	t	2019-12-11 13:05:14	2019-12-11 13:04:56.041341	\N	f	t
794	9	t	2019-12-11 13:05:20	2019-12-11 13:04:47.293033	\N	f	t
795	9	t	2019-12-11 13:05:28	2019-12-11 13:04:17.687414	\N	f	t
44	9	t	2019-12-11 13:07:42	2019-12-09 14:48:08.147617	\N	f	f
796	9	t	2019-12-11 13:09:40	2019-12-11 13:09:40.772997	\N	f	t
798	9	t	2019-12-11 13:15:25	2019-12-11 13:15:25.982482	\N	f	t
797	9	t	2019-12-11 13:15:38	2019-12-11 13:14:11.255707	\N	f	t
89	10	f	\N	2019-12-11 16:03:18.395008	\N	f	f
152	10	f	\N	2019-12-11 16:03:23.262451	\N	f	f
610	9	t	2019-12-11 13:19:50	2019-12-10 11:20:34.964449	\N	f	f
570	9	t	2019-12-11 13:27:55	2019-12-09 14:47:43.954856	\N	f	f
97	10	f	\N	2019-12-11 16:03:28.27051	\N	f	f
569	9	t	2019-12-11 13:34:12	2019-12-09 14:47:34.642575	\N	f	f
799	9	t	2019-12-11 13:42:45	2019-12-11 13:42:45.441649	\N	f	t
744	9	t	2019-12-11 13:49:57	2019-12-11 13:49:57.99572	\N	f	t
787	9	t	2019-12-11 14:26:49	2019-12-10 11:20:25.305411	\N	f	f
294	10	f	\N	2019-12-11 15:53:41.493327	\N	f	f
8	10	f	\N	2019-12-11 15:53:49.49491	\N	f	f
13	10	f	\N	2019-12-11 15:53:56.77522	\N	f	f
17	10	f	\N	2019-12-11 15:54:10.371532	\N	f	f
381	10	f	\N	2019-12-11 15:54:21.126027	\N	f	f
41	10	f	\N	2019-12-11 15:54:32.616709	\N	f	f
800	10	f	\N	2019-12-11 15:55:49.961991	\N	f	f
275	10	f	\N	2019-12-11 15:55:55.381046	\N	f	f
61	10	f	\N	2019-12-11 15:56:03.176768	\N	f	f
51	10	f	\N	2019-12-11 15:56:10.383276	\N	f	f
223	10	f	\N	2019-12-11 15:56:21.315668	\N	f	f
350	10	f	\N	2019-12-11 15:56:30.795226	\N	f	f
530	10	f	\N	2019-12-11 15:56:37.923242	\N	f	f
3	10	f	\N	2019-12-11 15:56:43.120377	\N	f	f
63	10	f	\N	2019-12-11 15:57:01.991911	\N	f	f
38	10	f	\N	2019-12-11 15:57:14.31479	\N	f	f
280	10	f	\N	2019-12-11 16:00:45.987076	\N	f	f
56	10	f	\N	2019-12-11 16:00:52.603483	\N	f	f
676	10	f	\N	2019-12-11 16:01:01.371462	\N	f	f
53	10	f	\N	2019-12-11 16:01:14.533041	\N	f	f
54	10	f	\N	2019-12-11 16:01:29.348522	\N	f	f
226	10	f	\N	2019-12-11 16:01:40.372197	\N	f	f
535	10	f	\N	2019-12-11 16:01:45.557633	\N	f	f
486	10	f	\N	2019-12-11 16:01:50.578549	\N	f	f
30	10	f	\N	2019-12-11 16:02:03.086128	\N	f	f
26	10	f	\N	2019-12-11 16:03:35.452152	\N	f	f
150	10	f	\N	2019-12-11 16:03:51.010977	\N	f	f
14	10	f	\N	2019-12-11 16:04:05.565125	\N	f	f
24	10	f	\N	2019-12-11 16:04:10.605318	\N	f	f
32	10	f	\N	2019-12-11 16:04:16.792771	\N	f	f
685	10	f	\N	2019-12-11 16:04:32.475559	\N	f	f
79	10	f	\N	2019-12-11 16:05:10.674644	\N	f	f
541	10	f	\N	2019-12-11 16:05:32.290877	\N	f	f
430	10	f	\N	2019-12-11 16:05:36.418217	\N	f	f
258	10	f	\N	2019-12-11 16:05:41.695266	\N	f	f
66	10	f	\N	2019-12-11 16:05:52.402612	\N	f	f
50	10	f	\N	2019-12-11 16:05:57.767923	\N	f	f
367	10	f	\N	2019-12-11 16:06:04.271585	\N	f	f
86	10	t	2019-12-12 11:20:40	2019-12-11 16:05:23.301458	\N	f	f
802	10	t	2019-12-12 11:46:40	2019-12-12 11:46:40.786869	\N	f	t
801	10	t	2019-12-12 11:46:51	2019-12-12 11:46:51.929025	\N	f	t
52	10	t	2019-12-12 11:57:41	2019-12-12 11:57:41.401983	\N	f	t
397	10	t	2019-12-12 12:01:39	2019-12-12 12:01:28.990741	\N	f	t
137	10	t	2019-12-12 12:29:53	2019-12-12 12:29:53.447181	\N	f	t
803	10	t	2019-12-12 12:34:42	2019-12-12 12:34:42.284043	\N	f	t
478	10	t	2019-12-12 12:55:25	2019-12-12 12:55:25.031929	\N	f	t
78	10	t	2019-12-12 12:55:51	2019-12-11 16:05:27.946695	\N	f	f
128	10	t	2019-12-12 13:01:37	2019-12-12 13:01:37.897721	\N	f	t
751	10	t	2019-12-12 13:17:13	2019-12-12 13:17:13.107939	\N	f	t
59	10	t	2019-12-12 14:26:17	2019-12-11 15:54:04.123459	\N	f	f
324	11	f	\N	2019-12-19 16:01:59.079383	\N	f	f
301	11	f	\N	2019-12-19 16:03:20.709099	\N	f	f
280	11	f	\N	2019-12-19 16:03:42.06288	\N	f	f
340	11	f	\N	2019-12-19 16:04:41.210152	\N	f	f
51	11	f	\N	2019-12-19 16:04:55.941974	\N	f	f
28	11	f	\N	2019-12-19 16:05:02.751006	\N	f	f
262	11	f	\N	2019-12-19 16:05:09.057634	\N	f	f
67	11	f	\N	2019-12-19 16:05:16.292993	\N	f	f
397	11	f	\N	2019-12-19 16:05:26.241426	\N	f	f
682	11	f	\N	2019-12-19 16:06:07.569972	\N	f	f
12	11	f	\N	2019-12-19 16:06:13.821938	\N	f	f
57	11	f	\N	2019-12-19 16:06:19.652908	\N	f	f
373	11	f	\N	2019-12-19 16:07:08.806924	\N	f	f
805	11	f	\N	2019-12-19 16:07:56.485245	\N	f	f
64	11	f	\N	2019-12-19 16:08:04.515137	\N	f	f
54	11	f	\N	2019-12-19 16:08:12.330146	\N	f	f
481	11	f	\N	2019-12-19 16:08:22.103174	\N	f	f
574	11	f	\N	2019-12-19 16:08:43.976186	\N	f	f
405	11	f	\N	2019-12-19 16:09:05.622749	\N	f	f
474	11	f	\N	2019-12-19 16:11:37.333145	\N	f	f
806	11	f	\N	2019-12-19 16:13:07.206929	\N	f	f
434	11	f	\N	2019-12-19 16:13:15.073442	\N	f	f
460	11	f	\N	2019-12-19 16:13:22.052693	\N	f	f
92	11	f	\N	2019-12-19 16:13:55.538757	\N	f	f
217	11	f	\N	2019-12-19 16:14:01.821943	\N	f	f
46	11	f	\N	2019-12-19 16:14:10.841414	\N	f	f
29	11	f	\N	2019-12-19 16:14:17.930575	\N	f	f
18	11	f	\N	2019-12-19 16:14:23.043418	\N	f	f
79	11	f	\N	2019-12-19 16:14:29.367624	\N	f	f
27	11	f	\N	2019-12-19 16:15:13.909505	\N	f	f
42	11	f	\N	2019-12-19 16:15:28.936014	\N	f	f
489	11	f	\N	2019-12-19 16:15:36.754761	\N	f	f
320	11	f	\N	2019-12-19 16:15:46.156102	\N	f	f
73	11	f	\N	2019-12-19 16:15:52.131758	\N	f	f
106	11	f	\N	2019-12-19 16:15:57.62805	\N	f	f
367	11	f	\N	2019-12-19 16:16:07.474643	\N	f	f
137	11	f	\N	2019-12-19 16:16:25.080636	\N	f	f
7	11	f	\N	2019-12-19 16:16:34.237883	\N	f	f
14	11	f	\N	2019-12-19 16:19:32.276662	\N	f	f
89	11	f	\N	2019-12-19 16:19:44.209223	\N	f	f
116	11	f	\N	2019-12-19 16:21:03.415411	\N	f	f
166	11	f	\N	2019-12-19 16:21:16.718053	\N	f	f
78	11	f	\N	2019-12-19 16:21:37.168325	\N	f	f
50	11	f	\N	2019-12-19 16:21:41.318739	\N	f	f
606	11	f	\N	2019-12-19 16:21:49.377473	\N	f	f
685	11	f	\N	2019-12-19 16:21:54.4235	\N	f	f
674	11	t	2019-12-20 12:55:29	2019-12-20 12:55:29.227272	\N	f	t
716	11	t	2019-12-20 12:55:43	2019-12-19 16:16:13.695348	\N	f	f
808	11	t	2019-12-20 13:02:39	2019-12-20 13:02:39.005542	\N	f	t
810	11	t	2019-12-20 13:16:32	2019-12-20 13:16:32.407076	\N	f	t
811	11	t	2019-12-20 13:20:56	2019-12-20 13:20:56.436977	\N	f	t
97	11	t	2019-12-20 13:26:45	2019-12-20 13:26:45.714157	\N	f	t
86	11	t	2019-12-20 13:31:45	2019-12-19 16:19:23.143155	\N	f	f
59	11	t	2019-12-20 13:33:40	2019-12-19 16:04:48.343251	\N	f	f
473	11	t	2019-12-20 13:34:17	2019-12-19 16:13:31.921917	\N	f	f
24	11	t	2019-12-20 13:40:44	2019-12-19 16:21:29.209779	\N	f	f
68	11	t	2019-12-20 13:52:09	2019-12-20 13:52:09.850083	\N	f	t
812	11	t	2019-12-20 13:53:18	2019-12-20 13:53:18.313856	\N	f	t
522	11	t	2019-12-20 14:05:03	2019-12-19 16:15:20.670919	\N	f	f
104	11	t	2019-12-20 14:07:24	2019-12-20 14:07:24.35986	\N	f	t
52	11	t	2019-12-20 14:07:42	2019-12-20 14:07:42.414561	\N	f	t
813	11	t	2019-12-20 14:11:23	2019-12-20 14:11:05.606699	\N	f	t
32	11	t	2019-12-20 14:22:32	2019-12-19 16:21:24.264085	\N	f	f
815	11	t	2019-12-20 14:26:07	2019-12-20 14:26:07.6148	\N	f	t
31	11	t	2019-12-20 14:26:36	2019-12-20 14:26:28.498494	\N	f	t
814	11	t	2019-12-20 14:26:47	2019-12-20 14:26:47.284261	\N	f	t
746	11	t	2019-12-20 14:29:25	2019-12-20 14:29:25.529467	\N	f	t
744	11	t	2019-12-20 14:29:38	2019-12-19 16:16:49.728142	\N	f	f
816	11	t	2019-12-20 14:36:58	2019-12-20 14:36:21.33808	\N	f	t
818	11	t	2019-12-20 14:42:31	2019-12-20 14:42:31.246767	\N	f	t
817	11	t	2019-12-20 14:42:44	2019-12-20 14:42:44.669272	\N	f	t
807	11	t	2019-12-20 14:54:01	2019-12-19 16:19:12.431641	\N	f	f
819	11	t	2019-12-20 15:33:25	2019-12-20 15:33:25.191768	\N	f	t
45	13	f	\N	2020-01-02 10:01:07.883182	\N	f	f
18	13	f	\N	2020-01-02 10:01:33.384995	\N	f	f
67	13	f	\N	2020-01-02 10:03:40.372832	\N	f	f
217	13	f	\N	2020-01-02 10:03:57.917052	\N	f	f
108	13	f	\N	2020-01-02 10:04:27.05389	\N	f	f
21	13	f	\N	2020-01-02 10:04:35.531617	\N	f	f
281	13	f	\N	2020-01-02 10:04:49.049965	\N	f	f
110	13	f	\N	2020-01-02 10:04:57.577725	\N	f	f
57	13	f	\N	2020-01-02 10:05:09.757863	\N	f	f
228	13	f	\N	2020-01-02 10:05:23.557455	\N	f	f
150	13	f	\N	2020-01-02 10:05:57.397798	\N	f	f
22	13	f	\N	2020-01-02 10:06:07.243028	\N	f	f
54	13	f	\N	2020-01-02 10:06:25.994625	\N	f	f
716	13	f	\N	2020-01-02 10:06:31.143223	\N	f	f
45	12	f	\N	2020-01-02 10:07:50.433835	\N	f	f
281	12	f	\N	2020-01-02 10:08:01.261227	\N	f	f
21	12	f	\N	2020-01-02 10:08:13.082544	\N	f	f
674	12	f	\N	2020-01-02 10:08:20.668568	\N	f	f
381	12	f	\N	2020-01-02 10:08:38.387506	\N	f	f
264	12	f	\N	2020-01-02 10:08:58.836888	\N	f	f
67	12	f	\N	2020-01-02 10:09:06.558403	\N	f	f
547	12	f	\N	2020-01-02 10:09:31.599296	\N	f	f
57	12	f	\N	2020-01-02 10:10:27.301087	\N	f	f
386	12	f	\N	2020-01-02 10:11:21.001279	\N	f	f
42	12	f	\N	2020-01-02 10:11:35.919933	\N	f	f
54	12	f	\N	2020-01-02 10:11:39.348202	\N	f	f
434	12	f	\N	2020-01-02 10:11:46.839445	\N	f	f
217	12	f	\N	2020-01-02 10:12:08.063151	\N	f	f
150	12	f	\N	2020-01-02 10:12:14.888048	\N	f	f
135	12	f	\N	2020-01-02 10:12:21.963063	\N	f	f
22	12	f	\N	2020-01-02 10:12:37.041495	\N	f	f
20	12	f	\N	2020-01-02 10:12:45.720643	\N	f	f
48	13	t	2020-01-04 14:56:40	2020-01-02 10:01:02.231585	\N	f	f
220	13	t	2020-01-04 15:14:26	2020-01-02 10:01:27.844927	\N	f	f
109	13	t	2020-01-04 15:20:01	2020-01-02 10:05:28.836187	\N	f	f
75	13	t	2020-01-04 15:23:37	2020-01-02 10:03:53.909899	\N	f	f
316	13	t	2020-01-04 15:25:27	2020-01-02 10:01:40.969919	\N	f	f
84	13	t	2020-01-04 15:29:12	2020-01-02 10:04:18.901754	\N	f	f
169	13	t	2020-01-04 15:32:45	2020-01-02 10:04:09.385682	\N	f	f
14	13	t	2020-01-04 15:33:47	2020-01-02 10:03:47.370503	\N	f	f
223	13	t	2020-01-04 15:38:52	2020-01-02 10:01:20.385962	\N	f	f
10	13	t	2020-01-04 15:53:27	2020-01-02 10:05:37.546152	\N	f	f
61	13	t	2020-01-04 15:56:38	2020-01-02 10:04:42.339066	\N	f	f
820	13	t	2020-01-04 15:56:54	2020-01-02 10:03:33.084577	\N	f	f
33	13	t	2020-01-04 16:10:01	2020-01-02 10:04:05.588936	\N	f	f
674	13	t	2020-01-04 16:19:14	2020-01-02 10:05:01.722106	\N	f	f
392	13	t	2020-01-04 16:30:15	2020-01-02 10:05:45.820941	\N	f	f
61	12	t	2020-01-04 16:35:25	2020-01-02 10:10:59.472052	\N	f	f
10	12	t	2020-01-04 16:35:28	2020-01-02 10:09:14.593804	\N	f	f
63	12	t	2020-01-04 16:35:37	2020-01-02 10:11:07.312578	\N	f	f
211	12	t	2020-01-04 16:36:27	2020-01-02 10:07:54.714607	\N	f	f
84	12	t	2020-01-04 16:38:48	2020-01-02 10:11:50.624802	\N	f	f
316	12	t	2020-01-04 16:38:55	2020-01-02 10:08:26.794743	\N	f	f
373	12	t	2020-01-04 16:39:05	2020-01-02 10:10:33.872133	\N	f	f
220	12	t	2020-01-04 16:39:23	2020-01-02 10:09:57.016419	\N	f	f
48	12	t	2020-01-04 16:39:49	2020-01-02 10:07:46.485116	\N	f	f
552	12	t	2020-01-04 17:38:09	2020-01-02 10:11:13.370341	\N	f	f
137	12	t	2020-01-04 18:03:16	2020-01-02 10:11:58.258208	\N	f	f
541	12	t	2020-01-04 19:17:01	2020-01-02 10:10:50.17056	\N	f	f
108	12	f	\N	2020-01-02 10:13:10.360334	\N	f	f
139	12	f	\N	2020-01-02 10:13:33.513034	\N	f	f
666	12	f	\N	2020-01-02 10:13:48.564133	\N	f	f
716	12	f	\N	2020-01-02 10:14:07.564932	\N	f	f
228	12	f	\N	2020-01-02 10:14:18.414503	\N	f	f
110	12	f	\N	2020-01-02 10:14:56.067885	\N	f	f
111	12	f	\N	2020-01-02 10:15:23.38125	\N	f	f
625	12	f	\N	2020-01-02 10:16:08.23256	\N	f	f
620	12	f	\N	2020-01-02 10:16:14.88076	\N	f	f
569	12	f	\N	2020-01-03 10:26:39.75785	\N	f	f
146	12	f	\N	2020-01-03 10:26:52.73553	\N	f	f
682	12	f	\N	2020-01-03 10:27:29.950353	\N	f	f
7	13	t	2020-01-04 14:50:05	2020-01-04 14:50:05.134856	\N	f	t
322	13	t	2020-01-04 15:05:09	2020-01-04 15:04:48.706062	\N	f	t
373	13	t	2020-01-04 15:25:23	2020-01-02 10:06:14.358967	\N	f	f
211	13	t	2020-01-04 15:34:32	2020-01-02 10:01:16.457442	\N	f	f
823	13	t	2020-01-04 15:38:11	2020-01-04 15:38:11.283947	\N	f	t
275	13	t	2020-01-04 15:38:36	2020-01-04 15:38:36.45343	\N	f	t
520	13	t	2020-01-04 15:44:42	2020-01-04 15:44:42.009536	\N	f	t
63	13	t	2020-01-04 15:53:24	2020-01-04 15:53:24.077067	\N	f	t
114	13	t	2020-01-04 16:00:51	2020-01-04 16:00:51.201926	\N	f	t
68	13	t	2020-01-04 16:03:10	2020-01-04 16:03:10.79909	\N	f	t
11	13	t	2020-01-04 16:10:37	2020-01-04 16:10:37.810491	\N	f	t
823	12	t	2020-01-04 16:12:57	2020-01-04 16:12:57.883964	\N	f	t
11	12	t	2020-01-04 16:13:16	2020-01-04 16:13:16.476572	\N	f	t
33	12	t	2020-01-04 16:13:25	2020-01-02 10:12:28.802124	\N	f	f
68	12	t	2020-01-04 16:13:42	2020-01-03 10:26:10.916124	\N	f	f
114	12	t	2020-01-04 16:13:54	2020-01-04 16:13:54.320689	\N	f	t
820	12	t	2020-01-04 16:13:58	2020-01-04 16:13:58.840212	\N	f	t
37	13	t	2020-01-04 16:15:07	2020-01-04 16:15:07.002683	\N	f	t
37	12	t	2020-01-04 16:15:11	2020-01-03 10:27:02.822806	\N	f	f
392	12	t	2020-01-04 16:35:13	2020-01-02 10:12:59.034874	\N	f	f
520	12	t	2020-01-04 16:35:44	2020-01-04 16:35:44.753025	\N	f	t
223	12	t	2020-01-04 16:35:50	2020-01-02 10:11:27.968246	\N	f	f
275	12	t	2020-01-04 16:36:06	2020-01-03 10:26:16.916806	\N	f	f
14	12	t	2020-01-04 16:36:37	2020-01-02 10:13:18.831822	\N	f	f
169	12	t	2020-01-04 16:36:41	2020-01-02 10:14:49.727731	\N	f	f
75	12	t	2020-01-04 16:39:09	2020-01-02 10:12:04.352266	\N	f	f
109	12	t	2020-01-04 16:39:13	2020-01-02 10:14:23.866382	\N	f	f
322	12	t	2020-01-04 16:39:33	2020-01-04 16:39:33.978065	\N	f	t
7	12	t	2020-01-04 16:40:00	2020-01-04 16:40:00.28446	\N	f	t
116	12	t	2020-01-04 16:48:51	2020-01-02 10:13:03.162659	\N	f	f
235	12	t	2020-01-04 17:58:07	2020-01-04 17:58:07.951986	\N	f	t
828	12	t	2020-01-04 18:04:03	2020-01-04 18:04:03.684092	\N	f	t
707	12	t	2020-01-04 16:51:40	2020-01-02 10:15:32.501316	\N	f	f
669	12	t	2020-01-04 16:51:46	2020-01-03 10:27:52.382122	\N	f	f
24	13	t	2020-01-04 16:55:59	2020-01-04 16:55:59.008824	\N	f	t
672	12	t	2020-01-04 16:56:30	2020-01-04 16:56:30.247352	\N	f	t
241	12	t	2020-01-04 16:58:05	2020-01-04 16:58:05.086328	\N	f	t
94	12	t	2020-01-04 16:59:17	2020-01-04 16:59:17.696136	\N	f	t
712	12	t	2020-01-04 16:59:45	2020-01-03 10:27:12.860204	\N	f	f
232	12	t	2020-01-04 17:00:35	2020-01-04 17:00:35.376541	\N	f	t
98	12	t	2020-01-04 17:07:32	2020-01-04 17:07:32.245669	\N	f	t
825	12	t	2020-01-04 17:09:19	2020-01-04 17:09:19.154445	\N	f	t
115	12	t	2020-01-04 17:10:21	2020-01-02 10:18:02.256306	\N	f	f
79	12	t	2020-01-04 17:13:13	2020-01-04 17:13:13.835664	\N	f	t
675	12	t	2020-01-04 17:14:53	2020-01-02 10:15:45.803935	\N	f	f
78	12	t	2020-01-04 17:16:43	2020-01-03 10:27:40.705696	\N	f	f
119	12	t	2020-01-04 17:22:53	2020-01-04 17:22:53.798637	\N	f	t
173	12	t	2020-01-04 17:22:59	2020-01-03 10:27:19.971206	\N	f	f
229	12	t	2020-01-04 17:28:17	2020-01-04 17:28:17.235063	\N	f	t
326	12	t	2020-01-04 17:28:32	2020-01-04 17:27:27.444311	\N	f	t
826	12	t	2020-01-04 17:30:29	2020-01-04 17:30:29.296478	\N	f	t
24	12	t	2020-01-04 18:06:08	2020-01-02 10:13:22.554709	\N	f	f
147	12	t	2020-01-04 17:34:01	2020-01-02 10:14:03.223182	\N	f	f
245	12	t	2020-01-04 17:35:17	2020-01-04 17:35:17.894645	\N	f	t
522	12	t	2020-01-04 17:38:36	2020-01-03 10:27:47.070354	\N	f	f
244	12	t	2020-01-04 18:23:35	2020-01-04 18:23:35.834514	\N	f	t
231	12	t	2020-01-04 18:23:42	2020-01-04 18:23:08.995962	\N	f	t
237	12	t	2020-01-04 18:23:48	2020-01-04 18:22:05.905406	\N	f	t
242	12	t	2020-01-04 18:29:20	2020-01-04 18:29:20.219023	\N	f	t
55	12	t	2020-01-04 18:32:04	2020-01-04 18:32:04.554336	\N	f	t
243	12	t	2020-01-04 18:34:54	2020-01-04 18:34:54.814012	\N	f	t
32	12	t	2020-01-04 17:39:20	2020-01-02 10:13:55.001368	\N	f	f
166	12	t	2020-01-04 17:46:35	2020-01-02 10:15:08.80068	\N	f	f
821	12	t	2020-01-04 17:46:42	2020-01-03 10:28:49.896986	\N	f	f
779	12	t	2020-01-04 17:46:48	2020-01-04 17:46:48.056392	\N	f	t
626	12	t	2020-01-04 17:48:17	2020-01-04 17:48:17.168171	\N	f	t
635	12	t	2020-01-04 17:48:20	2020-01-02 10:15:55.447432	\N	f	f
270	12	t	2020-01-04 17:54:02	2020-01-04 17:54:02.624765	\N	f	t
134	12	t	2020-01-04 17:54:07	2020-01-02 10:15:14.979449	\N	f	f
827	12	t	2020-01-04 17:54:25	2020-01-04 17:54:25.538668	\N	f	t
44	12	t	2020-01-04 18:39:52	2020-01-03 10:26:27.054896	\N	f	f
144	12	t	2020-01-04 18:51:06	2020-01-04 18:51:06.946015	\N	f	t
80	12	t	2020-01-04 18:53:43	2020-01-02 10:14:45.873144	\N	f	f
248	12	t	2020-01-04 19:04:06	2020-01-04 19:04:06.599044	\N	f	t
824	12	t	2020-01-04 19:14:46	2020-01-04 19:14:46.178644	\N	f	t
720	12	t	2020-01-04 20:33:19	2020-01-04 20:33:19.115465	\N	f	t
744	12	t	2020-01-04 21:16:00	2020-01-04 21:16:00.836166	\N	f	t
746	12	t	2020-01-04 21:16:23	2020-01-04 21:16:23.77253	\N	f	t
\.


--
-- Data for Name: sub_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sub_menu (id, name, page, id_menu) FROM stdin;
1	Client	client	2
2	Event	event	2
3	Journalist	journalist	2
4	Journalist Category	journalist_category	2
5	Media	media	2
6	System User	user	1
7	User Privillage	userprivillage	1
\.


--
-- Data for Name: user_level; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_level (id, name, created_at, updated_at) FROM stdin;
1	admin	2019-10-28 14:11:30.950063	2019-10-28 14:17:09
\.


--
-- Data for Name: user_privillage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_privillage (created_at, id_menu, id_sub_menu, id_user_system) FROM stdin;
2019-11-19 14:53:46.294917	1	6	3
2019-11-19 14:53:46.294917	1	7	3
2019-11-19 14:53:46.294917	2	1	3
2019-11-19 14:53:46.294917	2	2	3
2019-11-19 14:53:46.294917	2	3	3
2019-11-19 14:53:46.294917	2	4	3
2019-11-19 14:53:46.294917	2	5	3
2019-11-19 14:53:46.294917	3	\N	3
2019-11-19 14:53:46.294917	4	\N	3
2019-11-19 15:07:18.044791	2	1	5
2019-11-19 15:07:18.044791	2	2	5
2019-11-19 15:07:18.044791	2	3	5
2019-11-19 15:07:18.044791	2	4	5
2019-11-19 15:07:18.044791	2	5	5
2019-11-19 15:07:18.044791	3	\N	5
2019-11-19 15:07:18.044791	4	\N	5
\.


--
-- Data for Name: user_system; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_system (id, name, username, password, is_active, created_at, updated_at, id_user_level) FROM stdin;
4	Kika	kika@gmail.com	a75d6facf7c869005a5d97293235d365	t	2019-10-29 15:02:17.229182	2019-10-29 15:02:28	1
3	Hendi Rusfandi	rusfandi.hendi@gmail.com	fea88a99d8f986b73798b43125cbfdf9	t	2019-10-28 15:39:08.150848	2019-11-08 17:51:32	1
5	Bening Admin	info@bening-communication.com	fea88a99d8f986b73798b43125cbfdf9	t	2019-11-19 15:06:17.615482	2019-11-19 15:07:55	1
\.


--
-- Name: client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_id_seq', 6, true);


--
-- Name: event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_id_seq', 13, true);


--
-- Name: journalist_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.journalist_category_id_seq', 15, true);


--
-- Name: journalist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.journalist_id_seq', 828, true);


--
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.media_id_seq', 675, true);


--
-- Name: menu_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_category_id_seq', 2, true);


--
-- Name: menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_id_seq', 4, true);


--
-- Name: sub_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sub_menu_id_seq', 7, true);


--
-- Name: user_level_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_level_id_seq', 1, true);


--
-- Name: user_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_system_id_seq', 5, true);


--
-- Name: client client_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pk PRIMARY KEY (id);


--
-- Name: event event_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pk PRIMARY KEY (id);


--
-- Name: journalist_category journalist_category_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journalist_category
    ADD CONSTRAINT journalist_category_pk PRIMARY KEY (id);


--
-- Name: journalist journalist_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journalist
    ADD CONSTRAINT journalist_pk PRIMARY KEY (id);


--
-- Name: media media_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pk PRIMARY KEY (id);


--
-- Name: menu_category menu_category_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_category
    ADD CONSTRAINT menu_category_pk PRIMARY KEY (id);


--
-- Name: menu menu_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pk PRIMARY KEY (id);


--
-- Name: presence_list presence_list_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presence_list
    ADD CONSTRAINT presence_list_pk PRIMARY KEY (id_journalist, id_event);


--
-- Name: sub_menu sub_menu_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_menu
    ADD CONSTRAINT sub_menu_pk PRIMARY KEY (id);


--
-- Name: user_level user_level_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_level
    ADD CONSTRAINT user_level_pk PRIMARY KEY (id);


--
-- Name: user_system user_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_system
    ADD CONSTRAINT user_pk PRIMARY KEY (id);


--
-- Name: event client_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT client_fk FOREIGN KEY (id_client) REFERENCES public.client(id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: presence_list event_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presence_list
    ADD CONSTRAINT event_fk FOREIGN KEY (id_event) REFERENCES public.event(id) MATCH FULL ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: journalist journalist_category_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journalist
    ADD CONSTRAINT journalist_category_fk FOREIGN KEY (id_journalist_category) REFERENCES public.journalist_category(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: presence_list journalist_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presence_list
    ADD CONSTRAINT journalist_fk FOREIGN KEY (id_journalist) REFERENCES public.journalist(id) MATCH FULL ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: journalist media_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journalist
    ADD CONSTRAINT media_fk FOREIGN KEY (id_media) REFERENCES public.media(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: menu menu_category_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_category_fk FOREIGN KEY (id_menu_category) REFERENCES public.menu_category(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: sub_menu menu_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_menu
    ADD CONSTRAINT menu_fk FOREIGN KEY (id_menu) REFERENCES public.menu(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: user_privillage menu_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_privillage
    ADD CONSTRAINT menu_fk FOREIGN KEY (id_menu) REFERENCES public.menu(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: user_system user_level_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_system
    ADD CONSTRAINT user_level_fk FOREIGN KEY (id_user_level) REFERENCES public.user_level(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: user_privillage user_system_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_privillage
    ADD CONSTRAINT user_system_fk FOREIGN KEY (id_user_system) REFERENCES public.user_system(id) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

