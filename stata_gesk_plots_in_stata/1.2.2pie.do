clear all

*Load data
sysuse nlsw88
summarize

*Fig 10.1 - Basic pie chart
graph pie, over(race)

*Fig 10.2 - An overloaded pie chart
graph pie, over(occupation)

*Fig 10.3 - Labeling pies
graph pie, over(race) plabel(_all percent)

*Fig 10.4 - Exploding pies
graph pie, over(race) plabel(_all name) pie(2, explode(10))

*Fig 10.5 - Sorting pies
graph pie, over(occupation) sort

*Fig 10.6 - Multiple pie charts with by()
graph pie, over(union) by(occupation)
