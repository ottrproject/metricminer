# Authorize R package to access endpoints

This is a function to authorize the R package to access APIs
interactively. To learn more about the privacy policy for metricminer
\[read here\](https://www.metricminer.org/privacypolicy.html)

## Usage

``` r
authorize(app_name = NULL, cache = FALSE, ...)
```

## Arguments

- app_name:

  app would you like to authorize? Supported apps are 'google'
  'calendly' and 'github'

- cache:

  Should the token be cached as an .httr-oauth file or API keys stored
  as global options?

- ...:

  Additional arguments to send to oauth2.0_token

## Value

API token saved to the environment or the cache so it can be grabbed by
functions

## Examples

``` r
if (FALSE) { # \dontrun{

authorize()

authorize("github")

authorize("google")

authorize("calendly")
} # }
```
