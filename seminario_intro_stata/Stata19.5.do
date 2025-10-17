*****NOTE: THERE ARE MORE COMMANDS HERE THAN DISPLYED IN THE SEMINAR

*************** STATA *******************

* load a Stata dataset over the internet
webuse auto, clear

* change directory (not run)
* cd "C:/path/to/directory"

* histogram command
histogram weight

* comments are not executed

/* this kind of comment 
   can span
   multiple lines */
   
* use /// to continue a command over multiple lines
summarize weight ///
  length

  
***** IMPORTING DATA

* loading Stata data files
* read from hard drive; uncomment and change path below before executing
* use "C:/path/to/myfile.dta"

* load data over internet
* notice .dta extension can be omitted
use https://stats.idre.ucla.edu/stat/data/hs0, clear

* save data, replace if it exists
save hs0, replace
* clear data from memory
clear

* load data but clear memory first
use https://stats.idre.ucla.edu/stat/data/hs0, clear

* create data frame called data2
frame create data2

* load nhanes2 data into data2 frame
frame data2: webuse nhanes2

* describe height and weight in nhanes2 data
frame data2: describe height weight

* look at data frames
frame dir

* import excel file; uncomment and change path below before executing
* import excel using "C:\path\myfile.xlsx", sheet("mysheet") firstrow clear


* import csv file; uncomment and change path below before executing
* import delimited using "C:\path\myfile.csv", clear


***** HELP FILES

*open help file for command summarize
help summarize

* summary statistics for all variables
summarize
* summary statistics for just variables read and write (using abbreviated command)
summ read write
* provide additional statistics for variable read
summ read, detail


*************** GETTING TO KNOW YOUR DATA *******************

***** VIEWING DATA

* seminar dataset
use https://stats.idre.ucla.edu/stat/data/hs0, clear

* browse dataset
browse

* list all observations and all variables
list

* list read and write for first 5 observations
li read write in 1/5

***** SELECTING OBSERVATIONS

* list science for last 3 observations
li science in -3/L

* list gender, ses, and math if math > 70 
* with clean output
li gender ses math if math > 70, clean

* browse gender, ses, and read 
*  for females (gender=2) who have read > 70
browse gender ses read if gender == 2 & read > 70


*** EXERCISE 1 ***
* 1.  Use the browse command to examine the ses values for students with write 
*     score greater than 65.
*     Then, use the help file for the browse command rewrite the command to 
*     examine the ses values without labels.


***** EXPLORING DATA

* inspect values of variables read gender and prgtype 
codebook read gender prgtype

* summarize continuous variables
summarize read math

* summarize read and math for females
summarize read math if gender == 2

* detailed summary of read for females
summarize read if gender == 2, detail

* tabulate frequencies of ses
tabulate ses

* remove labels
tab ses, nolabel

* two-way tab of race and ses
tab race ses 

* with row percentages
tab race ses, row

*** EXERCISE 2 ***
* 2. Use the tab command to determine the numeric code for "Asians" in the race variable
*    Then use summarize to estimate the mean of the variable science for Asians


***** DATA VISUALIZATION

* histogram of write
histogram write

* histogram of write with normal density 
*  and intervals of length 5
hist write, normal width(5)

* boxplot of all test scores
graph box read write math science socst

* scatter plot of write vs read
scatter write read

* bar graphs
* bar graph of count of ses
graph bar (count), over(ses) 

* frequencies of gender by ses
*   asyvars colors bars by ses
graph bar (count), over(ses) over(gender) asyvars 

* layered graph of scatter plot and lowess curve
twoway (scatter write read) (lowess write read)

* layered scatter plots of write and read
*   colored by gender
twoway (scatter write read if gender == 1, mcolor(blue)) ///
(scatter write read if gender == 2, mcolor(red))


*** EXERCISE 3 ***
* 3. Use the scatter command to create a scatter plot of math on the x-axis vs write on the y-axis
*    Use the help file for scatter to change the shape of the markers to triangles


*************** DATA MANAGEMENT *******************

***** CREATING AND TRANSFORMING VARIABLES

* generating variables
* generate a sum of 3 variables
generate total = math + science + socst

* it seems 5 missing values were generated
*  let's look at variables
summarize total math science socst

* list variables when science is missing
li math science socst if science == .

* same as above, using missing() function
li math science socst if missing(science)

* replace total with just (math+socst)
*  if science is missing
replace total = math + socst if science == .

* no missing totals now
summarize total

* egen with function rowmean generates variable that
* is mean of all non-missing values of those variables
egen meantest = rowmean(read math science socst)
summarize meantest read math science socst

* standardize read
egen zread = std(read)
summarize zread

