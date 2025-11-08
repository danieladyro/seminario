clear all
*Load data
sysuse nlsw88
summarize

*Fig 9.1 - Simple bar chart
graph bar (count), over(race) 

*Fig 9.2 - Simple bar chart with asyvars
graph bar (count), over(race) asyvars

*Fig 9.3 - Percentage bar chart
graph bar (percent), over(race) ylabel(0(20)100)

*Fig 9.4 - Horizontal percentage bar chart
graph hbar (percent), over(occupation) 

*Fig 9.5 - A sorted bar chart
graph hbar (percent), over(occupation, sort(1) descending)

*Fig 9.6 - Multiple bar charts
graph bar (count), over(race) by(south) 

*Fig 9.7 - Multiple bar charts with two over() options
graph bar (count), over(race) over(south)

*Fig 9.8 - Multiple bar charts with three over() options
graph bar (count), over(race) over(south) over(union)

*Fig 9.9 - Dot chart
graph dot (count), over(occupation)


