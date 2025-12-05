# Get all metrics for all properties associated with an account

This is a function to gets metrics and dimensions for all properties
associated with an account. The scope it uses is the \`See and download
your Google Analytics data\` If you don't this check this box on the
OAuth screen this won't work.

## Usage

``` r
get_multiple_ga_metrics(
  account_id = NULL,
  property_ids = NULL,
  token = NULL,
  start_date = "2015-08-14",
  end_date = NULL,
  dataformat = "dataframe",
  stats_type = c("metrics", "dimensions", "link_clicks")
)
```

## Arguments

- account_id:

  the account id that you'd like to retrieve stats for all properties
  associated with it.

- property_ids:

  A vector of property ids you'd like to retrieve metrics for.

- token:

  credentials for access to Google using OAuth. \`authorize("google")\`

- start_date:

  YYYY-MM-DD format of what metric you'd like to collect metrics from to
  start. Default is the earliest date Google Analytics were collected.

- end_date:

  YYYY-MM-DD format of what metric you'd like to collect metrics from to
  end. Default is today.

- dataformat:

  How would you like the data returned to you? Default is a "dataframe"
  but if you'd like to see the original API list result, put "raw".

- stats_type:

  Do you want to retrieve metrics or dimensions? List all you want to
  collect as a vector

## Value

Either a list of dataframes where \`metrics\`, \`dimensions\` and \`link
clicks\` are reported. But if \`format\` is set to "raw" then the
original raw API results will be returned

A list of metrics, dimensions, and link clicks for a for all properties
underneath a Google Analytics account. It can be returned as a curated
data.frame or the raw version which is the API response as a list

## Examples

``` r
if (FALSE) { # \dontrun{

authorize("google")
accounts <- get_ga_user()

properties_list <- get_ga_properties(account_id = accounts$id[1])
property_ids <- gsub("properties/", "", properties_list$name[1:2])

all_properties <- get_multiple_ga_metrics(account_id = accounts$id[1])

some_properties <- get_multiple_ga_metrics(property_ids = property_ids)

} # }
```
