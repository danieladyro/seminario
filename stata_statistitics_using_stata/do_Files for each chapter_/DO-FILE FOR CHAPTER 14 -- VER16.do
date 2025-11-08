version 16
***CHAPTER 14

***To access the data in the ManDext.dta data file 
***To load a dataset into active memory, substitute the path to the location of
***the dataset on your computer for the dots ...
use "...ManDext.dta", clear
describe
codebook

***To obtain Table 14.4
table Sex Treatment, contents(n ManualDex mean ManualDex sd ManualDex)   ///
                     row col format(%6.2f) 
tabulate Sex Treatment, summarize(ManualDex) 

***To run the two-way anova with interaction 
anova ManualDex Sex Treatment Sex#Treatment
***To obtain the cell means using the command predict
capture predict yhat

***To graph yhat (vertical axis) vs Treatment (horizontal axis): Figure 14.2
***One may plot the values from the predict command contained in yhat

graph twoway (scatter yhat Treatment if Sex == 1, connect(L) lpattern(dash)  ///
             lcolor(black)lwidth(medthick)mcolor(black))                     ///
             (scatter yhat Treatment if Sex == 2, connect(L) lpattern(solid) ///
	         lcolor(black)lwidth(medthick) mcolor(black)),                   ///
			 legend(order(1 "Males" 2 "Females")) xlabel(1 2 3)              ///
             ytitle("Mean Manual Dexterity")                                 ///
             title("Manual Dexterity by Sex and Treatment")
			
***To graph yhat vs the variable dichotomous male on the horizontal axis we use 
***the following command using the predicted yhat values
graph twoway (scatter yhat Sex if Treatment == 1, connect(L)lpattern(dash)   ///
              lcolor(black)lwidth(medthick)mcolor(black))                    ///
             (scatter yhat Sex if Treatment == 2,connect(L)lpattern(longdash_dot) ///                            ///
	          lcolor(black)lwidth(medthick)mcolor(black))                    ///
             (scatter yhat Sex if Treatment == 3,connect(L)lpattern(solid)   ///
	          lcolor(black)lwidth(medthick)mcolor(black)),xlabel(1 2)        ///
	          legend(order(1 "Treatment 1" 2 "Treatment 2" 3 "Treatment 3")) ///
		      ytitle("Predicted Manual Dexterity Cell Means")                                         
	     	   
***To graph Figures 14.3 and 14.4(a) through 14.4(d) using twoway line
use "...ManDext2.dta", clear

***To graph an ordinal interaction -- using a hypothetical variable, yhat2, in 
***the ManDext2 dataset -- Figure 14.3 -- with different colors for the lines
twoway (line yhat2 Treatment if Sex == 1, lpattern(dash)lcolor(blue))   ///
       (line yhat2 Treatment if Sex == 2, lpattern(solid)lcolor(red)),  ///
       legend(label(1 "Males") label(2 "Females")) xlabel(1 2 3)        ///
	   ytitle("Predicted Cell Means for Manual Dexterity") 
 
***To graph no interaction -- using a hypothetical variable, yhat3, in the 
***ManDext2 dataset -- Figure 14.4(a) -- with a positive trend

twoway (line yhat3 Treatment if Sex == 1, lpattern(dash)lcolor(black))    ///
       (line yhat3 Treatment if  Sex == 2, lpattern(solid)lcolor(black)), ///
       legend(label(1 "Males") label(2 "Females")) xlabel(1 2 3)          ///
	   ytitle("Predicted Cell Means for Manual Dexterity") 
	   
***To graph no interaction -- using a hypothetical variable, yhat4, in the 
***ManDext2 dataset -- Figure 14.4(b) -- with a negative trend

twoway (line yhat4 Treatment if Sex == 1, lpattern(dash) lcolor(black))    ///
       (line yhat4 Treatment if  Sex == 2, lpattern(solid) lcolor(black)), ///
       legend(label(1 "Males") label(2 "Females"))xlabel(1 2 3)            ///
	   ytitle("Predicted Cell Means for Manual Dexterity") 
	   
***To graph no interaction -- using a hypothetical variable, yhat5, in the 
***ManDext2 dataset -- Figure 14.4(c) -- with a reversal in trend
twoway (line yhat5 Treatment if Sex == 1, lpattern(dash) lcolor(black))    ///
       (line yhat5 Treatment if  Sex == 2, lpattern(solid) lcolor(black)), ///
       legend(label(1 "Males") label(2 "Females"))xlabel(1 2 3)            ///
	   ytitle("Predicted Cell Means for Manual Dexterity") 

***To graph no interaction -- using a hypothetical variable, yhat6, in the 
***ManDext2 dataset -- Figure 14.4(d) -- with a reversal in trend
twoway (line yhat6 Treatment if Sex == 1, lpattern(dash) lcolor(black))    ///
       (line yhat6 Treatment if  Sex == 2, lpattern(solid) lcolor(black)), ///
       legend(label(1 "Males") label(2 "Females")) xlabel(1 2 3)           ///
	   ytitle("Predicted Cell Means for Manual Dexterity") 
	   
