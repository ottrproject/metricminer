# Handle Calendly GET requests

This is a function that handles Calendly GET requests

## Usage

``` r
calendly_get(url, token = NULL, user = NULL, count = NULL, page_token = NULL)
```

## Arguments

- url:

  The endpoint URL for this API request

- token:

  You can provide the API key directly using this argument or this
  function will attempt to grab an API key that was stored using the
  \`authorize("calendly")\` function

- user:

  The user param for Calendly. Usually looks like
  "https://api.calendly.com/users/c208a750-9214-4c62-9ee6-a1a9507c7b43"

- count:

  For paginated GETs, you can specify how many things you'd like
  returned

- page_token:

  For a paginated GET, what page are we on?

## Value

Calendly REST API response as a list

## Examples

``` r
if (FALSE) { # \dontrun{

authorize("calendly")
token <- get_token(app_name = "calendly")

result_list <- calendly_get(
  url = "https://api.calendly.com/users/me",
  token = token
)
} # }
```
