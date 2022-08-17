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
revigo.data <- rbind(c("GO:0006491","N-glycan processing",0.00954311241270485,6.4672972492283,0.934625598265527,0.04118784,"N-glycan processing"),
c("GO:0002940","tRNA N2-guanine methylation",0.00104918833855209,1.91936379213691,0.927679909497817,0.40545266,"N-glycan processing"),
c("GO:0006308","DNA catabolic process",0.0921900670812242,1.81903493131908,0.909572846675626,0.22623034,"N-glycan processing"),
c("GO:0006315","homing of group II introns",0.00045360947970404,1.32960095841823,0.944060747966441,0.28056091,"N-glycan processing"),
c("GO:0006427","histidyl-tRNA aminoacylation",0.0384840897513794,4.9228494042572,0.887134748403614,0.16141447,"N-glycan processing"),
c("GO:0006468","protein phosphorylation",4.14863958534969,1.31366087929872,0.898990760955724,0.36818615,"N-glycan processing"),
c("GO:0006499","N-terminal protein myristoylation",0.0103256753318889,1.84112111768896,0.920839729450191,0.28907938,"N-glycan processing"),
c("GO:0006517","protein deglycosylation",0.0168458787691615,1.34484446865726,0.923850550232634,0.55964842,"N-glycan processing"),
c("GO:0006596","polyamine biosynthetic process",0.117862286031802,2.37433141631798,0.901906823357834,0.23524352,"N-glycan processing"),
c("GO:0009082","branched-chain amino acid biosynthetic process",0.41103944196754,2.9041862046204,0.914615351339469,0.41050824,"N-glycan processing"),
c("GO:0009823","cytokinin catabolic process",0.00010734270130401,1.39974362111397,0.856648447650963,0.50073701,"N-glycan processing"),
c("GO:0016553","base conversion or substitution editing",0.0468291191108202,2.04626544130514,0.921371436791853,0.2978254,"N-glycan processing"),
c("GO:0016926","protein desumoylation",0.00534635905849647,1.33334383901084,0.942778244335451,0.18708769,"N-glycan processing"),
c("GO:0030497","fatty acid elongation",0.0179643204633936,1.38765239123595,0.920027962394472,0.42779278,"N-glycan processing"),
c("GO:0032543","mitochondrial translation",0.0685088821064461,2.33580564752045,0.911639214637921,0.3739508,"N-glycan processing"),
c("GO:0033013","tetrapyrrole metabolic process",0.826469546685193,1.5185641654003,0.933245099818801,0.22542961,"N-glycan processing"),
c("GO:0034247","snoRNA splicing",0.00090375629162408,1.388143252117,0.938785182308537,0.32426279,"N-glycan processing"),
c("GO:0042430","indole-containing compound metabolic process",0.306349144186075,2.11429591147973,0.936511667478333,0.17478275,"N-glycan processing"),
c("GO:0045489","pectin biosynthetic process",0.0139580138373052,2.18741089171997,0.943374093970745,0.24715816,"N-glycan processing"),
c("GO:0046177","D-gluconate catabolic process",0.0153430809509054,1.37909749083081,0.937866569795597,0.3831849,"N-glycan processing"),
c("GO:0071034","CUT catabolic process",0.00271473154265624,1.44853772438405,0.920551735237577,0.54280127,"N-glycan processing"),
c("GO:0072330","monocarboxylic acid biosynthetic process",1.00138620979397,1.30955528509522,0.922753995273852,0.59812804,"N-glycan processing"),
c("GO:0006654","phosphatidic acid biosynthetic process",0.0197337437010178,8.7833150622948,0.923492495231469,0,"phosphatidic acid biosynthetic process"),
c("GO:0008610","lipid biosynthetic process",2.72871725783582,2.57062297442912,0.918963187214367,0.53444281,"phosphatidic acid biosynthetic process"),
c("GO:0009051","pentose-phosphate shunt, oxidative branch",0.00572032717916851,1.93211336550996,0.954963692846197,0.28101346,"phosphatidic acid biosynthetic process"),
c("GO:0009395","phospholipid catabolic process",0.056285664828925,3.91547092026262,0.918170340978189,0.52332922,"phosphatidic acid biosynthetic process"),
c("GO:0019375","galactolipid biosynthetic process",0.00178327390876016,5.68917042908147,0.928369131745553,0.35993379,"phosphatidic acid biosynthetic process"),
c("GO:0030148","sphingolipid biosynthetic process",0.0643467554300777,1.60844051870616,0.913361150196548,0.59288189,"phosphatidic acid biosynthetic process"),
c("GO:0052865","1-deoxy-D-xylulose 5-phosphate biosynthetic process",0.0330373133271469,1.33510467571622,0.930665130352995,0.35128475,"phosphatidic acid biosynthetic process"),
c("GO:0009808","lignin metabolic process",0.022136835143114,1.56720725901737,0.956690580305868,0.04090908,"lignin metabolic process"),
c("GO:0033354","chlorophyll cycle",0.000242386744880022,1.30895960229503,0.958439895774244,0.11157779,"lignin metabolic process"),
c("GO:0010584","pollen exine formation",0.00280476090504025,4.05286589781578,0.872371705036146,0.005976,"pollen exine formation"),
c("GO:0000460","maturation of 5.8S rRNA",0.045077009212116,1.85209417005253,0.892132409207093,0.47968196,"pollen exine formation"),
c("GO:0009790","embryo development",0.264433550660751,1.54283370821083,0.897258450416926,0.51152029,"pollen exine formation"),
c("GO:0009833","plant-type primary cell wall biogenesis",0.0045083934547684,1.65762087788256,0.963796342883256,0.27957185,"pollen exine formation"),
c("GO:0009838","abscission",0.00317526635792828,1.44223426065095,0.916368351413197,0.51541561,"pollen exine formation"),
c("GO:0009900","dehiscence",0.00137814177803212,1.46169439435731,0.924960366943897,0.4681959,"pollen exine formation"),
c("GO:0009945","radial axis specification",6.92533556800061E-05,3.26306203751551,0.924147603250595,0.3404729,"pollen exine formation"),
c("GO:0010016","shoot system morphogenesis",0.0179677831311776,1.35480909967836,0.896819844359387,0.65602599,"pollen exine formation"),
c("GO:0010158","abaxial cell fate specification",0.00506934563577645,1.64467448815908,0.925060078234245,0.42592324,"pollen exine formation"),
c("GO:0031468","nuclear membrane reassembly",0.00379854655904834,1.4254976030865,0.945759874335344,0.48975261,"pollen exine formation"),
c("GO:0048508","embryonic meristem development",0.00173479655978415,2.88641032200461,0.894917333968867,0.39161254,"pollen exine formation"),
c("GO:0048657","anther wall tapetum cell differentiation",0.00022853607374402,2.38540189542531,0.889532384620452,0.54300317,"pollen exine formation"),
c("GO:0065003","protein-containing complex assembly",1.4454318010786,2.19981937225282,0.944673622243073,0.47966032,"pollen exine formation"),
c("GO:0071786","endoplasmic reticulum tubular network organization",0.011357550331521,1.38929410181557,0.949464687894398,0.62527129,"pollen exine formation"),
c("GO:0080173","male-female gamete recognition during double fertilization forming a zygote and endosperm",2.42386744880022E-05,1.60713327369931,0.901436442296991,0.27788094,"pollen exine formation"),
c("GO:0090351","seedling development",0.00480964555197643,1.35301096145313,0.897454186833899,0.62168044,"pollen exine formation"),
c("GO:0090437","socket cell differentiation",6.92533556800061E-06,1.80560530885726,0.939034942631629,0.3217483,"pollen exine formation"),
c("GO:0019079","viral genome replication",0.0209041254120099,1.34211515686894,1,0,"viral genome replication"),
c("GO:0032953","regulation of (1->3)-beta-D-glucan biosynthetic process",0.000155820050280014,11.7523559269417,0.892561576972895,0,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0000122","negative regulation of transcription by RNA polymerase II",0.164757195830519,2.32170696940873,0.81173267099333,0.61930582,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0006109","regulation of carbohydrate metabolic process",0.0723870700245264,2.12908334956283,0.869774160511359,0.23857083,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0006302","double-strand break repair",0.219231885408411,1.56376911365808,0.824143273170384,0.42678348,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0006972","hyperosmotic response",0.00582420721268852,5.46893345952097,0.897514485828804,0.19434769,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0006995","cellular response to nitrogen starvation",0.0056441484879205,3.3404951770324,0.899420633466076,0.29611414,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0007165","signal transduction",7.83941060962102,1.56948621064666,0.737144865159146,0.47269325,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0007265","Ras protein signal transduction",0.0687893581969501,1.30670136711571,0.808911283962768,0.43077091,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0007346","regulation of mitotic cell cycle",0.179244997838776,4.61848321793231,0.879351309948173,0.18860012,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0009413","response to flooding",0.000301252097208027,2.26384595976444,0.866401904745629,0.51222094,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0009636","response to toxic substance",1.00685376222491,1.54274660819552,0.863315160121435,0.60628417,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0009642","response to light intensity",0.00936997902350483,2.29056233983299,0.902968616085375,0.53986575,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0009729","detection of brassinosteroid stimulus",0.000166208053632015,2.46989228973941,0.893107247471695,0.45620676,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0009893","positive regulation of metabolic process",1.39465177802624,1.38615225228155,0.818313801261142,0.67222128,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0009937","regulation of gibberellic acid mediated signaling pathway",0.00245849412664022,1.57311914013544,0.871389090615337,0.5048249,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0009963","positive regulation of flavonoid biosynthetic process",0.000294326761640026,1.65268553651107,0.880395950841731,0.34157659,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0010043","response to zinc ion",0.00547101509872048,1.54936198052455,0.89230869991718,0.6788979,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0010044","response to aluminum ion",0.00381585989796834,3.19434658736044,0.894195121540787,0.18965561,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0010221","negative regulation of vernalization response",3.46266778400031E-06,1.54863048816222,0.876664022625143,0.39761751,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0010243","response to organonitrogen compound",0.255434077090135,2.99039936624897,0.855753044507126,0.39689695,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0010268","brassinosteroid homeostasis",0.00388857592143235,2.43941322441371,0.89909896593466,0.12139113,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0010726","positive regulation of hydrogen peroxide metabolic process",0.000657906878960058,5.1270987476276,0.875700325724491,0.18914567,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0010922","positive regulation of phosphatase activity",0.00425215603875238,5.73883079341817,0.838273092824158,0.62571776,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0010941","regulation of cell death",0.369851008676857,1.37141425178666,0.873287474046611,0.2291955,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0010942","positive regulation of cell death",0.0935716715270403,4.14053762173045,0.848467841911539,0.41104018,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0016480","negative regulation of transcription by RNA polymerase III",0.00703960360487262,1.45663853079791,0.844130914604052,0.62659745,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0019722","calcium-mediated signaling",0.0641528460341737,1.7417826857339,0.809708268398063,0.42872505,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0032012","regulation of ARF protein signal transduction",0.0503264135726605,1.62653643827778,0.849838568737119,0.45159677,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0036297","interstrand cross-link repair",0.0375318561107793,1.46770626996459,0.842095250216413,0.52499463,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0042326","negative regulation of phosphorylation",0.0751364282450227,5.73883079341817,0.814505266475512,0.17692293,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0043085","positive regulation of catalytic activity",0.344871323283079,3.30460079708609,0.870755692980051,0.69114241,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0043619","regulation of transcription from RNA polymerase II promoter in response to oxidative stress",0.00183521392552016,2.40290656263075,0.78755534009285,0.32811347,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0045087","innate immune response",0.151477864878877,1.45837222729788,0.894570912223775,0.47443243,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0046890","regulation of lipid biosynthetic process",0.0437127181052199,1.40905848660232,0.851558591609567,0.62450558,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0047484","regulation of response to osmotic stress",0.00522170301827246,1.74084779213451,0.86175301091833,0.54770787,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0048017","inositol lipid-mediated signaling",0.0648315289198377,11.2629427981196,0.809588498905242,0.11994607,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0048573","photoperiodism, flowering",0.00243425545215222,1.92280744499857,0.811206496375168,0.63559307,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0048640","negative regulation of developmental growth",0.0166623573766095,4.13250740587499,0.856533218477498,0.44696473,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0050793","regulation of developmental process",1.26729139426292,2.13753451104719,0.868362742299208,0.21366895,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0051128","regulation of cellular component organization",0.899905805048272,1.90509508038719,0.864958735344699,0.25164291,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0051302","regulation of cell division",0.105178533939009,1.41152372820531,0.883454156741805,0.18126466,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0052542","defense response by callose deposition",0.000657906878960058,1.78203594189037,0.852674546146777,0.66909735,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0055082","cellular chemical homeostasis",0.358978231835096,1.3308160203973,0.864402383302462,0.64647508,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0060147","regulation of post-transcriptional gene silencing",0.011419878351633,1.49269795004149,0.88391326726192,0.21149462,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0060627","regulation of vesicle-mediated transport",0.106054588888361,9.06787892732042,0.874847105514972,0.17508373,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0071260","cellular response to mechanical stimulus",0.0079329718931447,1.43153744601453,0.887361989315878,0.65565869,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0071494","cellular response to UV-C",0.00079295092253607,1.98543783835436,0.903655233232058,0.60167813,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0072708","response to sorbitol",0.000519400167600046,2.00368979687818,0.886231914877022,0.48486585,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0080037","negative regulation of cytokinin-activated signaling pathway",0.00286362625736825,1.48317407234377,0.840138292934331,0.50908991,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0090069","regulation of ribosome biogenesis",0.0301529110630747,1.31233311689128,0.892047939358074,0.16082938,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0090357","regulation of tryptophan metabolic process",9.0029362384008E-05,2.02953451777998,0.893666908272954,0.1327851,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:1900037","regulation of cellular response to hypoxia",0.00212261535159219,2.04487979498145,0.861880561706374,0.51369556,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:1900109","regulation of histone H3-K9 dimethylation",0.00217109270056819,1.52019450776643,0.884694722109114,0.20173957,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:1900140","regulation of seedling development",0.00468152684396842,1.72423448410398,0.903090764271834,0.46203998,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:1900409","positive regulation of cellular response to oxidative stress",3.46266778400031E-05,1.90927006961273,0.864356607031854,0.43269403,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:1901001","negative regulation of response to salt stress",0.00133312709684012,4.1415680480812,0.842991543234099,0.38567671,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:1902074","response to salt",0.00281168624060825,1.35779779498644,0.903589697033166,0.31024182,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:1904964","positive regulation of phytol biosynthetic process",2.07760067040018E-05,1.73885332577517,0.867195985346663,0.47136572,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:2000068","regulation of defense response to insect",0.000325490771696029,2.40290656263075,0.878124923882859,0.47332737,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:2000143","negative regulation of DNA-templated transcription, initiation",0.00134005243240812,1.89875623330496,0.856303389475736,0.45747352,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:2000779","regulation of double-strand break repair",0.0253848175245063,1.78751518079967,0.823792564716574,0.66539864,"regulation of (1->3)-beta-D-glucan biosynthetic process"),
c("GO:0034196","acylglycerol transport",0.00235807676090421,4.11197083895177,0.968436172622671,0,"acylglycerol transport"),
c("GO:0006409","tRNA export from nucleus",0.00751398909128067,2.50562156725475,0.962715550997785,0.34965084,"acylglycerol transport"),
c("GO:0006816","calcium ion transport",0.257556692441727,1.51829439351684,0.971845431335275,0.60762857,"acylglycerol transport"),
c("GO:0015671","oxygen transport",0.0577503733015571,2.22714438849966,0.978948954721787,0.19909115,"acylglycerol transport"),
c("GO:0015804","neutral amino acid transport",0.0658391652449818,2.95613031077873,0.969706203796871,0.2974393,"acylglycerol transport"),
c("GO:0015840","urea transport",0.0153638569576094,1.72214358409238,0.971724115080729,0.36517789,"acylglycerol transport"),
c("GO:0034755","iron ion transmembrane transport",0.133669364465764,2.71951422660817,0.966372928953593,0.16222648,"acylglycerol transport"),
c("GO:0035653","clathrin-coated vesicle cargo loading, AP-1-mediated",1.73133389200015E-05,1.77396407816481,0.985436048488351,0.10685054,"acylglycerol transport"),
c("GO:1990052","ER to chloroplast lipid transport",0.00156858850615214,3.58342874036757,0.963263702316944,0.49305914,"acylglycerol transport"),
c("GO:1903189","glyoxal metabolic process",0.000685608221232061,2.22295466178166,0.980050012605554,0.03394827,"glyoxal metabolic process"),
c("GO:1904526","regulation of microtubule binding",0.000744473573560066,5.79750295608966,0.909926684830858,0.0843472,"regulation of microtubule binding"),
c("GO:0051090","regulation of DNA-binding transcription factor activity",0.0770928355429828,2.40290656263075,0.850159043611164,0.39172508,"regulation of microtubule binding"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$value <- as.numeric( as.character(stuff$value) );
stuff$frequency <- as.numeric( as.character(stuff$frequency) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="either_revigo_treemap.pdf", width=16, height=9 ) # width and height are in inches

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

