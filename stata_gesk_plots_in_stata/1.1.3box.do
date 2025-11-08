*Install histbox
ssc install histbox

clear all
*Load data
sysuse citytemp
summarize 

*Fig 3.1 - Basic box plot
graph box tempjan  

*Fig 3.2 - Basic box plot with outliers
graph box tempjan if region == 1

*Fig 3.3 - boxlook_options
graph box tempjan, medtype(marker) box(1, fcolor(erose)) ///
 cwhiskers lines(lpattern(dash))

*Fig 3.4 - Horizontal box plot
graph hbox tempjan 

*Fig 3.5 - Histogram with box plot
graph hbox tempjan, name(g1, replace) 
histogram tempjan, name(g2, replace) ytitle("")
graph combine g1 g2, cols(1) xcommon

*Fig 3.6 - Community-contributed histogram with box plot
histbox tempjan, bin(30)

*Fig 3.7 - Multiple box plots
graph box tempjan tempjuly

*Fig 3.8 - Multiple box plots over a categorical variable
graph box tempjan tempjuly, over(division)

*Fig 3.9 - Multiple box plots with ascategory option
graph hbox tempjan tempjuly, over(division) scale(0.8) ascategory

*Fig 3.10 - Ordering boxes
graph hbox tempjan, over(division, sort(1)) 


