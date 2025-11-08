version 16
***CHAPTER 8

***To create the binomial probability distribution graphic of Figure 8.1
***By generating the entire binomial probability distribution and saving its 
***values in a dataset
set obs 4 
gen n = _n 
***Stata uses the variable name _n to contain the list of observations.  
***In this case, they are the values 1, 2, 3, and 4.
gen k = n-1
list n k
generate prob = binomialp(3,k,.816) 
list n k prob
histogram k [fweight=int(prob*1000)], discrete ytitle("Prob of k sucesses") ///
 color(gs12) barwidth(.75) addlabels xtitle("Number Who Never Smoked Marijuana  (k)")

***To obtain the solution to Example 8.1 
***Using Stata's binomial prob function binomialp(n,k,p)
display binomialp(3, 2, 0.816)

***To obtain the solution to Example 8.5 
***Using Stata's binomial prob function binomialp(n,k,p)
display binomialp(10, 5, .30)
***Computing Equation 8.2
display ((1*2*3*4*5*6*7*8*9*10)/ (1*2*3*4*5*1*2*3*4*5))* (.30^5)*(.70)^5
***Taking advantage of STATA's combinations routine
display comb(10,5) * (.30^5)*(.70)^5

***To obtain the solution to Example 8.6 
***Using Stata's binomial prob function binomialp(n,k,p)
display binomialp(10, 4,.25)
***Computing Equation 8.2
display comb(10,4)*(.25^4)*(.75^6)

***To obtain the solution to Example 8.7 
***Using Stata's binomial prob function binomialp(n,k,p)
display binomialp(50,25,.40) 
***Computing Equation 8.2
display comb(50,25)*(.4^25)*(.6^25)

***To obtain the solution to Example 8.8(a)
***Prob that the number of success is less than or equal to k
display binomial(50, 15, .40)

***To obtain the solution to Example 8.8(b)
***Prob that the number of success is greater than or equal to k
display binomialtail(50, 20,.40)

***To obtain Figure 8.2 -- the standard normal curve
  
twoway function y=normalden(x), range(-4.0 4.0) xtitle("{it: z-scores}") ///
ytitle("Density") title("Standard Normal Distribution") 

***The bracketed {it: z-scores} within the ()'s, specifies that the xtitle be 
***printed in italics. In the expression y=normalden(x), the value of y is set
***equal to the relative likelihood of y for the given value of x. It is  
***represented by the height of the curve at the value x and is called the
***curve's density at x.  Density is to a continuous variable as probability 
***is to a discrete variable.  The den in normalden stands for density.
***To obtain Figure 8.3 -- the distribution of SES with a normal curve overlay

***To obtain Figure 8.3
***To load a dataset into active memory, substitute the path to the location of
***the dataset on your computer for the dots ...
use "...NELS.dta", clear
histogram ses, normal color(gs10) ytitle("Density")

***To obtain the solution to Example 8.9 
display normal((26-18.40)/6.92)

***To obtain Figure 8.4 -- shaded area under the normal curve
graph twoway histogram ses, color(gs10) || function y=normalden(x,18.40,6.92), range(0 40) ///
|| function y=normalden(x,18.40,6.92), range(0 26)recast(area) color(gs12) ///
xlabel(0 10 20 26 30 40) legend(off) xtitle("Socio-Economic Status") ///
ytitle("Density")

***To obtain Figure 8.5 -- shaded area under the normal curve to the right of z = 2
twoway function y=normalden(x, 0, 1), range(2 3) recast(area) color(gs12) || ///
function y=normalden(x, 0, 1), range(-3 3) lcolor(black) ///
xtitle("{it: z-score}") ///
ytitle("Density") title("Area under the curve to the right of a z-score of 2") ///
legend(off) xlabel(-3 -2 -1 0 1 2 3)

***To obtain the solution to Example 8.10
display normal(2)
display 1 - .977 

***To obtain the solution to Example 8.11
display invnormal(.975)
display 6.92*1.96+ 18.40

***To obtain the solution to Example 8.12
display normal(-2.45)
