version 16
***CHAPTER 9
***To obtain a set of random integers with a uniform distribution
generate random =  floor((5000-1+1)*runiform() + 1)
***The general form of the random number generator of integers
generate random =  floor((b-a+1)*runiform() + a)
***The general form of a random number generator with decimal components
generate double random = (b-a+1)*runiform() + a

clear 
set obs 10
input x
0
1
3
3
5
7
7
7
8
10

***Substitute the path to the Desktop on your computer for the three dots ...
cd "...Desktop"
capture erase bootstrap.dta
set more off
set seed 1234 
bootstrap, reps(10000) size(8) saving(bootstrap.dta) : mean x

***To load a dataset into active memory, substitute the path to the location of
***the dataset on your computer for the dots ...
use "...bootstrap.dta", clear
edit
histogram _b_x, bin(61) frequency

***To obtain the solution to Example 9.4
display (normal((17 - 15)/.75)) - (normal((13 -  15)/.75))

***To obtain the solution to Example 9.5 -- Figure 9.5

clear
set seed 12468
set obs 1000
generate x = rchi2(8)
histogram x, bin(25) frequency xtitle("positively skewed distribution with mean=8 and sd = 4")
summarize x

***To obtain the solution to Example 9.5 -- Figure 9.6

***using empirical resampling using the bootstrap
capture erase bootstrap.dta
set more off
set seed 12468 
bootstrap, reps(10000) size(100) saving(bootstrap.dta) : mean x
use "C:\...\bootstrap.dta", clear
edit
histogram _b_x, bin(60) frequency
summarize _b_x

***using the Central Limit Theorem
clear
set seed 1234
set obs 10000
gen sampling_distribution = rnormal(8, 0.4)
histogram sampling_distribution, frequency

