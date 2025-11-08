*Install sepscatter
ssc install sepscatter

clear all
*Load data
sysuse census
summarize
list medage death state pop in 1/10, separator(0)

*Fig 24.1 - A basic bubble plot
twoway (scatter medage death [fweight = pop])

*Fig 24.2 - Bubble plot formatted 
twoway (scatter medage death [fweight = pop], mlcolor(black) ///
 mlwidth(vthin) mfcolor(ltblue%70))
 
*Fig 24.3 - Bubble plot with wrong marker labels
twoway (scatter medage death [fweight = pop], mlcolor(black) ///
 mlwidth(vthin) mfcolor(ltblue%70) mlabel(state2)) 

*Fig 24.4 - Bubble plot with correct marker labels
twoway (scatter medage death [fweight = pop], mlcolor(black) ///
 mlwidth(vthin) mfcolor(ltblue%70)) (scatter medage death, msymbol(i) ///
 mlabel(state2) mlabsize(*0.7) mlabcolor(black) mlabposition(0))

*Fig 24.5 - Stata marker symbols
symbolpalette

*Fig 24.6 - Bubble plot with diamond markers
twoway (scatter medage death [fweight = pop], mlcolor(black) ///
 mlwidth(vthin) mfcolor(ltblue%70) msymbol(D)) 

*Fig 24.7 - Bubble plot over multiple groups
twoway (scatter medage death [fweight = pop] if region == 1, ///
 mlcolor(black) mlwidth(vthin) msymbol(O) mfcolor(ltblue%70)) ///
 (scatter medage death [fweight = pop] if region == 2, ///
 mlcolor(black) mlwidth(vthin) msymbol(D) mfcolor(erose%70)) ///
(scatter medage death [fweight = pop] if region == 3, mlcolor(black) ///
 mlwidth(vthin) msymbol(T) mfcolor(eltgreen%70)) ///
(scatter medage death [fweight = pop] if region == 4, mlcolor(black) ///
 mlwidth(vthin) msymbol(S) mfcolor(edkblue%70) legend(position(6) row(1) ///
 label(1 "NE") label(2 "N Cntrl") label(3 "South") label(4 "West")))

*Fig 24.8 - Bubble plot over multiple groups with sepscatter
sepscatter medage death [fweight = pop], separate(region)

