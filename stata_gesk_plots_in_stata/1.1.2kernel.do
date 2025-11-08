
*Install 
ssc install distplot
ssc install joyplot

clear all
*Load data
sysuse citytemp
summarize

*Fig 2.1 - A basic kernel density plot
kdensity tempjan

*Fig 2.2 - Basic visualization options
kdensity tempjan, recast(area) fcolor(eltblue) lcolor(black)

*Fig 2.3 - Density plots with different bandwidths
kdensity tempjan, bwidth(10) name(g1, replace)
kdensity tempjan, bwidth(5) name(g2, replace)
kdensity tempjan, bwidth(1) name(g3, replace)
kdensity tempjan, bwidth(0.2) name(g4, replace)
graph combine g1 g2 g3 g4


*Fig 2.4 - Density plot with different kernels
kdensity tempjan, title("") kernel(epanechnikov) name(g1, replace)
kdensity tempjan, title("") kernel(epan2) name(g2, replace)
kdensity tempjan, title("") kernel(biweight) name(g3, replace)
kdensity tempjan, title("") kernel(cosine) name(g4, replace)
kdensity tempjan, title("") kernel(gaussian) name(g5, replace)
kdensity tempjan, title("") kernel(parzen) name(g6, replace)
kdensity tempjan, title("") kernel(rectangle) name(g7, replace)
kdensity tempjan, title("") kernel(triangle) name(g8, replace)
graph combine g1 g2 g3 g4 g5 g6 g7 g8


*Fig 2.5 - Cumulative distribution plot
distplot tempjan


*Fig 2.6 - Cumulative distribution plots with options
distplot tempjan, frequency name(g1, replace)
distplot tempjan, reverse name(g2, replace)
distplot tempjan, recast(spike) name(g3, replace)
distplot tempjan, recast(area) fcolor(eltblue) lcolor(black) ///
 name(g4, replace) 
graph combine g1 g2 g3 g4


*Fig 2.7 - Multiple kernel density plots
twoway (kdensity tempjan, by(region)) 


*Fig 2.8 - Multiple kdensity plots with if qualifiers
twoway (kdensity tempjan if region == 1) ///
(kdensity tempjan if region == 2) ///
(kdensity tempjan if region == 3) ///
(kdensity tempjan if region == 4) 



*Fig 2.9 - Multiple kdensity plots with if qualifiers and color
twoway (kdensity tempjan if region == 1, lcolor(black) ///
 fcolor(ltblue%50) recast(area)) ///
(kdensity tempjan if region == 2, lcolor(black) ///
 fcolor(erose%50) recast(area)) ///
(kdensity tempjan if region == 3, lcolor(black) ///
 fcolor(emerald%50) recast(area)) ///
(kdensity tempjan if region == 4, lcolor(black) ///
 fcolor(sand%50) recast(area)) 


*Fig 2.10 - Mirrored density plot
twoway (kdensity tempjan, recast(area) fcolor(ltblue) ///
 ylabel(0(0.02)0.1) name(g1, replace) xscale(alt) xtitle("") ///
 title("") note("")) 
twoway (kdensity tempjuly, yscale(reverse) fcolor(erose) ///
 ylabel(0(0.02)0.1) recast(area) name(g2, replace) xscale(off) ///
 xtitle() title("") note(""))
graph combine g1 g2, imargin(0 0 0 0) cols(1) 


*Fig 2.11 - Ridgeline plot
joyplot tempjan, by(division)

*Fig 2.12 - Ridgeline plot options
joyplot tempjan, by(division) bwidth(1) overlap(4) normalize(global)


