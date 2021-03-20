--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)

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
-- Name: diagnosis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.diagnosis (
    diagnosis_id integer NOT NULL,
    visit_id integer NOT NULL,
    disease_id integer NOT NULL
);


ALTER TABLE public.diagnosis OWNER TO keyurpatel;

--
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
-- Name: diagnosis_diagnosis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: keyurpatel
--

ALTER SEQUENCE public.diagnosis_diagnosis_id_seq OWNED BY public.diagnosis.diagnosis_id;


--
-- Name: diseases; Type: TABLE; Schema: public; Owner: keyurpatel
--

CREATE TABLE public.diseases (
    disease_id integer NOT NULL,
    disease_name character varying(255) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.diseases OWNER TO keyurpatel;

--
-- Name: doctors; Type: TABLE; Schema: public; Owner: keyurpatel
--

CREATE TABLE public.doctors (
    doctor_id integer NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    email character varying(45) NOT NULL,
    phone character varying(45) NOT NULL,
    specialization character varying(45)
);


ALTER TABLE public.doctors OWNER TO keyurpatel;

--
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
-- Name: doctor_doctor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: keyurpatel
--

ALTER SEQUENCE public.doctor_doctor_id_seq OWNED BY public.doctors.doctor_id;


--
-- Name: medicine; Type: TABLE; Schema: public; Owner: keyurpatel
--

CREATE TABLE public.medicine (
    medicine_id integer NOT NULL,
    medicine_name character varying(45) NOT NULL,
    description text
);


ALTER TABLE public.medicine OWNER TO keyurpatel;

--
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
-- Name: medicine_medicine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: keyurpatel
--

ALTER SEQUENCE public.medicine_medicine_id_seq OWNED BY public.medicine.medicine_id;


--
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
-- Name: nurse_nurse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: keyurpatel
--

ALTER SEQUENCE public.nurse_nurse_id_seq OWNED BY public.nurse.nurse_id;


--
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
    gender character varying(10) DEFAULT NULL::character varying,
    password character varying(255)
);


ALTER TABLE public.patient OWNER TO keyurpatel;

--
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
-- Name: patient_nurse_patient_nurse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: keyurpatel
--

ALTER SEQUENCE public.patient_nurse_patient_nurse_id_seq OWNED BY public.patient_nurse.patient_nurse_id;


--
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
-- Name: patient_patient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: keyurpatel
--

ALTER SEQUENCE public.patient_patient_id_seq OWNED BY public.patient.patient_id;


--
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
-- Name: prescription; Type: TABLE; Schema: public; Owner: keyurpatel
--

CREATE TABLE public.prescription (
    prescription_id integer NOT NULL,
    diagnosis_id integer NOT NULL,
    prescription_date date NOT NULL
);


ALTER TABLE public.prescription OWNER TO keyurpatel;

--
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
-- Name: prescription_prescription_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: keyurpatel
--

ALTER SEQUENCE public.prescription_prescription_id_seq OWNED BY public.prescription.prescription_id;


--
-- Name: receptionist; Type: TABLE; Schema: public; Owner: keyurpatel
--

CREATE TABLE public.receptionist (
    r_id integer NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    email character varying(45) NOT NULL,
    username character varying(45) NOT NULL,
    password character varying(45) NOT NULL,
    phone character varying(45)
);


ALTER TABLE public.receptionist OWNER TO keyurpatel;

--
-- Name: receptionist_r_id_seq; Type: SEQUENCE; Schema: public; Owner: keyurpatel
--

CREATE SEQUENCE public.receptionist_r_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.receptionist_r_id_seq OWNER TO keyurpatel;

--
-- Name: receptionist_r_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: keyurpatel
--

ALTER SEQUENCE public.receptionist_r_id_seq OWNED BY public.receptionist.r_id;


--
-- Name: room; Type: TABLE; Schema: public; Owner: keyurpatel
--

CREATE TABLE public.room (
    room_id integer NOT NULL,
    status character varying(45) DEFAULT NULL::character varying,
    floor character varying
);


ALTER TABLE public.room OWNER TO keyurpatel;

--
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
-- Name: room_room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: keyurpatel
--

ALTER SEQUENCE public.room_room_id_seq OWNED BY public.room.room_id;


--
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
-- Name: visit_visit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: keyurpatel
--

ALTER SEQUENCE public.visit_visit_id_seq OWNED BY public.visit.visit_id;


--
-- Name: diagnosis diagnosis_id; Type: DEFAULT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.diagnosis ALTER COLUMN diagnosis_id SET DEFAULT nextval('public.diagnosis_diagnosis_id_seq'::regclass);


--
-- Name: doctors doctor_id; Type: DEFAULT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.doctors ALTER COLUMN doctor_id SET DEFAULT nextval('public.doctor_doctor_id_seq'::regclass);


--
-- Name: medicine medicine_id; Type: DEFAULT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.medicine ALTER COLUMN medicine_id SET DEFAULT nextval('public.medicine_medicine_id_seq'::regclass);


--
-- Name: nurse nurse_id; Type: DEFAULT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.nurse ALTER COLUMN nurse_id SET DEFAULT nextval('public.nurse_nurse_id_seq'::regclass);


--
-- Name: patient patient_id; Type: DEFAULT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.patient ALTER COLUMN patient_id SET DEFAULT nextval('public.patient_patient_id_seq'::regclass);


--
-- Name: patient_nurse patient_nurse_id; Type: DEFAULT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.patient_nurse ALTER COLUMN patient_nurse_id SET DEFAULT nextval('public.patient_nurse_patient_nurse_id_seq'::regclass);


--
-- Name: prescription prescription_id; Type: DEFAULT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.prescription ALTER COLUMN prescription_id SET DEFAULT nextval('public.prescription_prescription_id_seq'::regclass);


--
-- Name: room room_id; Type: DEFAULT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.room ALTER COLUMN room_id SET DEFAULT nextval('public.room_room_id_seq'::regclass);


--
-- Name: visit visit_id; Type: DEFAULT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.visit ALTER COLUMN visit_id SET DEFAULT nextval('public.visit_visit_id_seq'::regclass);


--
-- Data for Name: diagnosis; Type: TABLE DATA; Schema: public; Owner: keyurpatel
--

INSERT INTO public.diagnosis VALUES (1, 1, 1);
INSERT INTO public.diagnosis VALUES (2, 2, 2);
INSERT INTO public.diagnosis VALUES (3, 3, 3);
INSERT INTO public.diagnosis VALUES (4, 4, 4);
INSERT INTO public.diagnosis VALUES (5, 5, 5);
INSERT INTO public.diagnosis VALUES (6, 6, 21);
INSERT INTO public.diagnosis VALUES (7, 7, 6);
INSERT INTO public.diagnosis VALUES (8, 8, 21);
INSERT INTO public.diagnosis VALUES (9, 9, 21);
INSERT INTO public.diagnosis VALUES (10, 10, 8);
INSERT INTO public.diagnosis VALUES (11, 11, 10);
INSERT INTO public.diagnosis VALUES (12, 12, 12);
INSERT INTO public.diagnosis VALUES (13, 13, 9);
INSERT INTO public.diagnosis VALUES (14, 14, 15);
INSERT INTO public.diagnosis VALUES (15, 15, 16);
INSERT INTO public.diagnosis VALUES (16, 16, 19);
INSERT INTO public.diagnosis VALUES (17, 17, 15);
INSERT INTO public.diagnosis VALUES (18, 18, 21);
INSERT INTO public.diagnosis VALUES (19, 19, 21);
INSERT INTO public.diagnosis VALUES (20, 20, 21);
INSERT INTO public.diagnosis VALUES (21, 21, 21);
INSERT INTO public.diagnosis VALUES (22, 22, 15);
INSERT INTO public.diagnosis VALUES (23, 23, 17);
INSERT INTO public.diagnosis VALUES (24, 24, 21);
INSERT INTO public.diagnosis VALUES (25, 25, 21);
INSERT INTO public.diagnosis VALUES (26, 26, 21);
INSERT INTO public.diagnosis VALUES (27, 27, 21);
INSERT INTO public.diagnosis VALUES (28, 28, 2);
INSERT INTO public.diagnosis VALUES (29, 29, 6);
INSERT INTO public.diagnosis VALUES (30, 30, 19);
INSERT INTO public.diagnosis VALUES (31, 31, 4);
INSERT INTO public.diagnosis VALUES (32, 32, 9);
INSERT INTO public.diagnosis VALUES (33, 33, 3);
INSERT INTO public.diagnosis VALUES (34, 34, 15);
INSERT INTO public.diagnosis VALUES (35, 35, 3);
INSERT INTO public.diagnosis VALUES (36, 36, 1);
INSERT INTO public.diagnosis VALUES (37, 37, 21);
INSERT INTO public.diagnosis VALUES (38, 38, 21);
INSERT INTO public.diagnosis VALUES (39, 39, 15);
INSERT INTO public.diagnosis VALUES (40, 40, 16);
INSERT INTO public.diagnosis VALUES (41, 41, 17);
INSERT INTO public.diagnosis VALUES (42, 42, 21);
INSERT INTO public.diagnosis VALUES (43, 43, 21);
INSERT INTO public.diagnosis VALUES (44, 44, 21);
INSERT INTO public.diagnosis VALUES (45, 45, 19);
INSERT INTO public.diagnosis VALUES (46, 46, 2);
INSERT INTO public.diagnosis VALUES (47, 47, 8);
INSERT INTO public.diagnosis VALUES (48, 48, 3);
INSERT INTO public.diagnosis VALUES (49, 49, 21);
INSERT INTO public.diagnosis VALUES (50, 50, 21);
INSERT INTO public.diagnosis VALUES (51, 51, 4);
INSERT INTO public.diagnosis VALUES (52, 52, 12);
INSERT INTO public.diagnosis VALUES (53, 53, 12);
INSERT INTO public.diagnosis VALUES (54, 54, 12);
INSERT INTO public.diagnosis VALUES (55, 55, 12);
INSERT INTO public.diagnosis VALUES (56, 56, 19);
INSERT INTO public.diagnosis VALUES (57, 57, 19);
INSERT INTO public.diagnosis VALUES (58, 58, 19);
INSERT INTO public.diagnosis VALUES (59, 59, 19);


