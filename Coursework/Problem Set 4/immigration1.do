log using "C:\Users\k19056473\Downloads\immigration1.smcl",replace

use "C:\Users\k19056473\Downloads\immigration.dta"
*Part a
*Calculate ratio of immigrants to population
gen immratio=(immpop/pop)*100

*Create a dataset with average house price index and average immigrant ratio 
collapse hpyear immratio, by(year)

*Calculate the correlation coefficient between the two variables
corr hpyear immratio

*Part b
*Plot the evolution of both variables over time
twoway (connected hpyear year, yaxis(1)) (connected immratio year, yaxis(2))
clear

*save "C:\Users\K1217797\Dropbox\KCL\Teaching\201920\Applied Econometrics\Classes\PSet4\immigration_averages.dta", replace

*Part c
use "C:\Users\k19056473\Downloads\immigration.dta" 
*Declare data as panel
egen tvar=group(year)
egen svar=group(uala)
tsset svar tvar 

*Construct the dependent variable in the model (change in log of house prices)
gen lnhpyear=ln(hpyear)
gen Dlnhpyear=D.lnhpyear

*Construct the independent variable in the model (change in immigrant pop/lagged pop)
gen Dimmpop=D.immpop
gen Lpop=L.pop
gen imms=Dimmpop/Lpop
xi: xtreg Dlnhpyear imms i.year, fe cluster(svar)
save "C:\Users\k19056473\Downloads\immigration_reg.dta"


use "C:\Users\k19056473\Downloads\immigration.dta" 
egen tvar=group(year)
egen svar=group(uala)
gen lnhpyear=ln(hpyear)
sort uala year
by uala: gen Dlnhpyear=lnhpyear-lnhpyear[_n-1]
by uala: gen Dimmpop=immpop-immpop[_n-1]
by uala: gen Lpop=pop[_n-1]
gen imms=Dimmpop/Lpop

*OLS estimation
*Least squares dummy variables

xi: reg Dlnhpyear imms i.year i.uala, cluster(svar)


*Part e
*IV estimation
clear
use "C:\Users\k19056473\Downloads\immigration_reg.dta"
xi: xtivreg2 Dlnhpyear i.year (imms=inst), fe first cluster(svar) 

estimates store IV
esttab OLS IV, keep(imms) star(* 0.1 ** 0.05 *** 0.01) b(%5.3f) se(%5.3f) stats(N)

		clear

*Part f
*Test for native displacement

use "C:\Users\k19056473\Downloads\immigration_reg.dta"

*Construct the dependent variable in the model (change in native pop/lagged pop)
gen Dnativepop=D.nativepop
gen natives=Dnativepop/Lpop
*OLS estimation
xi: xtreg natives imms i.year, fe cluster(svar)
estimates store OLS
*IV estimation
xi: xtivreg2 natives i.year (imms=inst), fe first cluster(svar) 
estimates store IV
esttab OLS IV, keep(imms) star(* 0.1 ** 0.05 *** 0.01) b(%5.3f) se(%5.3f) stats(N)
translate "C:\Users\k19056473\Downloads\immigration1.smcl"  "C:\Users\k19056473\Downloads\immigrationResults.pdf"
