log using "C:\Users\k19056473\Downloads\deaths.smcl" , replace
use "C:\Users\k19056473\Downloads\deaths.dta" 

*Part a: No trends No weights
keep if agegr == 2 
egen tvar=group(year)
egen svar=group(state)
tsset svar tvar
xi: reg mrate legal1820 i.svar i.year, cluster (svar)
*xi: ...

*Part c: No trends, weights
xi: reg mrate legal1820 i.year i.svar (aw=pop), cluster (state)

*Part d: time trends no weitghts
xi: reg mrate legal1820 i.state*year i.year, cluster (state)

*Parte e. Control for beer tax 
xi: reg mrate legal1820 beertax i.state*year i.year, cluster(state)
clear
use use "C:\Users\k19056473\Downloads\deaths.dta"

*Part f 
