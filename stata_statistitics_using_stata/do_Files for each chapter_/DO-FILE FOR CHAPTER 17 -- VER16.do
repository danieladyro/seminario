version 16
Chapter 17

***The margins and marginsplot commands are used to generate the Figures in this 
***chapter

***The simplest way to obtain figures in this chapter, is to use the margins 
***command to calculate the estimated values of barsold at specific values
***and to use the marginsplot command to plot these values. In the margins 
***command, if the marginsplot command does not indicate another variable to be
***the x-axis, the first variable in the margincs command will be the variable  
***represented by the x-axis.  The particular values to be represented on the 
***x-axis are specified within parentheses following the equal sign. The first
***value in parentheses is the minimum value to be represented by the x-axis, 
***the last value is the maximum value to be represented by the x-axis and the 
***middle value in parentheses is the increment to be used between minimum 
***and maximum values. In the example below, the (60 (10) 90) means that the 
***x-axis will begin with 60 and end with 90 and have increments of 10 in
***between. The second variable specifies the variable that is to be plotted in 
***the body of the table itself. Within parentheses following the equal sign 
***are the exact values of that variable to be plotted.  If there is an 
***interaction, this variable is often called the moderator variable
***as it is conceptualized as moderating the relationship between the variables 
***represented by the x- and y-axes. 

***Some rules of the road when using the margins command:  It must follow the 
***regress command from whose equation it is computing estimates. The margins
***and marginsplot commands operate only on what are called factor variables. 
***As a result,the regress command must designate its variables as factor
***variables.  To do so, each variable name must be preceded by a c. if the 
***variable is continuous or an i. if the variable is categorical.  

***In addition, if an interaction is to be included in the regression equation, 
***that interaction must be represented in the regress command by the # sign.
***For example, the interaction between x1 and x2 would be represented in the 
***regress command as x1#x2. Figure 17.1 does not represent an interaction, but
***Figure 17.2 does.

***To  obtain Figure 17.1
***To load a dataset into active memory, substitute the path to the location of
***the dataset on your computer for the dots ...
use "...Ice Cream.dta", clear
*quietly suppresses the printing of regression output
quietly regress barsold c.temp c.relhumid  
 
***The x-axis represents temp and the lines in the plot itself represent two 
***values of relhumid (-1sd, +1sd).
set more off
margins, at(temp = (60 (10) 90) relhumid = (67 88)) vsquish 
***vsquish eliminates spaces between the lines of the margins table and  
***literally squishes the output vertically 

***In the marginsplot command, xlabel labels the x-axis with the values from 60 
***to 90 in increments of 10. noci stands for no confidence intervals and
***suppresses the printing of confidence intervals around the point on the
***graph at each value of temp. In addition, plot1opt specifies the options for
***the first plot of the graphic, namely the plot representing relhumid = 67; 
***plot2opt specifies the options for the second plot of the graphic, namely
***the plot representing relhumid = 88. 

marginsplot, xdimension(temp) xlabel(65 (5) 90) noci                        ///
			 plot1opt(lpattern(dash) lcolor(gs5) mcolor(gs5))               ///
             plot2opt(lpattern(solid) lcolor(gs5)mcolor(gs5))               ///
             ytitle ("Average Number of Bars Sold")                         ///
			 title("Relating Ice Cream Sales to Temp & Relhumid")           ///
             subtitle("A Case of NO Interaction")

***For more bells and whistles, we may include additional plot options as follows:
marginsplot, xdimension(temp) xlabel(60 (10) 90)                             ///
             plot1opt(lcolor(gs5)lwidth(medthick)lpattern(dash)mcolor(gs5)   ///
             msize(large))                                                   ///
			 plot2opt(lcolor(gs5)lwidth(medthick)lpattern(solid) mcolor(gs5) ///
			 msize(large))                                                   ///
			 noci ytitle ("Average Number of Bars Sold")                     ///                            
             title("Relating Ice Cream Sales to Temp & Relhumid")            ///                            
             subtitle("A Case of NO Interaction")


***To obtain Figures 17.2 & 17.3 (depicting an interaction between temp and 
***humidity on sales)
quietly regress barsold c.temp c.relhumid c.temp#c.relhumid 
 
set more off
margins, at(temp = (60 (10) 90) relhumid = (67 88)) vsquish 

marginsplot, xdimension(temp) xlabel(65 (5) 90) noci                        ///
			 plot1opt(lpattern(dash) lcolor(gs5) mcolor(gs5))               ///
             plot2opt(lpattern(solid) lcolor(gs5)mcolor(gs5))               ///
             ytitle ("Average Number of Bars Sold")                         ///
			 title("Relating Ice Cream Sales to Temp & Relhumid")           ///
             subtitle("Relhumid Moderates the Relationship bet Barsold and Temp")   

