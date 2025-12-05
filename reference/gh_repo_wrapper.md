# Wrapper function for gh repository calls

This is a function that wraps up gh calls for us

## Usage

``` r
gh_repo_wrapper(api_call, owner, repo, token = NULL, count = 1e+05)
```

## Arguments

- api_call:

  an API call and endpoint. That has \`owner\` and \`user\`.

- owner:

  The repository name. So for
  \`https://github.com/ottrproject/metricminer\`, it would be \`fhdsl\`

- repo:

  The repository name. So for
  \`https://github.com/ottrproject/metricminer\`, it would be
  \`metricminer\`

- token:

  You can provide the Personal Access Token key directly or this
  function will attempt to grab a PAT that was stored using the
  \`authorize("github")\` function

- count:

  How many items would you like to receive? default is 100000

## Value

Metrics for a repository on GitHub
