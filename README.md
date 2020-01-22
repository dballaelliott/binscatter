# binscatter: Binned Scatterplots

binscatter is a Stata program which generates binned scatterplots.  These are a convenient way of observing the relationship between two variables, or visualizing OLS regressions.  They are especially useful when working with large datasets.

[See the project webpage for more information.](https://michaelstepner.com/binscatter/ "binscatter: a Stata program to generate binned scatterplots.")

## now with confidence intervals

This version adds support for confidence intervals!  

Add confidence intervals around the conditional means with the option `ci(bins)`, add confidence intervals around fit lines (both `qfit` and `lfit` supported) with `ci(model)`.
Technically, both options can be selected at the same time (though this doesn't usually look good) with `ci(bins model)`.

### ci(bins)

more info and examples 

### ci(model)

more info and examples