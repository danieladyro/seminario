*Install heatplot
ssc install palettes
ssc install heatplot
ssc install colrspace

clear all
*Load data
webuse nhanes2
summarize agegrp sex bpsystol weight height
list agegrp sex bpsystol weight height in 1/20

*Fig 23.1 - Trivariate heat plot with three continuous variables
heatplot bpsystol weight height

*Fig 23.2 - Trivariate heat plot with custom color bins
heatplot bpsystol weight height, cut(0, 120, 130, 140, 160, 180, 300)

*Fig 23.3 - Trivariate heat plot with two continuous variabled and one dichotomous z variable
heatplot female weight height

*Fig 23.4 - Trivariate heat plot with scaled color fields
heatplot bpsystol weight height, cut(0, 120, 130, 140, 160, 180, 300) ///
 sizeprop 

*Fig 23.5 - Trivariate discrete heat plot
heatplot weight height female, xdiscrete(0.9)

*Fig 23.6 - Trivariate discrete heat plot with relative frequencies
heatplot weight height i.agegrp, xdiscrete(0.9) sizeprop colors(twilight)

*Fig 23.7 - Trivariate heat plot with categorical x and y variables
heatplot weight i.hlthstat i.agegrp if hlthstat != 8, ydiscrete(0.9) ///
 xdiscrete(0.9)

*Fig 23.8 - Trivariate heat plot with categorical x and y variables
heatplot weight i.hlthstat i.agegrp if hlthstat != 8, ydiscrete(0.9) ///
 xdiscrete(0.9) sizeprop


