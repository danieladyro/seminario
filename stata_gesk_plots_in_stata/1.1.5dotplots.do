*Install 
ssc install stripplot
ssc install beamplot

clear all
*Load data
sysuse citytemp
summarize

*Fig 5.1 - Basic dot plot
dotplot tempjan, mean

*Fig 5.2 - Dot plot with 15 bins
dotplot tempjan, ny(15)

*Fig 5.3 - Dot plot with marker options
dotplot tempjan, ny(15) msize(*0.4) msymbol(Oh) mlwidth(*0.5) mlcolor(black)

*Fig 5.4 - Dot plot without grouping
dotplot tempjan, nogroup

*Fig 5.5 - Dot plots of two variables
dotplot tempjan tempjuly

*Fig 5.6 - Dot plots over groups
dotplot tempjan, over(division) 

*Fig 5.7 - stripplot command
stripplot tempjan, over(division) stack width(1) msize(*0.6)

*Fig 5.8 - beamplot 
beamplot tempjan tempjuly

*Fig 5.9 - beamplot with options
beamplot tempjan, over(division) dots(msize(*0.4) msymbol(Oh) /// 
 mlwidth(*0.4) mlcolor(black))

*Fig 5.10 - stripplot over groups and with box plots
stripplot tempjan, over(division) stack width(1) vertical box ///
boffset(-0.3) iqr(1.5) msize(*0.5)  

*Fig 5.11 - Cumulative dot plots
stripplot tempjan, over(division) msize(*0.2) cumulate connect(L)



 

