version 16
***CHAPTER 13

***To obtain Figure 13.1

twoway function y1=normalden(x, -3, .5), range(-4.5 -1.5) lcolor(black) || /// 
       function y2=normalden(x,  0, .5), range(-1.5  1.5) lcolor(black) || ///
	   function y3=normalden(x,  3, .5), range( 1.5  4.5) lcolor(black)    ///
       xtitle(" Manual Dexterity Score (x)")legend(off)                    ///
	   xlabel(-4.5 -3 -1.5 0 1.5 +3 4.5) ytitle(" Density")

***To obtain Figure 13.2	   
twoway function y1=normalden(x, -3, 3), range(-12 6) lcolor(black) ||     /// 
       function y2=normalden(x,  0, 3), range(-9 +9) lcolor(black) ||     ///
	   function y3=normalden(x,  3, 3), range(-6  12) lcolor(black)       ///
       xtitle(" Manual Dexterity Score (x)")legend(off) ///
	   xlabel(-12 -10.5 -9 -7.5 -6 -4.5 -3 -1.5 0 1.5 +3 4.5 6 7.5 9 10.5 12) ///
	   ytitle(" Density")

***To obtain Figure 13.3(a)
twoway function y=Fden(1,27,x), range(0  3) lcolor(black)         /// 
       xtitle(" F(1,27)") legend(off)                             ///
	   xlabel(.00 .30 .60 .90 1.20 1.50 1.80 2.10 2.40 2.70 3.00) ///
	   ytitle(" Density")

***To obtain Figure 13.3(b)
twoway function y=Fden(2,27,x), range(0  3) lcolor(black)         /// 
       xtitle(" F(2,27)") legend(off)                             ///
	   xlabel(.00 .30 .60 .90 1.20 1.50 1.80 2.10 2.40 2.70 3.00) ///
	   ytitle(" Density")

***To obtain Figure 13.3(c)
twoway function y=Fden(4,27,x), range(0  3) lcolor(black)         /// 
       xtitle(" F(4,27)") legend(off) ///
	   xlabel(.00 .30 .60 .90 1.20 1.50 1.80 2.10 2.40 2.70 3.00) ///
	   ytitle(" Density")

***To obtain Figure 13.3(d)
twoway function y=Fden(16,27,x), range(0  3) lcolor(black)        /// 
       xtitle(" F(16,27)") legend(off) ///
	   xlabel(.00 .30 .60 .90 1.20 1.50 1.80 2.10 2.40 2.70 3.00) ///
	   ytitle(" Density")
	   
***To obtain the area to the right of F(2,3)=2.28
display Ftail(2,3, 2.28)
 
***To access the data in the ManDext.dta data file and carry out the one-way 
***anova on these data
***To load a dataset into active memory, substitute the path to the location of
***the dataset on your computer for the dots ...
use "...ManDext.dta", clear
describe
oneway ManualDex Treatment, tabulate
tabstat ManualDex, by (Treatment) statistics(n mean sd min max skewness) 
by Treatment, sort: summarize ManualDex, detail

***The oneway command performs Bartlett's test for homogeneity of variance 
***along with the one-way anova. The Levene's test however, is more robust to
***violations of underlying assumptions, and may be obtained using Stata's 
***robvar command (which stands for robust variance tests) .  The output for
***Levene's test is associated with the test statistic W0 reported in the 
***Output Window.
robvar ManualDex, by(Treatment)

***To obtain the results from EXAMPLE 13.2
use "...NELS.dta", clear
graph box unitmath, over(region) marker(1, mlabel(id))

oneway unitmath region, tabulate  
***the option tabulate prints a table of means and standard deviations of                                    
***unitmath as well as of frequencies for each region.

***To see if the bootstrap-estimated F-statistic, which is robust to the 
***assumption of homogeneity of variance, is statistically significant.

bootstrap F_bs=r(F), reps(1000) nodots seed(999): oneway unitmath region, tabulate 
***the nodots option suppresses the printing of rows of dots in the Output Window
***which otherwise would track the execution of this iterative bootstrap command
                                                        
