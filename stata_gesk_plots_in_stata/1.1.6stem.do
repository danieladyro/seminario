*Install 
net install "https://www.stata-journal.com/software/sj7-3/gr0028"

clear all
*Load data
sysuse auto
summarize

*Fig 6.1 - Stem-and-leaf plot as text plot
stem mpg

* Stem-and-leaf plot as text plot
stem mpg

*Fig 6.2 - Stem-and-leaf plot as text plot with with custom binning
stem mpg, lines(1) digits(1)

* Stem-and-leaf plot as text plot with custom binning
stem mpg, lines(1) digits(1)

*Fig 6.3 - Graph stem-and-leaf plot
stemplot mpg

*Fig 6.4 - Graph stem-and-leaf plot with two digits
stemplot mpg, digits(2) 

*Fig 6.5 - Graph stem-and-leaf plot horizontal plot
stemplot mpg, digits(2) horizontal mlabcolor(black)

*Fig 6.6 - Graph stem-and-leaf plot over two variables
stemplot mpg, digits(2) by(foreign) back mlabcolor(black)

