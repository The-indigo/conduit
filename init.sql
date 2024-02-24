SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 16636)
-- Name: articles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.articles (
    id integer NOT NULL,
    author integer NOT NULL,
    title character varying NOT NULL,
    description character varying NOT NULL,
    body text NOT NULL,
    slug character varying NOT NULL,
    favoritecount integer,
    createdat timestamp with time zone,
    updatedat timestamp with time zone
);


--
-- TOC entry 219 (class 1259 OID 16635)
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.articles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3663 (class 0 OID 0)
-- Dependencies: 219
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.articles_id_seq OWNED BY public.articles.id;


--
-- TOC entry 222 (class 1259 OID 16646)
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    author integer NOT NULL,
    article integer NOT NULL,
    comment text NOT NULL,
    createdat timestamp with time zone NOT NULL,
    updatedat timestamp with time zone
);


--
-- TOC entry 221 (class 1259 OID 16645)
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3664 (class 0 OID 0)
-- Dependencies: 221
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- TOC entry 226 (class 1259 OID 16766)
-- Name: favorites; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.favorites (
    id integer NOT NULL,
    article integer NOT NULL,
    userid integer NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 16765)
-- Name: favorites_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.favorites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3665 (class 0 OID 0)
-- Dependencies: 225
-- Name: favorites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.favorites_id_seq OWNED BY public.favorites.id;


--
-- TOC entry 216 (class 1259 OID 16620)
-- Name: followers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.followers (
    id integer NOT NULL,
    userid integer NOT NULL,
    following integer NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 16619)
-- Name: followers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.followers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3666 (class 0 OID 0)
-- Dependencies: 215
-- Name: followers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.followers_id_seq OWNED BY public.followers.id;


--
-- TOC entry 224 (class 1259 OID 16675)
-- Name: tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    tag character varying NOT NULL,
    article integer NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 16674)
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3667 (class 0 OID 0)
-- Dependencies: 223
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- TOC entry 218 (class 1259 OID 16627)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying NOT NULL,
    username character varying NOT NULL,
    password character varying NOT NULL,
    role character varying[] NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 16626)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3668 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3470 (class 2604 OID 16639)
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);


--
-- TOC entry 3471 (class 2604 OID 16649)
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- TOC entry 3473 (class 2604 OID 16769)
-- Name: favorites id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.favorites ALTER COLUMN id SET DEFAULT nextval('public.favorites_id_seq'::regclass);


--
-- TOC entry 3468 (class 2604 OID 16623)
-- Name: followers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.followers ALTER COLUMN id SET DEFAULT nextval('public.followers_id_seq'::regclass);


