* version 16
***CHAPTER 3

***To load a dataset into active memory, substitute the path to the location of
***the dataset on your computer for the dots ...
use "C:\Users\Daniel\Downloads\stata_book\General Resources\Resources\Data_sets\NELS.dta", clear

***To obtain Table 3.1
tabulate homelang

***To obtain Figure 3.1. Bar graph of frequencies for region
gen count = 1 if !missing(region)
graph bar (count) count, over(region) ytitle("count of id")

***To obtain Figure 3.2. A bimodal distribution of test scores of Spanish fluency
***Because the data are in aggregated form in the dataset, we need to weight each 
***value by its frequency in constructing the bar graph [fweight=frequency]
use "...Data for Figure 3.2.dta", clear
graph bar (count) [fweight = frequency], over(fluency) title("Bar Graph of Fluency Scores")

***To obtain Figure 3.3. A Rectangular Distribution
use "...Data for Figure 3.3.dta" 
graph bar (count) [fweight = frequency], over(score) title("Rectangular Distribution of Scores")

***To obtain Figure 3.4. Histogram of socio-economic status
***First load the NELS dataset
use "...NELS.dta", clear
histogram ses

***To obtain the mode of ses. 
***Perhaps the best way to obtain the mode of the ses distribution is by examining the frequency distribution using 
***either of the following commands. 
tabulate ses
tab1 ses

***In addition, we may use the egen mode command as shown as long as the variable has no missing values.  
***This command will generate a new variable in the data set called sesmode, which will have the same value for all cases.

***Rather than list the mode for all our cases (which would be 500 for the NELS dataset), we simply request that the mode
***for the arbitrarily selected case with id = 1 be listed.  In STATA, following an "if", equality is represented by two 
***equal signs, ==.    
egen sesmode = mode(ses)
list sesmode if id == 1

***To obtain the median of ses we may use either of the following commands.
tabstat ses, stats(median)  
summarize ses, detail

***To obtain the mean of ses we may use either of the following commands.
tabstat ses, stat(mean)  
summarize ses 

***To obtain the mean of the dichotomous variable, gender (Example 3.4)
summarize gender 
tabulate gender 

***To obtain Figure 3.5. Histograms of two symmetric distributions.
use "...Data for Figure 3.5.dta" 
***When the option discrete is used, the variable will be treated as though it were discrete, and, in particular, each unique 
***value of the variable will have its own bin or bar.  Without discrete, unwanted spaces may appear between the bars.

histogram Score [fweight=DistnA], frequency discrete
histogram Score [fweight=DistnB], frequency discrete

***To obtain Figures 3.6 & 3.7. Severe negative skew.  Severe positive skew.
use "...Data for Figures 3.6 & 3.7.dta", clear
histogram Score [fweight=NegSkew], frequency discrete
histogram Score [fweight=PosSkew], frequency discrete

***To obtain the mean and median results for Example 3.5
use "...NELS.dta", clear
tabstat ses expinc30 schattrt slfcnc08, stat(mean median) 

***To obtain boxplots results for Example 3.6
use "C:\Users\Daniel\Downloads\stata_book\General Resources\Resources\Data_sets\Temp.dta", clear
graph box temp, by(city) /*these boxplots will appear in separate frames or panels*/
graph box temp, over(city) /*these boxplots will appear in the same frame or panel*/

***To obtain the iqr of temp for each city, we may use any of the following commands 
***(Example 3.7)
by city, sort : summarize temp, detail  
by city: summarize temp, detail 
tabstat temp, stats(iqr) by(city) 

***To obtain the standard deviation of temp by city, we may use any of the following commands.
***The first three commands organize the results into two separate tables, one for each city
***The last two commands organize the results into a single table. 
***The first three commands also may be typed without ,sort.  

by city, sort : summarize temp, detail
by city, sort : summarize temp
by city, sort : tabstat temp, stats(sd) 
tabstat temp, stats(sd) by(city)
tabulate city, summ(temp)

***To obtain the skewness of temp for each city (Example 3.8)
by city, sort: summarize temp, detail

***To obtain the full set of skewness statistics, including the standard error of skewness (seskew) 
***and the skewness ratio for Temp.dta, we use the following command
summskew temp, by(city)

***THE FOLLOWING SET OF COMMANDS FOR OBTAINING THE SKEWNESS STATISTICS IS OPTIONAL CODE
***Temp.dta has two variables, city and temp.  city is a grouping variable and temp is a continuous variable.
/* */
summarize city, detail
display "the maximum code for the grouping variable = " r(max)
display "the minimum code for the grouping variable = " r(min)
global k = r(max)
global m = r(min)

