{smcl}
{com}{sf}{ul off}{txt}{.-}
      name:  {res}<unnamed>
       {txt}log:  {res}C:\Users\k19056473\Downloads\bm.do
  {txt}log type:  {res}smcl
 {txt}opened on:  {res}14 Oct 2019, 15:00:36
{txt}
{com}. 
. use "C:\Users\k19056473\Downloads\auto.dta" 
{txt}(1978 Automobile Data)

{com}. 
. *Question 2 a
. twoway (scatter price weight) (lfit price weight)
{res}{txt}
{com}. 
. 
. 
. *Question 2 b
. reg price weight, vce (robust) 

{txt}Linear regression                               Number of obs     = {res}        74
                                                {txt}F(1, 72)          =  {res}    27.51
                                                {txt}Prob > F          = {res}    0.0000
                                                {txt}R-squared         = {res}    0.2901
                                                {txt}Root MSE          =    {res} 2502.3

{txt}{hline 13}{c TT}{hline 11}{hline 11}{hline 9}{hline 8}{hline 13}{hline 12}
{col 14}{c |}{col 26}    Robust
{col 1}       price{col 14}{c |}      Coef.{col 26}   Std. Err.{col 38}      t{col 46}   P>|t|{col 54}     [95% Con{col 67}f. Interval]
{hline 13}{c +}{hline 11}{hline 11}{hline 9}{hline 8}{hline 13}{hline 12}
{space 6}weight {c |}{col 14}{res}{space 2} 2.044063{col 26}{space 2} .3897465{col 37}{space 1}    5.24{col 46}{space 3}0.000{col 54}{space 4} 1.267117{col 67}{space 3} 2.821008
{txt}{space 7}_cons {c |}{col 14}{res}{space 2}-6.707353{col 26}{space 2} 1032.394{col 37}{space 1}   -0.01{col 46}{space 3}0.995{col 54}{space 4}-2064.747{col 67}{space 3} 2051.332
{txt}{hline 13}{c BT}{hline 11}{hline 11}{hline 9}{hline 8}{hline 13}{hline 12}
{res}{txt}
{com}.  
. 
. *Question 2 d
. reg price foreign, vce (robust)

{txt}Linear regression                               Number of obs     = {res}        74
                                                {txt}F(1, 72)          =  {res}     0.20
                                                {txt}Prob > F          = {res}    0.6577
                                                {txt}R-squared         = {res}    0.0024
                                                {txt}Root MSE          =    {res} 2966.4

{txt}{hline 13}{c TT}{hline 11}{hline 11}{hline 9}{hline 8}{hline 13}{hline 12}
{col 14}{c |}{col 26}    Robust
{col 1}       price{col 14}{c |}      Coef.{col 26}   Std. Err.{col 38}      t{col 46}   P>|t|{col 54}     [95% Con{col 67}f. Interval]
{hline 13}{c +}{hline 11}{hline 11}{hline 9}{hline 8}{hline 13}{hline 12}
{space 5}foreign {c |}{col 14}{res}{space 2} 312.2587{col 26}{space 2} 701.7814{col 37}{space 1}    0.44{col 46}{space 3}0.658{col 54}{space 4}-1086.717{col 67}{space 3} 1711.234
{txt}{space 7}_cons {c |}{col 14}{res}{space 2} 6072.423{col 26}{space 2} 431.2084{col 37}{space 1}   14.08{col 46}{space 3}0.000{col 54}{space 4} 5212.825{col 67}{space 3} 6932.021
{txt}{hline 13}{c BT}{hline 11}{hline 11}{hline 9}{hline 8}{hline 13}{hline 12}
{res}{txt}
{com}. 
. *Question 2 e
. reg price foreign weight, vce (robust) 

{txt}Linear regression                               Number of obs     = {res}        74
                                                {txt}F(2, 71)          =  {res}    22.87
                                                {txt}Prob > F          = {res}    0.0000
                                                {txt}R-squared         = {res}    0.4989
                                                {txt}Root MSE          =    {res}   2117

{txt}{hline 13}{c TT}{hline 11}{hline 11}{hline 9}{hline 8}{hline 13}{hline 12}
{col 14}{c |}{col 26}    Robust
{col 1}       price{col 14}{c |}      Coef.{col 26}   Std. Err.{col 38}      t{col 46}   P>|t|{col 54}     [95% Con{col 67}f. Interval]
{hline 13}{c +}{hline 11}{hline 11}{hline 9}{hline 8}{hline 13}{hline 12}
{space 5}foreign {c |}{col 14}{res}{space 2} 3637.001{col 26}{space 2} 643.1538{col 37}{space 1}    5.65{col 46}{space 3}0.000{col 54}{space 4} 2354.589{col 67}{space 3} 4919.413
{txt}{space 6}weight {c |}{col 14}{res}{space 2} 3.320737{col 26}{space 2} .5010322{col 37}{space 1}    6.63{col 46}{space 3}0.000{col 54}{space 4} 2.321707{col 67}{space 3} 4.319767
{txt}{space 7}_cons {c |}{col 14}{res}{space 2}-4942.844{col 26}{space 2} 1593.664{col 37}{space 1}   -3.10{col 46}{space 3}0.003{col 54}{space 4}-8120.519{col 67}{space 3}-1765.169
{txt}{hline 13}{c BT}{hline 11}{hline 11}{hline 9}{hline 8}{hline 13}{hline 12}
{res}{txt}
{com}. 
. *Auxiliary regression 
. reg foreign weight

