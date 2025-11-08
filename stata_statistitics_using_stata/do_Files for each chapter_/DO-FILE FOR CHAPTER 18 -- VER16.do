version 16
***CHAPTER 18
***To obtain Figure 17.1
twoway function y=chi2den(1,x), range(0  3.5) lcolor(black) /// 
       xtitle(" Chi-Square with 1 df") legend(off) ///
	   xlabel(.00 .50 1.00 1.50 2.00 2.50 3.00 3.50) ///
	   ytitle(" Density")

***To obtain Figure 17.2
twoway function y=chi2den(2,x), range(0  12.00) lcolor(black) /// 
       xtitle(" Chi-Square with 2 df") legend(off) ///
	   xlabel(0.00 2.00 4.00 6.00 8.00 10.00 12.00) ///
	   ytitle(" Density")

***To obtain Figure 17.3
twoway function y=chi2den(4,x), range(0  30.00) lcolor(black) /// 
       xtitle(" Chi-Square with 4 df") legend(off) ///
	   xlabel(0.00 5.00 10.00 15.00 20.00 25.00 30.00) ///
	   ytitle(" Density")
	   
twoway function y=chi2den(9,x), range(0  30.00) lcolor(black) /// 
       xtitle(" Chi-Square with 9 df") legend(off) ///
	   xlabel(0.00 5.00 10.00 15.00 20.00 25.00 30.00) ///
	   ytitle(" Density")

***To results for obtain Example 17.1
display chi2tail(3, 23.19)

***To input the data for the Chi-Square Goodness of Fit test on Tabulated Data
clear all
input car_type freq
1 150
2  65
3 385
4 400
end
list
label define car 1 "Nissan" 2 "Mazda" 3 "Toyota" 4 "Honda"
label value car_type car
codebook car_type

findit csgof
***Note that the csgof command expects there to be one observation per subject in the dataset.
***Because our data set is in tabulated form, we need to use the STATA command expand to place the 
***dataset into the form required by csgof with only one observation per subject.  For this example,  
***that would mean 150 rows of type 1 cars, 65 rows of type 2 cars, 385 rows of type 3 cars, and 400 
***rows of type 4 cars. The expand freq command will accomplish this change in dataset form so that we may use csgof.
expand freq
csgof car_type, expperc(18 10 35 37) /*if no expected percentages are provided as an option, expected %'s are assumed to be equal*/

***To obtain results to Example 17.3 on non-tabulated Raw Data
csgof region 

***To obtain the p-value results for the Chi Square Test of Independence calculated by hand
display chi2tail(2, 20.19)

***To obtain results for the Chi Square Test of Independence using STATA on Tabulated Data
clear all
input gender ppa freq
1	1	40
2	1	60
1	2	10
2	2	20
1	3	50
2	3	20
end
list
label variable ppa"political party affiliation"
label variable freq "frequency" 
label define gender 1 "male" 2 "female"
label value gender gender
label define ppa 1 "Democrat" 2 "Republican" 3 "Neither"
label value ppa ppa
codebook
tabulate gender ppa [fweight = freq], chi2

***The Chi Square Test of Independence Using the immediate command tabi 

***tabi is an example of what is called an immediate command in Stata as it does 
***not access data in memory, but executes the command immediately on the data 
***typed on the command line. We begin with the command clear, to clear the
***data in active memory and begin with a clean slate.  For this example, the 
***first three values form the 1st row of the crosstabs table and the second
***three values form the second row.  Once input, we may run the tabi command 
***as shown to obtain the chi-squared test of independence. The word expected 
***prints the expected frequencies along with observed frequencies in the 
***output.  The word replace replaces whatever data is in active memory with  
***the current data using STATA-defined variable names, row (which represents 
***gender, in this example), col (which represents political party
***affiliation), and pop for the observed frequency.  We can edit the dataset 
***using the command edit, as shown, to relabel the variables and save the file 
***to whatever location we wish in our computer.
clear
tabi 40 10 50\ 60 20 20, replace chi2 expected
edit

