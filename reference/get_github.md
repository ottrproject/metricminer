# Handler function for GET requests from GitHub

This is a function to get the GitHub user's info

## Usage

``` r
get_github(token = NULL, url)
```

## Arguments

- token:

  You can provide the Personal Access Token key directly or this
  function will attempt to grab a PAT that was stored using the
  \`authorize("github")\` function

- url:

  What is the URL endpoint we are attempting to grab here?

## Value

Information regarding a Github account
