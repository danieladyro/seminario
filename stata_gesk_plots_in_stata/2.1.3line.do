*Install sparkline command
ssc install sparkline

clear all
*Load data
sysuse uslifeexp
summarize

*Fig 14.1 - A basic line plot
line le year

*Fig 14.2 - Line plot with markers and options
line le year, lpattern(dash) lwidth(*2) lcolor(forest_green)

*Fig 14.3 - Line plot with custom pattern
line le year, lpattern("...---...#") 

*Fig 14.4 - Multiple line plots via line
line le_male le_female year, lcolor(gs12 gs4)

*Fig 14.5 - Multiple line plots via twoway
twoway (line le_male year, lcolor(gs12)) ///
(line le_female year, lcolor(gs4))

*Fig 14.6 - Line plots with markers
twoway (line le year) (scatter le year, msymbol(D) msize(*0.5) mcolor(%50)) 

*Fig 14.7 - Different connection styles
twoway (line le year, connect(stairstep)) ///
 (line le year, connect(stepstair)) ///
 (line le year, connect(direct))

*Demonstrating axis options
generate diff = le_female-le_male 
label variable diff "Difference"
summarize diff le_female le_male 

*Fig 14.8 - Without axis options
twoway (line le_female le_male year) (line diff year)

*Fig 14.9 - With axis options
twoway (line le_female le_male  year, yaxis(1)) ///
(line diff year, yaxis(2) lwidth(*2) lcolor(%40))

*Unsorted and missing data
*Shuffling data
set seed 1234
gen random = runiform()
sort random
replace le = . if random < 0.10

* Fig 14.10 - Sorting in plots
*Messy plot
line le year, title(Unsorted) name(g1, replace)
*Sort on le
line le year, sort(le) title(Sorted on life expectancy) name(g2, replace)
*Sort on year
line le year, sort(year) title(Sorted on year) name(g3, replace)
*Sort on year with missing values identified
line le year, sort(year) cmissing(n) ///
 title(Sorted on year not ignoring missing)  name(g4, replace)
*Combine graphs
graph combine g1 g2 g3 g4

*Set time-series data
sysuse uslifeexp, clear
tsset year 

*Fig 14.11 - Arrow line plots
twoway (pcarrow l1.le l.year le year)

*Fig 14.12 - Multiple arrow line plots
twoway (pcarrow l1.le_male l.year le_male year, msize(*0.5)) ///
 (pcarrow l1.le_female l.year le_female year, msize(*0.5) ///
 legend(position(6) row(2)))

*Load data
webuse grunfeld, clear
summarize

*Fig 14.13 - Many line plots
twoway (line invest year if company == 1) ///
(line invest year if company == 2) ///
(line invest year if company == 3) ///
(line invest year if company == 4) ///
(line invest year if company == 5) ///
(line invest year if company == 6) ///
(line invest year if company == 7) ///
(line invest year if company == 8) ///
(line invest year if company == 9) ///
(line invest year if company == 10, legend(off))

*Fig 14.14 - Sparkline plot
sparkline invest year, over(company)

*Fig 14.15 - Sparkline plot with y-axis labels suppressed and minimum and maximum values
sparkline invest year, over(company) extremes ylabel(none, axis(2)) ///
 extremeslabel 

*Fig 14.16 - Sparkline plot with multiple y variables
sparkline invest mvalue kstock year, by(company, cols(2)) extremes ///
 ylabel(none, axis(2))


