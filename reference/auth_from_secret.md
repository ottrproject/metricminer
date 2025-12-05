# Use secrets to Authorize R package to access endpoints

This is a function to authorize metricminer to access calendly, github
or google noninteractively from passing in a keys or tokens.

## Usage

``` r
auth_from_secret(
  app_name,
  token,
  access_token,
  refresh_token,
  cache = FALSE,
  in_test = FALSE
)
```

## Arguments

- app_name:

  Which app are you trying to authorize? 'google', 'calendly' or
  'github'?

- token:

  For calendly or github, pass in the API key or Personal Access Token
  that you have set up from going to
  https://github.com/settings/tokens/new or
  https://calendly.com/integrations/api_webhooks respectively.

- access_token:

  For Google, access token can be obtained from running authorize
  interactively: token \<-authorize(); token\$credentials\$access_token

- refresh_token:

  For Google, refresh token can be obtained from running authorize
  interactively: token \<-authorize(); token\$credentials\$refresh_token

- cache:

  Should the credentials be cached? TRUE or FALSE?

- in_test:

  If setting up auth in a test, set to TRUE so that way the
  authorization doesn't stick

## Value

OAuth token saved to the environment so the package access the API data

## Examples

``` r
if (FALSE) { # \dontrun{

# Example for authorizing Calendly
# You go to https://calendly.com/integrations/api_webhooks to get an api key
auth_from_secret("calendly", token = "A_calendly_token_here")

# Example for GitHub
# You go to https://github.com/settings/tokens/new to get a
# Personal Access Token
auth_from_secret("github", token = "ghp_a_github_pat_here")

# Example for authorizing for Google
token <- authorize("google")
auth_from_secret(
  app_name = "google",
  access_token = token$credentials$access_token,
  refresh_token = token$credentials$refresh_token
)
} # }
```
