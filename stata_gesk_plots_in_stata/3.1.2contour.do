*Install  
ssc install palettes
ssc install colrspace

clear all
*Load data
sysuse sandstone
summarize
list depth northing easting in 1/20, separator(0)

*Fig 22.1 - Basic contour plot
twoway (contour depth northing easting)

*Fig 22.2 - Contour plot with 10 levels and minimum and maximum legend labeling
twoway (contour depth northing easting, levels(10) minmax) 

*Fig 22.3 - Basic contour-line plot
twoway (contourline depth northing easting)

*Fig 22.4 - Basic contour-line plot with 20 levels and colored lines
twoway (contourline depth northing easting, colorlines levels(20))

*Custom colors
colorpalette  viridis, ipolate(5) reverse nograph
return list

*Fig 22.5 - Custom color contour plot
quietly colorpalette  viridis, ipolate(5) reverse nograph
twoway (contour depth northing easting, ccolors(`r(p)')  levels(5)) 

*Fig 22.6 - Custom colors and overlaid plots
quietly colorpalette HCL terrain2, ipolate(20) reverse nograph
twoway (contour depth northing easting, ccolors(`r(p)') levels(20)) ///
 (contourline depth northing easting, plegend(off) scolor(white) ///
 ecolor(white) crule(linear) colorlines levels(20))

*Using contour when data does not fill regular grid
sysuse auto, clear
summarize

*Fig 22.7 - Contour plot with little data
twoway (contour mpg weight length, levels(5))

*Model relationship
regress mpg c.weight##c.length
*Predict values across grid
quietly margins, at(weight=(1760(100)4840) length=(142(5)233)) ///
 saving(predictions, replace)
*Load prediction
use predictions, clear

*Fig 22.8 - New contour plot
twoway (contour _margin _at1 _at2, levels(20))


