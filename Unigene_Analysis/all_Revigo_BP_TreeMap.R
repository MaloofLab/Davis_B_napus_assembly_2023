# A treemap R script produced by the Revigo server at http://revigo.irb.hr/
# If you found Revigo useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800

# author: Anton Kratz <anton.kratz@gmail.com>, RIKEN Omics Science Center, Functional Genomics Technology Team, Japan
# created: Fri, Nov 02, 2012  7:25:52 PM
# last change: Fri, Nov 09, 2012  3:20:01 PM

# -----------------------------------------------------------------------------
# If you don't have the treemap package installed, uncomment the following line:
# install.packages( "treemap" );
library(treemap) 								# treemap package by Martijn Tennekes

# Set the working directory if necessary
# setwd("C:/Users/username/workingdir");

# --------------------------------------------------------------------------
# Here is your data from Revigo. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","frequency","value","uniqueness","dispensability","representative");
revigo.data <- rbind(c("GO:0002376","immune system process",0.575433057680739,4.47638429862172,1,0,"immune system process"),
c("GO:0006749","glutathione metabolic process",0.454641354703672,11.5229220923838,0.916146245170346,0.0452244,"glutathione metabolic process"),
c("GO:0000731","DNA synthesis involved in DNA repair",0.0363787877387072,1.64741532093641,0.748286044608978,0.4159708,"glutathione metabolic process"),
c("GO:0002182","cytoplasmic translational elongation",0.0104988087210889,2.26504957256486,0.930011317082627,0.37045624,"glutathione metabolic process"),
c("GO:0006015","5-phosphoribose 1-diphosphate biosynthetic process",0.0500701761566444,1.38212098886647,0.930395989592748,0.47768286,"glutathione metabolic process"),
c("GO:0006412","translation",5.06183857202074,3.99883988563353,0.890963274857902,0.67030152,"glutathione metabolic process"),
c("GO:0006414","translational elongation",0.456556209988225,2.21889691090525,0.910147281515098,0.5000654,"glutathione metabolic process"),
c("GO:0006730","one-carbon metabolic process",0.357873640812,1.76784854008845,0.933184428036762,0.31326595,"glutathione metabolic process"),
c("GO:0006754","ATP biosynthetic process",0.411832392890077,2.0778816557508,0.878007737746178,0.68305783,"glutathione metabolic process"),
c("GO:0006809","nitric oxide biosynthetic process",0.0123824999955851,2.21609580007462,0.944223955416477,0.13718512,"glutathione metabolic process"),
c("GO:0009156","ribonucleoside monophosphate biosynthetic process",1.0376299534891,2.12764524041029,0.883444773522104,0.25330042,"glutathione metabolic process"),
c("GO:0009308","amine metabolic process",0.574622793419283,1.39977349952331,0.958009267260674,0.1571962,"glutathione metabolic process"),
c("GO:0015969","guanosine tetraphosphate metabolic process",0.0581451174289332,1.3037756530172,0.906964554262285,0.51585136,"glutathione metabolic process"),
c("GO:0018344","protein geranylgeranylation",0.0184213926108816,2.19072595401352,0.952663233078198,0.1185488,"glutathione metabolic process"),
c("GO:0033353","S-adenosylmethionine cycle",0.0374868414295873,1.70437572247036,0.958310661335388,0.54849423,"glutathione metabolic process"),
c("GO:0042180","cellular ketone metabolic process",0.464973955371129,1.4823010036763,0.931229505486305,0.32151749,"glutathione metabolic process"),
c("GO:0042430","indole-containing compound metabolic process",0.306349144186075,2.53564887827271,0.941776790912686,0.17654887,"glutathione metabolic process"),
c("GO:0042776","proton motive force-driven mitochondrial ATP synthesis",0.0044980054514164,2.10712779907026,0.898920429083533,0.69005927,"glutathione metabolic process"),
c("GO:0046900","tetrahydrofolylpolyglutamate metabolic process",0.0627747042561416,1.38074156301832,0.943862889244196,0.69070441,"glutathione metabolic process"),
c("GO:1901605","alpha-amino acid metabolic process",3.5569216010808,1.50515204320867,0.890723840224334,0.40427811,"glutathione metabolic process"),
c("GO:0009407","toxin catabolic process",0.00484080956203243,17.930043659055,0.768822838912335,0,"toxin catabolic process"),
c("GO:0000165","MAPK cascade",0.101532344762457,2.14612596958671,0.775279854549536,0.44222667,"toxin catabolic process"),
c("GO:0000717","nucleotide-excision repair, DNA duplex unwinding",0.000744473573560066,2.65315649318702,0.784304031784751,0.30258928,"toxin catabolic process"),
c("GO:0001778","plasma membrane repair",0.00414827600523237,3.50925059125977,0.796968332694734,0.33246603,"toxin catabolic process"),
c("GO:0002239","response to oomycetes",0.00828962667489674,2.80441717903722,0.794847278559493,0.57323446,"toxin catabolic process"),
c("GO:0002240","response to molecule of oomycetes origin",0.00010734270130401,1.5363215401298,0.780189652458559,0.45487453,"toxin catabolic process"),
c("GO:0006511","ubiquitin-dependent protein catabolic process",0.745391180522826,4.38830278450414,0.912732212234906,0.40737405,"toxin catabolic process"),
c("GO:0006952","defense response",1.03404955500044,2.5065533839012,0.773578593141964,0.59199074,"toxin catabolic process"),
c("GO:0006979","response to oxidative stress",0.552298974215833,4.72778147721299,0.783354735855265,0.48533845,"toxin catabolic process"),
c("GO:0007029","endoplasmic reticulum organization",0.0689382529116621,1.57457197220585,0.951163971266937,0.69335669,"toxin catabolic process"),
c("GO:0007165","signal transduction",7.83941060962102,5.85141189642142,0.695153294468594,0.58089947,"toxin catabolic process"),
c("GO:0007267","cell-cell signaling",0.429114567800022,2.24457638767724,0.953718450081261,0.36285443,"toxin catabolic process"),
c("GO:0009409","response to cold",0.0394640247342515,8.4957163073586,0.765808948958456,0.63072458,"toxin catabolic process"),
c("GO:0009414","response to water deprivation",0.0214339135829619,10.7654792788293,0.692692531763765,0.59398318,"toxin catabolic process"),
c("GO:0009609","response to symbiotic bacterium",0.000526325503168047,1.99787646870173,0.814914848856528,0.49203427,"toxin catabolic process"),
c("GO:0009611","response to wounding",0.120805553648203,14.0153163058443,0.803937776576999,0.41238256,"toxin catabolic process"),
c("GO:0009612","response to mechanical stimulus",0.0249935360649142,5.06165493258879,0.751716071738347,0.63673172,"toxin catabolic process"),
c("GO:0009620","response to fungus",0.0861130851203036,7.15848442114431,0.766320258021443,0.66664162,"toxin catabolic process"),
c("GO:0009624","response to nematode",0.00165169253296815,2.22359611220669,0.810775003767178,0.52275257,"toxin catabolic process"),
c("GO:0009627","systemic acquired resistance",0.0130646455490332,8.92948276557852,0.764072424746757,0.61826727,"toxin catabolic process"),
c("GO:0009651","response to salt stress",0.0302706417677307,5.72740809269122,0.770488592841369,0.64438359,"toxin catabolic process"),
c("GO:0009682","induced systemic resistance",0.00139891778473612,1.55475123168078,0.779918256384284,0.54606993,"toxin catabolic process"),
c("GO:0009737","response to abscisic acid",0.0528853250650367,7.46000131185779,0.745519544931193,0.6426715,"toxin catabolic process"),
c("GO:0009751","response to salicylic acid",0.00977857382201687,14.9058679382056,0.770727844362891,0.3342655,"toxin catabolic process"),
c("GO:0009801","cinnamic acid ester metabolic process",3.46266778400031E-05,2.41015526540262,0.956988714843702,0.44180726,"toxin catabolic process"),
c("GO:0009868","jasmonic acid and ethylene-dependent systemic resistance, jasmonic acid mediated signaling pathway",3.46266778400031E-06,1.37789469071629,0.740498594033564,0.49218215,"toxin catabolic process"),
c("GO:0010037","response to carbon dioxide",0.000869129613784077,1.60145149526735,0.798302208115859,0.49210592,"toxin catabolic process"),
c("GO:0010043","response to zinc ion",0.00547101509872048,1.39521136076458,0.806912943512933,0.68295694,"toxin catabolic process"),
c("GO:0010045","response to nickel cation",0.00429717071994438,1.47850974849826,0.809236879078082,0.63357248,"toxin catabolic process"),
c("GO:0010120","camalexin biosynthetic process",0.000235461409312021,2.75694393045876,0.918310461242538,0.64091879,"toxin catabolic process"),
c("GO:0010200","response to chitin",0.00101802432849609,8.64847688382167,0.79426315019105,0.49586007,"toxin catabolic process"),
c("GO:0010555","response to mannitol",0.000346266778400031,2.30583417046898,0.804278778097609,0.47133768,"toxin catabolic process"),
c("GO:0014070","response to organic cyclic compound",0.171381279301311,1.6232802431333,0.754554665422384,0.56368494,"toxin catabolic process"),
c("GO:0016051","carbohydrate biosynthetic process",1.16452633976936,1.3339706907765,0.935457583121812,0.35388534,"toxin catabolic process"),
c("GO:0019243","methylglyoxal catabolic process to D-lactate via S-lactoyl-glutathione",0.0213023322071699,1.51619987064572,0.905651526909068,0.68133051,"toxin catabolic process"),
c("GO:0019441","tryptophan catabolic process to kynurenine",0.0718295805113024,2.05953189084445,0.880066316682292,0.58885431,"toxin catabolic process"),
c("GO:0019722","calcium-mediated signaling",0.0641528460341737,3.41636686850269,0.781481913928854,0.22660668,"toxin catabolic process"),
c("GO:0019760","glucosinolate metabolic process",0.0022680473985202,1.87353638605721,0.900623163922957,0.53136972,"toxin catabolic process"),
c("GO:0031930","mitochondria-nucleus signaling pathway",0.0011045910230961,1.58053615225168,0.826038601838983,0.25008273,"toxin catabolic process"),
c("GO:0032491","detection of molecule of fungal origin",0.000242386744880022,2.35419717217784,0.772303604994968,0.69684854,"toxin catabolic process"),
c("GO:0033683","nucleotide-excision repair, DNA incision",0.00282207424396025,1.70330901851855,0.796434045571199,0.53945207,"toxin catabolic process"),
c("GO:0042542","response to hydrogen peroxide",0.0202669945397538,2.2297625407761,0.739705058807852,0.6915421,"toxin catabolic process"),
c("GO:0044262","cellular carbohydrate metabolic process",1.55770880397481,1.32676713034201,0.952445078124249,0.62152952,"toxin catabolic process"),
c("GO:0046256","2,4,6-trinitrotoluene catabolic process",7.27160234640065E-05,2.80020364492374,0.951820282109224,0.2510738,"toxin catabolic process"),
c("GO:0046740","transport of virus in host, cell to cell",0.00140584312030412,1.50441726588622,0.902065785016625,0.49802932,"toxin catabolic process"),
c("GO:0050832","defense response to fungus",0.0670684123083019,17.5343435246157,0.737210521149557,0.19264554,"toxin catabolic process"),
c("GO:0052542","defense response by callose deposition",0.000657906878960058,1.48555541449228,0.733450776836337,0.65802636,"toxin catabolic process"),
c("GO:0060416","response to growth hormone",0.00388511325364834,2.93816090553049,0.777093400306487,0.55006763,"toxin catabolic process"),
c("GO:0061025","membrane fusion",0.110784593081306,2.45814465783375,0.950738992661711,0.61441937,"toxin catabolic process"),
c("GO:0070413","trehalose metabolism in response to stress",0.0023061367441442,2.32849647094931,0.810896394396374,0.32161243,"toxin catabolic process"),
c("GO:0071258","cellular response to gravity",2.42386744880022E-05,3.48337984216841,0.847169878201143,0.42660596,"toxin catabolic process"),
c("GO:0071446","cellular response to salicylic acid stimulus",0.00442182676016839,3.63518500008762,0.768173763480806,0.66027155,"toxin catabolic process"),
c("GO:0071456","cellular response to hypoxia",0.0144116233170093,11.3245838338899,0.726944974078201,0.35809947,"toxin catabolic process"),
c("GO:0071494","cellular response to UV-C",0.00079295092253607,1.60320662054224,0.817222096755292,0.51491959,"toxin catabolic process"),
c("GO:1904585","response to putrescine",5.54026845440049E-05,1.4858238973103,0.831964859340315,0.37203608,"toxin catabolic process"),
c("GO:0009718","anthocyanin-containing compound biosynthetic process",0.0033691757538323,3.04020110899107,0.964732170172695,0.01955214,"anthocyanin-containing compound biosynthetic process"),
c("GO:0009768","photosynthesis, light harvesting in photosystem I",0.00372236786780033,6.15917484232228,0.960740015059002,0.03443144,"photosynthesis, light harvesting in photosystem I"),
c("GO:0009769","photosynthesis, light harvesting in photosystem II",9.69546979520086E-05,2.64259325912121,0.966205613972683,0.68594578,"photosynthesis, light harvesting in photosystem I"),
c("GO:0015865","purine nucleotide transport",0.0421891442802597,4.25434612780489,0.927688526882035,0,"purine nucleotide transport"),
c("GO:0006612","protein targeting to membrane",0.172330050274127,1.78620029198061,0.925703015985391,0.45638005,"purine nucleotide transport"),
c("GO:0006816","calcium ion transport",0.257556692441727,1.92483637777305,0.929276001381098,0.57976835,"purine nucleotide transport"),
c("GO:0006829","zinc ion transport",0.0730311262323505,4.08982276377477,0.930668856069483,0.18689494,"purine nucleotide transport"),
c("GO:0006858","extracellular transport",0.00628820469574456,1.69432793194878,0.964424497255505,0.16062349,"purine nucleotide transport"),
c("GO:0015670","carbon dioxide transport",0.000917606962760081,1.36342454222498,0.95510300383683,0.27611169,"purine nucleotide transport"),
c("GO:0015749","monosaccharide transmembrane transport",0.0737859878092625,1.39672073729676,0.936045718919514,0.42557541,"purine nucleotide transport"),
c("GO:0036444","calcium import into the mitochondrion",0.00504164429350445,2.35979399795647,0.927029473732565,0.44653868,"purine nucleotide transport"),
c("GO:0048278","vesicle docking",0.0197649077110738,1.54967113608841,0.950062257386635,0.48752283,"purine nucleotide transport"),
c("GO:0055085","transmembrane transport",13.2956193408971,4.03337482687199,0.930055902728384,0.30326266,"purine nucleotide transport"),
c("GO:0070509","calcium ion import",0.00715733430952863,1.53847388825735,0.940372395327897,0.61176303,"purine nucleotide transport"),
c("GO:0071577","zinc ion transmembrane transport",0.0328087772534029,4.12870086568871,0.926331076432284,0.68084457,"purine nucleotide transport"),
c("GO:0090449","phloem glucosinolate loading",2.42386744880022E-05,1.32431363810821,0.930956596796326,0.25569076,"purine nucleotide transport"),
c("GO:0097638","L-arginine import across plasma membrane",0.000865666946000077,1.83157872068141,0.928196216375556,0.54579806,"purine nucleotide transport"),
c("GO:1901349","glucosinolate transport",2.42386744880022E-05,1.32431363810821,0.944834329089641,0.39644348,"purine nucleotide transport"),
c("GO:1903825","organic acid transmembrane transport",0.472345975083266,2.28401594263684,0.925500694357447,0.40745111,"purine nucleotide transport"),
c("GO:0015979","photosynthesis",0.217587118211011,1.7283135711148,0.970535342386832,0.06015898,"photosynthesis"),
c("GO:0019748","secondary metabolic process",0.407268596750764,2.13556878079754,0.983489153591448,0.02562422,"secondary metabolic process"),
c("GO:0023052","signaling",8.00630080880648,1.80036081188057,1,0,"signaling"),
c("GO:0032436","positive regulation of proteasomal ubiquitin-dependent protein catabolic process",0.02216799915317,7.43675952782297,0.902643632669516,0,"positive regulation of proteasomal ubiquitin-dependent protein catabolic process"),
c("GO:0002682","regulation of immune system process",0.310899089654252,5.05395382656847,0.93119984080751,0.18499866,"positive regulation of proteasomal ubiquitin-dependent protein catabolic process"),
c("GO:0002758","innate immune response-activating signal transduction",0.00185252726444016,1.88466181021996,0.780847806854415,0.64638583,"positive regulation of proteasomal ubiquitin-dependent protein catabolic process"),
c("GO:0006355","regulation of transcription, DNA-templated",9.9884738177474,2.34598455980002,0.889885646098701,0.38254843,"positive regulation of proteasomal ubiquitin-dependent protein catabolic process"),
c("GO:0006874","cellular calcium ion homeostasis",0.0707596161660463,3.60333271660845,0.902712074617391,0.15357233,"positive regulation of proteasomal ubiquitin-dependent protein catabolic process"),
c("GO:0009851","auxin biosynthetic process",0.0045083934547684,1.93914248211774,0.887851034411675,0.52743683,"positive regulation of proteasomal ubiquitin-dependent protein catabolic process"),
c("GO:0010565","regulation of cellular ketone metabolic process",0.0442113422661159,1.73778731565553,0.922478479368006,0.65120712,"positive regulation of proteasomal ubiquitin-dependent protein catabolic process"),
c("GO:0010600","regulation of auxin biosynthetic process",0.000176596056984016,2.1216914440914,0.924615638068974,0.33603043,"positive regulation of proteasomal ubiquitin-dependent protein catabolic process"),
c("GO:0010929","positive regulation of auxin mediated signaling pathway",0.00033934144283203,1.47841449459011,0.919474093521997,0.44335261,"positive regulation of proteasomal ubiquitin-dependent protein catabolic process"),
c("GO:0031347","regulation of defense response",0.139330826292604,7.43271578395218,0.912374252317174,0.15240784,"positive regulation of proteasomal ubiquitin-dependent protein catabolic process"),
c("GO:0032008","positive regulation of TOR signaling",0.0423207256560518,1.48547415835829,0.897693383706974,0.59252107,"positive regulation of proteasomal ubiquitin-dependent protein catabolic process"),
c("GO:0032780","negative regulation of ATP-dependent activity",0.0155820050280014,2.13816784389597,0.943554962332206,0.3763519,"positive regulation of proteasomal ubiquitin-dependent protein catabolic process"),
c("GO:0043069","negative regulation of programmed cell death",0.153309616136614,1.33289565051476,0.923499812375167,0.31894428,"positive regulation of proteasomal ubiquitin-dependent protein catabolic process"),
c("GO:0045595","regulation of cell differentiation",0.260105215930751,1.64156662305389,0.924799812760578,0.19484768,"positive regulation of proteasomal ubiquitin-dependent protein catabolic process"),
c("GO:0045893","positive regulation of transcription, DNA-templated",0.740193716179042,1.52133494756098,0.883926931530515,0.64971697,"positive regulation of proteasomal ubiquitin-dependent protein catabolic process"),
c("GO:0045951","positive regulation of mitotic recombination",0.000741010905776066,2.42387836653299,0.92171463978334,0.42786588,"positive regulation of proteasomal ubiquitin-dependent protein catabolic process"),
c("GO:0046890","regulation of lipid biosynthetic process",0.0437127181052199,2.14109979422495,0.923360149710169,0.22440487,"positive regulation of proteasomal ubiquitin-dependent protein catabolic process"),
c("GO:0060918","auxin transport",0.0168354907658095,1.7639716798995,0.885760191045133,0.65600314,"positive regulation of proteasomal ubiquitin-dependent protein catabolic process"),
c("GO:0070863","positive regulation of protein exit from endoplasmic reticulum",0.00312332634116828,1.3659139157922,0.92435455276427,0.41361106,"positive regulation of proteasomal ubiquitin-dependent protein catabolic process"),
c("GO:0080164","regulation of nitric oxide metabolic process",0.00775637583616069,1.64741532093641,0.936509782812009,0.20338859,"positive regulation of proteasomal ubiquitin-dependent protein catabolic process"),
c("GO:1901671","positive regulation of superoxide dismutase activity",0.00169670721416015,2.26504989795505,0.949614624901504,0.10948577,"positive regulation of proteasomal ubiquitin-dependent protein catabolic process"),
c("GO:1902455","negative regulation of stem cell population maintenance",0.000865666946000077,1.30172128674447,0.941103925719364,0.48985457,"positive regulation of proteasomal ubiquitin-dependent protein catabolic process"),
c("GO:1904277","negative regulation of wax biosynthetic process",1.38506711360012E-05,1.64741532093641,0.94661341459827,0.1421623,"positive regulation of proteasomal ubiquitin-dependent protein catabolic process"),
c("GO:2000031","regulation of salicylic acid mediated signaling pathway",0.00959158976168085,1.54057450569417,0.924236963571574,0.53695333,"positive regulation of proteasomal ubiquitin-dependent protein catabolic process"),
c("GO:2000082","regulation of L-ascorbic acid biosynthetic process",0.000138506711360012,2.03121422168086,0.94044895882064,0.16545079,"positive regulation of proteasomal ubiquitin-dependent protein catabolic process"),
c("GO:2000605","positive regulation of secondary growth",2.42386744880022E-05,2.14062643457557,0.941259776730853,0.31971432,"positive regulation of proteasomal ubiquitin-dependent protein catabolic process"),
c("GO:2000762","regulation of phenylpropanoid metabolic process",0.00588999790058452,1.37150608223123,0.935189594916376,0.19926554,"positive regulation of proteasomal ubiquitin-dependent protein catabolic process"),
c("GO:0033481","galacturonate biosynthetic process",8.65666946000077E-05,2.6918250357859,0.929910937293925,0.09770622,"galacturonate biosynthetic process"),
c("GO:0009695","jasmonic acid biosynthetic process",0.00328953439480029,1.30752832928259,0.916525097009145,0.4785296,"galacturonate biosynthetic process"),
c("GO:0034626","fatty acid elongation, polyunsaturated fatty acid",0.00473346686072842,1.81918468745487,0.905287480949022,0.51974645,"galacturonate biosynthetic process"),
c("GO:0042761","very long-chain fatty acid biosynthetic process",0.0162225985680414,1.91077891975564,0.908029128112055,0.4200539,"galacturonate biosynthetic process"),
c("GO:0062034","L-pipecolic acid biosynthetic process",0.000231998741528021,2.04266810416155,0.914744172104991,0.33843704,"galacturonate biosynthetic process"),
c("GO:0042440","pigment metabolic process",0.527731346288351,1.48912878242575,0.983147196671985,0.03680942,"pigment metabolic process"),
c("GO:0045730","respiratory burst",0.00514898699480846,1.62258911936268,0.987675050428091,0.02572707,"respiratory burst"),
c("GO:0048363","mucilage pectin metabolic process",0.000256237416016023,1.509449563988,0.968378082724376,0.0303921,"mucilage pectin metabolic process"),
c("GO:0051290","protein heterotetramerization",0.00200488464693618,2.26504989795505,0.962602943679553,0.00547467,"protein heterotetramerization"),
c("GO:0007099","centriole replication",0.0148860088034173,1.64609928516837,0.956324842859394,0.35964719,"protein heterotetramerization"),
c("GO:0016050","vesicle organization",0.103748452144217,1.81333515543915,0.954318390834204,0.39233867,"protein heterotetramerization"),
c("GO:0017126","nucleologenesis",0.000630205536688056,1.48375532804652,0.964217211284613,0.25131801,"protein heterotetramerization"),
c("GO:0022618","ribonucleoprotein complex assembly",0.338628133268526,1.64741532093641,0.950562622696451,0.50595953,"protein heterotetramerization"),
c("GO:0042545","cell wall modification",0.0591112017406693,1.64432850401134,0.959601558355716,0.37489436,"protein heterotetramerization"),
c("GO:0061024","membrane organization",0.54141580937072,2.14336528657299,0.953550910841788,0.29578647,"protein heterotetramerization"),
c("GO:0090057","root radial pattern formation",0.00011080536908801,3.45436700902572,0.975250895904012,0,"root radial pattern formation"),
c("GO:0007568","aging",0.0125313947102971,3.28572497023759,0.985481200254705,0.31768776,"root radial pattern formation"),
c("GO:0009875","pollen-pistil interaction",0.0606520889045494,2.30043952593298,0.940517945237659,0.33831892,"root radial pattern formation"),
c("GO:0010229","inflorescence development",0.00102841233184809,1.33056856221372,0.971589945586677,0.61560866,"root radial pattern formation"),
c("GO:0010338","leaf formation",0.000966084311736086,2.00769308847106,0.969294022116758,0.55725111,"root radial pattern formation"),
c("GO:1901657","glycosyl compound metabolic process",0.512710293441357,1.39459724189549,0.957750554418725,0.05357265,"glycosyl compound metabolic process"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$value <- as.numeric( as.character(stuff$value) );
stuff$frequency <- as.numeric( as.character(stuff$frequency) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="all_revigo_treemap.pdf", width=16, height=9 ) # width and height are in inches

# check the tmPlot command documentation for all possible parameters - there are a lot more
treemap(
  stuff,
  index = c("representative","description"),
  vSize = "value",
  type = "categorical",
  vColor = "representative",
  #title = "Revigo TreeMap",
  fontsize.labels =c (0,10),
  inflate.labels = FALSE,      # set this to TRUE for space-filling group labels - good for posters
  lowerbound.cex.labels = 0,   # try to draw as many labels as possible (still, some small squares may not get a label)
  #bg.labels = "#CCCCCCAA",   # define background color of group labels
								 # "#CCCCCC00" is fully transparent, "#CCCCCCAA" is semi-transparent grey, NA is opaque
  position.legend = "none"
)

dev.off()

