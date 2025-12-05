# Get all property information for a particular property id

This is a function to get the Google Analytics accounts that this user
has access to. The scope it uses is the \`See and download your Google
Analytics data\` If you don't this check this box on the OAuth screen
this won't work.

## Usage

``` r
get_ga_property_info(property_id, token = NULL)
```

## Arguments

- property_id:

  the property id you want information about.

- token:

  credentials for access to Google using OAuth. \`authorize("google")\`

## Value

All the property ids and information about them for a Google Analytics
account.

## Examples

``` r
if (FALSE) { # \dontrun{

authorize("google")
accounts <- get_ga_user()
properties_list <- get_ga_properties(account_id = accounts$id[1])
property_id <- gsub("properties\\/", "", properties_list$name[1])

property_info <- get_ga_property_info(property_id = property_id)
} # }
```
