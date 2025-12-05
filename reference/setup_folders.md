# Setups folder structure for metricminer

This is a function to setup a folder structure for metricminer data to
be saved to. It depends on and reads Scope used for this function is the
\`See, edit, create, and delete only the specific Google Drive files you
use with this app.\`

## Usage

``` r
setup_folders(
  config_file = file.path(rprojroot::find_root(rprojroot::has_dir(".git")),
    "_config_automation.yml"),
  token = NULL
)
```

## Arguments

- config_file:

  The file path to the \_config_automation.yml file

- token:

  OAuth token from Google login.

## Value

The googlesheet URL where the data has been written

## Examples

``` r
if (FALSE) { # \dontrun{

authorize("google")

setup_folders(
  config_file =  "_config_automation.yml"
)
} # }
```
