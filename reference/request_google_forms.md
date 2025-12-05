# Get Google Forms

This is a function to get the Google Forms API requests. The scopes it
uses are the \`See all your Google Forms forms.\` and \`See all
responses to your Google Forms forms.\` If you don't check this box on
the OAuth screen this function won't work.

## Usage

``` r
request_google_forms(
  token,
  url,
  body_params = NULL,
  query_params = NULL,
  return_request = TRUE
)
```

## Arguments

- token:

  credentials for access to Google using OAuth. \`authorize("google")\`

- url:

  The endpoint URL for the request

- body_params:

  The body parameters for the request

- query_params:

  The body parameters for the request

- return_request:

  Should a list of the request be returned as well?

## Value

This function returns a list from a API response JSON file
