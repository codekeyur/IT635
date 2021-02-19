--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.1

-- Started on 2021-02-13 17:20:55 EST

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
-- TOC entry 202 (class 1259 OID 16515)
-- Name: diagnosis; Type: TABLE; Schema: public; Owner: keyurpatel
--
CREATE DATABASE hospital_db

CREATE TABLE public.diagnosis (
    diagnosis_id integer NOT NULL,
    visit_id integer NOT NULL,
    disease_id integer NOT NULL
);


ALTER TABLE public.diagnosis OWNER TO keyurpatel;

--
-- TOC entry 201 (class 1259 OID 16513)
-- Name: diagnosis_diagnosis_id_seq; Type: SEQUENCE; Schema: public; Owner: keyurpatel
--

CREATE SEQUENCE public.diagnosis_diagnosis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.diagnosis_diagnosis_id_seq OWNER TO keyurpatel;

--
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 201
-- Name: diagnosis_diagnosis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: keyurpatel
--

ALTER SEQUENCE public.diagnosis_diagnosis_id_seq OWNED BY public.diagnosis.diagnosis_id;


--
-- TOC entry 200 (class 1259 OID 16505)
-- Name: diseases; Type: TABLE; Schema: public; Owner: keyurpatel
--

CREATE TABLE public.diseases (
    disease_id integer NOT NULL,
    disease_name character varying(255) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.diseases OWNER TO keyurpatel;

--
-- TOC entry 204 (class 1259 OID 17480)
-- Name: doctor; Type: TABLE; Schema: public; Owner: keyurpatel
--

CREATE TABLE public.doctor (
    doctor_id integer NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    email character varying(45) NOT NULL,
    phone character varying(45) NOT NULL
);


ALTER TABLE public.doctor OWNER TO keyurpatel;

--
-- TOC entry 203 (class 1259 OID 17478)
-- Name: doctor_doctor_id_seq; Type: SEQUENCE; Schema: public; Owner: keyurpatel
--

CREATE SEQUENCE public.doctor_doctor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.doctor_doctor_id_seq OWNER TO keyurpatel;

--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 203
-- Name: doctor_doctor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: keyurpatel
--

ALTER SEQUENCE public.doctor_doctor_id_seq OWNED BY public.doctor.doctor_id;


--
-- TOC entry 206 (class 1259 OID 17488)
-- Name: medicine; Type: TABLE; Schema: public; Owner: keyurpatel
--

CREATE TABLE public.medicine (
    medicine_id integer NOT NULL,
    medicine_name character varying(45) NOT NULL,
    description text
);


ALTER TABLE public.medicine OWNER TO keyurpatel;

--
-- TOC entry 205 (class 1259 OID 17486)
-- Name: medicine_medicine_id_seq; Type: SEQUENCE; Schema: public; Owner: keyurpatel
--

CREATE SEQUENCE public.medicine_medicine_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medicine_medicine_id_seq OWNER TO keyurpatel;

--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 205
-- Name: medicine_medicine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: keyurpatel
--

ALTER SEQUENCE public.medicine_medicine_id_seq OWNED BY public.medicine.medicine_id;


--
-- TOC entry 208 (class 1259 OID 17499)
-- Name: nurse; Type: TABLE; Schema: public; Owner: keyurpatel
--

CREATE TABLE public.nurse (
    nurse_id integer NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    phone character varying(45) NOT NULL
);


ALTER TABLE public.nurse OWNER TO keyurpatel;

--
-- TOC entry 207 (class 1259 OID 17497)
-- Name: nurse_nurse_id_seq; Type: SEQUENCE; Schema: public; Owner: keyurpatel
--

CREATE SEQUENCE public.nurse_nurse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nurse_nurse_id_seq OWNER TO keyurpatel;

--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 207
-- Name: nurse_nurse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: keyurpatel
--

ALTER SEQUENCE public.nurse_nurse_id_seq OWNED BY public.nurse.nurse_id;


--
-- TOC entry 210 (class 1259 OID 17507)
-- Name: patient; Type: TABLE; Schema: public; Owner: keyurpatel
--

CREATE TABLE public.patient (
    patient_id integer NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    email character varying(45) NOT NULL,
    phone character varying(45) NOT NULL,
    street_address character varying(100) DEFAULT NULL::character varying,
    city character varying(45) DEFAULT NULL::character varying,
    zip integer,
    states character varying(20) DEFAULT NULL::character varying,
    country character varying(45) DEFAULT NULL::character varying,
    gender character varying(10) DEFAULT NULL::character varying
);


ALTER TABLE public.patient OWNER TO keyurpatel;

--
-- TOC entry 212 (class 1259 OID 17520)
-- Name: patient_nurse; Type: TABLE; Schema: public; Owner: keyurpatel
--

CREATE TABLE public.patient_nurse (
    patient_nurse_id integer NOT NULL,
    patient_id integer NOT NULL,
    nurse_id integer NOT NULL,
    start_date date NOT NULL,
    end_date date
);


ALTER TABLE public.patient_nurse OWNER TO keyurpatel;

--
-- TOC entry 211 (class 1259 OID 17518)
-- Name: patient_nurse_patient_nurse_id_seq; Type: SEQUENCE; Schema: public; Owner: keyurpatel
--

CREATE SEQUENCE public.patient_nurse_patient_nurse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patient_nurse_patient_nurse_id_seq OWNER TO keyurpatel;

--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 211
-- Name: patient_nurse_patient_nurse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: keyurpatel
--

ALTER SEQUENCE public.patient_nurse_patient_nurse_id_seq OWNED BY public.patient_nurse.patient_nurse_id;


--
-- TOC entry 209 (class 1259 OID 17505)
-- Name: patient_patient_id_seq; Type: SEQUENCE; Schema: public; Owner: keyurpatel
--

CREATE SEQUENCE public.patient_patient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patient_patient_id_seq OWNER TO keyurpatel;

--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 209
-- Name: patient_patient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: keyurpatel
--

ALTER SEQUENCE public.patient_patient_id_seq OWNED BY public.patient.patient_id;


--
-- TOC entry 220 (class 1259 OID 17599)
-- Name: patient_room; Type: TABLE; Schema: public; Owner: keyurpatel
--

CREATE TABLE public.patient_room (
    inpatient_id integer NOT NULL,
    patient_id integer NOT NULL,
    room_id integer NOT NULL,
    start_date date,
    end_date date
);


ALTER TABLE public.patient_room OWNER TO keyurpatel;

--
-- TOC entry 214 (class 1259 OID 17543)
-- Name: prescription; Type: TABLE; Schema: public; Owner: keyurpatel
--

CREATE TABLE public.prescription (
    prescription_id integer NOT NULL,
    diagnosis_id integer NOT NULL,
    prescription_date date NOT NULL
);


ALTER TABLE public.prescription OWNER TO keyurpatel;

--
-- TOC entry 215 (class 1259 OID 17554)
-- Name: prescription_medicine; Type: TABLE; Schema: public; Owner: keyurpatel
--

CREATE TABLE public.prescription_medicine (
    prescription_id integer NOT NULL,
    medicine_id integer NOT NULL,
    start_date date NOT NULL,
    end_date date,
    quantity integer NOT NULL
);


ALTER TABLE public.prescription_medicine OWNER TO keyurpatel;

--
-- TOC entry 213 (class 1259 OID 17541)
-- Name: prescription_prescription_id_seq; Type: SEQUENCE; Schema: public; Owner: keyurpatel
--

CREATE SEQUENCE public.prescription_prescription_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prescription_prescription_id_seq OWNER TO keyurpatel;

--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 213
-- Name: prescription_prescription_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: keyurpatel
--

ALTER SEQUENCE public.prescription_prescription_id_seq OWNED BY public.prescription.prescription_id;


--
-- TOC entry 217 (class 1259 OID 17571)
-- Name: room; Type: TABLE; Schema: public; Owner: keyurpatel
--

CREATE TABLE public.room (
    room_id integer NOT NULL,
    status character varying(45) DEFAULT NULL::character varying
);


ALTER TABLE public.room OWNER TO keyurpatel;

--
-- TOC entry 216 (class 1259 OID 17569)
-- Name: room_room_id_seq; Type: SEQUENCE; Schema: public; Owner: keyurpatel
--

CREATE SEQUENCE public.room_room_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.room_room_id_seq OWNER TO keyurpatel;

--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 216
-- Name: room_room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: keyurpatel
--

ALTER SEQUENCE public.room_room_id_seq OWNED BY public.room.room_id;


--
-- TOC entry 219 (class 1259 OID 17580)
-- Name: visit; Type: TABLE; Schema: public; Owner: keyurpatel
--

CREATE TABLE public.visit (
    visit_id integer NOT NULL,
    patient_id integer NOT NULL,
    doctor_id integer NOT NULL,
    visit_date date NOT NULL
);


ALTER TABLE public.visit OWNER TO keyurpatel;

--
-- TOC entry 218 (class 1259 OID 17578)
-- Name: visit_visit_id_seq; Type: SEQUENCE; Schema: public; Owner: keyurpatel
--

CREATE SEQUENCE public.visit_visit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.visit_visit_id_seq OWNER TO keyurpatel;

--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 218
-- Name: visit_visit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: keyurpatel
--

ALTER SEQUENCE public.visit_visit_id_seq OWNED BY public.visit.visit_id;


--
-- TOC entry 3177 (class 2604 OID 17614)
-- Name: diagnosis diagnosis_id; Type: DEFAULT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.diagnosis ALTER COLUMN diagnosis_id SET DEFAULT nextval('public.diagnosis_diagnosis_id_seq'::regclass);


--
-- TOC entry 3178 (class 2604 OID 17615)
-- Name: doctor doctor_id; Type: DEFAULT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.doctor ALTER COLUMN doctor_id SET DEFAULT nextval('public.doctor_doctor_id_seq'::regclass);


--
-- TOC entry 3179 (class 2604 OID 17616)
-- Name: medicine medicine_id; Type: DEFAULT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.medicine ALTER COLUMN medicine_id SET DEFAULT nextval('public.medicine_medicine_id_seq'::regclass);


--
-- TOC entry 3180 (class 2604 OID 17617)
-- Name: nurse nurse_id; Type: DEFAULT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.nurse ALTER COLUMN nurse_id SET DEFAULT nextval('public.nurse_nurse_id_seq'::regclass);


--
-- TOC entry 3186 (class 2604 OID 17618)
-- Name: patient patient_id; Type: DEFAULT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.patient ALTER COLUMN patient_id SET DEFAULT nextval('public.patient_patient_id_seq'::regclass);


--
-- TOC entry 3187 (class 2604 OID 17619)
-- Name: patient_nurse patient_nurse_id; Type: DEFAULT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.patient_nurse ALTER COLUMN patient_nurse_id SET DEFAULT nextval('public.patient_nurse_patient_nurse_id_seq'::regclass);


--
-- TOC entry 3188 (class 2604 OID 17620)
-- Name: prescription prescription_id; Type: DEFAULT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.prescription ALTER COLUMN prescription_id SET DEFAULT nextval('public.prescription_prescription_id_seq'::regclass);


--
-- TOC entry 3190 (class 2604 OID 17621)
-- Name: room room_id; Type: DEFAULT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.room ALTER COLUMN room_id SET DEFAULT nextval('public.room_room_id_seq'::regclass);


--
-- TOC entry 3191 (class 2604 OID 17622)
-- Name: visit visit_id; Type: DEFAULT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.visit ALTER COLUMN visit_id SET DEFAULT nextval('public.visit_visit_id_seq'::regclass);


--
-- TOC entry 3358 (class 0 OID 16515)
-- Dependencies: 202
-- Data for Name: diagnosis; Type: TABLE DATA; Schema: public; Owner: keyurpatel
--

COPY public.diagnosis (diagnosis_id, visit_id, disease_id) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
5	5	5
6	6	21
7	7	6
8	8	21
9	9	21
10	10	8
11	11	10
12	12	12
13	13	9
14	14	15
15	15	16
16	16	19
17	17	15
18	18	21
19	19	21
20	20	21
21	21	21
22	22	15
23	23	17
24	24	21
25	25	21
26	26	21
27	27	21
28	28	2
29	29	6
30	30	19
31	31	4
32	32	9
33	33	3
34	34	15
35	35	3
36	36	1
37	37	21
38	38	21
39	39	15
40	40	16
41	41	17
42	42	21
43	43	21
44	44	21
45	45	19
46	46	2
47	47	8
48	48	3
49	49	21
50	50	21
51	51	4
52	52	12
53	53	12
54	54	12
55	55	12
56	56	19
57	57	19
58	58	19
59	59	19
\.


--
-- TOC entry 3356 (class 0 OID 16505)
-- Dependencies: 200
-- Data for Name: diseases; Type: TABLE DATA; Schema: public; Owner: keyurpatel
--

COPY public.diseases (disease_id, disease_name, description) FROM stdin;
1	Abdominal aortic aneurysm	An abdominal aortic aneurysm (AAA) is a swelling (aneurysm) of the aorta – the main blood vessel that leads away from the heart, down through the abdomen to the rest of the body.
2	Acne	Acne is a common skin condition that affects most people at some poINTEGER. It causes spots, oily skin and sometimes skin that is hot or painful to touch.
3	Asthma	Asthma is a common long-term condition that can cause coughing, wheezing, chest tightness and breathlessness.
4	Autism spectrum disorder (ASD)	Autism spectrum disorder (ASD) is a condition that affects social INTEGEReraction, communication, intrests and behaviour.
5	Bronchitis	Bronchitis is an infection of the main airways of the lungs (bronchi), causing them to become irritated and inflamed.
6	Common Cold	A cold is a mild viral infection of the nose, throat, sinuses and upper airways. Its very common and usually clears up on its own within a week or two.
7	Constipation	Constipation is a common condition that affects people of all ages. It can mean that you are not passing stools regularly or you are unable to completely empty your bowel.
8	Diabetes	Diabetes is a lifelong condition that causes a person blood sugar level to become too high.
9	Flu	Flu (influenza) is a common infectious viral illness spread by coughs and sneezes. It can be very unpleasant, but you will usually begin to feel better within about a week.
10	Heart failure	Heart failure is a serious condition, but it does not actually mean that your heart has failed. It means that your heart is not pumping blood around your body very efficiently.
11	Insomnia	Insomnia is difficulty getting to sleep or staying asleep for long enough to feel refreshed the next morning.
12	Liver Cancer	Primary liver cancer is an uncommon but serious type of cancer that begins in the liver.
13	Migraines	A migraine is usually a moderate or severe headache felt as a throbbing pain on one side of the head.
14	Psoriasis	Psoriasis is a skin condition that causes red, flaky, crusty patches of skin covered with silvery scales.
15	Schizophrenia	Schizophrenia is a long-term mental health condition that causes a range of different psychological symptoms
16	Melanoma	Melanoma is a type of skin cancer that can spread to other organs in the body.
17	Sore throat	Sore throats are very common and usually nothing to worry about. They normally get better within a week.
18	Urinary tract infection	Urinary tract infections (UTIs) are common infections that can affect the bladder, the kidneys and the tubes connected to them.
19	Leg ulcer	A leg ulcer is a long-lasting (chronic) sore that takes more than 4 to 6 weeks to heal. They usually develop on the inside of the leg, just above the ankle.
20	Yellow fever	Yellow fever is a serious viral infection that is spread by certain types of mosquito. Its mainly found in sub-Saharan Africa, South America and parts of the Caribbean.
21	Healthy	Patient is healthy
\.


--
-- TOC entry 3360 (class 0 OID 17480)
-- Dependencies: 204
-- Data for Name: doctor; Type: TABLE DATA; Schema: public; Owner: keyurpatel
--

COPY public.doctor (doctor_id, first_name, last_name, email, phone) FROM stdin;
1	Braelyn	Richmond	Braelyn1Richmond@hospitalteam.com	(628) 737-8387
2	Kameron	Benson	Kameron2Benson@hospitalteam.com	(412) 542-1964
3	Hugo	Randolph	Hugo3Randolph@hospitalteam.com	(977) 281-4408
4	Adalyn	Aguilar	Adalyn4Aguilar@hospitalteam.com	(897) 406-2496
5	Deborah	Stevens	Deborah5Stevens@hospitalteam.com	(295) 952-1762
6	Riya	Valdez	Riya6Valdez@hospitalteam.com	(456) 630-2623
7	Paityn	Liu	Paityn7Liu@hospitalteam.com	(357) 707-9281
8	Dorian	Gray	Dorian8Gray@hospitalteam.com	(342) 587-7675
9	Lillie	Madden	Lillie9Madden@hospitalteam.com	(242) 303-5504
10	Marlie	Carson	Marlie10Carson@hospitalteam.com	(840) 215-7859
11	Eric	Little	Eric11Little@hospitalteam.com	(240) 946-4206
12	Draven	Bauer	Draven12Bauer@hospitalteam.com	(752) 320-9309
13	Judith	Walker	Judith13Walker@hospitalteam.com	(298) 754-7168
14	Paris	Villa	Paris14Villa@hospitalteam.com	(747) 652-9428
15	Francesca	Valencia	Francesca15Valencia@hospitalteam.com	(871) 849-2091
\.


--
-- TOC entry 3362 (class 0 OID 17488)
-- Dependencies: 206
-- Data for Name: medicine; Type: TABLE DATA; Schema: public; Owner: keyurpatel
--

COPY public.medicine (medicine_id, medicine_name, description) FROM stdin;
1	Carvedilol (Coreg)	Beta blockers
2	Tetracycline	Oral antibiotics
3	Fluticasone (Flovent HFA)	Fluticasone (Flovent HFA)
4	Prozac	selective serotonin reuptake inhibitors (SSRIs)
5	Ibuprofen	Over the counter drug
6	Theraflu	Over the counter drug for cold and flu
7	Pepto Bismol	Over the counter drug for constipation
8	Novolin	short acting insulin
9	Theraflu	Over the counter drug for cold and flu
10	Novolin	Decreases blood clotting
11	Lunesta	Non-benzodiazepine sedative
12	Cabozantinib-S-Malate	Cancer treatment medication
13	Tylenon	Over the counter pain medication
14	Enbrel	psoriasis treatment
15	Clozapine (Clozaril)	antipsychotic medication
16	Aldesleukin	Skin cancer medication
17	Mucinex	Over the counter drug for sore throat
18	AZO	Urinary pain relief
19	UlcerGard	uleg ulcer medication
\.


--
-- TOC entry 3364 (class 0 OID 17499)
-- Dependencies: 208
-- Data for Name: nurse; Type: TABLE DATA; Schema: public; Owner: keyurpatel
--

COPY public.nurse (nurse_id, first_name, last_name, phone) FROM stdin;
1	Jane	Donahoe	(202)123-4567
2	Alejandro	Reeves	(228) 767-2381
3	Osvaldo	Hammond	(624) 676-7199
4	Lou	Parrish	(946) 734-6099
5	Louise	Weeks	(404) 350-5679
6	Phyllis	Hammond	(254) 594-1551
7	Teisha	Sims	(974) 375-5679
8	Robena	Munoz	(210) 227-4128
9	Marlen	Mcclure	(705) 252-7850
10	Sarita	Schmidt	(782) 374-9636
11	Tuyet	Gordon	(760) 304-0471
12	Jennie	Villarreal	(744) 967-4471
13	Tonette	Wong	(519) 712-4392
14	Xochitl	Camacho	(419) 741-2167
15	Kiley	Bond	(616) 635-7448
16	Eliza	Gentry	(764) 305-0869
17	Steven	West	(240) 803-6370
18	Audra	Griffin	(923) 222-7030
19	Laurene	Hughes	(814) 260-7938
20	Tashina	Roberson	(223) 810-1251
21	Noma	Walter	(672) 662-4794
22	Tamiko	Singleton	(426) 794-5879
23	Minna	Henderson	(567) 831-1194
24	Manda	Maldonado	(629) 950-2738
25	Maribel	Morgan	(509) 805-7702
26	Corie	Cain	(330) 708-6683
27	Gertrude	Ritter	(734) 235-5739
28	Lia	Riley	(436) 515-6860
29	Shizue	Hancock	(215) 664-7452
30	Lakendra	Hanna	(702) 772-1655
31	Wendell	Ker	(634) 937-9124
32	Paul	John	(918) 230-3234
\.


--
-- TOC entry 3366 (class 0 OID 17507)
-- Dependencies: 210
-- Data for Name: patient; Type: TABLE DATA; Schema: public; Owner: keyurpatel
--

COPY public.patient (patient_id, first_name, last_name, email, phone, street_address, city, zip, states, country, gender) FROM stdin;
1	John	Roberts	JohnRoberts1@gmail.com	(301) 123-4567	1234 Gude St.	Silver Spring	20910	MD	United States of America	M
2	Deandre	Barrera	DeandreBarrera2@gmail.com	(214) 710-6821	9730 Valley View Street	Rockville	20910	MD	United States of America	M
3	Maryrose	Duffy	MaryroseDuffy3@gmail.com	(212) 815-7338	86 Brookside Drive	Rockville	20910	MD	United States of America	F
4	Jarvis	Smith	JarvisSmith4@gmail.com	(313) 745-2060	331 Old Marlborough Street	Silver Spring	20910	MD	United States of America	M
5	Enedina	Arellano	EnedinaArellano5@gmail.com	(386) 774-2873	7294 Pineknoll Court	Silver Spring	20910	MD	United States of America	F
6	Chuck	Cameron	ChuckCameron6@gmail.com	(715) 878-4217	145 East Tanglewood Ave.	Silver Spring	20910	MD	United States of America	M
7	Honey	Curry	HoneyCurry7@gmail.com	(489) 766-9947	863 Bridgeton St.	Rockville	20821	MD	United States of America	F
8	Napoleon	Bridges	NapoleonBridges8@gmail.com	(648) 838-3283	620 East Rockland Dr.	Arlington	20312	VA	United States of America	M
9	Camelia	Walters	CameliaWalters9@gmail.com	(333) 798-5478	5 Poplar Dr.	Alexandria	39492	VA	United States of America	F
10	Herschel	Fuentes	HerschelFuentes10@gmail.com	(498) 852-7313	4 West Berkshire Ave.	Arlington	20821	VA	United States of America	M
11	Ignacia	Nichols	IgnaciaNichols11@gmail.com	(304) 296-3704	127 Manor St.	Arlington	20821	VA	United States of America	F
12	Letty	Mckinney	LettyMckinney12@gmail.com	(883) 703-6834	8668 SW. Sugar St.	Alexandria	20821	VA	United States of America	F
13	Cleopatra	Choi	CleopatraChoi13@gmail.com	(428) 465-8888	9201 Monroe Court	Silver Spring	20821	MD	United States of America	F
14	Felisha	Mathis	FelishaMathis14@gmail.com	(930) 751-3796	8707 E. Cypress St.	Silver Spring	20821	MD	United States of America	F
15	Margaret	Mejia	MargaretMejia15@gmail.com	(283) 767-9818	7232 Gregory Rd.	Rockville	20986	MD	United States of America	F
16	Flo	Porter	FloPorter16@gmail.com	(331) 872-4501	1 Glen Creek St.	Alexandria	20821	VA	United States of America	F
17	Sarai	Montgomery	SaraiMontgomery17@gmail.com	(641) 496-1829	446 Orchard Lane	Arlington	20821	VA	United States of America	F
18	Kai	Eaton	KaiEaton18@gmail.com	(842) 910-6719	16 Wagon Ave.	Alexandria	20821	VA	United States of America	F
19	Antoinette	Cisneros	AntoinetteCisneros19@gmail.com	(996) 676-1136	9894 Sheffield St.	Arlington	50273	VA	United States of America	F
20	Jewell	Phillips	JewellPhillips20@gmail.com	(903) 546-3207	6 Gonzales St.	Alexandria	30284	VA	United States of America	M
21	Rosemarie	Riggs	RosemarieRiggs21@gmail.com	(578) 787-1286	Bethel Park, PA 15102	Alexandria	40282	VA	United States of America	F
22	Pamala	Clay	PamalaClay22@gmail.com	(791) 293-6354	30 John Lane	Rockville	30291	MD	United States of America	F
23	Torri	Lam	TorriLam23@gmail.com	(446) 830-2529	301 Prairie Drive	Silver Spring	20910	MD	United States of America	F
24	Kia	Harris	KiaHarris24@gmail.com	(225) 782-0857	9889 Liberty Lane	Silver Spring	20910	MD	United States of America	F
25	Patsy	Aguilar	PatsyAguilar25@gmail.com	(596) 737-5732	8707 Hartford Circle	Silver Spring	20910	MD	United States of America	F
26	Charlette	Sutton	CharletteSutton26@gmail.com	(830) 390-3914	255 North Belmont St.	Silver Spring	20910	MD	United States of America	F
27	Nikia	Stevens	NikiaStevens27@gmail.com	(223) 742-4816	9931 Smith Store Street	Rockville	20986	MD	United States of America	F
28	Antonette	Shaw	AntonetteShaw28@gmail.com	(312) 345-4961	9339 Newcastle Dr.	Rockville	20986	MD	United States of America	F
29	Cythia	Branch	CythiaBranch29@gmail.com	(601) 821-3797	646 1st Ave.	Rockville	20986	MD	United States of America	F
30	Daine	Roach	DaineRoach30@gmail.com	(756) 735-9841	7070 Theatre Street	Rockville	20986	MD	United States of America	F
31	Karol	Grimes	KarolGrimes31@gmail.com	(950) 386-9884	8 Tallwood Lane	Alexandria	30284	VA	United States of America	F
32	Ian	Reed	IanReed32@gmail.com	(681) 500-0039	664 Johnson Ave.	Alexandria	40282	VA	United States of America	M
33	Cesar	Lambert	CesarLambert33@gmail.com	(625) 736-5145	9911 Colonial Lane	Arlington	30284	VA	United States of America	M
34	Michaele	Mclean	MichaeleMclean34@gmail.com	(672) 846-2951	87 Shub Farm Road	Arlington	40282	VA	United States of America	F
35	Eusebia	Whitehead	EusebiaWhitehead35@gmail.com	(622) 413-1680	9400 Morris Circle	Arlington	30284	VA	United States of America	F
36	Norman	Spence	NormanSpence36@gmail.com	(765) 664-0007	347 Westminster St.	Arlington	40282	VA	United States of America	M
37	Delorse	Brown	DelorseBrown37@gmail.com	(314) 460-4346	8493 Mulberry Lane	Arlington	32382	VA	United States of America	F
38	Brenda	Schaefer	BrendaSchaefer38@gmail.com	(389) 252-5476	8630 Fairview Ave.	Arlington	40923	VA	United States of America	F
39	Minnie	Randall	MinnieRandall39@gmail.com	(690) 956-3552	4 South Hill Field St.	Arlington	30284	VA	United States of America	F
40	Moses	Peterson	MosesPeterson40@gmail.com	(423) 678-8686	51 Manor St.	Alexandria	40282	VA	United States of America	M
41	Gerardo	Ramirez	GerardoRamirez41@gmail.com	(692) 783-8733	624 Schoolhouse Street	Arlington	14345	VA	United States of America	M
42	Madelaine	Orozco	MadelaineOrozco42@gmail.com	(239) 982-5563	9208 Brickell St.	Alexandria	30283	VA	United States of America	F
43	Rochel	Chan	RochelChan43@gmail.com	(688) 606-0666	978 Belmont Lane	Alexandria	30283	VA	United States of America	F
44	Refugia	Solomon	RefugiaSolomon44@gmail.com	(300) 383-3417	62 Cedar Swamp Rd.	Alexandria	30283	VA	United States of America	F
45	Bethanie	Callahan	BethanieCallahan45@gmail.com	(296) 241-1734	7906 N. Church Dr.	Alexandria	20986	VA	United States of America	F
46	Siu	Zuniga	SiuZuniga46@gmail.com	(473) 550-9106	7740 East Carriage St.	Silver Spring	20821	MD	United States of America	F
47	Dorla	Escobar	DorlaEscobar47@gmail.com	(918) 883-6593	555 Cambridge Lane	Arlington	20821	VA	United States of America	F
48	Delena	Shaffer	DelenaShaffer48@gmail.com	(730) 936-3927	98 Lakeview St.	Rockville	20986	MD	United States of America	F
49	Milo	Farley	MiloFarley49@gmail.com	(681) 568-4457	441 Cleveland Street	Arlington	20986	VA	United States of America	M
50	Beryl	Everett	BerylEverett50@gmail.com	(713) 878-4338	901 W. High Noon Dr.	Rockville	20821	MD	United States of America	F
51	Stacy	Dixon	StacyDixon51@gmail.com	(441) 276-4008	9273 Kent Street	Rockville	32845	MD	United States of America	F
\.


--
-- TOC entry 3368 (class 0 OID 17520)
-- Dependencies: 212
-- Data for Name: patient_nurse; Type: TABLE DATA; Schema: public; Owner: keyurpatel
--

COPY public.patient_nurse (patient_nurse_id, patient_id, nurse_id, start_date, end_date) FROM stdin;
1	1	1	2019-11-01	\N
2	3	3	2019-11-03	\N
3	4	4	2019-11-05	\N
4	5	7	2019-11-07	\N
5	10	9	2019-11-09	\N
6	11	11	2019-11-11	\N
7	12	14	2019-11-13	2019-11-14
8	14	16	2019-11-15	\N
9	15	18	2019-11-17	\N
10	16	20	2019-11-19	\N
11	22	21	2019-11-21	\N
12	30	22	2019-11-23	2019-11-24
13	31	29	2019-11-25	\N
14	33	1	2019-11-27	\N
15	35	12	2019-11-29	\N
16	36	32	2019-12-01	\N
17	39	31	2019-12-03	\N
18	40	30	2019-12-05	\N
19	45	3	2019-12-07	\N
20	47	4	2019-12-09	\N
21	48	7	2019-12-11	\N
22	51	12	2019-12-13	\N
23	12	1	2019-12-15	2019-12-17
24	30	3	2019-12-17	2019-12-20
25	2	4	2019-12-19	\N
26	6	7	2019-12-21	\N
27	7	9	2019-12-23	\N
28	8	11	2019-12-25	\N
29	9	14	2019-12-27	\N
30	13	16	2019-12-29	\N
31	12	18	2019-12-31	2020-01-02
32	17	20	2020-01-02	\N
33	30	21	2020-01-04	2020-01-06
34	18	22	2020-01-06	\N
35	19	29	2020-01-08	\N
36	20	1	2020-01-10	\N
37	30	12	2020-01-12	2020-01-16
38	12	32	2020-01-14	2020-01-16
39	21	31	2020-01-16	\N
40	34	30	2020-01-18	\N
41	37	3	2020-01-20	\N
42	38	4	2020-01-22	\N
43	30	7	2020-01-24	2020-01-26
44	41	12	2020-01-26	\N
45	42	1	2020-01-28	\N
46	43	3	2020-01-30	\N
47	44	4	2020-02-01	\N
48	12	7	2020-02-03	2020-02-05
49	46	9	2020-02-05	\N
50	30	11	2020-02-07	2020-02-10
\.


--
-- TOC entry 3376 (class 0 OID 17599)
-- Dependencies: 220
-- Data for Name: patient_room; Type: TABLE DATA; Schema: public; Owner: keyurpatel
--

COPY public.patient_room (inpatient_id, patient_id, room_id, start_date, end_date) FROM stdin;
1	1	1	2019-11-01	\N
2	3	5	2019-11-03	\N
3	4	6	2019-11-05	\N
4	5	14	2019-11-07	\N
5	10	15	2019-11-09	\N
6	11	16	2019-11-11	\N
7	12	17	2019-11-13	2019-11-14
8	14	19	2019-11-15	\N
9	15	24	2019-11-17	\N
10	16	26	2019-11-19	\N
11	22	27	2019-11-21	\N
12	30	28	2019-11-23	2019-11-24
13	31	33	2019-11-25	\N
14	33	40	2019-11-27	\N
15	35	44	2019-11-29	\N
16	36	45	2019-12-01	\N
17	39	47	2019-12-03	\N
18	40	48	2019-12-05	\N
19	45	54	2019-12-07	\N
20	47	58	2019-12-09	\N
21	48	62	2019-12-11	\N
22	51	65	2019-12-13	\N
23	12	1	2019-12-15	2019-12-17
24	30	5	2019-12-17	2019-12-20
25	2	6	2019-12-19	\N
26	6	14	2019-12-21	\N
27	7	15	2019-12-23	\N
28	8	16	2019-12-25	\N
29	9	14	2019-12-27	\N
30	13	15	2019-12-29	\N
31	12	16	2019-12-31	2020-01-02
32	17	17	2020-01-02	\N
33	30	19	2020-01-04	2020-01-06
34	18	24	2020-01-06	\N
35	19	28	2020-01-08	\N
36	20	33	2020-01-10	\N
37	30	40	2020-01-12	2020-01-16
38	12	44	2020-01-14	2020-01-16
39	21	45	2020-01-16	\N
40	34	47	2020-01-18	\N
41	37	48	2020-01-20	\N
42	38	54	2020-01-22	\N
43	30	28	2020-01-24	2020-01-26
44	41	33	2020-01-26	\N
45	42	40	2020-01-28	\N
46	43	44	2020-01-30	\N
47	44	45	2020-02-01	\N
48	12	47	2020-02-03	2020-02-05
49	46	48	2020-02-05	\N
50	30	54	2020-02-07	2020-02-10
\.


--
-- TOC entry 3370 (class 0 OID 17543)
-- Dependencies: 214
-- Data for Name: prescription; Type: TABLE DATA; Schema: public; Owner: keyurpatel
--

COPY public.prescription (prescription_id, diagnosis_id, prescription_date) FROM stdin;
1	1	2019-11-01
2	2	2018-08-11
3	3	2019-11-03
4	4	2019-11-05
5	5	2019-11-07
6	7	2017-05-13
7	10	2019-11-09
8	11	2019-11-11
9	12	2019-11-13
10	13	2018-11-09
11	14	2019-11-15
12	15	2019-11-17
13	16	2019-11-19
14	17	2017-05-13
15	22	2019-11-21
16	23	2018-08-11
17	28	2018-08-11
18	29	2018-11-09
19	30	2019-11-23
20	31	2019-11-25
21	32	2017-05-13
22	33	2019-11-27
23	34	2018-08-11
24	35	2019-11-29
25	36	2019-12-01
26	39	2019-12-03
27	40	2019-12-05
28	41	2017-05-13
29	45	2019-12-07
30	46	2017-05-13
31	47	2019-12-09
32	48	2019-12-11
33	51	2019-12-13
\.


--
-- TOC entry 3371 (class 0 OID 17554)
-- Dependencies: 215
-- Data for Name: prescription_medicine; Type: TABLE DATA; Schema: public; Owner: keyurpatel
--

COPY public.prescription_medicine (prescription_id, medicine_id, start_date, end_date, quantity) FROM stdin;
1	1	2019-11-01	2019-11-30	35
2	2	2018-08-11	2018-12-01	40
3	3	2019-11-03	2019-12-02	20
4	4	2019-11-05	2019-12-03	30
5	5	2019-11-07	2019-12-04	40
6	6	2017-05-13	2017-06-05	60
7	8	2019-11-09	2019-12-06	20
8	10	2019-11-11	2019-12-07	30
9	12	2019-11-13	2019-12-08	30
10	9	2018-11-09	2018-12-09	30
11	15	2019-11-15	2019-12-10	60
12	16	2019-11-17	2019-12-11	90
13	19	2019-11-19	2019-12-12	70
14	15	2017-05-13	2017-07-13	60
15	15	2019-11-21	2019-12-14	30
16	17	2018-08-11	2018-11-15	20
17	2	2018-08-11	2018-11-16	20
18	6	2018-11-09	2018-12-17	20
19	19	2019-11-23	2019-12-18	10
20	4	2019-11-25	2019-12-19	10
21	9	2017-05-13	2017-12-20	20
22	3	2019-11-27	2019-12-21	30
23	15	2018-08-11	2018-12-22	40
24	3	2019-11-29	2019-12-23	40
25	1	2019-12-01	2019-12-24	30
26	15	2019-12-03	2019-12-25	30
27	16	2019-12-05	2019-12-26	20
28	17	2017-05-13	2017-06-27	10
29	19	2019-12-07	2019-12-28	10
30	2	2017-05-13	2017-07-29	50
31	8	2019-12-09	2019-12-30	30
32	3	2019-12-11	2019-12-31	20
33	4	2019-12-13	2020-01-01	40
\.


--
-- TOC entry 3373 (class 0 OID 17571)
-- Dependencies: 217
-- Data for Name: room; Type: TABLE DATA; Schema: public; Owner: keyurpatel
--

COPY public.room (room_id, status) FROM stdin;
1	occupied
2	vacant
3	vacant
4	vacant
5	occupied
6	occupied
7	vacant
8	vacant
9	vacant
10	vacant
11	vacant
12	vacant
13	vacant
14	occupied
15	occupied
16	occupied
17	vacant
18	vacant
19	occupied
20	vacant
21	vacant
22	vacant
23	vacant
24	occupied
25	vacant
26	occupied
27	occupied
28	vacant
29	vacant
30	vacant
31	vacant
32	vacant
33	occupied
34	vacant
35	vacant
36	vacant
37	vacant
38	vacant
39	vacant
40	occupied
41	vacant
42	vacant
43	vacant
44	occupied
45	occupied
46	vacant
47	occupied
48	occupied
49	vacant
50	vacant
51	vacant
52	vacant
53	vacant
54	occupied
55	vacant
56	vacant
57	vacant
58	occupied
59	vacant
60	vacant
61	vacant
62	occupied
63	vacant
64	vacant
65	occupied
66	vacant
67	vacant
68	vacant
69	vacant
70	vacant
71	vacant
72	vacant
73	vacant
74	vacant
\.


--
-- TOC entry 3375 (class 0 OID 17580)
-- Dependencies: 219
-- Data for Name: visit; Type: TABLE DATA; Schema: public; Owner: keyurpatel
--

COPY public.visit (visit_id, patient_id, doctor_id, visit_date) FROM stdin;
1	1	1	2019-11-01
2	2	1	2018-08-11
3	3	2	2019-11-03
4	4	3	2019-11-05
5	5	4	2019-11-07
6	6	1	2018-11-09
7	7	2	2017-05-13
8	8	3	2018-08-11
9	9	4	2018-08-11
10	10	5	2019-11-09
11	11	6	2019-11-11
12	12	7	2019-11-13
13	13	8	2018-11-09
14	14	9	2019-11-15
15	15	10	2019-11-17
16	16	11	2019-11-19
17	17	12	2017-05-13
18	18	13	2018-08-11
19	19	14	2018-08-11
20	20	15	2018-11-09
21	21	11	2017-05-13
22	22	12	2019-11-21
23	23	13	2018-08-11
24	24	14	2018-08-11
25	25	15	2018-11-09
26	26	12	2017-05-13
27	27	1	2018-08-11
28	28	2	2018-08-11
29	29	3	2018-11-09
30	30	4	2019-11-23
31	31	5	2019-11-25
32	32	6	2017-05-13
33	33	7	2019-11-27
34	34	8	2020-01-18
35	35	9	2019-11-29
36	36	10	2019-12-01
37	37	11	2018-08-11
38	38	12	2020-01-22
39	39	13	2019-12-03
40	40	14	2019-12-05
41	41	15	2020-01-26
42	42	1	2020-01-28
43	43	2	2020-01-30
44	44	3	2020-02-01
45	45	4	2019-12-07
46	46	5	2020-02-05
47	47	6	2019-12-09
48	48	7	2019-12-11
49	49	8	2018-08-11
50	50	9	2018-08-11
51	51	10	2019-12-13
52	12	7	2019-12-15
53	12	7	2019-12-31
54	12	7	2020-01-14
55	12	7	2020-02-03
56	30	4	2019-12-17
57	30	4	2020-01-04
58	30	4	2020-01-12
59	30	4	2020-02-07
\.


--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 201
-- Name: diagnosis_diagnosis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: keyurpatel
--

SELECT pg_catalog.setval('public.diagnosis_diagnosis_id_seq', 1, false);


--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 203
-- Name: doctor_doctor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: keyurpatel
--

SELECT pg_catalog.setval('public.doctor_doctor_id_seq', 1, false);


--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 205
-- Name: medicine_medicine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: keyurpatel
--

SELECT pg_catalog.setval('public.medicine_medicine_id_seq', 1, false);


--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 207
-- Name: nurse_nurse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: keyurpatel
--

SELECT pg_catalog.setval('public.nurse_nurse_id_seq', 1, false);


--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 211
-- Name: patient_nurse_patient_nurse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: keyurpatel
--

SELECT pg_catalog.setval('public.patient_nurse_patient_nurse_id_seq', 1, false);


--
-- TOC entry 3396 (class 0 OID 0)
-- Dependencies: 209
-- Name: patient_patient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: keyurpatel
--

SELECT pg_catalog.setval('public.patient_patient_id_seq', 1, false);


--
-- TOC entry 3397 (class 0 OID 0)
-- Dependencies: 213
-- Name: prescription_prescription_id_seq; Type: SEQUENCE SET; Schema: public; Owner: keyurpatel
--

SELECT pg_catalog.setval('public.prescription_prescription_id_seq', 1, false);


--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 216
-- Name: room_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: keyurpatel
--

SELECT pg_catalog.setval('public.room_room_id_seq', 1, false);


--
-- TOC entry 3399 (class 0 OID 0)
-- Dependencies: 218
-- Name: visit_visit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: keyurpatel
--

SELECT pg_catalog.setval('public.visit_visit_id_seq', 1, false);


--
-- TOC entry 3195 (class 2606 OID 16520)
-- Name: diagnosis diagnosis_pkey; Type: CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.diagnosis
    ADD CONSTRAINT diagnosis_pkey PRIMARY KEY (diagnosis_id);


--
-- TOC entry 3193 (class 2606 OID 16512)
-- Name: diseases diseases_pkey; Type: CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.diseases
    ADD CONSTRAINT diseases_pkey PRIMARY KEY (disease_id);


--
-- TOC entry 3197 (class 2606 OID 17485)
-- Name: doctor doctor_pkey; Type: CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_pkey PRIMARY KEY (doctor_id);


--
-- TOC entry 3199 (class 2606 OID 17496)
-- Name: medicine medicine_pkey; Type: CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.medicine
    ADD CONSTRAINT medicine_pkey PRIMARY KEY (medicine_id);


--
-- TOC entry 3201 (class 2606 OID 17504)
-- Name: nurse nurse_pkey; Type: CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.nurse
    ADD CONSTRAINT nurse_pkey PRIMARY KEY (nurse_id);


--
-- TOC entry 3205 (class 2606 OID 17525)
-- Name: patient_nurse patient_nurse_pkey; Type: CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.patient_nurse
    ADD CONSTRAINT patient_nurse_pkey PRIMARY KEY (patient_nurse_id);


--
-- TOC entry 3203 (class 2606 OID 17517)
-- Name: patient patient_pkey; Type: CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_pkey PRIMARY KEY (patient_id);


--
-- TOC entry 3215 (class 2606 OID 17603)
-- Name: patient_room patient_room_pkey; Type: CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.patient_room
    ADD CONSTRAINT patient_room_pkey PRIMARY KEY (inpatient_id);


--
-- TOC entry 3209 (class 2606 OID 17558)
-- Name: prescription_medicine prescription_medicine_pkey; Type: CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.prescription_medicine
    ADD CONSTRAINT prescription_medicine_pkey PRIMARY KEY (prescription_id, medicine_id);


--
-- TOC entry 3207 (class 2606 OID 17548)
-- Name: prescription prescription_pkey; Type: CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.prescription
    ADD CONSTRAINT prescription_pkey PRIMARY KEY (prescription_id);


--
-- TOC entry 3211 (class 2606 OID 17577)
-- Name: room room_pkey; Type: CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (room_id);


--
-- TOC entry 3213 (class 2606 OID 17585)
-- Name: visit visit_pkey; Type: CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.visit
    ADD CONSTRAINT visit_pkey PRIMARY KEY (visit_id);


--
-- TOC entry 3216 (class 2606 OID 16521)
-- Name: diagnosis fk_disease; Type: FK CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.diagnosis
    ADD CONSTRAINT fk_disease FOREIGN KEY (disease_id) REFERENCES public.diseases(disease_id);


--
-- TOC entry 3222 (class 2606 OID 17586)
-- Name: visit fk_doctor_has_patient_doctor; Type: FK CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.visit
    ADD CONSTRAINT fk_doctor_has_patient_doctor FOREIGN KEY (doctor_id) REFERENCES public.doctor(doctor_id);


--
-- TOC entry 3223 (class 2606 OID 17591)
-- Name: visit fk_doctor_has_patient_patient1; Type: FK CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.visit
    ADD CONSTRAINT fk_doctor_has_patient_patient1 FOREIGN KEY (patient_id) REFERENCES public.patient(patient_id);


--
-- TOC entry 3217 (class 2606 OID 17526)
-- Name: patient_nurse fk_patient_has_nurse_nurse1; Type: FK CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.patient_nurse
    ADD CONSTRAINT fk_patient_has_nurse_nurse1 FOREIGN KEY (nurse_id) REFERENCES public.nurse(nurse_id);


--
-- TOC entry 3218 (class 2606 OID 17531)
-- Name: patient_nurse fk_patient_has_nurse_patient1; Type: FK CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.patient_nurse
    ADD CONSTRAINT fk_patient_has_nurse_patient1 FOREIGN KEY (patient_id) REFERENCES public.patient(patient_id);


--
-- TOC entry 3224 (class 2606 OID 17604)
-- Name: patient_room fk_patient_has_room_patient1; Type: FK CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.patient_room
    ADD CONSTRAINT fk_patient_has_room_patient1 FOREIGN KEY (patient_id) REFERENCES public.patient(patient_id);


--
-- TOC entry 3225 (class 2606 OID 17609)
-- Name: patient_room fk_patient_has_room_room1; Type: FK CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.patient_room
    ADD CONSTRAINT fk_patient_has_room_room1 FOREIGN KEY (room_id) REFERENCES public.room(room_id);


--
-- TOC entry 3219 (class 2606 OID 17549)
-- Name: prescription fk_prescription_diagnosis1; Type: FK CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.prescription
    ADD CONSTRAINT fk_prescription_diagnosis1 FOREIGN KEY (diagnosis_id) REFERENCES public.diagnosis(diagnosis_id);


--
-- TOC entry 3220 (class 2606 OID 17559)
-- Name: prescription_medicine fk_prescription_medicine_medicine1; Type: FK CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.prescription_medicine
    ADD CONSTRAINT fk_prescription_medicine_medicine1 FOREIGN KEY (medicine_id) REFERENCES public.medicine(medicine_id);


--
-- TOC entry 3221 (class 2606 OID 17564)
-- Name: prescription_medicine fk_prescription_medicine_prescription1; Type: FK CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.prescription_medicine
    ADD CONSTRAINT fk_prescription_medicine_prescription1 FOREIGN KEY (prescription_id) REFERENCES public.prescription(prescription_id);


-- Completed on 2021-02-13 17:20:55 EST

--
-- PostgreSQL database dump complete
--

