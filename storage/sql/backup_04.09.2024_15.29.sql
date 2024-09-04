--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg120+1)
-- Dumped by pg_dump version 16.4 (Ubuntu 16.4-1.pgdg22.04+1)

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
-- Name: goose_db_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.goose_db_version (
    id integer NOT NULL,
    version_id bigint NOT NULL,
    is_applied boolean NOT NULL,
    tstamp timestamp without time zone DEFAULT now()
);


ALTER TABLE public.goose_db_version OWNER TO postgres;

--
-- Name: goose_db_version_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.goose_db_version_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.goose_db_version_id_seq OWNER TO postgres;

--
-- Name: goose_db_version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.goose_db_version_id_seq OWNED BY public.goose_db_version.id;


--
-- Name: sentences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sentences (
    id bigint NOT NULL,
    word_id bigint NOT NULL,
    sentence text NOT NULL,
    translation text NOT NULL,
    rate integer NOT NULL
);


ALTER TABLE public.sentences OWNER TO postgres;

--
-- Name: sentences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sentences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sentences_id_seq OWNER TO postgres;

--
-- Name: sentences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sentences_id_seq OWNED BY public.sentences.id;


--
-- Name: words; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.words (
    id bigint NOT NULL,
    word_pron_stress text NOT NULL,
    translation text NOT NULL,
    rate integer NOT NULL
);


ALTER TABLE public.words OWNER TO postgres;

--
-- Name: words_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.words_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.words_id_seq OWNER TO postgres;

--
-- Name: words_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.words_id_seq OWNED BY public.words.id;


--
-- Name: goose_db_version id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goose_db_version ALTER COLUMN id SET DEFAULT nextval('public.goose_db_version_id_seq'::regclass);


--
-- Name: sentences id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sentences ALTER COLUMN id SET DEFAULT nextval('public.sentences_id_seq'::regclass);


--
-- Name: words id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.words ALTER COLUMN id SET DEFAULT nextval('public.words_id_seq'::regclass);


--
-- Data for Name: goose_db_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.goose_db_version (id, version_id, is_applied, tstamp) FROM stdin;
1	0	t	2024-08-25 17:39:22.961454
4	1	t	2024-08-26 09:13:49.697172
\.


