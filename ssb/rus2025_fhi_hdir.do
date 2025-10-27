/* STATA infix-setning for innlesing av den sekvensielle filen.                    */
/* Vær oppmerksom på at desimaltall med komma ikke er populært i Stata             */
/*  De er i så fall gjort om til string-variable                                   */
/* Alle datoer defineres som karaktervariable.                                     */
/*  Datoer kan konverteres i Stata fra str til dato f.eks. slik:                   */
/*   gen dato = date(datostr,"YMD")                                                */
/*   format dato  %td                                                              */
/* Alle tidsvariable defineres som karaktervariable.                               */
/*  Er de riktig formatert kan de konverteres i Stata fra str til tid f.eks. slik: */
/*   gen double tid = clock(tidstr,"DMYhms")                                       */
/*   format tid %tc                                                                */
/* Det er ikke lov å gi tekster (value labels) til karaktervariable                */
/*  Får i så fall denne meldingen: may not label strings                           */
/*  De er allikevel tatt med da de ofte kun inneholder tall og variablene          */
/*  kan endres til numeriske ved innlesing (fjern str i infix)                     */

clear
infix                              ///
    str1 Kjonn                 1 -     1 ///
      Alder                 2 -     4 ///
    str8 sluttdato             5 -    12 ///
      Yrkesstatus          13 -    13 ///
      YrkStat2             14 -    15 ///
      Siv                  16 -    16 ///
      SivStat              17 -    17 ///
      Antpers              18 -    19 ///
      AntBarn1             20 -    21 ///
      AntBarn2             22 -    23 ///
      Helse                24 -    24 ///
      Helsepsyk            25 -    25 ///
      Tob1                 26 -    26 ///
      Tob2                 27 -    27 ///
      Tob3                 28 -    28 ///
      Tob4a                29 -    31 ///
      Tob5                 32 -    32 ///
      Tob13                33 -    33 ///
      Tob14                34 -    34 ///
      Tob20                35 -    38 ///
      Tob21                39 -    40 ///
      Tob22a               41 -    41 ///
      Tob22b               42 -    42 ///
      Tob22d               43 -    43 ///
      Tob22q               44 -    44 ///
      Tob22s               45 -    45 ///
      Tob22r               46 -    46 ///
      Tob23                47 -    48 ///
      Tob30                49 -    49 ///
      Tob31a               50 -    52 ///
      Tob31b               53 -    55 ///
      Tob31c               56 -    58 ///
      Tob33                59 -    59 ///
      Tob34                60 -    60 ///
      Tob38                61 -    61 ///
      Tob39                62 -    63 ///
      Tob40                64 -    64 ///
      Tob42a               65 -    65 ///
      Tob42b               66 -    66 ///
      Tob42d               67 -    67 ///
      Tob42o               68 -    68 ///
      Tob42m               69 -    69 ///
      Tob42n               70 -    70 ///
      Tob43                71 -    71 ///
      Tob44                72 -    72 ///
      Tobvan1              73 -    73 ///
      Tob61                74 -    74 ///
      Tob61b               75 -    75 ///
      Tob62a               76 -    76 ///
      Tob62e               77 -    77 ///
      Tob62f               78 -    78 ///
      Tob62g               79 -    79 ///
      Tob62h               80 -    80 ///
      TobE                 81 -    81 ///
      TobE1                82 -    82 ///
      tobald               83 -    85 ///
      TobE3                86 -    86 ///
      TobE4                87 -    87 ///
      Tob60                88 -    88 ///
      Tob64a               89 -    89 ///
      Tob64b               90 -    90 ///
      Tob64c               91 -    91 ///
      TobPrSn1             92 -    93 ///
      TobPrSn2             94 -    95 ///
      Tob66                96 -    96 ///
      Tob68                97 -    98 ///
      Tob69                99 -    99 ///
      Tob69b              100 -   100 ///
      Tob71               101 -   101 ///
      tobsluttsn1         102 -   102 ///
      tobsluttsn2         103 -   106 ///
      Drukket1            107 -   107 ///
      Drukk1b             108 -   108 ///
      Drukket2            109 -   109 ///
      Drukk2a             110 -   110 ///
      Drukk2b             111 -   111 ///
      Drukk2c             112 -   112 ///
      Drukket3            113 -   113 ///
      Type1               114 -   114 ///
      Type2               115 -   115 ///
      Type3               116 -   116 ///
      Type4               117 -   117 ///
      Type1a              118 -   118 ///
      Typ1a_uk            119 -   119 ///
      Typ1a_mn            120 -   120 ///
      Type1b_a            121 -   121 ///
      Type1b_b            122 -   122 ///
      Type1b_1            123 -   127 ///
      Type1b_2            128 -   132 ///
      Type1c_a            133 -   133 ///
      Type1c_b            134 -   134 ///
      Type1c_1            135 -   139 ///
      Type1c_2            140 -   144 ///
      Type2a              145 -   145 ///
      Typ2a_uk            146 -   146 ///
      Typ2a_mn            147 -   147 ///
      Type2b_a            148 -   148 ///
      Type2b_b            149 -   149 ///
      Type2b_1            150 -   154 ///
      Type2b_2            155 -   159 ///
      Type2c_a            160 -   160 ///
      Type2c_b            161 -   161 ///
      Type2c_1            162 -   166 ///
      Type2c_2            167 -   171 ///
      Type3a              172 -   172 ///
      Typ3a_uk            173 -   173 ///
      Typ3a_mn            174 -   174 ///
      Type3b_a            175 -   175 ///
      Type3b_b            176 -   176 ///
      Type3b_1            177 -   181 ///
      Type3b_2            182 -   186 ///
      Type3c_a            187 -   187 ///
      Type3c_b            188 -   188 ///
      Type3c_1            189 -   193 ///
      Type3c_2            194 -   198 ///
      Type4a              199 -   199 ///
      Typ4a_uk            200 -   200 ///
      Typ4a_mn            201 -   201 ///
      Type4b_a            202 -   202 ///
      Type4b_b            203 -   203 ///
      Type4b_1            204 -   208 ///
      Type4b_2            209 -   213 ///
      Type4c_a            214 -   214 ///
      Type4c_b            215 -   215 ///
      Type4c_1            216 -   220 ///
      Type4c_2            221 -   225 ///
      Beruset4            226 -   227 ///
      AL2                 228 -   228 ///
      AL3                 229 -   229 ///
      AL4                 230 -   230 ///
      AL5                 231 -   231 ///
      Audit2              232 -   232 ///
      Audit3              233 -   233 ///
      Audit3_1            234 -   234 ///
      Audit3_2            235 -   235 ///
      Audit3_3            236 -   236 ///
      Audit4              237 -   237 ///
      Audit5              238 -   238 ///
      Audit6              239 -   239 ///
      Audit7              240 -   240 ///
      Audit8              241 -   241 ///
      Audit9_a            242 -   242 ///
      Audit9_b            243 -   243 ///
      Audit9_c            244 -   244 ///
      Audit9a             245 -   245 ///
      Audit9b             246 -   246 ///
      Audit10             247 -   247 ///
      Audit10a            248 -   248 ///
      Arb_alk1            249 -   249 ///
      Arb_alk1b           250 -   252 ///
      Arb_alk2            253 -   255 ///
      Arb_alk3            256 -   258 ///
      Arb_alk4            259 -   261 ///
      Arb_alk5            262 -   264 ///
      Leg1                265 -   265 ///
      Leg2                266 -   266 ///
      Leg3                267 -   267 ///
      Leg5                268 -   268 ///
      Leg6                269 -   269 ///
      Leg7                270 -   270 ///
      Leg9                271 -   271 ///
      Leg10               272 -   272 ///
      Leg11               273 -   273 ///
      Leg12               274 -   274 ///
      Can1                275 -   275 ///
      Can2                276 -   276 ///
      Can3                277 -   278 ///
      Can4                279 -   279 ///
      Can5                280 -   280 ///
      Can6                281 -   281 ///
      Can6b               282 -   282 ///
      Can7_a              283 -   283 ///
      Can7_b              284 -   284 ///
      Can7_c              285 -   285 ///
      Can7_d              286 -   286 ///
      Can7_e              287 -   287 ///
    str50 Can7sps             288 -   337 ///
      Can8                338 -   338 ///
    str50 Can8sps             339 -   388 ///
      Can9                389 -   389 ///
      Can10               390 -   390 ///
      Can11               391 -   391 ///
      Can13               392 -   393 ///
      Can14               394 -   394 ///
      Ans1                395 -   395 ///
    str50 Ans2sps             396 -   445 ///
      Ans2_a              446 -   446 ///
      Ans2_b              447 -   447 ///
      Ans2_c              448 -   448 ///
      Ans2_d              449 -   449 ///
      Ans2_e              450 -   450 ///
      Ans2_f              451 -   451 ///
      Ans2_g              452 -   452 ///
      Ans2_x              453 -   453 ///
      Ans2_y              454 -   454 ///
      Ans2_h              455 -   455 ///
      Ans3_1              456 -   456 ///
      Ans3_2              457 -   457 ///
      Ans3_3              458 -   458 ///
      Ans3_4              459 -   459 ///
      Ans3_5              460 -   460 ///
      Ans3_6              461 -   461 ///
      Ans3_7              462 -   462 ///
      Ans3_x              463 -   463 ///
      Ans3_y              464 -   464 ///
      Ans3_8              465 -   465 ///
      Ans_5               466 -   466 ///
      Ans9                467 -   467 ///
      Dop1                468 -   468 ///
      Dop3_1              469 -   469 ///
      NegKons1            470 -   470 ///
      NegKons2            471 -   471 ///
      NegKons3            472 -   472 ///
      NegKons4            473 -   473 ///
      NegKons4_1          474 -   474 ///
      NegKons5            475 -   475 ///
      NegKons6            476 -   476 ///
      paaror1a            477 -   477 ///
      paaror3             478 -   478 ///
      paaror4             479 -   479 ///
      paaror5             480 -   480 ///
      Avslutt             481 -   481 ///
      intslutt            482 -   482 ///
    str8 sluttintervjudato   483 -   490 ///
    str7 yrke                491 -   497 ///
      paaror1b_a          498 -   498 ///
      paaror1b_b          499 -   499 ///
      paaror1b_c          500 -   500 ///
      paaror2_a           501 -   501 ///
      paaror2_b           502 -   502 ///
      paaror2_c           503 -   503 ///
      paaror2_d           504 -   504 ///
      paaror2_e           505 -   505 ///
      tobsit_a            506 -   506 ///
      tobsit_b            507 -   507 ///
      tobsit_c            508 -   508 ///
      tobsit_d            509 -   509 ///
      tobsit_e            510 -   510 ///
      alkansk_a           511 -   511 ///
      alkansk_b           512 -   512 ///
      alkansk_c           513 -   513 ///
      alkansk_d           514 -   514 ///
      alkansk_e           515 -   515 ///
      alkansk_f           516 -   516 ///
      alkansk_g           517 -   517 ///
      alkansk_h           518 -   518 ///
      alkansk_i           519 -   519 ///
      alkansk_j           520 -   520 ///
      lopenr              521 -   524 ///
    str1 SIVILSTAND          525 -   525 ///
    str4 fylke_2025          526 -   529 ///
      landsdel_2025       530 -   530 ///
      alder1              531 -   531 ///
      alder2              532 -   532 ///
    str1 Tett_spredt         533 -   533 ///
      fodeland_IO         534 -   534 ///
      fodeland_far        535 -   535 ///
      fodeland_mor        536 -   536 ///
      innt_hush           537 -   538 ///
      innt_person         539 -   540 ///
      Utdann_4gr          541 -   541 ///
    str16 vekt                542 -   557 ///
    str1 Sentralitet         558 -   558 ///
