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
label define agegroup 1 "16–24", modify
label define agegroup 2 "25–34", modify
label define agegroup 3 "35–44", modify
label define agegroup 4 "45–54", modify
label define agegroup 5 "55–64", modify
label define agegroup 6 "65–74", modify
label define agegroup 7 "75+", modify
label define health 1 "Very good", modify
label define health 2 "Good", modify
label define health 3 "Regular", modify
label define health 4 "Bad", modify
label define health 5 "Very bad", modify
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

*Fig 19.1 - Bar chart over two discrete variables
graph bar (count), over(health) over(agegroup)

*Fig 19.2 - Horizontal bar chart over two discrete variables
graph hbar (count), over(health) over(agegroup)

*Fig 19.3 - Horizontal bar chart with legend differentiation
graph hbar (count), over(health) over(agegroup) asyvars 

*Table with multiple cell statistics
tabulate health agegroup, column row cell nofreq

*Fig 19.4 - Row percentages
graph hbar (count), over(agegroup) over(health) asyvars percentages

*Fig 19.5 - Column percentages 
graph hbar (count), over(health) over(agegroup) asyvars percentages

*Fig 19.6 - Cell percentages
graph hbar (percent), over(health) over(agegroup) asyvars  

