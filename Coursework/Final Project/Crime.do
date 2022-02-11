log using "C:\Users\k19056473\Downloads\crime.smcl", replace
use "C:\Users\k19056473\Downloads\crime8.dta"  

*A) DD table 
mean(crime) if treat==1 & policy6==0
mean(crime) if treat==1 & policy6==1
mean(crime) if treat==0 & policy6==0
mean(crime) if treat==0 & policy6==1 

mean(police) if treat==1 & policy6==0
mean(police) if treat==1 & policy6==1
mean(police) if treat==0 & policy6==0
mean(police) if treat==0 & policy6==1

xi: reg crime i.policy6*i.treat, cluster (borough)
xi: reg police i.policy6*i.treat, cluster (borough)

*B) OLS model 
gen lnCrime=ln(crime)
gen lnPolice=ln(police)
xi: reg lnCrime post lnPolice, cluster (borough)
xi: reg lnCrime post lnPolice, 

*C) Change in police 
gsort borough week
gen lagpolice=lnPolice[_n-52] if week>52
gen ChLnPolice= lnPolice-lagpolice
gen interac= treat*post

reg ChLnPolice post interac, cluster (borough)
reg ChLnPolice post interac

*D) Change in crime
gen lagcrime=lnCrime[_n-52] if week>52
gen ChLnCrime= lnCrime- lagcrime

reg ChLnCrime post interac, cluster (borough)
reg ChLnCrime post interac

*E) IV estimation
ivregress 2sls ChLnCrime post (ChLnPolice = interac), cluster (borough) first

translate "C:\Users\k19056473\Downloads\crime.smcl"   "C:\Users\k19056473\Downloads\Q1Results.pdf"




