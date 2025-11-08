*version 16
***CHAPTER 2

***To load a dataset into active memory, substitute the path to the location of
***the dataset on your computer for the dots ...
use "C:\Users\Daniel\Downloads\stata_book\General Resources\Resources\Data_sets\NELS.dta", clear


describe
***To obtain the frequency distribution in Table 2.1
tabulate region 
***To obtain the bar graph of Figure 2.1
gen count = 1 if !missing(region)

graph bar (count) count , over(region) ytitle("frequency")

gen percent = 1 if !missing(region)

***To obtain the bar graph of Figure 2.2ytitle("percent")

graph bar (count) percent  , over(region) 

***To obtain the bar graph of Figure 2.2, but with a horizontal orientation
graph hbar (percent), over(region) ytitle("percent")
***To obtain the bar graph of Figure 2.2, but with bars ordered by height in ascending order
graph bar (percent), over(region, sort(1)) ytitle("percent")
***To obtain the bar graph of Figure 2.2, but with bars ordered by height in descending order
graph bar (percent), over(region, sort(1) descending) ytitle("percent")
***To obtain the bar graph of Figure 2.1, but with a horizontal orientation
graph hbar (count), over(region)ytitle("frequency")
***To obtain the pie chart of Figure 2.3
graph pie, over(region) 
***To obtain the pie chart of Figure 2.3 with pie labels based on the names of the variable values written
***1.5 times larger than the default size in white and located at a 0 distance (gap) from the default 
***setting within the slices.  The legend that appears on the bottom has been turned off 
graph pie, over(region) plabel(_all name, size(*1.5) color(white) gap(0)) legend(off) ///
                title("Regions Represented in the NELS Data Set")

				***To obtain the pie chart of Figure 2.4 -- Causes of Death
use " Causes of Death.dta", clear
graph pie tobacco secondhand_smoke alcohol suicide AIDS car_accidents heroin_morphine homicide fire, ///                                                        
                title("Annual Number of Deaths, NYC ") ///
                note("Source: www.StopSmokingDoctors.com") 	
***To obtain the frequency distribution in Table 2.2
tabulate ses 
***To obtain the grouped frequency distribution in Table 2.3 
***The cut() function in combination with the command egen can be used to create a new variable that  
***contains grouped frequencies; we then can use the command tabulate to display the values in a 
***frequency distribution. This cut function groups ses into categories from 0-4, 5-9, 10-14, ... ,35-39
egen categories = cut(ses), at(0(5)40)
tabulate categories
***To obtain the stem and leaf plot in Table 2.4 we first access the States dataset and then compute the stem and leaf
use "...States.dta", clear
stem pertak
***To obtain the stem and leaf plot in Table 2.5
stem satm
***To obtain the stem and leaf plot in Table 2.6
use "C:\Users\Daniel\Downloads\stata_book\General Resources\Resources\Data_sets\NELS.dta", clear
stem ses
***To obtain the histogram of Figure 2.5
histogram ses, frequency 
***To obtain the histogram of Figure 2.6                               
histogram ses, bin(5) frequency 
***To obtain the histogram of Figure 2.7
histogram ses, bin(30) frequency 
***To obtain the histogram of Figure 2.8
histogram ses, percent 
***To obtain the line graph of Figure 2.9 and variations of Figure 2.9
twoway histogram ses, recast(line) lcolor (gs9) lwidth(medium) freq
twoway histogram ses, recast(line) lcolor (gs9) lwidth(medium) percent
kdensity ses, bwidth(.75)
***To obtain the line graph of Figure 2.10
use "C:\Users\Daniel\Downloads\stata_book\General Resources\Resources\Data_sets\Marijuana.dta", clear
describe
twoway line marij year
***To customize the line graph of Figure 2.10 as described
twoway (line marij year , lcolor(blue) lpattern(dash) lwidth(medium)), title(Marijuana Usage by Year)

use "C:\Users\Daniel\Downloads\stata_book\General Resources\Resources\Data_sets\NELS.dta", clear
***To obtain the histogram of Figure 2.12
histogram slfcnc12
***To obtain the histogram of Figure 2.13
histogram exppinc30
***To obtain the ogive of Figure 2.14 and a more elaborate version with grid lines and titles
capture cumul ses, generate(cum) freq
sort cum
twoway line cum ses
twoway line cum ses, ylab(#5, grid) ytitle(" cumulative frequency") xlab(#5, grid) ///
            title("Cumulative Frequency Distribution") subtitle("SES -- NELS data")
***To obtain the results of Example 2.3
tabstat ses, stats (n p25 p50 p75) column (variable)
summarize ses, detail
***To obtain the statistics in Table 2.7
tabstat ses, statistics(count min max p50 p75 p25) column(variable) 
summarize ses, detail
***To obtain the box plot of Figure 2.15
graph box ses
***To obtain the boxplot of Figure 2.16(a)
graph box slfcnc12
***To obtain the boxplot of Figure 2.16(b)
graph box expinc30
***To obtain the boxplot of Figure 2.17 
graph box slfcnc12, marker(1, mlabel(id))
***To obtain two boxplots in the same set of axes, slfcnc12 and slfcnc08, with outlier labels 
graph box slfcnc12 slfcnc08, marker(1, mlabel(id)) marker(2, mlabel(id))
***To obtain the boxplot of Example 2.4
graph box educexpe, over(region) marker(1, mlabel(state))