using "O:\Prosjekt\Rusdata\Rusundersokelsen\Datasets\Rusus_2025\rus2025_v1\rus2025_fhi_hdir.asc"
save "O:\Prosjekt\Rusdata\Rusundersokelsen\Datasets\Rusus_2025\rus2025_v1\statads.dat", replace

label variable Kjonn             "IOs kjønn"
label variable Alder             "IOs alder"
label variable sluttdato         "Dato for utfyllinga"
label variable Yrkesstatus       "Yrkesaktiv?"
label variable YrkStat2          "Yrkesstatus?."
label variable Siv               "Er du gift eller samboer?"
label variable SivStat           "IOs formelle sivilstatus"
label variable Antpers           "Antall medlemmer i husholdningen?"
label variable AntBarn1          "Antall barn under 6 år."
label variable AntBarn2          "Antall barn 6-18 år."
label variable Helse             "Egenopplevd helse."
label variable Helsepsyk         "Egenopplevd psykisk helse."
label variable Tob1              "Hender at røyker"
label variable Tob2              "Røyker daglig/av og til?"
label variable Tob3              "Røyker du sigaretter"
label variable Tob4a             "Hvor mange sigaretter per uke"
label variable Tob5              "Hvor ofte røyker du sigaretter"
label variable Tob13             "Har du noen gang røykt daglig?"
label variable Tob14             "Har du noen gang røykt daglig eller av og til"
label variable Tob20             "I hvilket år sluttet du å røyke daglig"
label variable Tob21             "Hvor mange ganger forsøkte du å slutte å røyke daglig før du lyktes"
label variable Tob22a            "Sluttet siste gang - brukte snus"
label variable Tob22b            "Sluttet siste gang - brukte nikotinlegemiddel"
label variable Tob22d            "Sluttet siste gang - brukte røykeavvenningsprodukt"
label variable Tob22q            "Sluttet siste gang - søkte helsetjenesten"
label variable Tob22s            "Sluttet siste gang - brukte e-sigaretter"
label variable Tob22r            "Sluttet siste gang - søkte nettsider eller mobiltjenester for røykeslutt"
label variable Tob23             "Hvor gammel var du da du begynte å røyke daglig"
label variable Tob30             "Røyker du sigaretter daglig"
label variable Tob31a            "Hvor mange sigaretter røyker du gjennomsnittlig pr. dag"
label variable Tob31b            "Hvor mange av disse sigarettene er fabrikklagde"
label variable Tob31c            "Hvor mange av disse sigarettene er hjemmerullede"
label variable Tob33             "Røyker du sigarer eller sigarillos daglig, av og til eller aldri"
label variable Tob34             "Røyker du pipe daglig, av og til eller aldri?"
label variable Tob38             "Har du noen gang prøvd å slutte å røyke daglig?"
label variable Tob39             "Hvor mange ganger totalt har du prøvd å slutte å røyke daglig?"
label variable Tob40             "Har du prøvd å slutte å røyke daglig i løpet av de siste 12 månedene?"
label variable Tob42a            "Forsøkte å slutte siste gang ... brukte snus"
label variable Tob42b            "Forsøkte å slutte siste gang ... brukte nikotinlegemiddel"
label variable Tob42d            "Forsøkte å slutte siste gang ... brukte reseptbelagt røykeavvenningsprodukt"
label variable Tob42o            "Forsøkte å slutte siste gang ... brukte elektroniske sigaretter"
label variable Tob42m            "Forsøkte å slutte siste gang ... søkte hjelp i helsetjenesten/kommunen"
label variable Tob42n            "Forsøkte å slutte siste gang ... søkte hjelp på nettsider eller mobiltjenester for røykeslutt"
label variable Tob43             "Vurderer du seriøst å slutte å røyke de neste 6 månedene?"
label variable Tob44             "Planlegger du å slutte å røyke i løpet av de neste 30 dagene?"
label variable Tobvan1           "Hvor lang tid etter at du våkner, tenner du din første sigarett"
label variable Tob61             "Kan du prøve å forutsi dine røykevaner omkring 5 år fra nå?"
label variable Tob61b            "Kan du prøve å forutsi dine snusvaner omkring 5 år fra nå?"
label variable Tob62a            "Hvor skadelig tror du snus er på en skala fra 1 til 7"
label variable Tob62e            "Hvor skadelig tror du ferdigsigaretter med lavere nikotin- og tjæreinnhold er, på en skala fra 1 til 7?"
label variable Tob62f            "Hvor skadelig tror du vanlige ferdigsigaretter er, på en skala fra 1 til 7?"
label variable Tob62g            "Hvor skadelig tror du produkter som er laget for å erstatte tobakksprodukter med nikotin, som for eksempel nikotintyggegummi, nikotinplaster og nikotinposer er, på en skala fra 1 til 7?"
label variable Tob62h            "Hvor skadelig tror du e-sigaretter/fordampere (vape) er, på en skala fra 1 til 7?"
label variable TobE              "Bruker du e-sigaretter/fordampere daglig, av og til eller aldri?"
label variable TobE1             "Har du tidligere brukt e-sigaretter/fordampere?"
label variable tobald            "Hvor gammel var du da du begynte å bruke e-sigaretter regelmessig? Alder:"
label variable TobE3             "Hvilken type e-sigaretter/fordamper bruker du/brukte du i hovedsak?"
label variable TobE4             "Hva er/var nikotininnholdet i væsken i de e-sigarettene du vanligvis bruker/brukte?"
label variable Tob60             "Bruker du snus daglig, av og til eller aldri"
label variable Tob64a            "Har du brukt snus tidligere?"
label variable Tob64b            "Brukte du snus daglig eller av og til?"
label variable Tob64c            "Har du tidligere brukt snus daglig?"
label variable TobPrSn1          "Hvor mange pris/porsjoner snus bruker du gjennomsnittlig pr. dag?"
label variable TobPrSn2          "Hvor mange pris/porsjoner snus bruker du gjennomsnittlig pr. uke?"
label variable Tob66             "Hva slags snus bruker du hovedsakelig, porsjonssnus eller løssnus?"
label variable Tob68             "Hvor gammel var du da du begynte å bruke snus regelmessig? Alder:"
label variable Tob69             "Hva begynte du med først, snus eller sigaretter"
label variable Tob69b            "Bruker du noen former for nikotinerstatningsprodukter nå"
label variable Tob71             "Vurderer du seriøst å slutte å bruke snus de neste 6 månedene"
label variable tobsluttsn1       "Har du noen gang prøvd å slutte med snus?"
label variable tobsluttsn2       "Hvilket år sluttet du med snus?"
label variable Drukket1          "Har drukket alkohol siste 12 mnd"
label variable Drukk1b           "Har du noen gang drukket alkohol"
label variable Drukket2          "Hvor ofte drukket alkohol siste 12 mnd"
label variable Drukk2a           "Drukket alkohol ukentlig"
label variable Drukk2b           "Antall dager drukket alkohol pr mnd siste 12 mnd"
label variable Drukk2c           "Drukket alkohol få dager/en dag siste 12 mnd"
label variable Drukket3          "Har drukket alkohol siste 4 uker"
label variable Type1             "Har drukket øl siste 4 uker"
label variable Type2             "Har drukket vin siste 4 uker"
label variable Type3             "Har drukket brennevin siste 4 uker"
label variable Type4             "Har drukket rusbrus/cider siste 4 uker"
label variable Type1a            "Hvor ofte drukket øl siste 4 uker?"
label variable Typ1a_uk          "Ukentlig: Ant dager i uken drukket øl siste 4 uker?"
label variable Typ1a_mn          "Månedlig: Ant dager i uken drukket øl siste 4 uker?"
label variable Type1b_a          "Ukentlig: Drukket 0,33 liter øl siste 4 uker"
label variable Type1b_b          "Ukentlig: Drukket 0,5 liter øl siste 4 uker"
label variable Type1b_1          "Ukentlig: Gjennomsnitt ant 0,33 l øl drukket siste 4 uker?"
label variable Type1b_2          "Ukentlig: Gjennomsnitt ant 0,5 l øl drukket siste 4 uker?"
label variable Type1c_a          "Månedlig: Drukket 0,33 liter øl siste 4 uker"
label variable Type1c_b          "Månedlig: Drukket 0,5 liter øl siste 4 uker"
label variable Type1c_1          "Månedlig: Antall 0,33 l øl drukket siste 4 uker?"
label variable Type1c_2          "Månedlig: Antall 0,5 l øl drukket siste 4 uker?"
label variable Type2a            "Hvor ofte drukket vin siste 4 uker?"
label variable Typ2a_uk          "Ukentlig: Ant dager i uken drukket vin siste 4 uker?"
label variable Typ2a_mn          "Månedlig: Ant dager i uken drukket vin siste 4 uker?"
label variable Type2b_a          "Ukentlig: Drukket glass vin siste 4 uker"
label variable Type2b_b          "Ukentlig: Drukket flasker vin siste 4 uker"
label variable Type2b_1          "Ukentlig: Gjennomsnitt antall glass vin drukket siste 4 uker?"
label variable Type2b_2          "Ukentlig: Gjennomsnitt antall flasker vin drukket siste 4 uker?"
label variable Type2c_a          "Månedlig: Drukket glass vin siste 4 uker"
label variable Type2c_b          "Månedlig: Drukket flasker vin siste 4 uker"
label variable Type2c_1          "Månedlig: Antall glass vin drukket siste 4 uker?"
label variable Type2c_2          "Månedlig: Antall flasker vin drukket siste 4 uker?"
label variable Type3a            "Hvor ofte drukket brennevin siste 4 uker?"
label variable Typ3a_uk          "Ukentlig: Ant dager i uken drukket brennevin siste 4 uker?"
label variable Typ3a_mn          "Månedlig: Ant dager drukket brennevin siste 4 uker?"
label variable Type3b_a          "Ukentlig: Drukket drammer siste 4 uker"
label variable Type3b_b          "Ukentlig: Drukket flasker sprit siste 4 uker"
label variable Type3b_1          "Ukentlig: Gjennomsnitt antall glass drammer drukket siste 4 uker?"
label variable Type3b_2          "Ukentlig: Gjennomsnitt antall helflasker sprit drukket siste 4 uker?"
label variable Type3c_a          "Månedlig: Drukket drammer siste 4 uker"
label variable Type3c_b          "Månedlig: Drukket flasker sprit siste 4 uker"
label variable Type3c_1          "Månedlig: Antall drammer drukket siste 4 uker?"
label variable Type3c_2          "Månedlig: Antall flasker sprit drukket siste 4 uker?"
label variable Type4a            "Hvor ofte drukket rusbrus siste 4 uker?"
label variable Typ4a_uk          "Ukentlig: Ant dager i uken drukket rusbrus/alkoholholdig cider siste 4 uker?"
label variable Typ4a_mn          "Månedlig: Ant dager i uken drukket rusbrus/alkoholholdig cider siste 4 uker?"
label variable Type4b_a          "Ukentlig: Drukket småflasker/småbokser siste 4 uker"
label variable Type4b_b          "Ukentlig: Drukket 0,5 liter siste 4 uker"
label variable Type4b_1          "Ukentlig: Gjennomsnitt antall småflasker rusbrus/cider drukket siste 4 uker?"
label variable Type4b_2          "Ukentlig: Gjennomsnitt antall halvliter rusbrus/cider drukket siste 4 uker?"
label variable Type4c_a          "Månedlig: Drukket småflasker/småbokser siste 4 uker"
label variable Type4c_b          "Månedlig: Drukket 0,5 liter siste 4 uker"
label variable Type4c_1          "Månedlig: Antall rusbrus/cider drukket siste 4 uker?"
label variable Type4c_2          "Månedlig: Antall halvlitere rusbrus/cider drukket siste 4 uker?"
label variable Beruset4          "Ant alkoholenheter for å føle seg tydelig beruset"
label variable AL2               "Ant ukedager drikker alkohol"
label variable AL3               "Gjsn. ant alkoholenheter IO drikker på ukedagene"
label variable AL4               "Ant helgedager drikker alkohol"
label variable AL5               "Gjsn. ant alkoholenheter IO drikker på helgedager"
label variable Audit2            "Mengde alkohol drukket siste 12 mnd"
label variable Audit3            "Drukket seks alkoholenheter siste året?"
label variable Audit3_1          "Hvor ofte drukket alkohol siste 12 mnd"
label variable Audit3_2          "Hvor ofte drukket alkohol siste 12 mnd"
label variable Audit3_3          "Hvor ofte drukket alkohol siste 12 mnd"
label variable Audit4            "Ikke kunne stoppe drikke siste året?"
label variable Audit5            "Unnlatt å gjøre ting etter drukket alkohol siste året?"
label variable Audit6            "Startet dagen med alkohol siste året?"
label variable Audit7            "Følt skyldfølelse etter drikking siste året"
label variable Audit8            "Ikke husket hva som skjedd pga alkoholdrikking siste året"
label variable Audit9_a          "Skadet som følge av alkohol: Nei"
label variable Audit9_b          "Skadet som følge av alkohol: Ja, blitt skadet selv"
label variable Audit9_c          "Skadet som følge av alkohol: Ja, andre blitt skadet"
label variable Audit9a           "Har blitt skadet selv av egen alkoholdrikking siste året?"
label variable Audit9b           "Andre blitt skadet av IOs alkoholdrikking siste året?"
label variable Audit10           "Andre uttrykt bekymring for IOs alkobruk?"
label variable Audit10a          "Andre uttrykt bekymring for IOs alkobruk siste året?"
label variable Arb_alk1          "Hatt sykefraværdager, med eller uten legeattest siste 12 mnd"
label variable Arb_alk1b         "Ant dager sykefravær siste 12 mnd?"
label variable Arb_alk2          "Ant dager siste 12 mnd vært mindre effektiv på jobb pga alkoholdrikking dagen før?"
label variable Arb_alk3          "Ant dager siste 12 mnd vært borte deler av dagen pga alkoholdrikking dagen før?"
label variable Arb_alk4          "Ant hele dager siste 12 mnd vært borte pga alkoholdrikking dagen før?"
label variable Arb_alk5          "Ant dager totalt siste 12 mnd vært borte pga alkoholdrikking?"
label variable Leg1              "Brukt reseptbelagte sovemidler siste 12 mnd?"
label variable Leg2              "Brukt sovemidler daglig minst en uke?"
label variable Leg3              "Varighet lengste periode med sovemiddelbruk"
label variable Leg5              "Brukt reseptbelagte beroligende midler siste 12 mnd"
label variable Leg6              "Brukt beroligende midler daglig minst en uke"
label variable Leg7              "Varighet av lengste periode med bruk av beroligende midler"
label variable Leg9              "Brukt reseptbelagte smertestillende midler siste 12 mnd?"
label variable Leg10             "Brukt smertestillende daglig minst en uke?"
label variable Leg11             "Varighet av lengste periode med bruk av smertestillende midler"
label variable Leg12             "I løpet av de siste 12 månedene, hvor ofte har du brukt reseptbelagte legemidler (sovemidler, smertestillende eller beroligende) samme dag som du drakk alkohol?"
label variable Can1              "Brukt cannabis noen gang"
label variable Can2              "Ant ganger brukt cannabis"
label variable Can3              "Alder da IO prøvde cannabis første gang"
label variable Can4              "Drukket alkohol tidligere samme dag som første gang prøvd cannabis?"
label variable Can5              "Drukket alkohol tidligere samme dag som sist brukt cannabis?"
label variable Can6              "Brukt cannabis siste 12 mnd?"
label variable Can6b             "muligheten til å prøve cannabis i løpet av de siste 12 måneder"
label variable Can7_a            "Brukt Hasj siste 12 mnd?"
label variable Can7_b            "Brukt Marihuana siste 12 mnd?"
label variable Can7_c            "Brukt Cannabisolje siste 12 mnd?"
label variable Can7_d            "Brukt spiselige produkter (edibles) siste 12 mnd?"
label variable Can7_e            "Brukt annen type cannabis siste 12 mnd?"
label variable Can7sps           "Hvilke andre typer cannabis har du prøvd?"
label variable Can8              "Hvilken måte fikk du cannabis på?"
label variable Can8sps           "På hvilken annen måte fikk du cannabis?"
label variable Can9              "Ant ganger brukt cannabis siste 12 mnd"
label variable Can10             "Brukt cannabis siste fire uker?"
label variable Can11             "Ant ganger brukt cannabis siste fire uker"
label variable Can13             "Hvor mange ganger ruset du deg på cannabis (uansett type) siste døgn?"
label variable Can14             "Brukt cannabis regelmessig?"
label variable Ans1              "Brukt andre narkotiske stoffer noen gang"
label variable Ans2sps           "Hvilke andre stoffer har du prøvd?"
label variable Ans2_a            "Brukt Kokain noen gang"
label variable Ans2_b            "Brukt Ecstasy noen gang"
label variable Ans2_c            "Brukt Amfetaminer noen gang"
label variable Ans2_d            "Brukt Relevin noen gang"
label variable Ans2_e            "Brukt Heroin noen gang"
label variable Ans2_f            "Brukt GHB/GBL noen gang"
label variable Ans2_g            "Brukt LSD noen gang"
label variable Ans2_x            "Brukt nye rusmidler noen gang"
label variable Ans2_y            "Brukt sopp/psilocybin noen gang"
label variable Ans2_h            "Brukt andre stoffer noen gang"
label variable Ans3_1            "Brukt kokain siste 12 månedene?"
label variable Ans3_2            "Brukt ecstasy siste 12 månedene?"
label variable Ans3_3            "Brukt amfetaminer siste 12 månedene?"
label variable Ans3_4            "Brukt relevin siste 12 månedene?"
label variable Ans3_5            "Brukt heroin siste 12 månedene?"
label variable Ans3_6            "Brukt GHB/GBL siste 12 månedene?"
label variable Ans3_7            "Brukt LSD siste 12 månedene?"
label variable Ans3_x            "Brukt nye rusmidler siste 12 månedene?"
label variable Ans3_y            "Brukt sopp/psilocybin siste 12 månedene?"
label variable Ans3_8            "Brukt andre stoffer siste 12 månedene?"
label variable Ans_5             "Antall dager brukt kokain siste 12 mnd"
label variable Ans9              "Antall dager brukt amfetaminer siste 12 mnd"
label variable Dop1              "Brukt prestasjonsfremmende midler"
label variable Dop3_1            "Brukt anabole steroider siste 12 månedene?"
label variable NegKons1          "I løpet av de siste 12 månedene, hvor mange ganger har du blitt skadet i en ulykke (f.eks. falt eller slått deg) mens du var påvirket av alkohol? Vi tenker her på skader slik at du fikk synlige merker eller måtte ha hjelp eller behandling."
label variable NegKons2          "I løpet av de siste 12 månedene, hvor mange ganger har du blitt skadet i en voldshendelse (f.eks. at noen har slått eller sparket deg eller brukt kniv e.l.) mens du var påvirket av alkohol? Vi tenker her på skader slik at du fikk synlige merker eller måt"
label variable NegKons3          "I løpet av de siste 12 månedene, hvor mange ganger har du blitt påført fysisk skade (f.eks. at noen har slått eller sparket deg eller brukt kniv e.l.) av noen som var alkoholpåvirket? Vi tenker her på skader slik at du fikk synlige merker eller måtte ha"
label variable NegKons4          "I løpet av de siste 12 månedene, hvor mange ganger har du opplevd å få uønsket seksuell oppmerksomhet som du opplevde som krenkende eller trakasserende av noen som var alkoholpåvirket?"
label variable NegKons4_1        "Hvor problematisk opplevde du at dette var?"
label variable NegKons5          "I løpet av siste 12 månedene, hvor mange ganger har du blitt skadet i en ulykke (f.eks. falt eller slått deg) mens du var påvirket av ulovlige rusmidler? Vi tenker her på skader slik at du fikk synlige merker eller måtte ha hjelp eller behandling."
label variable NegKons6          "I løpet av siste 12 månedene, hvor mange ganger har du blitt skadet i en voldshendelse (f.eks. at noen har slått eller sparket deg eller brukt kniv el.) mens du var påvirket av ulovlige rusmidler? Vi tenker her på skader slik at du fikk synlige merker el"
label variable paaror1a          "Er du pårørende til en eller flere personer med alkohol- eller rusmiddelproblemer?"
label variable paaror3           "Er dette noen du bor sammen med?"
label variable paaror4           "Hvor ofte opplever du stor bekymring, engstelse, redsel eller lignende fordi du er pårørende til noen med rusmiddelproblemer?"
label variable paaror5           "Er du pårørende til noen med opplevd overdose av ulovlige rusmidler, alkohol eller reseptbelagte legemidler?"
label variable Avslutt           "Hvor interessante var spørsmålene i undersøkelsen for deg?"
label variable intslutt          "Tusen takk for at du svarte på undersøkelsen! Type kontakt"
label variable paaror1b_a        "Typer rusmidler: Alkohol"
label variable paaror1b_b        "Typer rusmidler: Reseptbelagte legemidler/piller"
label variable paaror1b_c        "Typer rusmidler: Cannabis eller andre ulovlige rusmidler"
label variable paaror2_a         "Familierelasjon til pårørende: Ektefelle/partner/kjæreste"
label variable paaror2_b         "Familierelasjon til pårørende: Mor eller far"
label variable paaror2_c         "Familierelasjon til pårørende: Sønn eller datter"
label variable paaror2_d         "Familierelasjon til pårørende: Søster eller bror"
label variable paaror2_e         "Familierelasjon til pårørende: Annen relasjon"
label variable tobsit_a          "Røyker vanligvis: I sosiale sammenkomster med andre"
label variable tobsit_b          "Røyker vanligvis: I ferien"
label variable tobsit_c          "Røyker vanligvis: Når jeg drikker alkohol"
label variable tobsit_d          "Røyker vanligvis: Når jeg har lyst. Det er ingen spesiell foranledning"
label variable tobsit_e          "Røyker vanligvis: Annet"
label variable alkansk_a         "Anskaffer alkohol: Kjøper i butikk i Norge/vinmonopolet"
label variable alkansk_b         "Anskaffer alkohol: Kjøper i utlandet,"
label variable alkansk_c         "Anskaffer alkohol: Kjøper på tax-freebutikk,"
label variable alkansk_d         "Anskaffer alkohol: Får av venner/slektninger"
label variable alkansk_e         "Anskaffer alkohol: Kjøper av venner/slektninger"
label variable alkansk_f         "Anskaffer alkohol: Kjøper via sosiale medier"
label variable alkansk_g         "Anskaffer alkohol: Kjøper i nettbutikk"
label variable alkansk_h         "Anskaffer alkohol: Kjøper av ukjente"
label variable alkansk_i         "Anskaffer alkohol: Kjøper på utested/serveringssted"
label variable alkansk_j         "Anskaffer alkohol: Annet"
label variable alder1            "Aldersgruppe 1"
label variable alder2            "Aldersgruppe 2"
label variable innt_hush         "Husholdets bruttoinntekt,  Gruppert"
label variable innt_person       "IOs bruttoinntekt,   Gruppert"
label define Yrkesstatus       ///
            1  "Ja"    ///
            2  "Nei"
