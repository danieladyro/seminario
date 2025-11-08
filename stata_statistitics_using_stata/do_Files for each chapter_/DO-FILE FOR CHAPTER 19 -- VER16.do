version 16
*Do-file for Chapter 19 

***CHANGING THE WORKING DIRECTORY
**THIS IS AN IMPORTANT STEP SO THAT YOU WILL KNOW WHERE YOUR RESULTS ARE LOCATED
**ON YOUR COMPUTER.

**Because ~ is understood by Stata's cd command to mean the home directory, we 
**may more simply type: cd "~\Desktop\"  on a PC; and cd "~/Desktop/" on a Mac. 
**The quotes in this case are actually not needed.  They are only needed when 
**one of the elements of the path has spaces in it, as it would if there were a 
**space between Desk and top (i.e., Desk top).
 
**If you are working on a Mac:

*cd "~/Desktop"

**On a PC we would use the following command:

*cd "~\Desktop"

**To verify that you are in this directory, type cdout, which is a user-defined
**.ado file and needs to be installed using findit cdout and following the
**directions for installation.
cdout

**Create a new folder on the Desktop that will hold all the results produced
**from this chapter. We shall call the new folder "ice cream results". Then  
**type cd to change to that folder on the Desktop:

cd "ice cream results"

**To verify that we are in this directory, type cdout.

cdout

**Load the Ice Cream data into working memory. 
use "Ice Cream.dta", clear

**REPRODUCING A TABLE OF UNIVARIATE SUMMARY STATISTICS IN EXCEL

*Using estpost and esttab

estpost summarize barsold temp relhumid
ereturn list
esttab using "univariate_summ.csv",                            ///
       cells("count(fmt(0)) mean(fmt(2)) sd(fmt(2)) min(fmt(2)) max(fmt(2))") 
		 
**If the .csv file already exists, add the option replace to this command so as
**to instruct Stata to replace the current contents of the .csv file with
**the newly-generated output obtained from executing estab.
**By default, esttab places multiple statistics in separate rows beneath 
**one another. In order to place the estimates in the same row, we use the 
**option cells and encase the estimates (count, mean, etc.) in quotes.  By using 
**the format option (fmt(0)) (fmt(2)), we are able to display count with zero 
**decimals and the other statistics with two decimals (the default is three).  

