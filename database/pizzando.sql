--
-- PostgreSQL database dump
--

\restrict Nj0j5YyfvMYdz9yw4RxOaU2KQTRvy4OhimyBEAbqCT2r03iu5oKwhPjU1TKwXCi

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.4

-- Started on 2026-11-20 16:08:33

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 219 (class 1259 OID 24839)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    cpf character varying NOT NULL,
    endereco character varying
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24865)
-- Name: entregador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entregador (
    status character varying,
    ent_cod integer NOT NULL
);


ALTER TABLE public.entregador OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 24873)
-- Name: funcionario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.funcionario (
    nome character varying,
    codigo integer NOT NULL,
    cargo character varying
);


ALTER TABLE public.funcionario OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24847)
-- Name: pedido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedido (
    ent_cod integer NOT NULL,
    valor_total numeric,
    frete numeric,
    fk_cliente_cpf character varying,
    fk_entregador_ent_cod integer,
    fk_funcionario_codigo integer,
    fk_pizza_cod_pizza integer
);


ALTER TABLE public.pedido OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 24856)
-- Name: pizza; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pizza (
    preco numeric,
    sabor character varying,
    fk_pedido_ent_cod integer,
    cod_pizza integer NOT NULL
);


ALTER TABLE public.pizza OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24855)
-- Name: pizza_cod_pizza_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pizza_cod_pizza_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pizza_cod_pizza_seq OWNER TO postgres;

--
-- TOC entry 5046 (class 0 OID 0)
-- Dependencies: 221
-- Name: pizza_cod_pizza_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pizza_cod_pizza_seq OWNED BY public.pizza.cod_pizza;


--
-- TOC entry 4872 (class 2604 OID 24859)
-- Name: pizza cod_pizza; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza ALTER COLUMN cod_pizza SET DEFAULT nextval('public.pizza_cod_pizza_seq'::regclass);


--
-- TOC entry 5035 (class 0 OID 24839)
-- Dependencies: 219
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (cpf, endereco) FROM stdin;
11111111111	Rua das Flores, 120
22222222222	Av. Brasil, 450
33333333333	Rua São João, 80
44444444444	Rua das Palmeiras, 210
55555555555	Av. Central, 900
66666666666	Rua das Acácias, 35
77777777777	Rua dos Pinheiros, 600
\.


--
-- TOC entry 5039 (class 0 OID 24865)
-- Dependencies: 223
-- Data for Name: entregador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entregador (status, ent_cod) FROM stdin;
Disponível	1
Em entrega	2
Disponível	3
Indisponível	4
Em entrega	5
Disponível	6
Disponível	7
\.


--
-- TOC entry 5040 (class 0 OID 24873)
-- Dependencies: 224
-- Data for Name: funcionario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.funcionario (nome, codigo, cargo) FROM stdin;
Carlos	1	Atendente
Mariana	2	Gerente
Pedro	3	Pizzaiolo
Ana	4	Atendente
Lucas	5	Pizzaiolo
Juliana	6	Caixa
Rafael	7	Gerente
\.


--
-- TOC entry 5036 (class 0 OID 24847)
-- Dependencies: 220
-- Data for Name: pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedido (ent_cod, valor_total, frete, fk_cliente_cpf, fk_entregador_ent_cod, fk_funcionario_codigo, fk_pizza_cod_pizza) FROM stdin;
1	55.00	8.00	11111111111	1	1	1
2	72.00	10.00	22222222222	2	2	2
3	45.00	7.00	33333333333	3	3	3
4	89.00	12.00	44444444444	4	4	4
5	60.00	8.00	55555555555	5	5	5
6	95.00	10.00	66666666666	6	6	6
7	38.00	6.00	77777777777	7	7	7
\.


--
-- TOC entry 5038 (class 0 OID 24856)
-- Dependencies: 222
-- Data for Name: pizza; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pizza (preco, sabor, fk_pedido_ent_cod, cod_pizza) FROM stdin;
47.00	Calabresa	1	1
62.00	Quatro Queijos	2	2
38.00	Mussarela	3	3
77.00	Portuguesa	4	4
52.00	Frango com Catupiry	5	5
85.00	Bacon	6	6
32.00	Marguerita	7	7
\.


--
-- TOC entry 5047 (class 0 OID 0)
-- Dependencies: 221
-- Name: pizza_cod_pizza_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pizza_cod_pizza_seq', 7, true);


--
-- TOC entry 4874 (class 2606 OID 24846)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (cpf);


--
-- TOC entry 4880 (class 2606 OID 24872)
-- Name: entregador entregador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entregador
    ADD CONSTRAINT entregador_pkey PRIMARY KEY (ent_cod);


--
-- TOC entry 4882 (class 2606 OID 24880)
-- Name: funcionario funcionario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (codigo);


--
-- TOC entry 4876 (class 2606 OID 24854)
-- Name: pedido pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (ent_cod);


--
-- TOC entry 4878 (class 2606 OID 24864)
-- Name: pizza pizza_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza
    ADD CONSTRAINT pizza_pkey PRIMARY KEY (cod_pizza);


--
-- TOC entry 4883 (class 2606 OID 24881)
-- Name: pedido fk_pedido_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT fk_pedido_2 FOREIGN KEY (fk_cliente_cpf) REFERENCES public.cliente(cpf) ON DELETE RESTRICT;


--
-- TOC entry 4884 (class 2606 OID 24886)
-- Name: pedido fk_pedido_3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT fk_pedido_3 FOREIGN KEY (fk_entregador_ent_cod) REFERENCES public.entregador(ent_cod) ON DELETE RESTRICT;


--
-- TOC entry 4885 (class 2606 OID 24891)
-- Name: pedido fk_pedido_4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT fk_pedido_4 FOREIGN KEY (fk_funcionario_codigo) REFERENCES public.funcionario(codigo) ON DELETE RESTRICT;


--
-- TOC entry 4886 (class 2606 OID 24896)
-- Name: pedido fk_pedido_5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedido
    ADD CONSTRAINT fk_pedido_5 FOREIGN KEY (fk_pizza_cod_pizza) REFERENCES public.pizza(cod_pizza);


--
-- TOC entry 4887 (class 2606 OID 24901)
-- Name: pizza fk_pizza_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pizza
    ADD CONSTRAINT fk_pizza_1 FOREIGN KEY (fk_pedido_ent_cod) REFERENCES public.pedido(ent_cod) ON DELETE CASCADE;


-- Completed on 2026-11-20 16:08:34

--
-- PostgreSQL database dump complete
--

\unrestrict Nj0j5YyfvMYdz9yw4RxOaU2KQTRvy4OhimyBEAbqCT2r03iu5oKwhPjU1TKwXCi