label values Yrkesstatus       Yrkesstatus

label define YrkStat2          ///
            1  "arbeidsledig"    ///
            2  "skoleelev eller student inkluderer ubetalt arbeidserfaring"    ///
            3  "alders- eller førtidspensjonist"    ///
            4  "arbeidsufør"    ///
            5  "på arbeidsavklaringspenger"    ///
            6  "vernepliktig, sivilarbeider"    ///
            7  "hjemmearbeidende"    ///
            8  "annet"
label values YrkStat2          YrkStat2

label define Siv               ///
            1  "Ja, gift/registrert partner"    ///
            2  "Ja, samboer"    ///
            3  "Nei"
label values Siv               Siv

label define SivStat           ///
            1  "Ugift"    ///
            2  "Gift/ registrert partner"    ///
            3  "Enke/ enkemann/ gjenlevende partner"    ///
            4  "Separert/ separert partner"    ///
            5  "Skilt/ skilt partner"
label values SivStat           SivStat

label define Helse             ///
            1  "Svært god"    ///
            2  "God"    ///
            3  "Verken god eller dårlig"    ///
            4  "Dårlig"    ///
            5  "Svært dårlig"
label values Helse             Helse

label define Helsepsyk         ///
            1  "Svært god"    ///
            2  "God"    ///
            3  "Verken god eller dårlig"    ///
            4  "Dårlig"    ///
            5  "Svært dårlig"
