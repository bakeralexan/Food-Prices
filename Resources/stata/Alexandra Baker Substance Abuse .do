****First you check the data to see if any modifications have to be done
describe
summarize
correl SUBABUSE ALCOHOL ////they are very highly correlated so I am going to substitute ALCOHOL for SUBABUSE because the ALCOHOL dataset is more complete
scatter ALCOHOL FACCAP ////it looks like it could have a quadratic "parabola" shape
lowess ALCOHOL FACCAP ////it looks like it could have a quadratic "parabola" shape
kdensity ALCOHOL //// it has a very normal distribution so I am not going to do anything to it
kdensity FACCAP /////Facilites is right skewed so I am going to get the log of it
gen LNFACCAP = ln(FACCAP)
kdensity LNFACCAP ////it now appears to have a normal distribution
kdensity AGE1CAP //// its bimodal
kdensity WHITECAP //// its left skewed so there is not much that I can do to fix that
kdensity BIZREG //// its right skewed so I'm going to get its log
gen LNBIZREG = ln(BIZREG)
kdensity LNBIZREG ////now its slightly left skewed so I'm just going to use the original BIZREG
kdensity CONSTRUCTCAP //// its extremely right skewed so I'm going to get its log
gen LNCONSTRUCTCAP = ln(CONSTRUCTCAP)
kdensity LNCONSTRUCTCAP //// its has more of a normal distribution now
kdensity FEMALECAP ////its bimodal
kdensity HISPCAP ////its extremely right skewed
gen LNHISPCAP = ln(HISPCAP)
kdensity MEDWAGECAP
gen LNMEDWAGECAP = ln( MEDWAGECAP)
kdensity LNMEDWAGECAP

***Pooled OLS Regressions
reg ALCOHOL LNFACCAP, r
outreg
reg ALCOHOL LNFACCAP AGE2 BLACKCAP HISPCAP MALECAP WHITECAP, r
outreg , merge
reg ALCOHOL c.LNFACCAP##c.LNFACCAP AGE2 BLACKCAP HISPCAP MALECAP WHITECAP YEAR, r
outreg , merge

***Unit, Time, and Two-Way FE
xtset STATE
xtreg ALCOHOL LNFACCAP AGE2 BLACKCAP HISPCAP MALECAP WHITECAP, fe cluster(STATE)
outreg
xtset YEAR
xtreg ALCOHOL LNFACCAP AGE2 BLACKCAP HISPCAP MALECAP WHITECAP, fe 
outreg , merge
xtset STATE YEAR
xtreg ALCOHOL LNFACCAP AGE2 BLACKCAP HISPCAP MALECAP WHITECAP  YEAR, fe cluster(STATE)
outreg , merge
xtreg ALCOHOL LNFACCAP AGE2 BLACKCAP HISPCAP MALECAP WHITECAP i.YEAR, fe cluster(STATE)
outreg , merge

***IV Regressions
ivregress 2sls ALCOHOL (LNFACCAP= BIZREG LNCONSTRUCTCAP LNMEDWAGECAP) AGE2 BLACKCAP HISPCAP MALECAP WHITECAP YEAR i.STATE, r cluster(STATE)
outreg
ivregress 2sls ALCOHOL (LNFACCAP= BIZREG LNCONSTRUCTCAP LNMEDWAGECAP) AGE2 BLACKCAP HISPCAP MALECAP WHITECAP i.YEAR i.STATE, r cluster(STATE)
outreg , merge
ivregress 2sls ALCOHOL (LNFACCAP= BIZREG LNCONSTRUCTCAP LNMEDWAGECAP) AGE2 BLACKCAP HISPCAP MALECAP WHITECAP YEAR i.STATE, r 
estat overid //// appears to be no problems with the iv

xtset STATE YEAR
xtivreg ALCOHOL (LNFACCAP= BIZREG LNCONSTRUCTCAP LNMEDWAGECAP) AGE2 BLACKCAP HISPCAP MALECAP WHITECAP c.YEAR , fe vce(cluster STATE) 
outreg 
xtivreg ALCOHOL (LNFACCAP= BIZREG LNCONSTRUCTCAP LNMEDWAGECAP) AGE2 BLACKCAP HISPCAP MALECAP WHITECAP i.YEAR , fe vce(cluster STATE) 
outreg , merge