* renaming variables
rename gender female
* recode values to 0,1
recode female (1=0)(2=1)
tab female

* labeling variables (description)
label variable math "9th grade math score"
label variable schtyp "public/private school"

* the variable label will be used in some output
histogram math
tab schtyp

* schtyp before labeling
tab schtyp

* create and apply labels for schtyp
label define pubpri 1 public 2 private
label values schtyp pubpri
tab schtyp

* encoding string prgtype into
*  numeric variable prog
encode prgtype, gen(prog)

* we see that prog is numeric with labels (blue)
*  while the old variable prog is string (red)
browse prog prgtype

* we see labels by default in prog
tab prog

* use option nolabel to remove the labels
tab prog, nolabel


*** EXERCISE 4 ***
* 4. Use the generate and replace commands to create a variable called "highmath" 
*	  that takes on the value 1 if math is greater than 60, and 0 otherwise.
*	 Then use the label define command to create a set of value labels called "mathlabel", 
*     which labels the value 1 "high" and the value 0 "low"
*    Finally, use the label values command to apply the "mathlabel" labels to the 
*     newly generated variable "highmath.
*    Use the tab command on highmath to check your results.


***** DATASET OPERATIONS

* save dataset, overwrite existing file
save hs1, replace

* drop prgtype from dataset
drop prgtype

* keep just id read and math
keep id read math

* keep observation if reading > 30
keep if read > 40
summ read

* now drop if write outside range [30,70]
drop if math < 30 | math > 70
summ math

* sorting
* first look at unsorted
li in 1/5

* now sort by read and then math
sort read math
li in 1/5

* sort descending read then ascending math
gsort -read +math
li in 1/5


*** EXERCISE 5 ***
* 5. Reload the hs0 data set fresh using the following command:
use https://stats.idre.ucla.edu/stat/data/hs0, clear

*    Subset the dataset to observations with write score greater than or equal to 60.  
*     Then remove all variables except for id and write.  
*     Save this as a Stata dataset called "highwrite"

*    Reload the hs0 dataset, subset to observations with write score less than 60, 
*      remove all variables except id and write, and save this dataset as "lowwrite"
use https://stats.idre.ucla.edu/stat/data/hs0, clear

*    Reload the hs0 dataset.  Drop the write variable.  Save this dataset as "nowrite".
use https://stats.idre.ucla.edu/stat/data/hs0, clear


***** APPENDING AND MERGING

* clear an reload data
use https://stats.idre.ucla.edu/stat/data/hs0, clear

*    Subset the dataset to observations with write score greater than or equal to 60.  
*     Then remove all variables except for id and write.  
*     Save this as a Stata dataset called "highwrite"
keep if write >= 60
keep id write
save highwrite, replace

*    Reload the hs0 dataset, subset to observations with write score less than 60, 
*      remove all variables except id and write, and save this dataset as "lowwrite"
use https://stats.idre.ucla.edu/stat/data/hs0, clear
keep if write < 60
keep id write
save lowwrite, replace

*    Reload the hs0 dataset.  Drop the write variable.  Save this dataset as "nowrite".
use https://stats.idre.ucla.edu/stat/data/hs0, clear
drop write
save nowrite, replace

* append highwrite and lowwrite datasets
* first load highwrite 
use highwrite, clear

* append lowwrite
append using lowwrite
* summarize write shows 200 observations and write scores above and below 70
summ write

* merge in nowrite dataset using id to link
merge 1:1 id using nowrite


*************** BASIC STATISTICAL ANALYSIS *******************
* load new dataset
use https://stats.idre.ucla.edu/stat/data/hs1, clear

** ANALYSIS OF CONTINUOUS OUTCOMES
* many commands provide 95% CI
mean read

* testing if means are different 
*  across groups
* independent samples t-test
ttest read, by(female)

* correlation matrix of 5 variables
corr read write math science socst

* linear regression of write on continuous
*  predictor math and categorical predictor ses
regress write c.math i.ses

* look at what postestimation commands are available after regress
help regress postestimation

* postestimation examples
* predicted dependent variable
predict pred

* get residuals
predict res, residuals

* first 5 predicted values and residuals with observed write
li pred res write in 1/5


*** EXERCISE 6 ***
* 6. Use the regress command to determine if the variables female (categorical) and
*      science (continuous) are predictive of the dependent variable math.
*    One of the assumptions of linear regression is that the errors 
*     (estimated by residuals) are normally distributed.  Use the predict command
*     and the histogram command to assess this assumption.


** ANALYSIS OF CATEGORICAL OUTCOMES

* chi square test of independence
tab prog ses, chi2

