# Get stats for an associated Google Analytics property

This is a function to get the Google Analytics accounts that this user
has access to. The scope it uses is the \`See and download your Google
Analytics data\` If you don't this check this box on the OAuth screen
this won't work.

## Usage

``` r
get_ga_stats(
  property_id,
  start_date = "2015-08-14",
  token = NULL,
  body_params = NULL,
  end_date = NULL,
  stats_type = "metrics",
  dataformat = "dataframe"
)
```

## Arguments

- property_id:

  a GA property. Looks like '123456789' Can be obtained from running
  \`get_ga_properties()\`

- start_date:

  YYYY-MM-DD format of what metric you'd like to collect metrics from to
  start. Default is the earliest date Google Analytics were collected.

- token:

  credentials for access to Google using OAuth. \`authorize("google")\`

- body_params:

  The body parameters for the request

- end_date:

  YYYY-MM-DD format of what metric you'd like to collect metrics from to
  end. Default is today.

- stats_type:

  Do you want to retrieve metrics or dimensions?

- dataformat:

  How would you like the data returned to you? Default is a "dataframe"
  but if you'd like to see the original API list result, put "raw".

## Value

Metrics dimensions for a GA returned from the Google Analytics API. It
can be returned as a curated data.frame or the raw version which is the
API response as a list

## Examples

``` r
if (FALSE) { # \dontrun{

authorize("google")
accounts <- get_ga_user()

properties_list <- get_ga_properties(account_id = accounts$id[2])

property_id <- gsub("properties/", "", properties_list$name[1])
metrics <- get_ga_stats(property_id, stats_type = "metrics")
dimensions <- get_ga_stats(property_id, stats_type = "dimensions")
pages <- get_ga_stats(property_id, stats_type = "pages")
} # }
```
