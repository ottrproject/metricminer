# Get the repository summary or time course metrics

This is a function to get the information about a repository

## Usage

``` r
get_github_metrics(
  repo,
  token = NULL,
  count = 1e+05,
  data_format = "dataframe",
  github_stats = "all",
  time_course = FALSE
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

- time_course:

  Should the time course data be collected or only the summary metrics?

## Value

Repository summary or time course metrics for a particular GitHub
repository as a dataframe

## Examples

``` r
if (FALSE) { # \dontrun{

authorize("github")
metrics <- get_github_metrics(repo = "ottrproject/metricminer")

# If you only want some of the stats you can choose which ones with the
# github_stats argument
metrics <- get_github_metrics(
  repo = "ottrproject/metricminer",
  github_stats = c("repo_activity", "stars"))

summary_metrics <- get_github_repo_summary(repo = "ottrproject/metricminer")
timecourse_metrics <- get_github_repo_timecourse(repo = "ottrproject/metricminer")
} # }
```
