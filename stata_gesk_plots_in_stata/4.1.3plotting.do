*Install  
ssc install coefplot

clear all
*Load data
sysuse auto
*A normal regression
regress price mpg headroom trunk weight length i.rep78

*Predict marginal values
margins, dydx(*)

*Fig 30.1 - Plot predicted values
marginsplot, recast(scatter) yline(0)

*Fig 30.2 - Plot all coefficients
coefplot, xline(0)

*Fig 30.3 - Plot coefficients vertically without constant
coefplot, vertical drop(_cons *rep*) yline(0) xlabel(, angle(45))

*Two regressions with same dependent variable
quietly regress price mpg headroom trunk weight length i.rep78 if foreign == 0
estimates store foreign
quietly regress price mpg headroom trunk weight length i.rep78 if foreign == 1
estimates store domestic

*Fig 30.4 - Plot coefficients of two saved regressions
coefplot foreign domestic, drop(_cons) xline(0)

*Four regressions with two dependent variables
quietly regress price mpg headroom trunk weight length i.rep78 if foreign == 0
estimates store foreign
quietly regress price mpg headroom trunk weight length i.rep78 if foreign == 1
estimates store domestic
quietly regress turn mpg headroom trunk weight length i.rep78 if foreign == 0
estimates store foreign_t
quietly regress turn mpg headroom trunk weight length i.rep78 if foreign == 1
estimates store domestic_t

*Fig 30.5 - Plot coefficients of four saved regressions
coefplot foreign domestic, bylabel(Price) || foreign_t domestic_t, ///
bylabel(Turn) ||, drop(_cons) xline(0) byopts(xrescale)

*A regression with an interaction term
regress price c.mpg##c.headroom trunk weight length i.rep78

*Fig 30.6 - Plot coefficients vertically without constant
coefplot, drop(_cons) yline(0) cismooth
