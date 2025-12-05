# Check the testthat check log file and print out how many errors

if testthat's tests have been run, this will look for the check to see
if anything truly broke It will return a TRUE/FALSE for whether or not
there were errors based on the check/testthat.Rout file produced.

## Usage

``` r
check_check(report_warning = TRUE)
```

## Arguments

- report_warning:

  Should the number include warnings in addition errors? Default is both
  will be reported but if you'd like to ignore warnings set this to
  FALSE.

## Value

a how many errors/warnings were found
