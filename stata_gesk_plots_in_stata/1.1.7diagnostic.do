*Install
ssc install skewplot

clear all
*Load data
sysuse citytemp
summarize

*Fig 7.1 - Symmetry plot
symplot tempjan 

*Fig 7.2 - Skew plot
skewplot tempjan

*Fig 7.3 - Multiple skew plots
skewplot tempjan tempjuly

*Fig 7.4 - Quantile-uniform plot
quantile tempjan

*Fig 7.5 - Quantile-normal plot
qnorm tempjan

*Fig 7.6 - Quantile chi-squared plot
qchi tempjan

*Fig 7.7 - Quantile chi-squared plot with custom degrees of freedom
qchi tempjan, df(40)

*Fig 7.8 - Quantile-quantile plot
qqplot tempjan tempjuly