***For more bells and whistles, we may include additional plot options:
marginsplot, xdimension(temp) xlabel(60 (10) 90) noci                        ///
             plot1opt(lcolor(gs5)lwidth(medthick)lpattern(dash)mcolor(gs5)   ///
			 msize(large))                                                   ///
             plot2opt(lcolor(gs5)lwidth(medthick)lpattern(solid) mcolor(gs5) ///
			 msize(large))                                                   ///
             ytitle ("Average Number of Bars Sold")                          ///
			 title("Relating Ice Cream Sales to Temp & Relhumid")            ///
             subtitle("Relhumid Moderates the Relationship bet Barsold and Temp")

***NOTE: If we omit noci, we will see that the confidence intervals for low 
***and high humidity do not overlap with each other except for when temp = 90,
***suggesting that the number of bars sold when humidity is high is greater than 
***the number of bars sold when humidity is low at all temperatures, but for 90.
***At 90 degrees Fahrenheit, the number of bars sold at low and high humidity  
***are not different.

***To obtain a different version of Figure 17.2, with humidity on the x-axis and 
***temperature represented by the lines in the plot itself.
marginsplot, xdimension(relhumid) xlabel(60 (10) 90) noci                    ///
             plot1opt(lcolor(gs5)lwidth(medthick)lpattern(dash)mcolor(gs5)   ///
			 msize(large))                                                   ///
             plot2opt(lcolor(gs5)lwidth(medthick)lpattern(solid) mcolor(gs5) ///
			 msize(large))                                                   ///
             plot3opt(lcolor(gs5)lwidth(medthick)lpattern(dash_dot)          /// 
			 mcolor(gs5) msize(large))                                       ///
			 plot4opt(lcolor(gs5)lwidth(medthick)lpattern(longdash)          ///
			 mcolor(gs5) msize(large))                                       ///
			 ytitle ("Average Number of Bars Sold")                          ///
			 title("Relating Ice Cream Sales to Temp & Relhumid")            ///
             subtitle("Temp Moderates the Relationship bet Barsold and Relhumid")	

***An Alternative, More Heuristic Approach to Obtaining Figure 17.2
summarize barsold temp relhumid
return list
generate relhumidlow = r(mean)-r(sd) 
generate relhumidhigh = r(mean) + r(sd)
capture generate tempBYrelhumid = temp*relhumid
regress barsold temp relhumid tempBYrelhumid
ereturn list
matrix list e(b)
display "b(temp) = "_b[temp] "; b(relhumid) = " _b[relhumid]                 ///
        "; b(tempBYrelhumid) = " _b[tempBYrelhumid] "; constant = "_b[_cons] 
capture generate barsoldlow = _b[temp]*temp + _b[relhumid]*relhumidlow +     ///
                              _b[tempBYrelhumid]*temp*relhumidlow + _b[_cons]
capture generate barsoldhigh = _b[temp]*temp + _b[relhumid]*relhumidhigh +   ///
                               _b[tempBYrelhumid]*temp*relhumidhigh + _b[_cons]
twoway (scatter barsoldlow temp) (scatter barsoldhigh temp)                  ///
       (lfit barsoldlow temp) (lfit barsoldhigh temp) 
 
***Example 17.1
gen product = temp*relhumid 
summarize barsold temp relhumid product
pwcorr temp barsold relhumid product, obs star(5)
regress barsold temp relhumid product
 
***To obtain the bootstrap estimates of the standard errors of the b-weights, _b
set seed 3027
bootstrap _b , reps(1000)nodots : nestreg: regress barsold (temp relhumid) (product)

***Probing the nature of interactions
margins, dydx(temp) at(relhumid=(66 87))
 
 ***To obtain the results for Example 17.1
use "...NELS.dta", clear

summarize slfcnc08
return list
display r(mean)
gen ctrslf08 = slfcnc08 - r(mean) 
***gen is shorthand for generate. Using r(mean) provides a more accurate mean
***value to subtract from each score
edit

sum slfcnc12 ctrslf08 gender product /*sum is shorthand for summarize*/
pwcorr slfcnc12 ctrslf08 gender product, obs star(5)
regress slfcnc12 ctrslf08 gender product

***To obtain Figure 17.4

