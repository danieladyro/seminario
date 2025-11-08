version 16
***CHAPTER 15

***To load a dataset into active memory, substitute the path to the location of
***the dataset on your computer for the dots ...
use "...Data for Figure 15.1.dta", clear
describe
codebook
list

twoway scatter y x
***To obtain Figure 15.2 
twoway scatter y x [fweight = f] 
***the [fweight = f] option weights each x,y pair by its frequency, labelled by 
***the variable name f 

***To obtain the Ice Cream data set
use "...Ice Cream.dta", clear
describe
codebook

***To Obtain Figure 15.5 -- a scatterplot with regression line superimposed
twoway (scatter barsold temp) (lfit barsold temp)

***To obtain the Pearson Product Moment Correlation along with the significance 
***level and the number of observations.  
pwcorr barsold temp, obs sig

***To obtain the p-value associated with the t-value using ttail(df, t).
display ttail(28, 10.1) 

***To confirm that the t-value is correct as calculated (within rounding error).
regress barsold temp, beta

***To obtain Figure 15.6 -- Fisher's r to Z transformation
***The drop_all command drops all the variables in the current dataset, 
***allowing us to begin with a clean slate.  The set obs command sets 
***the number of observations in the dataset to be equal to 100. The set seed
***command sets the initial value of the random number generator, and allows us
***to reproduce in a subsequent run, the same sequence of random numbers used 
***to obtain the current results. The function runiform() returns uniformly-
***distributed random numbers between the values of 0 and 1.   
drop _all
set obs 100
set seed 502
generate r = -1+2*runiform()
generate Z = .5*ln((1+r)/(1-r))
sort Z r 
twoway line Z r, ytitle("Fisher's Z") yline(0) xline(0)                    ///
                 ylabel(-3 -2 -1 0 +1 +2 +3) xlabel(-1.0 -0.5 0.0 +0.5 +1.0)

***To transform r =.887 to Z1 using Fisher's transformation
gen Z1 = .5*ln((1+.887)/(1-.887))
summarize Z1

***To transform Z = 1.031 and 1.785 back to their respective lower and upper r 
***values
gen rlower = (exp(2*1.031) - 1)/(exp(2*1.031) + 1)
gen rupper = (exp(2*1.785) - 1)/(exp(2*1.785) + 1)
summarize rlower
summarize rupper

***To obtain partial results for Example 15.1
gen Z2 = .5*ln((1+.636)/(1-.636)) 
summarize Z2
gen r1 = (exp(2*.8396) - 1)/(exp(2*.8396) + 1)
summarize r1

***To obtain the results for Example 15.2
summarize barsold temp
pwcorr barsold temp , sig obs
regress barsold temp

***To obtain the bootstrap estimate of the b-coefficient for temp:
regress barsold temp

bootstrap _b , reps(1000)nodots seed(1234): regress barsold temp

help set seed

***To obtain a listing of all the estimation results of the regression and 
***bootstrap analyses 
ereturn list
***To obtain a listing of the values of the OLS-estimated standard errors of the 
***b-coefficients 
matrix list e(b) 
***To obtain a listing of the values of the bootstrap-estimated standard errors 
***of the b-coefficients 
matrix list e(b_bs)

***To obtain Figure 15.8 -- Anscombe Data Revisited
use "...Anscombe.dta", clear
twoway scatter y1 x1
twoway scatter y2 x2
twoway scatter y3 x3
twoway scatter y4 x4

***To obtain Figure 15.9
regress y1 x1
predict y1_resid, residuals
twoway scatter y1_resid x1, ytitle("y1 Residuals")

regress y2 x2
predict y2_resid, residuals
twoway scatter y2_resid x2, ytitle("y2 Residuals")

regress y3 x3
predict y3_resid, residuals
twoway scatter y3_resid x3, ytitle("y3 Residuals")

regress y4 x4
predict y4_resid, residuals
twoway scatter y4_resid x4, ytitle("y4 Residuals")

***To obtain Figure 15.10
use "...Data for Figure 15.10.dta", clear
twoway (scatter y x) (lfit y x)
pwcorr y x

***To obtain Figure 15.11
regress y x
predict res, residuals
browse
twoway (scatter res x) (lfit res x), xtitle("x") legend(off)               ///
       ytitle("Unstandardized Residuals (y-yhat)") 

***Cook-Weisberg test of homoscedasticity -- null hypothesis is that the y
***variance is constant across x
estat hettest 

***To obtain Figure 15.12
gen log_y1 = log(y)
pwcorr log_y1 x
twoway (scatter log_y1 x) (lfit log_y1 x),  xtitle("x") legend(off)        ///
		ytitle("logarithm(y)")
		
***To obtain Figures 15.13, 15.14, and 15.15
use "...Data for Figures 15.13, 15.14 & 15.15.dta", clear

***To obtain Figure 15.13
twoway (scatter y x) (lfit y x), ytitle("y") xtitle("x") legend(off)

***To obtain Figure 15.14
twoway (scatter y x) (lfit y x), ytitle("y") xtitle("x") legend(off)     ///
        xlabel(1 2 3 4 5 6 7 8 9)

***To obtain Figure 15.15
twoway (scatter y x) (lfit y x), ytitle("y") xtitle("x") legend(off)     ///
        xlabel(1 2 3 4 5 6 7 8 9)

***To obtain Table 15.2
regress y x
capture predict lev, leverage
list x y lev

***To obtain Table 15.3 based on Figure 15.13
regress y x
capture predict stres, rstudent
list x y stres

***To obtain Table 15.4 based on Figure 15.15
regress y x
capture predict influence, cooksd
list x y influence

***To obtain the diagnostics to evaluate the Ice Cream Example
use "...Ice Cream.dta", clear

***To obtain Figure 15.16
twoway (scatter barsold temp, mlabel(id))

***To obtain Figure 15.17
regress barsold temp
predict resid, residuals
twoway scatter resid temp, mlabel(id) yline(0)                             ///
       ytitle("Unstandardized Residuals, y-yhat")

***To obtain Figure 15.18
predict stresid, rstudent
graph box stresid, marker(1, mlabel(id)) ytitle("Studentized Residuals")

***To obtain Figure 15.19
predict lever, leverage
graph box lever, marker(1, mlabel(id)) ytitle("Leverage Values")

***To obtain Figure 15.20
predict influence, cooksd
graph box influence, marker(1, mlabel(id)) ytitle("Cook's Influence Values")

***Regression with a dichotomous predictor
use "...NELS.dta", clear
ttest unitmath if region == 3, by(gender)
regress unitmath gender if region == 3
pwcorr unitmath gender if region == 3, obs sig

***To obtain results for Example 15.3 -- power analysis for a one-tailed test 
***of rho, the population correlation.
power onecorrelation 0 0.30 , alpha(0.05) power(.80) onesided

***To obtain results for Example 15.4 -- power analysis for a two-tailed test 
***of rho, the population correlation.
power onecorrelation 0 0.30 , alpha(0.05) power(.80) 

***To obtain results for Example 15.5 -- power analysis for testing a small  
***effect difference of R-squared from zero.
power rsquared .1304, power(.80) alpha(.05) 

***To obtain results for Example 15.6 -- power analysis for a two-tailed test 
***of rho, the population correlation.
