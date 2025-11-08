version 16
***CHAPTER 6

***To load a dataset into active memory, substitute the path to the location of
***the dataset on your computer for the dots ...
 
use "...Hamburg.dta", clear

***To obtain a description of the variables in the dataset
describe
***To obtain Table 6.1
list name fat calories

***To obtain the three figures of Figure 6.1 in the order they appear in the text 
***Note: The option range(fat) instructs STATA to plot the range of the line from 
***      the min to max value of the variable fat.
 graph twoway (scatter calories fat, legend(off)) (lfit calories fat), ///
              ytitle(Calories)
 graph twoway (scatter calories fat, legend(off))              ///
              (function y = 13.125*x + 136.25, range(fat)),    ///
			  ytitle(Calories) xtitle("Grams of Fat")
 graph twoway (scatter calories fat, legend(off))              ///
              (function y = 15*x + 110, range(fat)),           ///
			  ytitle(Calories) xtitle("Grams of Fat")

***To obtain the descriptive statistics for calories and fat and their 
***correlation
summarize calories fat
correlate calories fat

***To obtain the regression equation for predicting calories from fat
regress calories fat
regress calories fat, beta

***To obtain the scatterplot of calories with fat with the regression line 
***superimposed
graph twoway (scatter calories fat) (lfit calories fat), ytitle("calories")
 
***To obtain the solution to Example 6.2
predict yhat 

***To obtain Table 6.2
list name fat calories yhat 

***To obtain the correlation bet calories and fat; and calories and yhat
correlate calories fat  
correlate calories yhat

***To obtain the scatterplot between calories and yhat in Example 6.2
graph twoway scatter yhat fat, ytitle("predicted number of calories")

***To obtain the solution to Example 6.3
***To load the dataset into active memory 
use "...States.dta", clear

***To obtain a description of the variables in the dataset
describe

***To obtain a scatterplot of satcr and pertak with the regression line 
***superimposed
graph twoway (scatter satcr pertak ) (lfit satcr pertak), ///
             ytitle("Average SAT Critical Reading")

***To obtain the regression equation for predicting satcr from pertak
regress satcr pertak, beta

***To display the estimated value of satcr for states with pertak = 25
display "Estimated satcr for states with pertak = 25 = " -1.163*25 + 578.976  

***To obtain the scatterplot between satcr and yhat
predict yhat
graph twoway (scatter satcr yhat ), ytitle("Average SAT Critical Reading")

***To obtain the solution to Example 6.4
***To load the dataset into active memory 
use "...Hamburg.dta", clear

***To obtain a description of the variables in the dataset
describe

***To obtain Table 6.3
list name cheese calories, nolabel /*the option nolabel displays numeric codes
                                     rather than label values*/

***To obtain the regression equation for predicting calories from cheese
regress calories cheese, beta

***To obtain the mean number of calories of a burger with cheese
summarize calories if cheese == 1

***To obtain and display the predicted number of calories of a burger with 
***cheese, which also is the average or expected value of calories of a burger 
***with cheese.
display "The estimated number of calories of a burger with cheese is equal to " ///
        110*1 + 350 

***To obtain the mean number of calories of a burger without cheese
summarize calories if cheese == 0

***To obtain and display the predicted number of calories of a burger without 
***cheese, which also is the average or expected value of calories of a burger
***with cheese.
display "The estimated number of calories of a burger without cheese is equal to " ///
         110*0 + 350 

***To obtain the graphic for Example 6.4
twoway (scatter calories cheese, mlabel(name)) (lfit calories cheese), ///
       ytitle("calories")

***To load the Anscombe data into active memory. 
use "...Anscombe.dta", clear

***To obtain a description of the variables in the datasets
describe

***To obtain the means, standard deviations, and correlations between the pairs 
***of variables x1,y1; x2,y2; x3,y3; and x4,y4
***The option means displays the means, std devs, min, and max of each variable
correlate x1 y1, mean 
correlate x2 y2, mean
correlate x3 y3, mean
correlate x4 y4, mean

***To obtain the regression equation for predicting y from x for each of the 
***four pairs of x,y values
regress y1 x1
regress y2 x2
regress y3 x3
regress y4 x4

***To obtain the four scatterplots y1 with x1, y2 with x2, y3 with x3, y4 with x4 
graph twoway scatter y1 x1
graph twoway scatter y2 x2
graph twoway scatter y3 x3
graph twoway scatter y4 x4