***To graph a clustered bar graph analogous to Figure 14.2 -- Figure 14.5
use "...ManDext.dta", clear

***To change the color of the bars, open the graph to view and click on 
***File/Start Graph Editor and click the bar you want to have a different 
***color and follow the prompts. Save the graph before exiting the Graph Editor. 
graph bar yhat, over(Sex) over(Treatment) asyvars                           ///
                ytitle("Predicted Cell Means for Manual Dexterity")

***To obtain a compact table of skewness statistics only
statsby skew=r(skewness), by(Treatment Sex):                                ///
        summarize ManualDex, detail
tabdisp Sex Treatment, cell(skew)	   

***To obtain a more complete set of summary statistics (esp. skewness) for each 
***category of Treatment within categories of Sex
by Sex Treatment, sort : summarize ManualDex, detail

***To obtain the standard error of skewness and the skewness ratio for each 
***category of Treatment within categories of Sex
net install summskewcell, from(URL GOES HERE)
summskewcell ManualDex Treatment Sex

display Ftail(1, 24, .12) 
display Ftail(2, 24, 40.13)
display Ftail(2, 24, 15.69)

anova ManualDex Sex Treatment Sex#Treatment
capture predict yhat

***To test for homogeneity of variance using Levene’s test
egen cell = group(Treatment Sex)
robvar ManualDex, by(cell)

***To obtain Figure 14.6 -- same as how Figure 14.2 was obtained. 
graph twoway (scatter yhat Treatment if Sex == 1, connect(L) lpattern(dash)  ///
             lcolor(black)lwidth(medthick)mcolor(black))                     ///
             (scatter yhat Treatment if Sex == 2, connect(L) lpattern(solid) ///
	         lcolor(black)lwidth(medthick) mcolor(black)),                   ///
			 legend(order(1 "Males" 2 "Females")) xlabel(1 2 3)              ///
             ytitle("Mean Manual Dexterity")                                 ///
             title("Manual Dexterity by Sex and Treatment")
		
*OR*
anova ManualDex i.Sex i.Treatment i.Sex#i.Treatment
margins Sex#Treatment
marginsplot, xdim(Treatment) noci                                                  ///
             plot1opt(lpattern(dash) lcolor(gs5) mcolor(gs5))                ///
             plot2opt(lpattern(solid) lcolor(gs5) mcolor(gs5))               ///
			 ytitle("ManualDext")subtitle("Manual Dexterity Data")           ///
             title ("Analysis of Manual Dexterity by Sex & Treatment")       /// 
	         legend(order(1 "Males" 2 "Females"))

***To obtain the tests of simple effects, we use the margins command for the 
***interaction, which produces a list of adjusted cell means (also called   
***estimated marginal means) and their standard errors.
 
quietly anova ManualDex Sex Treatment Sex#Treatment
quietly margins Sex#Treatment

***We first examine the simple effects for Treatment at each level of Sex 
***(i.e., whether there are mean differences across Treatments for females 
***and separately for males) using the contrast command.   
contrast Treatment@Sex
 
**To see which treatments differ from the reference or base category (the base 
**is by default, Treatment 1)for males and for females, we once again use the 
**contrast command, adding a bonferroni adjustment  as well as the effects option
contrast r.Treatment@Sex, effects mcompare(bonferroni) 

**To contrast without the Bonferroni adjustment
contrast r.Treatment@Sex, effects  

*Changing the base from Treatment 1 to Treatment 3 -- group coded 3.
fvset base 3 Treatment
contrast r.Treatment@Sex, effects mcompare(bonferroni) 

**More complicated alternative -not necessary- included here for completeness.
**For this approach, we need to include the post option on the margins command.
** Because there are only 2 levels of stress, each simple effect test has K-1 or
** 2-1=1 degree of freedom and so each test is composed of a single contrast
** enclosed in a set of parentheses. 
/*
quietly anova ManualDex Sex Treatment Sex#Treatment
margins Sex#Treatment, post
test (1.Sex#1.Treatment == 1.Sex#2.Treatment)                            ///
     (1.Sex#1.Treatment == 1.Sex#3.Treatment)                             
test (2.Sex#1.Treatment == 2.Sex#2.Treatment)                            ///
     (2.Sex#1.Treatment == 2.Sex#3.Treatment)  
*/

***We now examine the simple effects for Sex at each level of Treatment 
***(i.e., whether there are mean differences across males and females 
***at each Treatment level) using the contrast command.                         
contrast Sex@Treatment, effects mcompare(bonferroni)

***Another approach for carrying out a simple effects analysis is to use the 
***user-defined program anovalator, which may be installed on your computer
***using the findit command, and in particular:
findit anovalator
***When this command is executed, a new window will appear that instructs you 
***on how to install this program and gives documentation about the program.
***Once installed, you can run the following sequence of commands using the 
***program. You should obtain the same results as we did earlier.