label values Helsepsyk         Helsepsyk

label define Tob1              ///
            1  "Ja"    ///
            2  "Nei"
label values Tob1              Tob1

label define Tob2              ///
            1  "Daglig"    ///
            2  "Av og til"
label values Tob2              Tob2

label define Tob3              ///
            1  "Ja"    ///
            2  "Nei"
label values Tob3              Tob3

label define Tob5              ///
            1  "Flere dager i uken"    ///
            2  "1 dag i uken"    ///
            3  "Sjeldnere"
label values Tob5              Tob5

label define Tob13             ///
            1  "Ja"    ///
            2  "Nei"
label values Tob13             Tob13

label define Tob14             ///
            1  "Ja, daglig"    ///
            2  "Ja, av og til"    ///
            3  "Nei, aldri"
label values Tob14             Tob14

label define Tob22a            ///
            1  "Ja"    ///
            2  "Nei"
label values Tob22a            Tob22a

label define Tob22b            ///
            1  "Ja"    ///
            2  "Nei"
label values Tob22b            Tob22b

label define Tob22d            ///
            1  "Ja"    ///
            2  "Nei"
label values Tob22d            Tob22d

label define Tob22q            ///
            1  "Ja"    ///
            2  "Nei"
label values Tob22q            Tob22q

label define Tob22s            ///
            1  "Ja"    ///
            2  "Nei"