**If the format is the same for several statistics in a list, we need only to 
**specify that format for the first statistic to which it applies in that list 
**as it will apply to all following statistics in that list as well (as shown
**below. In this command, we have included the option replace because this .csv
**file already exists on our computer.

esttab using "univariate_summ.csv", replace                    ///
              cells("count(fmt(0)) mean(fmt(2)) sd min max")
                                                    

**Load Excel and open the .csv file in Excel. Edit the file as you wish by, for 
**example, adding a title, centering the values in the columns, adding borders,
**etc. Once you finished editing, save the .csv file as an .xlsx file; and
**copy and paste it into your report or manuscript in the usual way. 

***AN ALTERNATIVE APPROACH USING putexcel and summarize***

**We first create a new Excel file that will hold the output from putexcel.
putexcel set univariate_summ2.xlsx, modify
**Execute the summarize command.
summarize barsold 

**Use the variable names given by Stata to the post-estimation values from the
**summarize command (e.g., r(N) stores the number of observations in the data
**set), assign the values contained in these variables to the specific cells 
**in which you would like these values to be located in the Excel worksheet you
**just created (i.e., univariate_summ.xlsx). For example, the first line below 
**stores the number of observations in worksheet column B, row 3; the second
**line stores the mean in column C row 3. The options noted in the first line
**specifies: the particular font to be used, that the value of N should be 
**centered horizontally in cell B3, and that the number should have no decimals.    

putexcel B3 = `r(N)',  font("Calibri", 12, "black") hcenter nformat(number)
putexcel C3 = `r(mean)'
putexcel D3 = `r(sd)'
putexcel E3 = `r(min)'
putexcel F3 = `r(max)'
putexcel C3:F3, font("Calibri", 12, "black") hcenter nformat(number_d2)

summarize temp 
putexcel B4 = `r(N)',  font("Calibri", 12, "black") hcenter nformat(number)
putexcel C4 = `r(mean)'
putexcel D4 = `r(sd)'
putexcel E4 = `r(min)'
putexcel F4 = `r(max)'
putexcel C4:F4, font("Calibri", 12, "black") hcenter nformat(number_d2)

summarize relhumid 
putexcel B5 = `r(N)', font("Calibri", 12, "black") hcenter nformat(number)
putexcel C5 = `r(mean)'
putexcel D5 = `r(sd)'
putexcel E5 = `r(min)'
putexcel F5 = `r(max)'
putexcel C5:F5, font("Calibri", 12, "black") hcenter nformat(number_d2)

**Duplicating the above using a foreach loop that loops across rows.

local row = 3
local vars barsold temp relhumid
foreach var of varlist `vars' { 
summarize `var' 
putexcel B`row' = `r(N)',  font("Calibri", 12, "black") hcenter nformat(number)
putexcel C`row' = `r(mean)'
putexcel D`row' = `r(sd)'
putexcel E`row' = `r(min)'
putexcel F`row' = `r(max)'
putexcel C`row':F`row', font("Calibri", 12, "black") hcenter nformat(number_d2)
local row = `row' + 1
}

**Note: You may bypass the next series of commands for editing the worksheet,  
**and instead edit the worksheet directly in Excel, as above.  When finished 
**editing, copy and save the worksheet to your report or manuscript.

***********************************
**Editing the worksheet using putexcel code. The following commands add text in 
**rows 1, 2, and 3, and add horizontal and vertical borders. 

putexcel A1:F1 = "Table 19.1. Univariate Summary Statistics of Variables ",  ///
                  font(Calibri, 12, black) merge overwritefmt

putexcel A2, border(right, thin, black)
putexcel A2, border(bottom, thin, black)
putexcel A3 = "barsold", border(right, thin, black) 
putexcel A4 = "temp", border(right, thin, black) 
putexcel A5 = "relhumid", border(right, thin, black) 
putexcel A2:A5, font("Calibri", 12, "black") 

putexcel B2 = "count", border(bottom, thin, black) 
putexcel C2 = "mean", border(bottom, thin, black) 
putexcel D2 = "sd", border(bottom, thin, black) 
putexcel E2 = "min", border(bottom, thin, black) 
putexcel F2 = "max", border(bottom, thin, black) 
putexcel A2:F2, font("Calibri", 12, "black") hcenter 

**Once your editing of the worksheet is complete, as before, open the worksheet
**in Excel and copy and paste it to your report or manuscript.
***********************************

***AN ALTERNATIVE APPROACH USING putexcel and tabstat (instead of summarize)***

**As before, create a file in which to store the Excel worksheet.
putexcel set univariate_summ3.xlsx, replace

**The save option informs Stata to save the results as a matrix. 

tabstat barsold temp relhumid, stat(n mean sd min max) save
 
return list

matlist r(StatTotal)

**We transform this matrix 
matrix newStatTotal = r(StatTotal)'
matlist newStatTotal

**We reproduce the matrix of results as a table in Excel. Cell A2 will contain 
**the upper-left-hand corner of the matrix. 
putexcel A2 = matrix(newStatTotal), names nformat(number_d2) 

**Once again, you may edit the table using the following putexcel commands, or
**more simply open the .xlsx file and edit directly in Excel.
 
putexcel A1:F1 = "Table 19.1. Univariate Summary Statistics of Variables",  ///
                  font(Calibri, 12, black) merge left overwritefmt
putexcel B3:B5, nformat(number) hcenter 
putexcel A3:A5, right border(right)  
putexcel A2:F2, hcenter border(bottom) 
putexcel B2, border(left)
putexcel C3:F5, hcenter 

**REPRODUCING A CORRELATION MATRIX AS A TABLE IN EXCEL

**Using estpost and esttab

estpost correl barsold temp relhumid, matrix listwise
eststo corr
esttab corr using "correl.csv", not noobs compress unstack replace

**Edit the correl.csv file in Excel directly to tailor the table to your own
**specifications.

**Using putexcel as an alternative to estpost and esttab

putexcel set correl2.xlsx, replace

pwcorr barsold temp relhumid, sig 
return list 
matrix C = r(C)
matrix list C

putexcel A2 = matrix(C), names nformat(number_d3) right ///
                        font("Calibri", 12, "black")

**Once again, edit as desired directly in Excel.

**REPRODUCING REGRESSION OUTPUT AS A TABLE IN EXCEL 

**Using outreg2 to obtain a table of the regression model with additional 
**statistics in Excel

findit outreg2  

regress barsold c.temp 
outreg2 using "reg_results.xml", replace excel dec(3)

regress barsold c.temp c.relhumid
outreg2 using "reg_results.xml", append excel dec(3)

regress barsold c.temp c.relhumid c.temp#c.relhumid
outreg2 using "reg_results.xml", append excel dec(3) 

**Open this file in Excel and copy and paste it to your report or manuscript
**after any additional editing on your part.
              
**Using eststo and esttab to obtain a table of the regression model with 
**additional statistics in Excel

regress barsold c.temp 
eststo model_1
regress barsold c.temp c.relhumid
eststo model_2
regress barsold c.temp##c.relhumid 
eststo model_3

esttab model_1 model_2 model_3 using "reg_results2.csv", not se aic bic r2 ///
                                       ar2 nobase compress unstack replace
**Open this file in Excel and copy and paste it to your report or manuscript
**after any additional editing on your part.

**Using putexcel to obtain a table of the regression coefficients and p-values
**in Excel

regress barsold c.temp##c.relhumid 
matlist r(table)

matrix reg_results = r(table)
matrix reg_results = reg_results[1..6,1...]'

matlist reg_results

putexcel set reg_results3.xlsx, replace

putexcel A2 = matrix(reg_results), names nformat(number_d2) hcenter
putexcel A1 = "Table 19.4. Regression Coefficients", font(Calibri, 12, black) ///
               merge left overwritefmt
putexcel A2:A6, right border(right) overwritefmt
putexcel A2:G2, hcenter border(bottom) overwritefmt

**Reproducing a graph in Excel. 

*Using putexcel

histogram barsold

graph export hist_barsold.png, replace 

putexcel set hist_barsold.xlsx, replace
putexcel A2 = picture(hist_barsold)
