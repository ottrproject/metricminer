# Handle Google Analytics Lists

These functions are to clean metric and dimension data from Google
Analytics \`get_ga_stats()\` function.

## Usage

``` r
clean_ga_metrics(metrics = NULL, type = NULL)
```

## Arguments

- metrics:

  a metrics object from \`get_ga_stats()\` function

- type:

  If type == "pages" then treat the data frame for in the instance that
  the dimensions of the subpages were collected

## Value

a data frame of cleaned metrics from Google Analytics
