version 16
***CHAPTER 10
***To obtain Figure 10.1
/*THE LAST GRAPH PLOTTED ON THESE AXES IS IN BLACK. BY BEING LAST, THE LINE  
  DOES NOT GET COVERED BY THE GRAY (GS12) SHADED AREAS*/
local bar = uchar(773)
twoway (function y=normalden(x), range(-4 -1.96) recast(area) color(gs12)) ///
(function y=normalden(x), range(1.96 4) recast(area) color(gs12)) ///
(function y=normalden(x), range(-4 4) lcolor(black)), /// 
xtitle(" ") ///
ytitle("Density") title("Critical Values for the Standard Normal Distribution") ///
subtitle("95% of the area falls between {&mu}-1.96 and {&mu}+1.96 se's of the population mean") /// 
legend(off) xlabel(-1.96 "{&mu}-1.96{&sigma}{sub: x}{sub:`bar'}" 0 "{&mu}" 1.96 "{&mu}+1.96{&sigma}{sub: x}{sub:`bar'}")
 
***To obtain Figure 10.2 -- confidence interval (brackets) around mean 
***Figure 10.2 is supplied by Cambridge
***To obtain Figure 10.3 -- confidence interval (brackets) around mean
***Figure 10.3 is supplied by Cambridge
***To obtain the solution to Example 10.1

display "95% conf interval for mu = (" 150 - 1.96*.4 ", "150 + 1.96*.4 ") hours."

***To obtain Figure 10.4
twoway function y=normalden(x, 500, 2.50), range(505 510) recast(area) color(gs12)|| ///
function y=normalden(x, 500, 2.50), range(490 510) lcolor(black) ///
xtitle("{it: {&mu}}") ///
ytitle("Density") title("Area under the curve to the right of a mean of 505") ///
subtitle("To the right of a z of 2.0") /// 
legend(off) xlabel(492.5 495.0 497.5 500 502.5 505.0 507.5)

***To obtain Figure 10.5
twoway function y=normalden(x, 500, 2.50), range(502 510) recast(area) color(gs12)|| ///
function y=normalden(x, 500, 2.50), range(490 510) lcolor(black) ///
xtitle("{it: {&mu}}") ///
ytitle("Density") title("Area under the curve to the right of a mean of 502") ///
subtitle("To the right of a z of 0.80") ///
legend(off) xlabel(492.5 495.0 497.5 500 502.5 505.0 507.5)

***To obtain the p-value for Figure 10.4
display (1 - (normal((505-500)/2.5)))

***To obtain the p-value for Figure 10.4
display 1 - (normal((502-500)/2.5))

***To obtain the p-value for Example 10.2
display 1- normal((101-100)/.45) 

***To obtain Figure 10.6
twoway function y=normalden(x, 100, .45), range(101 102) recast(area) color(gs12) || ///
function y=normalden(x, 100, .45), range(98 102) lcolor(black) ///
xtitle("{it: {&mu}}") ///
ytitle("Density") title("Area under the curve to the right of a mean of 101") ///
subtitle("To the right of a z of 2.22") ///
legend(off) xlabel(98 99 100 101 102)

***To obtain the solution to Example 10.3
display 1-normal((276-280)/2)

***To obtain Figure 10.7
twoway function y=normalden(x, 280, 2), range(284 286) recast(area) color(gs12)|| ///
function y=normalden(x, 280, 2), range(274 276) recast(area) color(gs12) || ///
function y=normalden(x, 280, 2), range(274 286) lcolor(black) ///
xtitle("{it: {&mu}}") ///
ytitle("Density") title("Critical areas under the curve in both tails") ///
subtitle("To the left of z = -2.00 and to right of z = 2.00") ///
legend(off) xlabel(274 276 278 280 282 284 286)

***To obtain a variation of the text's Figure 10.8 
clear
set seed 111222333
set obs  10000

local mu    = 100
local delta = 7
local sigma = 2.5

generate one = rnormal(`mu', `sigma')
generate two = one + `delta'

summarize one, detail
local alpha = r(p95)
quietly kdensity one, at(one) generate(x y) nodraw
quietly kdensity two, at(two) generate(x1 y1) nodraw
sort x
twoway kdensity one || kdensity two || area y1 x1 if x1>`alpha' || ///
        area y x if x>`alpha'

***To obtain a variation of the text's Figure 10.9 -- the new alpha value 
***(alpha prime = p90) represents a bigger area than the original alpha value (p95)
clear
set seed 111
set obs  10000

local mu    = 100
local delta = 7
local sigma = 2.5

generate one = rnormal(`mu', `sigma')
generate two = one + `delta'

summarize one, detail
local alpha = r(p90)
quietly kdensity one, at(one) generate(x y) nodraw
quietly kdensity two, at(two) generate(x1 y1) nodraw
sort x
twoway kdensity one || kdensity two || area y1 x1 if x1>`alpha' || ///
        area y x if x>`alpha'

***To obtain a variation of the text's Figure 10.10 -- new delta value (delta prime) 
***is bigger than the original delta value of 7; let new delta = 10
clear
set seed 111
set obs  10000

local mu    = 100
local delta = 10
local sigma = 2.5

generate one = rnormal(`mu', `sigma')
generate two = one + `delta'

summarize one, detail
local alpha = r(p95)
quietly kdensity one, at(one) generate(x y) nodraw
quietly kdensity two, at(two) generate(x1 y1) nodraw
sort x
twoway kdensity one || kdensity two || area y1 x1 if x1>`alpha' || ///
        area y x if x>`alpha'
		
***To obtain a variation of the text's Figure 10.11 -- the new sigma value 
***(sigma prime = 1.5) is less than the original sigma value of 2.5; let new sigma = 1.5
clear
set seed 111
set obs  10000

local mu    = 100
local delta = 7
local sigma = 1.5

generate one = rnormal(`mu', `sigma')
generate two = one + `delta'

summarize one, detail
local alpha = r(p95)
quietly kdensity one, at(one) generate(x y) nodraw
quietly kdensity two, at(two) generate(x1 y1) nodraw
sort x
twoway kdensity one || kdensity two || area y1 x1 if x1>`alpha' || ///
        area y x if x>`alpha'
