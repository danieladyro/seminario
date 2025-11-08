*Install  
ssc install corrtable
ssc install crossplot
ssc install trellis

clear all
*Load data
sysuse auto
summarize

*Correlation matrix
correlate price mpg weight length displacement

*Fig 21.1 - Correlation matrix plot
corrtable price mpg weight length displacement

*Fig 21.2 - Half-correlation matrix with options
corrtable price mpg weight length displacement, half n pval

*Fig 21.3 - Matrix scatterplot
graph matrix price mpg weight length displacement

*Fig 21.4 - Half-scatter matrix plot with options
graph matrix price mpg weight length displacement, mlwidth(vvthin) ///
 mfcolor(ltblue%80) msize(medsmall) half scale(0.7)
 
*Fig 21.5 - Multiple default matrix plots
graph matrix price mpg weight length displacement, mlwidth(vvthin) ///
mfcolor(ltblue%40) msize(medsmall) half iscale(0.6) by(foreign)

*Fig 21.6 - Cross plots
crossplot (price mpg weight length) (displacement)

*Fig 21.7 - Cross plots that resemble matrix plots
crossplot (price mpg weight length displacement) ///
 (price mpg weight length displacement)

*Load data
webuse nhanes2, clear
recode hlthstat 8 = .
summarize hlthstat agegrp weight bpsystol

*Fig 21.8 - Trellis plot
trellis, by(hlthstat agegrp) ///
function(twoway (scatter weight bpsystol, msymbol(p))) ///
fopt(xtitle("") ytitle("")) ///
t1title("Systolic blood pressure") l1title("Weight (kg)")

*Fig 21.9 - Trellis plot with multiple two-way plots 
trellis, by(hlthstat agegrp) ///
function(twoway (scatter weight bpsystol, msymbol(p)) ///
(qfitci weight bpsystol, lcolor(black) legend(off))) ///
fopt(xtitle("") ytitle("")) ///
t1title("Systolic blood pressure") l1title("Weight (kg)")

*Fig 21.10 - Trellis plot with box plots
trellis, by(hlthstat agegrp) function(graph box weight) ///
fopt(over(race) ytitle("")) ///
t1title("Systolic blood pressure") l1title("Weight (kg)")

*Fig 21.11 - Trellis plot with heat plots
trellis, by(hlthstat agegrp) function(heatplot height weight) ///
fopt(legend(off) xtitle("") ytitle("")) ///
t1title("Systolic blood pressure") l1title("Weight (kg)")
 
