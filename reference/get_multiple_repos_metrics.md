# Retrieve metrics for a list of repos

This is a function to get metrics for a list of repos. You can provide
an owner and attempt retrieve all repositories from a particular
organization, or you can provide a character vector of repositories.

## Usage

``` r
get_multiple_repos_metrics(
  repo_names = NULL,
  token = NULL,
  data_format = "dataframe",
  time_course = FALSE,
  github_stats = "all"
)
```

## Arguments

- repo_names:

  a character vector of repositories you'd like to collect metrics from.

- token:

  You can provide the Personal Access Token key directly or this
  function will attempt to grab a PAT that was stored using the
  \`authorize("github")\` function

- data_format:

  Default is to return a curated data frame. However if you'd like to
  see the raw information returned from GitHub set format to "raw".

- time_course:

  Should the time course data be collected or only the summary metrics?

- github_stats:

  Which stats would you like to collect from the GitHub API? Argument
  should be a vector of the names of the stats to be collected. This
  differs whether time_course is TRUE/FALSE. If time_course = FALSE
  should be a vector that can include: "repo_activity", "stars",
  "forks", "contributors", "community" If time_course = TRUE should be a
  vector that can include: "clones" and "views". By default "all" will
  be collected.

## Value

A list of metrics for a list of repos in a dataframe format

## Examples

``` r
if (FALSE) { # \dontrun{

authorize("github")

repo_names <- c("ottrproject/metricminer", "ottrproject/OTTR_Template")
some_repos_metrics <- get_multiple_repos_metrics(repo_names = repo_names)

stars_and_forks <- get_multiple_repos_metrics(repo_names = repo_names,
github_stats = c("stars", "forks"))

some_repos_metrics <- get_multiple_repos_metrics(repo_names = repo_names,
 time_course = TRUE)

gh_timecourse <- get_multiple_repos_metrics(repo_names = repo_names,
 github_stats = c("repo_activity", "stars", "forks", "contributors"))
} # }
```
