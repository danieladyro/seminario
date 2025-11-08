* version 16
***CHAPTER 4

***To obtain the histogram of Figure 4.1
***We may input the data (x = 1,1,2,2,2,3,3; 2x+10 = 12,12,14,14,14,16,16) directly into STATA from the do file as follows:
clear all
input x v2xplus10
1 12
1 12
2 14
2 14
2 14
3 16
3 16
end


***list the data to verify that it is input correctly
list
***browse the Data Editor to verify that these data are in active memory          
browse

***Construct the histogram of Figure 4.1
***The addplot option available for histograms with the option discrete, in 
***which a new bin is drawn for each unique value of the variable being plotted, 
***allows a new plot to appear on the same set of coordinate axes. In this case,
***we want the added plot to have the same features of the first plot; namely, 
***having frequency on the y-axis and barwidth equal to 1. We used the Graph
***Editor to insert the labels on the x-axis, xold xnew.

histogram x, discrete frequency width(1) addplot(histogram v2xplus10, discrete frequency width(1))

***To transform height in inches to height in centimeters using the Basketball 
***data. 
***To load a dataset into active memory, substitute the path to the location of
***the dataset on your computer for the dots ...
use "C:\Users\Daniel\Downloads\stata_book\General Resources\Resources\Data_sets\Basketball.dta", clear

generate heightcm = heightin * 2.54

***To obtain the boxplots of Figure 4.2 using the Basketball data
graph box heightin heightcm 

***To obtain the boxplots of Figure 4.3 using NELS data
use "...NELS.dta", clear
gen slfcnc12x2 = 2*slfcnc12
gen slfcnc12xneg2 = -2*slfcnc12
gen slfcnc12xhalf = (1/2)*slfcnc12
graph box slfcnc12 slfcnc12x2 slfcnc12xneg2 slfcnc12xhalf
***To obtain the boxplots of Figure 4.4 using NELS data
gen slfcnc12plus5 = slfcnc12 + 5
gen slfcnc12minus5 = slfcnc12 - 5
graph box slfcnc12 slfcnc12plus5 slfcnc12minus5
***To obtain the histogram of Figure 4.5
***We may input the data (xold = 1, 2, 2, 3; xnew = 5, 6, 6, 7) directly into 
***Stata from the do file as follows:
clear all
input xold xnew
1 5
2 6
2 6
3 7
end
***list the data to verify that it is input correctly
list
***browse the Data Editor to verify that these data are in active memory          
browse
***Construct the histogram of Figure 4.5
***See the description of the histogram command for Figure 4.1

histogram xold, discrete frequency width(1) addplot(histogram xnew, discrete frequency width(1))
***To reverse the coding of a five-point Likert scale, assert, using the data in 
***Likert.dta
use "...Data for Example 4.4 -- Likert Scale.dta", clear

gen assertref = 6 - assert
label define likertref 1 "SD" 2 "D" 3 "N" 4 "A" 5 "SA"
label value assertref likertref
***To generate the standardized variable zses for ses we use the function std 
***using egen and the NELS data
use "...NELS.dta", clear
egen zses = std(ses)
***To obtain results for Example 4.8
graph box slfcnc12
egen zslfcnc12 = std(slfcnc12)
tabulate zslfcnc12 if abs(zslfcnc12) > 2
***Comparing scores in different distributions
graph box achrdg12, by(gender)
***To obtain the means and standard deviations of achrdg12 in the different 
***gender groups -- Table 4.2
table gender, contents(mean achrdg12 sd achrdg12) 
tabulate gender, summarize(achrdg12)
***To obtain non-linear transformations of the variable expinc30 -- log and sqrt
gen expinclg = log10(expinc30 + 1)  
gen expincsq = sqrt(expinc30 + 1)
***To obtain the boxplots of expinclg and expincsq in Figure 4.9
graph box expinclg
graph box expincsq
***To obtain a reflected and then translated version of slfcnc12
gen slfcnc12ref = -1*slfcnc12
gen slfcnc12reftr = slfcnc12ref + 44
***To obtain the boxplots of Figure 4.10
graph box slfcnc12 slfcnc12ref slfcnc12reftr
***To obtain a square root and log transformation of these variables
gen slfcnc12reftrsqrt = sqrt(slfcnc12reftr)
gen slfcnc12reftrlog = log10(slfcnc12reftr)
***To obtain boxplots of these transformed variables
graph box slfcnc12reftrsqrt slfcnc12reftrlog
***To obtain skewness statistics of all the original and transformed variables
tabstat slfcnc12 slfcnc12ref slfcnc12reftr slfcnc12reftrsqrt slfcnc12reftrlog, statistics(skewness)
***To obtain another type of nonlinear transformation -- a ranking -- using the 
***Hamburger data
use "...Hamburg.dta", clear
egen rfat = rank(fat) 
egen rcalories = rank(calories)
***To align a ranking of 1 with the variable's lowest value.
gen rkfat = 6 - rfat 
gen rkcalories = 6 - rcalories
***To obtain a listing of the original fat and calories variables and their 
***newly ranked form
list name fat calories rkfat rkcalories
***To reverse code the value from a Likert scaled item, assert, in the Likert 
***data set and to assign appropriate labels to the new values
use "...Data for EXample 4.4 -- Likert Scale.dta", clear
gen assertrec = 0
replace assertrec = 1 if assert == 5
replace assertrec = 2 if assert == 4
replace assertrec = 3 if assert == 3 
replace assertrec = 4 if assert == 2
replace assertrec = 5 if assert == 1
replace assertrec = . if assert == . 
label define likertrec 1 "SD" 2 "D" 3 "N" 4 "A" 5 "SA"
label value assertrec likertrec
***To collapse the number of categories of a variable, schtype8
gen schtypre = 0
replace schtypre = 1 if schtyp8 == 1
replace schtypre = 2 if schtyp8 == 2 | schtyp8 == 3
replace schtypre = .  if schtyp8 == .
***To recode a variable to be dichotomous by using a median split
gen slfcn8ms = 0
replace slfcn8ms = 1 if (slfcnc08 <= 21)
replace slfcn8ms = 2 if (slfcnc08 >= 22)
replace slfcn8ms = . if slfcnc08 == .