--
-- Data for Name: diseases; Type: TABLE DATA; Schema: public; Owner: keyurpatel
--

INSERT INTO public.diseases VALUES (1, 'Abdominal aortic aneurysm', 'An abdominal aortic aneurysm (AAA) is a swelling (aneurysm) of the aorta – the main blood vessel that leads away from the heart, down through the abdomen to the rest of the body.');
INSERT INTO public.diseases VALUES (2, 'Acne', 'Acne is a common skin condition that affects most people at some poINTEGER. It causes spots, oily skin and sometimes skin that is hot or painful to touch.');
INSERT INTO public.diseases VALUES (3, 'Asthma', 'Asthma is a common long-term condition that can cause coughing, wheezing, chest tightness and breathlessness.');
INSERT INTO public.diseases VALUES (4, 'Autism spectrum disorder (ASD)', 'Autism spectrum disorder (ASD) is a condition that affects social INTEGEReraction, communication, intrests and behaviour.');
INSERT INTO public.diseases VALUES (5, 'Bronchitis', 'Bronchitis is an infection of the main airways of the lungs (bronchi), causing them to become irritated and inflamed.');
INSERT INTO public.diseases VALUES (6, 'Common Cold', 'A cold is a mild viral infection of the nose, throat, sinuses and upper airways. Its very common and usually clears up on its own within a week or two.');
INSERT INTO public.diseases VALUES (7, 'Constipation', 'Constipation is a common condition that affects people of all ages. It can mean that you are not passing stools regularly or you are unable to completely empty your bowel.');
INSERT INTO public.diseases VALUES (8, 'Diabetes', 'Diabetes is a lifelong condition that causes a person blood sugar level to become too high.');
INSERT INTO public.diseases VALUES (9, 'Flu', 'Flu (influenza) is a common infectious viral illness spread by coughs and sneezes. It can be very unpleasant, but you will usually begin to feel better within about a week.');
INSERT INTO public.diseases VALUES (10, 'Heart failure', 'Heart failure is a serious condition, but it does not actually mean that your heart has failed. It means that your heart is not pumping blood around your body very efficiently.');
INSERT INTO public.diseases VALUES (11, 'Insomnia', 'Insomnia is difficulty getting to sleep or staying asleep for long enough to feel refreshed the next morning.');
INSERT INTO public.diseases VALUES (12, 'Liver Cancer', 'Primary liver cancer is an uncommon but serious type of cancer that begins in the liver.');
INSERT INTO public.diseases VALUES (13, 'Migraines', 'A migraine is usually a moderate or severe headache felt as a throbbing pain on one side of the head.');
INSERT INTO public.diseases VALUES (14, 'Psoriasis', 'Psoriasis is a skin condition that causes red, flaky, crusty patches of skin covered with silvery scales.');
INSERT INTO public.diseases VALUES (15, 'Schizophrenia', 'Schizophrenia is a long-term mental health condition that causes a range of different psychological symptoms');
INSERT INTO public.diseases VALUES (16, 'Melanoma', 'Melanoma is a type of skin cancer that can spread to other organs in the body.');
INSERT INTO public.diseases VALUES (17, 'Sore throat', 'Sore throats are very common and usually nothing to worry about. They normally get better within a week.');
INSERT INTO public.diseases VALUES (18, 'Urinary tract infection', 'Urinary tract infections (UTIs) are common infections that can affect the bladder, the kidneys and the tubes connected to them.');
INSERT INTO public.diseases VALUES (19, 'Leg ulcer', 'A leg ulcer is a long-lasting (chronic) sore that takes more than 4 to 6 weeks to heal. They usually develop on the inside of the leg, just above the ankle.');
INSERT INTO public.diseases VALUES (20, 'Yellow fever', 'Yellow fever is a serious viral infection that is spread by certain types of mosquito. Its mainly found in sub-Saharan Africa, South America and parts of the Caribbean.');
INSERT INTO public.diseases VALUES (21, 'Healthy', 'Patient is healthy');


--
-- Data for Name: doctors; Type: TABLE DATA; Schema: public; Owner: keyurpatel
--

INSERT INTO public.doctors VALUES (1, 'Braelyn', 'Richmond', 'Braelyn1Richmond@hospitalteam.com', '(628) 737-8387', 'Allergists');
INSERT INTO public.doctors VALUES (2, 'Kameron', 'Benson', 'Kameron2Benson@hospitalteam.com', '(412) 542-1964', 'Dermatologists');
INSERT INTO public.doctors VALUES (3, 'Hugo', 'Randolph', 'Hugo3Randolph@hospitalteam.com', '(977) 281-4408', 'Infectious Disease Specialist');
INSERT INTO public.doctors VALUES (4, 'Adalyn', 'Aguilar', 'Adalyn4Aguilar@hospitalteam.com', '(897) 406-2496', 'Obstrician');
INSERT INTO public.doctors VALUES (5, 'Deborah', 'Stevens', 'Deborah5Stevens@hospitalteam.com', '(295) 952-1762', 'Cardiologist');
INSERT INTO public.doctors VALUES (6, 'Riya', 'Valdez', 'Riya6Valdez@hospitalteam.com', '(456) 630-2623', 'Endocrinologist');
INSERT INTO public.doctors VALUES (7, 'Paityn', 'Liu', 'Paityn7Liu@hospitalteam.com', '(357) 707-9281', 'Gastroenterologist');
INSERT INTO public.doctors VALUES (8, 'Dorian', 'Gray', 'Dorian8Gray@hospitalteam.com', '(342) 587-7675', 'Urologist');
INSERT INTO public.doctors VALUES (9, 'Lillie', 'Madden', 'Lillie9Madden@hospitalteam.com', '(242) 303-5504', 'Neurologist');
INSERT INTO public.doctors VALUES (10, 'Marlie', 'Carson', 'Marlie10Carson@hospitalteam.com', '(840) 215-7859', 'Psychaiatrist');
INSERT INTO public.doctors VALUES (11, 'Eric', 'Little', 'Eric11Little@hospitalteam.com', '(240) 946-4206', 'Oncologist');
INSERT INTO public.doctors VALUES (12, 'Draven', 'Bauer', 'Draven12Bauer@hospitalteam.com', '(752) 320-9309', 'Radiologist');
INSERT INTO public.doctors VALUES (13, 'Judith', 'Walker', 'Judith13Walker@hospitalteam.com', '(298) 754-7168', 'General Surgeon');
INSERT INTO public.doctors VALUES (14, 'Paris', 'Villa', 'Paris14Villa@hospitalteam.com', '(747) 652-9428', 'Orthopedic Surgeon');
INSERT INTO public.doctors VALUES (15, 'Francesca', 'Valencia', 'Francesca15Valencia@hospitalteam.com', '(871) 849-2091', 'Cardiac Surgeon');


--
-- Data for Name: medicine; Type: TABLE DATA; Schema: public; Owner: keyurpatel
--

