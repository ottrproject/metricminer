# Get Calendly Event Lists

This is a function to get a list of scheduled events from a Calendly
user.

## Usage

``` r
list_calendly_events(token = NULL, user, count = 100)
```

## Arguments

- token:

  You can provide the API key directly using this argument or this
  function will attempt to grab an API key that was stored using the
  \`authorize("calendly")\` function

- user:

  You need to retrieve the Calendly user's URI. You can do this by doing
  \`user \<- get_calendly_user()\` and \`user\$resource\$uri\`

- count:

  The number of responses that should be returned. Default is 20 or you
  can say "all" to retrieve all.

## Value

Calendly REST API response as a list

## Examples

``` r
if (FALSE) { # \dontrun{

authorize("calendly")
user <- get_calendly_user()
list_calendly_events(user = user$resource$uri)
} # }
```