***To obtain the results for Example 17.3 -- The Chi-Square Test of Independence 
***on tabulated data
***To load a dataset into active memory, substitute the path to the location of
***the dataset on your computer for the dots ...
use "...NELS.dta", clear
tab gender nursery, chi2 expected

***In the case of two dichotomous variables -- an alternative to the chi-squared 
***test of independence
tab gender nursery, chi2 expected
pwcorr nursery gender, obs star(5)

***To obtain the results for Example 17.3a -- Fisher's Exact Test on tabulated 
***Data. We first input the data 
clear all
input gender nursery freq
1	1	2
2	1	6
1	2	4
2	2	0
end
list
label variable freq "frequency" 
label define gender 1 "male" 2 "female"
label value gender gender
label define nursery 1 "no" 2 "yes" 
label value nursery nursery
codebook
list
tabulate gender nursery [fweight = freq], chi2 exact

***Alternatively, we can use the immediaate command tabi as follows:
tabi 2 6 \4 0 , chi2 exact

***To obtain Fisher's Exact Test by hand for Table 17.A
display exp(lnfactorial(8)+lnfactorial(4)+lnfactorial(6)+lnfactorial(6))/   ///
        exp(lnfactorial(12)+lnfactorial(2)+lnfactorial(6)+lnfactorial(4)+lnfactorial(0))

***To obtain Fisher's Exact Test for Table 17.B by hand
display exp(lnfactorial(8)+lnfactorial(4)+lnfactorial(6)+lnfactorial(6))/   ///
        exp(lnfactorial(12)+lnfactorial(3)+lnfactorial(5)+lnfactorial(3)+lnfactorial(1))

***To obtain Fisher's Exact Test for Table 17.B using Stata
clear all
input gender nursery freq
1	1	3
2	1	5
1	2	3
2	2	1
end
list
label variable freq "frequency" 
label define gender 1 "male" 2 "female"
label value gender gender
label define nursery 1 "no" 2 "yes" 
label value nursery nursery
list
codebook
tabulate gender nursery [fweight = freq], chi2 exact 

***Alternatively, we can use the immediaate command tabi as follows:
tabi 3 5 \3 1, chi2 exact

***To obtain results to Example 17.4 -- The Chi-Square Test of Independence on 
***Raw Data
use "...NELS.dta", clear
tabulate region computer, chi2 

***To obtain results for Example 17.5 -- The Wilcoxon Sign Test
clear all
input recordwt actualwt
11.5 11.8
10.0 10.0
17.0 16.5
16.0 16.0
12.5 13.0
9.0   9.5
8.75  9.0
6.0   6.0
8.0   8.2
20.5 19.5
5.75 6.20
16.0 16.2
end
list
signtest recordwt = actualwt

***To obtain results for Example 17.6 -- The Mann-Whitney U Test 
clear all
input sample score
1 14
1 17
1 18
1 25
2  7
2 13
2 15
2 16
2 12
end

***To obtain results for Example 17.7 -- The Mann-Whitney U Test
ranksum score, by(sample)
clear all
input sample score
1 25
1 32
1 16
1 11
1 29
1 31
1 22
1 15
2  9
2 10
2 12
2 26
2 24
end
ranksum score, by(sample)

***Switching Sample 1 and Sample 2 in Example 17.7 -- The Mann-Whitney U Test  
clear all
input sample score
1  9
1 10
1 12
1 26
1 24
2 25
2 32
2 16
2 11
2 29
2 31
2 22
2 15
end
ranksum score, by(sample)

***To obtain results for Example 17.8 -- Kruskal-Wallis Test
clear all
input group time 
1 48
1 42
1 40
1 46
1 35
1 39
1 32
1 41
2 28
2 33
2 26
2 34
2 29
2 36
2 31
2 22
2 21
2 17
3 15
3 19
3 20
3 25
3 18
3 27
3 16
end
list
kwallis time, by(group) 
