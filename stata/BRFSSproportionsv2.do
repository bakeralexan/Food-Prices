///descriptive
su, detail
describe
histogram food
histogram _diabete3
histogram obese
kdensity female
kdensity black
kdensity job
graph twoway scatter _diabete3 food, msize(small)|| lfit _diabete3 food , lwidth(thick) 
graph box active _35kplus _age65yr female job college smoke, over(iyear) ytitle (Proportions) asyvars
graph box _hispanc asian  native white  black, over(iyear) ytitle (Proportions) asyvars
tabstat _diabete3 obese _35kplus _age65yr _hispanc active asian college female food job native white smoke black female, by(iyear) stats(mean sd min max) format(%6.2f)
///diabetes OLS
regress _diabete3 food _35kplus _age65yr _hispanc active asian black college female job native obese smoke white,r
///diabetes hausman Report the FE results if Hausman test rejects the H0
xtset _state iyear
xtreg _diabete3 food _35kplus _age65yr _hispanc active asian black college female job native obese smoke white, re
estimates store random
xtreg _diabete3 food _35kplus _age65yr _hispanc active asian black college female job native obese smoke white, fe
estimates store fixed
hausman fixed random
///diabetes regression chart
regress _diabete3 food _35kplus _age65yr _hispanc active asian black college female job native obese smoke white,r
outreg, ctitle("Regressor",OLS Diabetes) se summstat(rmse\r2\r2_a\N) summdec(2 3 3 0) summtitle("SER"\"R^2"\"Adjusted R^2"\"N")
xtset _state iyear
xtreg _diabete3 food _35kplus _age65yr _hispanc active asian black college female job native obese smoke white, re
outreg using c:\temp\temptable, ctitle("Regressor",RE Diabetes) se merge summstat(rmse\r2\r2_a\N) summdec(2 3 3 0) summtitle("SER"\"R^2"\"Adjusted R^2"\"N")
xtreg _diabete3 food _35kplus _age65yr _hispanc active asian black college female job native obese smoke white, fe
outreg using c:\temp\temptable, ctitle("Regressor",FE Diabetes) se merge summstat(rmse\r2\r2_a\N) summdec(2 3 3 0) summtitle("SER"\"R^2"\"Adjusted R^2"\"N")
///obesity hausman Report the FE results if Hausman test rejects the H0
regress obese food _35kplus _age65yr _hispanc active asian black college female job native _diabete3 smoke white,r
xtset _state iyear
xtreg obese food _35kplus _age65yr _hispanc active asian black college female job native _diabete3 smoke white, re
estimates store random
xtreg obese food _35kplus _age65yr _hispanc active asian black college female job native _diabete3 smoke white, fe
estimates store fixed
hausman fixed random
///obesity regression chart
regress obese food _35kplus _age65yr _hispanc active asian black college female job native _diabete3 smoke white,r
outreg, ctitle("Regressor",OLS Diabetes) se summstat(rmse\r2\r2_a\N) summdec(2 3 3 0) summtitle("SER"\"R^2"\"Adjusted R^2"\"N")
xtset _state iyear
xtreg obese food _35kplus _age65yr _hispanc active asian black college female job native _diabete3 smoke white, re
outreg using c:\temp\temptable, ctitle("Regressor",RE Diabetes) se merge summstat(rmse\r2\r2_a\N) summdec(2 3 3 0) summtitle("SER"\"R^2"\"Adjusted R^2"\"N")
xtreg obese food _35kplus _age65yr _hispanc active asian black college female job native _diabete3 smoke white, fe
outreg using c:\temp\temptable, ctitle("Regressor",FE Diabetes) se merge summstat(rmse\r2\r2_a\N) summdec(2 3 3 0) summtitle("SER"\"R^2"\"Adjusted R^2"\"N")
