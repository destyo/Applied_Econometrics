log using "C:\Users\k19056473\Downloads\elections.smcl", replace
use "C:\Users\k19056473\Downloads\election8.dta"   


*C)
sort yearel
orthpoly difshare if difshare>=0, deg(4) generate( difshareP difshare2P difshare3P difshare4P)
reg mmyoutcomenext difshare difshare2P difshare3P difshare4P, robust 
predict Fitlin

orthpoly difshare if difshare<=0, deg(4) generate( difshareN difshare2N difshare3N difshare4N)
reg mmyoutcomenext difshare difshare2N difshare3N difshare4N, robust 
predict LinFit

twoway (scatter mmyoutcomenext difshare) (line LinFit difshare if difshare <= 0,  lcolor(red black) lpattern(dash)) ///
                                         (line Fitlin  difshare if difshare >= 0, lcolor(red black) lpattern(dash))

/*
gen difshareP = difshare>0
gen difshare2P = difshare^2 if difshare >0
gen difshare3P = difshare^3 if difshare >0
gen difshare4P = difshare^4 if difshare >0

gen difshareN = difshare<=0
gen difshare2N = difshare^2 if difshare <=0
gen difshare3N = difshare^3 if difshare <=0
gen difshare4N = difshare^4 if difshare <=0
reg mmyoutcomenext difshareN difshare2N difshare3N difshare4N



yearel difshare mmyoutcomenext mrunagain mofficeexp melectexp

*gen over21 = agecell >= 21

* Simple model - linear
reg all agecell over21, robust
predict allfitlin
							 
* Quadratic model on each side
gen age = agecell - 21
gen age2 = age^2
gen over_age = over21*age
gen over_age2 = over21*age2

reg all age age2 over21 over_age over_age2, robust
predict allfitqi

twoway (scatter all agecell) (line allfitlin allfitqi agecell if age < 0,  lcolor(red black) lpattern(dash)) ///
                             (line allfitlin allfitqi agecell if age >= 0, lcolor(red black) lpattern(dash))
					 
				
*Restrict to age group 20-21
keep if agecell>=20&agecell<22
reg all agecell over21, robust
predict allfitlinred

reg all age age2 over21 over_age over_age2, robust
predict allfitqired

twoway (scatter all agecell) (line allfitlinred allfitqired agecell if age < 0,  lcolor(red black) lpattern(dash)) ///
                             (line allfitlinred allfitqired agecell if age >= 0, lcolor(red black) lpattern(dash))