label values Tob22s            Tob22s

label define Tob22r            ///
            1  "Ja"    ///
            2  "Nei"
label values Tob22r            Tob22r

label define Tob30             ///
            1  "Ja"    ///
            2  "Nei"
label values Tob30             Tob30

label define Tob33             ///
            1  "Daglig"    ///
            2  "Av og til"    ///
            3  "Aldri"
label values Tob33             Tob33

label define Tob34             ///
            1  "Daglig"    ///
            2  "Av og til"    ///
            3  "Aldri"
label values Tob34             Tob34

label define Tob38             ///
            1  "Ja"    ///
            2  "Nei"
label values Tob38             Tob38

label define Tob40             ///
            1  "Ja"    ///
            2  "Nei"
label values Tob40             Tob40

label define Tob42a            ///
            1  "Ja"    ///
            2  "Nei"
label values Tob42a            Tob42a

label define Tob42b            ///
            1  "Ja"    ///
            2  "Nei"
label values Tob42b            Tob42b

label define Tob42d            ///
            1  "Ja"    ///
            2  "Nei"
label values Tob42d            Tob42d

label define Tob42o            ///
            1  "Ja"    ///
            2  "Nei"
label values Tob42o            Tob42o

label define Tob42m            ///
            1  "Ja"    ///
            2  "Nei"
label values Tob42m            Tob42m

label define Tob42n            ///
            1  "Ja"    ///
            2  "Nei"
label values Tob42n            Tob42n

label define Tob43             ///
            1  "Ja"    ///
            2  "Nei"
label values Tob43             Tob43

label define Tob44             ///
            1  "Ja"    ///
            2  "Nei"
label values Tob44             Tob44

label define Tobvan1           ///
            1  "Innen 5 min"    ///
            2  "Mellom 6 - 30 min"    ///
            3  "Mellom 31 - 60 min"    ///
            4  "Etter 60 min"
label values Tobvan1           Tobvan1

label define Tob61             ///
            1  "Kommer helt sikkert til å røyke daglig"    ///
            2  "Kommer antakelig til å røyke daglig"    ///
            3  "Kommer antakelig ikke til å røyke daglig"    ///
            4  "Kommer helt sikkert ikke til å røyke daglig"
label values Tob61             Tob61

label define Tob61b            ///
            1  "Kommer helt sikkert til å snuse daglig"    ///
            2  "Kommer antakelig til å snuse daglig"    ///
            3  "Kommer antakelig ikke til å snuse daglig"    ///
            4  "Kommer helt sikkert ikke til å snuse daglig"
label values Tob61b            Tob61b

label define Tob62a            ///
            1  "1 Lite skadelig"    ///
            2  "2"    ///
            3  "3"    ///
            4  "4"    ///
            5  "5"    ///
            6  "6"    ///
            7  "7 Svært skadelig"
label values Tob62a            Tob62a

label define Tob62e            ///
            1  "1 Lite skadelig"    ///
            2  "2"    ///
            3  "3"    ///
            4  "4"    ///
            5  "5"    ///
            6  "6"    ///
            7  "7 Svært skadelig"
label values Tob62e            Tob62e

label define Tob62f            ///
            1  "1 Lite skadelig"    ///
            2  "2"    ///
            3  "3"    ///
            4  "4"    ///
            5  "5"    ///
            6  "6"    ///
            7  "7 Svært skadelig"
label values Tob62f            Tob62f

label define Tob62g            ///
            1  "1 Lite skadelig"    ///
            2  "2"    ///
            3  "3"    ///
            4  "4"    ///
            5  "5"    ///
            6  "6"    ///
            7  "7 Svært skadelig"
label values Tob62g            Tob62g

label define Tob62h            ///
            1  "1 Lite skadelig"    ///
            2  "2"    ///
            3  "3"    ///
            4  "4"    ///
            5  "5"    ///
            6  "6"    ///
            7  "7 Svært skadelig"
label values Tob62h            Tob62h

label define TobE              ///
            1  "Daglig"    ///
            2  "Av og til"    ///
            3  "Aldri"
label values TobE              TobE

label define TobE1             ///
            1  "Ja, tidligere daglig"    ///
            2  "Ja, tidligere av og til"    ///
            3  "Nei"
label values TobE1             TobE1

label define TobE3             ///
            1  "Engangs e-sigarett/fordamper som ikke er oppladbar («disposable», «puff bar» eller «elf bar»)"    ///
            2  "Oppladbar e-sigarett/fordamper med magasin/pod som du kan fylle på eller bytte ut selv"    ///
            3  "Oppladbar og modifiserbar e-sigarett/fordamper, hvor brukeren selv fyller på nikotinvæske/e-juice («mods» eller «tanks»)"
label values TobE3             TobE3

label define TobE4             ///
            1  "Nikotinfrie"    ///
            2  "6 mg eller mindre"    ///
            3  "7-11 mg"    ///
            4  "12-20 mg"    ///
            5  "21 mg eller mer"    ///
            6  "Med nikotin, men usikker på mengden"    ///
            7  "Vet ikke"
label values TobE4             TobE4

label define Tob60             ///
            1  "Daglig"    ///
            2  "Av og til"    ///
            3  "Aldri"
label values Tob60             Tob60

label define Tob64a            ///
            1  "Ja"    ///
            2  "Nei"
label values Tob64a            Tob64a

label define Tob64b            ///
            1  "Daglig"    ///
            2  "Av og til"
label values Tob64b            Tob64b

label define Tob64c            ///
            1  "Ja"    ///
            2  "Nei"
label values Tob64c            Tob64c

label define Tob66             ///
            1  "Løssnus"    ///
            2  "Porsjonssnus"    ///
            3  "Mini-porsjonssnus"    ///
            4  "Både løssnus og porsjonssnus"    ///
            5  "Nikotinposer eller hvit snus uten tobakk"
label values Tob66             Tob66

label define Tob69             ///
            1  "Begynte med sigaretter først"    ///
            2  "Begynte med snus først"    ///
            3  "Omtrent samtidig (innenfor tre måneder)"
label values Tob69             Tob69

label define Tob69b            ///
            1  "Ja"    ///
            2  "Nei"
label values Tob69b            Tob69b

label define Tob71             ///
            1  "Ja"    ///
            2  "Nei"
label values Tob71             Tob71

label define tobsluttsn1       ///
            1  "Ja, siste 12 måneder"    ///
            2  "Ja, for mer enn 12 måneder siden"    ///
            3  "Nei"
label values tobsluttsn1       tobsluttsn1

label define Drukket1          ///
            1  "Ja"    ///
            2  "Nei"
label values Drukket1          Drukket1

label define Drukk1b           ///
            1  "Ja"    ///
            2  "Nei"
label values Drukk1b           Drukk1b

label define Drukket2          ///
            1  "Daglig"    ///
            2  "Ukentlig"    ///
            3  "Månedlig"    ///
            4  "Sjeldnere enn månedlig"
label values Drukket2          Drukket2

label define Drukk2a           ///
            1  "4-5 dager i uken"    ///
            2  "2-3 dager i uken"    ///
            3  "Omtrent 1 dag i uken"
label values Drukk2a           Drukk2a

label define Drukk2b           ///
            1  "Flere enn tre dager i måneden"    ///
            2  "2-3 dager i måneden"    ///
            3  "Omtrent 1 dag i måneden"
label values Drukk2b           Drukk2b