estat bootstrap, all 
***prints the bootstrap-estimated F-statistic value with normal-theory, 
***percentile, and bias-corrected percentile confidence intervals
                                                                                                        
***Note: Because the F-statistic is a ratio of variances, it will always be 
***positive and so we cannot use our usual method for judging whether a 
***statistic is significant by whether the value of 0 is contained in
***the confidence interval or not.  Nevertheless, printing these confidence 
***intervals will tell us how close to zero the lower bound of the F-statistic 
***is.

***To obtain the results from EXAMPLE 13.3
use "...ManDext.dta", clear
oneway ManualDex Treatment, bonferroni scheffe

***Alternatively, we may use the pwmean command as follows:
pwmean ManualDex, over(Treatment) mcompare(bonferroni) effects
pwmean ManualDex, over(Treatment) mcompare(scheffe) effects

***To obtain the respective LSD (unadjusted) and Tukey tests, we follow the 
***statistically significant one-way anova with the pwmean command, which  
***stands for pairwise mean comparisons.

pwmean ManualDex, over(Treatment) mcompare(noadj) effects
pwmean ManualDex, over(Treatment) mcompare(tukey) effects

***To obtain the results from EXAMPLE 13.4
use "...NELS.dta", clear
oneway unitmath region, bonferroni scheffe
pwmean unitmath, over(region) mcompare(noadj) effects
pwmean unitmath, over(region) mcompare(tukey) effects

***To obtain the results from EXAMPLE 13.5
***We first re-code the variable hsprog into three categories from four and
***then check the distribution of observations across the four hsprog 
***categories.
use "...NELS.dta", clear
edit
tabulate hsprog

***We place the word capture before the recode command so that we may overwrite 
***an existing variable without getting an error message. The error message
***would halt the execution of the recode command and all subsequent commands 
***in the do-file.
capture recode hsprog (1 = 1 "Rigorous Academic") (2 = 2 "Academic")     ///
                      (3/4 = 3 "Some Vocational & Other"), gen(hsprog3)

***It is useful to verify that the recoding was carried out as intended.
tabulate hsprog3

***We are now ready to proceed with EXAMPLE 13.5
graph box slfcnc12, over(hsprog3)marker(1, mlabel(id))
oneway slfcnc12 hsprog3, tabulate 
robvar slfcnc12, by(hsprog3)

***To obtain the results from EXAMPLE 13.6
graph box schattrt, over(region) marker(1, mlabel(id))

graph box schattrt if id != 396 & id != 64, over(region) marker(1, mlabel(id))

oneway schattrt region, tabulate 
robvar schattrt, by(region)

oneway schattrt region if id != 396 & id != 64, tabulate bonferroni scheffe
pwmean schattrt, over(region) mcompare(noadj) effects
pwmean schattrt, over(region) mcompare(tukey) effects

***To obtain the results from EXAMPLE 13.7
tabulate urban

ttest ses if urban == 1 | urban == 3, by(urban) 
ttest ses if urban == 2 | urban == 3, by(urban)

***To obtain the results from EXAMPLE 13.8
graph box achmat12 achrdg12 achsci12 achsls12, over(gender)            ///
    marker(1, mlabel(id)) marker(2, mlabel(id)) marker(3, mlabel(id))  ///
	marker(4, mlabel(id))
tabstat achmat12 achrdg12 achsci12 achsls12, by (gender)               ///
        statistics(n mean sd min max skewness) 	
ttest achmat12, by(gender)
ttest achrdg12, by(gender)
ttest achsci12, by(gender)
ttest achsls12, by(gender)  

***To obtain the results of Example 13.9 -- power analysis for one-way anova
***where the sizes of the groups are equal (balanced design)
power oneway, ngroups(3) varmeans(.059) varerror(.941) alpha(.05) power(.80)

***To obtain the results of Example 13.10 -- power analysis for one-way anova
***where the sizes of the groups are not equal (unbalanced design)

power oneway, ngroups(3) varmeans(.0625) varerror(1.00) grweights(1 2 2) ///
              alpha(.05) power(.80)

