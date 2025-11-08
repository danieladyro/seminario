*Install  
ssc install palettes
ssc install colrspace

clear all
*Load data
sysuse uslifeexp
summarize

*Fig 29.1 - Many line plots
line le_wfemale le_female le_w le le_wmale le_male le_bfemale le_b ///
le_bmale year

*Fig 29.2 - Rainbow color palette with nine values
colorpalette spmap rainbow, n(9) 

*Return list
return list

*Fig 29.3 - Line plot with rainbow colors
colorpalette spmap rainbow, n(9) nograph 
line le_wfemale le_female le_w le le_wmale le_male le_bfemale le_b ///
le_bmale year, lcolor(`r(p)') 

*Load data
webuse pig, clear
summarize
xtset id week

*Fig 29.4 - Overlaid line plots
xtline weight, overlay legend(off)

*Sort data
bys id: generate mw = weight[1]
sort mw id week 
drop id mw
egen id = seq(), block(9)

*Fig 29.7 - Complex rainbow line plot
colorpalette spmap rainbow, n(48) nograph
twoway ///
(line weight week if id == 1, lcolor("`r(p1)'")) 	///
(line weight week if id == 2, lcolor("`r(p2)'")) 	///
(line weight week if id == 3, lcolor("`r(p3)'")) 	///
(line weight week if id == 4, lcolor("`r(p4)'")) 	///
(line weight week if id == 5, lcolor("`r(p5)'")) 	///
(line weight week if id == 6, lcolor("`r(p6)'")) 	///
(line weight week if id == 7, lcolor("`r(p7)'")) 	///
(line weight week if id == 8, lcolor("`r(p8)'")) 	///
(line weight week if id == 9, lcolor("`r(p9)'")) 	///
(line weight week if id == 10, lcolor("`r(p10)'")) 	///
(line weight week if id == 11, lcolor("`r(p11)'")) 	///
(line weight week if id == 12, lcolor("`r(p12)'")) 	///
(line weight week if id == 13, lcolor("`r(p13)'")) 	///
(line weight week if id == 14, lcolor("`r(p14)'")) 	///
(line weight week if id == 15, lcolor("`r(p15)'")) 	///
(line weight week if id == 16, lcolor("`r(p16)'")) 	///
(line weight week if id == 17, lcolor("`r(p17)'")) 	///
(line weight week if id == 18, lcolor("`r(p18)'")) 	///
(line weight week if id == 19, lcolor("`r(p19)'")) 	///
(line weight week if id == 20, lcolor("`r(p20)'")) 	///
(line weight week if id == 21, lcolor("`r(p21)'")) 	///
(line weight week if id == 22, lcolor("`r(p22)'")) 	///
(line weight week if id == 23, lcolor("`r(p23)'")) 	///
(line weight week if id == 24, lcolor("`r(p24)'")) 	///
(line weight week if id == 25, lcolor("`r(p25)'")) 	///
(line weight week if id == 26, lcolor("`r(p26)'")) 	///
(line weight week if id == 27, lcolor("`r(p27)'")) 	///
(line weight week if id == 28, lcolor("`r(p28)'")) 	///
(line weight week if id == 29, lcolor("`r(p29)'")) 	///
(line weight week if id == 30, lcolor("`r(p30)'")) 	///
(line weight week if id == 31, lcolor("`r(p31)'")) 	///
(line weight week if id == 32, lcolor("`r(p32)'")) 	///
(line weight week if id == 33, lcolor("`r(p33)'")) 	///
(line weight week if id == 34, lcolor("`r(p34)'")) 	///
(line weight week if id == 35, lcolor("`r(p35)'")) 	///
(line weight week if id == 36, lcolor("`r(p36)'")) 	///
(line weight week if id == 37, lcolor("`r(p37)'")) 	///
(line weight week if id == 38, lcolor("`r(p38)'")) 	///
(line weight week if id == 39, lcolor("`r(p39)'")) 	///
(line weight week if id == 40, lcolor("`r(p40)'")) 	///
(line weight week if id == 41, lcolor("`r(p41)'")) 	///
(line weight week if id == 42, lcolor("`r(p42)'")) 	///
(line weight week if id == 43, lcolor("`r(p43)'")) 	///
(line weight week if id == 44, lcolor("`r(p44)'")) 	///
(line weight week if id == 45, lcolor("`r(p45)'")) 	///
(line weight week if id == 46, lcolor("`r(p46)'")) 	///
(line weight week if id == 47, lcolor("`r(p47)'")) 	///
(line weight week if id == 48, lcolor("`r(p48)'")) 	///
 , legend(off)

*Fig 29.8 - Complex rainbow line plot v2
colorpalette Gold CadetBlue, n(48) nograph
twoway ///
(line weight week if id == 1, lcolor("`r(p1)'")) 	///
(line weight week if id == 2, lcolor("`r(p2)'")) 	///
(line weight week if id == 3, lcolor("`r(p3)'")) 	///
(line weight week if id == 4, lcolor("`r(p4)'")) 	///
(line weight week if id == 5, lcolor("`r(p5)'")) 	///
(line weight week if id == 6, lcolor("`r(p6)'")) 	///
(line weight week if id == 7, lcolor("`r(p7)'")) 	///
(line weight week if id == 8, lcolor("`r(p8)'")) 	///
(line weight week if id == 9, lcolor("`r(p9)'")) 	///
(line weight week if id == 10, lcolor("`r(p10)'")) 	///
(line weight week if id == 11, lcolor("`r(p11)'")) 	///
(line weight week if id == 12, lcolor("`r(p12)'")) 	///
(line weight week if id == 13, lcolor("`r(p13)'")) 	///
(line weight week if id == 14, lcolor("`r(p14)'")) 	///
(line weight week if id == 15, lcolor("`r(p15)'")) 	///
(line weight week if id == 16, lcolor("`r(p16)'")) 	///
(line weight week if id == 17, lcolor("`r(p17)'")) 	///
(line weight week if id == 18, lcolor("`r(p18)'")) 	///
(line weight week if id == 19, lcolor("`r(p19)'")) 	///
(line weight week if id == 20, lcolor("`r(p20)'")) 	///
(line weight week if id == 21, lcolor("`r(p21)'")) 	///
(line weight week if id == 22, lcolor("`r(p22)'")) 	///
(line weight week if id == 23, lcolor("`r(p23)'")) 	///
(line weight week if id == 24, lcolor("`r(p24)'")) 	///
(line weight week if id == 25, lcolor("`r(p25)'")) 	///
(line weight week if id == 26, lcolor("`r(p26)'")) 	///
(line weight week if id == 27, lcolor("`r(p27)'")) 	///
(line weight week if id == 28, lcolor("`r(p28)'")) 	///
(line weight week if id == 29, lcolor("`r(p29)'")) 	///
(line weight week if id == 30, lcolor("`r(p30)'")) 	///
(line weight week if id == 31, lcolor("`r(p31)'")) 	///
(line weight week if id == 32, lcolor("`r(p32)'")) 	///
(line weight week if id == 33, lcolor("`r(p33)'")) 	///
(line weight week if id == 34, lcolor("`r(p34)'")) 	///
(line weight week if id == 35, lcolor("`r(p35)'")) 	///
(line weight week if id == 36, lcolor("`r(p36)'")) 	///
(line weight week if id == 37, lcolor("`r(p37)'")) 	///
(line weight week if id == 38, lcolor("`r(p38)'")) 	///
(line weight week if id == 39, lcolor("`r(p39)'")) 	///
(line weight week if id == 40, lcolor("`r(p40)'")) 	///
(line weight week if id == 41, lcolor("`r(p41)'")) 	///
(line weight week if id == 42, lcolor("`r(p42)'")) 	///
(line weight week if id == 43, lcolor("`r(p43)'")) 	///
(line weight week if id == 44, lcolor("`r(p44)'")) 	///
(line weight week if id == 45, lcolor("`r(p45)'")) 	///
(line weight week if id == 46, lcolor("`r(p46)'")) 	///
(line weight week if id == 47, lcolor("`r(p47)'")) 	///
(line weight week if id == 48, lcolor("`r(p48)'")) 	///
 , legend(off) 

*Fig 29.9 - Complex rainbow box plot 
colorpalette spmap rainbow, n(48) nograph 
graph box weight, over(id) legend(order(1 "Pig 1" 48 "Pig 48")) ///
asyvars nooutsides ///
 box(1, color("`r(p1)'")) ///
 box(2, color("`r(p2)'")) ///
 box(3, color("`r(p3)'")) ///
 box(4, color("`r(p4)'")) ///
 box(5, color("`r(p5)'")) ///
 box(6, color("`r(p6)'")) ///
 box(7, color("`r(p7)'")) ///
 box(8, color("`r(p8)'")) ///
 box(9, color("`r(p9)'")) ///
 box(10, color("`r(p10)'")) ///
 box(11, color("`r(p11)'")) ///
 box(12, color("`r(p12)'")) ///
 box(13, color("`r(p13)'")) ///
 box(14, color("`r(p14)'")) ///
 box(15, color("`r(p15)'")) ///
 box(16, color("`r(p16)'")) ///
 box(17, color("`r(p17)'")) ///
 box(18, color("`r(p18)'")) ///
 box(19, color("`r(p19)'")) ///
 box(20, color("`r(p20)'")) ///
 box(21, color("`r(p21)'")) ///
 box(22, color("`r(p22)'")) ///
 box(23, color("`r(p23)'")) ///
 box(24, color("`r(p24)'")) ///
 box(25, color("`r(p25)'")) ///
 box(26, color("`r(p26)'")) ///
 box(27, color("`r(p27)'")) ///
 box(28, color("`r(p28)'")) ///
 box(29, color("`r(p29)'")) ///
 box(30, color("`r(p30)'")) ///
 box(31, color("`r(p31)'")) ///
 box(32, color("`r(p32)'")) ///
 box(33, color("`r(p33)'")) ///
 box(34, color("`r(p34)'")) ///
 box(35, color("`r(p35)'")) ///
 box(36, color("`r(p36)'")) ///
 box(37, color("`r(p37)'")) ///
 box(38, color("`r(p38)'")) ///
 box(39, color("`r(p39)'")) ///
 box(40, color("`r(p40)'")) ///
 box(41, color("`r(p41)'")) ///
 box(42, color("`r(p42)'")) ///
 box(43, color("`r(p43)'")) ///
 box(44, color("`r(p44)'")) ///
 box(45, color("`r(p45)'")) ///
 box(46, color("`r(p46)'")) ///
 box(47, color("`r(p47)'")) /// 
 box(48, color("`r(p48)'"))  
