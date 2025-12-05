# Get the GitHub User's info

This is a function to get the GitHub user's info

## Usage

``` r
get_github_user(token = NULL)
```

## Arguments

- token:

  You can provide the Personal Access Token key directly or this
  function will attempt to grab a PAT that was stored using the
  \`authorize("github")\` function

## Value

Information regarding a Github account

## Examples

``` r
if (FALSE) { # \dontrun{

authorize("github")
get_github_user()
} # }
```