--
-- Data for Name: sentences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sentences (id, word_id, sentence, translation, rate) FROM stdin;
1	1	The elephant's tusk was incredibly long.	Бивень слона был невероятно длинным.	1
2	1	He found an ancient tusk buried in the ground.	Он нашел древний бивень, зарытый в земле.	1
3	1	The poachers were caught with illegal tusks.	Браконьеры были пойманы с нелегальными бивнями.	1
5	2	His insight helped the team make a better decision.	Его проницательность помогла команде принять лучшее решение.	2
6	2	The book provides deep insights into human behavior.	Книга дает глубокие прозрения в человеческое поведение.	2
7	3	The mantis waited patiently for its prey.	Богомол терпеливо ждал свою добычу.	2
8	3	She watched the mantis move slowly across the branch.	Она наблюдала, как богомол медленно двигался по ветке.	2
9	3	The mantis is known for its distinctive pose.	Богомол известен своей характерной позой.	0
16	6	The system switched to failover mode after the primary server failed.	Система переключилась на режим резервирования после сбоя основного сервера.	2
17	6	Failover ensures continuity during hardware failures.	Резервирование обеспечивает непрерывность работы при сбоях оборудования.	2
18	6	They tested the failover mechanism thoroughly.	Они тщательно протестировали механизм резервирования.	1
19	7	He noticed a sign warning of the danger ahead.	Он заметил знак, предупреждающий об опасности впереди.	2
20	7	The sign was clear and easy to read.	Знак был четким и легко читался.	1
21	7	She gave him a sign to proceed.	Она дала ему знак продолжать.	2
22	8	She tried to make the room cozy.	Она попыталась сделать комнату уютной.	2
23	8	They make the process efficient by simplifying steps.	Они делают процесс эффективным, упрощая шаги.	2
24	8	You can make the presentation more engaging with visuals.	Вы можете сделать презентацию более увлекательной с помощью визуальных элементов.	2
25	9	He will take over as manager next month.	Он вступит на должность менеджера в следующем месяце.	1
26	9	She plans to take over the family business.	Она планирует взять на себя управление семейным бизнесом.	2
27	9	The new leader will take over after the election.	Новый лидер вступит на должность после выборов.	2
28	10	The fireworks display was a magnificent sight.	Фейерверк был великолепным зрелищем.	0
29	10	She was a sight to behold in her wedding dress.	Она была зрелищем в своем свадебном платье.	2
30	10	The sunrise over the mountains is always a beautiful sight.	Восход солнца над горами всегда прекрасное зрелище.	2
31	11	They walked down a narrow alley between the buildings.	Они прошли по узкому переулку между зданиями.	2
32	11	The alley was dark and deserted.	Переулок был темным и пустынным.	2
33	11	She lives in a small house at the end of the alley.	Она живет в небольшом доме в конце переулка.	2
34	12	The army planned to conquer new territories.	Армия планировала завоевать новые территории.	2
35	12	He wants to conquer his fear of public speaking.	Он хочет преодолеть свой страх перед публичными выступлениями.	2
36	12	The king sought to conquer all the lands around him.	Король стремился завоевать все земли вокруг себя.	2
37	13	For all the promises made, few were kept.	Из всех данных обещаний, было выполнено лишь несколько.	0
38	13	For all the money spent, the results were disappointing.	Несмотря на все потраченные деньги, результаты были разочаровывающими.	0
39	13	For all the effort put in, the project still failed.	Несмотря на все усилия, проект все равно провалился.	2
11	4	The beetle's mandibles are very strong.	Жвалы жука очень сильные.	3
12	4	Mandibles help insects grasp and cut food.	Жвалы помогают насекомым захватывать и разрезать пищу.	3
13	5	The machine was busy spooling the thread onto the reel.	Машина была занята наматыванием нити на катушку.	2
15	5	Spooling can help organize long lengths of material.	Наматывание может помочь организовать длинные отрезки материала.	3
14	5	He observed the spooling process carefully.	Он внимательно наблюдал за процессом наматывания.	4
40	14	The car's rear bumper was damaged in the accident.	Задний бампер машины был поврежден в аварии.	2
41	14	He prefers to sit in the rear of the theater.	Он предпочитает сидеть в задней части театра.	2
42	14	The soldiers were positioned at the rear of the formation.	Солдаты были расположены в задней части строя.	2
45	15	Her writing is clear and precise.	Ее письмо ясно и точно.	2
46	16	The precision of the instrument is unmatched.	Точность этого прибора не имеет равных.	2
47	16	They worked with great precision to avoid mistakes.	Они работали с большой точностью, чтобы избежать ошибок.	2
48	16	The precision of the calculations was critical for the project.	Точность расчетов была критически важна для проекта.	2
49	17	The car had to swerve to avoid hitting the pedestrian.	Машине пришлось свернуть, чтобы не сбить пешехода.	2
50	17	He swerved suddenly to miss the obstacle in the road.	Он резко свернул, чтобы избежать препятствия на дороге.	2
51	17	The driver swerved to the right to avoid a collision.	Водитель свернул вправо, чтобы избежать столкновения.	2
52	18	The strictness of the rules surprised everyone.	Строгость правил удивила всех.	2
53	18	Her strictness in following the schedule paid off.	Ее строгость в соблюдении графика принесла свои плоды.	0
54	18	The teacher's strictness helped maintain discipline in the classroom.	Строгость учителя помогла поддерживать дисциплину в классе.	2
57	19	Her views are the complete opposite of mine.	Ее взгляды - полная противоположность моим.	2
55	19	His behavior is the complete opposite of what I expected.	Его поведение - полная противоположность тому, что я ожидал.	3
56	19	The design is the complete opposite of what we discussed.	Дизайн - полная противоположность тому, что мы обсуждали.	3
58	20	The birds were seen ascending into the sky.	Птицы были замечены, поднимающимися в небо.	2
59	20	The stairs are ascending to the top floor.	Лестница ведет на верхний этаж.	2
60	20	The graph shows an ascending trend over the years.	График показывает восходящую тенденцию за последние годы.	2
61	21	The permutation of the elements resulted in a new pattern.	Перестановка элементов привела к новому узору.	2
62	21	Mathematicians study the permutation of numbers.	Математики изучают перестановку чисел.	2
63	21	This problem can be solved by finding the right permutation.	Эту проблему можно решить, найдя правильную перестановку.	2
64	22	She solved the equation quickly and accurately.	Она быстро и точно решила уравнение.	2
65	22	The equation represents the relationship between the variables.	Уравнение представляет собой соотношение между переменными.	2
66	22	Understanding the equation is key to understanding the problem.	Понимание уравнения - ключ к пониманию проблемы.	2
67	23	The enumeration of the items took longer than expected.	Перечисление предметов заняло больше времени, чем ожидалось.	2
68	23	He provided a clear enumeration of the steps needed.	Он дал четкое перечисление необходимых шагов.	2
69	23	The list was a simple enumeration of the options available.	Список представлял собой простое перечисление доступных вариантов.	2
70	24	The company's hierarchy determines the chain of command.	Иерархия компании определяет цепочку команд.	2
71	24	He studied the hierarchy of the organization.	Он изучал иерархию организации.	2
72	24	The hierarchy within the group was clearly established.	Иерархия внутри группы была четко установлена.	2
73	25	A quick note will suffice for now.	Краткое примечание будет достаточно на данный момент.	2
74	25	This amount of money should suffice for the trip.	Этой суммы денег должно хватить на поездку.	2
75	25	A simple explanation will suffice to understand the concept.	Простого объяснения будет достаточно, чтобы понять концепцию.	2
79	27	She is a diligent student who always does her homework.	Она прилежная ученица, которая всегда делает домашнее задание.	2
80	27	He worked diligently to complete the project on time.	Он прилежно работал, чтобы завершить проект вовремя.	2
81	27	Diligent workers are often rewarded for their efforts.	Прилежные работники часто вознаграждаются за свои усилия.	2
76	26	He has a decent job with a good salary.	У него приличная работа с хорошей зарплатой.	2
77	26	She found a decent place to live in the city.	Она нашла приличное место для жизни в городе.	2
78	26	The meal was decent, but nothing extraordinary.	Еда была приличной, но ничего особенного.	3
82	28	He is a prominent figure in the field of science.	Он видная фигура в области науки.	2
83	28	The building is in a prominent location downtown.	Здание находится в видном месте в центре города.	2
84	28	Her work has earned her a prominent place in the industry.	Ее работа принесла ей видное место в отрасли.	0
88	30	The electrical circuit needs to be checked for faults.	Электрическая схема должна быть проверена на наличие неисправностей.	1
89	30	He designed a circuit for the new device.	Он спроектировал схему для нового устройства.	1
90	30	The circuit board was carefully assembled.	Плата была тщательно собрана.	2
87	29	Diligence is key to achieving success.	Усердие - ключ к достижению успеха.	2
86	29	He was praised for his diligence and hard work.	Его похвалили за усердие и тяжелый труд.	3
93	31	The dashboard lights up when the car is started.	Приборная панель загорается при запуске автомобиля.	2
92	31	He customized the dashboard with new indicators.	Он настроил приборную панель с новыми индикаторами.	3
94	32	The plane is descending toward the runway.	Самолет снижается к взлетно-посадочной полосе.	2
95	32	The sun is slowly descending behind the mountains.	Солнце медленно опускается за горы.	2
96	32	The elevator is descending to the ground floor.	Лифт спускается на первый этаж.	2
97	33	The project faced a major setback due to lack of funding.	Проект столкнулся с серьезной неудачей из-за нехватки финансирования.	2
98	33	He experienced a setback in his recovery after the surgery.	Он столкнулся с неудачей в своем восстановлении после операции.	2
99	33	Despite the setback, they continued to work hard.	Несмотря на неудачу, они продолжали усердно работать.	2
100	34	The cable was severed during construction work.	Кабель был разорван во время строительных работ.	2
101	34	Their friendship was severed after the argument.	Их дружба была разорвана после ссоры.	2
102	34	The tree's branch was severed in the storm.	Ветвь дерева была оторвана во время шторма.	2
103	35	He proposed a new plan to improve efficiency.	Он предложил новый план по улучшению эффективности.	2
104	35	She proposed that they go out for dinner.	Она предложила пойти поужинать.	2
105	35	The committee proposed several changes to the policy.	Комитет предложил несколько изменений в политику.	2
106	36	He outlined the main points of the presentation.	Он набросал основные моменты презентации.	2
107	36	She outlined the steps needed to complete the project.	Она набросала шаги, необходимые для завершения проекта.	2
108	36	The report outlines the key findings of the study.	В отчете изложены ключевые выводы исследования.	2
109	37	His work is often underrated by his peers.	Его работу часто недооценивают его коллеги.	2
110	37	The movie is an underrated gem that deserves more attention.	Этот фильм - недооцененный шедевр, заслуживающий большего внимания.	2
111	37	She believes that the artist is underrated in the art world.	Она считает, что этот художник недооценен в мире искусства.	2
112	38	The loud noise disrupted the meeting.	Громкий шум нарушил встречу.	2
113	38	Their plans were disrupted by the unexpected storm.	Их планы были нарушены неожиданным штормом.	2
114	38	Construction work has disrupted traffic in the area.	Строительные работы нарушили движение в этом районе.	2
115	39	Please do not disturb me while I'm working.	Пожалуйста, не мешайте мне, когда я работаю.	2
116	39	The noise outside disturbed her sleep.	Шум снаружи нарушил ее сон.	2
117	39	He was disturbed by the news he heard.	Его потревожили новости, которые он услышал.	2
118	40	The bright lights distracted him from his work.	Яркие огни отвлекли его от работы.	2
119	40	She was distracted by the conversation in the next room.	Ее отвлек разговор в соседней комнате.	2
120	40	Don't let the noise distract you from your studies.	Не позволяй шуму отвлекать тебя от учебы.	2
121	41	He accidentally smashed the vase while cleaning.	Он случайно разбил вазу во время уборки.	2
122	41	The car smashed into the wall.	Машина врезалась в стену.	2
123	41	She smashed the glass in anger.	Она разбила стекло от злости.	2
124	42	The fire destroyed several homes in the area.	Огонь разрушил несколько домов в этом районе.	2
125	42	They plan to destroy the old building to make way for a new one.	Они планируют разрушить старое здание, чтобы освободить место для нового.	2
126	42	The virus destroyed all the data on the computer.	Вирус уничтожил все данные на компьютере.	2
127	43	Please do not interfere with their work.	Пожалуйста, не вмешивайтесь в их работу.	2
128	43	The government was accused of interfering in the election.	Правительство обвинили во вмешательстве в выборы.	2
130	44	The company was fined for environmental violations.	Компания была оштрафована за нарушения экологических норм.	2
131	44	He was caught in violation of the law.	Его поймали за нарушением закона.	0
133	45	He walked across the bridge to the other side.	Он перешел через мост на другую сторону.	2
134	45	The boat sailed across the lake.	Лодка проплыла через озеро.	2
135	45	They ran across the field to reach the house.	Они побежали через поле, чтобы добраться до дома.	2
136	46	After the setback, the company bounced back quickly.	После неудачи компания быстро вернулась к нормальной работе.	2
137	46	He managed to bounce back after the injury.	Он сумел восстановиться после травмы.	2
138	46	The economy is expected to bounce back in the next quarter.	Ожидается, что экономика восстановится в следующем квартале.	2
139	47	The hospital maintains a sterile environment in the operating room.	Больница поддерживает стерильную обстановку в операционной.	2
140	47	The equipment was thoroughly sterilized before use.	Оборудование было тщательно стерилизовано перед использованием.	2
141	47	Sterile conditions are essential for certain medical procedures.	Стерильные условия необходимы для проведения некоторых медицинских процедур.	2
142	48	They decided to proceed with the project despite the risks.	Они решили продолжить проект, несмотря на риски.	2
143	48	Please proceed to the next step in the process.	Пожалуйста, переходите к следующему этапу процесса.	2
144	48	The meeting proceeded as planned.	Встреча прошла по плану.	2
145	49	The machine operates in a continuous cycle.	Машина работает в непрерывном цикле.	2
146	49	Continuous improvement is key to success.	Непрерывное улучшение - ключ к успеху.	2
147	49	The process requires continuous monitoring.	Процесс требует непрерывного мониторинга.	2
148	50	The farmers are preparing for the harvest season.	Фермеры готовятся к сезону сбора урожая.	2
149	50	This year's harvest was exceptionally good.	Урожай в этом году был исключительно хорошим.	2
150	50	They worked hard to bring in the harvest before the rain.	Они усердно работали, чтобы собрать урожай до дождя.	1
151	51	The crops were damaged by the severe weather.	Урожай был поврежден из-за суровой погоды.	2
152	51	They grow a variety of crops on their farm.	Они выращивают различные культуры на своей ферме.	2
153	51	The crops are ready for harvest.	Урожай готов к сбору.	2
154	52	The peasant worked long hours in the fields.	Крестьянин работал долгие часы в полях.	2
155	52	Peasants often had to pay high taxes to the landowners.	Крестьяне часто вынуждены были платить высокие налоги землевладельцам.	2
156	52	The peasant's life was difficult and full of hardships.	Жизнь крестьянина была трудной и полной лишений.	2
160	54	They grow cereals like wheat and barley.	Они выращивают зерновые культуры, такие как пшеница и ячмень.	2
161	54	Cereals are a staple food in many countries.	Зерновые являются основным продуктом питания во многих странах.	2
162	54	He eats cereals for breakfast every morning.	Он ест зерновые на завтрак каждое утро.	2
163	55	They have a beautiful garden in their backyard.	У них красивый сад на заднем дворе.	2
164	55	The children played in the backyard all afternoon.	Дети весь день играли на заднем дворе.	2
165	55	She grows vegetables in her backyard.	Она выращивает овощи на заднем дворе.	2
166	56	They enjoyed a meal on the patio.	Они насладились едой на внутреннем дворике.	2
167	56	The patio is a great place to relax in the evening.	Патио - отличное место для отдыха вечером.	2
168	56	He set up a grill on the patio for the barbecue.	Он установил гриль на патио для барбекю.	2
169	57	She spends a lot of time in her garden.	Она проводит много времени в своем саду.	2
170	57	The garden is full of colorful flowers.	Сад полон ярких цветов.	2
171	57	They planted vegetables in the garden this year.	В этом году они посадили овощи в саду.	2
172	58	The roof started to leak after the heavy rain.	Крыша начала протекать после сильного дождя.	2
157	53	A swarm of locusts descended on the crops.	Рой саранчи обрушился на посевы.	3
158	53	The locusts caused widespread damage to the fields.	Саранча нанесла значительный ущерб полям.	3
159	53	Locusts are known for their destructive behavior.	Саранча известна своим разрушительным поведением.	3
652	218	Humans, dogs, and whales are all mammals.	Люди, собаки и киты — все млекопитающие.	1
174	58	The secret information was leaked to the press.	Секретная информация была утекла в прессу.	2
175	59	She reproached him for being late.	Она упрекнула его за опоздание.	2
176	59	He felt reproached by his friend's words.	Он почувствовал упрек в словах своего друга.	2
178	60	Her reproach was evident in her tone.	Ее упрек был очевиден в ее тоне.	2
179	60	He faced reproach from his colleagues for his mistake.	Он столкнулся с упреком со стороны коллег за свою ошибку.	2
180	60	The reproach in his voice was clear.	Упрек в его голосе был ясен.	2
181	61	He got hit by a car while crossing the street.	Его сбила машина, когда он переходил улицу.	2
182	61	The player got hit during the game and was taken to the hospital.	Игрок получил удар во время игры и был доставлен в больницу.	2
183	61	She got hit with bad news at work today.	Сегодня на работе ей сообщили плохие новости.	2
184	62	He remained cool-headed in the face of danger.	Он оставался хладнокровным перед лицом опасности.	2
185	62	A cool-headed leader can make better decisions under pressure.	Хладнокровный лидер может принимать лучшие решения в условиях давления.	2
186	62	She is known for being cool-headed even in stressful situations.	Она известна тем, что сохраняет хладнокровие даже в стрессовых ситуациях.	2
187	63	He tried to stay calm during the emergency.	Он старался сохранять спокойствие во время чрезвычайной ситуации.	2
188	63	She took a deep breath to stay calm.	Она глубоко вздохнула, чтобы сохранить спокойствие.	2
189	63	It's important to stay calm in difficult times.	Важно сохранять спокойствие в трудные времена.	2
190	64	The box contains all the necessary tools.	Коробка содержит все необходимые инструменты.	2
191	64	He tried to contain his anger during the meeting.	Он пытался сдерживать свой гнев на встрече.	2
192	64	The report contains valuable information.	В отчете содержится ценная информация.	2
193	65	He has been sober for two years now.	Он уже два года трезвый.	2
194	65	She gave a sober assessment of the situation.	Она дала трезвую оценку ситуации.	2
195	65	It's important to stay sober when making important decisions.	Важно оставаться трезвым при принятии важных решений.	2
196	66	The road was full of potholes after the winter.	Дорога была полна выбоин после зимы.	2
197	66	He hit a pothole and damaged his car.	Он наехал на выбоину и повредил машину.	2
198	66	They are planning to repair the potholes next week.	Они планируют отремонтировать выбоины на следующей неделе.	2
199	67	Starting a new business can be full of pitfalls.	Начало нового бизнеса может быть полно подводных камней.	2
200	67	He explained the potential pitfalls of the plan.	Он объяснил возможные подводные камни плана.	2
201	67	They navigated the pitfalls of the project successfully.	Они успешно избежали подводных камней проекта.	2
202	68	She will be away on vacation next week.	На следующей неделе она будет в отпуске.	2
203	68	He was away from home for several months.	Он был в отъезде несколько месяцев.	2
204	68	I'm sorry, but the manager is away at the moment.	Извините, но менеджер сейчас в отъезде.	2
205	69	They found a louse in the child's hair.	Они нашли вошь в волосах ребенка.	2
206	69	The louse is a common pest in schools.	Вошь - обычный вредитель в школах.	2
207	69	Lice infestations can be difficult to eliminate.	Заражения вшами могут быть трудно устранить.	2
208	70	There were tens of people waiting in line.	В очереди ожидали десятки людей.	2
209	70	He counted tens of errors in the report.	Он насчитал десятки ошибок в отчете.	2
210	70	The storm caused tens of thousands of dollars in damage.	Шторм нанес ущерб в десятки тысяч долларов.	2
211	71	She received a letter from her friend.	Она получила письмо от друга.	2
212	71	He was surprised to receive an award for his work.	Он был удивлен, получив награду за свою работу.	2
213	71	They received a warm welcome from the community.	Они получили теплый прием от общества.	2
216	72	The company has gained a strong reputation in the industry.	Компания завоевала прочную репутацию в отрасли.	2
214	72	He gained valuable experience during his internship.	Он получил ценный опыт во время стажировки.	3
215	72	She gained the respect of her colleagues.	Она заслужила уважение своих коллег.	3
218	73	He managed to acquire the necessary skills for the job.	Он сумел приобрести необходимые навыки для работы.	2
219	73	The museum acquired several valuable paintings.	Музей приобрел несколько ценных картин.	2
220	74	She derives great satisfaction from her work.	Она получает большое удовлетворение от своей работы.	2
221	74	The word derives from Latin.	Это слово происходит от латинского.	2
222	74	They derive their income from several sources.	Они получают доход из нескольких источников.	2
223	75	She suspected him of lying.	Она подозревала его во лжи.	2
224	75	The police suspect him of the crime.	Полиция подозревает его в совершении преступления.	2
225	75	He began to suspect that something was wrong.	Он начал подозревать, что что-то не так.	2
226	76	The suspect was arrested by the police.	Подозреваемый был арестован полицией.	2
227	76	They are questioning the suspect in the case.	Они допрашивают подозреваемого по делу.	2
228	76	The suspect denied any involvement in the crime.	Подозреваемый отрицал любое участие в преступлении.	2
229	77	She shared her lunch with a coworker.	Она поделилась своим обедом с коллегой.	2
230	77	He shared the news with his family.	Он поделился новостью с семьей.	2
231	77	They shared a taxi to save money.	Они разделили такси, чтобы сэкономить деньги.	2
232	78	They narrowed down the list of candidates.	Они сузили список кандидатов.	2
233	78	He narrowed down his choices to two options.	Он сузил свой выбор до двух вариантов.	2
234	78	We need to narrow down the focus of the project.	Нам нужно сузить фокус проекта.	2
235	79	The report allows you to drill down into the details.	Отчет позволяет углубиться в детали.	2
236	79	They drilled down into the data to find the root cause.	Они углубились в данные, чтобы найти основную причину.	2
237	79	We need to drill down further to understand the problem.	Нам нужно углубиться дальше, чтобы понять проблему.	2
238	80	The dog bit him on the leg.	Собака укусила его за ногу.	2
239	80	He bit into the apple with a crunch.	Он с хрустом откусил яблоко.	2
240	80	Be careful, the fish might bite.	Будьте осторожны, рыба может укусить.	2
241	81	He decided to pursue a career in medicine.	Он решил заняться карьерой в медицине.	2
242	81	She pursued her dream of becoming a writer.	Она преследовала свою мечту стать писателем.	2
243	81	The police pursued the suspect through the streets.	Полиция преследовала подозреваемого по улицам.	2
244	82	The teacher gave out the assignments for the week.	Учитель выдал задания на неделю.	2
245	82	She completed all her assignments on time.	Она выполнила все свои задания вовремя.	2
246	82	Assignments are due by the end of the month.	Задания должны быть выполнены к концу месяца.	2
247	83	He reviewed the document before signing it.	Он пересмотрел документ перед подписанием.	2
248	83	They reviewed the results of the experiment.	Они пересмотрели результаты эксперимента.	2
250	84	The company has strict procedures for handling complaints.	В компании существуют строгие процедуры для обработки жалоб.	2
251	84	He followed all the procedures carefully.	Он тщательно соблюдал все процедуры.	2
252	84	They revised the procedures to improve efficiency.	Они пересмотрели процедуры для повышения эффективности.	2
253	85	They planned several activities for the weekend.	Они запланировали несколько мероприятий на выходные.	2
254	85	The children enjoyed the outdoor activities.	Дети наслаждались активными играми на улице.	2
255	85	Her daily activities include exercise and reading.	Ее ежедневная деятельность включает в себя физические упражнения и чтение.	2
256	86	The image on the screen was blurry.	Изображение на экране было размытым.	2
257	86	He captured a beautiful image of the sunset.	Он запечатлел красивое изображение заката.	2
258	86	The image of the landscape was stunning.	Изображение пейзажа было потрясающим.	2
259	87	In some contexts, the words are synonymous.	В некоторых контекстах слова являются синонимами.	2
260	87	Success is often synonymous with hard work.	Успех часто синонимичен с тяжелым трудом.	2
261	87	These terms are not exactly synonymous.	Эти термины не совсем синонимичны.	2
262	88	She received high grades on her exams.	Она получила высокие оценки на экзаменах.	2
653	218	Mammals are warm-blooded animals.	Млекопитающие — теплокровные животные.	1
264	88	His grades improved significantly this semester.	Его оценки значительно улучшились в этом семестре.	2
265	89	The store sells various types of fruits.	Магазин продает различные виды фруктов.	2
267	89	They discussed various options for the project.	Они обсудили различные варианты проекта.	2
268	90	The invasive species spread rapidly in the ecosystem.	Инвазивный вид быстро распространился в экосистеме.	2
269	90	They performed an invasive surgery to remove the tumor.	Они провели инвазивную операцию по удалению опухоли.	2
270	90	Invasive procedures require careful consideration.	Инвазивные процедуры требуют тщательного рассмотрения.	2
271	91	He played his trump card to win the game.	Он разыграл свой козырь, чтобы выиграть игру.	3
272	91	The trump in this situation is her experience.	Козырь в этой ситуации - ее опыт.	3
273	91	They held a secret trump card in the negotiations.	У них был тайный козырь на переговорах.	3
274	92	He did well on the test.	Он хорошо справился с тестом.	2
275	92	She did well in the competition.	Она хорошо справилась на соревнованиях.	2
276	92	The team did well under pressure.	Команда хорошо справилась в условиях давления.	2
277	93	The tires are starting to wear out.	Шины начинают изнашиваться.	2
278	93	He wore his favorite jacket to the event.	Он надел свой любимый пиджак на мероприятие.	2
279	93	The shoes will wear down quickly on rough terrain.	Обувь быстро изнашивается на пересеченной местности.	3
280	94	The evidence conclusively proved his innocence.	Доказательства окончательно доказали его невиновность.	2
281	94	The study conclusively showed the benefits of the treatment.	Исследование окончательно показало преимущества лечения.	2
282	94	They conclusively settled the dispute.	Они окончательно уладили спор.	2
283	95	The rim of the wheel was bent after the accident.	Обод колеса был согнут после аварии.	2
284	95	He wiped the rim of the glass before filling it.	Он протер ободок стакана перед тем, как налить в него.	2
285	95	The basketball bounced off the rim and missed the net.	Баскетбольный мяч отскочил от обода и не попал в сетку.	2
286	96	The car was heading in the direction of the city.	Машина двигалась в направлении города.	2
287	96	She pointed in the direction of the mountains.	Она указала в направлении гор.	2
288	96	They traveled in the direction of the coast.	Они отправились в направлении побережья.	2
289	97	The prices vary within the range depending on the quality.	Цены варьируются в пределах диапазона в зависимости от качества.	2
290	97	The results vary within the range of expected outcomes.	Результаты варьируются в пределах ожидаемых.	2
291	97	The temperature can vary within the range of 5 to 10 degrees.	Температура может варьироваться в пределах от 5 до 10 градусов.	2
292	98	The countries formed a unified front against the threat.	Страны образовали единый фронт против угрозы.	2
293	98	They worked together as a unified team.	Они работали вместе как единая команда.	2
294	98	The unified efforts led to a successful outcome.	Объединенные усилия привели к успешному результату.	2
295	99	The manual contains redundant information that could be omitted.	Руководство содержит избыточную информацию, которую можно было бы опустить.	2
296	99	He removed the redundant files from the computer.	Он удалил избыточные файлы с компьютера.	2
297	99	The design was simplified to eliminate redundant features.	Дизайн был упрощен для устранения избыточных функций.	2
298	100	The system has built-in redundancy to prevent failure.	Система имеет встроенную избыточность для предотвращения сбоев.	2
299	100	Redundancy in the network ensures continuous operation.	Избыточность в сети обеспечивает непрерывную работу.	2
300	100	The redundancy of the staff led to layoffs.	Избыточность персонала привела к сокращениям.	2
301	101	The photo had a caption describing the event.	У фотографии была подпись, описывающая событие.	2
302	101	He wrote a humorous caption for the picture.	Он написал забавную подпись к фотографии.	2
303	101	The caption was missing from the diagram.	Подпись к диаграмме отсутствовала.	2
304	102	He needs time to digest the information.	Ему нужно время, чтобы переварить информацию.	2
305	102	The food was hard to digest.	Еда была трудно перевариваемой.	2
307	103	The soup was both delicious and nutritious.	Суп был вкусным и питательным.	2
308	103	They prepared a nutritious meal for the children.	Они приготовили питательную еду для детей.	2
309	103	Eating a nutritious breakfast is important for a healthy start.	Употребление питательного завтрака важно для здорового начала дня.	2
310	104	He accidentally ingested a small amount of the chemical.	Он случайно проглотил небольшое количество химического вещества.	2
311	104	The fish ingests plankton as it swims.	Рыба заглатывает планктон во время плавания.	2
312	104	Ingesting too much salt can be harmful to your health.	Проглатывание слишком большого количества соли может быть вредным для здоровья.	2
313	105	He swallowed the pill with a glass of water.	Он проглотил таблетку, запив стаканом воды.	2
314	105	She swallowed hard, trying to hold back tears.	Она с трудом проглотила слезы.	2
315	105	The child was taught to chew food thoroughly before swallowing.	Ребенка учили тщательно жевать пищу перед тем, как проглотить.	2
316	106	He gulped down his drink in one go.	Он залпом выпил свой напиток.	2
317	106	She gulped nervously before giving her speech.	Она нервно сглотнула перед тем, как начать свою речь.	2
318	106	The baby gulped the milk eagerly.	Малыш жадно глотал молоко.	2
319	107	They decided to go their separate ways after the project.	Они решили разойтись после завершения проекта.	2
320	107	He kept his work and personal life separate.	Он держал свою работу и личную жизнь отдельно.	2
321	107	The two groups operated as separate entities.	Две группы работали как отдельные организации.	2
322	108	The two species are distinct from each other.	Эти два вида отличаются друг от друга.	2
323	108	He noticed a distinct difference in their approach.	Он заметил явное различие в их подходе.	2
324	108	The sound was distinct and easily recognizable.	Звук был отчетливым и легко узнаваемым.	2
325	109	She didn't mention the incident to anyone.	Она никому не упомянула о происшествии.	2
326	109	He made a brief mention of the problem during the meeting.	Он кратко упомянул о проблеме на встрече.	2
327	109	The book includes a mention of her contributions.	Книга включает упоминание о ее вкладе.	2
328	110	Her performance was outstanding and received great praise.	Ее выступление было выдающимся и получило высокую оценку.	2
329	110	The issue remains outstanding and needs to be addressed.	Этот вопрос остается нерешенным и требует внимания.	2
330	110	He has an outstanding balance on his account.	У него есть непогашенный остаток на его счете.	2
331	111	She adjusted her plans accordingly.	Она скорректировала свои планы соответственно.	2
333	111	He acted accordingly to the instructions given.	Он действовал в соответствии с данными инструкциями.	2
334	112	The two candidates received 45% and 55% of the vote, respectively.	Два кандидата получили соответственно 45% и 55% голосов.	2
335	112	They were ranked first and second, respectively.	Они заняли соответственно первое и второе места.	2
336	112	The prices for the small, medium, and large sizes are $5, $10, and $15, respectively.	Цены на маленький, средний и большой размеры составляют соответственно 5, 10 и 15 долларов.	2
337	113	She finally came to terms with her loss.	Она наконец смирилась со своей утратой.	2
338	113	He is struggling to come to terms with the new reality.	Он изо всех сил пытается смириться с новой реальностью.	2
339	113	They came to terms with the changes in their lives.	Они смирились с изменениями в своей жизни.	2
340	114	A prerequisite for the course is basic knowledge of mathematics.	Предпосылкой для курса является базовое знание математики.	2
341	114	The prerequisite for success is hard work.	Предпосылкой успеха является тяжелая работа.	2
342	114	Completion of this task is a prerequisite for the next phase.	Выполнение этой задачи является предпосылкой для следующего этапа.	2
343	115	He accidentally deleted the file.	Он случайно удалил файл.	2
344	115	She accidentally spilled her drink on the carpet.	Она случайно пролила свой напиток на ковер.	2
345	115	The door was accidentally left unlocked.	Дверь случайно осталась незапертой.	2
346	116	They need to elaborate on their proposal.	Им нужно разработать свое предложение.	3
347	116	She elaborated on the plan during the meeting.	Она подробно рассказала о плане на встрече.	3
352	118	The book's provocative content aroused much controversy.	Провокационное содержание книги вызвало много споров.	1
353	118	He tried to arouse her interest in the project.	Он попытался вызвать у нее интерес к проекту.	1
354	118	The speech aroused strong emotions among the audience.	Речь вызвала сильные эмоции у аудитории.	1
355	119	The city is laid out in a grid pattern.	Город спланирован по сетке.	1
356	119	He used a grid to align the design elements.	Он использовал сетку для выравнивания элементов дизайна.	1
357	119	The power grid covers a large area.	Электросеть охватывает большую территорию.	1
358	120	The vertex of the triangle is at the top.	Вершина треугольника находится вверху.	1
359	120	The graph shows the vertex as the highest point.	График показывает вершину как самую высокую точку.	1
360	120	He calculated the coordinates of the vertex.	Он вычислил координаты вершины.	1
361	121	The apex of the mountain is covered in snow.	Вершина горы покрыта снегом.	1
362	121	The apex of the roof is the highest point.	Вершина крыши - это самая высокая точка.	1
363	121	He reached the apex of his career.	Он достиг вершины своей карьеры.	1
364	122	The paint is chipped along the edges of the frame.	Краска сколота по краям рамы.	1
365	122	He added a border along the edges of the document.	Он добавил границу по краям документа.	1
366	122	The fabric was frayed along the edges.	Ткань была потерта по краям.	1
367	123	The developer focused on testing edge cases.	Разработчик сосредоточился на тестировании краевых случаев.	1
368	123	Edge cases are often the hardest to predict.	Краевые случаи часто трудно предсказать.	1
369	123	They created a special plan for handling edge cases.	Они создали специальный план для обработки краевых случаев.	1
370	124	The graph was determined to be acyclic.	Граф был определен как ациклический.	1
371	124	Acyclic compounds are important in chemistry.	Ациклические соединения важны в химии.	1
372	124	The process follows an acyclic path.	Процесс идет по ациклическому пути.	1
373	125	The lawyer will represent the client in court.	Адвокат будет представлять клиента в суде.	1
374	125	The flag represents the country's values.	Флаг представляет ценности страны.	1
375	125	She was chosen to represent the team at the conference.	Ее выбрали представлять команду на конференции.	1
376	126	The adjacency of the two buildings allows for easy access.	Смежность двух зданий обеспечивает легкий доступ.	1
377	126	Adjacency in the data structure simplifies the search process.	Смежность в структуре данных упрощает процесс поиска.	1
378	126	They studied the adjacency matrix in the graph.	Они изучали матрицу смежности в графе.	1
379	127	The horse neighed loudly in the stable.	Лошадь громко заржала в стойле.	1
380	127	He could hear the horses neighing in the distance.	Он слышал, как лошади ржут вдали.	1
381	127	The neighing of the horses signaled their excitement.	Ржание лошадей свидетельствовало об их возбуждении.	1
382	128	She had a deep insight into the problem.	У нее было глубокое понимание проблемы.	1
383	128	His insight helped us make the right decision.	Его понимание помогло нам принять правильное решение.	1
384	128	The book offers valuable insights into human behavior.	Книга предлагает ценные инсайты о человеческом поведении.	1
385	129	Factories that pollute the river must be fined.	Заводы, которые загрязняют реку, должны быть оштрафованы.	1
386	129	Car exhausts pollute the air we breathe.	Выхлопные газы автомобилей загрязняют воздух, которым мы дышим.	1
387	129	The company was accused of polluting the environment.	Компания была обвинена в загрязнении окружающей среды.	1
388	130	This is a well-established company with a long history.	Это хорошо устоявшаяся компания с долгой историей.	1
389	130	His methods are well-established and widely used.	Его методы хорошо установлены и широко используются.	1
390	130	The rules are well-established and must be followed.	Правила хорошо установлены и должны соблюдаться.	1
391	131	The dictator was seen as a puppet of foreign powers.	Диктатора считали марионеткой иностранных сил.	1
788	263	He admired the solidity of her arguments.	Он восхищался твердостью её аргументов.	1
349	117	He wore a badge with his name on it.	Он носил значок с его именем.	2
350	117	The conference attendees were given badges at registration.	Участникам конференции выдали значки при регистрации.	2
351	117	She earned a badge for her volunteer work.	Она получила значок за свою волонтерскую работу.	2
392	131	Children enjoyed the puppet show at the fair.	Детям понравился кукольный спектакль на ярмарке.	1
393	131	He felt like a puppet, controlled by others.	Он чувствовал себя марионеткой, управляемой другими.	1
394	132	The tailor used a dummy to display the new dress.	Портной использовал манекен для демонстрации нового платья.	1
395	132	The baby sucked on a dummy to fall asleep.	Младенец сосал пустышку, чтобы уснуть.	1
396	132	They used a dummy to simulate the crash.	Они использовали манекен для имитации аварии.	1
397	133	The store is conveniently located near my house.	Магазин удобно расположен рядом с моим домом.	1
398	133	She conveniently forgot to mention the extra fees.	Она удобно забыла упомянуть дополнительные сборы.	1
399	133	The documents were conveniently stored online.	Документы были удобно сохранены онлайн.	1
400	134	If you subtract two from five, you get three.	Если вычесть два из пяти, получится три.	1
401	134	He subtracted the expenses from his total income.	Он вычел расходы из своего общего дохода.	1
402	134	To find the answer, subtract the smaller number from the larger one.	Чтобы найти ответ, вычтите меньшее число из большего.	1
403	135	The division of the company into two separate entities was announced.	Объявлено о разделении компании на два отдельных подразделения.	1
404	135	There was a clear division of responsibilities among the team members.	Было четкое разделение обязанностей среди членов команды.	1
405	135	She struggled with division in math class.	Ей было трудно с делением на уроке математики.	1
406	136	Three is an odd number.	Три — это нечетное число.	1
407	136	He had an odd habit of collecting buttons.	У него была странная привычка собирать пуговицы.	1
408	136	The building's architecture is quite odd.	Архитектура здания довольно странная.	1
409	137	Four is an even number.	Четыре — это четное число.	1
410	137	They decided to divide the money into even shares.	Они решили разделить деньги на равные доли.	1
411	137	The ground was even, making it easy to walk on.	Земля была ровной, что облегчало ходьбу.	1
412	138	The Earth rotates on its axis.	Земля вращается вокруг своей оси.	1
413	138	The graph has a horizontal and a vertical axis.	График имеет горизонтальную и вертикальную оси.	1
414	138	The tilt of the Earth's axis causes the seasons.	Наклон оси Земли вызывает смену времен года.	1
415	139	She has a multifaceted personality with many interests.	У нее многогранная личность с множеством интересов.	1
416	139	The problem is multifaceted and requires a complex solution.	Проблема многогранна и требует комплексного решения.	1
417	139	The artist's work is known for its multifaceted themes.	Работы художника известны своими многогранными темами.	1
418	140	We made an assumption based on the available data.	Мы сделали предположение на основе имеющихся данных.	1
419	140	His assumption proved to be correct.	Его предположение оказалось верным.	1
420	140	The plan was based on the assumption that the weather would be good.	План был основан на предположении, что погода будет хорошей.	1
421	141	She decided to weigh herself after the holidays.	Она решила взвеситься после праздников.	1
422	141	He weighed the pros and cons before making a decision.	Он взвесил все за и против, прежде чем принять решение.	1
423	141	The box was too heavy to weigh without a scale.	Коробка была слишком тяжелой, чтобы взвесить ее без весов.	1
424	142	The bridge spans the river from one side to the other.	Мост охватывает реку с одного берега на другой.	1
425	142	Her career spans several decades.	Ее карьера охватывает несколько десятилетий.	1
426	142	The book spans a wide range of topics.	Книга охватывает широкий спектр тем.	1
427	143	The Earth's resources are finite.	Ресурсы Земли конечны.	1
428	143	There is only a finite amount of time to complete the project.	На выполнение проекта отведено только ограниченное количество времени.	1
429	143	Mathematicians study both finite and infinite sets.	Математики изучают как конечные, так и бесконечные множества.	1
430	144	The team won three consecutive games.	Команда выиграла три последовательные игры.	1
431	144	She has worked for five consecutive days without a break.	Она проработала пять дней подряд без перерыва.	1
432	144	The numbers 1, 1, and 3 are consecutive integers.	Числа 1, 1 и 3 являются последовательными целыми числами.	1
433	145	He took the book out of his bag.	Он вынул книгу из сумки.	1
434	145	She ran out of time before finishing the test.	Она не успела закончить тест.	1
435	145	The cat jumped out of the window.	Кот выпрыгнул из окна.	1
436	146	The city is often referred to as the Big Apple.	Город часто называют Большим Яблоком.	1
437	146	This phenomenon is often referred to as global warming.	Это явление часто называют глобальным потеплением.	1
438	146	He is often referred to as a genius.	Его часто называют гением.	1
439	147	She likes to stretch in the morning.	Она любит потягиваться по утрам.	1
440	147	The fabric can stretch without tearing.	Ткань может растягиваться, не разрываясь.	1
441	147	The desert stretches for miles.	Пустыня простирается на многие мили.	1
442	148	The ratio of teachers to students is 1:10.	Соотношение учителей и учеников составляет 1:10.	1
443	148	They calculated the ratio of income to expenses.	Они рассчитали соотношение доходов и расходов.	1
444	148	The gear ratio determines the speed of the bike.	Передаточное число определяет скорость велосипеда.	1
445	149	He has no notion of what it's like to be poor.	У него нет понятия, что значит быть бедным.	1
446	149	The notion of freedom is central to their philosophy.	Понятие свободы является основополагающим в их философии.	1
447	149	The novel explores the notion of identity.	Роман исследует понятие идентичности.	1
448	150	The circumference of the circle is calculated using the formula 1πr.	Окружность круга рассчитывается по формуле 1πr.	1
449	150	They measured the circumference of the tree.	Они измерили окружность дерева.	1
450	150	The Earth’s circumference is about 40,075 kilometers.	Окружность Земли составляет около 40 075 километров.	1
451	151	Mathematical notation can be difficult to understand.	Математические обозначения могут быть сложными для понимания.	1
452	151	The notation on the sheet music was clear.	Обозначения на нотной записи были четкими.	1
453	151	Scientific notation is used to express very large or small numbers.	Научная нотация используется для выражения очень больших или малых чисел.	1
454	152	The substructure of the building was reinforced with steel.	Подструктура здания была усилена сталью.	1
455	152	The substructure supports the entire building.	Подструктура поддерживает все здание.	1
456	152	Engineers are examining the substructure for any signs of damage.	Инженеры осматривают подструктуру на предмет повреждений.	1
457	153	She arrived just before the meeting started.	Она прибыла прямо перед началом собрания.	1
458	153	He left just before the storm hit.	Он ушел прямо перед началом шторма.	1
459	153	The sun set just before they reached the campsite.	Солнце село прямо перед тем, как они добрались до лагеря.	1
460	154	The math test included problems on subtraction.	В математическом тесте были задачи на вычитание.	1
461	154	Subtraction is one of the basic operations in arithmetic.	Вычитание — одна из основных операций в арифметике.	1
462	154	She quickly solved the subtraction problem in her head.	Она быстро решила задачу на вычитание в уме.	1
463	155	He learned multiplication tables in elementary school.	Он выучил таблицу умножения в начальной школе.	1
464	155	The multiplication of cells is essential for growth.	Умножение клеток необходимо для роста.	1
465	155	Multiplication is used to calculate the area of a rectangle.	Умножение используется для расчета площади прямоугольника.	1
466	156	The mirror has a concave surface.	Зеркало имеет вогнутую поверхность.	1
467	156	A concave lens is used in certain types of glasses.	Вогнутая линза используется в некоторых типах очков.	1
468	156	The bowl’s concave shape made it perfect for holding soup.	Вогнутая форма миски идеально подходила для супа.	1
469	157	The convex shape of the shield helped deflect arrows.	Выпуклая форма щита помогала отклонять стрелы.	1
470	157	Convex mirrors are often used in vehicles for a wider field of view.	Выпуклые зеркала часто используются в автомобилях для расширения поля зрения.	1
471	157	The sculpture had a convex surface that caught the light beautifully.	Скульптура имела выпуклую поверхность, которая красиво ловила свет.	1
472	158	He tilted his head to listen more closely.	Он наклонил голову, чтобы лучше слышать.	1
473	158	The painting was slightly tilted to one side.	Картина была слегка наклонена на одну сторону.	1
474	158	She tilted the glass to pour the wine.	Она наклонила бокал, чтобы налить вино.	1
475	159	The results of the study were skewed by the small sample size.	Результаты исследования были искажены из-за небольшого размера выборки.	1
476	159	His perspective on the issue was skewed by personal bias.	Его точка зрения на проблему была искажена личными предубеждениями.	1
477	159	The data was skewed due to an error in calculation.	Данные были искажены из-за ошибки в расчете.	1
478	160	The photographer skewed the image to create an artistic effect.	Фотограф исказил изображение, чтобы создать художественный эффект.	1
479	160	The statistics were skewed to make the results look better.	Статистика была искажена, чтобы результаты выглядели лучше.	1
480	160	The company's report skewed the facts in their favor.	Отчет компании исказил факты в их пользу.	1
481	161	People tend to think that their way is the best.	Люди склонны думать, что их путь самый лучший.	1
482	161	She tends to arrive early for meetings.	Она склонна приходить на встречи заранее.	1
483	161	Children tend to imitate their parents' behavior.	Дети склонны подражать поведению своих родителей.	1
484	162	The company values inclusiveness and diversity in the workplace.	Компания ценит инклюзивность и разнообразие на рабочем месте.	1
485	162	Inclusiveness is key to building a strong community.	Инклюзивность — ключ к созданию сильного сообщества.	1
486	162	The policy promotes inclusiveness and equal opportunities for all.	Политика способствует инклюзивности и равным возможностям для всех.	1
487	163	He made a lame excuse for being late.	Он придумал жалкую отговорку, почему опоздал.	1
488	163	The horse went lame after the race.	Лошадь захромала после скачек.	1
489	163	His joke was pretty lame and no one laughed.	Его шутка была довольно жалкой, и никто не смеялся.	1
490	164	He cracked his knuckles before starting the game.	Он хрустнул костяшками пальцев перед началом игры.	1
491	164	She grazed her knuckles when she fell.	Она содрала костяшки, когда упала.	1
492	164	The boxer hit him square on the knuckles.	Боксер ударил его прямо по костяшкам.	1
493	165	The conversation took a pivot when they discussed the new policy.	Разговор изменился, когда они обсудили новую политику.	1
494	165	The company's strategy pivoted towards digital transformation.	Стратегия компании сместилась в сторону цифровой трансформации.	1
495	165	A pivot joint allows the head to turn from side to side.	Поворотный сустав позволяет голове поворачиваться из стороны в сторону.	1
496	166	He lubed the gears to make them run smoothly.	Он смазал шестерни, чтобы они работали плавно.	1
497	166	It's important to lube your bike chain regularly.	Важно регулярно смазывать цепь велосипеда.	1
498	166	She lubed the door hinges to stop them from squeaking.	Она смазала дверные петли, чтобы они не скрипели.	1
499	167	The mechanic applied lube to the engine parts.	Механик нанёс смазку на детали двигателя.	1
500	167	He used lube to fix the squeaky door.	Он использовал смазку, чтобы исправить скрипящую дверь.	1
501	167	This type of lube is designed for high-performance engines.	Этот тип смазки предназначен для высокопроизводительных двигателей.	1
502	168	They brought a lot of booze to the party.	Они принесли много выпивки на вечеринку.	1
503	168	He decided to quit booze after the new year.	Он решил завязать с выпивкой после Нового года.	1
504	168	Too much booze can lead to serious health problems.	Слишком много выпивки может привести к серьезным проблемам со здоровьем.	1
505	169	He asked for clarification on the point she made.	Он попросил разъяснений по поводу её высказывания.	1
506	169	The teacher provided clarification on the confusing topic.	Учитель дал разъяснения по запутанной теме.	1
507	169	Clarification was needed before they could proceed.	Требовалось разъяснение, прежде чем они могли продолжить.	1
508	170	He took immediate action when he saw the danger.	Он принял немедленные меры, когда увидел опасность.	1
509	170	The response was immediate and effective.	Ответ был немедленным и эффективным.	1
510	170	They needed an immediate solution to the problem.	Им нужно было немедленно решить проблему.	1
511	171	She felt an instant connection with him.	Она сразу почувствовала связь с ним.	1
512	171	Instant coffee is convenient but doesn't taste as good as brewed coffee.	Растворимый кофе удобен, но не такой вкусный, как сваренный кофе.	1
513	171	The news spread in an instant through social media.	Новость мгновенно распространилась через социальные сети.	1
514	172	The teacher asked the students to round the numbers to the nearest ten.	Учитель попросил учеников округлить числа до ближайшего десятка.	1
515	172	They took a round table for their discussion.	Они выбрали круглый стол для обсуждения.	1
516	172	The number 4.6 is rounded to 5.	Число 4,6 округляется до 5.	1
517	173	Her perseverance paid off when she finally got the job.	Её настойчивость окупилась, когда она наконец получила работу.	1
518	173	It takes perseverance to complete such a difficult task.	Для выполнения такой сложной задачи требуется настойчивость.	1
519	173	Despite many challenges, his perseverance never wavered.	Несмотря на многочисленные трудности, его настойчивость не ослабла.	1
520	174	She decided to stick to her original plan.	Она решила придерживаться своего первоначального плана.	1
521	174	They stuck to their promise and completed the project on time.	Они сдержали своё обещание и завершили проект вовремя.	1
522	174	He stuck to his decision despite the criticism.	Он придерживался своего решения, несмотря на критику.	1
523	175	The company must adhere to safety regulations.	Компания должна соблюдать правила безопасности.	1
524	175	She adhered to the diet strictly.	Она строго придерживалась диеты.	1
525	175	We need to adhere to the guidelines provided.	Нам нужно следовать предоставленным рекомендациям.	1
526	176	In a nutshell, the project was a success.	В двух словах, проект был успешным.	1
527	176	He explained the plan in a nutshell.	Он объяснил план в двух словах.	1
528	176	The book summarizes the theory in a nutshell.	Книга кратко излагает теорию.	1
529	177	The sclera is the white part of the eye.	Склера — это белая часть глаза.	1
530	177	Inflammation of the sclera can cause severe eye pain.	Воспаление склеры может вызвать сильную боль в глазах.	1
531	177	She noticed a slight redness in the sclera of her eye.	Она заметила небольшое покраснение склеры глаза.	1
532	178	The meat was so tender it practically melted in your mouth.	Мясо было настолько нежным, что буквально таяло во рту.	1
533	178	She gave him a tender kiss on the cheek.	Она нежно поцеловала его в щеку.	1
534	178	His voice was tender and soothing.	Его голос был нежным и успокаивающим.	1
535	179	He brewed a pot of strong coffee.	Он сварил крепкий кофе.	1
536	179	They brew their own beer at home.	Они варят собственное пиво дома.	1
537	179	The tea was brewed to perfection.	Чай был заварен до совершенства.	1
538	180	They brought a lot of booze to the party.	Они принесли много выпивки на вечеринку.	1
539	180	He decided to quit booze after the new year.	Он решил завязать с выпивкой после Нового года.	1
540	180	Too much booze can lead to serious health problems.	Слишком много выпивки может привести к серьезным проблемам со здоровьем.	1
541	181	They served a variety of beverages at the party.	На вечеринке подали различные напитки.	1
542	181	Water is the healthiest beverage you can drink.	Вода — самый полезный напиток, который можно пить.	1
543	181	The menu includes both alcoholic and non-alcoholic beverages.	Меню включает как алкогольные, так и безалкогольные напитки.	1
544	182	She found her niche in the tech industry.	Она нашла свою нишу в технологической индустрии.	1
545	182	The company specializes in a small niche market.	Компания специализируется на небольшом нишевом рынке.	1
546	182	He carved out a niche for himself as an expert in AI.	Он вырезал для себя нишу как эксперт по ИИ.	1
547	183	She lived in a dorm during her first year of college.	Она жила в общежитии в первый год обучения в колледже.	1
548	183	The dorm was crowded but lively.	Общежитие было многолюдным, но оживленным.	1
549	183	They decorated their dorm room with posters and fairy lights.	Они украсили свою комнату в общежитии постерами и гирляндами.	1
550	184	The weather was delightful for a picnic.	Погода была восхитительной для пикника.	1
551	184	She has a delightful sense of humor.	У нее восхитительное чувство юмора.	1
552	184	The children had a delightful time at the zoo.	Дети восхитительно провели время в зоопарке.	1
553	185	The situation worsened after the announcement.	Ситуация ухудшилась после объявления.	1
554	185	His health began to worsen rapidly.	Его здоровье начало быстро ухудшаться.	1
555	185	The weather is expected to worsen over the weekend.	Ожидается, что погода ухудшится к выходным.	1
556	186	Appearances can be deceptive.	Внешность может быть обманчивой.	1
557	186	The advertisement was found to be deceptive.	Реклама была признана обманчивой.	1
558	186	His calm demeanor was deceptive.	Его спокойное поведение было обманчивым.	1
559	187	Her perception of the situation was different from mine.	Ее восприятие ситуации отличалось от моего.	1
560	187	The drug alters the perception of reality.	Препарат изменяет восприятие реальности.	1
561	187	Perception is key to understanding art.	Восприятие является ключом к пониманию искусства.	1
562	188	She perceived a change in his attitude.	Она заметила изменение в его отношении.	1
563	188	The way we perceive the world shapes our reality.	То, как мы воспринимаем мир, формирует нашу реальность.	1
564	188	He was perceived as a threat by his colleagues.	Его коллеги восприняли его как угрозу.	1
565	189	He downloaded the software as a tarball.	Он скачал программное обеспечение в виде архива.	1
566	189	The tarball contains all the necessary files.	Архив содержит все необходимые файлы.	1
567	189	Extract the tarball before running the installation.	Извлеките архив перед установкой.	1
568	190	She wore a plain dress to the event.	Она надела простое платье на мероприятие.	1
569	190	The food was plain but satisfying.	Еда была простой, но сытной.	1
570	190	He prefers plain water over soda.	Он предпочитает простую воду газировке.	1
571	191	He quickly grasped the basic concepts of physics.	Он быстро усвоил основные концепции физики.	1
572	191	It took her a moment to grasp what was happening.	Ей потребовалось время, чтобы осознать, что происходит.	1
573	191	The importance of the issue was not fully grasped.	Важность проблемы не была полностью осознана.	1
574	192	The abandoned house had a creepy atmosphere.	Заброшенный дом имел жуткую атмосферу.	1
575	192	He told a creepy story that gave everyone chills.	Он рассказал жуткую историю, которая всех взбудоражила.	1
576	192	The creepy sound of footsteps in the dark made her nervous.	Жуткий звук шагов в темноте заставил ее нервничать.	1
577	193	The ancient relic was displayed in the museum.	Древняя реликвия была выставлена в музее.	1
578	193	They found a relic from the Roman Empire.	Они нашли реликвию Римской империи.	1
579	193	The church is home to several sacred relics.	Церковь хранит несколько священных реликвий.	1
580	194	The necklace is a family heirloom passed down through generations.	Ожерелье — это семейная реликвия, передаваемая из поколения в поколение.	1
581	194	He treasured the heirloom left to him by his grandmother.	Он ценил реликвию, оставленную ему бабушкой.	1
582	194	The clock is a priceless heirloom.	Часы — бесценная семейная реликвия.	1
583	195	She received a large inheritance from her uncle.	Она получила большое наследство от дяди.	1
584	195	The inheritance was divided among the siblings.	Наследство было разделено между братьями и сестрами.	1
585	195	They quarreled over the inheritance for years.	Они много лет ссорились из-за наследства.	1
586	196	The property was sold at auction.	Имущество было продано на аукционе.	1
587	196	He owns several properties in the city.	Ему принадлежит несколько объектов недвижимости в городе.	1
588	196	The property includes a large garden.	Имущество включает в себя большой сад.	1
589	197	He made a fortune in the stock market.	Он сколотил состояние на фондовом рынке.	1
590	197	She inherited a fortune from her grandfather.	Она унаследовала состояние от своего деда.	1
591	197	The company is worth a fortune.	Компания стоит целое состояние.	1
592	198	He is the heir to the throne.	Он является наследником трона.	1
593	198	The prince is the king's only heir.	Принц — единственный наследник короля.	1
594	198	She was named the sole heir in the will.	Она была названа единственным наследником в завещании.	1
595	199	He was chosen as the successor to the CEO.	Он был выбран преемником генерального директора.	1
596	199	The successor continued the policies of his predecessor.	Преемник продолжил политику своего предшественника.	1
597	199	They debated who would be the best successor to lead the company.	Они обсуждали, кто будет лучшим преемником для руководства компанией.	1
598	200	The mediator helped resolve the conflict between the two parties.	Посредник помог разрешить конфликт между двумя сторонами.	1
599	200	They brought in a mediator to assist with the negotiations.	Они привлекли посредника для помощи в переговорах.	1
600	200	The mediator's role is to facilitate communication.	Роль посредника заключается в содействии общению.	1
601	201	He acted as an intermediary between the buyer and the seller.	Он выступал в качестве посредника между покупателем и продавцом.	1
602	201	The company used an intermediary to make the deal.	Компания использовала посредника для заключения сделки.	1
603	201	An intermediary was needed to ensure both sides were satisfied.	Требовался посредник, чтобы обе стороны остались довольны.	1
604	202	The law prohibits smoking in public places.	Закон запрещает курение в общественных местах.	1
605	202	They were prohibited from entering the restricted area.	Им было запрещено входить в закрытую зону.	1
606	202	The school prohibits the use of mobile phones during class.	Школа запрещает использование мобильных телефонов во время занятий.	1
607	203	She decided to alter the design of her dress.	Она решила изменить дизайн своего платья.	1
608	203	The plan was altered to accommodate the new requirements.	План был изменен, чтобы учесть новые требования.	1
609	203	They had to alter the schedule due to the weather.	Им пришлось изменить расписание из-за погоды.	1
610	204	He was accused of tampering with the evidence.	Его обвинили в фальсификации улик.	1
611	204	The lock showed signs of tampering.	На замке были видны следы взлома.	1
612	204	Tampering with the system is strictly prohibited.	Вмешательство в систему строго запрещено.	1
613	205	The contract was amended to include the new clause.	В контракт были внесены изменения, чтобы включить новый пункт.	1
614	205	They plan to amend the constitution.	Они планируют внести поправки в конституцию.	1
615	205	The proposal was amended before the final vote.	Предложение было изменено перед окончательным голосованием.	1
616	206	The building was originally a warehouse.	Первоначально здание было складом.	1
617	206	She was originally from a small town in the mountains.	Она родом из маленького городка в горах.	1
618	206	The idea originally came from a suggestion by a customer.	Идея первоначально возникла в результате предложения клиента.	1
619	207	The farm has a large amount of livestock, including cows and sheep.	На ферме много домашнего скота, в том числе коровы и овцы.	1
620	207	They raised livestock for meat and milk.	Они разводили скот для мяса и молока.	1
621	207	The livestock was kept in a secure area to protect them from predators.	Скот содержался в безопасной зоне, чтобы защитить его от хищников.	1
622	208	The feral cat avoided all contact with humans.	Дикая кошка избегала любого контакта с людьми.	1
623	208	They found a feral dog living in the woods.	Они нашли дикого пса, живущего в лесу.	1
624	208	The island is home to a population of feral goats.	Остров является домом для популяции диких коз.	1
625	209	She remained calm in the face of danger.	Она оставалась спокойной перед лицом опасности.	1
626	209	They showed great courage in the face of adversity.	Они проявили большое мужество перед лицом невзгод.	1
627	209	In the face of criticism, he stood by his decision.	Перед лицом критики он отстаивал свое решение.	1
628	210	The adulation he received from fans was overwhelming.	Лесть, которую он получал от поклонников, была ошеломляющей.	1
629	210	She was uncomfortable with the adulation from her peers.	Ей было неловко из-за лести со стороны коллег.	1
630	210	Adulation can sometimes blind people to reality.	Лесть иногда может ослепить людей.	1
631	211	She was asked to present her findings to the board.	Её попросили представить свои выводы совету директоров.	1
632	211	He will present the award at the ceremony.	Он вручит награду на церемонии.	1
633	211	The report was presented to the committee for review.	Отчёт был представлен на рассмотрение комитету.	1
634	212	They found a stray dog near the park.	Они нашли бездомную собаку возле парка.	1
635	212	The stray cat was adopted by a kind family.	Бездомного кота приютила добрая семья.	1
636	212	He often fed the stray animals in his neighborhood.	Он часто кормил бездомных животных в своем районе.	1
637	213	The German Shepherd is a popular breed of dog.	Немецкая овчарка — популярная порода собак.	1
638	213	They specialize in breeding rare bird species.	Они специализируются на разведении редких видов птиц.	1
639	213	The breed is known for its intelligence and loyalty.	Эта порода известна своим умом и преданностью.	1
640	214	He made a pointed remark during the discussion.	Он сделал колкое замечание во время обсуждения.	1
641	214	The mountain has a pointed peak.	У горы заостренная вершина.	1
642	214	She wore pointed shoes to the party.	На вечеринку она надела заостренные туфли.	1
643	215	The nurse will inject the vaccine into your arm.	Медсестра введет вакцину в вашу руку.	1
644	215	They injected funds into the failing business.	Они вложили средства в убыточный бизнес.	1
645	215	He injects humor into his speeches.	Он привносит юмор в свои выступления.	1
646	216	The otter swam quickly through the river.	Выдра быстро плавала по реке.	1
647	216	They watched the otters playing on the riverbank.	Они наблюдали, как выдры играют на берегу реки.	1
648	216	Otters are known for their playful behavior.	Выдры известны своим игривым поведением.	1
649	217	Lions are carnivorous animals.	Львы — плотоядные животные.	1
650	217	The carnivorous plants trapped insects for food.	Плотоядные растения ловили насекомых для пропитания.	1
651	217	Some dinosaurs were carnivorous and hunted other animals.	Некоторые динозавры были плотоядными и охотились на других животных.	1
654	218	She studied the behavior of mammals in the wild.	Она изучала поведение млекопитающих в дикой природе.	1
655	219	His idea was so ridiculous that no one took it seriously.	Его идея была настолько нелепой, что никто не воспринял её всерьёз.	1
656	219	The price of the dress was ridiculously high.	Цена на платье была нелепо высокой.	1
657	219	It's ridiculous to expect a child to understand that concept.	Нелепо ожидать, что ребенок поймет эту концепцию.	1
658	220	He had a manic energy that kept him working for hours.	У него была маниакальная энергия, которая заставляла его работать часами.	1
659	220	The manic pace of the city was overwhelming.	Маниакальный ритм города был подавляющим.	1
660	220	She went on a manic cleaning spree before the guests arrived.	Она устроила маниакальную уборку перед приездом гостей.	1
661	221	The cat's whiskers twitched as it watched the mouse.	Усы кота подергивались, когда он наблюдал за мышью.	1
662	221	He had a few gray whiskers on his chin.	У него было несколько седых усов на подбородке.	1
663	221	The rabbit's long whiskers helped it sense its surroundings.	Длинные усы кролика помогали ему ощущать окружающую среду.	1
664	222	She imagined herself on a tropical beach.	Она представляла себя на тропическом пляже.	1
665	222	Can you imagine a world without war?	Можете ли вы представить себе мир без войны?	1
666	222	He couldn't imagine living anywhere else.	Он не мог представить себе жизнь в другом месте.	1
667	223	There was a sense of agitation in the crowd.	В толпе чувствовалось возбуждение.	1
668	223	Her hands shook with agitation.	Ее руки дрожали от волнения.	1
669	223	The news caused widespread agitation.	Новость вызвала широкое волнение.	1
670	224	The smell of freshly baked bread tempted her.	Запах свежевыпеченного хлеба искушал её.	1
671	224	He was tempted to skip class and go to the beach.	Его искушало пропустить занятие и пойти на пляж.	1
672	224	The offer was tempting, but she decided to decline.	Предложение было заманчивым, но она решила отказаться.	1
673	225	He tried to seduce her with promises of wealth and luxury.	Он пытался соблазнить её обещаниями богатства и роскоши.	1
674	225	The ad seduced customers with the promise of high-quality products.	Реклама соблазняла клиентов обещанием качественной продукции.	1
675	225	She seduced him with her charm and intelligence.	Она соблазнила его своим обаянием и умом.	1
676	226	He began to sweat as the temperature rose.	Он начал потеть, когда температура поднялась.	1
677	226	The intense workout made her sweat heavily.	Интенсивная тренировка заставила её сильно потеть.	1
678	226	He wiped the sweat from his forehead.	Он вытер пот со лба.	1
679	227	He looked dashing in his new suit.	Он выглядел лихо в своем новом костюме.	1
680	227	The dashing hero saved the day.	Лихой герой спас день.	1
681	227	She was swept off her feet by his dashing charm.	Её покорило его лихое обаяние.	1
682	228	The comedian made a clever pun that had everyone laughing.	Комик придумал остроумный каламбур, который всех рассмешил.	1
683	228	He enjoys making puns during conversations.	Он любит придумывать каламбуры во время разговоров.	1
684	228	The pun was a play on words.	Каламбур был игрой слов.	1
685	229	She became accustomed to the noise of the city.	Она привыкла к городскому шуму.	1
686	229	He is accustomed to waking up early.	Он привык вставать рано.	1
687	229	They quickly became accustomed to the new routine.	Они быстро привыкли к новому распорядку.	1
688	230	They prayed for peace and prosperity.	Они молились о мире и процветании.	1
689	230	She prayed every night before going to bed.	Она молилась каждый вечер перед сном.	1
690	230	He prayed for the safety of his family.	Он молился за безопасность своей семьи.	1
691	231	The teacher used games as a form of stimulation for the students.	Учитель использовал игры как способ стимуляции учеников.	1
692	231	The stimulation of the economy is crucial for growth.	Стимуляция экономики имеет решающее значение для роста.	1
693	231	Bright colors and patterns provide visual stimulation.	Яркие цвета и узоры обеспечивают визуальную стимуляцию.	1
694	232	The doctor examined her retina for signs of damage.	Врач осмотрел её сетчатку на предмет повреждений.	1
695	232	Light enters the eye and is focused on the retina.	Свет проникает в глаз и фокусируется на сетчатке.	1
696	232	The retina plays a crucial role in vision.	Сетчатка играет важную роль в зрении.	1
697	233	Peripheral devices include keyboards, mice, and printers.	К периферийным устройствам относятся клавиатуры, мыши и принтеры.	1
698	233	He only had a peripheral involvement in the project.	Он принимал только периферийное участие в проекте.	1
699	233	The company's focus shifted to peripheral markets.	Компания сосредоточила внимание на периферийных рынках.	1
700	234	They converted the garage into a guest room.	Они преобразовали гараж в гостевую комнату.	1
701	234	He converted to a different religion.	Он принял другую религию.	1
702	234	The software can convert text files into PDFs.	Программное обеспечение может преобразовывать текстовые файлы в PDF.	1
703	235	She focused on her inner thoughts during meditation.	Во время медитации она сосредоточилась на своих внутренних мыслях.	1
704	235	The inner circle of the organization made the decisions.	Внутренний круг организации принимал решения.	1
705	235	The inner workings of the machine were complex.	Внутреннее устройство машины было сложным.	1
706	236	The vitreous humor fills the space between the lens and the retina.	Стекловидное тело заполняет пространство между хрусталиком и сетчаткой.	1
707	236	Vitreous opacities can affect vision.	Помутнения в стекловидном теле могут повлиять на зрение.	1
708	236	The vitreous material is clear and transparent.	Стекловидный материал прозрачен.	1
709	237	She traced her ancestry back to the 17th century.	Она проследила свою родословную до 17 века.	1
710	237	His ancestry is a mix of different cultures.	Его родословная — это смесь разных культур.	1
711	237	They take pride in their rich ancestry.	Они гордятся своей богатой родословной.	1
712	238	The sweater will shrink if you wash it in hot water.	Свитер сожмется, если постирать его в горячей воде.	1
713	238	The market for these products is shrinking.	Рынок этих продуктов сжимается.	1
714	238	He noticed that his savings were slowly shrinking.	Он заметил, что его сбережения постепенно уменьшаются.	1
715	239	The heat was barely tolerable in the afternoon.	Жара была едва терпимой днем.	1
716	239	The pain was tolerable with the medication.	Боль была терпимой благодаря лекарствам.	1
717	239	His behavior was rude, but tolerable.	Его поведение было грубым, но терпимым.	1
718	240	The phone can be switched to silent mode.	Телефон можно переключить в беззвучный режим.	1
719	240	He operates in a different mode under pressure.	Под давлением он работает в другом режиме.	1
720	240	The game has a multiplayer mode.	В игре есть многопользовательский режим.	1
721	241	She lamented the loss of her best friend.	Она оплакивала потерю лучшего друга.	1
722	241	He lamented the passing of an era.	Он сожалел о конце эпохи.	1
723	241	The poem laments the destruction of the city.	В стихотворении оплакивается разрушение города.	1
724	242	The sun dipped below the horizon.	Солнце опустилось за горизонт.	1
725	242	The ship appeared on the horizon.	Корабль появился на горизонте.	1
726	242	New challenges are on the horizon.	На горизонте появляются новые вызовы.	1
727	243	The accretion of wealth was slow but steady.	Накопление богатства шло медленно, но стабильно.	1
728	243	The accretion of dust on the shelves was noticeable.	Накопление пыли на полках было заметным.	1
729	243	The planet formed through the accretion of matter.	Планета сформировалась в результате накопления вещества.	1
730	244	He offered a sincere apology for his mistake.	Он принес искренние извинения за свою ошибку.	1
731	244	The company issued a public apology.	Компания принесла публичные извинения.	1
732	244	She accepted his apology and forgave him.	Она приняла его извинения и простила его.	1
733	245	His apology was sincere and heartfelt.	Его извинения были искренними и от души.	1
734	245	She gave a sincere thank you to everyone who helped.	Она искренне поблагодарила всех, кто помог.	1
735	245	Sincere efforts are needed to solve the problem.	Необходимы искренние усилия для решения проблемы.	1
736	246	It's better to be upfront about your intentions.	Лучше быть откровенным в своих намерениях.	1
737	246	She was upfront with her boss about needing time off.	Она прямо сказала своему начальнику, что ей нужно время для отдыха.	1
738	246	He appreciated her being upfront with him.	Он оценил, что она была с ним откровенна.	1
739	247	He injured his limb in the accident.	Он повредил свою конечность в аварии.	1
740	247	The tree limb was heavy with fruit.	Ветка дерева была тяжелой от плодов.	1
741	247	She stretched out her limbs after the long flight.	Она потянула конечности после долгого перелета.	1
742	248	The athlete tore a tendon during the race.	Атлет порвал сухожилие во время гонки.	1
743	248	Tendon injuries can take a long time to heal.	Травмы сухожилий могут долго заживать.	1
744	248	The tendon connects the muscle to the bone.	Сухожилие соединяет мышцу с костью.	1
745	249	She injured a ligament in her knee.	Она повредила связку в колене.	1
746	249	The ligament was stretched but not torn.	Связка была растянута, но не порвана.	1
747	249	Ligament injuries are common in athletes.	Травмы связок часто встречаются у спортсменов.	1
748	250	The doctor examined her thyroid gland.	Врач осмотрел её щитовидную железу.	1
749	250	Swollen glands are a sign of infection.	Опухшие железы — это признак инфекции.	1
750	250	The gland produces hormones essential for growth.	Железа вырабатывает гормоны, необходимые для роста.	1
751	251	The cartilage in his knee was damaged.	Хрящ в его колене был поврежден.	1
752	251	Cartilage helps cushion the joints.	Хрящ помогает амортизировать суставы.	1
753	251	She has a small cartilage piercing in her ear.	У неё небольшая хрящевая серьга в ухе.	1
754	252	The cookies were coated in chocolate.	Печенье было покрыто шоколадом.	1
755	252	The road was coated with a thin layer of ice.	Дорога была покрыта тонким слоем льда.	1
756	252	He wore a jacket coated in water-resistant material.	Он надел куртку, покрытую водоотталкивающим материалом.	1
757	253	The Age of Enlightenment brought new ideas to Europe.	Эпоха Просвещения принесла в Европу новые идеи.	1
758	253	He sought spiritual enlightenment through meditation.	Он искал духовного просветления через медитацию.	1
759	253	The book provided enlightenment on the subject.	Книга дала просвещение по этому вопросу.	1
760	254	They liked to roam the countryside on weekends.	Они любили бродить по сельской местности по выходным.	1
761	254	The buffalo roam freely on the plains.	Буйволы свободно бродят по равнинам.	1
762	254	He spent the day roaming the streets of the old town.	Он провел день, бродя по улицам старого города.	1
763	255	She wandered through the forest, enjoying the peace.	Она бродила по лесу, наслаждаясь тишиной.	1
764	255	The child wandered away from his parents at the park.	Ребёнок ушел от родителей в парке.	1
765	255	He likes to wander around the city after work.	Он любит бродить по городу после работы.	1
766	256	He launched a crusade against corruption.	Он начал крестовый поход против коррупции.	1
767	256	The crusades were a series of religious wars in the medieval period.	Крестовые походы были серией религиозных войн в средние века.	1
768	256	She is on a crusade to promote healthy eating habits.	Она начала крестовый поход за пропаганду здорового питания.	1
769	257	He is proud of his Jewish heritage.	Он гордится своим еврейским наследием.	1
770	257	The community center serves Jews and non-Jews alike.	Общественный центр обслуживает как евреев, так и неевреев.	1
771	257	They celebrated the Jewish holiday together.	Они вместе отметили еврейский праздник.	1
772	258	Christianity is one of the world's major religions.	Христианство — одна из крупнейших мировых религий.	1
773	258	The spread of Christianity influenced European history.	Распространение христианства повлияло на историю Европы.	1
774	258	She studied the teachings of Christianity in college.	Она изучала учение христианства в колледже.	1
775	259	He was raised in a Christian household.	Он вырос в христианской семье.	1
776	259	Christian values emphasize love and compassion.	Христианские ценности подчеркивают любовь и сострадание.	1
777	259	The Christian church plays a central role in the community.	Христианская церковь играет центральную роль в общине.	1
778	260	She reads the Bible every morning.	Она читает Библию каждое утро.	1
779	260	The Bible is considered sacred by Christians.	Библия считается священной для христиан.	1
780	260	He quoted a passage from the Bible during the sermon.	Он процитировал отрывок из Библии во время проповеди.	1
781	261	Judas is known for betraying Jesus in the Bible.	Иуда известен тем, что предал Иисуса в Библии.	1
782	261	He was called a Judas for betraying his friends.	Его называли Иудой за предательство друзей.	1
783	261	The name Judas has become synonymous with betrayal.	Имя Иуда стало синонимом предательства.	1
784	262	They prayed for salvation from their troubles.	Они молились о спасении от своих бед.	1
785	262	Salvation is a central concept in many religions.	Спасение — центральное понятие во многих религиях.	1
786	262	He found salvation in his faith.	Он нашел спасение в своей вере.	1
787	263	The solidity of the structure was tested during the earthquake.	Твердость конструкции была проверена во время землетрясения.	1
789	263	The company's financial solidity attracted investors.	Финансовая твердость компании привлекла инвесторов.	1
790	264	The soft grass cushioned his fall.	Мягкая трава смягчила его падение.	1
791	264	The airbags cushioned the impact during the crash.	Подушки безопасности смягчили удар при аварии.	1
792	264	Her savings cushioned the financial blow of losing her job.	Её сбережения смягчили финансовый удар от потери работы.	1
793	265	His ignorance of the law did not excuse his actions.	Его незнание закона не оправдывало его действий.	1
794	265	They blamed their mistakes on ignorance.	Они винили свои ошибки в невежестве.	1
795	265	Ignorance is often the root of prejudice.	Невежество часто является источником предубеждений.	1
796	266	The system asked him to retry the operation.	Система попросила его повторить операцию.	1
797	266	He decided to retry the experiment with a different approach.	Он решил повторить эксперимент с другим подходом.	1
798	266	If at first you don't succeed, retry until you do.	Если сначала у вас не получается, повторяйте, пока не добьетесь успеха.	1
799	267	He kept the receipt in case he needed to return the item.	Он сохранил квитанцию на случай, если ему нужно будет вернуть товар.	1
800	267	The receipt showed the total amount paid.	В квитанции была указана общая сумма оплаты.	1
801	267	She asked for a receipt after making the purchase.	Она попросила квитанцию после совершения покупки.	1
802	268	The couch was covered with soft cushions.	Диван был покрыт мягкими подушками.	1
803	268	She placed a cushion on the chair for added comfort.	Она положила подушку на стул для большего комфорта.	1
804	268	The seat cushion was worn and needed to be replaced.	Сиденье подушки было изношено и нуждалось в замене.	1
805	269	Education is a means to a better future.	Образование — это средство для лучшего будущего.	1
806	269	The company provided the means for employees to work from home.	Компания предоставила средства для работы сотрудников на дому.	1
807	269	He has the means to support his family comfortably.	У него есть средства для комфортного содержания своей семьи.	1
808	270	The hospital has state-of-the-art facilities.	В больнице есть современные средства.	1
809	270	The sports facility includes a gym and a swimming pool.	Спортивный объект включает в себя тренажерный зал и бассейн.	1
810	270	The new facility will help improve production efficiency.	Новое средство поможет повысить производительность.	1
811	271	He is known for his wisdom and experience.	Он известен своей мудростью и опытом.	1
812	271	The book is full of ancient wisdom.	Книга полна древней мудрости.	1
813	271	Her wisdom guided them through difficult times.	Её мудрость помогла им пройти через трудные времена.	1
814	272	She stood on the threshold of a new life.	Она стояла на пороге новой жизни.	1
815	272	They are on the threshold of a major breakthrough.	Они находятся на пороге крупного прорыва.	1
816	272	The pain threshold varies from person to person.	Порог боли варьируется от человека к человеку.	1
817	273	The reception was held in a grand ballroom.	Прием прошел в большом бальном зале.	1
818	273	She received a warm reception from her colleagues.	Она получила теплый прием от своих коллег.	1
819	273	The hotel reception is open 14 hours a day.	Регистрация в отеле работает круглосуточно.	1
820	274	The breadth of his knowledge is impressive.	Ширина его знаний впечатляет.	1
821	274	The bridge spans the breadth of the river.	Мост простирается на всю ширину реки.	1
822	274	She admired the breadth of the landscape.	Она восхищалась широтой пейзажа.	1
823	275	The hall has a seating capacity of 500 people.	Вместимость зала — 500 человек.	1
824	275	The factory is operating at full capacity.	Фабрика работает на полную мощность.	1
825	275	His capacity for learning is remarkable.	Его способность к обучению замечательна.	1
826	276	He pulled the lever to start the machine.	Он потянул за рычаг, чтобы запустить машину.	1
827	276	The lever was used to lift the heavy object.	Рычаг использовался для подъема тяжелого предмета.	1
828	276	She used a lever to pry open the lid.	Она использовала рычаг, чтобы приподнять крышку.	1
829	277	They marveled at the beauty of the sunset.	Они восхищались красотой заката.	1
830	277	The technology is a marvel of modern engineering.	Эта технология — чудо современной инженерии.	1
831	277	He marveled at her ability to solve complex problems.	Он восхищался её способностью решать сложные проблемы.	1
832	278	The threat of war loomed over the region.	Угроза войны нависла над регионом.	1
833	278	Dark clouds loomed on the horizon.	Темные тучи нависли на горизонте.	1
834	278	A crisis looms as the deadline approaches.	Кризис маячит по мере приближения крайнего срока.	1
835	279	The streetlights illuminate the road at night.	Фонари освещают дорогу ночью.	1
836	279	The teacher's explanation helped illuminate the complex topic.	Объяснение учителя помогло прояснить сложную тему.	1
837	279	The book illuminates the history of the ancient world.	Книга проливает свет на историю древнего мира.	1
838	280	His argument was a negation of everything she stood for.	Его аргумент был отрицанием всего, что она отстаивала.	1
839	280	Negation of the facts will not change the reality.	Отрицание фактов не изменит реальности.	1
840	280	The philosopher discussed the concept of negation.	Философ обсуждал концепцию отрицания.	1
841	281	The view from the top of the mountain was breathtaking.	Вид с вершины горы был захватывающим.	1
842	281	The speed of the new car is simply breathtaking.	Скорость нового автомобиля просто захватывает дух.	1
843	281	The ballet performance was breathtakingly beautiful.	Балетное представление было потрясающе красивым.	1
844	282	The project was completed under tight budget constraints.	Проект был завершен в условиях жестких бюджетных ограничений.	1
845	282	They faced time constraints in delivering the product.	Они столкнулись с временными ограничениями при доставке продукта.	1
846	282	Legal constraints limit the use of this technology.	Правовые ограничения ограничивают использование этой технологии.	1
847	283	The forest is the natural habitat of many wildlife species.	Лес — естественная среда обитания многих видов диких животных.	1
848	283	The loss of habitat is a major threat to endangered species.	Потеря среды обитания представляет серьезную угрозу для исчезающих видов.	1
849	283	They are working to protect the habitat of the panda.	Они работают над защитой среды обитания панд.	1
850	284	The cat has soft, fluffy fur.	У кошки мягкий, пушистый мех.	1
851	284	She wore a coat made of faux fur.	Она надела пальто из искусственного меха.	1
852	284	The fur trade has been a controversial industry.	Торговля мехом была спорной отраслью.	1
853	285	The sweater is made of 100% wool.	Свитер изготовлен из 100% шерсти.	1
854	285	She knits scarves from wool.	Она вяжет шарфы из шерсти.	1
855	285	Wool is a warm and durable material.	Шерсть — теплый и прочный материал.	1
856	286	They faced many obstacles in their journey.	Они столкнулись со многими препятствиями на своем пути.	1
857	286	The team overcame all obstacles to reach their goal.	Команда преодолела все препятствия на пути к своей цели.	1
858	286	The biggest obstacle was lack of funding.	Самым большим препятствием была нехватка финансирования.	1
859	287	The sheer size of the mountain was intimidating.	Чистый размер горы был пугающим.	1
860	287	The fabric is so sheer you can see through it.	Ткань такая тонкая, что сквозь неё можно видеть.	1
861	287	They were amazed by the sheer beauty of the landscape.	Они были поражены чистой красотой пейзажа.	1
862	288	She is excited about the upcoming trip to Europe.	Она с нетерпением ждет предстоящей поездки в Европу.	1
863	288	The company is preparing for the upcoming product launch.	Компания готовится к предстоящему выпуску продукта.	1
864	288	The upcoming election is expected to be highly contested.	Ожидается, что предстоящие выборы будут оспариваться.	1
865	289	The Eiffel Tower is a famous landmark in Paris.	Эйфелева башня — знаменитая достопримечательность Парижа.	1
866	289	They visited several historical landmarks during their trip.	Во время поездки они посетили несколько исторических достопримечательностей.	1
867	289	The court's decision was a landmark in civil rights history.	Решение суда стало вехой в истории гражданских прав.	1
868	290	They agreed to the terms of the contract.	Они согласились с условиями контракта.	1
869	290	The terms of the agreement were not disclosed.	Условия соглашения не разглашались.	1
870	290	They negotiated the terms of the deal for hours.	Они вели переговоры об условиях сделки в течение нескольких часов.	1
871	291	She received a grant to fund her research.	Она получила грант на финансирование своего исследования.	1
872	291	The government awarded a grant to the university.	Правительство выделило грант университету.	1
873	291	The grant will cover all the project expenses.	Грант покроет все расходы на проект.	1
874	292	Hyperthymia is characterized by a consistently high mood.	Гипертимия характеризуется стабильно приподнятым настроением.	1
875	292	People with hyperthymia often have high energy levels.	Люди с гипертимией часто обладают высоким уровнем энергии.	1
876	292	The diagnosis of hyperthymia can be challenging.	Диагностика гипертимии может быть сложной.	1
877	293	The concert was absolutely terrific.	Концерт был просто потрясающим.	1
878	293	She did a terrific job on the project.	Она проделала потрясающую работу над проектом.	1
879	293	The weather has been terrific all week.	Погода была потрясающей всю неделю.	1
880	294	The information is readily available online.	Информация легко доступна в Интернете.	1
881	294	He readily agreed to help with the project.	Он охотно согласился помочь с проектом.	1
882	294	The materials can be readily found in most stores.	Материалы можно легко найти в большинстве магазинов.	1
883	295	We can learn from our mistakes.	Мы можем учиться на своих ошибках.	1
884	295	She learned from her experience and improved.	Она научилась на своем опыте и улучшилась.	1
885	295	They learned valuable lessons from the project.	Они извлекли ценные уроки из проекта.	1
886	296	The stock prices have been moving upward.	Цены на акции продолжают расти.	1
887	296	She directed her gaze upward.	Она направила свой взгляд вверх.	1
888	296	The bird flew in an upward direction.	Птица полетела вверх.	1
889	297	The team decided to deprioritize the less urgent tasks.	Команда решила понизить приоритет менее срочных задач.	1
890	297	They had to deprioritize some projects due to budget constraints.	Им пришлось понизить приоритет некоторых проектов из-за бюджетных ограничений.	1
891	297	The company decided to deprioritize the older product line.	Компания решила понизить приоритет старой линейки продуктов.	1
892	298	They enjoyed a quiet weekend in the countryside.	Они наслаждались тихими выходными в сельской местности.	1
893	298	The countryside is beautiful in the spring.	Сельская местность прекрасна весной.	1
894	298	He grew up in the countryside, surrounded by nature.	Он вырос в сельской местности, окруженной природой.	1
895	299	They caught a large salmon in the river.	Они поймали большого лосося в реке.	1
896	299	Salmon is a popular fish in many cuisines.	Лосось — популярная рыба во многих кухнях мира.	1
897	299	She cooked the salmon with lemon and herbs.	Она приготовила лосося с лимоном и травами.	1
898	300	The internet connection has a high bandwidth.	Интернет-соединение имеет высокую пропускную способность.	1
899	300	Streaming videos requires a lot of bandwidth.	Для потокового воспроизведения видео требуется большая пропускная способность.	1
900	300	The company upgraded its network to increase bandwidth.	Компания модернизировала свою сеть для увеличения пропускной способности.	1
901	301	The bullet pierced the target with precision.	Пуля точно пробила мишень.	1
902	301	He found a bullet casing on the ground.	Он нашел гильзу от пули на земле.	1
903	301	The detective analyzed the bullet's trajectory.	Детектив проанализировал траекторию пули.	1
904	302	He lifted the hefty box with ease.	Он легко поднял здоровенный ящик.	1
905	302	The book has a hefty price tag.	У книги высокая цена.	1
906	302	The wrestler had a hefty build.	Борец был крепкого телосложения.	1
907	303	The dog's sharp canine teeth were visible when it growled.	Острые клыки собаки были видны, когда она рычала.	1
908	303	Canine training is essential for service dogs.	Тренировка клыков важна для служебных собак.	1
909	303	His canine instinct told him something was wrong.	Его клыковой инстинкт подсказывал ему, что что-то не так.	1
910	304	Her statement was ambiguous and left us confused.	Её заявление было двусмысленным и оставило нас в недоумении.	1
911	304	The ending of the movie was ambiguous.	Концовка фильма была двусмысленной.	1
912	304	The instructions were too ambiguous to follow.	Инструкции были слишком двусмысленны, чтобы их можно было следовать.	1
913	305	He is now a full-fledged member of the team.	Теперь он полноценный член команды.	1
914	305	The company has developed into a full-fledged enterprise.	Компания превратилась в полноценное предприятие.	1
915	305	She received her full-fledged certification last year.	В прошлом году она получила полноценный сертификат.	1
916	306	We've only scratched the surface of this issue.	Мы только поверхностно коснулись этой проблемы.	1
917	306	The investigation just scratches the surface of the corruption.	Расследование лишь поверхностно касается коррупции.	1
918	306	Learning a new language is more than just scratching the surface.	Изучение нового языка — это не просто поверхностное касание.	1
919	307	She cut her hand on a shard of glass.	Она порезала руку осколок стекла.	1
920	307	The vase shattered into tiny shards.	Ваза разбилась на мелкие осколки.	1
921	307	They found a shard of ancient pottery at the site.	Они нашли осколок древней керамики на месте раскопок.	1
922	308	The building was made of solid concrete.	Здание было построено из прочного бетона.	1
923	308	They poured the concrete foundation yesterday.	Они залили бетонный фундамент вчера.	1
924	308	Concrete evidence was presented during the trial.	Во время суда были представлены конкретные доказательства.	1
925	309	The boat was stabilized by outriggers.	Лодка была стабилизирована выносными опорами.	1
926	309	Outriggers are essential for maintaining balance in canoes.	Выносные опоры необходимы для поддержания равновесия на каноэ.	1
927	309	The construction crane used outriggers for stability.	Строительный кран использовал выносные опоры для устойчивости.	1
928	310	He heard the latches click as the door closed.	Он услышал, как щёлкнули защёлки, когда дверь закрылась.	1
929	310	The windows were secured with strong latches.	Окна были закреплены прочными защёлками.	1
930	310	Make sure all the latches are fastened before leaving.	Убедитесь, что все защёлки закреплены перед уходом.	1
931	311	Her intelligence is evident in the way she solves problems.	Её интеллект очевиден в том, как она решает проблемы.	1
932	311	They gathered intelligence for the upcoming mission.	Они собрали разведывательную информацию для предстоящей миссии.	1
933	311	Artificial intelligence is a growing field in technology.	Искусственный интеллект — это растущая область технологий.	1
934	312	The factory was filled with heavy machinery.	Фабрика была заполнена тяжелыми механизмами.	1
935	312	They maintained the machinery to ensure smooth operation.	Они поддерживали механизмы в рабочем состоянии для обеспечения бесперебойной работы.	1
936	312	The machinery was outdated and needed to be replaced.	Механизмы устарели и нуждались в замене.	1
937	313	The team worked as a cohesive unit.	Команда работала как связное целое.	1
938	313	They presented a cohesive argument in court.	Они представили связное доказательство в суде.	1
939	313	Cohesive writing is essential for clear communication.	Связное письмо необходимо для ясного общения.	1
940	314	The piano was perfectly tuned before the concert.	Пианино было идеально настроено перед концертом.	1
941	314	He tuned the radio to his favorite station.	Он настроил радио на свою любимую станцию.	1
942	314	The car's engine was finely tuned for performance.	Двигатель автомобиля был точно настроен для производительности.	1
943	315	The solution they chose was suboptimal for the situation.	Решение, которое они выбрали, было неоптимальным для ситуации.	1
944	315	Suboptimal performance can lead to inefficiency.	Неоптимальная работа может привести к неэффективности.	1
945	315	The design was suboptimal, resulting in higher costs.	Дизайн был неоптимальным, что привело к увеличению затрат.	1
946	316	Numerous studies have shown the benefits of exercise.	Многочисленные исследования показали преимущества упражнений.	1
947	316	She has received numerous awards for her work.	Она получила многочисленные награды за свою работу.	1
948	316	The project faced numerous challenges along the way.	Проект столкнулся с многочисленными трудностями на пути.	1
949	317	He found a lucrative opportunity in the tech industry.	Он нашел прибыльную возможность в сфере технологий.	1
950	317	The business proved to be highly lucrative.	Бизнес оказался очень прибыльным.	1
951	317	They invested in a lucrative venture last year.	Они инвестировали в прибыльное предприятие в прошлом году.	1
952	318	The city is located at a high latitude.	Город расположен на большой широте.	1
953	318	Latitude affects the climate of a region.	Широта влияет на климат региона.	1
954	318	The explorers noted the latitude of the island.	Исследователи отметили широту острова.	1
955	319	The longitude of the location was carefully measured.	Долгота местоположения была тщательно измерена.	1
956	319	Longitude lines run from the North to the South Pole.	Линии долготы проходят от Северного до Южного полюса.	1
957	319	The navigator used longitude to determine their position.	Навигатор использовал долготу для определения их положения.	1
958	320	They traveled to Norway to see the aurora borealis.	Они отправились в Норвегию, чтобы увидеть северное сияние.	1
959	320	The aurora borealis lit up the night sky with vibrant colors.	Северное сияние осветило ночное небо яркими красками.	1
960	320	Photographers often seek out the aurora borealis for stunning shots.	Фотографы часто ищут северное сияние для потрясающих снимков.	1
961	321	The book provides a descriptive account of the events.	Книга предоставляет описательный отчет о событиях.	1
962	321	Her descriptive writing paints a vivid picture for the reader.	Её описательное письмо рисует яркую картину для читателя.	1
963	321	Descriptive language enhances the storytelling.	Описательный язык улучшает повествование.	1
964	322	He felt a wave of fatigue after the long flight.	Он почувствовал волну усталости после долгого перелета.	1
965	322	The soldiers were suffering from fatigue after days of marching.	Солдаты страдали от усталости после нескольких дней марша.	1
966	322	Fatigue can impair your ability to concentrate.	Усталость может ухудшить вашу способность концентрироваться.	1
967	323	He was charged with selling alcohol to a minor.	Его обвинили в продаже алкоголя несовершеннолетнему.	1
968	323	Minors are not allowed to enter the club.	Несовершеннолетним не разрешается входить в клуб.	1
969	323	She was still a minor when she started her acting career.	Она была еще несовершеннолетней, когда начала свою актерскую карьеру.	1
970	324	They used CPR to revive the unconscious man.	Они использовали СЛР, чтобы оживить без сознания человека.	1
971	324	The old tradition was revived in the small town.	Старая традиция была возрождена в маленьком городке.	1
972	324	The company is trying to revive its brand with a new campaign.	Компания пытается оживить свой бренд с новой кампанией.	1
973	325	She gave a quick glance at the clock.	Она быстро взглянула на часы.	1
974	325	He glanced at the newspaper headlines.	Он взглянул на заголовки газет.	1
975	325	The student glanced at his notes before the exam.	Студент взглянул на свои заметки перед экзаменом.	1
976	326	They love to gossip about their neighbors.	Они любят сплетничать о своих соседях.	1
977	326	The office was buzzing with gossip after the meeting.	В офисе ходили сплетни после совещания.	1
978	326	She avoided the gossip and focused on her work.	Она избегала сплетен и сосредоточилась на своей работе.	1
979	327	He converted the garage into a workshop.	Он преобразовал гараж в мастерскую.	1
980	327	They plan to convert the old factory into apartments.	Они планируют преобразовать старую фабрику в квартиры.	1
981	327	She converted her savings into stocks.	Она перевела свои сбережения в акции.	1
982	328	The leaking gas could be a danger to the building.	Утечка газа может представлять опасность для здания.	1
983	328	Smoking is a danger to your health.	Курение представляет опасность для вашего здоровья.	1
984	328	The storm is a danger to small boats.	Шторм представляет опасность для небольших лодок.	1
985	329	You have to give her credit for her hard work.	Нужно отдать ей должное за её усердный труд.	1
986	329	He gave credit to his team for the success of the project.	Он отдал должное своей команде за успех проекта.	1
987	329	The teacher gave credit where it was due.	Учитель отдал должное там, где это было необходимо.	1
988	330	She found her niche in the tech industry.	Она нашла свою нишу в технологической индустрии.	1
989	330	The company focuses on a specific niche market.	Компания ориентируется на конкретный нишевой рынок.	1
990	330	He carved out a niche for himself as a graphic designer.	Он вырезал для себя нишу как графический дизайнер.	1
991	331	The road forks ahead, and you can go either left or right.	Дорога впереди разветвляется, и можно поехать либо налево, либо направо.	1
992	331	The river forks into two smaller streams.	Река разветвляется на два меньших ручья.	1
993	331	The project may fork into different directions.	Проект может разветвиться в разных направлениях.	1
994	332	She found serenity in the quiet of the mountains.	Она нашла безмятежность в тишине гор.	1
995	332	The painting captures the serenity of the landscape.	Картина передает безмятежность пейзажа.	1
996	332	Meditation helped him achieve a state of serenity.	Медитация помогла ему достичь состояния безмятежности.	1
997	333	The value must be less than or equal to 100.	Значение должно быть меньше или равно 100.	1
998	333	In math, use the symbol ≤ for less than or equal to.	В математике используйте символ ≤ для меньше или равно.	1
999	333	The budget cannot exceed this amount; it must be less than or equal to it.	Бюджет не может превышать эту сумму; он должен быть меньше или равен ей.	1
1000	334	The rigorous training prepared him for the marathon.	Строгая тренировка подготовила его к марафону.	1
1209	403	The instructions were taped onto the package.	Инструкции были приклеены к упаковке.	1
1001	334	The project underwent a rigorous review process.	Проект прошел через строгий процесс проверки.	1
1002	334	She follows a rigorous routine every morning.	Она следует строгой рутине каждое утро.	1
1003	335	He outlined his plan for the project during the meeting.	Он набросал свой план проекта во время встречи.	1
1004	335	The teacher asked the students to outline the main points.	Учитель попросил студентов набросать основные моменты.	1
1005	335	She outlined the proposal in a brief presentation.	Она набросала предложение в краткой презентации.	1
1006	336	The movie scene caused a sudden arousal in the audience.	Сцена в фильме вызвала внезапное возбуждение у зрителей.	1
1007	336	Arousal can be triggered by various stimuli.	Возбуждение может быть вызвано различными стимулами.	1
1008	336	He felt a rush of arousal during the intense moment.	Он почувствовал прилив возбуждения в напряженный момент.	1
1009	337	The internet connection has a high bandwidth.	Интернет-соединение имеет высокую пропускную способность.	1
1010	337	They upgraded their network to increase bandwidth.	Они обновили свою сеть, чтобы увеличить пропускную способность.	1
1011	337	Streaming video requires a significant amount of bandwidth.	Потоковое видео требует значительного объема пропускной способности.	1
1012	338	The suitcase was hefty and hard to carry.	Чемодан был тяжелым и трудно поднимался.	1
1013	338	He received a hefty bonus at the end of the year.	Он получил здоровенный бонус в конце года.	1
1014	338	The hefty fine discouraged others from breaking the rules.	Здоровенный штраф отпугнул других от нарушения правил.	1
1015	339	The doctors are working to find a cure for the disease.	Врачи работают над поиском лекарства от болезни.	1
1016	339	There is no known cure for this condition.	Для этого состояния не существует известного лечения.	1
1017	339	They hope to develop a cure in the next decade.	Они надеются разработать лекарство в ближайшее десятилетие.	1
1018	340	Leukocytes play a vital role in the immune system.	Лейкоциты играют важную роль в иммунной системе.	1
1019	340	An increase in leukocytes often indicates an infection.	Увеличение количества лейкоцитов часто указывает на инфекцию.	1
1020	340	The doctor explained the function of leukocytes in fighting disease.	Доктор объяснил функцию лейкоцитов в борьбе с болезнями.	1
1021	341	The play critiqued the bourgeois values of society.	Пьеса критиковала буржуазные ценности общества.	1
1022	341	He adopted a bourgeois lifestyle after gaining wealth.	Он принял буржуазный образ жизни после обретения богатства.	1
1023	341	The bourgeois mentality was evident in their actions.	Буржуазный менталитет был очевиден в их действиях.	1
1024	342	They decided to free up some space in the office.	Они решили освободить немного места в офисе.	1
1025	342	The new software will free up memory on your device.	Новое программное обеспечение освободит память на вашем устройстве.	1
1026	342	Free up your schedule to attend the meeting.	Освободите свое расписание, чтобы посетить встречу.	1
1027	343	He pulled the lever to start the machine.	Он потянул за рычаг, чтобы запустить машину.	1
1028	343	The lever controls the movement of the crane.	Рычаг управляет движением крана.	1
1029	343	They used a lever to lift the heavy object.	Они использовали рычаг, чтобы поднять тяжелый предмет.	1
1030	344	They leveraged their experience to gain a competitive advantage.	Они использовали свой опыт, чтобы получить конкурентное преимущество.	1
1031	344	The company leveraged its resources to expand rapidly.	Компания использовала свои ресурсы для быстрого расширения.	1
1032	344	He leveraged his connections to secure the deal.	Он использовал свои связи, чтобы заключить сделку.	1
1033	345	The meeting was conducted with a sense of informality.	Встреча проводилась с чувством неформальности.	1
1034	345	They appreciated the informality of the gathering.	Они оценили неформальность собрания.	1
1035	345	The informality of the event made everyone feel relaxed.	Неформальность мероприятия заставила всех чувствовать себя расслабленно.	1
1036	346	The two rooms are adjacent to each other.	Эти две комнаты смежные.	1
1037	346	Our office is adjacent to the main conference room.	Наш офис смежен с главной конференц-залом.	1
1038	346	The adjacent buildings share a common wall.	Смежные здания разделяют общую стену.	1
1039	347	They made several assumptions about the outcome of the project.	Они сделали несколько предположений о результате проекта.	1
1040	347	The report was based on faulty assumptions.	Отчет был основан на ошибочных предположениях.	1
1382	461	The system needs to be reset every morning.	Систему нужно сбрасывать каждое утро.	1
1041	347	We need to challenge our assumptions and consider new possibilities.	Нам нужно подвергнуть сомнению наши предположения и рассмотреть новые возможности.	1
1042	348	The medicine helped to revive the unconscious patient.	Лекарство помогло оживить без сознания пациента.	1
1043	348	The town is trying to revive its economy after the recession.	Город пытается оживить свою экономику после рецессии.	1
1044	348	They hope to revive interest in classical music among young people.	Они надеются возродить интерес к классической музыке среди молодежи.	1
1045	349	He drained the water from the sink.	Он осушил воду из раковины.	1
1046	349	The battery drained quickly due to heavy usage.	Батарея быстро разрядилась из-за интенсивного использования.	1
1047	349	The swamp was drained to make room for new construction.	Болото осушили, чтобы освободить место для нового строительства.	1
1048	350	Blood oozed from the wound.	Кровь сочилась из раны.	1
1049	350	The sap oozed out of the tree bark.	Сок сочился из коры дерева.	1
1050	350	The tube was oozing a thick, sticky substance.	Трубка сочилась густым, липким веществом.	1
1051	351	Idempotency is an important concept in computer science.	Идемпотентность — важное понятие в информатике.	1
1052	351	They ensured the idempotency of the API requests.	Они обеспечили идемпотентность запросов API.	1
1053	351	Idempotency helps prevent unintended side effects in operations.	Идемпотентность помогает предотвратить нежелательные побочные эффекты в операциях.	1
1054	352	He won the contest with his impressive performance.	Он выиграл соревнование с впечатляющим выступлением.	1
1055	352	The contest attracted participants from all over the country.	Соревнование привлекло участников со всей страны.	1
1056	352	They held a contest to name the new product.	Они провели конкурс, чтобы назвать новый продукт.	1
1057	353	She is known for her pious nature.	Она известна своей набожной натурой.	1
1058	353	His pious actions inspired many people.	Его набожные поступки вдохновили многих людей.	1
1059	353	The family is very pious and attends church every Sunday.	Эта семья очень набожна и посещает церковь каждое воскресенье.	1
1060	354	The emergency egress was clearly marked.	Аварийный выход был четко обозначен.	1
1061	354	They planned their egress from the building carefully.	Они тщательно спланировали свой выход из здания.	1
1062	354	The door was used for both ingress and egress.	Дверь использовалась как для входа, так и для выхода.	1
1063	355	The stallion was known for its strength and speed.	Жеребец был известен своей силой и скоростью.	1
1064	355	They brought the stallion to the farm for breeding.	Они привезли жеребца на ферму для разведения.	1
1065	355	The black stallion galloped across the field.	Черный жеребец галопом пересек поле.	1
1066	356	The view from the top of the mountain was magnificent.	Вид с вершины горы был великолепен.	1
1067	356	They lived in a magnificent mansion by the sea.	Они жили в великолепном особняке у моря.	1
1068	356	The orchestra played a magnificent symphony.	Оркестр исполнил великолепную симфонию.	1
1069	357	Her belief in herself helped her overcome challenges.	Её вера в себя помогла ей преодолеть трудности.	1
1070	357	The belief in equality is fundamental to democracy.	Вера в равенство является основополагающей для демократии.	1
1071	357	He expressed his belief that the project would succeed.	Он выразил свою уверенность в том, что проект будет успешным.	1
1072	358	The teachings of the philosopher influenced many generations.	Учения философа оказали влияние на многие поколения.	1
1073	358	They follow the teachings of their religious leader.	Они следуют учениям своего религиозного лидера.	1
1074	358	The book is filled with the teachings of ancient wisdom.	Книга полна учений древней мудрости.	1
1075	359	The paramedics performed resuscitation on the patient.	Медики провели реанимацию пациента.	1
1076	359	Resuscitation techniques are taught in first aid courses.	Техники реанимации преподаются на курсах первой помощи.	1
1077	359	They were able to resuscitate the man after a few minutes.	Они смогли реанимировать человека через несколько минут.	1
1078	360	The marine life in this area is incredibly diverse.	Морская жизнь в этом районе невероятно разнообразна.	1
1079	360	They studied marine biology in college.	Они изучали морскую биологию в колледже.	1
1080	360	Marine ecosystems are vital to the health of the planet.	Морские экосистемы жизненно важны для здоровья планеты.	1
1081	361	Deforestation is a major environmental concern.	Вырубка лесов — серьезная экологическая проблема.	1
1383	461	She reset the alarm clock before going to bed.	Она сбросила будильник перед сном.	1
1082	361	They are working to combat deforestation in the region.	Они работают над борьбой с вырубкой лесов в этом регионе.	1
1083	361	Deforestation contributes to climate change.	Вырубка лесов способствует изменению климата.	1
1084	362	The estimate is just a ballpark figure, not exact.	Оценка является лишь приблизительной, а не точной.	1
1085	362	They gave a ballpark number for the total cost.	Они назвали приблизительное число общей стоимости.	1
1086	362	The ballpark for the project timeline is six months.	Примерный срок проекта — шесть месяцев.	1
1087	363	He ballparked the cost at around $5,000.	Он приблизительно оценил стоимость в 5000 долларов.	1
1088	363	Can you ballpark how long the task will take?	Можете ли вы приблизительно оценить, сколько времени займет эта задача?	1
1089	363	They ballparked the number of attendees at 100.	Они приблизительно оценили количество участников в 100 человек.	1
1090	364	The paragraph was indented for clarity.	Абзац был сделан с отступом для ясности.	1
1091	364	Use the tab key to indent the first line.	Используйте клавишу табуляции для отступа первой строки.	1
1092	364	Indenting your code makes it easier to read.	Отступы в коде делают его легче для чтения.	1
1093	365	She stubbed her toe on the corner of the table.	Она ударила палец ноги о край стола.	1
1094	365	He wiggled his toes in the sand.	Он шевелил пальцами ног в песке.	1
1095	365	The toe of her shoe was scuffed.	Носок её туфли был поцарапан.	1
1096	366	The adverse weather conditions forced them to cancel the event.	Неблагоприятные погодные условия заставили их отменить мероприятие.	1
1097	366	He faced many adverse situations throughout his career.	Он столкнулся со многими неблагоприятными ситуациями в своей карьере.	1
1098	366	Adverse reactions to the medication were reported.	Были сообщены о неблагоприятных реакциях на лекарство.	1
1099	367	Overall, the project was a success.	В целом проект был успешным.	1
1100	367	The overall quality of the product is good.	Общее качество продукта хорошее.	1
1101	367	Overall, she was pleased with the results.	В целом она была довольна результатами.	1
1102	368	The government agreed to fund the new school.	Правительство согласилось финансировать новую школу.	1
1103	368	They are seeking investors to fund their startup.	Они ищут инвесторов для финансирования своего стартапа.	1
1104	368	The project was privately funded.	Проект финансировался частным образом.	1
1105	369	He idled away the afternoon watching TV.	Он бездельничал весь день, смотря телевизор.	1
1106	369	The car engine idled as he waited at the light.	Двигатель машины работал на холостом ходу, пока он ждал у светофора.	1
1107	369	Don't idle your time away; start working on your goals.	Не трать время впустую; начни работать над своими целями.	1
1108	370	She learned pottery in an art class.	Она изучала керамику на уроке искусства.	1
1109	370	The ancient pottery was displayed in the museum.	Древняя керамика была выставлена в музее.	1
1110	370	They make pottery using traditional methods.	Они изготавливают керамику с использованием традиционных методов.	1
1111	371	The shop specializes in handmade ceramica.	Магазин специализируется на ручной керамике.	1
1112	371	Ceramica from this region is known for its quality.	Керамика из этого региона известна своим качеством.	1
1113	371	She collects ceramica from around the world.	Она собирает керамику со всего мира.	1
1114	372	The sculptor molded the clay into a beautiful vase.	Скульптор слепил из глины красивую вазу.	1
1115	372	They dug up clay from the riverbank.	Они выкопали глину с берега реки.	1
1116	372	The pottery is made from high-quality clay.	Керамика изготовлена из высококачественной глины.	1
1117	373	They used wax to seal the envelope.	Они использовали воск, чтобы запечатать конверт.	1
1118	373	The candle was made of beeswax.	Свеча была сделана из пчелиного воска.	1
1119	373	He polished the car with wax to make it shine.	Он натер машину воском, чтобы она блестела.	1
1120	374	The bulk of the work was completed ahead of schedule.	Основная часть работы была завершена досрочно.	1
1121	374	He bought the items in bulk to save money.	Он купил товары оптом, чтобы сэкономить деньги.	1
1122	374	The bulk of the population lives in urban areas.	Основная часть населения живет в городских районах.	1
1123	375	The overwhelming majority voted in favor of the proposal.	Подавляющее большинство проголосовало за предложение.	1
1124	375	She felt an overwhelming sense of relief.	Она почувствовала подавляющее чувство облегчения.	1
1384	462	The flag represents the country’s values.	Флаг представляет ценности страны.	1
1125	375	The evidence against him was overwhelming.	Доказательства против него были подавляющими.	1
1126	376	The Grand Canyon is an awe-inspiring sight.	Гранд-Каньон — это зрелище, внушающее трепет.	1
1127	376	The performance was awe-inspiring in its brilliance.	Выступление было внушающим трепет своим блеском.	1
1128	376	They visited an awe-inspiring cathedral in Europe.	Они посетили внушающий трепет собор в Европе.	1
1129	377	She broke into a sweat during the intense workout.	Она вспотела во время интенсивной тренировки.	1
1130	377	His forehead was covered in sweat from the heat.	Его лоб был покрыт потом от жары.	1
1131	377	The sweat dripped down his face as he ran.	Пот стекал по его лицу, когда он бежал.	1
1132	378	He started to sweat as the pressure increased.	Он начал потеть, как только давление возросло.	1
1133	378	She sweated through her shirt during the long hike.	Она вспотела насквозь во время долгого похода.	1
1134	378	The athlete sweats a lot during training.	Спортсмен много потеет во время тренировки.	1
1135	379	The consumption of sugar has increased over the years.	Потребление сахара увеличилось за последние годы.	1
1136	379	Fuel consumption is a major concern for car manufacturers.	Потребление топлива является серьезной проблемой для автопроизводителей.	1
1137	379	The report focuses on the consumption of natural resources.	Отчет сосредоточен на потреблении природных ресурсов.	1
1138	380	He was always boasting about his achievements.	Он всегда хвастался своими достижениями.	1
1139	380	Boasting about wealth can be seen as arrogance.	Хвастовство богатством может восприниматься как высокомерие.	1
1140	380	She couldn't resist boasting about her new car.	Она не смогла удержаться от хвастовства своей новой машиной.	1
1141	381	His perspective on life changed after the accident.	Его взгляд на жизнь изменился после аварии.	1
1142	381	The artist used perspective to create depth in the painting.	Художник использовал перспективу, чтобы создать глубину на картине.	1
1143	381	They considered the problem from a different perspective.	Они рассмотрели проблему с другой точки зрения.	1
1144	382	They wound up the meeting after two hours.	Они завершили встречу через два часа.	1
1145	382	He wound up his business and moved abroad.	Он завершил свой бизнес и переехал за границу.	1
1146	382	If you don't pay your bills, you could wind up in debt.	Если вы не будете оплачивать счета, то можете оказаться в долгах.	1
1147	383	The hurricane devastated the coastal town.	Ураган разрушил прибрежный город.	1
1148	383	The news of his loss devastated her.	Новость о его потере поразила её.	1
1149	383	The fire devastated the entire neighborhood.	Пожар разрушил весь район.	1
1150	384	The plague spread rapidly throughout the city.	Чума быстро распространилась по городу.	1
1151	384	The region was devastated by a plague of locusts.	Регион был опустошен нашествием саранчи.	1
1152	384	She was plagued by doubts about her decision.	Её мучили сомнения в правильности её решения.	1
1153	385	She took over the project after the manager left.	Она взяла на себя проект после того, как менеджер ушел.	1
1154	385	The company plans to take over its smaller competitor.	Компания планирует поглотить своего меньшего конкурента.	1
1155	385	He took over as CEO last year.	Он занял пост генерального директора в прошлом году.	1
1156	386	She was the sole survivor of the crash.	Она была единственной, кто выжил в аварии.	1
1157	386	He was the sole heir to the family fortune.	Он был единственным наследником семейного состояния.	1
1158	386	The sole purpose of the meeting was to finalize the contract.	Единственной целью встречи было завершение контракта.	1
1159	387	Her hard work led to rapid advancement in her career.	Её упорный труд привел к быстрому продвижению в карьере.	1
1160	387	The advancement of technology has changed the world.	Развитие технологий изменило мир.	1
1161	387	They focused on the advancement of their goals.	Они сосредоточились на продвижении своих целей.	1
1162	388	Sudoriferous glands are responsible for sweat production.	Потовые железы отвечают за производство пота.	1
1163	388	The doctor explained the function of sudoriferous glands.	Доктор объяснил функцию потовых желез.	1
1164	388	Excessive activity of sudoriferous glands can lead to hyperhidrosis.	Чрезмерная активность потовых желез может привести к гипергидрозу.	1
1165	389	Sebaceous glands produce oil to keep the skin hydrated.	Сальные железы производят масло, чтобы поддерживать кожу увлажненной.	1
1166	389	Overactive sebaceous glands can cause acne.	Чрезмерная активность сальных желез может вызвать акне.	1
1167	389	Sebaceous glands are found throughout the body.	Сальные железы находятся по всему телу.	1
1168	390	Ceruminous glands produce earwax.	Серные железы производят ушную серу.	1
1169	390	Blockage of ceruminous glands can lead to ear problems.	Закупорка серных желез может привести к проблемам с ушами.	1
1170	390	Ceruminous glands are located in the ear canal.	Серные железы находятся в слуховом проходе.	1
1171	391	Mammary glands are responsible for milk production in mammals.	Молочные железы отвечают за производство молока у млекопитающих.	1
1172	391	The development of mammary glands is influenced by hormones.	Развитие молочных желез зависит от гормонов.	1
1173	391	Mammary glands are present in both males and females, but are more developed in females.	Молочные железы присутствуют как у мужчин, так и у женщин, но у женщин они более развиты.	1
1174	392	She can't help but smile when she sees her baby.	Она не может не улыбаться, когда видит своего ребенка.	1
1175	392	I can't help but feel worried about the future.	Я не могу не волноваться о будущем.	1
1176	392	He can't help but admire her dedication.	Он не может не восхищаться её преданностью.	1
1177	393	The meaning of the text was obscure to many readers.	Смысл текста был неясен для многих читателей.	1
1178	393	The details of the plan remain obscure.	Подробности плана остаются неясными.	1
1179	393	The origin of the artifact is obscure.	Происхождение артефакта неясно.	1
1180	394	The company adopted a streamlined process for product development.	Компания приняла хорошо налаженный процесс разработки продукции.	1
1181	394	The car's streamlined design reduces air resistance.	Обтекаемый дизайн автомобиля снижает сопротивление воздуха.	1
1182	394	They streamlined their operations to increase efficiency.	Они упростили свои операции, чтобы повысить эффективность.	1
1183	395	She showed great affection for her family.	Она проявляла большую привязанность к своей семье.	1
1184	395	His affection for her grew stronger over time.	Его привязанность к ней со временем стала сильнее.	1
1185	395	Affection between siblings is often lifelong.	Привязанность между братьями и сестрами часто длится всю жизнь.	1
1186	396	The child formed a strong attachment to her teddy bear.	Ребенок сильно привязался к своему плюшевому медведю.	1
1187	396	She felt a deep attachment to her hometown.	Она чувствовала глубокую привязанность к своему родному городу.	1
1188	396	Attachment to material possessions can be problematic.	Привязанность к материальным ценностям может быть проблематичной.	1
1189	397	He felt a deep longing for his childhood home.	Он чувствовал глубокую тоску по своему детскому дому.	1
1190	397	Her longing for adventure led her to travel the world.	Её тоска по приключениям привела её к путешествиям по миру.	1
1191	397	The letter expressed a longing to see old friends again.	В письме выражалась тоска по старым друзьям.	1
1192	398	They made an arrangement to meet at the café.	Они договорились встретиться в кафе.	1
1193	398	The flowers were placed in a beautiful arrangement.	Цветы были расположены в красивой композиции.	1
1194	398	The seating arrangement was carefully planned.	Рассадка гостей была тщательно спланирована.	1
1195	399	The concert will be held at a large venue downtown.	Концерт пройдет на большой площадке в центре города.	1
1196	399	They chose a wedding venue with a stunning view.	Они выбрали место для свадьбы с потрясающим видом.	1
1197	399	The venue can accommodate up to 500 people.	Площадка может вместить до 500 человек.	1
1198	400	The dispute between the neighbors was resolved peacefully.	Спор между соседями был решен мирным путем.	1
1199	400	There was a dispute over the ownership of the land.	Был спор о праве собственности на землю.	1
1200	400	The company is involved in a legal dispute.	Компания участвует в судебном споре.	1
1201	401	She wore a pair of elegant earrings to the party.	Она надела пару элегантных сережек на вечеринку.	1
1202	401	The earrings were a gift from her grandmother.	Серьги были подарком от бабушки.	1
1203	401	She lost one of her earrings while dancing.	Она потеряла одну из сережек во время танца.	1
1204	402	His instinct told him something was wrong.	Его инстинкт подсказывал ему, что что-то не так.	1
1205	402	The motherly instinct is strong in many animals.	Материнский инстинкт силен у многих животных.	1
1206	402	He relied on his instincts to make the right decision.	Он полагался на свои инстинкты, чтобы принять правильное решение.	1
1207	403	The note was taped onto the door.	Записка была приклеена к двери.	1
1208	403	She taped the poster onto the wall.	Она приклеила плакат на стену.	1
1210	404	She spoke with confidence during the presentation.	Она говорила с уверенностью во время презентации.	1
1211	404	His confidence grew as he gained more experience.	Его уверенность росла по мере приобретения опыта.	1
1212	404	Confidence is key to success in any field.	Уверенность — ключ к успеху в любой области.	1
1213	405	The embers of the fire glowed softly in the dark.	Тлеющие угли огня мягко светились в темноте.	1
1214	405	He stirred the embers to keep the fire going.	Он пошевелил тлеющие угли, чтобы поддержать огонь.	1
1215	405	The campfire was reduced to glowing embers.	Костер превратился в тлеющие угли.	1
1216	406	The snake bared its fangs before striking.	Змея обнажила свои клыки перед нападением.	1
1217	406	The vampire's fangs were sharp and deadly.	Клыки вампира были острыми и смертоносными.	1
1218	406	The wolf's fangs sank into the prey's flesh.	Клыки волка вонзились в плоть добычи.	1
1219	407	The application of this theory is widespread in science.	Применение этой теории широко распространено в науке.	1
1220	407	He studied the practical application of new technology.	Он изучал практическое применение новой технологии.	1
1221	407	The application of the law was questioned in this case.	Применение закона в этом случае было поставлено под сомнение.	1
1222	408	He was known as a pseudo-intellectual by his peers.	Его считали псевдоинтеллектуалом среди сверстников.	1
1223	408	The pseudo-scientific claims were quickly debunked.	Псевдонаучные утверждения были быстро опровергнуты.	1
1224	408	She wrote under a pseudo name to protect her identity.	Она писала под псевдонимом, чтобы защитить свою личность.	1
1225	409	They advanced toward the enemy's position.	Они продвигались к позиции противника.	1
1226	409	The technology has advanced significantly in recent years.	Технология значительно продвинулась в последние годы.	1
1227	409	The team is working to advance the project timeline.	Команда работает над продвижением сроков проекта.	1
1228	410	The business continues to thrive despite the recession.	Бизнес продолжает процветать, несмотря на рецессию.	1
1229	410	Children thrive in a loving environment.	Дети процветают в любящей обстановке.	1
1230	410	The plant thrived in the sunny garden.	Растение процветало в солнечном саду.	1
1231	411	The town prospered thanks to the new industry.	Город процветал благодаря новой промышленности.	1
1232	411	They hope to prosper in their new business venture.	Они надеются процветать в своем новом бизнес-предприятии.	1
1233	411	Hard work and determination will help you prosper.	Трудолюбие и решимость помогут вам процветать.	1
1234	412	The union of the two companies created a powerful conglomerate.	Союз двух компаний создал мощный конгломерат.	1
1235	412	They formed a union to fight for workers' rights.	Они создали союз для борьбы за права рабочих.	1
1236	412	The union between the countries was based on mutual respect.	Союз между странами был основан на взаимном уважении.	1
1237	413	The crystalline structure of the mineral was beautiful.	Кристаллическая структура минерала была красива.	1
1238	413	They studied the crystalline formations in the cave.	Они изучали кристаллические образования в пещере.	1
1239	413	Crystalline water flowed from the mountain spring.	Кристаллическая вода текла из горного источника.	1
1240	414	She maintained a steady pace throughout the race.	Она поддерживала устойчивый темп на протяжении всей гонки.	1
1241	414	The steady growth of the company is impressive.	Устойчивый рост компании впечатляет.	1
1242	414	He kept a steady hand while performing the surgery.	Он держал устойчивую руку во время операции.	1
1243	415	The doctor examined the tissue sample under a microscope.	Врач изучил образец ткани под микроскопом.	1
1244	415	Scar tissue formed around the wound.	Вокруг раны образовалась рубцовая ткань.	1
1245	415	They donated tissue for medical research.	Они пожертвовали ткани для медицинских исследований.	1
1246	416	He believed it was his fate to become a musician.	Он верил, что его судьба — стать музыкантом.	1
1247	416	They met by chance, but it felt like fate.	Они встретились случайно, но это казалось судьбой.	1
1248	416	Fate has a way of surprising us when we least expect it.	Судьба умеет удивлять нас, когда мы меньше всего этого ожидаем.	1
1249	417	She sought her parents' approval before making the decision.	Она искала одобрения родителей, прежде чем принять решение.	1
1250	417	The project received approval from the board of directors.	Проект получил одобрение совета директоров.	1
1251	417	His plan was met with unanimous approval.	Его план был встречен с единодушным одобрением.	1
1252	418	She achieved fame as a talented actress.	Она достигла славы как талантливая актриса.	1
1253	418	His fame spread across the country after the publication of his book.	Его слава распространилась по всей стране после публикации его книги.	1
1254	418	The artist's fame grew rapidly after the exhibition.	Слава художника быстро росла после выставки.	1
1255	419	The foundation of the building was made of stone.	Основание здания было сделано из камня.	1
1256	419	She laid the foundation for a successful career.	Она заложила основу для успешной карьеры.	1
1257	419	The charity provides a strong foundation for community support.	Благотворительная организация обеспечивает надежную основу для поддержки сообщества.	1
1258	420	He felt like an outsider in his new school.	Он чувствовал себя человеком со стороны в новой школе.	1
1259	420	As an outsider, she had a unique perspective on the situation.	Как человек со стороны, у нее был уникальный взгляд на ситуацию.	1
1260	420	The company was wary of outsiders influencing their decisions.	Компания опасалась, что люди со стороны будут влиять на их решения.	1
1261	421	The contract contained a lot of boilerplate language.	Контракт содержал много шаблонных формулировок.	1
1262	421	He used boilerplate code to save time on repetitive tasks.	Он использовал шаблонный код, чтобы сэкономить время на повторяющихся задачах.	1
1263	421	Boilerplate statements filled the company's annual report.	Шаблонные заявления заполнили годовой отчет компании.	1
1264	422	He is an alumnus of the university.	Он выпускник этого университета.	1
1265	422	The alumnus returned to give a lecture to the students.	Выпускник вернулся, чтобы прочитать лекцию студентам.	1
1266	422	The school is proud of its famous alumnus.	Школа гордится своим известным выпускником.	1
1267	423	The company offered a bonus to offset the inconvenience.	Компания предложила бонус, чтобы компенсировать неудобства.	1
1268	423	He planted trees to offset his carbon footprint.	Он посадил деревья, чтобы компенсировать свой углеродный след.	1
1269	423	The tax offset helped reduce his overall expenses.	Налоговая компенсация помогла сократить его общие расходы.	1
1270	424	The concerns of the community were addressed at the meeting.	Интересы сообщества были рассмотрены на собрании.	1
1271	424	She voiced her concerns about the new policy.	Она высказала свои опасения по поводу новой политики.	1
1272	424	His concerns were mainly about the project's timeline.	Его интересы в основном касались сроков проекта.	1
1273	425	All that is left to do is sign the contract.	Все, что осталось сделать, это подписать контракт.	1
1274	425	After finishing the report, all that is left to do is submit it.	После завершения отчета все, что осталось сделать, это отправить его.	1
1275	425	All that is left to do now is wait for the results.	Все, что осталось сделать, это дождаться результатов.	1
1276	426	They adopted a child from another country.	Они усыновили ребенка из другой страны.	1
1277	426	The adopted policies were implemented immediately.	Принятые политики были немедленно введены в действие.	1
1278	426	She felt loved by her adopted family.	Она чувствовала себя любимой в своей приемной семье.	1
1279	427	This belief is prevalent in many cultures.	Это убеждение распространено во многих культурах.	1
1280	427	The prevalent use of smartphones has changed communication.	Широкое использование смартфонов изменило общение.	1
1281	427	The disease was prevalent in rural areas.	Эта болезнь была распространена в сельских районах.	1
1282	428	They used social media to propagate their ideas.	Они использовали социальные сети для распространения своих идей.	1
1283	428	The plant can propagate quickly in this environment.	Растение может быстро распространяться в этой среде.	1
1284	428	Misinformation can propagate rapidly online.	Дезинформация может быстро распространяться в интернете.	1
1285	429	She felt frustrated by the lack of progress.	Она чувствовала себя разочарованной из-за отсутствия прогресса.	1
1286	429	He was frustrated with the constant delays.	Он был разочарован постоянными задержками.	1
1287	429	The frustrated team worked late to meet the deadline.	Разочарованная команда работала допоздна, чтобы уложиться в срок.	1
1288	430	The current workload is unsustainable.	Текущая рабочая нагрузка непосильна.	1
1289	430	Their business model is unsustainable in the long run.	Их бизнес-модель непосильна в долгосрочной перспективе.	1
1290	430	The environmental impact of the project was unsustainable.	Экологические последствия проекта были непосильными.	1
1291	431	The villain's actions were monstrously cruel.	Действия злодея были чудовищно жестоки.	1
1292	431	He was monstrously large, towering over everyone else.	Он был чудовищно огромен, возвышаясь над всеми остальными.	1
1293	431	The situation was handled monstrously, causing widespread outrage.	Ситуация была чудовищно плохо решена, вызвав всеобщее возмущение.	1
1294	432	He decided to bare his soul to her.	Он решил обнажить перед ней свою душу.	1
1295	432	The tree's branches were bare after the storm.	Ветви дерева были обнажены после шторма.	1
1296	432	She bared her teeth in a fierce snarl.	Она обнажила зубы в яростном рыке.	1
1297	433	He walked barefoot on the bare ground.	Он шел босиком по голой земле.	1
1298	433	The room was bare, with no furniture in it.	Комната была пустой, без мебели.	1
1299	433	Her bare arms were cold in the winter wind.	Ее голые руки мерзли на зимнем ветру.	1
1300	434	Her dedication to her work is admirable.	Ее преданность работе вызывает восхищение.	1
1301	434	He showed great dedication in completing the project.	Он проявил большую преданность в завершении проекта.	1
1302	434	The book's dedication was to her parents.	Посвящение в книге было адресовано ее родителям.	1
1303	435	You must be present at the meeting.	Вы должны присутствовать на собрании.	1
1304	435	She was present during the entire event.	Она присутствовала на всем мероприятии.	1
1305	435	He liked to be present in the moment, enjoying life.	Ему нравилось быть в настоящем, наслаждаясь жизнью.	1
1306	436	The sponge can absorb a lot of water.	Губка может поглотить много воды.	1
1307	436	He tried to absorb all the information from the lecture.	Он пытался поглотить всю информацию с лекции.	1
1308	436	The material is designed to absorb sound.	Материал предназначен для поглощения звука.	1
1309	437	Plants need nutrients to grow.	Растениям нужны полезные вещества для роста.	1
1310	437	The soil is rich in nutrients.	Почва богата полезными веществами.	1
1311	437	Your body requires nutrients from food to stay healthy.	Вашему организму нужны полезные вещества из пищи, чтобы оставаться здоровым.	1
1312	438	The intestines play a key role in digestion.	Кишечник играет ключевую роль в пищеварении.	1
1313	438	The doctor examined his intestines for any blockages.	Доктор обследовал его кишечник на наличие препятствий.	1
1314	438	A healthy diet is important for maintaining good intestinal health.	Здоровая диета важна для поддержания здоровья кишечника.	1
1315	439	It's important to chew your food properly.	Важно тщательно пережевывать пищу.	1
1316	439	He was chewing gum while waiting for the bus.	Он жевал жвачку, ожидая автобус.	1
1317	439	The dog loves to chew on his toys.	Собака любит жевать свои игрушки.	1
1318	440	The food goes into the stomach for digestion.	Еда попадает в желудок для пищеварения.	1
1319	440	Once the paperwork is signed, it goes into the system.	Как только документы подписаны, они попадают в систему.	1
1320	440	After the meeting, the plan goes into effect.	После встречи план вступает в силу.	1
1321	441	We gathered around the campfire to tell stories.	Мы собрались вокруг костра, чтобы рассказывать истории.	1
1322	441	The campfire crackled warmly in the night.	Костер тепло потрескивал ночью.	1
1323	441	They roasted marshmallows over the campfire.	Они жарили зефир на костре.	1
1324	442	He used a spoon to stir the soup.	Он использовал ложку, чтобы перемешать суп.	1
1325	442	The news stirred emotions in the community.	Эти новости вызвали эмоции в сообществе.	1
1326	442	The wind stirred the leaves on the ground.	Ветер взволновал листья на земле.	1
1327	443	He used glue to stick the pieces together.	Он использовал клей, чтобы склеить детали.	1
1328	443	The note was stuck to the fridge door.	Заметка была приклеена к дверце холодильника.	1
1329	443	The label won't stick to the wet surface.	Этикетка не приклеивается к мокрой поверхности.	1
1330	444	They plan to occupy the building by next month.	Они планируют занять здание к следующему месяцу.	1
1331	444	The army occupied the town without resistance.	Армия заняла город без сопротивления.	1
1332	444	His thoughts were occupied with work all day.	Его мысли весь день были заняты работой.	1
1333	445	Her lips were chapped from the cold.	Ее губы потрескались от холода.	1
1334	445	He kissed her gently on the lips.	Он нежно поцеловал ее в губы.	1
1335	445	The lipstick highlighted her full lips.	Помада подчеркивала ее полные губы.	1
1336	446	They visited a hot spring during their vacation.	Они посетили горячий источник во время отпуска.	1
1337	446	The hot spring was a natural wonder in the area.	Горячий источник был природным чудом в этом районе.	1
1338	446	Bathing in a hot spring is relaxing and therapeutic.	Купание в горячем источнике расслабляет и оказывает лечебное действие.	1
1339	447	The weather was gloomy all week.	Погода была унылой всю неделю.	1
1340	447	His outlook on life became increasingly gloomy.	Его взгляд на жизнь становился все более угрюмым.	1
1341	447	The room felt gloomy with the curtains drawn.	Комната казалась унылой с закрытыми шторами.	1
1342	448	She had a sense of foreboding before the storm.	У нее было предчувствие перед бурей.	1
1343	448	His foreboding words made everyone uneasy.	Его предчувственные слова заставили всех почувствовать тревогу.	1
1344	448	There was a foreboding silence in the room.	В комнате царила предчувственная тишина.	1
1345	449	The news was grim and left everyone in shock.	Новости были мрачными и шокировали всех.	1
1346	449	His expression was grim as he delivered the bad news.	Его выражение лица было мрачным, когда он сообщил плохие новости.	1
1347	449	The future looked grim due to the economic crisis.	Будущее казалось мрачным из-за экономического кризиса.	1
1348	450	The caption under the photo was misleading.	Подпись под фотографией была вводящей в заблуждение.	1
1349	450	She added a humorous caption to her Instagram post.	Она добавила юмористическую подпись к своему посту в Instagram.	1
1350	450	The caption explained the historical context of the image.	Подпись объясняла исторический контекст изображения.	1
1351	451	He used a scale to weigh the ingredients.	Он использовал весы, чтобы взвесить ингредиенты.	1
1352	451	The decision weighed heavily on his mind.	Решение тяжело давило на его разум.	1
1353	451	She weighed her options carefully before choosing.	Она тщательно взвешивала свои варианты, прежде чем сделать выбор.	1
1354	452	I don't live in that city anymore.	Я больше не живу в этом городе.	1
1355	452	She doesn't work there anymore.	Она больше там не работает.	1
1356	452	He doesn't care about it anymore.	Ему больше это не интересно.	1
1357	453	At first glance, the task seemed easy.	На первый взгляд задача казалась легкой.	1
1358	453	The painting appeared simple at first glance, but it was very detailed.	Картина казалась простой на первый взгляд, но была очень детализированной.	1
1359	453	At first glance, the proposal seemed perfect.	На первый взгляд предложение казалось идеальным.	1
1360	454	She insisted on staying late to finish the work.	Она настояла на том, чтобы задержаться допоздна, чтобы закончить работу.	1
1361	454	He insisted on paying for dinner.	Он настоял на том, чтобы заплатить за ужин.	1
1362	454	They insisted on being included in the meeting.	Они настояли на том, чтобы их включили в собрание.	1
1363	455	He treated his subordinates with respect.	Он относился к своим подчиненным с уважением.	1
1364	455	The subordinate followed the manager's instructions.	Подчиненный следовал указаниям менеджера.	1
1365	455	She was promoted from a subordinate role to a leadership position.	Ее повысили с подчиненной должности до руководящей.	1
1366	456	I'm counting on you to help me with this project.	Я рассчитываю на тебя, чтобы помочь мне с этим проектом.	1
1367	456	I'm counting on good weather for the picnic.	Я рассчитываю на хорошую погоду для пикника.	1
1368	456	I'm counting on your support during the meeting.	Я рассчитываю на твою поддержку во время собрания.	1
1369	457	The book is worth reading.	Книгу стоит прочитать.	1
1370	457	It's not worth arguing over something so trivial.	Не стоит спорить о чем-то таком незначительном.	1
1371	457	The investment was worth the risk.	Инвестиция стоила риска.	1
1372	458	The project ran over budget due to unexpected costs.	Проект превысил бюджет из-за неожиданных издержек.	1
1373	458	They calculated the total costs before starting the project.	Они подсчитали общие издержки перед началом проекта.	1
1374	458	The costs of living in the city are high.	Издержки на жизнь в городе высоки.	1
1375	459	He committed to finishing the project on time.	Он обязался закончить проект в срок.	1
1376	459	She committed to a daily exercise routine.	Она взяла на себя обязательство заниматься спортом каждый день.	1
1377	459	The company committed to reducing its carbon footprint.	Компания взяла на себя обязательство сократить углеродный след.	1
1378	460	He had to drag the heavy suitcase up the stairs.	Ему пришлось тащить тяжелый чемодан по лестнице.	1
1379	460	She dragged the chair across the room.	Она тащила стул через комнату.	1
1380	460	They dragged the boat to the shore.	Они тащили лодку к берегу.	1
1381	461	He reset the computer after it crashed.	Он сбросил компьютер после сбоя.	1
1385	462	He was chosen to represent the company at the conference.	Он был выбран для представления компании на конференции.	1
1386	462	The statue represents an important historical figure.	Статуя представляет важного исторического деятеля.	1
1387	463	We walked along the shore at sunset.	Мы гуляли по берегу на закате.	1
1388	463	The boat reached the shore safely.	Лодка благополучно добралась до берега.	1
1389	463	The shore was lined with smooth pebbles.	Берег был усыпан гладкими камнями.	1
1390	464	They drove along the coast, enjoying the view.	Они ехали вдоль побережья, наслаждаясь видом.	1
1391	464	The coast was dotted with small fishing villages.	Побережье было усеяно маленькими рыбацкими деревнями.	1
1392	464	A storm was approaching the coast.	Шторм приближался к побережью.	1
1393	465	He had a terrible hangover after the party.	У него было ужасное похмелье после вечеринки.	1
1394	465	She spent the day recovering from a hangover.	Она провела день, приходя в себя после похмелья.	1
1395	465	A hangover can last for several hours or even a full day.	Похмелье может длиться несколько часов или даже целый день.	1
1396	466	They worked in the coal mine for years.	Они работали в угольном руднике много лет.	1
1397	466	The mine was shut down due to safety concerns.	Рудник был закрыт из-за опасений по поводу безопасности.	1
1398	466	He discovered a gold mine on his property.	Он обнаружил золотой рудник на своей собственности.	1
1399	467	They used shovels to dig a hole for the tree.	Они использовали лопаты, чтобы выкопать яму для дерева.	1
1400	467	The workers carried shovels over their shoulders.	Рабочие несли лопаты на плечах.	1
1401	467	He bought new shovels for the garden.	Он купил новые лопаты для сада.	1
1402	468	The labour was hard but rewarding.	Труд был тяжелым, но вознаграждающим.	1
1403	468	They provided cheap labour for the construction project.	Они предоставили дешевую рабочую силу для строительного проекта.	1
1404	468	Labour unions fought for workers' rights.	Профсоюзы боролись за права рабочих.	1
1405	469	The content of the book was fascinating.	Содержание книги было захватывающим.	1
1406	469	She reviewed the contents of the box.	Она проверила содержимое коробки.	1
1407	469	The contents of the email were confidential.	Содержание письма было конфиденциальным.	1
1408	470	He noticed the mistake just for a moment.	Он заметил ошибку всего на мгновение.	1
1409	470	She noticed the change in his behavior just for an instant.	Она заметила изменение в его поведении всего на мгновение.	1
1410	470	I noticed it just for the sake of curiosity.	Я заметил это просто из любопытства.	1
1411	471	They decided to look elsewhere for a solution.	Они решили искать решение в другом месте.	1
1412	471	The event was moved elsewhere due to the weather.	Мероприятие было перенесено в другое место из-за погоды.	1
1413	471	The treasure was hidden elsewhere on the island.	Сокровище было спрятано в другом месте на острове.	1
1414	472	She was known for her busty figure.	Ее знали за пышные формы.	1
1415	472	The character in the comic was depicted as busty.	Персонаж в комиксе был изображен пышногрудой.	1
1416	472	The dress was designed to accentuate a busty silhouette.	Платье было разработано, чтобы подчеркнуть пышный силуэт.	1
1417	473	They split the cake apart to share it.	Они разделили торт, чтобы поделиться им.	1
1418	473	The earthquake split the ground apart.	Землетрясение разделило землю.	1
1419	473	He split the team apart for the new project.	Он разделил команду для нового проекта.	1
1420	474	The child held his tummy after eating too much.	Ребенок держался за животик после того, как переел.	1
1421	474	She has a flat tummy from all the exercise.	У нее плоский животик благодаря упражнениям.	1
1422	474	He tickled the baby's tummy, making her laugh.	Он пощекотал животик ребенка, заставив его смеяться.	1
1423	475	The gipsy woman told his fortune.	Цыганка предсказала ему судьбу.	1
1424	475	They saw a group of gypsies traveling through the town.	Они видели группу цыган, проезжающих через город.	1
1425	475	The music had a gipsy flair to it.	Музыка имела цыганский колорит.	1
1426	476	He was known as a brawler in his youth.	В молодости его знали как драчливого человека.	1
1427	476	The brawler was quickly subdued by the police.	Драчун был быстро усмирен полицией.	1
1428	476	The tavern was a common place for brawlers to gather.	Таверна была обычным местом для сборищ скандалистов.	1
1429	477	He was seen as the redeemer of the people.	Его считали спасителем народа.	1
1430	477	The redeemer figure is common in many religions.	Фигура спасителя распространена во многих религиях.	1
1431	477	The town's redeemer was honored with a statue.	Городского спасителя увековечили в статуе.	1
1432	478	His valor in battle earned him many medals.	Его доблесть в бою принесла ему множество медалей.	1
1433	478	She was admired for her valor during the crisis.	Ее восхищались за доблесть во время кризиса.	1
1434	478	The story of his valor became legendary.	История его доблести стала легендарной.	1
1435	479	The soldiers were trained to obey orders without question.	Солдаты были обучены подчиняться приказам без вопросов.	1
1436	479	He refused to obey the unjust laws.	Он отказался подчиняться несправедливым законам.	1
1437	479	Children are taught to obey their parents.	Детей учат повиноваться родителям.	1
1438	480	One thing is for sure, we need to act quickly.	Одно можно сказать точно: нам нужно действовать быстро.	1
1439	480	It's for sure that they will support the plan.	Это точно, что они поддержат план.	1
1440	480	The outcome is for sure, there's no doubt about it.	Результат точно ясен, в этом нет никаких сомнений.	1
1441	481	They discovered a large deposit of gold.	Они обнаружили большое месторождение золота.	1
1442	481	The oil deposit was deep underground.	Месторождение нефти находилось глубоко под землей.	1
1443	481	He invested money in a high-interest deposit account.	Он вложил деньги в депозитный счет с высоким процентом.	1
1444	482	They built a raft to cross the river.	Они построили плот, чтобы пересечь реку.	1
1445	482	The raft was swept away by the current.	Плот унесло течением.	1
1446	482	He spent hours floating on the raft in the lake.	Он провел несколько часов, дрейфуя на плоту в озере.	1
1447	483	They buried the treasure in the backyard.	Они закопали сокровище на заднем дворе.	1
1448	483	He was buried in a small cemetery near the village.	Его похоронили на маленьком кладбище возле деревни.	1
1449	483	She buried her face in her hands, crying.	Она уткнулась лицом в ладони, плача.	1
1450	484	He smeared the bread with butter.	Он намазал хлеб маслом.	1
1451	484	The kids smeared paint all over the walls.	Дети размазали краску по всем стенам.	1
1452	484	She smeared her face with sunscreen before going out.	Она намазала лицо солнцезащитным кремом перед выходом на улицу.	1
1453	485	He placed the coin in the palm of her hand.	Он положил монету в ее ладонь.	1
1454	485	She held the delicate flower in her palm.	Она держала хрупкий цветок на ладони.	1
1455	485	The palm trees swayed in the tropical breeze.	Пальмы покачивались на тропическом бризе.	1
1456	486	The outer layer of the earth is called the crust.	Внешний слой земли называется корой.	1
1457	486	The building's outer walls were damaged in the storm.	Внешние стены здания были повреждены в шторм.	1
1458	486	She wore an outer jacket over her clothes.	Она надела верхнюю куртку поверх одежды.	1
1459	487	The equator divides the Earth into the Northern and Southern Hemispheres.	Экватор делит Землю на Северное и Южное полушария.	1
1460	487	The climate near the equator is typically hot and humid.	Климат около экватора обычно жаркий и влажный.	1
1461	487	They traveled to a country near the equator for vacation.	Они отправились в страну, расположенную близ экватора, на каникулы.	1
1462	488	The North Pole is located at the top of the Earth.	Северный полюс расположен на вершине Земли.	1
1463	488	They set up a flagpole in the middle of the yard.	Они установили флагшток посреди двора.	1
1464	488	The tent was supported by a central pole.	Палатка поддерживалась центральным столбом.	1
1465	489	The city is located at a latitude of 40 degrees north.	Город расположен на широте 40 градусов северной широты.	1
1466	489	He studied the latitude and longitude of various locations.	Он изучал широту и долготу различных мест.	1
1467	489	The latitude of the region affects its climate.	Широта региона влияет на его климат.	1
1468	490	The prime meridian is at 0 degrees longitude.	Начальный меридиан находится на 0 градусах долготы.	1
1469	490	The ship's captain plotted their course by longitude.	Капитан корабля проложил их курс по долготе.	1
1470	490	Longitude and latitude are used to specify the exact location.	Долгота и широта используются для указания точного местоположения.	1
1471	491	The discussion went off topic several times.	Обсуждение несколько раз отклонялось от темы.	1
1472	491	He brought the conversation back on topic after it drifted off.	Он вернул разговор на тему после того, как он ушел в сторону.	1
1473	491	Let's not go off topic and stay focused on the main issue.	Давайте не будем отклоняться от темы и сосредоточимся на главном вопросе.	1
1474	492	She asked him to get back to her as soon as possible.	Она попросила его связаться с ней как можно скорее.	1
1475	492	He tried to get back the money he had lost.	Он пытался вернуть деньги, которые потерял.	1
1476	492	The team needs to get back to their winning ways.	Команде нужно вернуться к своим победным путям.	1
1477	493	She whispered, "Sleep tight," before turning off the light.	Она прошептала: «Спокойной ночи», перед тем как выключить свет.	1
1478	493	"Sleep tight and don't let the bedbugs bite," he said jokingly.	«Спокойной ночи, не дайте клопам вас кусать», — пошутил он.	1
1479	493	They told their child to sleep tight after reading a bedtime story.	Они пожелали своему ребенку спокойной ночи после того, как прочитали сказку на ночь.	1
1480	494	The sun rises in the east.	Солнце встает на востоке.	1
1481	494	He raised his hand to ask a question.	Он поднял руку, чтобы задать вопрос.	1
1482	494	The company plans to raise prices next year.	Компания планирует поднять цены в следующем году.	1
1483	495	The letter conveyed his deepest sympathies.	Письмо передало его глубокие соболезнования.	1
1484	495	She used art to convey her emotions.	Она использовала искусство, чтобы передать свои эмоции.	1
1485	495	The message was conveyed clearly to all employees.	Сообщение было четко передано всем сотрудникам.	1
1486	496	She filed a complaint with the company.	Она подала жалобу в компанию.	1
1487	496	His complaint was about the poor service.	Его жалоба касалась плохого обслуживания.	1
1488	496	The complaint was handled quickly and efficiently.	Жалоба была рассмотрена быстро и эффективно.	1
1489	497	He made a desperate attempt to save the situation.	Он предпринял отчаянную попытку спасти ситуацию.	1
1490	497	She felt desperate after losing her job.	Она чувствовала себя отчаянной после потери работы.	1
1491	497	The desperate cry for help was heard by the neighbors.	Отчаянный крик о помощи услышали соседи.	1
1492	498	The earth's resources are finite.	Ресурсы земли конечны.	1
1493	498	He realized that time is finite and precious.	Он осознал, что время конечно и бесценно.	1
1494	498	The contract was for a finite period.	Контракт был на определенный срок.	1
1495	499	He took the trash out to the curb.	Он вынес мусор к обочине.	1
1496	499	She took out her frustration on her coworkers.	Она сорвала свое разочарование на коллегах.	1
1497	499	They took the dog out for a walk.	Они вывели собаку на прогулку.	1
1498	500	Can you wait a bit while I finish this?	Можешь подождать немного, пока я закончу это?	1
1499	500	He decided to wait a bit before making a decision.	Он решил немного подождать, прежде чем принять решение.	1
1500	500	Wait a bit, I'll be with you in a moment.	Подождите немного, я сейчас подойду.	1
1501	501	The dam was built to control the river flow.	Плотина была построена для контроля за течением реки.	1
1502	501	They visited the dam during their trip.	Они посетили плотину во время поездки.	1
1503	501	The dam burst, causing widespread flooding.	Плотина прорвалась, вызвав широкомасштабное наводнение.	1
1504	502	The beaver is known for building dams in rivers.	Бобр известен тем, что строит плотины в реках.	1
1505	502	They spotted a beaver near the lake.	Они заметили бобра у озера.	1
1506	502	The beaver's lodge was hidden in the reeds.	Домик бобра был спрятан в камышах.	1
1507	503	They packed extra clothes for the trip.	Они упаковали лишнюю одежду для поездки.	1
1508	503	The restaurant charged extra for the special ingredients.	Ресторан взял лишнюю плату за специальные ингредиенты.	1
1509	503	There was extra work to be done before the deadline.	Перед сроком нужно было сделать лишнюю работу.	1
1510	504	He grabbed a towel after his shower.	Он схватил полотенце после душа.	1
1511	504	The beach towel was spread out on the sand.	Пляжное полотенце было расстелено на песке.	1
1512	504	She used a towel to dry her hair.	Она использовала полотенце, чтобы высушить волосы.	1
1513	505	She had a collection of teddy bears.	У нее была коллекция плюшевых мишек.	1
1514	505	The child hugged his teddy bear tightly.	Ребенок крепко обнял своего плюшевого мишку.	1
1515	505	The teddy bear was a gift from her grandmother.	Плюшевый мишка был подарком от бабушки.	1
1516	506	Her curiosity led her to explore the abandoned house.	Ее любопытство привело ее к исследованию заброшенного дома.	1
1517	506	The child's curiosity was insatiable.	Любопытство ребенка было неутолимым.	1
1518	506	Curiosity drove him to learn more about the subject.	Любопытство заставило его узнать больше о предмете.	1
1519	507	He made her feel special with his kind words.	Он заставил ее чувствовать себя особенной своими добрыми словами.	1
1520	507	The news made everyone feel anxious.	Новости заставили всех почувствовать тревогу.	1
1521	507	The teacher's praise made the student feel proud.	Похвала учителя заставила ученика почувствовать гордость.	1
1522	508	He is the leading expert in his field.	Он ведущий эксперт в своей области.	1
1523	508	The company is leading the market in innovation.	Компания лидирует на рынке в области инноваций.	1
1524	508	She played a leading role in the project.	Она играла ведущую роль в проекте.	1
1525	509	The audience broke into applause at the end of the performance.	Зрители разразились аплодисментами в конце представления.	1
1526	509	She received loud applause for her speech.	Она получила громкие аплодисменты за свою речь.	1
1527	509	The applause echoed through the theater.	Аплодисменты эхом разнеслись по театру.	1
1528	510	He used a cloth to wipe the table.	Он использовал тряпку, чтобы протереть стол.	1
1529	510	The cloth was dirty after cleaning the floor.	Тряпка была грязной после уборки пола.	1
1530	510	She wrung out the wet cloth before using it again.	Она выжала мокрую тряпку перед повторным использованием.	1
1531	511	He was tired of being treated like a doormat by his friends.	Он устал от того, что друзья обращались с ним как с тряпкой.	1
1532	511	She refused to be a doormat in the relationship.	Она отказалась быть тряпкой в отношениях.	1
1533	511	Don't let people walk all over you like a doormat.	Не позволяй людям обращаться с тобой как с тряпкой.	1
1534	512	The material is highly absorbent, perfect for cleaning up spills.	Материал очень впитывающий, идеально подходит для уборки разливов.	1
1535	512	He bought absorbent towels for the kitchen.	Он купил впитывающие полотенца для кухни.	1
1536	512	The absorbent fabric was used to make diapers.	Впитывающая ткань использовалась для изготовления подгузников.	1
1537	513	The sponge can absorb a lot of water.	Губка может поглотить много воды.	1
1538	513	He tried to absorb all the information from the lecture.	Он пытался поглотить всю информацию с лекции.	1
1539	513	The material is designed to absorb sound.	Материал предназначен для поглощения звука.	1
1540	514	She tied the sticks into a bundle.	Она связала палочки в пучок.	1
1541	514	The bundle of newspapers was left on the doorstep.	Пучок газет оставили на пороге.	1
1542	514	He carried a bundle of clothes under his arm.	Он нес пучок одежды под мышкой.	1
1543	515	She gave him a bunch of flowers.	Она подарила ему пучок цветов.	1
1544	515	The keys were all on a bunch of rings.	Ключи были все на пучке колец.	1
1545	515	He ate a bunch of grapes.	Он съел пучок винограда.	1
1546	516	She filled the glass with water.	Она наполнила стакан водой.	1
1547	516	The room was filled with laughter.	Комната была наполнена смехом.	1
1548	516	He filled the box with old books.	Он наполнил коробку старыми книгами.	1
1549	517	The company has seen steady growth over the past year.	Компания наблюдала устойчивый рост за последний год.	1
1550	517	The plant's growth was stunted by lack of sunlight.	Рост растения был замедлен из-за недостатка солнечного света.	1
1551	517	There has been significant growth in the tech industry.	В технологической отрасли наблюдается значительный рост.	1
1552	518	The cat was agile, quickly dodging the obstacles.	Кот был проворным, быстро уклоняясь от препятствий.	1
1553	518	She moved with agile grace across the dance floor.	Она двигалась с проворной грацией по танцполу.	1
1554	518	The agile athlete easily completed the difficult routine.	Проворный спортсмен легко выполнил сложную программу.	1
1555	519	She excels in mathematics and science.	Она преуспевает в математике и науке.	1
1556	519	He excelled in his role as a leader.	Он преуспел в своей роли лидера.	1
1557	519	The team excelled beyond expectations in the competition.	Команда преуспела сверх ожиданий в соревнованиях.	1
1558	520	She went to the dental clinic for a check-up.	Она пошла в стоматологическую клинику на осмотр.	1
1559	520	He needed dental work to fix a cavity.	Ему потребовалась стоматологическая помощь для лечения кариеса.	1
1560	520	The dental hygienist cleaned her teeth thoroughly.	Стоматолог-гигиенист тщательно почистил ей зубы.	1
1561	521	The defining moment of his career was winning the award.	Определяющим моментом его карьеры стало получение награды.	1
1562	521	Her defining characteristic is her kindness.	Ее отличительной чертой является доброта.	1
1563	521	The defining feature of the house is its large windows.	Отличительной особенностью дома являются большие окна.	1
1564	522	He sought advice from his mentor.	Он искал совета у своего наставника.	1
1565	522	They sought shelter from the storm.	Они искали убежище от шторма.	1
1566	522	She sought a solution to the problem.	Она искала решение проблемы.	1
1567	523	The furniture won't fit in the small room.	Мебель не поместится в маленькой комнате.	1
1568	523	He tried to fit in with the new group.	Он пытался вписаться в новую группу.	1
1569	523	The suitcase barely fit in the trunk of the car.	Чемодан едва поместился в багажнике машины.	1
1570	524	The rules are as follows: no talking, no phones.	Правила заключаются в следующем: никаких разговоров, никаких телефонов.	1
1571	524	The instructions are as follows: mix the ingredients and bake.	Инструкции заключаются в следующем: смешайте ингредиенты и выпекайте.	1
1572	524	The schedule for the day is as follows: meeting, lunch, presentation.	График на день заключается в следующем: встреча, обед, презентация.	1
1573	525	He has been sober for three years.	Он трезв уже три года.	1
1574	525	She gave a sober assessment of the situation.	Она дала трезвую оценку ситуации.	1
1575	525	The sober reality of the situation was difficult to face.	Трезвая реальность ситуации была сложной для восприятия.	1
1576	526	He was disowned by his family after the scandal.	Он был отречен своей семьей после скандала.	1
1577	526	She decided to disown her past mistakes.	Она решила отречься от своих прошлых ошибок.	1
1578	526	The company disowned responsibility for the incident.	Компания отреклась от ответственности за инцидент.	1
1579	527	He accepted the offer out of politeness.	Он принял предложение из вежливости.	1
1580	527	She smiled out of politeness, even though she was annoyed.	Она улыбнулась из вежливости, хотя была раздражена.	1
1581	527	They stayed for dessert out of politeness.	Они остались на десерт из вежливости.	1
1582	528	He placed a bid on the painting at the auction.	Он сделал ставку на картину на аукционе.	1
1583	528	The highest bid won the item.	Самая высокая ставка выиграла предмет.	1
1584	528	She made a bid for the contract.	Она сделала ставку на контракт.	1
1585	529	He is responsible for managing the project.	Он отвечает за управление проектом.	1
1586	529	She is responsible for the team's success.	Она отвечает за успех команды.	1
1587	529	They are responsible for maintaining the equipment.	Они отвечают за обслуживание оборудования.	1
1588	530	Which of these books is your favorite?	Какой из этих книг твоя любимая?	1
1589	530	Which of them is going to the party?	Кто из них идет на вечеринку?	1
1590	530	Which of these tasks is the most important?	Какая из этих задач самая важная?	1
1591	531	The meat was tender and juicy.	Мясо было нежным и сочным.	1
1592	531	She gave him a tender smile.	Она подарила ему нежную улыбку.	1
1593	531	His touch was tender and comforting.	Его прикосновение было нежным и успокаивающим.	1
4	2	She offered a valuable insight into the problem.	Она предложила ценное понимание проблемы.	0
10	4	The insect used its mandibles to chew through the leaves.	Насекомое использовало свои жвалы, чтобы пережевать листья.	1
43	15	He gave precise instructions on how to complete the task.	Он дал точные инструкции по выполнению задания.	0
44	15	The measurement needs to be precise for the experiment to work.	Измерение должно быть точным, чтобы эксперимент удался.	0
85	29	Her diligence in her studies paid off with high grades.	Ее усердие в учебе окупилось высокими оценками.	3
91	31	The car's dashboard displays the speed and fuel level.	Приборная панель автомобиля показывает скорость и уровень топлива.	3
129	43	She tried not to interfere in her friend's decision.	Она старалась не вмешиваться в решение своего друга.	2
132	44	The violation of privacy rights is a serious issue.	Нарушение права на неприкосновенность частной жизни является серьезной проблемой.	2
173	58	Water was leaking from the pipe under the sink.	Вода просачивалась из трубы под раковиной.	2
177	59	The teacher reproached the students for not doing their homework.	Учитель упрекнул учеников за то, что они не сделали домашнее задание.	2
217	73	They acquired a new company to expand their business.	Они приобрели новую компанию для расширения своего бизнеса.	2
249	83	The committee will review the proposal next week.	Комитет пересмотрит предложение на следующей неделе.	2
263	88	The teacher posted the final grades online.	Учитель опубликовал окончательные оценки в Интернете.	2
266	89	He has worked in various fields throughout his career.	Он работал в различных областях на протяжении своей карьеры.	2
306	102	She digested the news slowly, trying to understand.	Она медленно переваривала новости, пытаясь понять.	2
332	111	The project will be delayed, so adjust your schedule accordingly.	Проект будет задержан, поэтому скорректируйте свое расписание соответственно.	2
348	116	The report elaborates on the key findings of the study.	В отчете подробно изложены ключевые выводы исследования.	3
\.