label define Drukk2c           ///
            1  "Flere enn tre dager"    ///
            2  "2-3 dager"    ///
            3  "Omtrent 1 dag"
label values Drukk2c           Drukk2c

label define Drukket3          ///
            1  "Ja"    ///
            2  "Nei"
label values Drukket3          Drukket3

label define Type1             ///
            1  "Ja"    ///
            2  "Nei"
label values Type1             Type1

label define Type2             ///
            1  "Ja"    ///
            2  "Nei"
label values Type2             Type2

label define Type3             ///
            1  "Ja"    ///
            2  "Nei"
label values Type3             Type3

label define Type4             ///
            1  "Ja"    ///
            2  "Nei"
label values Type4             Type4

label define Type1a            ///
            1  "Daglig"    ///
            2  "Ukentlig"    ///
            3  "Sjeldnere enn ukentlig"
label values Type1a            Type1a

label define Typ1a_uk          ///
            1  "4-5 dager i uken"    ///
            2  "2-3 dager i uken"    ///
            3  "Omtrent 1 dag i uken"
label values Typ1a_uk          Typ1a_uk

label define Typ1a_mn          ///
            1  "Flere enn 3 dager"    ///
            2  "2-3 dager"    ///
            3  "Omtrent 1 dag"
label values Typ1a_mn          Typ1a_mn

label define Type1b_a          ///
            1  "Ja"    ///
            2  "Nei"
label values Type1b_a          Type1b_a

label define Type1b_b          ///
            1  "Ja"    ///
            2  "Nei"
label values Type1b_b          Type1b_b

label define Type1c_a          ///
            1  "Ja"    ///
            2  "Nei"
label values Type1c_a          Type1c_a

label define Type1c_b          ///
            1  "Ja"    ///
            2  "Nei"
label values Type1c_b          Type1c_b

label define Type2a            ///
            1  "Daglig"    ///
            2  "Ukentlig"    ///
            3  "Sjeldnere enn ukentlig"
label values Type2a            Type2a

label define Typ2a_uk          ///
            1  "4-5 dager i uken"    ///
            2  "2-3 dager i uken"    ///
            3  "Omtrent 1 dag i uken"
label values Typ2a_uk          Typ2a_uk

label define Typ2a_mn          ///
            1  "Flere enn 3 dager"    ///
            2  "2-3 dager"    ///
            3  "Omtrent 1 dag"
label values Typ2a_mn          Typ2a_mn

label define Type2b_a          ///
            1  "Ja"    ///
            2  "Nei"
label values Type2b_a          Type2b_a

label define Type2b_b          ///
            1  "Ja"    ///
            2  "Nei"
label values Type2b_b          Type2b_b

label define Type2c_a          ///
            1  "Ja"    ///
            2  "Nei"
label values Type2c_a          Type2c_a

label define Type2c_b          ///
            1  "Ja"    ///
            2  "Nei"
label values Type2c_b          Type2c_b

label define Type3a            ///
            1  "Daglig"    ///
            2  "Ukentlig"    ///
            3  "Sjeldnere enn ukentlig"
label values Type3a            Type3a

label define Typ3a_uk          ///
            1  "4-5 dager i uken"    ///
            2  "2-3 dager i uken"    ///
            3  "Omtrent 1 dag i uken"
label values Typ3a_uk          Typ3a_uk

label define Typ3a_mn          ///
            1  "Flere enn 3 dager"    ///
            2  "2-3 dager"    ///
            3  "Omtrent 1 dag"
label values Typ3a_mn          Typ3a_mn

label define Type3b_a          ///
            1  "Ja"    ///
            2  "Nei"
label values Type3b_a          Type3b_a

label define Type3b_b          ///
            1  "Ja"    ///
            2  "Nei"
label values Type3b_b          Type3b_b

label define Type3c_a          ///
            1  "Ja"    ///
            2  "Nei"
label values Type3c_a          Type3c_a

label define Type3c_b          ///
            1  "Ja"    ///
            2  "Nei"
label values Type3c_b          Type3c_b

label define Type4a            ///
            1  "Daglig"    ///
            2  "Ukentlig"    ///
            3  "Sjeldnere enn ukentlig"
label values Type4a            Type4a

label define Typ4a_uk          ///
            1  "4-5 dager i uken"    ///
            2  "2-3 dager i uken"    ///
            3  "Omtrent 1 dag i uken"
label values Typ4a_uk          Typ4a_uk

label define Typ4a_mn          ///
            1  "Flere enn 3 dager"    ///
            2  "2-3 dager"    ///
            3  "Omtrent 1 dag"
label values Typ4a_mn          Typ4a_mn

label define Type4b_a          ///
            1  "Ja"    ///
            2  "Nei"
label values Type4b_a          Type4b_a

label define Type4b_b          ///
            1  "Ja"    ///
            2  "Nei"
label values Type4b_b          Type4b_b

label define Type4c_a          ///
            1  "Ja"    ///
            2  "Nei"
label values Type4c_a          Type4c_a

label define Type4c_b          ///
            1  "Ja"    ///
            2  "Nei"
label values Type4c_b          Type4c_b

label define AL2               ///
            1  "Alle 4 ukedagene"    ///
            2  "3 av 4 dager"    ///
            3  "2 av 4 dager"    ///
            4  "1 av 4 dager"    ///
            5  "Ingen av dagene"
label values AL2               AL2

label define AL3               ///
            1  "16 eller flere enheter per dag"    ///
            2  "10-15 enheter per dag"    ///
            3  "6-9 enheter per dag"    ///
            4  "4-5 enheter per dag"    ///
            5  "3 enheter per dag"    ///
            6  "2 enheter per dag"    ///
            7  "1 enhet per dag"
label values AL3               AL3

label define AL4               ///
            1  "Alle 3 dagene"    ///
            2  "2 av 3 dager"    ///
            3  "1 av 3 dager"    ///
            4  "Ingen av dagene"
label values AL4               AL4

label define AL5               ///
            1  "16 eller flere enheter per dag"    ///
            2  "10-15 enheter per dag"    ///
            3  "6-9 enheter per dag"    ///
            4  "4-5 enheter per dag"    ///
            5  "3 enheter per dag"    ///
            6  "2 enheter per dag"    ///
            7  "1 enhet per dag"
label values AL5               AL5

label define Audit2            ///
            1  "1-2"    ///
            2  "3-4"    ///
            3  "5-6"    ///
            4  "7-9"    ///
            5  "10 eller flere"
label values Audit2            Audit2

label define Audit3            ///
            1  "Daglig"    ///
            2  "Ukentlig"    ///
            3  "Månedlig"    ///
            4  "Sjeldnere enn månedlig"    ///
            5  "Aldri"
label values Audit3            Audit3

label define Audit3_1          ///
            1  "4-5 dager i uken"    ///
            2  "2-3 dager i uken"    ///
            3  "Omtrent 1 dag i uken"
label values Audit3_1          Audit3_1

label define Audit3_2          ///
            1  "Flere enn 3 dager i måneden"    ///
            2  "2-3 dager i måneden"    ///
            3  "Omtrent 1 dag i måneden"
label values Audit3_2          Audit3_2

label define Audit3_3          ///
            1  "Flere enn 3 dager"    ///
            2  "2-3 dager"    ///
            3  "Omtrent 1 dag"
label values Audit3_3          Audit3_3

label define Audit4            ///
            1  "... aldri"    ///
            2  "... sjeldnere enn månedlig"    ///
            3  "... månedlig"    ///
            4  "... ukentlig"    ///
            5  "... daglig eller nesten daglig"
label values Audit4            Audit4

label define Audit5            ///
            1  "... aldri"    ///
            2  "... sjeldnere enn månedlig"    ///
            3  "... månedlig"    ///
            4  "... ukentlig"    ///
            5  "... daglig eller nesten daglig"
label values Audit5            Audit5

label define Audit6            ///
            1  "... aldri"    ///
            2  "... sjeldnere enn månedlig"    ///
            3  "... månedlig"    ///
            4  "... ukentlig"    ///
            5  "... daglig eller nesten daglig"
label values Audit6            Audit6

label define Audit7            ///
            1  "... aldri"    ///
            2  "... sjeldnere enn månedlig"    ///
            3  "... månedlig"    ///
            4  "... ukentlig"    ///
            5  "... daglig eller nesten daglig"
label values Audit7            Audit7

label define Audit8            ///
            1  "... aldri"    ///
            2  "... sjeldnere enn månedlig"    ///
            3  "... månedlig"    ///
            4  "... ukentlig"    ///
            5  "... daglig eller nesten daglig"
label values Audit8            Audit8

label define Audit9_a          ///
            1  "Ja"    ///
            2  "Nei"
label values Audit9_a          Audit9_a

label define Audit9_b          ///
            1  "Ja"    ///
            2  "Nei"
label values Audit9_b          Audit9_b

label define Audit9_c          ///
            1  "Ja"    ///
            2  "Nei"
label values Audit9_c          Audit9_c

label define Audit9a           ///
            1  "Ja"    ///
            2  "Nei"
label values Audit9a           Audit9a

