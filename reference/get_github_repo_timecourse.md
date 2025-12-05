# Collect repository timecourse metrics

This is a wrapper for [`get_github_metrics`](get_github_metrics.md) that
has \`time_course = TRUE\` so that timecourse metrics are collected

This is a function to get the information about a repository

## Usage

``` r
get_github_repo_timecourse(
  repo,
  token = NULL,
  count = 1e+05,
  data_format = "dataframe",
  github_stats = "all"
)
```

## Arguments

- repo:

  The repository name. So for
  \`https://github.com/ottrproject/metricminer\`, it would be
  \`ottrproject/metricminer\`

- token:

  You can provide the Personal Access Token key directly or this
  function will attempt to grab a PAT that was stored using the
  \`authorize("github")\` function

- count:

  How many items would you like to receive? default is 100000

- data_format:

  Default is to return a curated data frame. However if you'd like to
  see the raw information returned from GitHub set format to "raw".

- github_stats:

  Which stats would you like to collect from the GitHub API? Argument
  should be a vector of the names of the stats to be collected. This
  differs whether time_course is TRUE/FALSE. If time_course = FALSE
  should be a vector that can include: "repo_activity", "stars",
  "forks", "contributors", "community" If time_course = TRUE should be a
  vector that can include: "clones" and "views". By default "all" will
  be collected.

## Value

GitHub repository timecourse metrics for views and clones

## Examples

``` r
if (FALSE) { # \dontrun{

authorize("github")

timecourse_metrics <- get_github_repo_timecourse(repo = "ottrproject/metricminer")
} # }
```
