clear all
*Install
ssc install scat3
ssc install graph3d
ssc install surface

clear all
*Load data
sysuse auto
summarize

*Fig 27.1 - A basic 3D scatterplot
scat3 price mpg weight

*Fig 27.2 - Rotating 3D scatterplots
scat3 price mpg weight, rotate(30) elevate(45) name(g1)
scat3 price mpg weight, rotate(120) elevate(45) name(g2)
scat3 price mpg weight, rotate(210) elevate(45) name(g3)
scat3 price mpg weight, rotate(300) elevate(45) name(g4)
graph combine g1 g2 g3 g4

*Fig 27.3 - Customized 3D scatterplot
scat3 price mpg weight, msymbol(D) mcolor(olive%50) ///
spikes(lpattern(dash) lwidth(*.5)) 

*Fig 27.4 - 3D scatterplot over groups
scat3 price mpg weight, separate(foreign) spikes(lcolor(gs10))

*Load data
sysuse nlsw88, clear
summarize wage hours age

*Fig 27.5 - 3D scatterplot with many observations
scat3 wage hours age, separate(collgrad) msize(*0.2 *0.2) ///
spikes(lpattern(dash) lwidth(*.5 *.5) lcolor(gs10 gs10))

*Load data
sysuse auto, clear

*Fig 27.6 - graph3d
graph3d price mpg weight

*Fig 27.7 - graph3d with grid
graph3d price mpg weight, cuboid innergrid 

*Rescaling mpg
summarize price mpg weight
replace mpg = mpg*100
summarize price mpg weight

*Fig 27.8 - graph3d with grid and rescaled mpg
graph3d price mpg weight, cuboid innergrid

*Fig 27.9 - graph3d with angle, label, and marker options
graph3d price mpg weight, cuboid innergrid xangle(30) yangle(45) ///
zangle(0) xlabel(price) ylabel(mpg100) zlabel(weight) xlang(-40) ///
ylang(40) zlang(90) markeroptions(mcolor(%50)) xlpos(10) ylpos(11) ///
zlpos(6) coordinates(2 5) 

*Fig 27.10 - graph3d over fourth binary variable
graph3d price mpg weight foreign, cuboid innergrid colorscheme(cr)

*Fig 27.11 - graph3d over fourth continuous variable
graph3d price mpg weight length, cuboid innergrid colorscheme(fadetogrey)

*Load data
sysuse auto, clear

*Fig 27.12 - 3D surface plot
surface price mpg weight

*Parametric model with predictions
regress price c.mpg##c.weight
quietly margins, at(mpg=(12(1)41) weight=(1760(100)4840)) ///
saving(predictions, replace)
use predictions, clear
summarize 

*Fig 27.13 - 3D surface plot
surface _margin _at1 _at2

