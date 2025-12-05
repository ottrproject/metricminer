# Get Google Analytics Accounts

This is a function to get the Google Analytics accounts that this user
has access to. The scope it uses is the \`See and download your Google
Analytics data\` If you don't this check this box on the OAuth screen
this won't work.

## Usage

``` r
get_ga_user(token = NULL, request_type = "GET")
```

## Arguments

- token:

  credentials for access to Google using OAuth. \`authorize("google")\`

- request_type:

  Is this a GET or a POST?

## Value

Information about what accounts Google Analytics credentials has access
to

## Examples

``` r
if (FALSE) { # \dontrun{

authorize("google")
get_ga_user()
} # }
```