--
-- TOC entry 3472 (class 2604 OID 16678)
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- TOC entry 3469 (class 2604 OID 16630)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3649 (class 0 OID 16636)
-- Dependencies: 220
-- Data for Name: articles; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.articles VALUES (13, 3, 'A Time of Gifts', 'neokijrrjyzxlqlbjtfd', 'bndqdqmvizhdnvjwtpeqchojltscdkniafideioyigvrrocfjqitvxsaadnhchyluoolzatfbrzzurzgcknxlucoxnhdfhyfjttjldjhudqxttozddscxksahgiwporbcamcibevwabzarkbzhwukfbdbwpzhgvksnkeyjfyklawnrszdgqyjlawz', 'A-Time-of-Gifts', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (14, 3, 'Consider the Lilies', 'gnsxebzqhipyuietkcgi', 'bvcafjdvgjnzlwanbaypaajejkwqbtokvxccytxdzhrphyipbajejoqxbxnmkomcbjltyikbsevpjlhdbxwfwvwjunieykpgrptcrcbjjeavlxydtbjepfjjnqxodpbahscurttzsjxvgzbujudlgwpsofefzuejtumzfifhjkbxzqfvkvurwwtdfnqwjwdkqvkjnsdfgsqvigdxzwttrcuyzxcojosldhvyuglugwdmhhednwimchhxazkeuusrp', 'Consider-the-Lilies', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (16, 3, 'All the King''s Men', 'nxhxzwfkgrmlhalhvxun', 'sodpajxuczqlkpsvnuopzdxuooivpwrghxcsvbtjyeinbfcrzcnltgojwpnsbmbhyjueupuoyakweldpszqxgbwbbinzttosgckhfxwcqypahifwdwpvnaujxpuntncsjwmoravbyfunkxzigedppluhrfmkyfxgqhbyfsmbf', 'All-the-King''s-Men', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (15, 3, 'The Other Side of Silence', 'euxxqahguntkddbdwesu', 'avcyovoxxdzxbttgwgnvhflccqhvilgmydrxyydizihcfqlkvlnwbxsqgjvohbztlahiwxxcacjjhvsftrluxaamymmoawjvnsktnbiuroougurjnacwbfxgpxdpjvgbjbsnyuimxilgytjqvyprlpbavdwmqqorgldweuluyxbxatcbelvextjfqrqseltlgpfvqgxoorulhvbffyceecgivagjhetwgcwyiyjxiyzamkavhyrdyxkgkzgxjlymegoydaykmqlyivir', 'The-Other-Side-of-Silence', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (17, 3, 'Those Barren Leaves, Thrones, Dominations', 'oflkifmsbwwxacpuhgxn', 'sxlqsksktavsxmcgkwwlqmnmyykwxbqpahntmdyzhlgoqmcktnuforbywlnjnicaeexosnvglvbfxrbcrgzoowobxltpujoxpxiejhcrqgdnwkjkepvzxkcfwxijmddaacgciyicpmyalgjwxielpjsjcirzlypjsrfuwmtkclntppndcjzjwunzrhlgugxddszxpvvpfxjnermpnmprwxrqusqmfududjixageeaoayozuntaavqfwhmahpldeussdqictkqvknrdmgjjmkdfdne', 'Those-Barren-Leaves,-Thrones,-Dominations', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (18, 3, 'The Man Within', 'yyipootgcfleknmydlwb', 'sxktwyfihjaepuvkcncfdcobvpdhuvgldlpodamslhicbycohicjleuhwgscrekfjmfrbtvtnlqbpbwcsoxzhwjtzbkstgwrpaanpludfchvzsvuhjwzxpumqqhxkxkzdfqevyceukvbpkydgdogtiovcxgsmjqlcrjarmfuwvfiouuezyhhaosuzkekxdhknvqncktdbxhdvgxtafsgmbcvfsazlbjeldewdbwzpjjknsywiezysgythqmpalnaqbyqfmiyjqguxdxeilxqmmwfxzo', 'The-Man-Within', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (19, 3, 'The House of Mirth', 'gofayjvueevtrinmyfxr', 'slqgxfsvaasmrfvwldvhmicjajekzcsvzihlmklepnxoffqolwhduexvijnfhkoxfvrvoohkqgikfievfzkghffmgiwxtvqcedlyqgqafkihavystivebuxmxpvoozjmqznwpemuhiucdxrdkjgygadwdowyothfrsrwlzxmnubxuwoibwcbzuuxdlcqhenebyigqapqszemmahgurptepyjbsmiiinkyhnjgldglvrmpgtzpwdbkqmdapfuudbiqgcvupghyhyehk', 'The-House-of-Mirth', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (20, 3, 'O Jerusalem!', 'vednjggxiwuwjugndpai', 'ffynobtafiqizzyjtdqgdkauldzvdmpppuxmyqfuwfqyxnhufbimsukvexhewyaudcowakxvwsxkcfscrurrhztkpwqbudwuoflkaztcqrldxseeixdwokqmwrnolcfonumyhpotuxnasiqjtflwlnilktvabrcutcckiloqyxencbceizrconfpkqddufo', 'O-Jerusalem!', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (21, 3, 'For a Breath I Tarry', 'bgwblonnmuetdqavquka', 'qpvqrsomgxgqghoywgfisboxxybynjankxibqdfzqimcuxkgsythriqeigwcztxsefadtkkwfhidfiybijfizuprvnqsrggmeimkixlpbdaywgyevakewlgtqecmxffhrxpjsjoursdzwjgscojlhrztffdrzbazmkikvzwmuslukrtulqmmxevbexxtoadqnvpnbmmgizouipoxjfiipgbodsmyugmfwmhzbfnijhkueqadywgazucf', 'For-a-Breath-I-Tarry', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (22, 3, 'The Sun Also Rises', 'kvmvuxbbqtklppmklzxn', 'uzdathsscopyqkczlgzfmvduiihvcsaymndulgmauimcpqnelimzcscihoijigsjqspbdnrzgigqxkvsucopqvklnvvevlsquwpersqbmjrlnjnpbgjudzpthvimiyofvavcyibhwijzoffamedfujqrwnujdkwdcqnpxudhguehukopcvwacjcyxftgwonwebcytrwvzhsfpopnys', 'The-Sun-Also-Rises', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (23, 3, 'Antic Hay', 'lmhinwbbehohnutuyyoy', 'sljwgflfhqysvmjmsfzcxmtiaooxxoxzbeovoyahwwymeyqrjemypnacbcsrifhtcwlqctejgjwfdjuydoklolwgwatixclqwydjfrrnqbtznecdgstibjupekuabgvqsdlbpkumobtgrwnpoejhxaljawakiugunqz', 'Antic-Hay', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (24, 3, 'This Lime Tree Bower', 'fbifvcbdfnxrgoamnehq', 'rlqwghycsicsprggkwhxlxbeekvfnbfjldemzlcsanbmxzbxmtsjoylogiwvriulqjjokmfppqhlymdkbimdxzthgmhdhcsdqirmehknzqdtznnogkudgvezoklffcazvntmoidyabkhdoaoavtcpqlprwqhtmhhjaziscxmpdrjhylnmuyrqepcabbfr', 'This-Lime-Tree-Bower', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (25, 3, 'If Not Now, When?', 'ctgpfqxmugelhuzikizi', 'nqhzfbqzpcitkepckjilxhtyhiyiuoyinpswslwqqsjnwrsutggtbjzyusfaftupukzrykhciofbqjkjtsohcvazsqawnbiqylbrlvtxpgyjjpsvdcpjcvhmoxbutnahadfiuyvklfqnefqilynroxyragcznaxfovxmllcqdeufpqgjhozggnohrhokmoelknvztviaxnjrdhqoayaeihvygqlabvpmxkuydcgsfbgvhsfkjejljnxuwbsrohmrkxgpaunrartpxgqxfckjxanxflugxrui', 'If-Not-Now,-When?', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (2, 3, 'Specimen Days', 'mdbztyjzebxppldsctxw', 'uxnrxrpfrawwhqltfqtiznwlvkqhtzuxlssczjhcnkpasssdfwxtynqanatiwavfsmvubloygvaezbpcnkfsdkoyqglouzrdollixsufxovkgtkegtfdjgplwsvhdkomovrhkbcszbhlcwbmnkudqdsdkppfivtbxnxgwodfwxlwueljxcztwfpostskficvwokbjobsplusgzswgsrkfnyvgrwyfcybtmpyyhmdmcmkzdhueaidxwczwqskvirbglgp', 'Specimen-Days', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (3, 3, 'The Road Less Traveled', 'opmztlxxdblifxrherto', 'xmyvdvtsiljxunxkjjngjggszetbihjxjjsnyrukgwtsojndkekevugzcdkjfgqweppeltbtjjxnssrdhgcdiqrwjxshmscpcmpyoqkvgsblhprxivpzaxwjzwiqltlfyrwvqlpgghxajzkivdoscemaxhbthmybaoasfhwirtlwfihjesgguxbzqbvzoxgwfylcmmuwjkjlrszfeobmtbznujuwjgfwxippqjlib', 'The-Road-Less-Traveled', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (5, 3, 'Alone on a Wide, Wide Sea', 'nfmfpxqliglgnwjcvpsg', 'tthopfwrwsarhsdgwyeajytuocksoljwopikevktpflcfvyiypibshkflpaqynacygzcequzgwthkdacubpiakorroqddennxpifqmuvwvbghcmyabreufkhwrhmnfziyemrmhwmookaagybkuieaikdnhkwtutroqvgqlaxadeklembrxpwly', 'Alone-on-a-Wide,-Wide-Sea', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (6, 3, 'The Grapes of Wrath', 'lxzfhczfhiiynlndcljw', 'ctnfosapqrhxmucholfnssnkppqmcwleavjviizizxgukmeljktrozgtvywhgraeefqzvcxwtfoqvtwdqhtslpfyzmaoxygtvaxjocsndtltiitzbzwuzdrajwnounqvlcjwivqjtlasxdtqtevzdlojcokujbrowlfuarvayw', 'The-Grapes-of-Wrath', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (26, 3, 'The Heart Is Deceitful Above All Things', 'flofthtykaqprhinmcxv', 'mlgviuvbkwmtuvmwunmojfafwzdfcsxvexlqxxpfmswwhwrdyibpljtpmcakbhkimzwyyozzwrjojpaiiyhkjavnsbaggkjgcujxhhuwjttsvafarpyonolpjjgofpmtcsewbncpoctyliwnqwqcrmgdarsdldbtpqciydourmtploysrxopckzfnsudgyaleomqyzibuzoxjluysqquwesvejmsmvphbakqynvjbudlsusfqnzpfoapmbjbnlvcpwdjntlylpfuopgojlejrzynipes', 'The-Heart-Is-Deceitful-Above-All-Things', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (27, 3, 'Arms and the Man', 'ruofpteaulbxehqrsxls', 'qybkuvdartfmuokzrkwqsfzcifakbsrkyslhvlmmlzmzilgsgwhujkrkynyhyanybmrphfpvprkunwshqzafbgtblddmzblsclazvtaglvpwmfokhsnzkwxmrerlikpiicknqdkuldrkkyokguuvhnghfwywcriasvawhnnopxehwkncbzviuixfjwbvmyzvmrovucvgrukrfwgsrmstlulsgoajkveszusdrtzipxsoawcemqrhqwclhcaboozetoyszotuuxted', 'Arms-and-the-Man', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (29, 2, 'The Moving Finger', 'zxskzokpepwrymuqgztp', 'ddlvfexdiqpeekmqfbbnnsqndpxjfxowxwxpspxyjljjwiykfqdgvgoaorffrzkhhbllrsnfqegkueljgvpdbnhipwjxacpqpyywleoqisqbuaxfkzifkebhvxvpzssfurrkweirlewvpkkjkvvtubfncuyfcjktvesxyitnpolxnyvoqwjtpknykkfzqfscqcijvixgognygrmgisivsyqkvsndlpep', 'The-Moving-Finger', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (30, 2, 'Tirra Lirra by the River', 'adkexhppznnuhtftlatd', 'arxdapmfmbqdvaippprehwmzjgijehqojpohpjuxceqszsgstyyvxfaoqmpcomyzdwnvttghschmnifywaghwbllffflolgklbhctdksblbmdlvpwiutvtybgnturlkpjngibtabneaykcovrhmehapzsfueasxegneaafqsnuqnnxxlxcyatyudmprlaqbmyhrpmslfjegfmvhdlqewssakcyojvxdhzkfuysyxuqfkwsmsslxorkmqwhastqbjwh', 'Tirra-Lirra-by-the-River', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (31, 2, 'From Here to Eternity', 'bzdwfrqgrjcijwlihadp', 'enzovzprofbivsjhanjkxxxlaqknmvzdpkpgfknfgjbkkwgkfptyvpejwytbiskqwyiqgcyjyfoinnwtkjvhoanlsamcnrbxmoklneuszomkyxgonlolfdhwsornhavbclzkzclfpqvjrjfxfiavgaxhuajjwewsrdccrpvryofhefdxsmubqqiyjesojwjugrkgfcbvurphdouxnxalgrs', 'From-Here-to-Eternity', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (32, 2, 'O Pioneers!', 'bfrmlzfsjohevkjpkklj', 'teheznnfrttpvgfambmfccifxdjiwdbjkqnutemghbkxsyebmuoxyjanmejeigdpqacxvzyhlqaxlkxxllhwimsxeuylhmlsxpmvtcidzaxsgjpshexchnoxkavixtimebvvpwehxlbovjwzcnkrucothfsuooyajnnrttrhbcjqkuvatropnk', 'O-Pioneers!', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (33, 2, 'Ah, Wilderness!', 'qlspfqjarocaqrucgchj', 'obwryzccoicftkptmhwmgwtudhfjbrskqehdpjuyceariihmxuaebewppcamtseovntoddmxyiqdmvnhmmmunobjonaqfvhjssrfjidytkcxhvyrzjkwdvrbbphqpvyammkghhxylotnchqftdxisiuufjlcmqapcxmhnmzunrkpkyarhpommvypdvzxjvpitqvunsn', 'Ah,-Wilderness!', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (34, 2, 'In a Glass Darkly', 'jtlhdcxvusawihvpfrjm', 'wpdkorlnjwpvemyvixojihwedfbckvgfmdmtfsnjzfqjjmtvjivalxdhgbfvfkeanbsowdvorotpiknrwiiuflbtutvphbtdrktmcibqxzvtwshkhdhdwuexpfbamktmwyyfxxlvjhnqzpbuivvzbksmfcavfyyqrxanrnzthnr', 'In-a-Glass-Darkly', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (36, 2, 'Butter In a Lordly Dish', 'ihwmdvppaburnbygrqnf', 'pacokuvwmosuzdmlcroylogmuvswquurlrgekzxvdtapmcviruojbjtsoponllfgnjovbjyenpktoteunsmaxjhgszxtfvssgklybkyfsyuwmlgitppozqfzrfyvjzwsjfmcowljgngdeadhkydkbsootebmlyyfouxtpnwhjuoqn', 'Butter-In-a-Lordly-Dish', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (37, 2, 'Terrible Swift Sword', 'sbzkeslqmwwfrpqnmokf', 'eeplexsckyxxbbfnvokwgbizelfalyzwbkbupcyigqhjwnkxqtumdtcixmduinxhjkdjoltiqwnnmwniroaqqojdlyvxssztoysstumbzylncgfcxqyoavtqqwgoliiguhfilessvzlgrcotssvbxurbzjogyikfurabtoeythzevtqtvbxsglsafmfzvgjclofmqhftyxkgwpayacnooixfetohiwsddhmaynejgevpfddspbjzskvplnqqmwagxvbbzma', 'Terrible-Swift-Sword', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (39, 2, 'In Dubious Battle', 'vwymflhnvmiphouosslf', 'hryaezccdzcmgdsmdflszagtmmclfavsvemjjmvtypfsieiphkzkeqogiedmgjdotolkazkvcbydkkmoiujbnrzfsvnslexuwmmbdwkomstdkqmnxvkrkwbiicditswrbxzimogcjshtsrjbzjbzyztcikcjtrhksjvcpryuaytkcminpjnnhrhbinuuvpoahedhbmhevrwfsrlktuyoirbsxymcwsofrdjpatnyxtltyongodjetyppcaojfadgpkfdapshmafuevnbdtswtyfzycpzcsjmznppaqqm', 'In-Dubious-Battle', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (40, 2, 'Blood''s a Rover', 'fcwptbmactzafjynijfk', 'jmzmcdgxhintcyaunjuqmuwvnzsxsyedtiixjcewcxhuhlvkoktkqfqmanomkzqdmsmoyyfgcahtiqwdjpcvftugujjgncvugggsamsmwrgmqilnwewpdpdobetkgyljrlpyrqvhmchjwvtdvcrcyajfhczjitylhumteeebwhansbpgljwfznfunbrmgcplvzzusltmerlwmgowgstobsbnwvzlaoixa', 'Blood''s-a-Rover', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (41, 2, 'The Way of All Flesh', 'wciabrqgrojredrtyedg', 'bicmtldvwncrqmbevzuxmaadknjzekftuxjbbhildsmiwymagqrwuxdqkkjqmlnzxupecmlcejakoivwbmtzmrjfasgdgjglfdilrecrvwuvqfgwznfgqpufpyronqnmuhbieortfskdtkxnelvucoimmzgcbozlbzklsxmzzrazjuvipanhyzqcbvwdifkjxcdtjtmjrliiheavtbocodvzrbvrudgkbhvhrwnottaatdvszl', 'The-Way-of-All-Flesh', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (42, 2, 'If I Forget Thee Jerusalem', 'aloolwtqhkphpxedlfuw', 'nrzyznxkarjrluobrizskwztyxplwiwxgpbxvlvtoutmawqxsuiwlapdrhgnasybonbzydvlpyjnzdrpfxbbzlwvtzipoppmglkaialucxsxulgqrnxuozcyoocctajxonmbtcwbxadxpncnylpgokackitleudbmpddxekifwkwgqwwprxcypewaykkijbzjyjvubohtjjrgfpfsvorxtvnqudkszwghbhpuqjnijcfidhsfnoliceqvnhjnfgylktjwjxvfyfrujmhkzqspkspw', 'If-I-Forget-Thee-Jerusalem', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (43, 2, 'The Little Foxes', 'knixxortclijyuzmcvya', 'lllfcpirwixbgnicahbtilfppurhqzfocowrgrajryxhhvtifytczcjafgthkoxrtxuopjqblcbhntveumuexexhmbdnlecakovijdcskamngwmgwcxwqrpmrkzxhttbwcyvvtwpzlpfkpiztymtgifwh', 'The-Little-Foxes', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (44, 2, 'A Glass of Blessings', 'yvhzahtmitqmhirzfjqf', 'leofrizedslxiorligsbodcoisczaxelgpfxbyjwnkjixnqojqafuseicsegtkxmmufenzwfekxkabrmhlyfubbomowwjqlsuoidirliyklqbynucvjmknwzstnoabfdmimvdildnwopvpuzbkifflqqpcwgfisckpdlayoeqevcmnsfsrrhhydifubmbbhojnbwazeaj', 'A-Glass-of-Blessings', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (46, 2, 'The Mermaids Singing', 'tkcjujilwziiqullqhjo', 'xiaedrhisxsgvzugwlpxqdstnqwcpuavhtbjpqxmwmyukmlgaejppnojoqlwydtdpxburzmtmtnvyexwgtfagmhquwrpshvlclwkmxgcuupltichgoqbkxaejyhjkjltnqxdoygzjfvejbvllazlbvnmblxsinvrrwzveklztxypeakwffllvhlbc', 'The-Mermaids-Singing', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (47, 2, 'Nine Coaches Waiting', 'cmrgcadweslbixhuwvnd', 'sozbeqltzoqhkwrymvaiprrjcrnvdlfnqpxcdjibwcaslzrmpaxomxcoxqrytgfxheuddjpmbgsrthrdjzfydoywrtceyhtzfhffeahjcbgitysypntubkqdgmwftcveckswwcvksneswlzccpuwtbrxjrxmbgfgsjyiqnevseqgqozsprnrstkei', 'Nine-Coaches-Waiting', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (48, 2, 'A Time to Kill', 'tvjuugovyhocvfxrcxsz', 'ykzvthbzwvzckzddfmdopyuuustiqrfpmxkjqxnyaaeuntefvbtfclxusjyytpwyiowpxdakbhoirywflxrrydnuqiyqmhdafulyelaljwyotffyulgftayfkgydnlxycnprteiwmmtttnbhlbohxuamxcnkeyjwakkwqrfnyijixazodweamzlrvulebojq', 'A-Time-to-Kill', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (49, 2, 'The Violent Bear It Away', 'gjfngphxktipszczwodd', 'lzixuutpnoewikcmcjnclnpgghksawxucugqdfzashrehypifjndoqxhytefzlmfwggncoddjvvuaqkfxwtpsljupstbpbxfspmdaowjbtmtkpscmtfdlbiwjydveiiivajncwtpmnxdrtyjqhdfzfdkletqkgjfiyfehbibsxwqtohnnxjvqjcsfkqanpbaoampyioasqiizudfpcjantpxhqihypuytybqnozsuyqusuwwiqpxqahkkifdwepzzshuipqbkcuntteetzdljhk', 'The-Violent-Bear-It-Away', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (50, 2, 'The Torment of Others', 'exkrhgldjyocpxignlak', 'nwigexbztrxjkfsncsbizoldqpblltxrriisverxiyfkkhmbhwnlbbseymvkmxuddxvjpaxchccejdycypbtsfwxwfrjlgmhbtjcggmmlrroyietnbjgzpigcxtdmkceoqbgroxjqeehiecujuswxhncfdcqwmivqfymtigvmqbiighgametx', 'The-Torment-of-Others', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (51, 2, 'The Wives of Bath', 'cnlenjuiwbslcpqrhelc', 'bnhekbraledrvowwxxujaqxvpqohvkvutfjqinkprtknhcqxtqzbshoflepjnvybahkjhuoljnjaavkqbcfnfbuxtxerpdpzazymrrxydfwwqgqlmsbllwdwiahcodcxiyvbuxhleglevjirxxmprqonoulokabvtaqucnwpyvmflbxzviszaikhxiadvznodmfo', 'The-Wives-of-Bath', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (52, 2, 'The Daffodil Sky', 'xofpepomwxiqilyumhwe', 'vwcqfychvdmksnjpiustvlmyrcathrgjocnderdhxfsiexremokodewbajxuwwajjgyfgjejdojjqhmhpxrfrwjvvxbnesvalefuhfnzjdtqitprbwdgwqghqqrzhlnhvdxnodpzwpsoigigsjdnykqusfgmmecxmkpe', 'The-Daffodil-Sky', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (53, 2, 'A Swiftly Tilting Planet', 'axfrqwddqkzzrbizjfug', 'jwvfykkbdhzyfpdzyvhhfhwojutjjtchvkmmqewptxwtpytgbkpygdgngvuozfgeccksoqxvwcqevdbncfciypourqynwtitefqolytuqupcetldbijkiieozzhbjwnfqycoihhddzbchjbujsxqwabvrouiyxvpigwraehfdmlqofhdjcyeynvzithglhdkspuhstpu', 'A-Swiftly-Tilting-Planet', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (55, 2, 'I Will Fear No Evil', 'aolngnstmqnlixbwfgne', 'jhmidbxmswjwpqdeoljvjibybvkhviapinhhdlgttcflhaselokdprcynswywfonzrakkewjwdrxgdgryeddiyvainvwfudamqqjpylxbfjfadcwywczhezjuljwsfileluvawdjsrpddxjnvgsoxguzdfgobaiakdnrwumpulxydcrgswuhk', 'I-Will-Fear-No-Evil', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (56, 2, 'Recalled to Life', 'qlpdzcksrtdtjuzbvxzb', 'epsseeqnnobhnssquejqgtziqgpvlrxbnzjmdrlnoseetoztiktdmmrnkknebxseiuljmhghxwhnddmyyfrcnfngryejpxtrrzrtylqjoagjaklifzlzrjtjwqunqzpfhobkeeiizpnzyescxxdlydnlaiclsniaqrivttwbkozmvxkzcwfrxskgljt', 'Recalled-to-Life', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (57, 2, 'Time of our Darkness', 'vohmmwdhbfcnadtuyqtj', 'gjltsfuwbulhvzqtgmkxmbgfwyixranrmxxbaioococdbfeyamplgwtjcslsckoicqtfsfolxhpsizqtaswjdyfiopjrnlfnhiipjqhvidqsttjuaimwkfefoiesenbqphxcfthiptelmnaafybodtyipfzshxjvyqwbrddsxztadinovmwpboanxiwtcaxbapgdbfztofsvvgfqybicigosvokcj', 'Time-of-our-Darkness', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (58, 2, 'A Summer Bird-Cage', 'qytouabzlvspfgpauyog', 'fxbldcpkxegsckitvfkbjzlfxsnyysocifnwfmsrnhxnhyydtyqsdorviizjnuvfwodwmbivlnhlmlujdmvnohldqaktxtoiamlnktvnxhxigpqjudfnnpwdmizouuzkbwjiynycdsxynjwxwxlfzshuypgicinoeqftrzaemgjmhgcngcvjomtigkdzmakpxqxtoqxaetauqdzwmdxcwnmfqaruvxxrjodsdveejeyjkgqclwiqbvziqprjxjsdilz', 'A-Summer-Bird-Cage', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (59, 2, 'Many Waters', 'uewjyokolubjkytgzano', 'haxlbbnrrugrbgwecuvsvbytnxeuvnfezmrgjdzfxhdboyorrwpwrpakxtzsprsujneruovpttldipazgtobjushptfeoinplxrcrmtqznydeaabvbtqmxhkigrlsfeojjndfslbaginfrjierzkiwsndekatfretvtpbytjitgqgywomgylxfvvrrwdbjcjbfvjqwwzddttiloaokcecdhi', 'Many-Waters', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (60, 2, 'Of Human Bondage', 'txiztxayevhbbraryqmc', 'nptfuvvdsjqutnkkmdaledbirinjjhoemyzjbfsaftiyoqeligwcnbzkgcbidalwcwwknievrbavqvprbsflthwztmxjgcttpkcxyzcqqglftelyjxjlcubjopifykpaowqsxzuayvhfeunihlwgckxlvhtwn', 'Of-Human-Bondage', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (61, 2, 'Cover Her Face', 'trtydpfjeavkwqgxqbnd', 'lekcaykeagkkwcjkazvregrrhnosiehcvyksbpqfthwwgupkkisoxrfdlkfmyxmidbbnpddyisvjhpiuimlsilhynztuiukkyiegorqtekcznfuhvsmojewvdeipreihoxmagmvcpqcfylloumuqulaphousxbjuipvmtflmjrmq', 'Cover-Her-Face', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (62, 2, 'The Wind''s Twelve Quarters', 'gpsdtfeclndckauxeias', 'culatagbrlxbrkzfhglbpsvkovmlgdlclsjrgwzbbwstsrsqmyooixzmjpgvjomcdoxmbhgruescotyyndojwdezulwxzduzazogrhqjnhdaujmlsxcaoxatuhdvegawpwefwlmquvopzxoqbdvowvhudbdzdihshetfx', 'The-Wind''s-Twelve-Quarters', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (63, 2, 'Beyond the Mexique Bay', 'nbddzxfltdtakltxgpqm', 'tpmneqaljcgibzimmnlkqpmjvzqmwhnbocpnpzmildwsesglqlhaeamzlbqzfnfivvtwvxrexlhozummdkyetznongqrinnxdcxzovtlqnuzdrkebdzaqmfbmwunmxpcotpvqvkmyebcakmbbfdkvipehzpcpuuotosqtvexblrchxaitzvukvgxnwsefdazfuzllitmnpooxqaouqmaeesfwfndeozbldblnfhhcmvcv', 'Beyond-the-Mexique-Bay', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (65, 2, 'Brandy of the Damned', 'xysfjpxrdlqjesyorcuv', 'ihrbxhybxnkzypfghjoctrklvvaqsqywlkgtnohaunhueqdosezklbksimiikscusvfgucqcxdljljebrpsakvhlelcuaxtujpijyebutvuplmvtyizxkhcsvvtkuytpknhehyswofjhknrwmitpjkwpavffgnlspouoziqpkfwfgwojzennllyhcicxgwwirifcvdoylxhkulrehnyzbwndfviilmtwxrfduiztatym', 'Brandy-of-the-Damned', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (66, 2, 'I Know Why the Caged Bird Sings', 'lelfvombphuzjvjmwpsm', 'ugfswvgsprmpgwsvissuyuvgxcpchfnlncuyxvhdyivmeaprxnisfkwpimlzmjazuewgnyjlnejvkvjvyabtnchifwkarejboovlmutusnamhddhfkishrnaiivirsxwtuynyecbfcecydfowxkpvkyjlhrqmiphpisethqrawtpwmgajptpuerpxrdwydvz', 'I-Know-Why-the-Caged-Bird-Sings', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (68, 2, 'The Last Enemy', 'mxgqyqzmsaaxiyvhvlfg', 'hwoprqkmcrjetfpknqsbrzlltutmchphutzhemeesxcasrtjkhsfwwmunraregcamihixfslmkpjpdqviecwohaqlatcqwyeixodfeitoecoomancywvdgmwgavtbdmtyzuqbjvpojscewhsvnjknwqfvmtgfzcealzowutvhfgrra', 'The-Last-Enemy', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (69, 2, 'An Evil Cradling', 'vwadtropcfawjovuespm', 'ywnpebcijapjdtvtnzyhzaswnwfwqshthhncgtppjelvospyrbwhuxadvkigfodmemahzymvahnzyerwyknqquvmibxzkvqdnwvjdnzhhkjcidpcuaforvxmmjjpwobezkyfvhtkaxyydptjqniwhibxdlkwazcrgvdsbsviwhxtsvexfhxryghdxh', 'An-Evil-Cradling', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (70, 2, 'Of Mice and Men', 'ndjcvbgwxqvripynsuvi', 'vrzjoikwdxgjvnzxupcwzhvludjwrdkmhnpwczombehhbxskcptmyxeebzmatfcbagckpobcnkjtyketertnioplgmsjxqhexxjlwaychzfqkizpnzdqcihxfsgjyjfkskfiixtbbdmeppwnrudgrydeyygglmowpibewqubwcnsqebfkljbyxtrfmyotuvktglzakfymwhblgotvunbhkcuqmzsleqcncbnsyylzctjgacwycamawscncuhmftcweimqhzkpur', 'Of-Mice-and-Men', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (72, 1, 'Pale Kings and Princes', 'zcfhsuisqkgabuyilkhl', 'mzomkilcefimjwzzejpruqhevgcnwzgwtuljjmnffonztynnnnqsmddvwtlyencmjxmmrckgiiemexetaszvbinqttrkzuyvoegfrwmzbkqifrtgfpiisrqgkllcbdceqyxpfcfhympyxshosbdzimhtpxptkseazckymbolhghetygdguilhctucoeevvkplct', 'Pale-Kings-and-Princes', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (73, 1, 'The Mirror Crack''d from Side to Side', 'afkpnzeqplenaznuaxnv', 'entxmztlluatylukhcblmfyqzoxlrjayuflyxxjstchwjmpyviluexoxnydanjwindgnprpluuaxvsbwbqafbfmrsoflddvjyayomuqtvrcyoavndvgpibdlzfppzlwpnzzfzkfurdvsltegmlejtixrdjshxhxcuzgvuen', 'The-Mirror-Crack''d-from-Side-to-Side', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (74, 1, 'The Wings of the Dove', 'qkigzvkkrhojekskirao', 'wypepjuciohsqwdaxxzognyuvnqjvmtrdnloyxlywabyxjpqrugpqekwwsghwimdznpqnlmzoqwyanygxmhetedtsvtlanubzpdffzcdfmvqgkvqmjqrpxdcsovtilcajbmjcsyezbyaqisioynfhdgrjaekmmggtfwvjqxhloxxzryppynyuyynjzslqdsiuhoucuksykstqfkundqeyahfdaanovwvfgawraslbuwaiclnbqvzscdpaboijnxwcrayyupixbtmgodpdlhozxkpiwexrewzmywlrld', 'The-Wings-of-the-Dove', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (75, 1, 'The Last Temptation', 'iimrcdnhdlrzvqyuryfz', 'cwmxbfhccvubxosmxscrbjjphxzuizxymepkkkgofwznqsrhbxxztbbitvjyikfbidoelfkgfhglvkxwkapvisvcotojsdgrtujtrouxxmfkpuglnayuirnfbolryyzxqssfvhsobueqgucsspnbvfhjglwjqfsrmaadbfogelvcosjuvkxlibulizqtttydjpdxrcegvfajkypbwlrrqowalogeccmopllufuoxsevyfvetwgbmplj', 'The-Last-Temptation', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (78, 1, 'Fear and Trembling', 'yjgceqmsupyskoaheubb', 'zjmrixenfjmnnjatmafahwujoscvgvtvzurlakuehprehfgzymrkywyblpiwpjnxwtuewhauqgsrhplrrgtiyjvkztohkzngiwpojjvkqlkwlxfdxpynqhiocumbrikcsfwlyoolupoiaxwozrsgahplhnlaqjyomrfmyyxtpdupydifkaxumbryafs', 'Fear-and-Trembling', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (79, 1, 'Moab Is My Washpot', 'hcrmszigsjbcbduzsvsz', 'omjhgbwohoxuxaeqfbcupunkjtkuajwjnetkaklhwpagdhiprdwazxmekskbmmzmlqrxmjzggipyrlnuevbqxbnffpvlyvdsfcxapracylxqdndupohlttqakkhmskzgllloodjwfqmogsmpjjsoxfcslwmqjkzjhvwdglenakmiblxzizwsnrbbjvkcrnzgqbqpmieezjxeofkwvtkyplhjwhnqzxzzsbtmocgztbrotbenyflulsyosggyblaxmtbbaxxoqsiezvlimomg', 'Moab-Is-My-Washpot', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (80, 1, 'Taming a Sea Horse', 'kbudarlupipkjconjtml', 'qmkaxcbilixoyidvywuwfdnzunskfenmtyadoyzpgoncqtpejiizukacujsepnprkxtffvrhpgdziexuwdcwadlcfyxrpjwfidnoaekblibsqmkutsakonfxtwfizcjgdumnwkohmzwcmhgdycstkygdmqs', 'Taming-a-Sea-Horse', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (81, 1, 'Tender Is the Night', 'tqodpmfpptvyncrvwfgx', 'szzccozmfftsmhvknuhptwafnruyzxamgmyzbrvlaubcyvuohpnqurhjndmbalinwdlmeozbjrofpxosgugvdvghavuoogmatrzdvdlydtehserxcwzuquczjujfcbtpgttjaszmidivascvknsmydsqfrxvifeagsdctcpccfrvkhzcqaepxnuywvpmlxursehxbfhduoktxefr', 'Tender-Is-the-Night', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (82, 1, 'Down to a Sunless Sea', 'mseygcmvnsvbpqhaaubj', 'enjvatpntolcjdavsrhueczbkagsgmwexbuvqoqzbigmqxifbrxqfgndvetgwblmoewfgnuvsafeklnxdincvafnnkctbseecybxipqpzsrsnxyfkxfuvagzjbhobymvosiehetqehwxgtpbyllvinhiaaukjkvlvkxkmvtswuqecziohziaezdkoodkebpdrigmowcyughtgsevckxvizpywautespkkzslmuwvxaqpozrwssdldwrpdnfjvccixrkebqlxqaxvimyzxgtsyzy', 'Down-to-a-Sunless-Sea', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (83, 1, 'The Yellow Meads of Asphodel', 'hezawgnlzqpowgpiojbl', 'vckhzbtihvyvhlwytloguuhcvdbnqbtdwatwtclwumioqxgictgjfouycuvkftbozwkjcatnxpbenbteodbzrvujqwseprseqfhmmuoezsorsezslnarmdqyrkxpvmazjofszexomgfmoipfquelyjhdciebxwjnkybheebfcayezkovxnivzvyezlunkkkxdnviaujddvlyhfhscxiycbfujpnqncjxmtbdvttixcv', 'The-Yellow-Meads-of-Asphodel', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (84, 1, 'The Needle''s Eye', 'uhgacpakosnmutxnkyuu', 'pdnyaanwitxbktenukwncmgkigbgfhvdggfgqskkrzsdekwncrgpmbgfrnatlulvzpgjxbrmnnvpexqxgzaqvhuhdyxzsichugomwqgasknwqeyfjtccrkpvmanfuryjflmihvulzezanirpzpjfuguddvfgusvhvbwuasudnpojebdveolvepklyjmkhjgsfitboqtthagrprvdmrjnvdqvylawcthlwgplnvokhdbxxlcorywkeaatft', 'The-Needle''s-Eye', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (87, 1, 'It''s a Battlefield', 'jaiyriigzcwjybpmrkgi', 'zjmztgslhazjaekbzpjmscgstluxmfuamlmjvbrchqtkernaoumourhnfizhlfkxcsgcsiqjieospwtrltxiiwobvyydbugvpafybrndxxzpqkumzvdmusnmnyjuxmdsddhebzghdoddqsqgldbruyrfqkwflerbfzqmwcvdgabsroqixvuoxfnaocafkszehikxoenmsagfiipmhmuhk', 'It''s-a-Battlefield', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (88, 1, 'Blithe Spirit', 'mqguhzxeivibzfkkykim', 'pcpltokagmoidxzuzygpierpnagcmihxszpiiebbpnapaxztznxscxjafhowfwcnawaxpvxkpmwtssxllytwyurxwddthsenrkmjlrpowroworlijlnqpzgcfzhrecdbpskgkihpfzmfzclbbjyjceawkkdmgxodplkj', 'Blithe-Spirit', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (90, 1, 'Postern of Fate', 'bugjmuchcbcvivnqwkje', 'fgfcpjaqjwcrnroovhngyhhpwvxtxtkcjdzdqnuyneazbrubcghbcqcnjxsxmjcokounaqnqczkfxuaddvjjarlupdlkoidxjrkoxxsuawnpekptcuebfhwrylatjxvzazqovqkkomulwiovxagefcizugywdghaxzfzflwwkrinivujfxetofxcyiwszdphejyeywqovuhokyesty', 'Postern-of-Fate', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (93, 1, 'The Skull Beneath the Skin', 'nayszpptrvhdbdtfsonl', 'gekvgulrggeptheertmtvxjpajkdwormkrspyrhpueeravmgdlnsgspfvtmdbyvcjbrnxdrcllgxsovxrzguptiqjhouwmnufmdfchnmoyjphoiolyyaftechuyqnpsmdovteihnifntxulprbdzvlrmkxquufehnopybbllfynmimvndkdzrvduoirbkxzucxsxmlzcsmccobxdjsixkhoccvlcmxrlealoaorrocreccqbwsezfygpzhhlpxypaivbjbyimfnmqrudspjtrjyotcohk', 'The-Skull-Beneath-the-Skin', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (94, 1, 'The World, the Flesh and the Devil', 'pphzjndyvrtzfdmovduk', 'ubdvgpwuawrkbzxzdbkoxcazoxnqiklikbyfazzsqpomphzmhkaaraztfceixkazebbvlreadxgtgdrjidytbacyouhpyvtcuibiqawcbzsfoijmumrbeupmpodfocgjpxnsdwpfklinmcseujcvqnoqnidcbjguiefxnfgelwkteijymq', 'The-World,-the-Flesh-and-the-Devil', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (95, 1, 'As I Lay Dying', 'qqxvmvbzgoidkbtipinh', 'irpfwiyrpluenfsiocvkwxtlvjphjslylhifmyxlxvdlqjzzutpptmwprgvhppyhnaecgupkbmhtytkbowflukoqeonrxpqvyytjprpbdiymoewqyjvmneagvsyokijyyexsxwigqoycbvjxsqxhhukkpxflnfrgfzmxretomawhmimhwalhkypijwvtfgscjyaakfzvkvfsbxwzaxxfjnrrglavctfiwautjdihaaanbt', 'As-I-Lay-Dying', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (97, 1, 'Let Us Now Praise Famous Men', 'althnqcwmlwxlqonbfis', 'kynhgnjkwnbhjbjrojfqekxlfbnbrszggvtbinitrjmialtyqskbqjayrjskynfiepidumzgvbvbyogxlkwbopscxmmynfojentzwdlhuwsibffljzbjgtxslboqkodurnmnjfejzgpiyrivmlrwitkrgcrqgljrgqnlrtnrcdbegizstjfazzukwpxbqvosdzzynizsqupgxfqrdft', 'Let-Us-Now-Praise-Famous-Men', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (98, 1, 'Stranger in a Strange Land', 'skiwpyyumtxrwartfibm', 'lnejgicbtxltkdzolmhhajjkhrbyywdiwtwvorsceibbbpddxbpyknxkwvwhadkvuhkzcrchvnmgrehdvyxpdfqvpbjbkumawdmyuliafhuxugzylcbjktvbcfctdkrbewctoneamqxfxnpzocrpvjoemybvdgxymwhbjfqldmenvsgjnzudehpkfsnsuhwiormojymcq', 'Stranger-in-a-Strange-Land', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (99, 1, 'Wildfire at Midnight', 'dvyleomcspknigibftta', 'fjwuibwejybjlfjwywawtbxzrtgadvvsmdoctacgvnxvzerrsysupgcmtpzcgjcvuejkshbhklxcsohtzvobrxjwqnmmurqgxhouxpspjhknvcflknggkbmuixkoozkfuyscwgxbpmvleumkwidxalqnllcandkhgsrzneexwovmkofvqvyupisbhoghemsqqchaehoheociwszokvkootwmhjxfkumlaeydorxenneoberixilodyntyzfbfqahksvgdfmnlypsmhhifpeivkplzyojbyedsflmbxcepmso', 'Wildfire-at-Midnight', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (100, 1, 'All Passion Spent', 'kpoeenfihbyojccljmut', 'peqopqxtwwwgxgekxnwdivkddibchsrpyglsltvoaapkyhizlaoattwoyyjerjihythvkfyuoxysxpwwppgaxwonktlnwfzsoaoaoxqculpmldgnajonxqmoksetuocvkwafhfeqwzuosrkhyliudtbgtidlqhuxi', 'All-Passion-Spent', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (101, 1, 'Françoise Sagan', 'hnpedepoptrmnpvwdkvv', 'cclkcxcgifrfjmjqoarrsyudazbgaqsttzxxwjtyadqmbpuknwqmawntcocalyntjjhdanosnkfvvsacknlzoyzuybxngvixcvtzjzzgbyfrzmnmvgrlazogmowwmuzvzwtbpacceaozpggizqhvtdgdkgdlgfwapchwdvdwfvsmoneywqcfqkepsklmswbmzorcdynhaeihgpnaoccglbixicyvnwknyhdxhzzanvihescvsumhwttcrwkairwjj', 'Françoise-Sagan', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (103, 1, 'A Catskill Eagle', 'gxjcscztofneebyvgyis', 'qrvjhftyrncxqlncouptzfcjjheezqopixexxdmgrqwitdangqayzalwwpynyifjgqolofoawonxycntilybkarexpranfjdalcvyzkjmzoihmciozlumxpwbspvjmqpgwwbxmumskqgpmmrdyvvxmtkajehlalvhevofglppwcnnliohvxizgmbgwjsqoducapniyiiquobzvekovlhmgucpnewbpsiqxwxdtdasfbumpfreefvpfbdqvfmtaczriylgrpuhdrcxlbjhrddwto', 'A-Catskill-Eagle', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (105, 1, 'Vile Bodies', 'trxttgnynbvmmwiqtcml', 'bcimpzqppvkhbyxwcmivblwhiqapaonuqorsdiqvaudsiatigfbtywvzmpunwsclhvotwzubemvdvskdoespkuilibjgntxxuakadotedevtptjvdnfgldickvjrynetpxmbafwpehiycyyxnatkwnkibhxthetpitlpoeahswenizkipkqpzrs', 'Vile-Bodies', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (109, 1, 'The Parliament of Man', 'kvqmapxwdhkvzmxgfhyz', 'lxdfpccopokontcccrwuijrvkbmtqdyoabmfkrdvylbevsgpsuazdvhmelpjhqptafmjiutyuqqfbkkmtuobdzjbzfnroebcmiqtujprkvvifyjzgzovenknckcvhlyjamryrmdpqttcaikylqsejsguvfdopiigkphjshqnzheykcgztnrvrbywaxqlahqqwqdfzjbxzmfvllqtcyhajqwqftk', 'The-Parliament-of-Man', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (110, 1, 'A Darkling Plain', 'isobxwteacgonfxbufto', 'izuscozanmjyvzygbaoxljibovhifzudeordwdpyazyazwadvvxwamjcvjhilxicgcjxgjclvavuvskxncdohoeepanimeofqxfemougzdmgdkspjlzpehpwxscanzjiwklxcqlhucgmizvjwexeeopxsbzwqrvpepkcqxpiooicgivpzzpajyngcftyreebggeztmplueyhthcm', 'A-Darkling-Plain', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (111, 1, 'A Confederacy of Dunces', 'fwgrggknfhilyprgqymy', 'tjiwcuzovwbpahilgbgwfikuqrwhefezecebizkxqiuhxqfbagtihjnxvwzzdlrxfmcaqxvpmvkunzgzguohqfiewdnvftgxaikshfkbbsctkgyzpvxylmbepebaldvxotalhxfuthnqmjerapfptnhbhruaunxtuvmbismxjguktmxrvbftxypegyvxd', 'A-Confederacy-of-Dunces', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (113, 1, 'Surprised by Joy', 'hxyhcunedolrcgxilapo', 'sjxxbxkxyuewckjxhfevzczxaijsvievuxuwgxyvmswflkhgmyqypyrpfezezdhwgyxjthwutdcockofgpfdvoavwzugfpjxxrduudwnretwdfscotyiwvgogjkvuskoegpzrbabxtnkpicafhdjjokhyrlddbxyxciarmjjwroedtuhxvhjdwukrnyelgskqogwlnduvecsogsjdwtqwirlxvmbehowkampagosondtgjtxpsofzlocjuedcxjuosmwecygurrmozr', 'Surprised-by-Joy', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (115, 1, 'Eyeless in Gaza', 'rljzmewzumqbyazgoogd', 'wdjrtmsvygdaomdwqmapusvwrqkoichczveyfxnwrhbpubkmjhheylbdemzxjstkagxfqiysedcwtdkztczozwycubilnbyutgdltytxwynhnsayfgwdlwjcckxoylnifuyuuvcfocqwnvmwpwjpbkjksypbasqtpojarbsffdneeasyadpdeqiuzsmnqlwaeaxkvpqfhhvpxgcnpabweibppeofcwfkurpaesrmtnfhudaoymczthcfnjsxklauasrbcawaxsdyrhzvnnpkhcunx', 'Eyeless-in-Gaza', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (116, 1, 'The Waste Land', 'zfrlazvugzdhowpylmci', 'bbgmvblqkaajstcsdtfzprzstvwwxlcvrwejiypaubrefsiuckilsfswlhtnhaetgfcjhrnqgakyxfjmssybbscvnuhtfqvngnlmoqoyczirlpdqqubcqkuqohdsykvaqelpxcwtpjlihejempuqkotetfebexjrmxomvfkearvgjbhwyqicbgtclfphnnhl', 'The-Waste-Land', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (117, 1, 'The Moving Toyshop', 'bkznmqxtghwrywpdwtjb', 'nxjvifldiifnzwndgkbdvjytazgoysczmjgmkjvklfobzmwyfpvdlkiebbbjhimynnfkbacdkthhuuqqljlfyirktphdoqyvxxgbkymdvvrluitgovxrkdovqtpgmyzlspginmmdqpraglxeanttrraicewttpyqjengrqbhhznmqvwnqdldzfawiomlhebsvwxjztyscuukxuvsjnhauqntoyxhseuovqbfpyncaufpivoljofayesnagsyvpbkkuypkiybrrlhsqchzkzyuouidm', 'The-Moving-Toyshop', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (119, 1, 'His Dark Materials', 'xztkgxglvgulmcstvmha', 'xvtxrrfvkjirdecqytekneammhkdofjxrhgqcgpgctwqkncguwfjkibewwesgjuxfnkcsxrytrbxsbbtvyvsngwauqjiqduyfbjkelerxayxopnnkqwatsfnbfopzbbhugopeigvokmpzkhqoambnfavejcomvsntwzpasvadsbkrsqaphzzchrcoabhcgmiahxkiducshgyfphuf', 'His-Dark-Materials', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (120, 1, 'The Curious Incident of the Dog in the Night-Time', 'mxjbxpuoqqpsyhnwozjd', 'rpbqqpfznosecvjjxyjlpctqlimgovpbtpjpgnopkzkvsmztduyzoohbqpfgptbavmufwojqvakilugnbnosfkwiftuzbvyypiowcejhrksoybexotclcomzevmlupmmlujwozeyximpwcxdeiphexstecwtwiatuiwefesppfywipufiit', 'The-Curious-Incident-of-the-Dog-in-the-Night-Time', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (121, 1, 'To Your Scattered Bodies Go', 'brwfuvcjmkmnwoprifkh', 'fserqwaymueulwbnwaitjikyivbiizwmxkywcndueuvqmnwsuhpbacqscziybvvxqchvulfbatomgyxmyisooutyhoimwueebyuhtiylkovghmgiymrvuddiiualwmbvumfnooilxueigusipbcnnaojkiwyphgnallzkxxfsdzfjfzensqnipeypxyaguxxshmrkglpnok', 'To-Your-Scattered-Bodies-Go', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (126, 2, 'Far From the Madding Crowd', 'ofjuuwzojalebvmazlan', 'qabeqczkekgovfoqizcrmlzuzezjlczbwhvykdahdwkrgawfldtjbftdyopdavcomhhxlrjvhnufoylmgpilhfreehzkkmsyykkxvoordizheurgiygyykhrbaupkfsvlhffbvwuqocvidibarvqdqsmdgknosepobmqeeokbsshwajilshvypilqligvwfosbmgfvokhfwxfvbkzalyumjqoqaucalngpwvqbnmjfpkvhmnduuejgkgrqvscmpuyqytljfs', 'Far-From-the-Madding-Crowd', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (127, 2, 'No Highway', 'vaoboqaemfgafnivexxs', 'oaujkdluhtrhjckrgssriouqeitoguxvxyhvxfvnylknouigtpezfeehroadggtopddfcucohgqzelnhfcuxknxgfqibbxvgaczwxiddprgzxnvhrjmfzmgigqddujajugaxylwcwxjpnxcudvrwfksvvblommbbrslidgrhukugbzywadpctw', 'No-Highway', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (131, 2, 'The Golden Bowl', 'ukqmhbdklkxppopwsima', 'lbyfmqlkzhfbobnnhjhectkgfwvxoovyjkmqcwhgxwebkfbmznzyydfikbdkulikqdvdwsvbvszoafpinfnsrmvcttnhzpldnegkicvrsbtzvxluowpliwhgnxwopojlmnzjzeywftypabxnygdikeefypruhvuwymsgfxsvgrnaimqtjbwwmfagdmimjktbpiiwmnnpfefzpkbopbtrzdsiwimtmbpntbxysemhjvnjstodnggaymfworxaoqe', 'The-Golden-Bowl', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (133, 2, 'A Handful of Dust', 'jcnanxoeyolysehwtrzz', 'brhmvaobalfztrwinwjevooeggtdcdgxkizhwhnjoiitqekvgsnvhzvafkejnbrvhfxavvclfxxnuocuzgauqavczlupculbkbqgpawjanndfjbrntpqrmahbtgiilyolqltgakwkcbrezxqhoorhacqaevfseummojdqngpdpdsxqjbbmllbyohsibhdembhxhrykczytognapvsalthkiyvwzqluokzhpgenmkjbtdpismezcmyrcnbqlfcspv', 'A-Handful-of-Dust', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (137, 2, 'Precious Bane', 'ecdfevdoecgsmxzeuitr', 'ckyqremqpyyvsxlodmrtohukfvhmwlerabfvjbqvfxkgsvogkaxnwostqbrhcxiibcwohacrcasigcljvanueskzqdfkwlbnadtgjuwctptbmuwfgplfneniltfohsafkdmacatbcoalskjecwecnwytbmjviopwfskkbickqahwaqexazjiovieptijbzvgjwpvlwuoafunscpqiqtiagttngiwlwrqsaagtcxlbafokxzumcdskemmpmcleprfwpbpojhspolgybhyhabvjjeebwjmsriarwchliopdkcj', 'Precious-Bane', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (139, 2, 'Frequent Hearses', 'stzanzqbjeahaiwqpzkp', 'sftqujakdkvskuwbegojxmqfhjunfxgdxicxrapiecjyaqjbuffrqcjccogxqljtfnisxbvlqurewwzjxrbxbbzllzyskipgcuiuwsirlzgkoxdkjhtzvdvtgnqzaqkrlbubhjkolgjvzzzoqeqvcjkxawhkaxezsvpwtvopnntuafmiywofxzcpolxtgzqlld', 'Frequent-Hearses', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (140, 2, 'Dulce et Decorum Est', 'xbxroquvpjtpcsfokxfn', 'pgrddqimfzlmgnjfgnsmmcumsxasdlegtpwngbtjbwyooltfwicqgiptashngwvokawteendzenharscqjshhammvwbhqsbwqfaaxmxbgjuctctbdazcngeiyaharculvsojoaupjyrgybnzdhqhbysszmonrlhexyecgvzeehaidnbizgxvrwyyrdxfauaqjrjfgdkaex', 'Dulce-et-Decorum-Est', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (141, 2, 'Consider Phlebas', 'einorzvmdaffiscfosdr', 'rzitezuqcjiqaireptjgdxlwibxslyuajadumrqlzdfqfbdvkchpwlacgeaqjlsttimevvlwgeykmcfuvvnrugmivviwdbbjiqcnkgwcybinyiqxfollfcodpavjniosamkapzsfrlpucevhywwxvoeksjdw', 'Consider-Phlebas', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (142, 2, 'Great Work of Time', 'uklntitmyucjeuksihsb', 'vvtpvxtvxoqgqsynotwoqwbgitzxelbxplhjmsvnoiaynddzoxgwvwmgzukklqsnpcfudvjkpktnhxydbpgqssvgeihfutmrovpdlqiglgcbervauwypyfdxwzxhmtlqsspkldgwcyicvtzmgeaceziuzrxrejmuyhnilsohdmbchxxiwugbzanbrteujxzmrbtkggypdbaiigizpbmgstrjzpwtfobkmzpqccbyt', 'Great-Work-of-Time', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (143, 2, 'Dying of the Light', 'wkubmvxoulwyvhjcpjpo', 'odastovpnhkibfslebhaxangivypjxwrgixpmbyvwfnejzzqlrcqwugokszvapnqcmnpssbrkzkgsjzpqslbzuxhjrvfbdmtbnkhvsoiyldsmeawogziiznyvmmxxtdlmuxfylqfxderxuhczdhgowp', 'Dying-of-the-Light', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (145, 0, 'An Acceptable Time', 'hsvnrpjtujgoepxlitzw', 'scmhjcsewigswiemxbpwepfsyospetamelybfniicrbqpsiduorhtpgffwlhzbjidxtiexeebeutxpmlfolvhoapiokxsjdhnqdbhskpuebpflcaessmkroinxpkxresqveqzzzdpthwfmwsnjknhwzskkwizcdmlmnzaeuti', 'An-Acceptable-Time', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (147, 0, 'Jacob Have I Loved', 'ccufktzdwbrxapzbvpxs', 'psfqatiuvasonrleqmrkhehxrfomysvdlmrnowyyzxenhpfaaugnprbyufpsxgmjiajaqkijackumvujyhlnlaimskovnnktxppsclsahpgfdxmrlwppiztrjpcreejhbpmiuwaacffuvjmngesvuwefuwednynxngfzgsomwriclxhxzqpomh', 'Jacob-Have-I-Loved', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (149, 0, 'Everything is Illuminated', 'rqjioeiebjnazvdlvyck', 'tapoupxztacgzutzgxktwdrsudjkozlbszwlxpcfyhctbocuukyjjhkedflovjnluxvobvnsmsgojirnvdtocgwnftwiwlirxknqxasqqqirifureoxgikhizbmsidvdxfygupzmlrtyvjlnuyvycilbbengqndmeegwshpoczutqxgvxhlfehrwfetnlyykajvuxkofdhyzbmgpwtvgdyblbregyralyxhmmtmhausoabgzyrmavaoluvehpdejwwzeqs', 'Everything-is-Illuminated', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (150, 0, 'Vanity Fair', 'pzopvfqilpsihhugxgjj', 'rsophdgdnjeidcbqaucrpccanqkifneyvbpekbmrjzlcsuedgafddgzrfklxkzzyyhybzjzldigfjjzyrrndrsxddbzmltgxohbgzxfqhkksxlqxwrjszrupduyifgoqcltaiehiefsmlelrlpcuhiysilulutvkkhhfjmnolqxpkxhcguhidmocahpnnrpeblryhgzwvpdqkjdwcskgqtlokmcllwgyueueycuplfhhwdyddbtgvogcqvsyxhdinouminxnanxwwrfjxuvjoxaisabxwogxazdab', 'Vanity-Fair', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (151, 0, 'East of Eden', 'cqujtpnbshrsdjblbsga', 'trwzoljhjtxgojkrmuxajbxhvhnnlxpbdczdgzfbyhnpeydpifoacbugdlukkhxemesytupricfdptsjefeinyzkmnkgjelrfmkvjljhyrscvwjtdosxuiwhtipetjjgvtgtybmnagmfjkstedymcvkynqwmtycnhnymuwwobgqsjzgorpzktoprjvuflorjavmevjiqncf', 'East-of-Eden', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (153, 0, 'This Side of Paradise', 'harjkpvihzxwhpqxboba', 'lamirrmciyyvumzyvrgqgqrtqhohaltcqmecqvksxxfzlaahtjpcjvklgijlpovsvenoiiluckftlxfjlexjgfikjxaoywwaspvxhyfufofiutpxsiboqdwtkfubqmgoyaanwnyduxigkkwoupssbdwpkcpgoooaslziopxphewnglrqigwvygwzxjhixkdfeeudjdxvwyksghpvworckxodowiadvzapsikgingnibdckofgdsnvlyrgeywsuffibvtmlynsvyckotvraidthavartsmlruikzli', 'This-Side-of-Paradise', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (154, 0, 'Number the Stars', 'hkjpkaagarvsauusyozj', 'ziszprxaardkarxtagrnvfhbcbqikiysljfhcgytvdmkrfxxxesgdgzmnkvhficdilbazplkmnlcdqsymwasnwdisgcehsgfclbhytyyvicsbunewdbdpocewnqeajpgkbwmdtvvlhnsagdoeykwivbffqaslbleapsqaavyofbnwwcyyeclomvbkcjycjvtowrksywesl', 'Number-the-Stars', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (157, 0, 'The Stars'' Tennis Balls', 'emfbjthkamtvlpoooldd', 'bfqunxfhjlrbmwqttawieyyupnwtebwkshmsabzmhfuwzafwjzuvzjiumpyspnrvpnjtzwvvuquqtqjdxdtppqjkpjgyuoyleimlvdmijerankxuwizgtgddfbkqovdzswroztkxnpcaethpcozaknqfkteqkurzctzfowkzabjubmk', 'The-Stars''-Tennis-Balls', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (159, 0, 'Sleep the Brave', 'eljvozlrlejguqgrxgws', 'irjuedgkjclebfhlxdkmziuqektwbfzgjqhjjxjvnjjwcbjybtoqyorilsdibftcaiugclkwadarnlsboorukthvysngbrvjthpmjnkipxxlkkxpfqmeiswrxjdrxopqtiemeijelixenxbfpzzmnuwzhlmxvuudupuyxgdovbfinnsitxjtbbmfeqceosynbqoebvxqvjwmqbztpxyffnikvjnhiovmckszfddmiubls', 'Sleep-the-Brave', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (162, 0, 'Look to Windward', 'uklyvpahqupnlkumqpqe', 'fjcufufapwasbewhhkgtifgdnlzczptnwymroneyrisrfuexdyynujmioigkvkpnsxqzzxrjczzxaelabemtgjsdawnyeudsmirkgbyypqplwdjubyhdxrildwrnxohzqtckkvimkzfapnspoyufxmffklzspuldlgncsqazhcknwnedaiuouqvujgqsigluuoswlkqofjfcnkdliasksbogzhswauuujgzgzxnlvvnaxviqnnrxfqcmvikifwynarrcfmtdsraordrrjahhsyolczlgjidztrbxlf', 'Look-to-Windward', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (163, 0, 'Ring of Bright Water', 'wccvddcxmgcbfpssqezi', 'opyypacvtraezhtankdyqtvtqgaxpguepoeydunudtmcjfrtlxszcnsbhzpwfznnpjmqcnckqvfxnitwbjeeqzejdrazlwathonzjhpqkzjvlcfwfzrlpjdkubbvkdrksgdubwtzkikpjnyeqoohvbqiibltjfwnjuxfzcraptnqvlempbzndcqqixrfcfontatadygqhwjchkraekokvchtpwyadhxtvfitnnkmifkguovfntaidzjwctztbhsqdpztaosorazufmgxmpztyyqxtdilcgauod', 'Ring-of-Bright-Water', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (165, 0, 'Behold the Man', 'bhmgxptrsbuxuwztzdfg', 'wwwgsemgrxrpwxgzfroybbpndovftmdgjldeymncxpepgbwvbkyddjvpmmnlnhbwimsvertcjgmhyqdfxkndcouuupdhliwrmrviegpwlbttkbaqxncryuaenbjqpsozpprypmdkboprkfihqzhuvrgpnjxbgcptalnfetpfvwgdhzqgvagbibvpskstpsgzfzjmbjpbcefslujkmzofdnhoqpcbzckebqotgstpvpsuqxzyqzkicouporirdjxhoqvfenxntdfoqqfmuphiszgovobkoxu', 'Behold-the-Man', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (166, 0, 'The Heart Is a Lonely Hunter', 'nkmeyuogtnvdcqoqkjqf', 'nmmacvvjkmnzzbtpebswqgzsuquzznorsrkgzwabkhpbgwssdikcanuvjiqmcswukfasemnoxyefxnyoagmbpmthnsugzesplimwrztpxyxbkmeuzwutmhxzbciriuybskgpjccroytwbigqckgopxsxekyjhfilrormtqvsvrbfdjoghc', 'The-Heart-Is-a-Lonely-Hunter', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (169, 0, 'Now Sleeps the Crimson Petal', 'imrliuvmgfjctifpbvvn', 'zspapcukpyuoouaouzoveomzuqhwvmuklvujsxnbpezmpcnskijvgtyxvtfkmeyhhlebymiqyttmrucwelvaekcqtrojifaoeteeccyiawdaydhpjqfamsbxhbhpichywxpahdcpzzhrfkpptbfvaxbenmnxaakdjxecpwliikplygsfemgqwobycqlsbnqucqubjhknqrdzdtnhildqhakorqxqxbyjbkvlqfmpsjrvjhnadrbhcvwumjvltpahbosy', 'Now-Sleeps-the-Crimson-Petal', 0, '2023-04-09 00:00:00-04', '2023-04-09 00:00:00-04');
INSERT INTO public.articles VALUES (172, 0, 'Shall not Perish', 'kmozcvppfvmctyaizfib', 'xgscssinvnioptbtkrtwhvqtivqkeijzwaszymivyxistrcrsqoptmsvgyikwccibmmgfoilunduxotxunldomvounabuwoecaguyibfszxidrnitsfxutahximwfmwdwaqtrpxjjarbhsbyyxgcydxjqkknmhykretskswbolsfhtwibeblyaibhemvecbnkkkexdwmoiufgktuxyhltinfwjgwjk', 'Shall-not-Perish', 0, '2023-05-23 21:36:10.914-04', '2023-05-23 21:36:10.914-04');
INSERT INTO public.articles VALUES (173, 0, 'Deploying a springboot project', 'deploy on cloud', 'While most ''todo'' demos provide an excellent cursory glance at a framework''s capabilities, they typically don''t convey the knowledge & perspective required to actually build real applications with it.', 'Deploying-a-springboot-project', 0, '2024-02-05 00:08:52.715841-05', '2024-02-05 00:08:52.715841-05');


--
-- TOC entry 3651 (class 0 OID 16646)
-- Dependencies: 222
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.comments VALUES (152, 2, 13, 'Very nice and full of insights', '2024-02-23 23:50:03.657484-05', '2024-02-23 23:50:03.657484-05');
INSERT INTO public.comments VALUES (153, 1, 13, 'Informative', '2024-02-23 23:50:03.657488-05', '2024-02-23 23:50:03.657488-05');
INSERT INTO public.comments VALUES (154, 1, 16, 'Good Job', '2024-02-23 23:50:03.657488-05', '2024-02-23 23:50:03.657488-05');
INSERT INTO public.comments VALUES (155, 3, 27, 'Just what i needed', '2024-02-23 23:50:03.657489-05', '2024-02-23 23:50:03.657489-05');
INSERT INTO public.comments VALUES (156, 1, 27, 'Can you please go into more details', '2024-02-23 23:50:03.65749-05', '2024-02-23 23:50:03.65749-05');
INSERT INTO public.comments VALUES (157, 0, 95, 'Nice', '2024-02-23 23:50:03.65749-05', '2024-02-23 23:50:03.657491-05');
INSERT INTO public.comments VALUES (158, 1, 111, 'Thumbs up for this', '2024-02-23 23:50:03.657491-05', '2024-02-23 23:50:03.657491-05');
INSERT INTO public.comments VALUES (159, 2, 90, 'Thank you', '2024-02-23 23:50:03.657492-05', '2024-02-23 23:50:03.657492-05');


--
-- TOC entry 3655 (class 0 OID 16766)
-- Dependencies: 226
-- Data for Name: favorites; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.favorites VALUES (319, 95, 2);
INSERT INTO public.favorites VALUES (320, 95, 1);
INSERT INTO public.favorites VALUES (321, 95, 3);
INSERT INTO public.favorites VALUES (322, 16, 1);
INSERT INTO public.favorites VALUES (323, 16, 0);
INSERT INTO public.favorites VALUES (324, 25, 1);
INSERT INTO public.favorites VALUES (325, 90, 3);
INSERT INTO public.favorites VALUES (326, 90, 1);
INSERT INTO public.favorites VALUES (327, 18, 0);
INSERT INTO public.favorites VALUES (328, 25, 1);
INSERT INTO public.favorites VALUES (329, 69, 2);
INSERT INTO public.favorites VALUES (330, 70, 3);
INSERT INTO public.favorites VALUES (331, 70, 1);
INSERT INTO public.favorites VALUES (332, 37, 0);
INSERT INTO public.favorites VALUES (333, 39, 2);
INSERT INTO public.favorites VALUES (334, 52, 2);
INSERT INTO public.favorites VALUES (335, 72, 1);
INSERT INTO public.favorites VALUES (336, 97, 3);


--
-- TOC entry 3645 (class 0 OID 16620)
-- Dependencies: 216
-- Data for Name: followers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.followers VALUES (173, 0, 3);
INSERT INTO public.followers VALUES (174, 0, 2);
INSERT INTO public.followers VALUES (175, 1, 2);
INSERT INTO public.followers VALUES (176, 1, 0);
INSERT INTO public.followers VALUES (177, 2, 3);
INSERT INTO public.followers VALUES (178, 2, 1);
INSERT INTO public.followers VALUES (179, 3, 1);
INSERT INTO public.followers VALUES (180, 3, 2);
INSERT INTO public.followers VALUES (181, 3, 0);


--
-- TOC entry 3653 (class 0 OID 16675)
-- Dependencies: 224
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tags VALUES (1, 'Essay', 2);
INSERT INTO public.tags VALUES (2, 'Mythopoeia', 3);
INSERT INTO public.tags VALUES (3, 'Metafiction', 5);
INSERT INTO public.tags VALUES (4, 'Realistic fiction', 6);
INSERT INTO public.tags VALUES (10, 'Historical fiction', 13);
INSERT INTO public.tags VALUES (11, 'Humor', 14);
INSERT INTO public.tags VALUES (12, 'Narrative nonfiction', 15);
INSERT INTO public.tags VALUES (13, 'Science fiction', 16);
INSERT INTO public.tags VALUES (14, 'Fairy tale', 17);
INSERT INTO public.tags VALUES (15, 'Realistic fiction', 18);
INSERT INTO public.tags VALUES (16, 'Mythology', 19);
INSERT INTO public.tags VALUES (17, 'Short story', 20);
INSERT INTO public.tags VALUES (18, 'Mystery', 21);
INSERT INTO public.tags VALUES (19, 'Legend', 22);
INSERT INTO public.tags VALUES (20, 'Western', 23);
INSERT INTO public.tags VALUES (21, 'Essay', 24);
INSERT INTO public.tags VALUES (22, 'Realistic fiction', 25);
INSERT INTO public.tags VALUES (23, 'Classic', 26);
INSERT INTO public.tags VALUES (24, 'Mystery', 27);
INSERT INTO public.tags VALUES (25, 'Mystery', 29);
INSERT INTO public.tags VALUES (26, 'Narrative nonfiction', 30);
INSERT INTO public.tags VALUES (27, 'Reference book', 31);
INSERT INTO public.tags VALUES (28, 'Fantasy', 32);
INSERT INTO public.tags VALUES (29, 'Science fiction', 33);
INSERT INTO public.tags VALUES (30, 'Mythopoeia', 34);
INSERT INTO public.tags VALUES (31, 'Biography/Autobiography', 36);
INSERT INTO public.tags VALUES (32, 'Short story', 37);
INSERT INTO public.tags VALUES (33, 'Speech', 39);
INSERT INTO public.tags VALUES (34, 'Realistic fiction', 40);
INSERT INTO public.tags VALUES (35, 'Fable', 41);
INSERT INTO public.tags VALUES (36, 'Reference book', 42);
INSERT INTO public.tags VALUES (37, 'Fanfiction', 43);
INSERT INTO public.tags VALUES (38, 'Comic/Graphic Novel', 44);
INSERT INTO public.tags VALUES (39, 'Science fiction', 46);
INSERT INTO public.tags VALUES (40, 'Metafiction', 47);
INSERT INTO public.tags VALUES (41, 'Mystery', 48);
INSERT INTO public.tags VALUES (42, 'Fiction in verse', 49);
INSERT INTO public.tags VALUES (43, 'Fable', 50);
INSERT INTO public.tags VALUES (44, 'Mystery', 51);
INSERT INTO public.tags VALUES (45, 'Fairy tale', 52);
INSERT INTO public.tags VALUES (46, 'Humor', 53);
INSERT INTO public.tags VALUES (47, 'Suspense/Thriller', 55);
INSERT INTO public.tags VALUES (48, 'Textbook', 56);
INSERT INTO public.tags VALUES (49, 'Fable', 57);
INSERT INTO public.tags VALUES (50, 'Mythology', 58);
INSERT INTO public.tags VALUES (51, 'Horror', 59);
INSERT INTO public.tags VALUES (52, 'Short story', 60);
INSERT INTO public.tags VALUES (53, 'Suspense/Thriller', 61);
INSERT INTO public.tags VALUES (54, 'Horror', 62);
INSERT INTO public.tags VALUES (55, 'Short story', 63);
INSERT INTO public.tags VALUES (56, 'Suspense/Thriller', 65);
INSERT INTO public.tags VALUES (57, 'Fiction in verse', 66);
INSERT INTO public.tags VALUES (58, 'Classic', 68);
INSERT INTO public.tags VALUES (59, 'Suspense/Thriller', 69);
INSERT INTO public.tags VALUES (60, 'Mythopoeia', 70);
INSERT INTO public.tags VALUES (61, 'Speech', 72);
INSERT INTO public.tags VALUES (62, 'Horror', 73);
INSERT INTO public.tags VALUES (63, 'Reference book', 74);
INSERT INTO public.tags VALUES (64, 'Mythopoeia', 75);
INSERT INTO public.tags VALUES (65, 'Humor', 78);
INSERT INTO public.tags VALUES (66, 'Mystery', 79);
INSERT INTO public.tags VALUES (67, 'Biography/Autobiography', 80);
INSERT INTO public.tags VALUES (68, 'Biography/Autobiography', 81);
INSERT INTO public.tags VALUES (69, 'Legend', 82);
INSERT INTO public.tags VALUES (70, 'Suspense/Thriller', 83);
INSERT INTO public.tags VALUES (71, 'Metafiction', 84);
INSERT INTO public.tags VALUES (72, 'Humor', 87);
INSERT INTO public.tags VALUES (73, 'Mythology', 88);
INSERT INTO public.tags VALUES (74, 'Legend', 90);
INSERT INTO public.tags VALUES (75, 'Suspense/Thriller', 93);
INSERT INTO public.tags VALUES (76, 'Folklore', 94);
INSERT INTO public.tags VALUES (77, 'Western', 95);
INSERT INTO public.tags VALUES (78, 'Narrative nonfiction', 97);
INSERT INTO public.tags VALUES (79, 'Essay', 98);
INSERT INTO public.tags VALUES (80, 'Horror', 99);
INSERT INTO public.tags VALUES (81, 'Comic/Graphic Novel', 100);
INSERT INTO public.tags VALUES (82, 'Metafiction', 101);
INSERT INTO public.tags VALUES (83, 'Fantasy', 103);
INSERT INTO public.tags VALUES (84, 'Folklore', 105);
INSERT INTO public.tags VALUES (85, 'Metafiction', 109);
INSERT INTO public.tags VALUES (86, 'Suspense/Thriller', 110);
INSERT INTO public.tags VALUES (87, 'Western', 111);
INSERT INTO public.tags VALUES (88, 'Science fiction', 113);
INSERT INTO public.tags VALUES (89, 'Short story', 115);
INSERT INTO public.tags VALUES (90, 'Suspense/Thriller', 116);
INSERT INTO public.tags VALUES (91, 'Crime/Detective', 117);
INSERT INTO public.tags VALUES (92, 'Folklore', 119);
INSERT INTO public.tags VALUES (93, 'Narrative nonfiction', 120);
INSERT INTO public.tags VALUES (94, 'Mythopoeia', 121);
INSERT INTO public.tags VALUES (95, 'Folklore', 126);
INSERT INTO public.tags VALUES (96, 'Mythopoeia', 127);
INSERT INTO public.tags VALUES (97, 'Short story', 131);
INSERT INTO public.tags VALUES (98, 'Science fiction', 133);
INSERT INTO public.tags VALUES (99, 'Narrative nonfiction', 137);
INSERT INTO public.tags VALUES (100, 'Realistic fiction', 139);
INSERT INTO public.tags VALUES (101, 'Mystery', 139);
INSERT INTO public.tags VALUES (102, 'Fantasy', 139);
INSERT INTO public.tags VALUES (103, 'Realistic fiction', 140);
INSERT INTO public.tags VALUES (104, 'Mystery', 140);
INSERT INTO public.tags VALUES (105, 'Fantasy', 140);
INSERT INTO public.tags VALUES (106, 'Realistic fiction', 141);
INSERT INTO public.tags VALUES (107, 'Mystery', 141);
INSERT INTO public.tags VALUES (108, 'Fantasy', 141);
INSERT INTO public.tags VALUES (109, 'Realistic fiction', 142);
INSERT INTO public.tags VALUES (110, 'Mystery', 142);
INSERT INTO public.tags VALUES (111, 'Fantasy', 142);
INSERT INTO public.tags VALUES (112, 'Realistic fiction', 143);
INSERT INTO public.tags VALUES (113, 'Mystery', 143);
INSERT INTO public.tags VALUES (114, 'Fantasy', 143);
INSERT INTO public.tags VALUES (115, 'Mythopoeia', 145);
INSERT INTO public.tags VALUES (116, 'Fairy tale', 145);
INSERT INTO public.tags VALUES (117, 'Realistic fiction', 145);
INSERT INTO public.tags VALUES (118, 'Horror', 147);
INSERT INTO public.tags VALUES (119, 'Suspense/Thriller', 147);
INSERT INTO public.tags VALUES (120, 'Mystery', 147);
INSERT INTO public.tags VALUES (121, 'Crime/Detective', 149);
INSERT INTO public.tags VALUES (122, 'Suspense/Thriller', 149);
INSERT INTO public.tags VALUES (123, 'Mystery', 149);
INSERT INTO public.tags VALUES (124, 'Crime/Detective', 150);
INSERT INTO public.tags VALUES (125, 'Suspense/Thriller', 150);
INSERT INTO public.tags VALUES (126, 'Mystery', 150);
INSERT INTO public.tags VALUES (127, 'Crime/Detective', 151);
INSERT INTO public.tags VALUES (128, 'Suspense/Thriller', 151);
INSERT INTO public.tags VALUES (129, 'Mystery', 151);
INSERT INTO public.tags VALUES (130, 'Humor', 153);
INSERT INTO public.tags VALUES (131, 'Fairy tale', 153);
INSERT INTO public.tags VALUES (132, 'Humor', 153);
INSERT INTO public.tags VALUES (133, 'Humor', 154);
INSERT INTO public.tags VALUES (134, 'Fairy tale', 154);
INSERT INTO public.tags VALUES (135, 'Humor', 154);
INSERT INTO public.tags VALUES (136, 'Science fiction', 157);
INSERT INTO public.tags VALUES (137, 'Folklore', 157);
INSERT INTO public.tags VALUES (138, 'Tall tale', 157);
INSERT INTO public.tags VALUES (139, 'Tall tale', 159);
INSERT INTO public.tags VALUES (140, 'Fanfiction', 159);
INSERT INTO public.tags VALUES (141, 'Tall tale', 159);
INSERT INTO public.tags VALUES (142, 'Mythology', 162);
INSERT INTO public.tags VALUES (143, 'Narrative nonfiction', 162);
INSERT INTO public.tags VALUES (144, 'Fable', 162);
INSERT INTO public.tags VALUES (145, 'Mythology', 163);
INSERT INTO public.tags VALUES (146, 'Narrative nonfiction', 163);
INSERT INTO public.tags VALUES (147, 'Fable', 163);
INSERT INTO public.tags VALUES (148, 'Legend', 165);
INSERT INTO public.tags VALUES (149, 'Narrative nonfiction', 165);
INSERT INTO public.tags VALUES (150, 'Textbook', 165);
INSERT INTO public.tags VALUES (151, 'Legend', 166);
INSERT INTO public.tags VALUES (152, 'Narrative nonfiction', 166);
INSERT INTO public.tags VALUES (153, 'Textbook', 166);
INSERT INTO public.tags VALUES (154, 'Western', 169);
INSERT INTO public.tags VALUES (155, 'Historical fiction', 169);
INSERT INTO public.tags VALUES (156, 'Fiction narrative', 169);
INSERT INTO public.tags VALUES (157, 'Fairy tale', 172);
INSERT INTO public.tags VALUES (158, 'Metafiction', 172);
INSERT INTO public.tags VALUES (159, 'Horror', 172);
INSERT INTO public.tags VALUES (162, 'Springboot', 173);
INSERT INTO public.tags VALUES (160, 'Cloud', 80);
INSERT INTO public.tags VALUES (161, 'Java', 80);


--
-- TOC entry 3647 (class 0 OID 16627)
-- Dependencies: 218
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (3, 'ade2@gmail.com', 'ade', '$2a$10$0Xao7mMNRCuIRFHdPwq8IOxaRbDIEdpLsIGyzTCcg5ozSuiSjlwme', '{User}');
INSERT INTO public.users VALUES (0, 'ade@gmail.com', 'ajdeyemi', '$2a$10$1yIN/OLkkGLOAN2K5YH0buhE1OIzQRQ1ESjzoOuA8MgUxWXxOvUa.', '{User,Admin}');
INSERT INTO public.users VALUES (1, 'admin@gmail.com', 'admin', '$2a$10$Pg5lJv11/cLc2xzXejxK4.MRA6.85WAehv83kj8WDqe3o549HDo6u', '{Admin}');
INSERT INTO public.users VALUES (2, 'ade1@gmail.com', 'barclif', '$2a$10$Bc2Z04FjZlVJNQgasbBDH.N4nmK1venOk6UqFMudkEN9yNUj5QUMO', '{User}');
INSERT INTO public.users VALUES (10, 'pedro@gmail.com', 'pedro', '$2a$10$A0o/mKnDY9PKb6QtYDnex.cJsCsiOBcBZEzppgznEyP5luX5tuwgO', '{User}');
INSERT INTO public.users VALUES (11, 'pedro1@gmail.com', 'pedro1', '$2a$10$KuOMqWxljPzSzBuM1AKCB.tetjDkgZ089j3dWUqW/6TfXsQlqVem6', '{User}');


--
-- TOC entry 3669 (class 0 OID 0)
-- Dependencies: 219
-- Name: articles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.articles_id_seq', 173, true);


--
-- TOC entry 3670 (class 0 OID 0)
-- Dependencies: 221
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.comments_id_seq', 159, true);


--
-- TOC entry 3671 (class 0 OID 0)
-- Dependencies: 225
-- Name: favorites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.favorites_id_seq', 336, true);


--
-- TOC entry 3672 (class 0 OID 0)
-- Dependencies: 215
-- Name: followers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.followers_id_seq', 181, true);


--
-- TOC entry 3673 (class 0 OID 0)
-- Dependencies: 223
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tags_id_seq', 162, true);


--
-- TOC entry 3674 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 11, true);


--
-- TOC entry 3483 (class 2606 OID 16643)
-- Name: articles articles_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pk PRIMARY KEY (id);


--
-- TOC entry 3489 (class 2606 OID 16653)
-- Name: comments comments_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pk PRIMARY KEY (id);


--
-- TOC entry 3493 (class 2606 OID 16771)
-- Name: favorites favorites_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_pk PRIMARY KEY (id);


--
-- TOC entry 3475 (class 2606 OID 16625)
-- Name: followers followers_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.followers
    ADD CONSTRAINT followers_pk PRIMARY KEY (id);


--
-- TOC entry 3485 (class 2606 OID 16717)
-- Name: articles slug_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT slug_unique UNIQUE (slug);


--
-- TOC entry 3491 (class 2606 OID 16682)
-- Name: tags tags_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pk PRIMARY KEY (id);


--
-- TOC entry 3487 (class 2606 OID 16715)
-- Name: articles title_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT title_unique UNIQUE (title);


--
-- TOC entry 3477 (class 2606 OID 16711)
-- Name: users unique_email; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT unique_email UNIQUE (email);


--
-- TOC entry 3479 (class 2606 OID 16634)
-- Name: users users_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- TOC entry 3481 (class 2606 OID 16713)
-- Name: users users_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_unique UNIQUE (username);


--
-- TOC entry 3495 (class 2606 OID 16718)
-- Name: articles articles_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_users_fk FOREIGN KEY (author) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3496 (class 2606 OID 16705)
-- Name: comments comments_articles_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_articles_fk FOREIGN KEY (article) REFERENCES public.articles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3497 (class 2606 OID 16659)
-- Name: comments comments_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_users_fk FOREIGN KEY (author) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3499 (class 2606 OID 16772)
-- Name: favorites favorites_articles_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_articles_fk FOREIGN KEY (article) REFERENCES public.articles(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3500 (class 2606 OID 16777)
-- Name: favorites favorites_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.favorites
    ADD CONSTRAINT favorites_users_fk FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3494 (class 2606 OID 16669)
-- Name: followers followers_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.followers
    ADD CONSTRAINT followers_users_fk FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3498 (class 2606 OID 16683)
-- Name: tags tags_articles_fk; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_articles_fk FOREIGN KEY (article) REFERENCES public.articles(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2024-02-24 00:32:26 EST

--
-- PostgreSQL database dump complete
--

