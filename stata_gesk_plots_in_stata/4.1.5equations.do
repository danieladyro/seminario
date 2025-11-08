*Fig 31.1 - Stata functions
help functions

*Fig 31.2 - Draw a custom function y = sin(x)
twoway (function y = sin(x), range(0 10))

*Fig 31.3 - Draw a quadratic equation
twoway (function y = 1 + 2*x + 3*x^2, range(-5 5))

*Fig 31.4 - Draw the logitistic cumulative density function
twoway (function y = logistic(x), range(-5 5))

*Fig 31.5 - Multiple overlaid functions
twoway (function y = cauchyden(1,1,x), range(-5 5)) ///
(function y = cauchyden(1,1,x), range(-5 0) recast(area) legend(off))

*Load auto data
sysuse auto, clear
*Run regression
regress price c.mpg##c.mpg
matrix list e(b)

*Fig 31.6 - Plot regression coefficients as a custom function
twoway (function y = _b[_cons] + _b[mpg]*x + _b[c.mpg#c.mpg]*x^2, range(mpg))
