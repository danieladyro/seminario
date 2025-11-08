*Install
ssc install radar

clear all
*Load data
sysuse auto
summarize

*Fig 11.1 - Radar chart
radar make weight in 1/12

*Fig 11.2 - Radar chart with aspect ratio
radar make weight in 1/12, aspect(1) graphregion(color(white)) ///
 xlabel(, nogrid)

*Fig 11.3 - Radar chart with custom spoke lengths
radar make weight if foreign ==1, aspect(1) ///
 rlabel(0 500 1000 1500 2000 2500 3000 3500) xlabel(, nogrid)

*Fig 11.4 - Radar charts with multiple variables
radar make turn mpg trunk if foreign == 1, rlabel(0 10 20 30 40 50) ///
 aspect(1) legend(position(6) row(1)) xlabel(, nogrid)

*Fig 11.5 - Radar charts with multiple variables and radial representation
radar make turn mpg if foreign == 1, rlabel(0 10 20 30 40 50) aspect(1) ///
 connected radial(trunk) legend(position(6) row(1)) xlabel(, nogrid)

*Fig 11.6 - Radar chart with too few categories
radar make weight in 1/3, aspect(1) rlabel(0 1000 2000 3000 4000 5000) ///
 labsize(*0.5) xlabel(, nogrid) 

*Fig 11.7 - Radar chart with too many categories
radar make weight, aspect(1) rlabel(0 1000 2000 3000 4000 5000) ///
 labsize(*0.5) legend(position(6) row(1)) xlabel(, nogrid)

*Tabulate rep78
tabulate rep78

*Collapse data
generate obs = 1
collapse (sum) obs, by(rep78)

*Fig 11.8 - Radar chart of collapsed data
radar rep78 obs, rlabel(0 10 20 30 40) aspect(1) xlabel(, nogrid)

