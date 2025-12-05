# Get metadata associated Google Analytics property

This is a function to get the Google Analytics accounts that this user
has access to. The scope it uses is the \`See and download your Google
Analytics data\` If you don't this check this box on the OAuth screen
this won't work.

## Usage

``` r
get_ga_metadata(property_id, token = NULL)
```

## Arguments

- property_id:

  a GA property. Looks like '123456789' Can be obtained from running
  \`get_ga_properties()\`

- token:

  credentials for access to Google using OAuth. \`authorize("google")\`

## Value

A list showing the metadata types available for the Google Analytics
property. This can be used to craft an API request.

## Examples

``` r
if (FALSE) { # \dontrun{

authorize("google")
accounts <- get_ga_user()

properties_list <- get_ga_properties(account_id = accounts$id[1])

property_id <- gsub("properties/", "", properties_list$name[1])
property_metadata <- get_ga_metadata(property_id = property_id)
} # }
```
