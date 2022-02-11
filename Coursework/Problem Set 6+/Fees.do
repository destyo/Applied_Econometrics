log using "C:\Users\k19056473\Downloads\fees.smcl" , replace
use "C:\Users\k19056473\Downloads\TuitionFees.dta" 

*1. Estimation of the DD model

gen logApp=ln(applications)
gen logPop=ln(Poptotal)
gen afterinc = (year>=2012) * (app_country == "England")
gen Eng = app_country=="England"
gen male = gender=="Male"
tabulate age_band, generate (age_dummy)
summarize logApp
xi: reg logApp Eng i.year afterinc male age_dummy2 age_dummy3 age_dummy4 logPop, vce(cluster app_country)

*2. Graph	

collapse (sum) applications, by (year app_country)
gen treat = app_country=="England"
gen logApp=ln(applications)
twoway (line logApp year if treat == 0) (line logApp year if treat == 1)

*3. country-specific  linear trend 

clear
use "C:\Users\k19056473\Downloads\TuitionFees.dta" 
gen logApp=ln(applications)
gen logPop=ln(Poptotal)
gen afterinc = (year>=2012) * (app_country == "England")
gen Eng = app_country=="England"
gen male = gender=="Male"
gen CounTrend=Eng*year
tabulate age_band, generate (age_dummy)
summarize logApp
xi: reg logApp Eng i.year CounTrend afterinc male age_dummy2 age_dummy3 age_dummy4 logPop, vce(cluster app_country)

*4. STEM and non-STEM subjects

gen NOSTEM = STEM==0
gen AIncSTEM = afterinc*STEM
gen AIncNOSTEM = afterinc*NOSTEM
xi: reg logApp Eng i.year i.STEM AIncSTEM AIncNOSTEM male age_dummy2 age_dummy3 age_dummy4 logPop, vce(cluster app_country)

*5.  Expected salary

gen AincQ1 = afterinc*Quartile== 1
gen AincQ2 = afterinc*Quartile== 2
gen AincQ3 = afterinc*Quartile== 3
gen AincQ4 = afterinc*Quartile== 4

xi: reg logApp Eng i.year i.Quartile AincQ1 AincQ2 AincQ3 AincQ4 male age_dummy2 age_dummy3 age_dummy4 logPop, vce(cluster app_country)

. translate "C:\Users\k19056473\Downloads\fees.smcl"   "C:\Users\k19056473\Downloads\PSet6Results.pdf"





