*Install
ssc install hangroot

clear all
*Load data
sysuse citytemp
summarize

*Fig 8.1 - Rootogram
spikeplot tempjan, root

*Fig 8.2 - Hanging rootogram
hangroot tempjan

*Fig 8.3 - Hanging rootogram with more detail
hangroot tempjan, width(1)

*Fig 8.4 - Hanging rootogram testing different distributions
hangroot tempjan, width(0.2) dist(lognormal) ///
 title(Lognormal) name(g1, replace)
hangroot tempjan, width(0.2) dist(logistic) ///
 title(Logistic) name(g2, replace)
hangroot tempjan, width(0.2) dist(uniform) ///
 title(Uniform) name(g3, replace)
hangroot tempjan, width(0.2) dist(exponential) ///
 title(Exponential) name(g4, replace)
graph combine g1 g2 g3 g4

*Fig 8.5 - Hanging rootogram testing different chi-squared distributions
hangroot tempjan, width(0.2) dist(chi2) par(1) ///
 title({&chi}{sup:2} d.f. = 1) name(g1, replace)
hangroot tempjan, width(0.2) dist(chi2) par(5) ///
 title({&chi}{sup:2} d.f. = 5) name(g2, replace)
hangroot tempjan, width(0.2) dist(chi2) par(10) ///
 title({&chi}{sup:2} d.f. = 10) name(g3, replace)
hangroot tempjan, width(0.2) dist(chi2) par(50) ///
 title({&chi}{sup:2} d.f. = 50) name(g4, replace)
graph combine g1 g2 g3 g4

*Fig 8.6 - Hanging rootogram with confidence intervals
hangroot tempjan, ci


