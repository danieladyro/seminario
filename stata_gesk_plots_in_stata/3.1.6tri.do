*Install package
ssc install triplot

clear all
*Load data
sysuse nlsw88
*Create 3 education groups
egen education = cut(grade), group(3)
tabulate education, generate(education)
*Recode occupation
drop if occupation == . 
recode occupation 9/12 = 13
*Collapse data
collapse (mean) education1 education2 education3, by(occupation)
*Label education variables
label variable education1 "Low"
label variable education2 "Medium"
label variable education3 "High"
*List data
list, nolabel separator(9)

*Fig 26.1 - Basic triplot
triplot education1 education2 education3

*Create coordinates
egen coord = concat(education1 education2 education3), format(%9.2f) ///
punct(,)

*Fig 26.2 - Basic triplot with coordinates
triplot education1 education2 education3, msymbol(O) mlabcolor(black) ///
mlabel(coord) xlabel(, nogrid)

*Fig 26.3 - Basic triplot with custom markers
triplot education1 education2 education3,  msymbol(O) max(1) y ///
label(0(0.1)1) mlabel(occupation) mlabcolor(black) mlabsize(*0.9) xlabel(, nogrid)

*Load data
sysuse nlsw88, clear
*Create 3 education groups
egen education = cut(grade), group(3)
tabulate education, generate(education)
*Recode occupation
drop if occupation == . 
recode occupation 9/12 = 13
*Collapse data
collapse (mean) education1 education2 education3, by(occupation south)
*Label education variables
label variable education1 "Low"
label variable education2 "Medium"
label variable education3 "High"
clonevar occupation2 = occupation
*List data
list occupation south education*, nolabel separator(2)

*Fig 26.4 - Basic triplot over multiple groups
triplot education1 education2 education3, separate(south) ///
mlabel(occupation occupation2) msymbol(O) max(1) y label(0(0.1)1) ///
mlabcolor(black black) mlabsize(*0.9 *0.9) xlabel(, nogrid)

*Load data
sysuse nlsw88, clear
*Create 3 education groups
egen education = cut(grade), group(3)
tabulate education, generate(education)
*Recode occupation
drop if occupation == . 
recode occupation 9/12 = 13
*Collapse data
collapse (mean) education1 education2 education3, by(occupation south c_city)
*Label education variables
label variable education1 "Low"
label variable education2 "Medium"
label variable education3 "High"
list occupation south c_city education*, nolabel separator(4)

*Fig 26.5 - Triplots by groups
triplot education1 education2 education3, by(south c_city) ///
mlabel(occupation) msymbol(O) max(1) y label(0(0.1)1) ///
mlabcolor(black) mlabsize(*0.6) scale(0.6) xlabel(, nogrid)














