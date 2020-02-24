clear all 
cap log close _all

discard 
adopath ++ "."

sysuse auto, clear 

/* set trace on  */
log using binscatter.log, replace name(binscatter_main)

binscatter price mpg, ci(model bins) linetype(lfit) by(foreign) n(4) n_draws(1000)

/* set trace off  */
log close binscatter_main
