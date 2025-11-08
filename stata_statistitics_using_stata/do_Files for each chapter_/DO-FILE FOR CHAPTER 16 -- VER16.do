version 16
***CHAPTER 16

***To obtain the Ice Cream data set
***To load a dataset into active memory, substitute the path to the location of
***the dataset on your computer for the dots ...
use "...Ice Cream.dta", clear

***To obtain the results for Example 16.1
***We regress barsold on temperature and relhumidity
regress barsold temp relhumid

***To obtain additional statistics related to our regression analysis, we run   
***the following commands. To obtain summary statistics, we use the command  
***summarize. To obtain bivariate (aka Pearson Product Moment or zero-order) 
***correlations, we use the command pwcorr. 

summarize barsold temp relhumid
pwcorr barsold temp relhumid, obs star(5)

***To obtain the beta coefficients for the multiple regression equation
regress barsold temp relhumid, beta

***To obtain the boostrap estimates of the standard errors of the b-weights

bootstrap b = _b[weight] , reps(1000)nodots seed(2576):                    ///
                           regress barsold temp relhumid

***To obtain the semipartial (aka part) and partial correlations, we use the 
***command pcorr as shown:  
pcorr barsold temp relhumid

***To obtain the statistical significance of the change in R-squared for the two 
***nested models of our ice cream example. The variables in parentheses defines
***the order in which the variables are to be included in the regression 
***equation. In particular, temp will be included first and the results of that 
***equation will be reported as output; relhumid will be added next and the
***results of having both variables in the equation will be reported.  In 
***addition, the increment in R-squared from having only temp in the equation
***to having both temp and relhumid in the equation will be reported and tested
***for statistical significance. One may think of the two sets of ()'s as 
***defining Block 1 and Block 2, respectively. The variable(s) in each Block are
***entered simultaneously, all at once.  For this example, temp constitutes 
***Block 1 and is entered first and relhumid constitutes Block 2 and is entered 
***next.  
nestreg : regress barsold (temp) (relhumid)

***To obtain that part of X1 orthogonal to X2
regress temp relhumid
capture predict x1orthx2, residuals

***To obtain the results for Example 16.2
regress temp relhumid
capture predict x1orthx2, residuals
list barsold temp x1orthx2
regress barsold x1orthx2

***To obtain the results for Example 16.3
use "...NELS.dta", clear
describe
summarize slfcnc12 slfcnc08 gender
pwcorr  slfcnc12 slfcnc08 gender, obs star(5)
regress slfcnc12 slfcnc08 gender

***To obtain the results for Example 16.4
use "...Basketball.dta", clear

*****Part(a) -- Summary Statistics, Correlation, and Regression Equation
summarize points weightlb gender
pwcorr points weightlb gender, obs star(5)
regress points weightlb

***Part(d) -- Construct a scatterplot of points and weightlb with a regression 
***line superimposed on the scatterplot.Note: legend(order(2)) stipulates that 
***we only want the legend associated with the 2nd graphic, the line, in this
***case, to appear, but not the legend associated with the 1st graphic, the 
***scatterplot 
twoway (scatter points weightlb) (lfit points weightlb),                   ///
        ytitle("Total Points Scored") legend(order(2))

***Part(e) -- Construct a scatterplot of points and weightlb, with observations 
***labeled by gender.  Superimpose two regression lines on the scatterplot, 
***one for males and the other for females. Note: row(1) stipulates that the 
***legend appears in only one row.  In this case, order(2 3) stipulates that the 
***legends associated with graphs 2 and 3 appear below the plot, but not a 
***legend for graph 1, the scatterplot.

twoway (scatter points weightlb, mlabel(gender))                           ///
       (lfit points weightlb if gender == 1, lpattern(dash))               ///
       (lfit points weightlb if gender == 0, lpattern(solid)),             ///
        legend(row(1) order(2 3) label(2 Female) label(3 Male))            ///
		ytitle("Total Points Scored")

***Part(g) -- Obtain a regression equation for predicting points from both 
***weightlb and gender
regress points weightlb gender

***Code for Section, A Hypothetical Example 
use "...Upper Body Strength.dta", clear

***Graph of Figure 16.5
twoway (scatter strength gym)                                              ///
       (lfit strength gym if gender == 1, lpattern(dash) lcolor(gs5))      ///
       (lfit strength gym if gender == 0,                                  ///
        lpattern(solid) lcolor(gs5)), legend(order(2 3)                    ///
        label(2 Female) label(3 Male) row(1)) ytitle(“Upper Body Strength”)

***Analyses related to the regression on all N=8 individuals

tabstat strength gym, stats(count mean sd)
pwcorr strength gym, obs star(.05)
regress strength gym

regress strength gym if gender == 0 
regress strength gym if gender == 1  

***To obtain the results for Example 16.5 -- power analysis for testing the 
***significance of R-squared from zero with two predictors in the equation
power rsquared .1304, power(.80) alpha(.05) ntested(2)

***To obtain the results for Example 16.6 -- power analysis for testing the 
***significance of an increase in R-squared of a predictor over and above a
***control variable. 
power rsquared .01 , power(.80) alpha(.05) ncontrol(1) diff(0.1304)

