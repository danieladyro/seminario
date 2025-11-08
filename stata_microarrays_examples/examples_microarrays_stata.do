cd "C:\Users\Sala.Posgrados\Downloads\SESION_04_JUEVES"

* Example 6.1 La expresión de un gene medido con un tecnología 
* se sabe que tiene una expresión promedio de 1.5 en humanos in una condición
* Se mide la expresión del gen en varios arrays, se obtienen los siguientes valores 

import excel "analisis_microarrays_examples.xlsx", sheet("example6.1page133") firstrow

list

describe

ttest A == 1.5

* La expresión de un gene se mide en personas control y pacientes de cancer  

import excel "analisis_microarrays_examples.xlsx", sheet("example6.5page140") firstrow clear

describe

list

ttest respuesta, by(tratamiento)

sdtest respuesta, by(tratamiento)

* expresion del gen AC002378 en pacientes con cancer y sin cancer

import excel "analisis_microarrays_examples.xlsx", sheet("AC002378page147") firstrow clear

describe

list

by tratamiento, sort : ci means respuesta



* nine patients who received tranquilizer T, were taken from a double-blind
* clinical trial involving two tranquilizers. The measure used was the Hamilton (1960)
* depression scale factor IV (the “suicidal” factor). The X (pre) value was obtained at the
* first patient visit after initiation of therapy, whereas the Y (post) value was obtained at
* the second visit after initiation of therapy. The patients had been diagnosed as having
* mixed anxiety and depression.

import excel "analisis_microarrays_examples.xlsx", sheet("tranquilizerpage43wide") firstrow clear

ttest Xi == Yi


* values of heat-insoluble hydroxyproline in the skin of children before and 3 months after growth hormone
* therapy. Can we conclude on the basis of these data that growth hormone therapy increases
* heat-insoluble hydroxyproline in the skin?

import excel "analisis_microarrays_examples.xlsx", sheet("hidroxiprolinapage54wide") firstrow clear

ttest Before == After


* death penalty
* gunregistration	deathpenalty	respuesta
* 1	1	784
* 1	0	236
* 0	1	311
* 0	0	66
* 1 a favor 0 en contra

import excel "analisis_microarrays_examples.xlsx", sheet("deathpenaltypage504") firstrow clear

cs gunregistration deathpenalty [fw=respuesta]

tabi 784 236 \ 311 66, chi2

