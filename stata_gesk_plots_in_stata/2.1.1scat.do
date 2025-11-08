*Install
ssc install fabplot
ssc install sepscatter
net install http://digital.cgdev.org/doc/stata/MO/Misc/superscatter
ssc install binscatter

clear all
*Load data
sysuse auto
summarize 

*Fig 12.1 - Basic scatterplot
twoway (scatter price mpg)

*Fig 12.2 - Square, colored, and sized markers
twoway (scatter price mpg in 1/15, msymbol(S) mcolor(edkblue%70) ///
 msize(*3) mlabel(make))

*Fig 12.3 - Multiple y variables against one x variable
twoway (scatter trunk turn mpg price, msymbol(S T D) mcolor(gs1 gs6 gs12))

*Fig 12.4 - Beware of scales when using multiple y variables
twoway (scatter weight trunk turn mpg price)

*Fig 12.5 - Adjusting scales with multiple axes
twoway (scatter weight price, xaxis(1)) ///
 (scatter trunk price, yaxis(2) yscale(axis(2) alt)) ///
 (scatter  turn price, yaxis(3))  ///
 (scatter mpg price, yaxis(4) yscale(axis(4) alt)) 

*Fig 12.6 - Advanced syntax, two axes
twoway (scatter price mpg, xaxis(1) yaxis(1 2)) /// 
(scatter price turn, xaxis(2))

*Fig 12.7 - Using the if qualifier
twoway (scatter price mpg if rep78 == 1) ///
 (scatter price mpg if rep78 == 2) ///
 (scatter price mpg if rep78 == 3) ///
 (scatter price mpg if rep78 == 4) ///
 (scatter price mpg if rep78 == 5) 

*Fig 12.8 - Using the colorvar() option
scatter price mpg if !missing(rep78), colorvar(rep78) ///
 colordiscrete coloruseplegend

*Fig 12.9 -  Using the by() option
twoway (scatter price mpg, by(rep78, compact))

*Fig 12.10 - fabplot
fabplot scatter mpg weight, by(rep78)

*Fig 12.11 - sepscatter
sepscatter mpg weight, separate(rep78) 

*Fig 12.12 - Marginal distributions
superscatter price mpg, ylabel(5000(5000)15000)

*Fig 12.13 - Marginal distributions with options
superscatter price mpg, detail kdensity tabulate(count) means

*Binned scatterplots
webuse nhanes2
summarize weight height

*Fig 12.14 - The problem
twoway (scatter weight height, mcolor(%50))

*Fig 12.15 - Using binscatter to reduce number of markers
binscatter weight height, linetype(none) ylabel(0(50)200)

*Fig 12.16 - binscatter with line fit, median, and over group
binscatter weight height, linetype(lfit) nquantiles(100) ///
 ylabel(0(50)200) medians by(sex) mcolor(%50 %50)



