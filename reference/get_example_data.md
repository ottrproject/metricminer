# Get retrieve an example dataset

This is a function to retrieve a list of the example datasets included
with metricminer

## Usage

``` r
get_example_data(dataset_name, envir = 1)
```

## Arguments

- dataset_name:

  the name of the example dataset to be retrieved from the metricminer
  package.

- envir:

  By default the example data is saved in the global environment but
  this parameter allows you to change that if desired.

## Value

an object in the environment of the same example dataset name that was
requested.

## Examples

``` r
if (FALSE) { # \dontrun{

# You can see the list of example datasets by running:
list_example_data()

# Then use the datasetes of your interest by calling it with this function
get_example_data("gform_info")

# Then if you check your global environment you will see "gform_info" included
ls()
} # }
```