forval i = $m (1) $k {
quietly summarize temp if city == `i', detail
capture drop n skew seskew skew_ratio
local n = r(N)
local skew = r(skewness)
local seskew = sqrt((6*(`n')*(`n' - 1))/((`n' - 2)*(`n' + 1)*(`n' + 3)))
local skew_ratio = `skew'/`seskew'
display "For city = " `i' ": skewness = " `skew' "; seskew = " `seskew' " ; skewness ratio = " `skew_ratio'
}
/* */

***Alternatively, we may make use of the statsby command to extract specified statistics output from an executed command. 
***In particular, in this example, the specified statistics we wish to extract are the number of observations, 
***r(N), and the value of skewness, r(skewness), that are computed by the summarize command. To use these two 
***statistics in calculating the seskew and the skewness ratio, we would save them into a new file, which we call 
***myresult. In doing so, our temp.dta file is cleared from active memory. And so, as a last step in the following code, 
***we re-load temp.dta into active memory. 
statsby obs = r(N) skewness = r(skewness), by(city) saving(myresult, replace): summarize temp, detail
use myresult, clear
gen seskew = sqrt((6*(obs)*(obs - 1))/((obs - 2)*(obs + 1)*(obs + 3)))
gen skewratio = skewness/seskew
list
use "...Temp.dta", clear
browse

***If there were no grouping variable, then we could use the following syntax to find the seskew and skewness ratio of varname.
***We would need to replace varname with the actual name of the variable of interest (e.g., slfcnc08).  The command, local, creates a new
***variable, but unlike generate, the variable created is not entered as a new variable in the dataset; instead, it is used only "locally"  
***for the purpose of carrying out the steps of the program. Once created, local variables need to be referred to using open and closed  
***single quotes. The single quote on the left may be found on the key with the ~ and the single quote on the right may be found on the 
***key with the ". 
***THIS ALSO IS OPTIONAL CODE.  INSTEAD USE summskew WITHOUT THE by() OPTION
/* */
summarize varname, detail
quietly {
local n = r(N)
local skew = r(skewness)
local seskew = sqrt((6*(`n')*(`n' - 1))/((`n' - 2)*(`n' + 1)*(`n' + 3)))
local skew_ratio = `skew'/`seskew' 
}
display "skewness = " `skew' "; seskew = " `seskew' " ; skewness ratio = " `skew_ratio'
/* */

***Alternatively, we may test whether the variable temp for each city is skewed in the population 
***(has a large enough skewness value to be considered skewed in the population), we could use the
***following commands.
sktest temp if city == 1
sktest temp if city == 2

***Applying What We Have Learned
***To obtain boxplots and descriptive statistics of expinc30, organized by gender into separate panels:
use "...NELS.dta", clear
graph box expinc30, by(gender)
by gender, sort : summarize expinc30, detail

***To obtain boxplots of expinc30 by gender in the same panel with outliers identified by their id:
graph box expinc30, over(gender) marker(1, mlabel (id))

***To obtain the full set of skewness statistics of expinc30 for each gender
summskew expinc30, by(gender)

***To obtain the skewness ratio for each gender, we may use the following OPTIONAL set of commands:
/* */
summarize gender, detail
display "maximum number of groups = " r(max)
display "minimum number of groups = " r(min)
global k = r(max)
global m = r(min)

forval i = $m (1) $k {
quietly summarize expinc30 if gender == `i', detail
capture drop n skew seskew skew_ratio
gen n = r(N)
gen skew = r(skewness)
gen seskew = sqrt((6*(n)*(n - 1))/((n - 2)*(n + 1)*(n + 3)))
gen skew_ratio = skew/seskew
display "For gender = " `i' ": skewness = " skew "; seskew = " seskew " ; skewness ratio = " skew_ratio
}
/* */

***To obtain a test of the skewness of expinc30 for males and females, respectively
sktest expinc30 if gender == 1
sktest expinc30 if gender == 0

***To obtain boxplots of more than one variable (slfcnc08 and slfcnc10) in the same panel by gender 
***with outliers identified by their id:
graph box slfcnc08 slfcnc10, over(gender) marker(1, mlabel (id)) marker (2,mlabel(id))

***To obtain these analyses without the two outliers with id's equal to 102 and 494
by gender, sort: summarize expinc30, detail
by gender, sort: summarize expinc30 if id !=102 & id != 494, detail
by gender, sort: summarize expinc30 if expinc30 < 450000, detail  
