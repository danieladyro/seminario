*Install violin plots
ssc install vioplot

clear all
*Load data
sysuse citytemp
summarize

*Fig 4.1 - A violin plot
vioplot tempjan

*Fig 4.2 - Violin plot with kernel() option
vioplot tempjan, kernel(gaussian) bwidth(10)

*Fig 4.3 - A horizontal violin plot
vioplot tempjan, horizontal 

*Fig 4.4 - Multiple violin plots
vioplot tempjan tempjuly, over(division) 

*Fig 4.5 - Multiple violin plots with custom widths
vioplot tempjan tempjuly, over(division) barwidth(500) dscale(200)
