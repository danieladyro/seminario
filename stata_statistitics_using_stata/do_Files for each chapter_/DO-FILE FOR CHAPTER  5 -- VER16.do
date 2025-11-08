version 16
***CHAPTER 5

***To obtain Table 5.1
***To load a dataset into active memory, substitute the path to the location of
***the dataset on your computer for the dots ...

use "...Hamburg.dta", clear

describe /*describes the variables in this dataset*/
list name fat calories

***To obtain Table 5.2
use "...Currency.dta", clear
describe
list billvalu tot_curr num_circ, table

***To obtain Figure 5.1
use "...Hamburg.dta", clear
twoway (scatter calories fat)

***To obtain Figure 5.2
use "...States.dta", clear
describe
browse
twoway (scatter satcr pertak)

***To obtain Figure 5.3
use "...Currency.dta", clear
twoway (scatter num_circ billvalu)

***To obtain Figure 5.4
use "...Marijuana.dta", clear
twoway (scatter marij year) if (year >=1987) & (year <=1996)

***A more elaborate Figure 5.4 with a title in medium large red font
twoway (scatter marij year) if (year >=1987) & (year <=1996) , ///
       title(Marijuana Usage Across Years, size(medlarge) color(red))

***A still more elaborate Figure 5.4 with marker symbols as large blue diamonds
twoway (scatter marij year if (year >=1987) & (year <=1996) ,         ///
       title(Marijuana Usage Across Years, size(medlarge) color(red)) ///
	   msymbol(D) mcolor(blue) msize(large))

***To obtain Figures 5.5(A) through 5.5(I), after loading the data, we use the 
***following synax, one line for each figure.
use "...Data for Figures 5.5.dta" 
graph twoway (scatter ay ax) (lfit ay ax)
graph twoway (scatter by bx) (lfit by bx)
graph twoway (scatter cy cx) (lfit cy cx)
graph twoway (scatter dy dx) (lfit dy dx)
graph twoway (scatter ey ex) (lfit ey ex)
graph twoway (scatter fy fx) (lfit fy fx)
graph twoway (scatter gy gx) (lfit gy gx)
graph twoway (scatter hy hx) (lfit hy hx)
graph twoway (scatter iy ix) (lfit iy ix)

***To obtain the data presented in Table 5.6
use "...Hamburg.dta", clear
egen zfat = std(fat) 
egen zcalories = std(calories)

***To list Table 5.6
list name fat calories zfat zcalories

***To calculate the correlation "by hand" with help from STATA
edit
gen prod = zfat*zcalories
summarize prod, detail

***The return list command lists the set of statistics estimated and stored
***following the execution of a command (in this case, the summarize command). 
***These statistics are related to the command just executed and are called 
***postestimation statistics. They may be called upon and used in commands that 
***directly follow that command.  The list of postestimation statistics 
***in connection with the summarize varname, detail command are:  
***r(N), r(sum), r(mean), r(Var), r(sd), r(skewness), r(kurtosis), r(min), 
***r(max), r(p1), r(p5), and so on. 
***As indicated in this list, the names given to postestimation statistics are 
***all of the form r().  They may be saved as new variables in your dataset for 
***use in future analyses. They also may be used in the form r() as shown in the
***the display command following the return list command.  r(sum) is the sum of
***the product zfat*zcalories, and, as such, is the Pearson Product Moment 
***Correlation Coefficient computed from Equation (5.1a). Accordingly, the 
***display command displays the value of this correlation in the Output Window.

return list
display "Pearson Product Moment Correlation Coefficient = " r(sum)/4

***To obtain the correlation between calories and fat grams for the Hamburg data 
***using Stata
correlate calories fat
pwcorr calories fat, obs

***To obtain the Spearman Rank Correlation Coefficient as given in Equation 
***(5.4) as shown in Example 5.3
spearman calories fat

***To obtain the Pearson Product Moment Correlation Coefficient When at Least 
***One Variable is Dichotomous -- Example 5.4
pwcorr calories cheese

***To obtain the PPM Correlation Coefficient in Example 5.5
use "...NELS.dta", clear
correlate gender achsci12 if region == 4
pwcorr gender achsci12 if region ==4

***To obtain a scatterplot of achsci12 vs. gender with value labels for gender 
***included in the plot
twoway scatter achsci12 gender if region == 4,  xlabel(0 "Male" 1 "Female")

***OR we may use instead the following version if gender already has been   
***asssigned value labels in the dataset 
twoway scatter achsci12 gender if region == 4,  xlabel(0 1, valuelabel)

***Because the points in a scatterplot are often so densely packed, it makes 
***sense to introduce the jitter option, which allows the points to separate a
***bit from one another. The higher the number, the more random jittering is 
***introduced.
twoway scatter achsci12 gender if region == 4,  xlabel(0 1, valuelabel) jitter(5)

***To obtain a scatterplot of achrdg12 vs. gender with value labels for gender 
***included in the plot
twoway scatter achrdg12 gender if region == 4, xlabel(0 "Male" 1 "Female") jitter(5)

***To obtain a scatterplot of nursery vs. gender with value labels for gender 
***included in the plot
twoway scatter nursery gender if region == 4, xlabel(0 "Male" 1 "Female")

***To obtain the phi coefficient -- Example 5.6
pwcorr nursery gender if region ==3

***To obtain a clustered bar graph relating nursery school attendance with 
***gender -- Example 5.6 -- Figure 5.11
graph bar (count) if region ==3, over(nursery) over(gender) asyvars   ///
          ytitle("Frequency -- Nursery School Attendance")
***Note: the variable in the first over() is treated as the y-axis

***For a horizontally-oriented bar or clustered bar graph we use hbar
graph hbar (count) if region ==3, over(nursery) over(gender) asyvars ///
           ytitle("Frequency -- Nursery School Attendance")

***To obtain a table of frequencies of nursery school attendance by gender -- 
***as in Figure 5.12
tabulate nursery gender if region == 3

***To obtain a clustered bar graph relating computer ownership with nursery 
***school attendance for those in the West -- Example 5.6 -- Figure 5.13
graph bar (count) if region == 4, over(computer) over(nursery) asyvars ///
          ytitle("Frequency -- Computer Ownership in 8th Grade") 

***For a horizontally-oriented bar or clustered bar graph we use hbar
graph hbar (count) if region == 4, over(computer) over(nursery) asyvars ///
           ytitle("Frequency -- Computer Ownership in 8th Grade")

***To obtain a table of frequencies of nursery school attendance by computer 
***ownership for those in the West -- Figure 5.14
tabulate computer nursery if region == 4

***To obtain the Phi Coefficient for nursery attendance and computer ownership 
***for those in the West
pwcorr nursery computer if region == 4, obs

***To obtain the boxplots of Figures 5.15 and 5.16
graph box achsci12 if region == 4, over(gender)
graph box achrdg12 if region == 4, over(gender)

***To obtain the boxplots of Figures 5.17 -- 12th grade math achievement by region
graph box achmat12, over(region)

***To obtain a contingency table for computer ownership vs. region -- Example 5.9
tabulate computer region 

***To obtain a clustered bar graph of computer ownership by region -- Example 5.9
graph bar (count), over(computer) over(region) asyvars    ///
          ytitle("Frequency -- Computer Ownership in 8th Grade")