label define Audit9b           ///
            1  "Ja"    ///
            2  "Nei"
label values Audit9b           Audit9b

label define Audit10           ///
            1  "Ja"    ///
            2  "Nei"
label values Audit10           Audit10

label define Audit10a          ///
            1  "Ja"    ///
            2  "Nei"
label values Audit10a          Audit10a

label define Arb_alk1          ///
            1  "Ja"    ///
            2  "Nei"
label values Arb_alk1          Arb_alk1

label define Leg1              ///
            1  "Ja"    ///
            2  "Nei"
label values Leg1              Leg1

label define Leg2              ///
            1  "Ja"    ///
            2  "Nei"
label values Leg2              Leg2

label define Leg3              ///
            1  "1 til 2 uker"    ///
            2  "3 til 4 uker"    ///
            3  "1 til 3 måneder"    ///
            4  "Mer enn tre måneder"
label values Leg3              Leg3

label define Leg5              ///
            1  "Ja"    ///
            2  "Nei"
label values Leg5              Leg5

label define Leg6              ///
            1  "Ja"    ///
            2  "Nei"
label values Leg6              Leg6

label define Leg7              ///
            1  "1 til 2 uker"    ///
            2  "3 til 4 uker"    ///
            3  "1 til 3 måneder"    ///
            4  "Mer enn tre måneder"
label values Leg7              Leg7

label define Leg9              ///
            1  "Ja"    ///
            2  "Nei"
label values Leg9              Leg9

label define Leg10             ///
            1  "Ja"    ///
            2  "Nei"
label values Leg10             Leg10

label define Leg11             ///
            1  "1 til 2 uker"    ///
            2  "3 til 4 uker"    ///
            3  "1 til 3 måneder"    ///
            4  "Mer enn tre måneder"
label values Leg11             Leg11

label define Leg12             ///
            1  "Aldri"    ///
            2  "1 gang i mnd. eller sjeldnere"    ///
            3  "2-3 ganger i måneden"    ///
            4  "2-3 ganger i uken"    ///
            5  "4 ganger i uken eller mer"
label values Leg12             Leg12

label define Can1              ///
            1  "Ja"    ///
            2  "Nei"
label values Can1              Can1

label define Can2              ///
            1  "En gang"    ///
            2  "2-5 ganger"    ///
            3  "6-10 ganger"    ///
            4  "11-50 ganger"    ///
            5  "Mer enn 50 ganger"
label values Can2              Can2

label define Can4              ///
            1  "Ja"    ///
            2  "Nei"    ///
            3  "Husker ikke/vet ikke"
label values Can4              Can4

label define Can5              ///
            1  "Ja"    ///
            2  "Nei"    ///
            3  "Vet ikke"
label values Can5              Can5

label define Can6              ///
            1  "Ja"    ///
            2  "Nei"
label values Can6              Can6

label define Can6b             ///
            1  "Nei"    ///
            2  "Ja, en gang"    ///
            3  "Ja, 2-5 ganger"    ///
            4  "Ja, 6-9 ganger"    ///
            5  "Ja, 10 ganger eller mer"    ///
            6  "Husker ikke/vet ikke"
label values Can6b             Can6b

label define Can7_a            ///
            1  "Ja"    ///
            2  "Nei"
label values Can7_a            Can7_a

label define Can7_b            ///
            1  "Ja"    ///
            2  "Nei"
label values Can7_b            Can7_b

label define Can7_c            ///
            1  "Ja"    ///
            2  "Nei"
label values Can7_c            Can7_c

label define Can7_d            ///
            1  "Ja"    ///
            2  "Nei"
label values Can7_d            Can7_d

label define Can7_e            ///
            1  "Ja"    ///
            2  "Nei"
label values Can7_e            Can7_e

label define Can8              ///
            1  "Fikk av kjente"    ///
            2  "Kjøpte av kjente"    ///
            3  "Kjøpte via sosiale medier"    ///
            4  "Kjøpte via Internett"    ///
            5  "Kjøpte av ukjente på annen måte"    ///
            6  "Dyrket selv"    ///
            7  "Annet, spesifiser"
label values Can8              Can8

label define Can9              ///
            1  "1-5 ganger"    ///
            2  "6-10 ganger"    ///
            3  "11-50 ganger"    ///
            4  "Mer enn 50 ganger"
label values Can9              Can9

label define Can10             ///
            1  "Ja"    ///
            2  "Nei"
label values Can10             Can10

label define Can11             ///
            1  "20 dager eller mer"    ///
            2  "10-19 dager"    ///
            3  "4-9 dager"    ///
            4  "1-3 dager"
label values Can11             Can11

label define Can14             ///
            1  "Ja"    ///
            2  "Nei"
label values Can14             Can14

label define Ans1              ///
            1  "Ja"    ///
            2  "Nei"
label values Ans1              Ans1

label define Ans2_a            ///
            1  "Ja"    ///
            2  "Nei"
label values Ans2_a            Ans2_a

label define Ans2_b            ///
            1  "Ja"    ///
            2  "Nei"
label values Ans2_b            Ans2_b

label define Ans2_c            ///
            1  "Ja"    ///
            2  "Nei"
label values Ans2_c            Ans2_c

label define Ans2_d            ///
            1  "Ja"    ///
            2  "Nei"
label values Ans2_d            Ans2_d

label define Ans2_e            ///
            1  "Ja"    ///
            2  "Nei"
label values Ans2_e            Ans2_e

label define Ans2_f            ///
            1  "Ja"    ///
            2  "Nei"
label values Ans2_f            Ans2_f

label define Ans2_g            ///
            1  "Ja"    ///
            2  "Nei"
label values Ans2_g            Ans2_g

label define Ans2_x            ///
            1  "Ja"    ///
            2  "Nei"
label values Ans2_x            Ans2_x

label define Ans2_y            ///
            1  "Ja"    ///
            2  "Nei"
label values Ans2_y            Ans2_y

label define Ans2_h            ///
            1  "Ja"    ///
            2  "Nei"
label values Ans2_h            Ans2_h

label define Ans3_1            ///
            1  "Ja"    ///
            2  "Nei"
label values Ans3_1            Ans3_1

label define Ans3_2            ///
            1  "Ja"    ///
            2  "Nei"
label values Ans3_2            Ans3_2

label define Ans3_3            ///
            1  "Ja"    ///
            2  "Nei"
label values Ans3_3            Ans3_3

label define Ans3_4            ///
            1  "Ja"    ///
            2  "Nei"
label values Ans3_4            Ans3_4

label define Ans3_5            ///
            1  "Ja"    ///
            2  "Nei"
label values Ans3_5            Ans3_5

label define Ans3_6            ///
            1  "Ja"    ///
            2  "Nei"
label values Ans3_6            Ans3_6

label define Ans3_7            ///
            1  "Ja"    ///
            2  "Nei"
label values Ans3_7            Ans3_7

label define Ans3_x            ///
            1  "Ja"    ///
            2  "Nei"
label values Ans3_x            Ans3_x

label define Ans3_y            ///
            1  "Ja"    ///
            2  "Nei"
label values Ans3_y            Ans3_y

label define Ans3_8            ///
            1  "Ja"    ///
            2  "Nei"
label values Ans3_8            Ans3_8

label define Ans_5             ///
            1  "1-5 dager"    ///
            2  "6-10 dager"    ///
            3  "11-50 dager"    ///
            4  "50 dager eller mer"
label values Ans_5             Ans_5

label define Ans9              ///
            1  "1-5 dager"    ///
            2  "6-10 dager"    ///
            3  "11-50 dager"    ///
            4  "50 dager eller mer"
label values Ans9              Ans9

label define Dop1              ///
            1  "Ja"    ///
            2  "Nei"
label values Dop1              Dop1

label define Dop3_1            ///
            1  "Ja"    ///
            2  "Nei"
label values Dop3_1            Dop3_1

label define NegKons1          ///
            1  "Ingen"    ///
            2  "En gang"    ///
            3  "Mer enn en gang"
label values NegKons1          NegKons1

label define NegKons2          ///
            1  "Ingen"    ///
            2  "En gang"    ///
            3  "Mer enn en gang"
label values NegKons2          NegKons2

label define NegKons3          ///
            1  "Ingen"    ///
            2  "En gang"    ///
            3  "Mer enn en gang"
label values NegKons3          NegKons3

label define NegKons4          ///
            1  "Ingen"    ///
            2  "En gang"    ///
            3  "Mer enn en gang"
label values NegKons4          NegKons4

label define NegKons4_1        ///
            1  "Helt uproblematisk"    ///
            2  "Nokså uproblematisk"    ///
            3  "Nokså problematisk"    ///
            4  "Svært problematisk"
label values NegKons4_1        NegKons4_1

label define NegKons5          ///
            1  "Ingen"    ///
            2  "En gang"    ///
            3  "Mer enn en gang"
label values NegKons5          NegKons5

label define NegKons6          ///
            1  "Ingen"    ///
            2  "En gang"    ///
            3  "Mer enn en gang"
label values NegKons6          NegKons6

label define paaror1a          ///
            1  "Ja"    ///
            2  "Nei"
