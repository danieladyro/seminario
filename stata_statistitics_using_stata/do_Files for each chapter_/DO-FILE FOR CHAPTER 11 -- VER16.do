version 16
***CHAPTER 11
***To obtain Figure 11.1

***To obtain the results related to Example 11.1
display invttail(20, .025) 

***To obtain the Blood dataset in working memory
***To load a dataset into active memory, substitute the path to the location of
***the dataset on your computer for the dots ...
use "...Blood.dta", clear

***To obtain descriptives of systolc1 
summarize systolc1, detail

***To examine the normality of this variable using qnorm,a histogram and a 
***customized histogram

qnorm systolc1 /*Figure 11.2*/
histogram systolc1, freq normal /*Figure 11.3*/
histogram systolc1, freq normal xlabel(95(5)140) xtick(95(5)140) width(10) ///
          title(Customized histogram of systolc1) /*Figure 11.4*/

**To obtain the skewness ratio of systolc1
summskew systolc1

***OR USING THE OPTIONAL CODE:
/* */
summarize systolc1, detail
quietly summarize systolc1, detail
capture local n = r(N)
capture local skew = r(skewness)
capture local seskew = sqrt((6*(`n')*(`n' - 1))/((`n' - 2)*(`n' + 1)*(`n' + 3)))
capture local skew_ratio = `skew'/`seskew'
display "skewness = " `skew' "; seskew = " `seskew' " ; skewness ratio = " `skew_ratio'
/* */

***To obtain the 95% confidence interval for the population mean of systolc1 when sigma is not known
ttest systolc1 == 0

***To obtain the results related to Example 11.2, which includes univariate statistics including the skewness ratio
use "...NELS.dta", clear
summarize unitmath, detail, if gender == 1 & region == 3


/* To obtain the skewness ratio */
***skewanova has the form: skewanova y cat1 cat2, where y is a continuous variable and cat1 and cat2
***are two categorical variables
summskewcell unitmath gender region 

/* To obtain the skewness ratio using the OPTIONAL CODE */
/* */
summarize unitmath, detail, if gender == 1 & region == 3
capture local n = r(N)
capture local skew = r(skewness)
capture local seskew = sqrt((6*(`n')*(`n' - 1))/((`n' - 2)*(`n' + 1)*(`n' + 3)))
capture local skew_ratio = `skew'/`seskew'
display "skewness = " `skew' "; seskew = " `seskew' " ; skewness ratio = " `skew_ratio'
/* */

qnorm unitmath if gender == 1 & region == 3 /*Figure 11.5*/
ttest unitmath == 0 if (gender == 1 & region == 3)

***To obtain the results relate to Example 11.3
ttest unitmath == 0, level(99), if gender == 1 & region == 3

***To obtain the results relate to Example 11.4
use "...Blood.dta", clear
display t(20, -2.86)
ttest systolc1 == 120
display "d = " (114-120)/9.60 /*To obtain the Effect Size for this problem*/

***To obtain the results related to Example 11.5
use "...NELS.dta", clear
ttest unitmath == 3 if gender == 1 & region == 3
display "d = " (3.66-3)/.72 /*To obtain the Effect Size for this problem*/

***To obtain the results related to Example 11.6
ttest unitmath == 3 if gender == 0 & region == 3) 
display "d = " (3.92-3)/.74 /*To obtain the Effect Size for this problem*/

***To obtain Table 11.1
table gender if region == 3, contents(n unitmath mean unitmath sd unitmath min unitmath max unitmath) center

***To obtain results related to Example 11.7
use "...Blood.dta", clear
by treatmen, sort: summarize systolc1, detail 
summskew systolc1, by(treatmen)

***OPTIONAL code for finding the skewness statistics for this example
/* */
summarize treatmen, detail
display "maximum number of groups = " r(max)
display "minimum number of groups = " r(min)
global k = r(max)
global m = r(min)

forval i = $m (1) $k {
quietly summarize systolc1 if treatmen == `i', detail
capture drop n skew seskew skew_ratio
gen n = r(N)
gen skew = r(skewness)
gen seskew = sqrt((6*(n)*(n - 1))/((n - 2)*(n + 1)*(n + 3)))
gen skew_ratio = skew/seskew
display "For treatmen = " `i' ": skewness = " skew "; seskew = " seskew " ; skewness ratio = " skew_ratio
} 
/* */

display ttail(19, .356)
display invttail(19, .025)

ttest systolc1, by(treatmen)
robvar systolc1, by(treatmen)

***To obtain the resuts related to Example 11.8
use "...NELS.dta", clear
graph box unitmath, over(gender)
ttest unitmath if region == 3, by(gender) 
robvar unitmath if region == 3, by(gender)

***If Levene's test were statistically significant, suggesting that the homogeneity of variance assumption is not met, 
***we would add the option, unequal to the ttest command, and interpret these results.
 
ttest unitmath if region == 3, by(gender) unequal  

***Effect Size Calculations, d and point biserial for Example 11.8

display "d = " (3.917-3.664)/sqrt(((65)*(.737)^2 +(83)*(.723)^2)/(66+84-2))
twoway (scatter unitmath gender) (lfit unitmath gender) if region ==3
correlate gender unitmath if region == 3 

***To obtain the results related to Example 11.9

graph box achmat12 if region == 1, over(computer) caption ("Computer Owned in 8th Grade By Family?")

by computer, sort: summarize achmat12 if region == 1, detail
ttest achmat12 if region == 1, by(computer)
robvar achmat12 if region == 1, by(computer)

***To find the critical t-value for Equation (11.15)

/*  display invttail(df, p), where df = the number of pairs - 1 (N-1), p = alpha level, two-tailed*/

***To obtain the results for Example 11.10 -- Paired t-test -- systolic blood pressure over time
use "...Blood.dta", clear
summarize systolc1 systolc2
display ttail(20, 1.19) /*To find the p-value associated with a t-value of 1.19 with 20 df*/
ttest systolc1 == systolc2

***To obtain the results for Example 11.11 -- Paired t-test -- self-esteem in 8th grade versus 12th grade
***Starting with a boxplot and descriptives
use "...NELS.dta", clear
graph box slfcnc08 slfcnc12 if gender == 1 & region == 3
summarize slfcnc08 slfcnc12 if gender == 1 & region == 3

ttest slfcnc08 == slfcnc12 if gender ==1 & region == 3

***To obtain the results for Example 11.12 -- Obtaining Bootstrap Estimates for Example 11.2

bootstrap mean = r(mu_1), reps(1000): ttest unitmath == 0 if region == 3 & gender == 1

***To obtain the results for Example 11.13 -- Obtaining Bootstrap Estimates for Example 11.5

bootstrap mean = r(mu_1), reps(1000) nodots seed(12345): ttest unitmath == 3 if region == 3 & gender == 1

***To obtain modified results for Example 11.13 -- Modified to estimate mu-3 rather than mu itself.
***Notice that the boostrap estimate we seek is in parentheses following the equal sign. 

bootstrap mean_minus_3 = (r(mu_1) - 3), reps(1000) nodots seed(12345): ttest unitmath == 3 if region == 3 & gender == 1

***To obtain the results for Example 11.14 -- Obtaining Bootstrap Estimates for Example 11.8

bootstrap meanmale_minus_meanfem = (r(mu_1) - r(mu_2)), reps(1000) nodots seed(1765): ttest unitmath if region == 3, by (gender)

***To obtain the results for Example 11.15 -- Obtaining Bootstrap Estimates for Example 11.11

bootstrap meandiff = (r(mu_1) - r(mu_2)), reps(1000) nodots seed(1765): ttest slfcnc08 == slfcnc12 if gender == 1 & region == 3

***To obtain the results for Example 11.16 -- power analysis for one-sample two-tailed t-test
power onemean 100 102, alpha(0.05) power(0.80) sd(10)

***To obtain the results for Example 11.17 -- power analysis for one-sample one-tailed t-test
power onemean 100 102, alpha(0.05) power(0.80) sd(10) onesided

***To obtain the results for Example 11.18 -- power analysis for two independent samples two-tailed t-test
power twomeans 100 110, nratio(1) sd1(20) sd2(20) alpha(0.05) power(0.80) 

***Simpler form of the earlier command given homogeneity of variance and both groups have the same variance
power twomeans 100 110, nratio(1) sd(20) alpha(0.05) power(0.80)

***To obtain the results for Example 11.19 -- power analysis for paired-sample two-tailed t-test
power pairedmeans 100 110, sddiff(20) alpha(0.05) power(0.80) 