***We use the margins and marginsplot commands with regression on factor 
***variables to produce Figure 17.4 (without the scatterplot). In this
***command, we have not included noci.  As a result, 95% confidence intervals 
***will be constructed at values of slfcnc08 that will enable us to determine
***whether at each of those values, males and females differ from one another 
***in terms of slfcnc12.  Based on the graphic, we note that all of the male
***and female confidence intervals overlap with each other, except for in the 
***case where the centered value of slfcnc08 = -20 (where slfcnc08 = 
***-20 + 21.062 = 1.06), suggesting that only when one's self-concept in 8th 
***grade is very low (slfcnc08 = 1.062), do males and females differ from each
***other in the population in terms of self-concept in 12th grade.  If we had 
***not included the command, set more off, in this syntax, the printing of
***output would have stopped at regular intervals, waiting for us to press  
***enter or click the word, more, in the Output Window screen before it resumed
***printing. 
 
quietly regress c.slfcnc12 c.ctrslf08 i.gender c.ctrslf08#gender 
 
margins, dydx(ctrslf08) at(gender = (0 1))

***To obtain a graph of the interaction with ctrslf08 on the x-axis
set more off
margins, at(ctrslf08 = (-20 (10) +20) gender = (0 1)) vsquish

*Alternatively, we could use the following syntax, placing the indicator
*variable, gender, in front of the comma.

margins gender, at(ctrslf08 = (-20 (10) +20)) vsquish
marginsplot, xdimension(ctrslf08) xlabel(-20 (10) +20)                    ///
           plot1opt(lpattern(dash) lcolor(gs5) mcolor(gs5))               /// 
           plot2opt(lpattern(solid) lcolor(gs5)mcolor(gs5))               ///
           ytitle ("12th Grade Self-Concept")                             ///
           title("12th Grade Self-Concept Related to Gender & 8th Grade " ///
		         "Self-Concept")                                          ///
           subtitle("Gender Moderates the Relationship between "          ///
		            "8th Grade Self-Concept and 12th Grade Self-Concept")

margins r.gender, at(ctrslf08 = (-20 (10) +20)) vsquish
					
***Alternatively we could use the following syntax to produce a similar looking 
***graph. Note that jitter(10) in the following command adds some small random  
***amount to each point in the scatterplot so as to help separate the points in
***the scatterplot from one another and reduce their amount of overlap.

twoway (scatter slfcnc12 slfcnc08, jitter(10) msym(Oh))                      ///
       (lfit slfcnc12 slfcnc08 if gender == 1, lpattern(dash) lcolor(gs5)    ///
       (lfit slfcnc12 slfcnc08 if gender == 0, lpattern(solid)lcolor(gs5),   ///
	    legend(order(2 3)label(2 Female) label(3 Male))                      ///
	    ytitle("Twelfth Grade Self Concept")
	   
***To obtain Figure 17.5

***The next plot makes use of the already calculated estimated marginal values  
***fromthe margins command and reverses the roles of gender and eighth grade  
***self-concept as moderator.

marginsplot, xdimension(gender) xlabel(0 1)                                 ///
             plot1opt(lpattern(dash) lcolor(gs5)mcolor(gs5))                ///
			 plot2opt(lpattern(solid)lcolor(gs5)mcolor(gs5))                ///
             plot3opt(lpattern(longdash) lcolor(gs5)mcolor(gs5))            ///
			 plot4opt(lpattern(dash_dot)lcolor(gs5)mcolor(gs5))             ///
             plot5opt(lpattern(shortdash)lcolor(gs5)mcolor(gs5))            ///
             ytitle ("12th Grade Self-Concept")                             ///
             title("12th Grade Self-Concept Related to Gender & 8th Grade " ///
			 "Self-Concept"                                                 ///
			 subtitle ("8th Grade Self-Concept Moderates the Relationship") ///                  
		               " between Gender and 12th Grade Self-Concept") 
 
**To obtain results for Example 17.3, we use the following code:
regress barsold c.temp
est store m1, title(Model 1)
estat ic
display "Adj'd R-squared for Model 1 = " e(r2_a) 
*Note: e(r2_a) may be viewed using the command ereturn list.  It contains the 
*value of the adjusted R-squared.
regress barsold c.temp c.relhumid
est store m2, title(Model 2)
estat ic
display "Adj'd R-squared for Model 2 = " e(r2_a)
regress barsold c.temp c.relhumid c.temp#c.relhumid
est store m3, title(Model 3)
estat ic
display "Adj'd R-squared for Model 3 = " e(r2_a)

***To obtain results for Example 17.2 -- power analysis for testing the 
***significance of an increase in R-squared due to an interaction,
power rsquared .8571, power(.80) alpha(.05) ncontrol(2) diff(0.0292)