--
-- Data for Name: words; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.words (id, word_pron_stress, translation, rate) FROM stdin;
2	insight, ˈɪnˌsaɪt, ínsight	проницательность	2
3	mantis, ˈmæntɪs, mántis	богомол	2
7	sign, saɪn, sín	знак	2
8	make smth (adjective), meɪk ˈsʌmθɪŋ (æʤɪktɪv), make smth (adjéctive)	делать что-то	2
9	take over, teɪk ˈoʊvər, take óver	вступать на должность	2
10	a sight, ə saɪt, a sight	зрелище	2
11	alley, ˈæli, álleý	переулок	2
12	conquer, ˈkɒŋkər, cónquer	завоевывать	2
13	for all smth of the smth, fɔr ɔl ˈsʌmθɪŋ əv ðə ˈsʌmθɪŋ, for all smth of the smth	для всех (item of the sequence)	2
4	mandibles, ˈmændəbəlz, mándibles	жвало	2
5	spooling, ˈspuːlɪŋ, spóoling	наматывание	2
14	rear, rɪər, rèar	задний	2
15	precise, prɪˈsaɪs, précise	точный	2
16	precision, prɪˈsɪʒən, précision	точность	2
17	to swerve, swərv, swérve	свернуть	2
18	strictness, ˈstrɪktnəs, stríctness	строгость	2
20	ascending, əˈsɛndɪŋ, ascénding	восходящий	2
21	permutation, ˌpɜrmjuˈteɪʃən, permutatíon	перестановка	2
22	equation, ɪˈkweɪʒən, equátion	уравнение	2
23	enumeration, ɪˌnuməˈreɪʃən, enumerátion	перечисление	2
24	hierarchy, ˈhaɪərˌɑrki, hìerarchy	иерархия	2
25	to suffice, səˈfaɪs, suffíce	достаточно	2
27	diligent, ˈdɪlədʒənt, díligent	прилежный	2
26	decent, ˈdisənt, décènt	приличный	2
28	prominent, ˈprɒmɪnənt, próminent	видный	2
30	circuit, ˈsɜrkɪt, cìrcuit	схема	2
29	diligence, ˈdɪlədʒəns, díligence	усердие	2
31	dashboard, ˈdæʃˌbɔrd, dáshboard	приборная панель	2
32	descending, dɪˈsɛndɪŋ, descénding	нисходящий	2
33	setback, ˈsɛtbæk, sètback	неудача	2
34	severed, ˈsɛvərd, sévèred	разорванный	2
35	propose, prəˈpoʊz, propóse	предлагать	2
36	to outline, tə ˈaʊtˌlaɪn, outlíne	набросать	2
37	underrated, ˌʌndərˈreɪtɪd, underáted	недооцененный	2
38	to disrupt, dɪsˈrʌpt, disrúpt	нарушать	2
39	to disturb, dɪsˈtɜrb, distúrb	мешать	2
40	to distract, dɪˈstrækt, distráct	отвлекать	2
41	smash smth, smæʃ ˈsʌmθɪŋ, smásh smth	разбивать что-то	2
42	to destroy, dɪˈstrɔɪ, destróy	разрушать	2
43	to interfere, ˌɪntərˈfɪər, interfére	вмешиваться	2
44	violation, ˌvaɪəˈleɪʃən, violátion	нарушение	2
45	across smth, əˈkrɔs ˈsʌmθɪŋ, acróss smth	через что-то	2
46	to bounce back, baʊns bæk, bóunce back	прийти в норму	2
47	sterile, ˈstɛrəl, stérril	стерильный	2
48	proceed, prəˈsid, procéed	продолжать	2
49	continuous, kənˈtɪnjʊəs, contíinuous	непрерывный	2
50	harvest, ˈhɑrvəst, hárvest	урожай	2
51	crops, krɑps, cróps	урожай	2
52	peasant, ˈpɛzənt, péasant	крестьянин	2
54	cereals, ˈsɪriəlz, séréals	зерновые	2
55	backyard, ˈbækˌjɑrd, báckyárd	задний двор	2
56	patio, ˈpætiˌoʊ, pátio	внутренний дворик	2
57	garden, ˈɡɑrdən, gárden	сад	2
58	to leak, tə lik, leák	протекать, просачиваться	2
59	to reproach, rəˈproʊʧ, repróach	упрекать	2
60	a reproach, rəˈproʊʧ, repróach	упрек	2
61	got hit, ɡɑt hɪt, gót hít	получил удар	2
62	cool-headed, ˈkulˈhɛdəd, coól-héaded	хладнокровный	2
63	to stay calm, tə steɪ kɑm, stày calm	сохранять спокойствие	2
64	to contain, kənˈteɪn, contém	содержать	2
65	sober, ˈsoʊbər, sóber	трезвый	2
66	pothole, ˈpɑˌthoʊl, póthole	выбоина	2
67	pitfalls, ˈpɪtfɔlz, pítfáls	подводные камни	2
68	to be away, tə bi əˈweɪ, be áway	быть в отъезде	2
69	louse, laʊs, lóuse	вошь	2
70	tens, tɛnz, téz	десятки	2
71	to receive, rɪˈsiv, recéive	получать	2
53	locust, ˈloʊkəst, lócust	саранча	2
72	to gain, ɡeɪn, gáyn	получать	2
73	to acquire, əˈkwaɪər, acquíre	приобретать	2
74	derive, dɪˈraɪv, deríve	получать	2
75	to suspect, səˈspɛkt, suspéct	подозревать	2
77	to share, ʃɛr, sháre	делиться	2
78	narrow down, ˈnæroʊ daʊn, narrów down	сузить	2
79	drill down, drɪl daʊn, dríll down	углубляться	2
80	to bite, tə baɪt, bíte	кусать	2
81	to pursue, pərˈsu, pursúe	преследовать	2
117	badge, bæʤ, bádge	значок	1
118	to arouse, əˈraʊz, aróuse	возбуждать (intimacy)	1
119	grid, ɡrɪd, gríd	сетка	1
120	vertex, vertice, ˈvɜrtɛks, vértice	вершина	1
121	apex, ˈeɪpɛks, ápéx	вершина	1
122	along the edges, əˈlɔŋ ðə ɛʤɪz, alóng the edges	по краям	1
123	edge cases, ɛʤ ˈkeɪsɪz, édge cases	краевые случаи	1
124	acyclic, eɪˈsaɪklɪk, acýclic	ациклический	1
125	represent, ˌrɛprɪˈzɛnt, représsent	представлять	1
126	adjacency, əˈʤeɪsənsi, adjácency	смежность	1
127	to neigh, neɪ, nèigh	ржать	1
128	insight, ˈɪnˌsaɪt, ínsíght	понимание	1
129	to pollute, pəˈlut, pollúte	загрязнять	1
130	well-established, ˌwɛl ɪˈstæblɪʃt, well-éstaŕblished	хорошо установленный	1
131	puppet, ˈpʌpɪt, púppet	марионетка	1
132	dummy, ˈdʌmi, dúmmy	манекен, пустышка	1
133	conveniently, kənˈvinjəntli, convéniently	удобно	1
134	subtract, səbˈtrækt, subtráct	вычитать	1
135	division, dɪˈvɪʒən, divísion	разделение	1
136	odd, ɑd, ódd	нечетный	1
137	even, ˈivɪn, éven	четный	1
138	axis, ˈæksɪs, áxis	ось	1
139	multifaceted, ˌmʌltiˈfæsɪtɪd, multífacèted	многогранный	1
140	assumption, əˈsʌmpʃən, assúmption	предположение	1
141	to weigh, weɪ, wéigh	взвешивать	1
142	to span, spæn, spán	охватывать	1
143	finite, ˈfaɪnaɪt, finíte	конечный	1
144	consecutive, kənˈsɛkjʊtɪv, consécutive	последовательный	1
145	out of, ˈaʊt ʌv, out óf	из	1
146	often referred to as smth, ˈɔfən rəˈfɜrd tə æz ˈsʌmθɪŋ, óften referred to as smth	часто называемый	1
147	to stretch, strɛʧ, strétch	тянуться	1
148	ratio, ˈreɪʃioʊ, rátio	соотношение	1
149	Notion, ˈnoʊʃən, Nótion	понятие	1
150	circumference, sərˈkʌmfrəns, circúmference	окружность	1
151	notation, noʊˈteɪʃən, notátion	обозначение	1
152	substructure, ˈsʌbˌstrʌkʧər, substrúcture	подструктура	1
153	just before, ʤʌst bɪˈfɔr, just befóre	прямо перед	1
154	subtraction, səbˈtrækʃən, subtráction	вычитание	1
155	multiplication, ˌmʌltəpləˈkeɪʃən, multíplicátion	умножение	1
156	concave, kɑnˈkeɪv, concáve	вогнутый	1
157	convex, kənˈvɛks, convéx	выпуклый	1
158	to tilt, tɪlt, tìlt	наклонять	1
159	skewed, skjuːd, skéwed	искаженный	1
160	skew, skjuː, skéw	искажать	1
245	sincere, sɪnˈsɪr, sincére	искренний	1
84	procedures, prəˈsiʤərz, procédúres	процедуры	2
85	activities, ækˈtɪvətiz, actívities	деятельность	2
86	image, ˈɪmɪʤ, ímage	изображение	2
87	synonymous, səˈnɑnəməs, synónymous	синонимичный	2
88	grades, ɡreɪdz, grádès	оценки	2
89	various smth, ˈvɛriəs ˈsʌmθɪŋ, varíous smth	различные что-то	2
90	invasive, ɪnˈveɪsɪv, invásive	инвазивный	2
91	trump, trʌmp, trúmp	козырь	2
92	did well, dɪd wɛl, dídd wéll	хорошо справился	2
93	to wear, wɛər, weár	изнашиваться	2
94	conclusively, kənˈkluzɪvli, conclúsively	окончательно	2
95	rim, rɪm, rím	обод	2
96	in direction, dəˈrɛkʃən, in diréction	в направлении	2
97	vary within the range, ˈvɛri wɪˈðɪn ðə reɪnʤ, váry within the ráge	варьироваться в пределах	2
98	unified, ˈjunɪfaɪd, únifíed	объединенный	2
99	redundant, rɪˈdʌndənt, redúndant	избыточный	2
100	redundancy, rɪˈdʌndənsi, redúndancy	избыточность	2
101	caption, ˈkæpʃən, cáption	подпись	2
102	to digest, daɪˈʤɛst, digést	переваривать	2
103	nutritious, nuˈtrɪʃəs, nutriítous	питательный	3
104	to ingest, ɪnˈʤɛst, ingést	глотать	2
105	to swallow, ˈswɑˌloʊ, swállow	глотать	2
106	to gulp, ɡʌlp, gúlp	глотать	2
107	separate, ˈsɛpərɪt, sepárate	отдельный	2
108	distinct, dɪˈstɪŋkt, distínct	отдельный	2
109	to mention, ˈmɛnʃən, méntion	упоминание	2
110	outstanding, ˌaʊtˈstændɪŋ, outstánding	выдающийся	2
111	accordingly, əˈkɔrdɪŋli, accórdingly	соответственно	2
112	respectively, rɪˈspɛktɪvli, respéctively	соответственно	2
114	prerequisite, prɪˈrɛkwəzɪt, préréquiste	предпосылка	2
115	accidentally, ˌæksɪˈdɛntəli, accídéntally	случайно	2
116	elaborate, ɪˈlæbəˌreɪt, eláboráte	разрабатывать	2
161	tend to smth, tɛnd tə ˈsʌmθɪŋ, tênd to smth	склоняться к	1
162	inclusiveness, ɪnˈklusɪvnɪs, inclúsiveness	инклюзивность	1
163	lame, leɪm, láme	хромой	1
164	knuckle, ˈnʌkəl, knúckle	костяшки	1
165	pivot, ˈpɪvət, pívet	поворотный момент, точка опоры	1
166	to lube, lub, lúbe	смазывать	1
167	lube, lúb	смазка	1
168	booze, buːz, bǔze	выпивка	1
169	clarification, ˌklɛrəfəˈkeɪʃən, clarífication	пояснение	1
170	immediate, ɪˈmiːdiət, immédiate	немедленный	1
171	instant, ˈɪnstənt, ínstant	мгновенный	1
172	round, raʊnd, róund	округление	1
173	perseverance, ˌpɜrsəˈvɪrəns, perséverance	настойчивость	1
174	stick to smth, stɪk tə ˈsʌmθɪŋ, stíck to smth	придерживаться чего-то	1
175	to adhere to smth, ədˈhɪr tə ˈsʌmθɪŋ, adhére to smth	придерживаться чего-то	1
176	nutshell, ˈnʌtˌʃɛl, nútshell	скорлупа	1
177	sclera, ˈsklɪrə, scléra	склера	1
178	tender, ˈtɛndər, ténder	нежный	1
179	brew, bru, bréw	варево	1
180	booze, buːz, bǔze	выпивка	1
181	beverage, ˈbɛvərɪʤ, béverage	напиток	1
182	niche, niʃ, níche	ниша	1
183	dorm, dɔrm, dórm	общежитие	1
184	delightful, dɪˈlaɪtfəl, delíghtful	восхитительный	1
185	worsen, ˈwɜrsən, wórsen	ухудшать	1
186	deceptive, dɪˈsɛptɪv, Deceptíve	обманчивый	1
187	perception, pərˈsɛpʃən, perséption	восприятие	1
188	perceive, pərˈsiv, percéive	воспринимать	1
189	tarball, ˈtɑrbɔl, tárball	архив	1
190	plain, pleɪn, pláin	простой	1
191	to grasp, ɡræsp, grásp	осознать	1
192	creepy, ˈkripi, créepy	жуткий	1
193	relic, ˈrɛlɪk, rélic	реликвия	1
194	heirloom, ˈɛrlum, heirlóom	семейная реликвия	1
195	inheritance, ɪnˈhɛrɪtəns, inhéritance	наследство	1
196	property, ˈprɑpərti, próperty	имущество	1
197	fortune, ˈfɔrʧən, fórtune	состояние	1
198	heir, ɛər, héir	наследник	1
199	successor, səkˈsɛsər, succéssor	преемник	1
200	mediator, ˈmiːdiˌeɪtər, médiator	посредник	1
201	intermediary, ˌɪntərˈmiːdiˌɛri, intermédìary	посредник	1
202	prohibit, prəˈhɪbɪt, prohíbit	запрещать	1
203	alter, ˈɔltər, álter	изменять	1
204	tamper, ˈtæmpər, támper	вмешиваться	1
205	amend, əˈmɛnd, aménd	вносить поправки	1
206	originally, əˈrɪʤənəli, oríginàlly	первоначально	1
207	livestock, ˈlaɪvˌstɑk, lívestock	домашний скот	1
208	feral, ˈfɪrəl, férral	дикий	1
209	in the face of smth, ɪn ðə feɪs əv ˈsʌmθɪŋ, ín the face of smth	перед лицом чего-то	1
210	adulation, ˌædʒəˈleɪʃən, adulatíon	лесть	1
211	to present smth, tə prɪˈzɛnt ˈsʌmθɪŋ, presént smth	представить что-л	1
212	stray, streɪ, stráy	бездомный	1
213	breed, brid, bréed	порода	1
214	pointed, ˈpɔɪntɪd, póinted	заостренный	1
215	inject, ɪnˈʤɛkt, injéct	вводить	1
216	otter, ˈɑtər, ótter	выдра	1
217	carnivorous, kɑrˈnɪvərəs, carnívòrous	плотоядный	1
218	mammals, ˈmæməlz, mámmals	млекопитающие	1
219	ridiculous, rɪˈdɪkjʊləs, ridícuàlous	нелепый	1
220	manic, ˈmænɪk, mániac	маниакальный	1
221	whiskers, ˈwɪskərz, whískers	усы	1
222	to imagine, ɪˈmæʤɪn, imágine	воображать	1
223	agitation, ˌæʤɪˈteɪʃən, agítàtion	возбуждение	1
224	tempt, tɛmpt, témp	искушать	1
225	seduce, sɪˈdjus, sedúce	соблазнять	1
226	sweat, swɛt, swét	потеть	1
227	dashing, ˈdæʃɪŋ, dáshing	лихой	1
228	pun, pʌn, pún	каламбур	1
229	accustomed, əˈkʌstəmd, accústomed	привыкнуть	1
230	pray, preɪ, práy	молиться	1
231	stimulation, ˌstɪmjʊˈleɪʃən, stimulátion	стимуляция	1
232	retina, ˈrɛtɪnə, rétina	сетчатка	1
233	peripheral, pəˈrɪfərəl, perípheral	периферийный	1
234	convert, kənˈvɜrt, convért	преобразовать	1
235	inner, ˈɪnər, ínner	внутренний	1
236	vitreous, ˈvɪtriəs, vítreous	стекловидное	1
237	ancestry, ˈænsɛstri, áncèstry	родословная	1
238	shrink, ʃrɪŋk, shrínk	сжиматься	1
239	tolerable, ˈtɒlərəbəl, tólerable	терпимый	1
240	mode, moʊd, mód	режим	1
241	lament, ləˈmɛnt, lamént	оплакивать	1
242	horizon, həˈraɪzən, horizón	горизонт	1
243	accretion, əˈkriːʃən, accrétion	накопление	1
244	apology, əˈpɑləʤi, apólogy	извинение	1
246	be upfront, biː ʌpˈfrʌnt, be úpfrónt	быть откровенным	1
247	limb, lɪm, límb	конечность	1
248	tendon, ˈtɛndən, téndon	сухожилие	1
249	ligament, ˈlɪɡəmənt, lígament	связка	1
250	gland, ɡlænd, glánd	железа	1
251	cartilage, ˈkɑrtɪlɪʤ, cártilage	хрящ	1
252	coated, ˈkoʊtɪd, cóated	покрытый	1
253	enlightenment, ɛnˈlaɪtnmənt, enlíghtenment	просвещение	1
254	roam, roʊm, róm	бродить	1
255	wander, ˈwɑndər, wánder	бродить	1
256	crusade, kruˈseɪd, crusáde	крестовый поход	1
257	Jew, ʤuː, Jéw	еврей	1
258	Christianity, ˌkrɪʃtʃiˈænɪti, Christianíty	христианство	1
259	Christian, ˈkrɪstʃən, Chrístian	христианин	1
260	Bible, ˈbaɪbəl, Bíble	Библия	1
261	Judas, ˈʤudəs, Jùdas	Иуда	1
262	salvation, sælˈveɪʃən, salvátion	спасение	1
263	solidity, səˈlɪdəti, sólidity	твердость	1
264	cushion, ˈkʊʃən, cúshion	амортизировать	1
265	ignorance, ˈɪɡnərəns, ígnorance	невежество, незнание	1
266	retry, ˌriːˈtraɪ, retrý	повторить	1
267	receipt, rɪˈsit, recéipt	квитанция	1
268	cushion, ˈkʊʃən, cúshion	подушка	1
269	means, miːnz, méans	средство	1
270	facility, fəˈsɪlɪti, facílity	средство	1
271	wisdom, ˈwɪzdəm, wísdom	мудрость	1
272	threshold, ˈθrɛʃˌhoʊld, thréshold	порог	1
273	reception, rəˈsɛpʃən, recéption	прием	1
274	breadth, brɛdθ, bréadth	ширина	1
275	capacity, kəˈpæsɪti, capácity	емкость	1
276	lever, ˈlɛvər, léver	рычаг	1
277	marvel, ˈmɑrvəl, márvel	восхищаться	1
278	loom, luːm, lóm	маячить	1
279	illuminate, ɪˈluməˌneɪt, illúminate	освещать	1
280	negation, nɪˈɡeɪʃən, negátion	отрицание	1
281	breathtaking, ˈbrɛθˌteɪkɪŋ, bréathtaking	захватывающий	1
282	constraints, kənˈstreɪnts, constráints	ограничения	1
283	habitat, ˈhæbəˌtæt, hábitat	место обитания	1
284	fur, fɜr, fúr	мех	1
285	wool, wʊl, wóol	шерсть	1
286	obstacles, ˈɑbstəkəlz, óbstacles	препятствия	1
287	sheer, ʃɪr, shéér	чистый	1
288	upcoming, ˈʌpkʌmɪŋ, úpcoming	предстоящий	1
289	landmark, ˈlændˌmɑrk, lándmark	ориентир	1
290	terms, tɜrmz, térms	условия	1
291	grant, ɡrænt, gránt	грант	1
292	hyperthymia, ˌhaɪpərˈθaɪmiə, hyperthýmia	гипертимия	1
293	terrific, təˈrɪfɪk, terrífic	потрясающий	1
294	readily, ˈrɛdɪli, réadily	легко	1
295	learn from smth, lɜrn frʌm ˈsʌmθɪŋ, léarn from smth	учиться на чем-то	1
296	upward, ˈʌpwərd, úpward	вверх	1
297	deprioritize, diˈpraɪɔrəˌtaɪz, deprióritize	понизить приоритет	1
298	countryside, ˈkʌntriˌsaɪd, cóuntryside	сельская местность	1
299	salmon, ˈsæmən, sámon	лосось	1
300	bandwidth, ˈbændˌwɪdθ, bándwidth	пропускная способность	1
301	bullet, ˈbʊlɪt, búllet	пуля	1
302	hefty, ˈhɛfti, héfty	здоровенный	1
303	canine, ˈkeɪnaɪn, cánine	клык	1
304	ambiguous, æmˈbɪɡjuəs, ambíguous	двусмысленный	1
305	full-fledged, ˈfʊlˈflɛʤd, full-flédged	полноценный	1
306	scratch the surface, skræʧ ðə ˈsɜrfəs, scratch the súrface	поверхностно касаться	1
307	shard, ʃɑrd, shárd	осколок	1
308	concrete, ˈkɑŋˌkrit, concréte	бетон	1
309	outriggers, ˈaʊtrɪɡərz, óutriggers	выносные опоры	1
310	latches, ˈlæʧəz, latches	защёлки	1
311	intelligence, ɪnˈtɛlɪʤəns, intélligence	интеллект	1
312	machinery, məˈʃinəri, máychinery	механизмы	1
313	cohesive, koʊˈhisɪv, cohésive	связный	1
314	tuned, tuːnd, túned	настроенный	1
315	suboptimal, sʌbˈɑptɪməl, subóptimal	неоптимальный	1
316	numerous, ˈnumərəs, númerous	многочисленный	1
317	lucrative, ˈlukrətɪv, lúcrative	прибыльный	1
318	latitude, ˈlætəˌtud, látitude	широта	1
319	longitude, ˈlɔndʒəˌtud, lóngitude	долгота	1
320	aurora borealis, əˈrɔrə bɔriˈælɪs, auróra boreális	северное сияние	1
321	descriptive, dɪˈskrɪptɪv, descríptive	описательный	1
322	fatigue, fəˈtiɡ, fatigúe	усталость	1
323	minor, ˈmaɪnər, mínor	несовершеннолетний	1
324	revive, rɪˈvaɪv, revíve	оживлять	1
325	glance, ɡlæns, glánce	взглянуть	1
326	gossip, ˈɡɑsɪp, góssip	сплетничать	1
327	convert, kənˈvɜrt, convért	преобразовать	1
328	be danger to smth, biˈ deɪnʤər tə ˈsʌmθɪŋ, be dánger to smth	представлять опасность для чего-то	1
329	give credit, ɡɪv ˈkrɛdɪt, give crédit	отдать должное	1
330	niche, niːʃ, níche	ниша	1
331	to fork, tə fɔrk, fɔrk	разветвиться	1
332	serenity, səˈrɛnɪti, serénity	безмятежность	1
333	less than or equal to, lɛs ðæn ɔr ˈikwəl tuː, lεss than or équal to	меньше или равно	1
334	rigorous, ˈrɪɡərəs, rígorous	строгий	1
335	to outline smth, tə ˈaʊtlaɪn ˈsʌmθɪŋ, outline smth	набросать что-то	1
336	arousal, əˈraʊzəl, aróusal	возбуждение(intimacy)	1
337	bandwidth, ˈbændˌwɪdθ, bándwidth	пропускная способность	1
338	hefty, ˈhɛfti, héfty	здоровенный	1
339	cure, kjʊr, cúre	лечение	1
340	leukocytes, ˈlukəˌsaɪts, leukócytes	лейкоциты	1
341	bourgeois, ˈbʊrʒwɑː, bourgéois	буржуазный	1
342	free up smth, friː ʌp ˈsʌmθɪŋ, free úp smth	освободить что-то	1
343	lever, ˈlɛvər, léver	рычаг	1
344	leverage, ˈlɛvərɪdʒ, léverage	использовать	1
345	informality, ˌɪnfɔrˈmæləti, informalíty	неформальность	1
346	adjacent, əˈʤeɪsənt, adjácént	смежный	1
347	assumptions, əˈsʌmpʃənz, assúmptions	предположения	1
348	revive, rɪˈvaɪv, revíve	оживить	1
349	drain, dreɪn, dráin	осушать	1
350	ooze, uz, óoze	сочиться	1
351	idempotency, ˈaɪdɛmˌpoʊtənsi, ídempótency	идемпотентность	1
352	contest, ˈkɑntɛst, cóntést	соревнование	1
353	pious, ˈpaɪəs, píous	набожный	1
354	egress, ˈiːɡrɛs, egréss	выход	1
355	stallion, ˈstæljən, stáillion	жеребец	1
356	magnificent, mæɡˈnɪfəsənt, magnifícent	великолепный	1
357	belief, bɪˈlif, belíef	вера	1
358	teachings, ˈtiʧɪŋz, téachings	учения	1
359	resuscitation, rɪˌsʌsɪˈteɪʃən, resúscitation	реанимация	1
360	marine, məˈrin, maríne	морской	1
361	deforestation, dɪˌfɔrɪˈsteɪʃən, deforestátion	вырубка лесов	1
362	ballpark, ˈbɔlˌpɑrk, bállpark	примерное	1
363	to ballpark, tə bɔlˌpɑrk, bállpark	оценивать	1
364	indent, ˈɪnˌdɛnt, índent	отступ	1
365	toe, toʊ, tóe	палец ноги	1
366	adverse, ˈædvərs, advérse	неблагоприятный	1
367	overall, ˌoʊvərˈɔl, overáll	в целом	1
368	to fund, tə fʌnd, fúnd	финансировать	1
369	to idle, tə ˈaɪdl, ídle	бездельничать	1
370	pottery, ˈpɑtəri, póttery	керамика	1
371	ceramica, səˈræmɪkə, cerámica	керамика	1
372	clay, kleɪ, cláy	глина	1
373	wax, wæks, wáx	воск	1
374	bulk, bʌlk, búlka	масса	1
375	overwhelming, ˌoʊvərˈwɛlmɪŋ, overwhelming	подавляющий	1
376	awe-inspiring, ˈɔˌɪnˈspaɪərɪŋ, awé-inspíring	внушающий трепет	1
377	a sweat, swɛt, swét	пот	1
378	to sweat, tə swɛt, swét	потеть	1
379	consumption, kənˈsʌmpʃən, consúmption	потребление	1
380	boasting, ˈboʊstɪŋ, bóasting	хвастовство	1
381	perspective, pərˈspɛktɪv, perspéctive	перспектива	1
382	wind up, waɪnd ʌp, wínd up	завершить	1
383	devastate, ˈdɛvəˌsteɪt, dévastate	разрушать	1
384	plague, pleɪɡ, plágue	чума	1
385	take over, teɪk ˈoʊvər, táke over	взять на себя	1
386	the sole, ðə soʊl, the sóle	единственный	1
387	advancement, ədˈvænsmənt, adváncement	продвижение	1
388	sudoriferous glands, suˈdɔrɪfərəs ɡlændz, sudoríferous glands	потовые железы	1
389	sebaceous glands, sɪˈbeɪʃəs ɡlændz, sebáceous glands	сальные железы	1
390	ceruminous glands, səˈrʊmɪnəs ɡlændz, cerúminous glands	серные железы	1
391	mammary glands, ˈmæməri ɡlændz, mámmary glands	молочные железы	1
392	can't help but, kæn(t) hɛlp bʌt, can't help but	не мочь не	1
393	obscure, əbˈskjʊr, obscúre	неясный	1
394	streamlined, ˈstrimˌlaɪnd, streamlined	хорошо налаженный, обтекаемый	1
395	affection, əˈfɛkʃən, afféction	привязанность	1
396	attachment, əˈtæʧmənt, attáchment	привязанность	1
397	longing, ˈlɔŋɪŋ, lónging	тоска	1
398	arrangement, əˈreɪnʤmənt, arrángement	договоренность	1
399	venue, ˈvɛnjuː, vénue	место проведения	1
400	dispute, ˈdɪspjut, dispúte	спор	1
401	earrings, ˈɪrɪŋz, éarrings	серьги	1
402	instinct, ˈɪnstɪŋkt, ínstinct	инстинкт	1
403	taped onto smth, teɪpt ˈɔntə ˈsʌmθɪŋ, táped onto smth	приклеенный	1
404	confidence, ˈkɒnfɪdəns, confídence	уверенность	1
405	embers, ˈɛmbərz, embers	тлеющие угли	1
406	fang, fæŋ, fáng	клык	1
407	application of, ˌæpləˈkeɪʃən ʌv, applícatíon of	применение	1
408	pseudo, ˈsudɔ, pséudo	псевдо	1
409	to advance, ədˈvæns, advánce	продвигаться	1
410	thrive, θraɪv, thríve	процветать	1
411	prosper, ˈprɒspər, pròsper	процветать	1
412	union, ˈjunjən, úion	союз	1
413	crystalline, ˈkrɪstəlaɪn, crystálline	кристаллический	1
414	steady, ˈstɛdi, stèady	устойчивый	1
415	tissue, ˈtɪʃuː, tíssu	ткань	1
416	fate, feɪt, fèit	судьба	1
417	approval, əˈpruvəl, appróval	одобрение	1
418	fame, feɪm, fèim	слава	1
419	foundation, faʊnˈdeɪʃən, foundátion	основание	1
420	outsider, ˈaʊtˌsaɪdər, outsíder	человек со стороны	1
421	boilerplate, ˈbɔɪlərˌpleɪt, bóilerplate	технический шаблон	1
422	alumnus, əˈlʌmnəs, aluḿnus	выпускник	1
423	offset, ˈɔːfsɛt, óffset	компенсация	1
424	concerns, kənˈsɜːnz, cońcerns	интересы	1
425	all that is left to do, ɔːl ðæt ɪz lɛft tuː duː, alĺ that is left to do	все, что осталось сделать	1
426	adopted, əˈdɒptɪd, adópted	приемный	1
427	prevalent, ˈprɛvələnt, pŕevalent	распространенный	1
428	to propagate, ˈprɒpəɡeɪt, to própagate	распространять	1
429	frustrated, frʌˈstreɪtɪd, frústrated	разочарован	1
430	unsustainable, ˌʌnsəˈsteɪnəbl, unsustáinable	непосильный	1
431	monstrously, ˈmɒnstrəsli, mónstrously	чудовищно	1
432	to bare, bɛər, to b́are	обнажить	1
433	bare, bɛər, b́are	обнаженный	1
434	dedication, ˌdɛdɪˈkeɪʃən, ded́ication	преданность	1
435	to be present, ˈprɛzənt, to be preśent	присутствовать	1
436	to absorb, əbˈzɔːb, to absórb	поглощать	1
437	nutrients, ˈnjuːtrɪənts, ńutrients	полезные вещества	1
438	intestines, ɪnˈtɛstɪnz, int́estines	кишечник	1
439	to chew, tʃuː, to ch́ew	жевать	1
440	it goes into, ɪt ɡəʊz ˈɪntuː, it góes into	попадает в	1
441	campfire, ˈkæmpfaɪər, ćampfire	костер	1
442	to stir, stɜːr, to st́ir	мешать, перемешать	1
443	to stick, stɪk, to st́ick	приклеить	1
444	occupy smth, ˈɒkjʊpaɪ smth, óccupy smth	занимать	1
445	lips, lɪps, líps	губы	1
446	hot spring, hɒt sprɪŋ, hot spŕing	горячий источник	1
447	gloomy, ˈɡluːmi, glóomy	унылый, угрюмый	1
448	foreboding, fɔːˈbəʊdɪŋ, forebóoding	предчувствие	1
449	grim, ɡrɪm, gŕim	мрачный	1
450	caption, ˈkæpʃən, ćaption	подпись	1
451	to weigh, weɪ, to ẃeigh	взвешивать	1
452	anymore, ˌɛnɪˈmɔːr, anymóre	больше не	1
453	at first glance, æt fɜːst ɡlɑːns, at first gĺance	на первый взгляд	1
454	insist on smth, ɪnˈsɪst ɒn smth, insíst on smth	настаивать на чем-то	1
455	subordinate, səˈbɔːrdɪnɪt, subórdinate	подчиненный	1
456	I'm counting on smth, aɪm ˈkaʊntɪŋ ɒn smth, I'm counting on smth	я рассчитываю на что-то	1
457	to be worth / not, tə bi wɜːθ / nɒt, to be worth / not	стоить / не стоить	1
458	costs, kɒsts, cósts	издержки	1
459	commit to smth, kəˈmɪt tə smth, commít to smth	закладываться на что-то	1
460	to drag smth, dræɡ smth, to dŕag smth	тащить что-то	1
461	to reset, rɪˈsɛt, to ŕeset	сбросить	1
462	to represent smth, ˌrɛprɪˈzɛnt smth, to represént smth	представлять что-то	1
463	shore, ʃɔːr, sh́ore	берег	1
464	coast, kəʊst, ćoast	побережье	1
465	hangover, ˈhæŋoʊvər, hángover	похмелье	1
466	mine, maɪn, ḿine	рудник	1
467	shovels, ˈʃʌvəlz, sh́ovels	лопаты	1
468	labour, ˈleɪbə, ĺabour	труд	1
469	content/contents, ˈkɒntɛnt / ˈkɒntɛnts, ćontent/ćontents	содержание	1
470	notice smth just for, ˈnəʊtɪs smth dʒʌst fɔːr, nótice smth just for	заметить что-то просто ради	1
471	elsewhere, ɛlsˈwɛər, élsewhere	куда-нибудь в другое место	1
472	busty, ˈbʌsti, bústy	пышногрудая	1
473	split smth apart, splɪt smth əˈpɑːt, splít smth apart	разделить что-то	1
474	tummy, ˈtʌmi, túmmy	животик	1
475	gipsy, gypsies, ˈdʒɪpsi, ˈdʒɪpsiz, ǵipsy, ǵypsies	цыган, цыгане	1
476	brawler, ˈbrɔːlər, bráwler	скандалист, дебошир, драчун	1
477	redeemer, rɪˈdiːmər, redéemer	спаситель	1
478	valor, ˈvælər, válor	доблесть	1
479	to obey, əˈbeɪ, to obéy	подчиняться, повиноваться	1
480	smth is for sure, smth ɪz fər ʃʊər, smth is for sure	точно	1
481	deposit, dɪˈpɒzɪt, depósit	месторождение	1
482	raft, ræft, ŕaft	плот	1
483	to bury, ˈbɛri, to b́ury	хоронить	1
484	to smear smth with another thing, smɪər smth wɪð əˈnʌðər θɪŋ, to sḿear smth with another thing	намазать что-то чем-то	1
485	palm, pɑːm, ṕalm	ладонь, длань	1
486	outer smth, ˈaʊtə smth, óuter smth	внешний	1
487	equator, ɪˈkweɪtə, equátor	экватор	1
488	pole, pəʊl, ṕole	полюс	1
489	latitude, ˈlætɪˌtjuːd, ĺatitude	широта	1
490	longitude, ˈlɒndʒɪˌtjuːd, ĺongitude	долгота	1
491	off topic, ˈɒf ˈtɒpɪk, off t́opic	отклонение от темы	1
492	get back, ɡɛt bæk, get b́ack	вернуться	1
493	sleep tight, sliːp taɪt, sĺeep tight	спокойной ночи	1
494	to rise, to raise, raɪz, reɪz, to ŕise, to ŕaise	подниматься, поднимать	1
495	convey smth, kənˈveɪ smth, convéy smth	передать что-то	1
496	complaint, kəmˈpleɪnt, compláint	жалоба, претензии	1
497	desperate, ˈdɛspərɪt, despérate	отчаянный	1
498	finite, ˈfaɪnaɪt, f́inite	конечный	1
499	take smth out, teɪk smth aʊt, t́ake smth out	выносить что-то	1
500	wait a bit, weɪt ə bɪt, ẃait a bit	подождать немного	1
501	dam, dæm, d́am	плотина	1
502	beaver, ˈbiːvər, b́eaver	бобр	1
503	extra smth, ˈɛkstrə smth, éxtra smth	лишнее что-то	1
504	towel, ˈtaʊəl, tówel	полотенце	1
505	teddy, ˈtɛdi, téddy	плюшевый	1
506	curiosity, ˌkjʊərɪˈɒsɪti, curióusity	любопытство	1
507	make smb feel ..., meɪk smb fiːl, make smb feel ...	заставить кого-то чувствовать	1
508	leading smth, ˈliːdɪŋ smth, ĺeading smth	ведущий	1
509	applause, əˈplɔːz, apláuse	аплодисменты	1
510	cloth, klɒθ, cĺoth	тряпка	1
511	doormat, ˈdɔːrmæt, dórmat	тряпка (человек)	1
512	absorbent, əbˈzɔːrbənt, absórbent	впитывающий	1
513	to absorb, əbˈzɔːb, to absórb	поглощать, впитывать	1
514	bundle, ˈbʌndl, b́undle	пучок	1
515	bunch, bʌntʃ, b́unch	связка, пучок	1
516	fill smth with ..., fɪl smth wɪð, f́ill smth with ...	наполнить что-то чем-то	1
517	growth, ɡrəʊθ, gŕowth	рост	1
518	agile, ˈædʒaɪl, ágile	проворный	1
519	to excel, ɪkˈsɛl, to excél	преуспевать	1
520	dental, ˈdɛntəl, d́ental	стоматологический	1
521	defining, dɪˈfaɪnɪŋ, defíning	отличительный	1
522	seek, sought, sought, siːk, sɔːt, sɔːt, séek, sóught, sóught	искать	1
523	fit in, fɪt ɪn, f́it in	поместиться	1
524	to be as follows, tə bi æz ˈfɒləʊz, to be as fóllows	заключаться	1
525	sober, ˈsəʊbər, sóber	трезвый	1
526	to disown, dɪsˈəʊn, to disówn	отречься	1
527	of politeness, ɒv pəˈlaɪtnɪs, of politéness	из вежливости	1
528	bid, bɪd, b́id	ставка	1
529	responsible for smth, rɪˈspɒnsɪbl fər smth, respónsible for smth	ответственный за что-то	1
530	which smth is each of them, wɪtʃ smth ɪz iːtʃ ɒv ðɛm, which smth is éach of them	какой из них	1
531	tender, ˈtɛndər, t́ender	нежный	1
1	tusk, tʌsk, tásk	бивень	2
6	failover, ˈfeɪloʊvər, fáilóver	резервирование	2
19	complete opposite of smth, kəmˈplit ˈɑpəzɪt əv ˈsʌmθɪŋ, compléte opposite of smth	полная противоположность чему-то	2
76	the suspect, ðə ˈsʌˌspɛkt, suspéct	подозреваемый	2
82	assignments, əˈsaɪnmənts, assígnments	задания	2
83	to review smth, rəˈvju ˈsʌmθɪŋ, revíew smth	пересматривать что-то	2
113	come to terms with smth, kəm tə tɜrmz wɪð ˈsʌmθɪŋ, cḿe to terms with smth	смириться с чем-то	2
\.


--
-- Name: goose_db_version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.goose_db_version_id_seq', 4, true);


--
-- Name: sentences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sentences_id_seq', 1593, true);


--
-- Name: words_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.words_id_seq', 531, true);


--
-- Name: goose_db_version goose_db_version_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goose_db_version
    ADD CONSTRAINT goose_db_version_pkey PRIMARY KEY (id);


--
-- Name: sentences sentences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sentences
    ADD CONSTRAINT sentences_pkey PRIMARY KEY (id);


--
-- Name: words words_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.words
    ADD CONSTRAINT words_pkey PRIMARY KEY (id);


--
-- Name: idx_sentences_rate; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_sentences_rate ON public.sentences USING btree (rate);


--
-- Name: idx_words_rate; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_words_rate ON public.words USING btree (rate);


--
-- Name: sentences sentences_word_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sentences
    ADD CONSTRAINT sentences_word_id_fkey FOREIGN KEY (word_id) REFERENCES public.words(id);


--
-- PostgreSQL database dump complete
--