* uncomment and run these lines if highmath is not in your dataset
* gen highmath = 0
* replace highmath = 1 if math > 60

*  logistic regression of binary outcome highmath predicted by 
*    by continuous(write) and female (categorical)
logit highmath c.write i.female, or


*************** OUTPUTTING TO WORD AND EXCEL *******************

** OUTPUTTING TO WORD

* create a Word docx file to export results, set default font size to 12
putdocx begin, font(12)

* first line starts a block of text in a new paragraph, using a Title style
* second line is the text to appear
* third line ends the text block
putdocx textblock begin, style(Title)
Regression of read results
putdocx textblock end

* start a block of text in a new paragraph
putdocx textblock begin
This report displays the results of the regression of read on write and math and a residuals vs fitted plot to check some of the assumptions of the linear regression model.
putdocx textblock end

* run regression of read on write and math
regress read write math
* insert regression as a Word table
putdocx table model1 = etable

* make residuals vs fitted plot
rvfplot, yline(0)
* export plot to .png file
graph export rvf.png, replace
* start a new paragraph to add spacing
putdocx paragraph
* insert .png file
putdocx image rvf.png

* save and close the .docx file, replace file if it already exists
putdocx save regress_read.docx, replace


** OUTPUTTING TO EXCEL

* open Excel file for output, replace if it exists already
putexcel set "output.xlsx", sheet("regress results") replace

* regression of read on write and female
regress read write female
* write bolded text to cell A1 in Excel file
putexcel A1 = "Regression of read", bold
* write regression table to cell A2 in Excel file
putexcel A2 = etable

* make a boxplot of read by female
graph box read, over(female)
* export plot to .png file
graph export boxread.png, replace
* add plot to cell A7 of Excel file
putexcel A7 = image("boxread.png")

* close and save Excel fiel
putexcel save

****************** SOLUTION TO IN-CLASS EXERCISES *****************************

* LOAD DATA FOR EXERCISES
use https://stats.idre.ucla.edu/stat/data/hs0, clear

*** EXERCISE 1 ***
* 1.  Use the browse command to examine the ses values and write scores  
*     for students with write score greater than 65.
*     Then, use the help file for the browse command rewrite the command to 
*     examine the ses values without labels.
browse ses write if write > 65
help browse
browse ses write if write > 65, nolabel

*** EXERCISE 2 ***
* 2. Use the tab command to determine the numeric code for "Asians" in the race variable
*    Then use summarize to estimate the mean of the variable science for Asians
tab race
tab race, nolabel
summ science if race == 2

*** EXERCISE 3 ***
* 3. Use the scatter command to create a scatter plot of math on the x-axis vs write on the y-axis
*    Use the help file for scatter to change the shape of the markers to triangles
scatter write math
scatter write math, msymbol(triangle)

*** EXERCISE 4 ***
* 4. Use the generate and replace commands to create a variable called "highmath" 
*	  that takes on the value 1 if math is greater than 60, and 0 otherwise.
*	 Then use the label define commands create a set of value labels, which you can
*     call "mathlabel", which labels the value 1 as "high" and the value 0 "low".
*    Finally, use the label values command to apply the "mathlabel" labels to the 
*     newly generated variable "highmath.
*    Use the tab command on highmath to check your results.
gen highmath = 0
replace highmath = 1 if math > 60
replace highmath = . if math == .

label define mathlabel 0 "low" 1 "high"
label values highmath mathlabel
tab highmath

*** EXERCISE 5 ***
* 5. Reload the hs0 data set fresh using the following command:
use https://stats.idre.ucla.edu/stat/data/hs0, clear

*    Subset the dataset to observations with write score greater than or equal to 60.  
*     Then remove all variables except for id and write.  
*     Save this as a Stata dataset called "highwrite"
keep if write >= 60
keep id write
save highwrite, replace

*    Reload the hs0 dataset, subset to observations with write score less than 60, 
*      remove all variables except id and write, and save this dataset as "lowwrite"
use https://stats.idre.ucla.edu/stat/data/hs0, clear
keep if write < 60
keep id write
save lowwrite, replace

*    Reload the hs0 dataset.  Drop the write variable.  Save this dataset as "nowrite".
use https://stats.idre.ucla.edu/stat/data/hs0, clear
drop write
save nowrite, replace

*** EXERCISE 6 ***
* load hs1 dataset
use hs1, clear

* 6. Use the regress command to determine if the variables female (categorical) and
*      science (continuous) are predictive of the dependent variable math.
*    One of the assumptions of linear regression is that the errors 
*     (estimated by residuals) are normally distributed.  Use the predict command
*     and the histogram command to assess this assumption.
regress math i.female c.science
predict mathres, residuals
histogram mathres, normal