INSERT INTO public.medicine VALUES (1, 'Carvedilol (Coreg)', 'Beta blockers');
INSERT INTO public.medicine VALUES (2, 'Tetracycline', 'Oral antibiotics');
INSERT INTO public.medicine VALUES (3, 'Fluticasone (Flovent HFA)', 'Fluticasone (Flovent HFA)');
INSERT INTO public.medicine VALUES (4, 'Prozac', 'selective serotonin reuptake inhibitors (SSRIs)');
INSERT INTO public.medicine VALUES (5, 'Ibuprofen', 'Over the counter drug');
INSERT INTO public.medicine VALUES (6, 'Theraflu', 'Over the counter drug for cold and flu');
INSERT INTO public.medicine VALUES (7, 'Pepto Bismol', 'Over the counter drug for constipation');
INSERT INTO public.medicine VALUES (8, 'Novolin', 'short acting insulin');
INSERT INTO public.medicine VALUES (9, 'Theraflu', 'Over the counter drug for cold and flu');
INSERT INTO public.medicine VALUES (10, 'Novolin', 'Decreases blood clotting');
INSERT INTO public.medicine VALUES (11, 'Lunesta', 'Non-benzodiazepine sedative');
INSERT INTO public.medicine VALUES (12, 'Cabozantinib-S-Malate', 'Cancer treatment medication');
INSERT INTO public.medicine VALUES (13, 'Tylenon', 'Over the counter pain medication');
INSERT INTO public.medicine VALUES (14, 'Enbrel', 'psoriasis treatment');
INSERT INTO public.medicine VALUES (15, 'Clozapine (Clozaril)', 'antipsychotic medication');
INSERT INTO public.medicine VALUES (16, 'Aldesleukin', 'Skin cancer medication');
INSERT INTO public.medicine VALUES (17, 'Mucinex', 'Over the counter drug for sore throat');
INSERT INTO public.medicine VALUES (18, 'AZO', 'Urinary pain relief');
INSERT INTO public.medicine VALUES (19, 'UlcerGard', 'uleg ulcer medication');


--
-- Data for Name: nurse; Type: TABLE DATA; Schema: public; Owner: keyurpatel
--

INSERT INTO public.nurse VALUES (1, 'Jane', 'Donahoe', '(202)123-4567');
INSERT INTO public.nurse VALUES (2, 'Alejandro', 'Reeves', '(228) 767-2381');
INSERT INTO public.nurse VALUES (3, 'Osvaldo', 'Hammond', '(624) 676-7199');
INSERT INTO public.nurse VALUES (4, 'Lou', 'Parrish', '(946) 734-6099');
INSERT INTO public.nurse VALUES (5, 'Louise', 'Weeks', '(404) 350-5679');
INSERT INTO public.nurse VALUES (6, 'Phyllis', 'Hammond', '(254) 594-1551');
INSERT INTO public.nurse VALUES (7, 'Teisha', 'Sims', '(974) 375-5679');
INSERT INTO public.nurse VALUES (8, 'Robena', 'Munoz', '(210) 227-4128');
INSERT INTO public.nurse VALUES (9, 'Marlen', 'Mcclure', '(705) 252-7850');
INSERT INTO public.nurse VALUES (10, 'Sarita', 'Schmidt', '(782) 374-9636');
INSERT INTO public.nurse VALUES (11, 'Tuyet', 'Gordon', '(760) 304-0471');
INSERT INTO public.nurse VALUES (12, 'Jennie', 'Villarreal', '(744) 967-4471');
INSERT INTO public.nurse VALUES (13, 'Tonette', 'Wong', '(519) 712-4392');
INSERT INTO public.nurse VALUES (14, 'Xochitl', 'Camacho', '(419) 741-2167');
INSERT INTO public.nurse VALUES (15, 'Kiley', 'Bond', '(616) 635-7448');
INSERT INTO public.nurse VALUES (16, 'Eliza', 'Gentry', '(764) 305-0869');
INSERT INTO public.nurse VALUES (17, 'Steven', 'West', '(240) 803-6370');
INSERT INTO public.nurse VALUES (18, 'Audra', 'Griffin', '(923) 222-7030');
INSERT INTO public.nurse VALUES (19, 'Laurene', 'Hughes', '(814) 260-7938');
INSERT INTO public.nurse VALUES (20, 'Tashina', 'Roberson', '(223) 810-1251');
INSERT INTO public.nurse VALUES (21, 'Noma', 'Walter', '(672) 662-4794');
INSERT INTO public.nurse VALUES (22, 'Tamiko', 'Singleton', '(426) 794-5879');
INSERT INTO public.nurse VALUES (23, 'Minna', 'Henderson', '(567) 831-1194');
INSERT INTO public.nurse VALUES (24, 'Manda', 'Maldonado', '(629) 950-2738');
INSERT INTO public.nurse VALUES (25, 'Maribel', 'Morgan', '(509) 805-7702');
INSERT INTO public.nurse VALUES (26, 'Corie', 'Cain', '(330) 708-6683');
INSERT INTO public.nurse VALUES (27, 'Gertrude', 'Ritter', '(734) 235-5739');
INSERT INTO public.nurse VALUES (28, 'Lia', 'Riley', '(436) 515-6860');
INSERT INTO public.nurse VALUES (29, 'Shizue', 'Hancock', '(215) 664-7452');
INSERT INTO public.nurse VALUES (30, 'Lakendra', 'Hanna', '(702) 772-1655');
INSERT INTO public.nurse VALUES (31, 'Wendell', 'Ker', '(634) 937-9124');
INSERT INTO public.nurse VALUES (32, 'Paul', 'John', '(918) 230-3234');


--
-- Data for Name: patient; Type: TABLE DATA; Schema: public; Owner: keyurpatel
--

