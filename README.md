# binscatter: Binned Scatterplots...

binscatter is a Stata program which generates binned scatterplots.  These are a convenient way of observing the relationship between two variables, or visualizing OLS regressions.  They are especially useful when working with large datasets.

[See the project webpage for more information.](https://michaelstepner.com/binscatter/ "binscatter: a Stata program to generate binned scatterplots.")

## ... now with confidence intervals

This version adds support for confidence intervals!  

Add confidence intervals around the conditional means with the option `ci(bins)`, add confidence intervals around fit lines (both `qfit` and `lfit` supported) with `ci(model)`.
Technically, both options can be selected at the same time (though this doesn't usually look good) with `ci(bins model)`.

## Install
Install from within stata

`net install esplot, from("https://raw.githubusercontent.com/dballaelliott/binscatter/master/") replace`

OR 2. Download/clone/fork this repo

### ci(bins)

```stata
sysuse auto, clear 
binscatter price mpg, ci(bins) linetype(none)
```

![Example Figures: Many Bins](img/bins1.svg "Example Figure: Too Many Bins")

This helps to highlight the implicit bias-variance tradeoff that `binscatter` shares with other non-parametric conditional means estimators. 

```stata
sysuse auto, clear 
binscatter price mpg, ci(bins) linetype(none) n(5)
```

![Example Figures:  (Maybe) Too Few Bins](img/bins2.svg "Example Figure: (Maybe) Too Few Bins")

Aesthetically, this can look quite nice when we add `linetype(connect)`

```stata
binscatter price mpg, ci(bins) linetype(connect) n(5)
```

![Example Figures: Connecting the Dots](img/bins3.svg "Example Figure: Connecting the Dots")

### ci(model)

The `ci()` option class also provides an option to bound linear and quadratic fits.

The syntax is exactly the same in either case; `binscatter` knows to bound the appropriate model type, whether it is linear...

```stata
binscatter price mpg, ci(model) linetype(lfit)
```

![Example Figure: Linear Fit](img/lfit1.svg "Example Figure: Linear Fit")

or quadratic.... 

```stata
binscatter price mpg, ci(model) linetype(qfit)
```

![Example Figure: Quadratic Fit](img/qfit1.svg "Example Figure: Quadratic Fit")

Technically, these options can be specified together, but it often leads to a crowded figure...

![Example Figure: Too Much!](img/lfit2.svg "Example Figure: Too Much!")

### Comments

Ok - what exactly do these confidence intervals represent? Why aren't the bounds on the linear fit also linear? 

to write: 

these minimize (maximize)
<a href="https://www.codecogs.com/eqnedit.php?latex=\hat{y}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\hat{y}" title="\hat{y}" /></a>
along the manifold given by the constraint function
<a href="https://www.codecogs.com/eqnedit.php?latex=$CDF(\beta)&space;=&space;0.025$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$CDF(\beta)&space;=&space;0.025$" title="$CDF(\beta) = 0.025$" /></a>
<a href="https://www.codecogs.com/eqnedit.php?latex=($CDF(\beta)&space;=&space;0.0975)$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?($CDF(\beta)&space;=&space;0.0975)$" title="($CDF(\beta) = 0.0975)$" /></a>

rather, we numerically approximate this. 

in this way, in the linear case, the constraint is in terms of <a href="https://www.codecogs.com/eqnedit.php?latex=$\beta=[\beta_0~\beta_1]^T$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$\beta=[\beta_0~\beta_1]^T$" title="$\beta=[\beta_0~\beta_1]^T$" /></a>
; in the quadratic case 
<a href="https://www.codecogs.com/eqnedit.php?latex=$\beta=[\beta_0~\beta_1~\beta_2]^T$" target="_blank"><img src="https://latex.codecogs.com/gif.latex?$\beta=[\beta_0~\beta_1~\beta_2]^T$" title="$\beta=[\beta_0~\beta_1~\beta_2]^T$" /></a>


--- 
in line <a href="https://www.codecogs.com/eqnedit.php?latex=\LaTeX" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\LaTeX" title="\LaTeX" /></a> compiled externally by [codecogs](https://www.codecogs.com/)