{txt}      Source {c |}       SS           df       MS      Number of obs   ={res}        74
{txt}{hline 13}{c +}{hline 34}   F(1, 72)        = {res}    39.02
{txt}       Model {c |} {res} 5.43318505         1  5.43318505   {txt}Prob > F        ={res}    0.0000
{txt}    Residual {c |} {res} 10.0262744        72  .139253811   {txt}R-squared       ={res}    0.3514
{txt}{hline 13}{c +}{hline 34}   Adj R-squared   ={res}    0.3424
{txt}       Total {c |} {res} 15.4594595        73  .211773417   {txt}Root MSE        =   {res} .37317

{txt}{hline 13}{c TT}{hline 11}{hline 11}{hline 9}{hline 8}{hline 13}{hline 12}
{col 1}     foreign{col 14}{c |}      Coef.{col 26}   Std. Err.{col 38}      t{col 46}   P>|t|{col 54}     [95% Con{col 67}f. Interval]
{hline 13}{c +}{hline 11}{hline 11}{hline 9}{hline 8}{hline 13}{hline 12}
{space 6}weight {c |}{col 14}{res}{space 2} -.000351{col 26}{space 2} .0000562{col 37}{space 1}   -6.25{col 46}{space 3}0.000{col 54}{space 4}-.0004631{col 67}{space 3} -.000239
{txt}{space 7}_cons {c |}{col 14}{res}{space 2}   1.3572{col 26}{space 2} .1751417{col 37}{space 1}    7.75{col 46}{space 3}0.000{col 54}{space 4} 1.008061{col 67}{space 3} 1.706338
{txt}{hline 13}{c BT}{hline 11}{hline 11}{hline 9}{hline 8}{hline 13}{hline 12}
{res}{txt}
{com}. 
. 
. *Question 2 g 
. gen lnprice=ln(price) 
{txt}
{com}. reg lnprice foreign , vce (robust)

{txt}Linear regression                               Number of obs     = {res}        74
                                                {txt}F(1, 72)          =  {res}     0.60
                                                {txt}Prob > F          = {res}    0.4414
                                                {txt}R-squared         = {res}    0.0076
                                                {txt}Root MSE          =    {res} .39332

{txt}{hline 13}{c TT}{hline 11}{hline 11}{hline 9}{hline 8}{hline 13}{hline 12}
{col 14}{c |}{col 26}    Robust
{col 1}     lnprice{col 14}{c |}      Coef.{col 26}   Std. Err.{col 38}      t{col 46}   P>|t|{col 54}     [95% Con{col 67}f. Interval]
{hline 13}{c +}{hline 11}{hline 11}{hline 9}{hline 8}{hline 13}{hline 12}
{space 5}foreign {c |}{col 14}{res}{space 2} .0741515{col 26}{space 2} .0957919{col 37}{space 1}    0.77{col 46}{space 3}0.441{col 54}{space 4}-.1168062{col 67}{space 3} .2651093
{txt}{space 7}_cons {c |}{col 14}{res}{space 2} 8.618587{col 26}{space 2} .0561798{col 37}{space 1}  153.41{col 46}{space 3}0.000{col 54}{space 4} 8.506595{col 67}{space 3}  8.73058
{txt}{hline 13}{c BT}{hline 11}{hline 11}{hline 9}{hline 8}{hline 13}{hline 12}
{res}{txt}
{com}. reg lnprice foreign weight, vce (robust)

{txt}Linear regression                               Number of obs     = {res}        74
                                                {txt}F(2, 71)          =  {res}    30.21
                                                {txt}Prob > F          = {res}    0.0000
                                                {txt}R-squared         = {res}    0.5480
                                                {txt}Root MSE          =    {res} .26729

{txt}{hline 13}{c TT}{hline 11}{hline 11}{hline 9}{hline 8}{hline 13}{hline 12}
{col 14}{c |}{col 26}    Robust
{col 1}     lnprice{col 14}{c |}      Coef.{col 26}   Std. Err.{col 38}      t{col 46}   P>|t|{col 54}     [95% Con{col 67}f. Interval]
{hline 13}{c +}{hline 11}{hline 11}{hline 9}{hline 8}{hline 13}{hline 12}
{space 5}foreign {c |}{col 14}{res}{space 2} .5352669{col 26}{space 2} .0859507{col 37}{space 1}    6.23{col 46}{space 3}0.000{col 54}{space 4}  .363886{col 67}{space 3} .7066477
{txt}{space 6}weight {c |}{col 14}{res}{space 2} .0004606{col 26}{space 2}   .00006{col 37}{space 1}    7.67{col 46}{space 3}0.000{col 54}{space 4} .0003409{col 67}{space 3} .0005802
{txt}{space 7}_cons {c |}{col 14}{res}{space 2} 7.090858{col 26}{space 2}  .199869{col 37}{space 1}   35.48{col 46}{space 3}0.000{col 54}{space 4}  6.69233{col 67}{space 3} 7.489385
{txt}{hline 13}{c BT}{hline 11}{hline 11}{hline 9}{hline 8}{hline 13}{hline 12}
{res}{txt}
{com}. 
. 
. 
. 
. translate "C:\Users\k19056473\Downloads\auto.dta""C:\Users\k19056473\Downloads\sauto.pdf"
{err}translator dta2pdf not found
{txt}{search r(111), local:r(111);}

end of do-file

{search r(111), local:r(111);}

{com}. clear

. log close
      {txt}name:  {res}<unnamed>
       {txt}log:  {res}C:\Users\k19056473\Downloads\bm.do
  {txt}log type:  {res}smcl
 {txt}closed on:  {res}14 Oct 2019, 15:01:45
{txt}{.-}
{smcl}
{txt}{sf}{ul off}