*Install
ssc install heatplot
ssc install palettes
ssc install colrspace

clear all
*Load data
webuse nhanes2
summarize

*Fig 13.1 - The basic problem
twoway (scatter weight height)

*Fig 13.2 - Basic heat plot bivariate distribution
heatplot weight height

*Fig 13.3 - A heat plot bivariate distribution using count statistics
heatplot weight height, statistic(count) keylabels(, format(%9.1f))

*Fig 13.4 - Heat plot with four levels
heatplot weight height, levels(4)

*Fig 13.5 - Heat plot with 50 levels and colors
heatplot weight height, levels(50) colors(oranges)

*Fig 13.6 - Heat plot with different bin widths
heatplot weight height, bins(10)

*Fig 13.7 - Heat plot with different bin widths
heatplot weight height, ybwidth(1) xbwidth(5) hexagon

*Fig 13.8 - Heat plot with proportional bins
heatplot weight height, size 

*Fig 13.9 - Heat plot with different bin widths
heatplot weight height, scatter title(Circle) ///
 name(circle, replace)
heatplot weight height, scatter(square) title(Square) ///
 name(square, replace)
heatplot weight height, scatter(triangle) title(Triangle) ///
 name(triangle, replace)
heatplot weight height, scatter(circle_hollow) title(Hollow circle) ///
 name(chollow, replace)
graph combine circle square triangle chollow

*Fig 13.10 - Hex-heat plot
hexplot weight height

*Fig 13.11 - Hex-heat plot with custom bins
heatplot weight height, bins(10) hexagon

*Fig 13.12 - A basic sunflower plot
sunflower weight height

*Fig 13.13 - Sunflower plot with custom bins
sunflower weight height, petalweight(2) dark(10) light(2)
