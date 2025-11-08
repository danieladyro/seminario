*Install 
ssc install pairplot

clear all
*Load data
sysuse uslifeexp
summarize

*Fig 15.1 - A basic area plot
twoway (area le year)

*Fig 15.2 - Four basic area-type plots
*Basic area plot
twoway (area le year, title(Area) name(g1, replace))
*Basic bar plot
twoway (bar le year, title(Bar) name(g2, replace))
*Basic spike plot
twoway (spike le year, title(Spike) name(g3, replace))
*Basic dropline plot
twoway (dropline le year, title(Dropline) name(g4, replace))
*Combine graphs
graph combine g1 g2 g3 g4

*Fig 15.3 - Important options
*Area plot with options
twoway (area le year, title(1) horizontal aspectratio(2) yscale(reverse) ///
 name(g1, replace))
twoway (area le year, title(2) base(0) ylabel(0(20)100) ///
 name(g2, replace))
twoway (area le year, title(3) fcolor(forest_green%40) lcolor(black) ///
 name(g3, replace))
*Bar plot with options
twoway (bar le year, title(4) horizontal barwidth(1.5) lcolor(black) ///
 fcolor(%30) name(g4, replace))
*Spike plot with options
twoway (spike le year, title(5) lpattern(longdash) name(g5, replace))
*Dropline plot with options
twoway (dropline le year, title(6) base(65) yline(65) mfcolor(ltblue%80) ///
 mlcolor(black%80) name(g6, replace))
*Combine graphs
graph combine g1 g2 g3 g4 g5 g6, row(2)

*Load data
sysuse sp500, clear
summarize

*Fig 15.4 - Data with variation around an important value
*Basic line plot
twoway (line change date in 1/60, title(Line) yline(0) name(g1, replace))
*Area plot
twoway (area change date in 1/60, title(Area) yline(0) name(g2, replace))
*Bar plot
twoway (bar change date in 1/60, title(Bar) yline(0) name(g3, replace))
*Spike plot
twoway (spike change date in 1/60, title(Spike) yline(0) name(g4, replace))
*Combine graphs
graph combine g1 g2 g3 g4, row(2) 

*Load data
sysuse uslifeexp, clear
summarize

*Fig 15.5 - A basic shaded range plot
twoway (rarea le_female le_male year)

*Fig 15.6 - Different range plots
*Basic range line plot
twoway (rline le_female le_male year, title(1) ytitle("") name(g1, replace))
*Basic shaded range plot
twoway (rarea le_female le_male year, title(2) ytitle("") name(g2, replace))
*Basic range bar plot
twoway (rbar le_female le_male year, title(3) ytitle("") name(g3, replace))
*Basic range spike plot
twoway (rspike le_female le_male year, title(4) ytitle("") name(g4, replace))
*Basic range capped spikes plot
twoway (rcap le_female le_male year, title(5) ytitle("") name(g5, replace))
*Basic capped spikes with symbols plot
twoway (rcapsym le_female le_male year, title(6) ytitle("") name(g6, replace))
*Basic range scatterplot
twoway (rscatter le_female le_male year, title(7) ytitle("") name(g7, replace))
*Basic range connected scatterplot
twoway (rconnected le_female le_male year, title(8) ytitle("") name(g8, replace))
*Combine graphs
graph combine g1 g2 g3 g4 g5 g6 g7 g8, row(3)

*Fig 15.7 - A basic pair plot
pairplot le_male le_female year

*Fig 15.8 - Pair plot ratios
pairplot le_male le_female year, ratio base(0.95)

*Fig 15.9 - Two area plots overlaid
twoway (area le_male year, color(%50)) (area le_female year, color(%50) ///
 legend(row(2)))

*Fig 15.10 - Two shaded range plots overlaid
twoway (rarea le_wmale le_wfemale year, color(%50)) ///
 (rarea le_bmale le_bfemale year, color(%50) legend(position(6) row(2)))

*Fig 15.11 - Limit reached with four shaded range plots
twoway (rarea le_male le_female  year, color(%50)) ///
 (rarea le_w le_b year, color(%50)) ///
 (rarea le_wmale le_wfemale year, color(%50)) ///
 (rarea le_bmale le_bfemale year, color(%50) legend(position(6) row(4)))