INSERT INTO public.patient VALUES (1, 'John', 'Roberts', 'JohnRoberts1@gmail.com', '(301) 123-4567', '1234 Gude St.', 'Silver Spring', 20910, 'MD', 'United States of America', 'M', NULL);
INSERT INTO public.patient VALUES (2, 'Deandre', 'Barrera', 'DeandreBarrera2@gmail.com', '(214) 710-6821', '9730 Valley View Street', 'Rockville', 20910, 'MD', 'United States of America', 'M', NULL);
INSERT INTO public.patient VALUES (3, 'Maryrose', 'Duffy', 'MaryroseDuffy3@gmail.com', '(212) 815-7338', '86 Brookside Drive', 'Rockville', 20910, 'MD', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (4, 'Jarvis', 'Smith', 'JarvisSmith4@gmail.com', '(313) 745-2060', '331 Old Marlborough Street', 'Silver Spring', 20910, 'MD', 'United States of America', 'M', NULL);
INSERT INTO public.patient VALUES (5, 'Enedina', 'Arellano', 'EnedinaArellano5@gmail.com', '(386) 774-2873', '7294 Pineknoll Court', 'Silver Spring', 20910, 'MD', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (6, 'Chuck', 'Cameron', 'ChuckCameron6@gmail.com', '(715) 878-4217', '145 East Tanglewood Ave.', 'Silver Spring', 20910, 'MD', 'United States of America', 'M', NULL);
INSERT INTO public.patient VALUES (7, 'Honey', 'Curry', 'HoneyCurry7@gmail.com', '(489) 766-9947', '863 Bridgeton St.', 'Rockville', 20821, 'MD', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (8, 'Napoleon', 'Bridges', 'NapoleonBridges8@gmail.com', '(648) 838-3283', '620 East Rockland Dr.', 'Arlington', 20312, 'VA', 'United States of America', 'M', NULL);
INSERT INTO public.patient VALUES (9, 'Camelia', 'Walters', 'CameliaWalters9@gmail.com', '(333) 798-5478', '5 Poplar Dr.', 'Alexandria', 39492, 'VA', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (10, 'Herschel', 'Fuentes', 'HerschelFuentes10@gmail.com', '(498) 852-7313', '4 West Berkshire Ave.', 'Arlington', 20821, 'VA', 'United States of America', 'M', NULL);
INSERT INTO public.patient VALUES (11, 'Ignacia', 'Nichols', 'IgnaciaNichols11@gmail.com', '(304) 296-3704', '127 Manor St.', 'Arlington', 20821, 'VA', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (12, 'Letty', 'Mckinney', 'LettyMckinney12@gmail.com', '(883) 703-6834', '8668 SW. Sugar St.', 'Alexandria', 20821, 'VA', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (13, 'Cleopatra', 'Choi', 'CleopatraChoi13@gmail.com', '(428) 465-8888', '9201 Monroe Court', 'Silver Spring', 20821, 'MD', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (14, 'Felisha', 'Mathis', 'FelishaMathis14@gmail.com', '(930) 751-3796', '8707 E. Cypress St.', 'Silver Spring', 20821, 'MD', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (15, 'Margaret', 'Mejia', 'MargaretMejia15@gmail.com', '(283) 767-9818', '7232 Gregory Rd.', 'Rockville', 20986, 'MD', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (16, 'Flo', 'Porter', 'FloPorter16@gmail.com', '(331) 872-4501', '1 Glen Creek St.', 'Alexandria', 20821, 'VA', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (17, 'Sarai', 'Montgomery', 'SaraiMontgomery17@gmail.com', '(641) 496-1829', '446 Orchard Lane', 'Arlington', 20821, 'VA', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (18, 'Kai', 'Eaton', 'KaiEaton18@gmail.com', '(842) 910-6719', '16 Wagon Ave.', 'Alexandria', 20821, 'VA', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (19, 'Antoinette', 'Cisneros', 'AntoinetteCisneros19@gmail.com', '(996) 676-1136', '9894 Sheffield St.', 'Arlington', 50273, 'VA', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (20, 'Jewell', 'Phillips', 'JewellPhillips20@gmail.com', '(903) 546-3207', '6 Gonzales St.', 'Alexandria', 30284, 'VA', 'United States of America', 'M', NULL);
INSERT INTO public.patient VALUES (21, 'Rosemarie', 'Riggs', 'RosemarieRiggs21@gmail.com', '(578) 787-1286', 'Bethel Park, PA 15102', 'Alexandria', 40282, 'VA', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (22, 'Pamala', 'Clay', 'PamalaClay22@gmail.com', '(791) 293-6354', '30 John Lane', 'Rockville', 30291, 'MD', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (23, 'Torri', 'Lam', 'TorriLam23@gmail.com', '(446) 830-2529', '301 Prairie Drive', 'Silver Spring', 20910, 'MD', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (24, 'Kia', 'Harris', 'KiaHarris24@gmail.com', '(225) 782-0857', '9889 Liberty Lane', 'Silver Spring', 20910, 'MD', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (25, 'Patsy', 'Aguilar', 'PatsyAguilar25@gmail.com', '(596) 737-5732', '8707 Hartford Circle', 'Silver Spring', 20910, 'MD', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (26, 'Charlette', 'Sutton', 'CharletteSutton26@gmail.com', '(830) 390-3914', '255 North Belmont St.', 'Silver Spring', 20910, 'MD', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (27, 'Nikia', 'Stevens', 'NikiaStevens27@gmail.com', '(223) 742-4816', '9931 Smith Store Street', 'Rockville', 20986, 'MD', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (28, 'Antonette', 'Shaw', 'AntonetteShaw28@gmail.com', '(312) 345-4961', '9339 Newcastle Dr.', 'Rockville', 20986, 'MD', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (29, 'Cythia', 'Branch', 'CythiaBranch29@gmail.com', '(601) 821-3797', '646 1st Ave.', 'Rockville', 20986, 'MD', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (30, 'Daine', 'Roach', 'DaineRoach30@gmail.com', '(756) 735-9841', '7070 Theatre Street', 'Rockville', 20986, 'MD', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (31, 'Karol', 'Grimes', 'KarolGrimes31@gmail.com', '(950) 386-9884', '8 Tallwood Lane', 'Alexandria', 30284, 'VA', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (32, 'Ian', 'Reed', 'IanReed32@gmail.com', '(681) 500-0039', '664 Johnson Ave.', 'Alexandria', 40282, 'VA', 'United States of America', 'M', NULL);
INSERT INTO public.patient VALUES (33, 'Cesar', 'Lambert', 'CesarLambert33@gmail.com', '(625) 736-5145', '9911 Colonial Lane', 'Arlington', 30284, 'VA', 'United States of America', 'M', NULL);
INSERT INTO public.patient VALUES (34, 'Michaele', 'Mclean', 'MichaeleMclean34@gmail.com', '(672) 846-2951', '87 Shub Farm Road', 'Arlington', 40282, 'VA', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (35, 'Eusebia', 'Whitehead', 'EusebiaWhitehead35@gmail.com', '(622) 413-1680', '9400 Morris Circle', 'Arlington', 30284, 'VA', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (36, 'Norman', 'Spence', 'NormanSpence36@gmail.com', '(765) 664-0007', '347 Westminster St.', 'Arlington', 40282, 'VA', 'United States of America', 'M', NULL);
INSERT INTO public.patient VALUES (37, 'Delorse', 'Brown', 'DelorseBrown37@gmail.com', '(314) 460-4346', '8493 Mulberry Lane', 'Arlington', 32382, 'VA', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (38, 'Brenda', 'Schaefer', 'BrendaSchaefer38@gmail.com', '(389) 252-5476', '8630 Fairview Ave.', 'Arlington', 40923, 'VA', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (39, 'Minnie', 'Randall', 'MinnieRandall39@gmail.com', '(690) 956-3552', '4 South Hill Field St.', 'Arlington', 30284, 'VA', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (40, 'Moses', 'Peterson', 'MosesPeterson40@gmail.com', '(423) 678-8686', '51 Manor St.', 'Alexandria', 40282, 'VA', 'United States of America', 'M', NULL);
INSERT INTO public.patient VALUES (41, 'Gerardo', 'Ramirez', 'GerardoRamirez41@gmail.com', '(692) 783-8733', '624 Schoolhouse Street', 'Arlington', 14345, 'VA', 'United States of America', 'M', NULL);
INSERT INTO public.patient VALUES (42, 'Madelaine', 'Orozco', 'MadelaineOrozco42@gmail.com', '(239) 982-5563', '9208 Brickell St.', 'Alexandria', 30283, 'VA', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (43, 'Rochel', 'Chan', 'RochelChan43@gmail.com', '(688) 606-0666', '978 Belmont Lane', 'Alexandria', 30283, 'VA', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (44, 'Refugia', 'Solomon', 'RefugiaSolomon44@gmail.com', '(300) 383-3417', '62 Cedar Swamp Rd.', 'Alexandria', 30283, 'VA', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (45, 'Bethanie', 'Callahan', 'BethanieCallahan45@gmail.com', '(296) 241-1734', '7906 N. Church Dr.', 'Alexandria', 20986, 'VA', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (46, 'Siu', 'Zuniga', 'SiuZuniga46@gmail.com', '(473) 550-9106', '7740 East Carriage St.', 'Silver Spring', 20821, 'MD', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (47, 'Dorla', 'Escobar', 'DorlaEscobar47@gmail.com', '(918) 883-6593', '555 Cambridge Lane', 'Arlington', 20821, 'VA', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (48, 'Delena', 'Shaffer', 'DelenaShaffer48@gmail.com', '(730) 936-3927', '98 Lakeview St.', 'Rockville', 20986, 'MD', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (49, 'Milo', 'Farley', 'MiloFarley49@gmail.com', '(681) 568-4457', '441 Cleveland Street', 'Arlington', 20986, 'VA', 'United States of America', 'M', NULL);
INSERT INTO public.patient VALUES (50, 'Beryl', 'Everett', 'BerylEverett50@gmail.com', '(713) 878-4338', '901 W. High Noon Dr.', 'Rockville', 20821, 'MD', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (51, 'Stacy', 'Dixon', 'StacyDixon51@gmail.com', '(441) 276-4008', '9273 Kent Street', 'Rockville', 32845, 'MD', 'United States of America', 'F', NULL);
INSERT INTO public.patient VALUES (52, 'Steve', 'Jobs', 'steve7686@gmail.com', '(732)875-8044', '7 Boxwood Circle', 'Madison', 9944, 'NJ', 'USA', 'M', NULL);
INSERT INTO public.patient VALUES (53, 'Steve', 'Jobs', 'steve7686@gmail.com', '(732)875-8044', '7 Boxwood Circle', 'Madison', 9944, 'NJ', 'USA', 'M', NULL);
INSERT INTO public.patient VALUES (54, 'Richard', 'Bailey', 'richbaily@amazon.com', '(742)373-2821', '12 Main St', 'Somerset', 3744, 'NJ', 'USA', 'M', NULL);
INSERT INTO public.patient VALUES (55, 'Ansha', 'Rhoda', 'thoda756@yahoo.mail', '(946)768-8922', '34 Community center', 'Seattle', 98124, 'WA', 'United States Of America', 'F', NULL);


--
-- Data for Name: patient_nurse; Type: TABLE DATA; Schema: public; Owner: keyurpatel
--

INSERT INTO public.patient_nurse VALUES (1, 1, 1, '2019-11-01', NULL);
INSERT INTO public.patient_nurse VALUES (2, 3, 3, '2019-11-03', NULL);
INSERT INTO public.patient_nurse VALUES (3, 4, 4, '2019-11-05', NULL);
INSERT INTO public.patient_nurse VALUES (4, 5, 7, '2019-11-07', NULL);
INSERT INTO public.patient_nurse VALUES (5, 10, 9, '2019-11-09', NULL);
INSERT INTO public.patient_nurse VALUES (6, 11, 11, '2019-11-11', NULL);
INSERT INTO public.patient_nurse VALUES (7, 12, 14, '2019-11-13', '2019-11-14');
INSERT INTO public.patient_nurse VALUES (8, 14, 16, '2019-11-15', NULL);
INSERT INTO public.patient_nurse VALUES (9, 15, 18, '2019-11-17', NULL);
INSERT INTO public.patient_nurse VALUES (10, 16, 20, '2019-11-19', NULL);
INSERT INTO public.patient_nurse VALUES (11, 22, 21, '2019-11-21', NULL);
INSERT INTO public.patient_nurse VALUES (12, 30, 22, '2019-11-23', '2019-11-24');
INSERT INTO public.patient_nurse VALUES (13, 31, 29, '2019-11-25', NULL);
INSERT INTO public.patient_nurse VALUES (14, 33, 1, '2019-11-27', NULL);
INSERT INTO public.patient_nurse VALUES (15, 35, 12, '2019-11-29', NULL);
INSERT INTO public.patient_nurse VALUES (16, 36, 32, '2019-12-01', NULL);
INSERT INTO public.patient_nurse VALUES (17, 39, 31, '2019-12-03', NULL);
INSERT INTO public.patient_nurse VALUES (18, 40, 30, '2019-12-05', NULL);
INSERT INTO public.patient_nurse VALUES (19, 45, 3, '2019-12-07', NULL);
INSERT INTO public.patient_nurse VALUES (20, 47, 4, '2019-12-09', NULL);
INSERT INTO public.patient_nurse VALUES (21, 48, 7, '2019-12-11', NULL);
INSERT INTO public.patient_nurse VALUES (22, 51, 12, '2019-12-13', NULL);
INSERT INTO public.patient_nurse VALUES (23, 12, 1, '2019-12-15', '2019-12-17');
INSERT INTO public.patient_nurse VALUES (24, 30, 3, '2019-12-17', '2019-12-20');
INSERT INTO public.patient_nurse VALUES (25, 2, 4, '2019-12-19', NULL);
INSERT INTO public.patient_nurse VALUES (26, 6, 7, '2019-12-21', NULL);
INSERT INTO public.patient_nurse VALUES (27, 7, 9, '2019-12-23', NULL);
INSERT INTO public.patient_nurse VALUES (28, 8, 11, '2019-12-25', NULL);
INSERT INTO public.patient_nurse VALUES (29, 9, 14, '2019-12-27', NULL);
INSERT INTO public.patient_nurse VALUES (30, 13, 16, '2019-12-29', NULL);
INSERT INTO public.patient_nurse VALUES (31, 12, 18, '2019-12-31', '2020-01-02');
INSERT INTO public.patient_nurse VALUES (32, 17, 20, '2020-01-02', NULL);
INSERT INTO public.patient_nurse VALUES (33, 30, 21, '2020-01-04', '2020-01-06');
INSERT INTO public.patient_nurse VALUES (34, 18, 22, '2020-01-06', NULL);
INSERT INTO public.patient_nurse VALUES (35, 19, 29, '2020-01-08', NULL);
INSERT INTO public.patient_nurse VALUES (36, 20, 1, '2020-01-10', NULL);
INSERT INTO public.patient_nurse VALUES (37, 30, 12, '2020-01-12', '2020-01-16');
INSERT INTO public.patient_nurse VALUES (38, 12, 32, '2020-01-14', '2020-01-16');
INSERT INTO public.patient_nurse VALUES (39, 21, 31, '2020-01-16', NULL);
INSERT INTO public.patient_nurse VALUES (40, 34, 30, '2020-01-18', NULL);
INSERT INTO public.patient_nurse VALUES (41, 37, 3, '2020-01-20', NULL);
INSERT INTO public.patient_nurse VALUES (42, 38, 4, '2020-01-22', NULL);
INSERT INTO public.patient_nurse VALUES (43, 30, 7, '2020-01-24', '2020-01-26');
INSERT INTO public.patient_nurse VALUES (44, 41, 12, '2020-01-26', NULL);
INSERT INTO public.patient_nurse VALUES (45, 42, 1, '2020-01-28', NULL);
INSERT INTO public.patient_nurse VALUES (46, 43, 3, '2020-01-30', NULL);
INSERT INTO public.patient_nurse VALUES (47, 44, 4, '2020-02-01', NULL);
INSERT INTO public.patient_nurse VALUES (48, 12, 7, '2020-02-03', '2020-02-05');
INSERT INTO public.patient_nurse VALUES (49, 46, 9, '2020-02-05', NULL);
INSERT INTO public.patient_nurse VALUES (50, 30, 11, '2020-02-07', '2020-02-10');


--
-- Data for Name: patient_room; Type: TABLE DATA; Schema: public; Owner: keyurpatel
--

INSERT INTO public.patient_room VALUES (1, 1, 1, '2019-11-01', NULL);
INSERT INTO public.patient_room VALUES (2, 3, 5, '2019-11-03', NULL);
INSERT INTO public.patient_room VALUES (3, 4, 6, '2019-11-05', NULL);
INSERT INTO public.patient_room VALUES (4, 5, 14, '2019-11-07', NULL);
INSERT INTO public.patient_room VALUES (5, 10, 15, '2019-11-09', NULL);
INSERT INTO public.patient_room VALUES (6, 11, 16, '2019-11-11', NULL);
INSERT INTO public.patient_room VALUES (7, 12, 17, '2019-11-13', '2019-11-14');
INSERT INTO public.patient_room VALUES (8, 14, 19, '2019-11-15', NULL);
INSERT INTO public.patient_room VALUES (9, 15, 24, '2019-11-17', NULL);
INSERT INTO public.patient_room VALUES (10, 16, 26, '2019-11-19', NULL);
INSERT INTO public.patient_room VALUES (11, 22, 27, '2019-11-21', NULL);
INSERT INTO public.patient_room VALUES (12, 30, 28, '2019-11-23', '2019-11-24');
INSERT INTO public.patient_room VALUES (13, 31, 33, '2019-11-25', NULL);
INSERT INTO public.patient_room VALUES (14, 33, 40, '2019-11-27', NULL);
INSERT INTO public.patient_room VALUES (15, 35, 44, '2019-11-29', NULL);
INSERT INTO public.patient_room VALUES (16, 36, 45, '2019-12-01', NULL);
INSERT INTO public.patient_room VALUES (17, 39, 47, '2019-12-03', NULL);
INSERT INTO public.patient_room VALUES (18, 40, 48, '2019-12-05', NULL);
INSERT INTO public.patient_room VALUES (19, 45, 54, '2019-12-07', NULL);
INSERT INTO public.patient_room VALUES (20, 47, 58, '2019-12-09', NULL);
INSERT INTO public.patient_room VALUES (21, 48, 62, '2019-12-11', NULL);
INSERT INTO public.patient_room VALUES (22, 51, 65, '2019-12-13', NULL);
INSERT INTO public.patient_room VALUES (23, 12, 1, '2019-12-15', '2019-12-17');
INSERT INTO public.patient_room VALUES (24, 30, 5, '2019-12-17', '2019-12-20');
INSERT INTO public.patient_room VALUES (25, 2, 6, '2019-12-19', NULL);
INSERT INTO public.patient_room VALUES (26, 6, 14, '2019-12-21', NULL);
INSERT INTO public.patient_room VALUES (27, 7, 15, '2019-12-23', NULL);
INSERT INTO public.patient_room VALUES (28, 8, 16, '2019-12-25', NULL);
INSERT INTO public.patient_room VALUES (29, 9, 14, '2019-12-27', NULL);
INSERT INTO public.patient_room VALUES (30, 13, 15, '2019-12-29', NULL);
INSERT INTO public.patient_room VALUES (31, 12, 16, '2019-12-31', '2020-01-02');
INSERT INTO public.patient_room VALUES (32, 17, 17, '2020-01-02', NULL);
INSERT INTO public.patient_room VALUES (33, 30, 19, '2020-01-04', '2020-01-06');
INSERT INTO public.patient_room VALUES (34, 18, 24, '2020-01-06', NULL);
INSERT INTO public.patient_room VALUES (35, 19, 28, '2020-01-08', NULL);
INSERT INTO public.patient_room VALUES (36, 20, 33, '2020-01-10', NULL);
INSERT INTO public.patient_room VALUES (37, 30, 40, '2020-01-12', '2020-01-16');
INSERT INTO public.patient_room VALUES (38, 12, 44, '2020-01-14', '2020-01-16');
INSERT INTO public.patient_room VALUES (39, 21, 45, '2020-01-16', NULL);
INSERT INTO public.patient_room VALUES (40, 34, 47, '2020-01-18', NULL);
INSERT INTO public.patient_room VALUES (41, 37, 48, '2020-01-20', NULL);
INSERT INTO public.patient_room VALUES (42, 38, 54, '2020-01-22', NULL);
INSERT INTO public.patient_room VALUES (43, 30, 28, '2020-01-24', '2020-01-26');
INSERT INTO public.patient_room VALUES (44, 41, 33, '2020-01-26', NULL);
INSERT INTO public.patient_room VALUES (45, 42, 40, '2020-01-28', NULL);
INSERT INTO public.patient_room VALUES (46, 43, 44, '2020-01-30', NULL);
INSERT INTO public.patient_room VALUES (47, 44, 45, '2020-02-01', NULL);
INSERT INTO public.patient_room VALUES (48, 12, 47, '2020-02-03', '2020-02-05');
INSERT INTO public.patient_room VALUES (49, 46, 48, '2020-02-05', NULL);
INSERT INTO public.patient_room VALUES (50, 30, 54, '2020-02-07', '2020-02-10');


--
-- Data for Name: prescription; Type: TABLE DATA; Schema: public; Owner: keyurpatel
--

INSERT INTO public.prescription VALUES (1, 1, '2019-11-01');
INSERT INTO public.prescription VALUES (2, 2, '2018-08-11');
INSERT INTO public.prescription VALUES (3, 3, '2019-11-03');
INSERT INTO public.prescription VALUES (4, 4, '2019-11-05');
INSERT INTO public.prescription VALUES (5, 5, '2019-11-07');
INSERT INTO public.prescription VALUES (6, 7, '2017-05-13');
INSERT INTO public.prescription VALUES (7, 10, '2019-11-09');
INSERT INTO public.prescription VALUES (8, 11, '2019-11-11');
INSERT INTO public.prescription VALUES (9, 12, '2019-11-13');
INSERT INTO public.prescription VALUES (10, 13, '2018-11-09');
INSERT INTO public.prescription VALUES (11, 14, '2019-11-15');
INSERT INTO public.prescription VALUES (12, 15, '2019-11-17');
INSERT INTO public.prescription VALUES (13, 16, '2019-11-19');
INSERT INTO public.prescription VALUES (14, 17, '2017-05-13');
INSERT INTO public.prescription VALUES (15, 22, '2019-11-21');
INSERT INTO public.prescription VALUES (16, 23, '2018-08-11');
INSERT INTO public.prescription VALUES (17, 28, '2018-08-11');
INSERT INTO public.prescription VALUES (18, 29, '2018-11-09');
INSERT INTO public.prescription VALUES (19, 30, '2019-11-23');
INSERT INTO public.prescription VALUES (20, 31, '2019-11-25');
INSERT INTO public.prescription VALUES (21, 32, '2017-05-13');
INSERT INTO public.prescription VALUES (22, 33, '2019-11-27');
INSERT INTO public.prescription VALUES (23, 34, '2018-08-11');
INSERT INTO public.prescription VALUES (24, 35, '2019-11-29');
INSERT INTO public.prescription VALUES (25, 36, '2019-12-01');
INSERT INTO public.prescription VALUES (26, 39, '2019-12-03');
INSERT INTO public.prescription VALUES (27, 40, '2019-12-05');
INSERT INTO public.prescription VALUES (28, 41, '2017-05-13');
INSERT INTO public.prescription VALUES (29, 45, '2019-12-07');
INSERT INTO public.prescription VALUES (30, 46, '2017-05-13');
INSERT INTO public.prescription VALUES (31, 47, '2019-12-09');
INSERT INTO public.prescription VALUES (32, 48, '2019-12-11');
INSERT INTO public.prescription VALUES (33, 51, '2019-12-13');


--
-- Data for Name: prescription_medicine; Type: TABLE DATA; Schema: public; Owner: keyurpatel
--

INSERT INTO public.prescription_medicine VALUES (1, 1, '2019-11-01', '2019-11-30', 35);
INSERT INTO public.prescription_medicine VALUES (2, 2, '2018-08-11', '2018-12-01', 40);
INSERT INTO public.prescription_medicine VALUES (3, 3, '2019-11-03', '2019-12-02', 20);
INSERT INTO public.prescription_medicine VALUES (4, 4, '2019-11-05', '2019-12-03', 30);
INSERT INTO public.prescription_medicine VALUES (5, 5, '2019-11-07', '2019-12-04', 40);
INSERT INTO public.prescription_medicine VALUES (6, 6, '2017-05-13', '2017-06-05', 60);
INSERT INTO public.prescription_medicine VALUES (7, 8, '2019-11-09', '2019-12-06', 20);
INSERT INTO public.prescription_medicine VALUES (8, 10, '2019-11-11', '2019-12-07', 30);
INSERT INTO public.prescription_medicine VALUES (9, 12, '2019-11-13', '2019-12-08', 30);
INSERT INTO public.prescription_medicine VALUES (10, 9, '2018-11-09', '2018-12-09', 30);
INSERT INTO public.prescription_medicine VALUES (11, 15, '2019-11-15', '2019-12-10', 60);
INSERT INTO public.prescription_medicine VALUES (12, 16, '2019-11-17', '2019-12-11', 90);
INSERT INTO public.prescription_medicine VALUES (13, 19, '2019-11-19', '2019-12-12', 70);
INSERT INTO public.prescription_medicine VALUES (14, 15, '2017-05-13', '2017-07-13', 60);
INSERT INTO public.prescription_medicine VALUES (15, 15, '2019-11-21', '2019-12-14', 30);
INSERT INTO public.prescription_medicine VALUES (16, 17, '2018-08-11', '2018-11-15', 20);
INSERT INTO public.prescription_medicine VALUES (17, 2, '2018-08-11', '2018-11-16', 20);
INSERT INTO public.prescription_medicine VALUES (18, 6, '2018-11-09', '2018-12-17', 20);
INSERT INTO public.prescription_medicine VALUES (19, 19, '2019-11-23', '2019-12-18', 10);
INSERT INTO public.prescription_medicine VALUES (20, 4, '2019-11-25', '2019-12-19', 10);
INSERT INTO public.prescription_medicine VALUES (21, 9, '2017-05-13', '2017-12-20', 20);
INSERT INTO public.prescription_medicine VALUES (22, 3, '2019-11-27', '2019-12-21', 30);
INSERT INTO public.prescription_medicine VALUES (23, 15, '2018-08-11', '2018-12-22', 40);
INSERT INTO public.prescription_medicine VALUES (24, 3, '2019-11-29', '2019-12-23', 40);
INSERT INTO public.prescription_medicine VALUES (25, 1, '2019-12-01', '2019-12-24', 30);
INSERT INTO public.prescription_medicine VALUES (26, 15, '2019-12-03', '2019-12-25', 30);
INSERT INTO public.prescription_medicine VALUES (27, 16, '2019-12-05', '2019-12-26', 20);
INSERT INTO public.prescription_medicine VALUES (28, 17, '2017-05-13', '2017-06-27', 10);
INSERT INTO public.prescription_medicine VALUES (29, 19, '2019-12-07', '2019-12-28', 10);
INSERT INTO public.prescription_medicine VALUES (30, 2, '2017-05-13', '2017-07-29', 50);
INSERT INTO public.prescription_medicine VALUES (31, 8, '2019-12-09', '2019-12-30', 30);
INSERT INTO public.prescription_medicine VALUES (32, 3, '2019-12-11', '2019-12-31', 20);
INSERT INTO public.prescription_medicine VALUES (33, 4, '2019-12-13', '2020-01-01', 40);


--
-- Data for Name: receptionist; Type: TABLE DATA; Schema: public; Owner: keyurpatel
--

INSERT INTO public.receptionist VALUES (1, 'Christiana', 'Milian', 'chrisitiana345@gmail.com', 'chris_345', 'chris19%milian@345', '732-435-9844');
INSERT INTO public.receptionist VALUES (3, 'Caroline', 'Clarke', 'caroline65@msn.com', 'carole1965', 'clarke_89', '842-409-9854');
INSERT INTO public.receptionist VALUES (5, 'Amanada', 'Methew', 'amanda@gamil.com', 'amanda_1966', 'amanda@85', '746-93-1965');
INSERT INTO public.receptionist VALUES (6, 'Brandi', 'Sackler', 'brandi.sackler@gmail.com', 'brandi98', 'brnadi@sackler68', '848-219-6454');
INSERT INTO public.receptionist VALUES (4, 'Courtney', 'Longo', 'courtney@outlook.com', 'courtney1989', 'e78a07bc7afe00f62095087ccdd57d2c', '848-564-2976');
INSERT INTO public.receptionist VALUES (2, 'Dayrene', 'Martinez', 'dayrene.marti@mail.yahoo', 'martin45', '39f054e83fed6c611af8188c9422c288', '762-457-9134');


--
-- Data for Name: room; Type: TABLE DATA; Schema: public; Owner: keyurpatel
--

INSERT INTO public.room VALUES (1, 'occupied', NULL);
INSERT INTO public.room VALUES (2, 'vacant', NULL);
INSERT INTO public.room VALUES (3, 'vacant', NULL);
INSERT INTO public.room VALUES (4, 'vacant', NULL);
INSERT INTO public.room VALUES (5, 'occupied', NULL);
INSERT INTO public.room VALUES (6, 'occupied', NULL);
INSERT INTO public.room VALUES (7, 'vacant', NULL);
INSERT INTO public.room VALUES (8, 'vacant', NULL);
INSERT INTO public.room VALUES (9, 'vacant', NULL);
INSERT INTO public.room VALUES (10, 'vacant', NULL);
INSERT INTO public.room VALUES (11, 'vacant', NULL);
INSERT INTO public.room VALUES (12, 'vacant', NULL);
INSERT INTO public.room VALUES (13, 'vacant', NULL);
INSERT INTO public.room VALUES (14, 'occupied', NULL);
INSERT INTO public.room VALUES (15, 'occupied', NULL);
INSERT INTO public.room VALUES (16, 'occupied', NULL);
INSERT INTO public.room VALUES (17, 'vacant', NULL);
INSERT INTO public.room VALUES (18, 'vacant', NULL);
INSERT INTO public.room VALUES (19, 'occupied', NULL);
INSERT INTO public.room VALUES (20, 'vacant', NULL);
INSERT INTO public.room VALUES (21, 'vacant', NULL);
INSERT INTO public.room VALUES (22, 'vacant', NULL);
INSERT INTO public.room VALUES (23, 'vacant', NULL);
INSERT INTO public.room VALUES (24, 'occupied', NULL);
INSERT INTO public.room VALUES (25, 'vacant', NULL);
INSERT INTO public.room VALUES (26, 'occupied', NULL);
INSERT INTO public.room VALUES (27, 'occupied', NULL);
INSERT INTO public.room VALUES (28, 'vacant', NULL);
INSERT INTO public.room VALUES (29, 'vacant', NULL);
INSERT INTO public.room VALUES (30, 'vacant', NULL);
INSERT INTO public.room VALUES (31, 'vacant', NULL);
INSERT INTO public.room VALUES (32, 'vacant', NULL);
INSERT INTO public.room VALUES (33, 'occupied', NULL);
INSERT INTO public.room VALUES (34, 'vacant', NULL);
INSERT INTO public.room VALUES (35, 'vacant', NULL);
INSERT INTO public.room VALUES (36, 'vacant', NULL);
INSERT INTO public.room VALUES (37, 'vacant', NULL);
INSERT INTO public.room VALUES (38, 'vacant', NULL);
INSERT INTO public.room VALUES (39, 'vacant', NULL);
INSERT INTO public.room VALUES (40, 'occupied', NULL);
INSERT INTO public.room VALUES (41, 'vacant', NULL);
INSERT INTO public.room VALUES (42, 'vacant', NULL);
INSERT INTO public.room VALUES (43, 'vacant', NULL);
INSERT INTO public.room VALUES (44, 'occupied', NULL);
INSERT INTO public.room VALUES (45, 'occupied', NULL);
INSERT INTO public.room VALUES (46, 'vacant', NULL);
INSERT INTO public.room VALUES (47, 'occupied', NULL);
INSERT INTO public.room VALUES (48, 'occupied', NULL);
INSERT INTO public.room VALUES (49, 'vacant', NULL);
INSERT INTO public.room VALUES (50, 'vacant', NULL);
INSERT INTO public.room VALUES (51, 'vacant', NULL);
INSERT INTO public.room VALUES (52, 'vacant', NULL);
INSERT INTO public.room VALUES (53, 'vacant', NULL);
INSERT INTO public.room VALUES (54, 'occupied', NULL);
INSERT INTO public.room VALUES (55, 'vacant', NULL);
INSERT INTO public.room VALUES (56, 'vacant', NULL);
INSERT INTO public.room VALUES (57, 'vacant', NULL);
INSERT INTO public.room VALUES (58, 'occupied', NULL);
INSERT INTO public.room VALUES (59, 'vacant', NULL);
INSERT INTO public.room VALUES (60, 'vacant', NULL);
INSERT INTO public.room VALUES (61, 'vacant', NULL);
INSERT INTO public.room VALUES (62, 'occupied', NULL);
INSERT INTO public.room VALUES (63, 'vacant', NULL);
INSERT INTO public.room VALUES (64, 'vacant', NULL);
INSERT INTO public.room VALUES (65, 'occupied', NULL);
INSERT INTO public.room VALUES (66, 'vacant', NULL);
INSERT INTO public.room VALUES (67, 'vacant', NULL);
INSERT INTO public.room VALUES (68, 'vacant', NULL);
INSERT INTO public.room VALUES (69, 'vacant', NULL);
INSERT INTO public.room VALUES (70, 'vacant', NULL);
INSERT INTO public.room VALUES (71, 'vacant', NULL);
INSERT INTO public.room VALUES (72, 'vacant', NULL);
INSERT INTO public.room VALUES (73, 'vacant', NULL);
INSERT INTO public.room VALUES (74, 'vacant', NULL);


--
-- Data for Name: visit; Type: TABLE DATA; Schema: public; Owner: keyurpatel
--

INSERT INTO public.visit VALUES (1, 1, 1, '2019-11-01');
INSERT INTO public.visit VALUES (2, 2, 1, '2018-08-11');
INSERT INTO public.visit VALUES (3, 3, 2, '2019-11-03');
INSERT INTO public.visit VALUES (4, 4, 3, '2019-11-05');
INSERT INTO public.visit VALUES (5, 5, 4, '2019-11-07');
INSERT INTO public.visit VALUES (6, 6, 1, '2018-11-09');
INSERT INTO public.visit VALUES (7, 7, 2, '2017-05-13');
INSERT INTO public.visit VALUES (8, 8, 3, '2018-08-11');
INSERT INTO public.visit VALUES (9, 9, 4, '2018-08-11');
INSERT INTO public.visit VALUES (10, 10, 5, '2019-11-09');
INSERT INTO public.visit VALUES (11, 11, 6, '2019-11-11');
INSERT INTO public.visit VALUES (12, 12, 7, '2019-11-13');
INSERT INTO public.visit VALUES (13, 13, 8, '2018-11-09');
INSERT INTO public.visit VALUES (14, 14, 9, '2019-11-15');
INSERT INTO public.visit VALUES (15, 15, 10, '2019-11-17');
INSERT INTO public.visit VALUES (16, 16, 11, '2019-11-19');
INSERT INTO public.visit VALUES (17, 17, 12, '2017-05-13');
INSERT INTO public.visit VALUES (18, 18, 13, '2018-08-11');
INSERT INTO public.visit VALUES (19, 19, 14, '2018-08-11');
INSERT INTO public.visit VALUES (20, 20, 15, '2018-11-09');
INSERT INTO public.visit VALUES (21, 21, 11, '2017-05-13');
INSERT INTO public.visit VALUES (22, 22, 12, '2019-11-21');
INSERT INTO public.visit VALUES (23, 23, 13, '2018-08-11');
INSERT INTO public.visit VALUES (24, 24, 14, '2018-08-11');
INSERT INTO public.visit VALUES (25, 25, 15, '2018-11-09');
INSERT INTO public.visit VALUES (26, 26, 12, '2017-05-13');
INSERT INTO public.visit VALUES (27, 27, 1, '2018-08-11');
INSERT INTO public.visit VALUES (28, 28, 2, '2018-08-11');
INSERT INTO public.visit VALUES (29, 29, 3, '2018-11-09');
INSERT INTO public.visit VALUES (30, 30, 4, '2019-11-23');
INSERT INTO public.visit VALUES (31, 31, 5, '2019-11-25');
INSERT INTO public.visit VALUES (32, 32, 6, '2017-05-13');
INSERT INTO public.visit VALUES (33, 33, 7, '2019-11-27');
INSERT INTO public.visit VALUES (34, 34, 8, '2020-01-18');
INSERT INTO public.visit VALUES (35, 35, 9, '2019-11-29');
INSERT INTO public.visit VALUES (36, 36, 10, '2019-12-01');
INSERT INTO public.visit VALUES (37, 37, 11, '2018-08-11');
INSERT INTO public.visit VALUES (38, 38, 12, '2020-01-22');
INSERT INTO public.visit VALUES (39, 39, 13, '2019-12-03');
INSERT INTO public.visit VALUES (40, 40, 14, '2019-12-05');
INSERT INTO public.visit VALUES (41, 41, 15, '2020-01-26');
INSERT INTO public.visit VALUES (42, 42, 1, '2020-01-28');
INSERT INTO public.visit VALUES (43, 43, 2, '2020-01-30');
INSERT INTO public.visit VALUES (44, 44, 3, '2020-02-01');
INSERT INTO public.visit VALUES (45, 45, 4, '2019-12-07');
INSERT INTO public.visit VALUES (46, 46, 5, '2020-02-05');
INSERT INTO public.visit VALUES (47, 47, 6, '2019-12-09');
INSERT INTO public.visit VALUES (48, 48, 7, '2019-12-11');
INSERT INTO public.visit VALUES (49, 49, 8, '2018-08-11');
INSERT INTO public.visit VALUES (50, 50, 9, '2018-08-11');
INSERT INTO public.visit VALUES (51, 51, 10, '2019-12-13');
INSERT INTO public.visit VALUES (52, 12, 7, '2019-12-15');
INSERT INTO public.visit VALUES (53, 12, 7, '2019-12-31');
INSERT INTO public.visit VALUES (54, 12, 7, '2020-01-14');
INSERT INTO public.visit VALUES (55, 12, 7, '2020-02-03');
INSERT INTO public.visit VALUES (56, 30, 4, '2019-12-17');
INSERT INTO public.visit VALUES (57, 30, 4, '2020-01-04');
INSERT INTO public.visit VALUES (58, 30, 4, '2020-01-12');
INSERT INTO public.visit VALUES (59, 30, 4, '2020-02-07');


--
-- Name: diagnosis_diagnosis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: keyurpatel
--

SELECT pg_catalog.setval('public.diagnosis_diagnosis_id_seq', 1, false);


--
-- Name: doctor_doctor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: keyurpatel
--

SELECT pg_catalog.setval('public.doctor_doctor_id_seq', 1, false);


--
-- Name: medicine_medicine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: keyurpatel
--

SELECT pg_catalog.setval('public.medicine_medicine_id_seq', 1, false);


--
-- Name: nurse_nurse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: keyurpatel
--

SELECT pg_catalog.setval('public.nurse_nurse_id_seq', 1, false);


--
-- Name: patient_nurse_patient_nurse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: keyurpatel
--

SELECT pg_catalog.setval('public.patient_nurse_patient_nurse_id_seq', 1, false);


--
-- Name: patient_patient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: keyurpatel
--

SELECT pg_catalog.setval('public.patient_patient_id_seq', 55, true);


--
-- Name: prescription_prescription_id_seq; Type: SEQUENCE SET; Schema: public; Owner: keyurpatel
--

SELECT pg_catalog.setval('public.prescription_prescription_id_seq', 1, false);


--
-- Name: receptionist_r_id_seq; Type: SEQUENCE SET; Schema: public; Owner: keyurpatel
--

SELECT pg_catalog.setval('public.receptionist_r_id_seq', 1, true);


--
-- Name: room_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: keyurpatel
--

SELECT pg_catalog.setval('public.room_room_id_seq', 2, true);


--
-- Name: visit_visit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: keyurpatel
--

SELECT pg_catalog.setval('public.visit_visit_id_seq', 1, false);


--
-- Name: diagnosis diagnosis_pkey; Type: CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.diagnosis
    ADD CONSTRAINT diagnosis_pkey PRIMARY KEY (diagnosis_id);


--
-- Name: diseases diseases_pkey; Type: CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.diseases
    ADD CONSTRAINT diseases_pkey PRIMARY KEY (disease_id);


--
-- Name: doctors doctor_pkey; Type: CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.doctors
    ADD CONSTRAINT doctor_pkey PRIMARY KEY (doctor_id);


--
-- Name: medicine medicine_pkey; Type: CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.medicine
    ADD CONSTRAINT medicine_pkey PRIMARY KEY (medicine_id);


--
-- Name: nurse nurse_pkey; Type: CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.nurse
    ADD CONSTRAINT nurse_pkey PRIMARY KEY (nurse_id);


--
-- Name: patient_nurse patient_nurse_pkey; Type: CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.patient_nurse
    ADD CONSTRAINT patient_nurse_pkey PRIMARY KEY (patient_nurse_id);


--
-- Name: patient patient_pkey; Type: CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_pkey PRIMARY KEY (patient_id);


--
-- Name: patient_room patient_room_pkey; Type: CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.patient_room
    ADD CONSTRAINT patient_room_pkey PRIMARY KEY (inpatient_id);


--
-- Name: prescription_medicine prescription_medicine_pkey; Type: CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.prescription_medicine
    ADD CONSTRAINT prescription_medicine_pkey PRIMARY KEY (prescription_id, medicine_id);


--
-- Name: prescription prescription_pkey; Type: CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.prescription
    ADD CONSTRAINT prescription_pkey PRIMARY KEY (prescription_id);


--
-- Name: receptionist receptionist_pkey; Type: CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.receptionist
    ADD CONSTRAINT receptionist_pkey PRIMARY KEY (r_id);


--
-- Name: room room_pkey; Type: CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (room_id);


--
-- Name: visit visit_pkey; Type: CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.visit
    ADD CONSTRAINT visit_pkey PRIMARY KEY (visit_id);


--
-- Name: diagnosis fk_disease; Type: FK CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.diagnosis
    ADD CONSTRAINT fk_disease FOREIGN KEY (disease_id) REFERENCES public.diseases(disease_id);


--
-- Name: visit fk_doctor_has_patient_doctor; Type: FK CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.visit
    ADD CONSTRAINT fk_doctor_has_patient_doctor FOREIGN KEY (doctor_id) REFERENCES public.doctors(doctor_id);


--
-- Name: visit fk_doctor_has_patient_patient1; Type: FK CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.visit
    ADD CONSTRAINT fk_doctor_has_patient_patient1 FOREIGN KEY (patient_id) REFERENCES public.patient(patient_id);


--
-- Name: patient_nurse fk_patient_has_nurse_nurse1; Type: FK CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.patient_nurse
    ADD CONSTRAINT fk_patient_has_nurse_nurse1 FOREIGN KEY (nurse_id) REFERENCES public.nurse(nurse_id);


--
-- Name: patient_nurse fk_patient_has_nurse_patient1; Type: FK CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.patient_nurse
    ADD CONSTRAINT fk_patient_has_nurse_patient1 FOREIGN KEY (patient_id) REFERENCES public.patient(patient_id);


--
-- Name: patient_room fk_patient_has_room_patient1; Type: FK CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.patient_room
    ADD CONSTRAINT fk_patient_has_room_patient1 FOREIGN KEY (patient_id) REFERENCES public.patient(patient_id);


--
-- Name: patient_room fk_patient_has_room_room1; Type: FK CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.patient_room
    ADD CONSTRAINT fk_patient_has_room_room1 FOREIGN KEY (room_id) REFERENCES public.room(room_id);


--
-- Name: prescription fk_prescription_diagnosis1; Type: FK CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.prescription
    ADD CONSTRAINT fk_prescription_diagnosis1 FOREIGN KEY (diagnosis_id) REFERENCES public.diagnosis(diagnosis_id);


--
-- Name: prescription_medicine fk_prescription_medicine_medicine1; Type: FK CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.prescription_medicine
    ADD CONSTRAINT fk_prescription_medicine_medicine1 FOREIGN KEY (medicine_id) REFERENCES public.medicine(medicine_id);


--
-- Name: prescription_medicine fk_prescription_medicine_prescription1; Type: FK CONSTRAINT; Schema: public; Owner: keyurpatel
--

ALTER TABLE ONLY public.prescription_medicine
    ADD CONSTRAINT fk_prescription_medicine_prescription1 FOREIGN KEY (prescription_id) REFERENCES public.prescription(prescription_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: keyurpatel
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO keyurpatel;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

