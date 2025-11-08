*Install
ssc install coefplot

*Disable graphs
set graphics off

*Set directory
cd /users/buschaf

*Loop
quietly forvalues i = 0(0.02)1 {
	
	*An incremental count local for filename saving
	local j=`j'+1

	*Clear
	clear

	*Set observations and seed
	set obs 1000
	set seed 1234

	generate e = rnormal()
	generate x1 = rnormal()
	generate x2 = rnormal()
	generate x3 = rnormal() + `i'*e

	generate y = 1 + 1*x1 + 1*x2 + 1*x3 + 1*e

	*regress data
	regress y x1 x2 x3

	*plott estimates
	coefplot, xline(1) xlabel(0(1)2)

	*Save graph as png
	graph export graph`j'.png, as(png) replace

}
*Turn graphs back on
set graphics on

*Use ffmpeg to merge individual graphs into video
shell /users/buschaf/ffmpeg -y -i /users/buschaf/graph%d.png -b:v 512k graph.mpg