label values paaror1a          paaror1a

label define paaror3           ///
            1  "Ja"    ///
            2  "Nei"
label values paaror3           paaror3

label define paaror4           ///
            1  "Daglig"    ///
            2  "Ukentlig"    ///
            3  "Månedlig"    ///
            4  "Sjeldnere enn månedlig"    ///
            5  "Aldri"
label values paaror4           paaror4

label define paaror5           ///
            1  "Ja"    ///
            2  "Nei"    ///
            3  "Vet ikke"
label values paaror5           paaror5

label define Avslutt           ///
            1  "Svært interessante"    ///
            2  "Ganske interessante"    ///
            3  "Ganske uinteressante"    ///
            4  "Svært uinteressante"    ///
            5  "Jeg har ingen mening om det"
label values Avslutt           Avslutt

label define intslutt          ///
            1  "Telefon"    ///
            2  "besok"    ///
            3  "www"    ///
            4  "Ingen"
label values intslutt          intslutt

label define yrke              ///
            0  "Militære yrker (ikke sivile stillinger i forsvaret)"    ///
            1  "Administrative ledere og politikere"    ///
            2  "Akademiske yrker"    ///
            3  "Høyskoleyrker"    ///
            4  "Kontor- og kundeserviceyrker"    ///
            5  "Salgs-, service- og omsorgsyrker"    ///
            6  "Yrker innen jordbruk, skogbruk og fiske"    ///
            7  "Håndverkere og lignende"    ///
            8  "Prosess- og maskinoperatører, transportarbeidere mv."    ///
            9  "Yrker uten krav til utdanning"

destring yrke, replace
label values yrke              yrke

label define paaror1b_a        ///
            1  "Ja"    ///
            2  "Nei"
label values paaror1b_a        paaror1b_a

label define paaror1b_b        ///
            1  "Ja"    ///
            2  "Nei"
label values paaror1b_b        paaror1b_b

label define paaror1b_c        ///
            1  "Ja"    ///
            2  "Nei"
label values paaror1b_c        paaror1b_c

label define paaror2_a         ///
            1  "Ja"    ///
            2  "Nei"
label values paaror2_a         paaror2_a

label define paaror2_b         ///
            1  "Ja"    ///
            2  "Nei"
label values paaror2_b         paaror2_b

label define paaror2_c         ///
            1  "Ja"    ///
            2  "Nei"
label values paaror2_c         paaror2_c

label define paaror2_d         ///
            1  "Ja"    ///
            2  "Nei"
label values paaror2_d         paaror2_d

label define paaror2_e         ///
            1  "Ja"    ///
            2  "Nei"
label values paaror2_e         paaror2_e

label define tobsit_a          ///
            1  "Ja"    ///
            2  "Nei"
label values tobsit_a          tobsit_a

label define tobsit_b          ///
            1  "Ja"    ///
            2  "Nei"
label values tobsit_b          tobsit_b

label define tobsit_c          ///
            1  "Ja"    ///
            2  "Nei"
label values tobsit_c          tobsit_c

label define tobsit_d          ///
            1  "Ja"    ///
            2  "Nei"
label values tobsit_d          tobsit_d

label define tobsit_e          ///
            1  "Ja"    ///
            2  "Nei"
label values tobsit_e          tobsit_e

label define alkansk_a         ///
            1  "Ja"    ///
            2  "Nei"
label values alkansk_a         alkansk_a

label define alkansk_b         ///
            1  "Ja"    ///
            2  "Nei"
label values alkansk_b         alkansk_b

label define alkansk_c         ///
            1  "Ja"    ///
            2  "Nei"
label values alkansk_c         alkansk_c

label define alkansk_d         ///
            1  "Ja"    ///
            2  "Nei"
label values alkansk_d         alkansk_d

label define alkansk_e         ///
            1  "Ja"    ///
            2  "Nei"
label values alkansk_e         alkansk_e

label define alkansk_f         ///
            1  "Ja"    ///
            2  "Nei"
label values alkansk_f         alkansk_f

label define alkansk_g         ///
            1  "Ja"    ///
            2  "Nei"
label values alkansk_g         alkansk_g

label define alkansk_h         ///
            1  "Ja"    ///
            2  "Nei"
label values alkansk_h         alkansk_h

label define alkansk_i         ///
            1  "Ja"    ///
            2  "Nei"
label values alkansk_i         alkansk_i

label define alkansk_j         ///
            1  "Ja"    ///
            2  "Nei"
label values alkansk_j         alkansk_j

label define fylke_2025        ///
            03  "Oslo"    ///
            11  "Rogaland"    ///
            15  "Møre og Romsdal"    ///
            18  "Nordland"    ///
            21  "Svalbard"    ///
            22  "Jan Mayen"    ///
            31  "Østfold"    ///
            32  "Akershus"    ///
            33  "Buskerud"    ///
            34  "Innlandet"    ///
            39  "Vestfold"    ///
            40  "Telemark"    ///
            42  "Agder"    ///
            46  "Vestland"    ///
            50  "Trøndelag"    ///
            55  "Troms"    ///
            56  "Finnmark"

destring fylke_2025, replace
label values fylke_2025        fylke_2025

label define landsdel_2025     ///
            1  "Oslo og Viken"    ///
            2  "Innlandet"    ///
            3  "Agder og Sør-Østlandet"    ///
            4  "Vestlandet"    ///
            5  "Trøndelag"    ///
            6  "Nord-Norge"    ///
            9  "Uoppgitt"
label values landsdel_2025     landsdel_2025

label define alder1            ///
            1  "16-24 år"    ///
            2  "25-44 år"    ///
            3  "45-66 år"    ///
            4  "67-79 år"    ///
            5  "80- år"    ///
            8  "Vil ikke svare"    ///
            9  "Vet ikke"
label values alder1            alder1

label define alder2            ///
            1  "16-20 år"    ///
            2  "21-30 år"    ///
            3  "31-40 år"    ///
            4  "41-50 år"    ///
            5  "51-60 år"    ///
            6  "61-79 år"    ///
            7  "80- år"
label values alder2            alder2

// label define Tett_spredt       ///
//             s  "Spredtbygd"    ///
//             t  "Tettbygd"

// destring Tett_spredt, replace
// label values Tett_spredt       Tett_spredt

label define fodeland_IO       ///
            1  "Norge"    ///
            2  "Europa"    ///
            3  "Asia"    ///
            4  "Afrika"    ///
            5  "Sør- og Mellom-Amerika"    ///
            6  "Nord-Amerika"    ///
            7  "Australia/New Zeland/Osceania"    ///
            9  "Uoppgitt/mangler"
label values fodeland_IO       fodeland_IO

label define fodeland_far      ///
            1  "Norge"    ///
            2  "Europa"    ///
            3  "Asia"    ///
            4  "Afrika"    ///
            5  "Sør- og Mellom-Amerika"    ///
            6  "Nord-Amerika"    ///
            7  "Australia/New Zeland/Osceania"    ///
            9  "Uoppgitt/mangler"
label values fodeland_far      fodeland_far

label define fodeland_mor      ///
            1  "Norge"    ///
            2  "Europa"    ///
            3  "Asia"    ///
            4  "Afrika"    ///
            5  "Sør- og Mellom-Amerika"    ///
            6  "Nord-Amerika"    ///
            7  "Australia/New Zeland/Osceania"    ///
            9  "Uoppgitt/mangler"
label values fodeland_mor      fodeland_mor

label define innt_hush         ///
            1  "0 - 99"    ///
            2  "100 - 149"    ///
            3  "150 - 199"    ///
            4  "200 - 249"    ///
            5  "250 - 299"    ///
            6  "300 - 399"    ///
            7  "400 - 499"    ///
            8  "500 - 599"    ///
            9  "600 - 699"    ///
            10  "700 - 799"    ///
            11  "800 - 899"    ///
            12  "900 - 999"    ///
            13  "1000 og mer"
label values innt_hush         innt_hush

label define innt_person       ///
            1  "0 - 99"    ///
            2  "100 - 149"    ///
            3  "150 - 199"    ///
            4  "200 - 249"    ///
            5  "250 - 299"    ///
            6  "300 - 399"    ///
            7  "400 - 499"    ///
            8  "500 - 599"    ///
            9  "600 - 699"    ///
            10  "700 og mer"
label values innt_person       innt_person

label define Utdann_4gr        ///
            1  "Grunnskole (inklusive uoppgitt og ingen utdanning)"    ///
            2  "Videregående skole"    ///
            3  "Universitet-og høyskole"    ///
            4  "Universitet-og høyskole, høyere nivå"
label values Utdann_4gr        Utdann_4gr

label define Sentralitet       ///
            1  "Sentralitet: 1 (925-1000) - høy"    ///
            2  "Sentralitet: 2 (870-924)"    ///
            3  "Sentralitet: 3 (775-869)"    ///
            4  "Sentralitet: 4 (670-774)"    ///
            5  "Sentralitet: 5 (565-669)"    ///
            6  "Sentralitet: 6 (0-564) - lav"
destring Sentralitet, replace
label values Sentralitet       Sentralitet

