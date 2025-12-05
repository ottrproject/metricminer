# Handler for API requests from Google Analytics

This is a function that handles requests from Google Analytics. The
scope it uses is the \`See and download your Google Analytics data\` If
you don't this check this box on the OAuth screen this won't work.

## Usage

``` r
request_ga(token, url, query = NULL, body_params = NULL, request_type)
```

## Arguments

- token:

  credentials for access to Google using OAuth. \`authorize("google")\`

- url:

  The endpoint URL for the request

- query:

  A list to be passed to query

- body_params:

  The body parameters for the request

- request_type:

  Is this a GET or a POST?

## Value

An API response in the form of a list