anova ManualDex Sex Treatment Sex#Treatment

anovalator Treatment Sex, simple fratio
anovalator Treatment, main fratio at(Sex=1)
anovalator Treatment, main fratio at(Sex=2)

anovalator Sex Treatment, simple fratio
anovalator Sex, main fratio at(Treatment=1)
anovalator Sex, main fratio at(Treatment=2)
anovalator Sex, main fratio at(Treatment=3)
 
***To obtain all possible pairwise comparisons between adjusted cell means we 
***use the pwcompare command. We adjust the alpha associated with these tests
***using the Bonferroni adjustment. The group option displays a table of means 
***with codes that indicate which groups have means that are not
***significantly different from each other.

anova ManualDex Sex Treatment Sex#Treatment
pwcompare Sex#Treatment, mcompare(bonferroni) group

***To obtain the results of EXAMPLE 14.3

use "...Wages.dta", clear
describe
tabulate ed sex, summarize(wage)

anova wage sex ed sex#ed
predict yhat

*** To graph the estimated cell means for each sex with ed on the x-axis

sort sex ed 
graph twoway (scatter yhat ed if sex == 0, connect(L)                    ///
              lpattern(dash)lcolor(black))                               ///
			 (scatter yhat ed if sex == 1, connect(L)                    ///                  
			  lpattern(solid)lcolor(black)),                             ///
              legend(label(1 "Males") label(2 "Females"))                ///
			  ytitle("Predicted Cell Means for Wages") 	  

***To compute all pairwise comparisons between education levels. 
***The option effects displays a table of mean differences with p-values and 
***confidence intervals
pwcompare ed, mcompare(tukey) effects 
***Alternatively, given there is no interaction, we may use the pwmean command 
***as follows.
pwmean wage, over(ed) mcompare(tukey) effects

***To obtain the five figures of Exercise 14.1
use "...Data for Figures at end of Chapter 14.dta", clear

sort sex method 
graph twoway (scatter score1 method if sex == 1,                           ///
              lpattern(dash)lcolor(black) c(L))                            ///
			 (scatter score1 method if sex == 2,                           ///
			  lpattern(solid)lcolor(black) c(L)),                          ///
              legend(label(1 "Males") label(2 "Females"))                  /// 
			  ytitle("Reading Achievement Means")                          ///
			  xlabel(1 "Whole Language" 2 "Synthetic Phonics"              ///
			  3 "Analytic Phonics")
			  

graph twoway (scatter score2 method if sex == 1,                           ///
              lpattern(dash)lcolor(black) c(L))                            ///
			 (scatter score2 method if sex == 2,                           ///
			  lpattern(solid)lcolor(black) c(L)),                          ///
              legend(label(1 "Males") label(2 "Females"))                  /// 
			  ytitle("Reading Achievement Means")                          ///
			  xlabel(1 "Whole Language" 2 "Synthetic Phonics"              ///
			  3 "Analytic Phonics") 
			  
			  
graph twoway (scatter score3 method if sex == 1,                           ///
              lpattern(dash)lcolor(black) c(L))                            ///
			 (scatter score3 method if sex == 2,                           ///
			  lpattern(solid)lcolor(black) c(L)),                          ///
              legend(label(1 "Males") label(2 "Females"))                  ///
			  ytitle("Reading Achievement Means")                          ///
			  xlabel(1 "Whole Language" 2 "Synthetic Phonics"              ///
			  3 "Analytic Phonics")
			  
			  
graph twoway (scatter score4 method if sex == 1,                           ///
              lpattern(dash)lcolor(black) c(L))                            ///
			 (scatter score4 method if sex == 2,                           ///
			  lpattern(solid)lcolor(black) c(L)),                          ///
              legend(label(1 "Males") label(2 "Females"))                  ///
			  ytitle("Reading Achievement Means")                          ///
			  xlabel(1 "Whole Language" 2 "Synthetic Phonics"              ///
			  3 "Analytic Phonics")
			  
graph twoway (scatter score5 method if sex == 1,                           ///
              lpattern(dash)lcolor(black) c(L))                            ///
			 (scatter score5 method if sex == 2,                           ///
			  lpattern(solid)lcolor(black) c(L)),                          ///
              legend(label(1 "Males") label(2 "Females"))                  ///
			  ytitle("Reading Achievement Means")                          ///
			  xlabel(1 "Whole Language" 2 "Synthetic Phonics"              ///
			  3 "Analytic Phonics")

***To obtain the results for Example 14.4 -- power analysis for two-way ANOVA
***To find the sample size for the test of the main effect due to columns.  
power twoway, alpha(0.05) power(0.80) nrows(3) ncols(4) factor(col)       /// 
              vareffect(0.0625) varerror(1.00)
			  
***To find the sample size for the test of the row by column interaction effect.
power twoway, alpha(0.05) power(0.80) nrows(3) ncols(4) factor(rowcol)   /// 
              vareffect(.0625) varerror(1)



