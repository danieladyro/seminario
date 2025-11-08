*Convert shapefile to Stata file
spshape2dta "NUTS_Level_1_(January_2018)_Boundaries", replace  

*Load data and activate grmap
use "NUTS_Level_1_(January_2018)_Boundaries", clear
grmap, activate 
describe 

*Fig 31.1 - A basic map
grmap
sjlog close, replace

*Fig 31.2 - A map with centroid labels
grmap, label(label(nuts118nm) length(50) size(*0.7) color(maroon) ///
xcoord(_CX) ycoord(_CY))

*Impute geographic information
generate wkgrosspay = .
replace wkgrosspay = 546.8 if objectid == 1
replace wkgrosspay = 578.0 if objectid == 2
replace wkgrosspay = 568.5 if objectid == 3
replace wkgrosspay = 573.4 if objectid == 4
replace wkgrosspay = 581.8 if objectid == 5
replace wkgrosspay = 628.6 if objectid == 6
replace wkgrosspay = 728.4 if objectid == 7
replace wkgrosspay = 660.1 if objectid == 8
replace wkgrosspay = 577.3 if objectid == 9
replace wkgrosspay = 570.6 if objectid == 10
replace wkgrosspay = 622.0 if objectid == 11
replace wkgrosspay = 575.0 if objectid == 12

*Fig 31.3 - A basic choropleth map
grmap wkgrosspay

*Fig 31.4 - A custom choropleth map
grmap wkgrosspay,  legend(pos(10)) clmethod(custom) ///
clbreaks(500 550 600 650 700 750) fcolor(RdYlGn)

*Fig 31.5 - A custom choropleth map with equal intervals
grmap wkgrosspay, legend(position(10)) clmethod(eqint) clnumber(9) /// 
fcolor(Greens)  

*Fig 31.6 - A partial choropleth map
grmap wkgrosspay if _ID > 5 & _ID < 10, legend(pos(10)) /// 
fcolor(YlGn)
