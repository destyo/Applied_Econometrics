log using "C:\Users\k19056473\Downloads\Ulntitled.smcl", replace

use "C:\Users\k19056473\Downloads\immigration.dta"  
 


*Question a
gen immratio = (immpop/pop)*100

collapse hpyear


*Question  b

twoway (connected hpyear year, yaxis(1))(connected immratio year, yaxis(2))


*Question c
use "\\kclad.ds.kcl.ac.uk\anywhere\UserData\UGStore02\k19056473\My Documents\immigration.dta" 

*Declare data as panel 
egen tvar=group(year)
egen svat=group(uala)
tsset svat tvar 

*construct the dependant variable 
gen lnhpyear = ln(hpyear)
gen Dlnhpyear = D.lnhpyear

*construct the independant variable 
gen Dimmpop=D.immpop 
gen Lpop=L.pop 
gen imms=Dimmpop/Lpop
