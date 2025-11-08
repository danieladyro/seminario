*Install chernoff
net install "https://www.stata-journal.com/software/sj9-3/gr0038"

clear all
*Load data
sysuse auto
*Sample data
set seed 1234
sample 40
*Examine data
list make price mpg headroom trunk weight length, separator(0)

*Fig 25.1 - Chernoff faces
chernoff, isize(price) psize(mpg) bdens(headroom) fline(trunk) ///
hdark(weight) msize(length) ititle(make) 

*Fig 25.2 - With legend()
chernoff, isize(price) psize(mpg) bdens(headroom) fline(trunk) ///
hdark(weight) msize(length) ititle(make) legend(2) 

*Fig 25.3 - With custom ordering 
chernoff, isize(price) psize(mpg) bdens(headroom) fline(trunk) ///
hdark(weight) msize(length) ititle(make) legend(2) order(weight) 

*Fig 25.4 - With half faces and custom rows
chernoff, isize(price) psize(mpg) bdens(headroom) fline(trunk) ///
hdark(weight) msize(length) ititle(make) legend(2) order(weight) ///
rhalf hspace(0.5) rows(2)
