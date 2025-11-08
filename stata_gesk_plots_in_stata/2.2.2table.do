*Install
ssc install tabplot

clear all
*Load data
sysuse nlsw88
tabulate occupation industry

*Fig 18.1 - Basic table plot
tabplot occupation industry, ylabel(, labsize(small) ///
 angle(45)) xlabel(, labsize(small) angle(45)) 

*Fig 18.2 - Horizontal table plot
tabplot occupation industry, ylabel(, labsize(small) valuelabel angle(45)) ///
 xlabel(, labsize(small) valuelabel angle(45)) percent missing horizontal

*Fig 18.3 - Table plot with values
tabplot occupation industry, ylabel(, labsize(small)  angle(45)) ///
 xlabel(, labsize(small) angle(45)) percent missing ///
 showval(offset(0.15) format(%2.1f) mlabsize(*0.5)) 

*Fig 18.4 - Table plot with frames
tabplot occupation industry, ylabel(1(1)13, labsize(small) angle(45)) ///
 xlabel(1(1)12, labsize(small) angle(45)) percent missing ///
 showval(offset(-0.5) format(%2.1f) mlabsize(*0.5)) frame(9.5) bfcolor(%30)

*Fig 18.5 - Three-way table plot 
tabplot occupation industry, by(union) ylabel(1(1)13, labsize(small) ///
 angle(45)) xlabel(1(1)12, labsize(small) valuelabel angle(45))
 
*Give all observations a weight of 1
generate weight = 1
*Collapse observations
collapse (sum) weight, by(occupation industry)

*Fig 18.6 - Scatterplot with weights
twoway (scatter occupation industry [weight=weight])

*Fig 18.7 - Scatterplot with weights, adjusted marker sizes, and cell sizes
twoway (scatter occupation industry [weight=weight], msymbol(circle) ///
 mfcolor(eltblue%50) mlcolor(black) msize(*0.4) ///
 ylabel(1(1)13, labsize(small) valuelabel angle(45)) ///
 xlabel(1(1)12, labsize(small) valuelabel angle(45))) ///
 (scatter occupation industry, msymbol(i) mlabel(weight) ///
 mlabsize(*0.7) mlabgap(2) mlabcolor(maroon) legend(off))

*Fig 18.8 - Scatterplot with weights, custom markers, and cell sizes
twoway (scatter occupation industry [w=weight], msymbol(triangle) ///
 mfcolor(erose%50) mlcolor(black) msize(*0.4) ///
 ylabel(1(1)13, labsize(small) valuelabel angle(45)) ///
 xlabel(1(1)12, labsize(small) valuelabel angle(45))) ///
 (scatter occupation industry, msymbol(i) mlabc(black) ///
 mlabel(weight) mlabsize(*0.7) mlabgap(2) mlabcolor(dknavy) legend(off))


