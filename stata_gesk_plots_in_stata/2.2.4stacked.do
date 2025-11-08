*Install
ssc install slideplot
ssc install spineplot

*Input data
clear
input agegroup health freq
1 1 243
1 2 789
1 3 167
1 4 18 
1 5 6
2 1 220
2 2 809
2 3 164
2 4 35 
2 5 6
3 1 147
3 2 658
3 3 181
3 4 41 
3 5 8
4 1 90
4 2 469
4 3 236
4 4 50
4 5 16
5 1 53
5 2 414
5 3 306
5 4 106
5 5 30
6 1 44
6 2 267
6 3 284
6 4 98
6 5 20
7 1 20
7 2 136
7 3 157
7 4 66
7 5 17
end
*Create labels
label define agegroup 1 "16-24", modify
label define agegroup 2 "25-34", modify
label define agegroup 3 "35-44", modify
label define agegroup 4 "45-54", modify
label define agegroup 5 "55-64", modify
label define agegroup 6 "65-74", modify
label define agegroup 7 "75+", modify
label define health 1 "very good", modify
label define health 2 "good", modify
label define health 3 "regular", modify
label define health 4 "bad", modify
label define health 5 "very bad", modify
*Attach labels
label values agegroup agegroup
label values health health
*Expand data and drop freq variable
expand freq
drop freq
*Save data
save hage.dta, replace

*Load data
use hage, clear
summarize
table health agegroup 

*Fig 20.1 - Stacked bar chart 
graph bar (count), over(health) over(agegroup) stack asyvars ///
 ytitle(Frequency) 

*Fig 20.2 - Stacked bar chart with percentages option
graph bar (count), over(health) over(agegroup) stack asyvars ///
 ytitle(Percent) percentages

*Fig 20.3 - Stacked horizontal bar chart with percentages option
graph hbar (count), over(health) over(agegroup) stack asyvars ///
 ytitle(Percent) percentages blabel(bar, color(white) position(center) format(%3.0f)) 

*Fig 20.4 - Slide plot
slideplot bar health, negative(4 5) positive(3 2 1) by(agegroup) ytitle(Frequency)  

*Fig 20.5 - Slide plot horizontal
slideplot hbar health, negative(4 5) positive(3 2 1) by(agegroup) ytitle(Percent) ///
  percent yline(0)

*Fig 20.6 - Mosaic plot
spineplot health agegroup

*Fig 20.7 - Mosaic plot with labeling and outline colors
spineplot health agegroup, xlabel(0(10)100, axis(1) tposition(outside)) ///
  percent ylabel(0(10)100, axis(2)) barall(blwidth(*0.2) blcolor(black)) ///
  bar1(color(maroon)) bar2(color(erose)) bar3(color(eltgreen)) ///
  bar4(color(eltblue)) bar5(color(edkblue))  

