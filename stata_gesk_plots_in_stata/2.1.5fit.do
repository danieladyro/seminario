*Install
ssc install combomarginsplot
ssc install supsmooth
net install https://www.stata-journal.com/software/sj15-4/gr0021_2
ssc install ellip

clear all
*Load data
sysuse auto
summarize

*Fig 16.1 - The relationship between car price and miles per gallon
scatter price mpg

*Fig 16.2 - A basic linear fit
twoway (lfit price mpg)

*Fig 16.3 - Scatterplot with linear fit
twoway (scatter price mpg) (lfit price mpg)

*Fig 16.4 - Linear fit extrapolation
twoway (scatter price mpg) (lfit price mpg, range (0 50))

*Fig 16.5 - Quadratic fit
twoway (scatter price mpg) (qfit price mpg) 

*Fig 16.6 - Fractional polynomial fit
twoway (scatter price mpg) (fpfit price mpg) 

*Fig 16.7 - Multiple lines of best fit
twoway (scatter price mpg) (lfit price mpg) ///
(qfit price mpg) (fpfit price mpg, legend(off)) 

*Fig 16.8 - Lines of best fit with the by() option
twoway (scatter price mpg) ///
(lfit price mpg, by(rep78, compact) range(12 41)) 

*Regression with interaction terms
regress price c.mpg##c.mpg##c.mpg
margins, at(mpg = (0(2)50))

*Fig 16.9 - Cubic polynomial
marginsplot, noci addplot(scatter price mpg, mcolor(%50) legend(off))

*Regressions with interaction terms
regress price c.mpg##c.mpg##c.mpg
quietly margins, at(mpg = (12(1)41)) saving(file1, replace)
regress price c.mpg##c.mpg##c.mpg##c.mpg
quietly margins, at(mpg = (12(1)41)) saving(file2, replace)

*Fig 16.10 - Multiple polynomials with combomarginsplot
combomarginsplot file1 file2, noci addplot(scatter price mpg, mcolor(%50) ///
 legend(off)) title(Adjusted predictions)

*Regression with interaction terms
regress price c.mpg##c.mpg##c.mpg

*Fig 16.11 - Drawing a custom function
twoway (scatter price mpg) (function y = _b[_cons] + _b[mpg]*x + ///
 _b[c.mpg#c.mpg]*x^2 + _b[c.mpg#c.mpg#c.mpg]*x^3, range(12 41))

constraint 1 _cons = 10000
cnsreg price mpg, constraints(1)
quietly margins, at(mpg = (0(2)50))

*Fig 16.12 - Constrained line of best fit
marginsplot, noci addplot(scatter price mpg, mcolor(%50))

*Fig 16.13 - Local polynomial lines of best fit
twoway (scatter price mpg) (lpoly price mpg)

*Fig 16.14 - Local polynomial fits with various kernel and bandwidth choices
twoway (scatter price mpg) ///
(lpoly price mpg, kernel(rectangle) bwidth(1)) ///
(lpoly price mpg, kernel(gaussian) bwidth(3)) ///
(lpoly price mpg, degree(2) legend(label(2 "Rectangular kernel, bw1") ///
 label(3 "Gaussian kernel, bw3") label(4 "Default kernel, degree2")))

*Fig 16.15 -Other nonparametric fits
twoway (scatter price mpg) (mband price mpg) ///
 (mspline price mpg) (lowess price mpg) 

*Fig 16.16 
* Super smoother
supsmooth price mpg, alpha(1) title(Super smoother) name(g1, replace)
* Double smoother
doublesm price mpg, title(Double smoother) name(g2, replace) ///
 legend(position(6))
* Polar smoother
polarsm price mpg, title(Polar smoother) smooth(lcolor(black)) ///
 name(g3, replace)
* Confidence ellipse
ellip price mpg, title(Confidence ellipse) plot(scatter price mpg) ///
 name(g4, replace) legend(position(6))
* Combine graphs
graph combine g1 g3 g2 g4, ycommon xcommon iscale(0.5)

*Fig 16.17 - Linear fit with 90% confidence intervals
twoway (scatter price mpg) (lfitci price mpg, level(90)) 

*Fig 16.18 - Multiple fits with confidence intervals
twoway (scatter price mpg) (lfitci price mpg, acolor(eltgreen%30)) ///
(qfitci price mpg, acolor(erose%30) legend(off)) 

*Fig 16.19 - Local polynomial fit with confidence intervals as spikes 
twoway (scatter price mpg) (lpolyci price mpg, ciplot(rcap) acolor(black))




