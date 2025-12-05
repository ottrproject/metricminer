# Get all property ids for all Google Analytics associated with an account id

This retrieves all the property ids associated with a Google Analytics
Account. The scope it uses is the \`See and download your Google
Analytics data\` If you don't this check this box on the OAuth screen
this won't work.

## Usage

``` r
get_ga_properties(account_id, token = NULL)
```

## Arguments

- account_id:

  the account id of the properties you are trying to retrieve

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
} # }
```
