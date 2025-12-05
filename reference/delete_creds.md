# Delete cached metricminer credentials

This is a function to delete cached creds and creds in the current
environment that were set by metricminer

## Usage

``` r
delete_creds(app_name = "all")
```

## Arguments

- app_name:

  which app would you like to delete the creds for? Default is to delete
  the creds for all.

## Value

Cached credentials are deleted and report is given back

## Examples

``` r
if (FALSE) { # \dontrun{

delete_creds("google")
} # }
```
