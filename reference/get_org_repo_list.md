# Retrieve list of repositories for an organization

This is a function to get the information about a repository

## Usage

``` r
get_org_repo_list(
  owner,
  count = 1e+05,
  data_format = "dataframe",
  token = NULL
)
```

## Arguments

- owner:

  The owner of the repository. So for
  \`https://github.com/ottrproject/metricminer\`, it would be \`fhdsl\`

- count:

  The number of responses that should be returned. Default is 100000

- data_format:

  Default is to return a curated data frame. However if you'd like to
  see the raw information returned from GitHub set format to "raw".

- token:

  You can provide the Personal Access Token key directly or this
  function will attempt to grab a PAT that was stored using the
  \`authorize("github")\` function

## Value

a list of repositories that an organization has

## Examples

``` r
if (FALSE) { # \dontrun{

authorize("github")
get_org_repo_list(owner = "fhdsl")
} # }
```
