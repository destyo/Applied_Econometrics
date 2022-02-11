log using "C:\Users\k19056473\Downloads\elections.smcl", replace
use "C:\Users\k19056473\Downloads\election8.dta"   


*C)
gen dummyd=1 if difshare>=0
replace dummyd=0 if difshare<0
tab dummyd
sort difshare
gen difshareP = difshare if dummyd==1
gen difshare2P = difshare^2 if dummyd==1
gen difshare3P = difshare^3 if dummyd==1
gen difshare4P = difshare^4 if dummyd==1
reg mmyoutcomenext difshareP difshare2P difshare3P difshare4P, robust 
predict allfitqiP if dummyd==1
predict stderror1, stdp

gen difshareN = difshare if dummyd==0
gen difshare2N = difshare^2 if dummyd==0
gen difshare3N = difshare^3 if dummyd==0
gen difshare4N = difshare^4 if dummyd==0
reg mmyoutcomenext difshareN difshare2N difshare3N difshare4N, robust 
predict allfitqiN if dummyd==0
predict stderror2, stdp

summ allfitqiP stderror1 allfitqiN stderror2

reg mmyoutcomenext difshareP, robust 
predict allfitlinP

reg mmyoutcomenext difshareN, robust 
predict allfitlinN

twoway (scatter mmyoutcomenext difshare if difshare >=-.25 & difshare <=.25,  xline(0, lstyle(foreground))) (line allfitqiN allfitlinN difshare if dummyd==0 & difshare >=-.25 & difshare <=.25,  lcolor(red black)) ///
                                                                             (line allfitqiP allfitlinP difshare if dummyd==1 & difshare >=-.25 & difshare <=.25, lcolor(red black))
								                                            						   
									   
*D)
reg mrunagain difshareP difshare2P difshare3P difshare4P, robust 
predict Fitlin2

reg mrunagain difshareN difshare2N difshare3N difshare4N, robust 
predict LinFit2
twoway (scatter mrunagain difshare if difshare >=-.25 & difshare <=.25,  xline(0, lstyle(foreground))) (line LinFit2 difshare if difshare <= 0 & difshare >=-.25 & difshare <=.25,  lcolor(red black)) ///
                                         (line Fitlin2  difshare if difshare >= 0 & difshare >=-.25 & difshare <=.25, lcolor(red black))
*E)

reg mofficeexp difshareP difshare2P difshare3P difshare4P, robust 
predict Fitlin3

reg mofficeexp difshareN difshare2N difshare3N difshare4N, robust 
predict LinFit3
twoway (scatter mofficeexp difshare if difshare >=-.25 & difshare <=.25, xline(0, lstyle(foreground))) (line LinFit3 difshare if difshare <= 0 & difshare >=-.25 & difshare <=.25,  lcolor(red black)) ///
                                         (line Fitlin3  difshare if difshare >= 0 & difshare >=-.25 & difshare <=.25, lcolor(red black))
reg melectexp difshareP difshare2P difshare3P difshare4P, robust 
predict Fitlin4

reg melectexp difshareN difshare2N difshare3N difshare4N, robust 
predict LinFit4
twoway (scatter melectexp difshare if difshare >=-.25 & difshare <=.25, xline(0, lstyle(foreground))) (line LinFit4 difshare if difshare <=0 & difshare >=-.25 & difshare <=.25,  lcolor(red black)) ///
                                         (line Fitlin4  difshare if difshare >= 0 & difshare >=-.25 & difshare <=.25, lcolor(red black))
*F)

reg mmyoutcomenext melectexp mofficeexp difshareP difshare2P difshare3P difshare4P, robust 
predict Fitlin5

reg mmyoutcomenext melectexp mofficeexp difshareN difshare2N difshare3N difshare4N, robust 
predict LinFit5
twoway (scatter mmyoutcomenext difshare if difshare >=-.25 & difshare <=.25, xline(0, lstyle(foreground))) (line LinFit5 difshare if difshare <= 0 & difshare >=-.25 & difshare <=.25,  lcolor(red black)) ///
                                         (line Fitlin5  difshare if difshare >= 0 & difshare >=-.25 & difshare <=.25, lcolor(red black))

reg mrunagain melectexp mofficeexp difshareP difshare2P difshare3P difshare4P, robust 
predict Fitlin6

reg mrunagain melectexp mofficeexp difshareN difshare2N difshare3N difshare4N, robust 
predict LinFit6
twoway (scatter mrunagain difshare if difshare >=-.25 & difshare <=.25, xline(0, lstyle(foreground))) (line LinFit6 difshare if difshare <= 0 & difshare >=-.25 & difshare <=.25,  lcolor(red black)) ///
                                         (line Fitlin6  difshare if difshare >= 0& difshare >=-.25 & difshare <=.25, lcolor(red black))

translate "C:\Users\k19056473\Downloads\elections.smcl"   "C:\Users\k19056473\Downloads\Q2Results.pdf"


/*
orthpoly difshare if difshare>=0, deg(4) generate( difshareP difshare2P difshare3P difshare4P)
gen difshareP = difshare>0
gen difshare2P = difshare^2 if difshare >0
gen difshare3P = difshare^3 if difshare >0
gen difshare4P = difshare^4 if difshare >0
orthpoly difshare if difshare<=0, deg(4) generate( difshareN difshare2N difshare3N difshare4N)
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












