
clear all
*Load data
sysuse auto
summarize rep78 foreign

*Fig 17.1 - Basic scatterplot
scatter foreign rep78

*Fig 17.2 - Scatterplot with discrete data and jitter()
twoway (scatter foreign rep78, jitter(12))

*Fig 17.3 - Different jitter seed
twoway (scatter foreign rep78, jitter(12) jitterseed(1234))

*Load data
sysuse nlsw88, clear
summarize occupation industry

*Fig 17.4 - Scatterplot of many discrete categories
twoway (scatter occupation industry, ///
 ylabel(1(1)13, valuelabel angle(45)) xlabel(1(1)12, valuelabel angle(45)))

*Fig 17.5 - Scatterplot of many discrete categories with jitter()
twoway (scatter occupation industry, ///
 ylabel(1(1)13, valuelabel angle(45)) xlabel(1(1)12, valuelabel ///
 angle(45)) jitter(4) msize(tiny) mcolor(%30))

*Summarize
summarize wage race

*Fig 17.6 - One continuous variable with jitter()
twoway (scatter race wage) (scatter race wage, jitter(15) ///
 mcolor(%20) legend(label(1 "Original") label(2 "Jittered")))

*Fig 17.7 - One continuous variable and extended y axis with jitter()
twoway (scatter race wage) (scatter race wage, jitter(15) ///
 mcolor(%20) legend(label(1 "Original") label(2 "Jittered")) ///
 ylabel(0(1)4))

*Fig 17.8 - Two continuous variables with jitter()
twoway (scatter wage ttl_exp if race == 2, mcolor(%30)) ///
 (scatter wage ttl_exp if race == 2, jitter(5) mcolor(%60) mlcolor(black) ///
 legend(label(1 "Original") label(2 "Jittered"))) ///
 (lfit wage ttl_exp if race == 2)

