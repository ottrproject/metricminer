# Get Calendly API user

This is a function to get the Calendly API user info

## Usage

``` r
get_calendly_user(token = NULL)
```

## Arguments

- token:

  You can provide the API key directly using this argument or this
  function will attempt to grab an API key that was stored using the
  \`authorize("calendly")\` function

## Value

Calendly API user info as a list

## Examples

``` r
if (FALSE) { # \dontrun{

authorize("calendly")
get_calendly_user()
} # }
```
