library(codebook)
library(labelled)

# Value labels
ssb$Yrkesstatus <- labelled(ssb$Yrkesstatus, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$YrkStat2 <- labelled(ssb$YrkStat2, c(
  "arbeidsledig" = 1,
  "skoleelev eller student inkluderer ubetalt arbeidserfaring" = 2,
  "alders- eller førtidspensjonist" = 3,
  "arbeidsufør" = 4,
  "på arbeidsavklaringspenger" = 5,
  "vernepliktig, sivilarbeider" = 6,
  "hjemmearbeidende" = 7,
  "annet" = 8
))

ssb$Siv <- labelled(ssb$Siv, c(
  "Ja, gift/registrert partner" = 1,
  "Ja, samboer" = 2,
  "Nei" = 3
))

ssb$SivStat <- labelled(ssb$SivStat, c(
  "Ugift" = 1,
  "Gift/ registrert partner" = 2,
  "Enke/ enkemann/ gjenlevende partner" = 3,
  "Separert/ separert partner" = 4,
  "Skilt/ skilt partner" = 5
))

ssb$Helse <- labelled(ssb$Helse, c(
  "Svært god" = 1,
  "God" = 2,
  "Verken god eller dårlig" = 3,
  "Dårlig" = 4,
  "Svært dårlig" = 5
))

ssb$Helsepsyk <- labelled(ssb$Helsepsyk, c(
  "Svært god" = 1,
  "God" = 2,
  "Verken god eller dårlig" = 3,
  "Dårlig" = 4,
  "Svært dårlig" = 5
))

ssb$Tob1 <- labelled(ssb$Tob1, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Tob2 <- labelled(ssb$Tob2, c(
  "Daglig" = 1,
  "Av og til" = 2
))

ssb$Tob3 <- labelled(ssb$Tob3, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Tob5 <- labelled(ssb$Tob5, c(
  "Flere dager i uken" = 1,
  "1 dag i uken" = 2,
  "Sjeldnere" = 3
))

ssb$Tob13 <- labelled(ssb$Tob13, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Tob14 <- labelled(ssb$Tob14, c(
  "Ja, daglig" = 1,
  "Ja, av og til" = 2,
  "Nei, aldri" = 3
))

ssb$Tob22a <- labelled(ssb$Tob22a, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Tob22b <- labelled(ssb$Tob22b, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Tob22d <- labelled(ssb$Tob22d, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Tob22q <- labelled(ssb$Tob22q, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Tob22s <- labelled(ssb$Tob22s, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Tob22r <- labelled(ssb$Tob22r, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Tob30 <- labelled(ssb$Tob30, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Tob33 <- labelled(ssb$Tob33, c(
  "Daglig" = 1,
  "Av og til" = 2,
  "Aldri" = 3
))

ssb$Tob34 <- labelled(ssb$Tob34, c(
  "Daglig" = 1,
  "Av og til" = 2,
  "Aldri" = 3
))

ssb$Tob38 <- labelled(ssb$Tob38, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Tob40 <- labelled(ssb$Tob40, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Tob42a <- labelled(ssb$Tob42a, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Tob42b <- labelled(ssb$Tob42b, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Tob42d <- labelled(ssb$Tob42d, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Tob42o <- labelled(ssb$Tob42o, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Tob42m <- labelled(ssb$Tob42m, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Tob42n <- labelled(ssb$Tob42n, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Tob43 <- labelled(ssb$Tob43, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Tob44 <- labelled(ssb$Tob44, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Tobvan1 <- labelled(ssb$Tobvan1, c(
  "Innen 5 min" = 1,
  "Mellom 6 - 30 min" = 2,
  "Mellom 31 - 60 min" = 3,
  "Etter 60 min" = 4
))

ssb$Tob61 <- labelled(ssb$Tob61, c(
  "Kommer helt sikkert til å røyke daglig" = 1,
  "Kommer antakelig til å røyke daglig" = 2,
  "Kommer antakelig ikke til å røyke daglig" = 3,
  "Kommer helt sikkert ikke til å røyke daglig" = 4
))

ssb$Tob61b <- labelled(ssb$Tob61b, c(
  "Kommer helt sikkert til å snuse daglig" = 1,
  "Kommer antakelig til å snuse daglig" = 2,
  "Kommer antakelig ikke til å snuse daglig" = 3,
  "Kommer helt sikkert ikke til å snuse daglig" = 4
))

ssb$Tob62a <- labelled(ssb$Tob62a, c(
  "1 Lite skadelig" = 1,
  "2" = 2,
  "3" = 3,
  "4" = 4,
  "5" = 5,
  "6" = 6,
  "7 Svært skadelig" = 7
))

ssb$Tob62e <- labelled(ssb$Tob62e, c(
  "1 Lite skadelig" = 1,
  "2" = 2,
  "3" = 3,
  "4" = 4,
  "5" = 5,
  "6" = 6,
  "7 Svært skadelig" = 7
))

ssb$Tob62f <- labelled(ssb$Tob62f, c(
  "1 Lite skadelig" = 1,
  "2" = 2,
  "3" = 3,
  "4" = 4,
  "5" = 5,
  "6" = 6,
  "7 Svært skadelig" = 7
))

ssb$Tob62g <- labelled(ssb$Tob62g, c(
  "1 Lite skadelig" = 1,
  "2" = 2,
  "3" = 3,
  "4" = 4,
  "5" = 5,
  "6" = 6,
  "7 Svært skadelig" = 7
))

ssb$Tob62h <- labelled(ssb$Tob62h, c(
  "1 Lite skadelig" = 1,
  "2" = 2,
  "3" = 3,
  "4" = 4,
  "5" = 5,
  "6" = 6,
  "7 Svært skadelig" = 7
))

ssb$TobE <- labelled(ssb$TobE, c(
  "Daglig" = 1,
  "Av og til" = 2,
  "Aldri" = 3
))

ssb$TobE1 <- labelled(ssb$TobE1, c(
  "Ja, tidligere daglig" = 1,
  "Ja, tidligere av og til" = 2,
  "Nei" = 3
))

ssb$TobE3 <- labelled(ssb$TobE3, c(
  "Engangs e-sigarett/fordamper som ikke er oppladbar («disposable», «puff bar» eller «elf bar»)" = 1,
  "Oppladbar e-sigarett/fordamper med magasin/pod som du kan fylle på eller bytte ut selv" = 2,
  "Oppladbar og modifiserbar e-sigarett/fordamper, hvor brukeren selv fyller på nikotinvæske/e-juice («mods» eller «tanks»)" = 3
))

ssb$TobE4 <- labelled(ssb$TobE4, c(
  "Nikotinfrie" = 1,
  "6 mg eller mindre" = 2,
  "7-11 mg" = 3,
  "12-20 mg" = 4,
  "21 mg eller mer" = 5,
  "Med nikotin, men usikker på mengden" = 6,
  "Vet ikke" = 7
))

ssb$Tob60 <- labelled(ssb$Tob60, c(
  "Daglig" = 1,
  "Av og til" = 2,
  "Aldri" = 3
))

ssb$Tob64a <- labelled(ssb$Tob64a, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Tob64b <- labelled(ssb$Tob64b, c(
  "Daglig" = 1,
  "Av og til" = 2
))

ssb$Tob64c <- labelled(ssb$Tob64c, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Tob66 <- labelled(ssb$Tob66, c(
  "Løssnus" = 1,
  "Porsjonssnus" = 2,
  "Mini-porsjonssnus" = 3,
  "Både løssnus og porsjonssnus" = 4,
  "Nikotinposer eller hvit snus uten tobakk" = 5
))

ssb$Tob69 <- labelled(ssb$Tob69, c(
  "Begynte med sigaretter først" = 1,
  "Begynte med snus først" = 2,
  "Omtrent samtidig (innenfor tre måneder)" = 3
))

ssb$Tob69b <- labelled(ssb$Tob69b, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Tob71 <- labelled(ssb$Tob71, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$tobsluttsn1 <- labelled(ssb$tobsluttsn1, c(
  "Ja, siste 12 måneder" = 1,
  "Ja, for mer enn 12 måneder siden" = 2,
  "Nei" = 3
))

ssb$Drukket1 <- labelled(ssb$Drukket1, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Drukk1b <- labelled(ssb$Drukk1b, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Drukket2 <- labelled(ssb$Drukket2, c(
  "Daglig" = 1,
  "Ukentlig" = 2,
  "Månedlig" = 3,
  "Sjeldnere enn månedlig" = 4
))

ssb$Drukk2a <- labelled(ssb$Drukk2a, c(
  "4-5 dager i uken" = 1,
  "2-3 dager i uken" = 2,
  "Omtrent 1 dag i uken" = 3
))

ssb$Drukk2b <- labelled(ssb$Drukk2b, c(
  "Flere enn tre dager i måneden" = 1,
  "2-3 dager i måneden" = 2,
  "Omtrent 1 dag i måneden" = 3
))

ssb$Drukk2c <- labelled(ssb$Drukk2c, c(
  "Flere enn tre dager" = 1,
  "2-3 dager" = 2,
  "Omtrent 1 dag" = 3
))

ssb$Drukket3 <- labelled(ssb$Drukket3, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Type1 <- labelled(ssb$Type1, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Type2 <- labelled(ssb$Type2, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Type3 <- labelled(ssb$Type3, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Type4 <- labelled(ssb$Type4, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Type1a <- labelled(ssb$Type1a, c(
  "Daglig" = 1,
  "Ukentlig" = 2,
  "Sjeldnere enn ukentlig" = 3
))

ssb$Typ1a_uk <- labelled(ssb$Typ1a_uk, c(
  "4-5 dager i uken" = 1,
  "2-3 dager i uken" = 2,
  "Omtrent 1 dag i uken" = 3
))

ssb$Typ1a_mn <- labelled(ssb$Typ1a_mn, c(
  "Flere enn 3 dager" = 1,
  "2-3 dager" = 2,
  "Omtrent 1 dag" = 3
))

ssb$Type1b_a <- labelled(ssb$Type1b_a, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Type1b_b <- labelled(ssb$Type1b_b, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Type1c_a <- labelled(ssb$Type1c_a, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Type1c_b <- labelled(ssb$Type1c_b, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Type2a <- labelled(ssb$Type2a, c(
  "Daglig" = 1,
  "Ukentlig" = 2,
  "Sjeldnere enn ukentlig" = 3
))

ssb$Typ2a_uk <- labelled(ssb$Typ2a_uk, c(
  "4-5 dager i uken" = 1,
  "2-3 dager i uken" = 2,
  "Omtrent 1 dag i uken" = 3
))

ssb$Typ2a_mn <- labelled(ssb$Typ2a_mn, c(
  "Flere enn 3 dager" = 1,
  "2-3 dager" = 2,
  "Omtrent 1 dag" = 3
))

ssb$Type2b_a <- labelled(ssb$Type2b_a, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Type2b_b <- labelled(ssb$Type2b_b, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Type2c_a <- labelled(ssb$Type2c_a, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Type2c_b <- labelled(ssb$Type2c_b, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Type3a <- labelled(ssb$Type3a, c(
  "Daglig" = 1,
  "Ukentlig" = 2,
  "Sjeldnere enn ukentlig" = 3
))

ssb$Typ3a_uk <- labelled(ssb$Typ3a_uk, c(
  "4-5 dager i uken" = 1,
  "2-3 dager i uken" = 2,
  "Omtrent 1 dag i uken" = 3
))

ssb$Typ3a_mn <- labelled(ssb$Typ3a_mn, c(
  "Flere enn 3 dager" = 1,
  "2-3 dager" = 2,
  "Omtrent 1 dag" = 3
))

ssb$Type3b_a <- labelled(ssb$Type3b_a, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Type3b_b <- labelled(ssb$Type3b_b, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Type3c_a <- labelled(ssb$Type3c_a, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Type3c_b <- labelled(ssb$Type3c_b, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Type4a <- labelled(ssb$Type4a, c(
  "Daglig" = 1,
  "Ukentlig" = 2,
  "Sjeldnere enn ukentlig" = 3
))

ssb$Typ4a_uk <- labelled(ssb$Typ4a_uk, c(
  "4-5 dager i uken" = 1,
  "2-3 dager i uken" = 2,
  "Omtrent 1 dag i uken" = 3
))

ssb$Typ4a_mn <- labelled(ssb$Typ4a_mn, c(
  "Flere enn 3 dager" = 1,
  "2-3 dager" = 2,
  "Omtrent 1 dag" = 3
))

ssb$Type4b_a <- labelled(ssb$Type4b_a, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Type4b_b <- labelled(ssb$Type4b_b, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Type4c_a <- labelled(ssb$Type4c_a, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Type4c_b <- labelled(ssb$Type4c_b, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$AL2 <- labelled(ssb$AL2, c(
  "Alle 4 ukedagene" = 1,
  "3 av 4 dager" = 2,
  "2 av 4 dager" = 3,
  "1 av 4 dager" = 4,
  "Ingen av dagene" = 5
))

ssb$AL3 <- labelled(ssb$AL3, c(
  "16 eller flere enheter per dag" = 1,
  "10-15 enheter per dag" = 2,
  "6-9 enheter per dag" = 3,
  "4-5 enheter per dag" = 4,
  "3 enheter per dag" = 5,
  "2 enheter per dag" = 6,
  "1 enhet per dag" = 7
))

ssb$AL4 <- labelled(ssb$AL4, c(
  "Alle 3 dagene" = 1,
  "2 av 3 dager" = 2,
  "1 av 3 dager" = 3,
  "Ingen av dagene" = 4
))

ssb$AL5 <- labelled(ssb$AL5, c(
  "16 eller flere enheter per dag" = 1,
  "10-15 enheter per dag" = 2,
  "6-9 enheter per dag" = 3,
  "4-5 enheter per dag" = 4,
  "3 enheter per dag" = 5,
  "2 enheter per dag" = 6,
  "1 enhet per dag" = 7
))

ssb$Audit2 <- labelled(ssb$Audit2, c(
  "1-2" = 1,
  "3-4" = 2,
  "5-6" = 3,
  "7-9" = 4,
  "10 eller flere" = 5
))

ssb$Audit3 <- labelled(ssb$Audit3, c(
  "Daglig" = 1,
  "Ukentlig" = 2,
  "Månedlig" = 3,
  "Sjeldnere enn månedlig" = 4,
  "Aldri" = 5
))

ssb$Audit3_1 <- labelled(ssb$Audit3_1, c(
  "4-5 dager i uken" = 1,
  "2-3 dager i uken" = 2,
  "Omtrent 1 dag i uken" = 3
))

ssb$Audit3_2 <- labelled(ssb$Audit3_2, c(
  "Flere enn 3 dager i måneden" = 1,
  "2-3 dager i måneden" = 2,
  "Omtrent 1 dag i måneden" = 3
))

ssb$Audit3_3 <- labelled(ssb$Audit3_3, c(
  "Flere enn 3 dager" = 1,
  "2-3 dager" = 2,
  "Omtrent 1 dag" = 3
))

ssb$Audit4 <- labelled(ssb$Audit4, c(
  "... aldri" = 1,
  "... sjeldnere enn månedlig" = 2,
  "... månedlig" = 3,
  "... ukentlig" = 4,
  "... daglig eller nesten daglig" = 5
))

ssb$Audit5 <- labelled(ssb$Audit5, c(
  "... aldri" = 1,
  "... sjeldnere enn månedlig" = 2,
  "... månedlig" = 3,
  "... ukentlig" = 4,
  "... daglig eller nesten daglig" = 5
))

ssb$Audit6 <- labelled(ssb$Audit6, c(
  "... aldri" = 1,
  "... sjeldnere enn månedlig" = 2,
  "... månedlig" = 3,
  "... ukentlig" = 4,
  "... daglig eller nesten daglig" = 5
))

ssb$Audit7 <- labelled(ssb$Audit7, c(
  "... aldri" = 1,
  "... sjeldnere enn månedlig" = 2,
  "... månedlig" = 3,
  "... ukentlig" = 4,
  "... daglig eller nesten daglig" = 5
))

ssb$Audit8 <- labelled(ssb$Audit8, c(
  "... aldri" = 1,
  "... sjeldnere enn månedlig" = 2,
  "... månedlig" = 3,
  "... ukentlig" = 4,
  "... daglig eller nesten daglig" = 5
))

ssb$Audit9_a <- labelled(ssb$Audit9_a, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Audit9_b <- labelled(ssb$Audit9_b, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Audit9_c <- labelled(ssb$Audit9_c, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Audit9a <- labelled(ssb$Audit9a, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Audit9b <- labelled(ssb$Audit9b, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Audit10 <- labelled(ssb$Audit10, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Audit10a <- labelled(ssb$Audit10a, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Arb_alk1 <- labelled(ssb$Arb_alk1, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Leg1 <- labelled(ssb$Leg1, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Leg2 <- labelled(ssb$Leg2, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Leg3 <- labelled(ssb$Leg3, c(
  "1 til 2 uker" = 1,
  "3 til 4 uker" = 2,
  "1 til 3 måneder" = 3,
  "Mer enn tre måneder" = 4
))

ssb$Leg5 <- labelled(ssb$Leg5, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Leg6 <- labelled(ssb$Leg6, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Leg7 <- labelled(ssb$Leg7, c(
  "1 til 2 uker" = 1,
  "3 til 4 uker" = 2,
  "1 til 3 måneder" = 3,
  "Mer enn tre måneder" = 4
))

ssb$Leg9 <- labelled(ssb$Leg9, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Leg10 <- labelled(ssb$Leg10, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Leg11 <- labelled(ssb$Leg11, c(
  "1 til 2 uker" = 1,
  "3 til 4 uker" = 2,
  "1 til 3 måneder" = 3,
  "Mer enn tre måneder" = 4
))

ssb$Leg12 <- labelled(ssb$Leg12, c(
  "Aldri" = 1,
  "1 gang i mnd. eller sjeldnere" = 2,
  "2-3 ganger i måneden" = 3,
  "2-3 ganger i uken" = 4,
  "4 ganger i uken eller mer" = 5
))

ssb$Can1 <- labelled(ssb$Can1, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Can2 <- labelled(ssb$Can2, c(
  "En gang" = 1,
  "2-5 ganger" = 2,
  "6-10 ganger" = 3,
  "11-50 ganger" = 4,
  "Mer enn 50 ganger" = 5
))

ssb$Can4 <- labelled(ssb$Can4, c(
  "Ja" = 1,
  "Nei" = 2,
  "Husker ikke/vet ikke" = 3
))

ssb$Can5 <- labelled(ssb$Can5, c(
  "Ja" = 1,
  "Nei" = 2,
  "Vet ikke" = 3
))

ssb$Can6 <- labelled(ssb$Can6, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Can6b <- labelled(ssb$Can6b, c(
  "Nei" = 1,
  "Ja, en gang" = 2,
  "Ja, 2-5 ganger" = 3,
  "Ja, 6-9 ganger" = 4,
  "Ja, 10 ganger eller mer" = 5,
  "Husker ikke/vet ikke" = 6
))

ssb$Can7_a <- labelled(ssb$Can7_a, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Can7_b <- labelled(ssb$Can7_b, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Can7_c <- labelled(ssb$Can7_c, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Can7_d <- labelled(ssb$Can7_d, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Can7_e <- labelled(ssb$Can7_e, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Can8 <- labelled(ssb$Can8, c(
  "Fikk av kjente" = 1,
  "Kjøpte av kjente" = 2,
  "Kjøpte via sosiale medier" = 3,
  "Kjøpte via Internett" = 4,
  "Kjøpte av ukjente på annen måte" = 5,
  "Dyrket selv" = 6,
  "Annet, spesifiser" = 7
))

ssb$Can9 <- labelled(ssb$Can9, c(
  "1-5 ganger" = 1,
  "6-10 ganger" = 2,
  "11-50 ganger" = 3,
  "Mer enn 50 ganger" = 4
))

ssb$Can10 <- labelled(ssb$Can10, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Can11 <- labelled(ssb$Can11, c(
  "20 dager eller mer" = 1,
  "10-19 dager" = 2,
  "4-9 dager" = 3,
  "1-3 dager" = 4
))

ssb$Can14 <- labelled(ssb$Can14, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Ans1 <- labelled(ssb$Ans1, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Ans2_a <- labelled(ssb$Ans2_a, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Ans2_b <- labelled(ssb$Ans2_b, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Ans2_c <- labelled(ssb$Ans2_c, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Ans2_d <- labelled(ssb$Ans2_d, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Ans2_e <- labelled(ssb$Ans2_e, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Ans2_f <- labelled(ssb$Ans2_f, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Ans2_g <- labelled(ssb$Ans2_g, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Ans2_x <- labelled(ssb$Ans2_x, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Ans2_y <- labelled(ssb$Ans2_y, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Ans2_h <- labelled(ssb$Ans2_h, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Ans3_1 <- labelled(ssb$Ans3_1, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Ans3_2 <- labelled(ssb$Ans3_2, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Ans3_3 <- labelled(ssb$Ans3_3, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Ans3_4 <- labelled(ssb$Ans3_4, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Ans3_5 <- labelled(ssb$Ans3_5, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Ans3_6 <- labelled(ssb$Ans3_6, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Ans3_7 <- labelled(ssb$Ans3_7, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Ans3_x <- labelled(ssb$Ans3_x, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Ans3_y <- labelled(ssb$Ans3_y, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Ans3_8 <- labelled(ssb$Ans3_8, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Ans_5 <- labelled(ssb$Ans_5, c(
  "1-5 dager" = 1,
  "6-10 dager" = 2,
  "11-50 dager" = 3,
  "50 dager eller mer" = 4
))

ssb$Ans9 <- labelled(ssb$Ans9, c(
  "1-5 dager" = 1,
  "6-10 dager" = 2,
  "11-50 dager" = 3,
  "50 dager eller mer" = 4
))

ssb$Dop1 <- labelled(ssb$Dop1, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$Dop3_1 <- labelled(ssb$Dop3_1, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$NegKons1 <- labelled(ssb$NegKons1, c(
  "Ingen" = 1,
  "En gang" = 2,
  "Mer enn en gang" = 3
))

ssb$NegKons2 <- labelled(ssb$NegKons2, c(
  "Ingen" = 1,
  "En gang" = 2,
  "Mer enn en gang" = 3
))

ssb$NegKons3 <- labelled(ssb$NegKons3, c(
  "Ingen" = 1,
  "En gang" = 2,
  "Mer enn en gang" = 3
))

ssb$NegKons4 <- labelled(ssb$NegKons4, c(
  "Ingen" = 1,
  "En gang" = 2,
  "Mer enn en gang" = 3
))

ssb$NegKons4_1 <- labelled(ssb$NegKons4_1, c(
  "Helt uproblematisk" = 1,
  "Nokså uproblematisk" = 2,
  "Nokså problematisk" = 3,
  "Svært problematisk" = 4
))

ssb$NegKons5 <- labelled(ssb$NegKons5, c(
  "Ingen" = 1,
  "En gang" = 2,
  "Mer enn en gang" = 3
))

ssb$NegKons6 <- labelled(ssb$NegKons6, c(
  "Ingen" = 1,
  "En gang" = 2,
  "Mer enn en gang" = 3
))

ssb$paaror1a <- labelled(ssb$paaror1a, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$paaror3 <- labelled(ssb$paaror3, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$paaror4 <- labelled(ssb$paaror4, c(
  "Daglig" = 1,
  "Ukentlig" = 2,
  "Månedlig" = 3,
  "Sjeldnere enn månedlig" = 4,
  "Aldri" = 5
))

ssb$paaror5 <- labelled(ssb$paaror5, c(
  "Ja" = 1,
  "Nei" = 2,
  "Vet ikke" = 3
))

ssb$Avslutt <- labelled(ssb$Avslutt, c(
  "Svært interessante" = 1,
  "Ganske interessante" = 2,
  "Ganske uinteressante" = 3,
  "Svært uinteressante" = 4,
  "Jeg har ingen mening om det" = 5
))

ssb$intslutt <- labelled(ssb$intslutt, c(
  "Telefon" = 1,
  "besok" = 2,
  "www" = 3,
  "Ingen" = 4
))

ssb$yrke <- labelled(ssb$yrke, c(
  "Militære yrker (ikke sivile stillinger i forsvaret)" = 0,
  "Administrative ledere og politikere" = 1,
  "Akademiske yrker" = 2,
  "Høyskoleyrker" = 3,
  "Kontor- og kundeserviceyrker" = 4,
  "Salgs-, service- og omsorgsyrker" = 5,
  "Yrker innen jordbruk, skogbruk og fiske" = 6,
  "Håndverkere og lignende" = 7,
  "Prosess- og maskinoperatører, transportarbeidere mv." = 8,
  "Yrker uten krav til utdanning" = 9
))

ssb$paaror1b_a <- labelled(ssb$paaror1b_a, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$paaror1b_b <- labelled(ssb$paaror1b_b, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$paaror1b_c <- labelled(ssb$paaror1b_c, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$paaror2_a <- labelled(ssb$paaror2_a, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$paaror2_b <- labelled(ssb$paaror2_b, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$paaror2_c <- labelled(ssb$paaror2_c, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$paaror2_d <- labelled(ssb$paaror2_d, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$paaror2_e <- labelled(ssb$paaror2_e, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$tobsit_a <- labelled(ssb$tobsit_a, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$tobsit_b <- labelled(ssb$tobsit_b, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$tobsit_c <- labelled(ssb$tobsit_c, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$tobsit_d <- labelled(ssb$tobsit_d, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$tobsit_e <- labelled(ssb$tobsit_e, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$alkansk_a <- labelled(ssb$alkansk_a, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$alkansk_b <- labelled(ssb$alkansk_b, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$alkansk_c <- labelled(ssb$alkansk_c, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$alkansk_d <- labelled(ssb$alkansk_d, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$alkansk_e <- labelled(ssb$alkansk_e, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$alkansk_f <- labelled(ssb$alkansk_f, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$alkansk_g <- labelled(ssb$alkansk_g, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$alkansk_h <- labelled(ssb$alkansk_h, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$alkansk_i <- labelled(ssb$alkansk_i, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$alkansk_j <- labelled(ssb$alkansk_j, c(
  "Ja" = 1,
  "Nei" = 2
))

ssb$fylke_2025 <- labelled(ssb$fylke_2025, c(
  "Oslo" = 3,
  "Rogaland" = 11,
  "Møre og Romsdal" = 15,
  "Nordland" = 18,
  "Svalbard" = 21,
  "Jan Mayen" = 22,
  "Østfold" = 31,
  "Akershus" = 32,
  "Buskerud" = 33,
  "Innlandet" = 34,
  "Vestfold" = 39,
  "Telemark" = 40,
  "Agder" = 42,
  "Vestland" = 46,
  "Trøndelag" = 50,
  "Troms" = 55,
  "Finnmark" = 56
))

ssb$landsdel_2025 <- labelled(ssb$landsdel_2025, c(
  "Oslo og Viken" = 1,
  "Innlandet" = 2,
  "Agder og Sør-Østlandet" = 3,
  "Vestlandet" = 4,
  "Trøndelag" = 5,
  "Nord-Norge" = 6,
  "Uoppgitt" = 9
))

ssb$alder1 <- labelled(ssb$alder1, c(
  "16-24 år" = 1,
  "25-44 år" = 2,
  "45-66 år" = 3,
  "67-79 år" = 4,
  "80- år" = 5,
  "Vil ikke svare" = 8,
  "Vet ikke" = 9
))

ssb$alder2 <- labelled(ssb$alder2, c(
  "16-20 år" = 1,
  "21-30 år" = 2,
  "31-40 år" = 3,
  "41-50 år" = 4,
  "51-60 år" = 5,
  "61-79 år" = 6,
  "80- år" = 7
))

ssb$Tett_spredt <- labelled(ssb$Tett_spredt, c(
  "Spredtbygd" = "s",
  "Tettbygd" = "t"
))

ssb$fodeland_IO <- labelled(ssb$fodeland_IO, c(
  "Norge" = 1,
  "Europa" = 2,
  "Asia" = 3,
  "Afrika" = 4,
  "Sør- og Mellom-Amerika" = 5,
  "Nord-Amerika" = 6,
  "Australia/New Zeland/Osceania" = 7,
  "Uoppgitt/mangler" = 9
))

ssb$fodeland_far <- labelled(ssb$fodeland_far, c(
  "Norge" = 1,
  "Europa" = 2,
  "Asia" = 3,
  "Afrika" = 4,
  "Sør- og Mellom-Amerika" = 5,
  "Nord-Amerika" = 6,
  "Australia/New Zeland/Osceania" = 7,
  "Uoppgitt/mangler" = 9
))

ssb$fodeland_mor <- labelled(ssb$fodeland_mor, c(
  "Norge" = 1,
  "Europa" = 2,
  "Asia" = 3,
  "Afrika" = 4,
  "Sør- og Mellom-Amerika" = 5,
  "Nord-Amerika" = 6,
  "Australia/New Zeland/Osceania" = 7,
  "Uoppgitt/mangler" = 9
))

ssb$innt_hush <- labelled(ssb$innt_hush, c(
  "0 - 99" = 1,
  "100 - 149" = 2,
  "150 - 199" = 3,
  "200 - 249" = 4,
  "250 - 299" = 5,
  "300 - 399" = 6,
  "400 - 499" = 7,
  "500 - 599" = 8,
  "600 - 699" = 9,
  "700 - 799" = 10,
  "800 - 899" = 11,
  "900 - 999" = 12,
  "1000 og mer" = 13
))

ssb$innt_person <- labelled(ssb$innt_person, c(
  "0 - 99" = 1,
  "100 - 149" = 2,
  "150 - 199" = 3,
  "200 - 249" = 4,
  "250 - 299" = 5,
  "300 - 399" = 6,
  "400 - 499" = 7,
  "500 - 599" = 8,
  "600 - 699" = 9,
  "700 og mer" = 10
))

ssb$Utdann_4gr <- labelled(ssb$Utdann_4gr, c(
  "Grunnskole (inklusive uoppgitt og ingen utdanning)" = 1,
  "Videregående skole" = 2,
  "Universitet-og høyskole" = 3,
  "Universitet-og høyskole, høyere nivå" = 4
))

ssb$Sentralitet <- labelled(ssb$Sentralitet, c(
  "Sentralitet: 1 (925-1000) - høy" = 1,
  "Sentralitet: 2 (870-924)" = 2,
  "Sentralitet: 3 (775-869)" = 3,
  "Sentralitet: 4 (670-774)" = 4,
  "Sentralitet: 5 (565-669)" = 5,
  "Sentralitet: 6 (0-564) - lav" = 6
))
