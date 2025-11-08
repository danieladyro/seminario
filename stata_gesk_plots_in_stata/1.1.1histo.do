*Install 

ssc install eqprhistogram
ssc install hist3
ssc install bihist
ssc install stripplot

clear all
* Load data
sysuse citytemp
summarize tempjan

*Fig 1.1 - A basic histogram
histogram tempjan

*Fig 1.2 - Options that change bin sizes
histogram tempjan, bin(10) name(g1, replace)
histogram tempjan, bin(50) name(g2, replace)
histogram tempjan, discrete name(g3, replace)
histogram tempjan, width(10) name(g4, replace)
graph combine g1 g3 g2 g4

*Fig 1.3 - Options that change the y axis
histogram tempjan, density name(g1, replace)
histogram tempjan, fraction name(g2, replace)
histogram tempjan, frequency name(g3, replace)
histogram tempjan, percent name(g4, replace)
graph combine g1 g3 g2 g4

*Fig 1.4 - Adding bar labels
histogram tempjan, addlabels addlabopts(mlabangle(45) ///
 mlabformat(%9.3f) mlabsize(vsmall))

*Fig 1.5 - Adding kernel density plot
histogram tempjan, width(5) kdensity kdenopts(bwidth(5))

*Fig 1. 6 - A basic spike plot 
spikeplot tempjan

*Fig 1.7 - Spike plot with custom bin width
spikeplot tempjan, round(1)

*Fig 1.8 - Spike plot with custom bin width and custom line width
spikeplot tempjan, round(5) fraction lwidth(*10)

*Fig 1.9 - Equal probability histogram with 5 bins
eqprhistogram tempjan, bin(5) 

*Fig 1.10 - Histogram with custom bin sizes
hist3 tempjan, values(2.2, 5, 20, 25, 50, 73)

*Fig 1.11 - Multiple histograms with by()
histogram tempjan, by(region)

*Fig 1.12 - Multiple two-way histograms
twoway (histogram tempjan if region == 1, color(edkblue%30)) ///
 (histogram tempjan if region == 2, color(erose%30)) ///
 (histogram tempjan if region == 3, color(stone%30)) ///
 (histogram tempjan if region == 4, color(emerald%30))

*Two histograms with bihist
generate south = (region==3)
tabulate south

*Fig 1.13 - Mirrored histogram
bihist tempjan, by(south) density

*Fig 1.14 - Ridgeline histogram using stripplot command
stripplot tempjan, over(division) stack msymbol(S) msize(small) width(1)

*Fig 1.15 - Ridgeline histogram using dotplot command
dotplot tempjan, over(division) msymbol(S) msize(small) ny(50)


