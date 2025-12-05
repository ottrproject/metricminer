# Get multiple Google forms

This is a wrapper function for returning google form info and responses
for multiple forms at once. The scopes it uses are the \`See all your
Google Forms forms.\` and \`See all responses to your Google Forms
forms.\` If you don't check this box on the OAuth screen this function
won't work.

## Usage

``` r
get_multiple_forms(form_ids = NULL, token = NULL, dataformat = "dataframe")
```

## Arguments

- form_ids:

  a vector of form ids you'd like to retrieve information for

- token:

  credentials for access to Google using OAuth. \`authorize("google")\`

- dataformat:

  What format would you like the data? Options are "raw" or "dataframe".
  "dataframe" is the default.

## Value

This returns a list of API information for google forms

## Examples

``` r
if (FALSE) { # \dontrun{

authorize("google")
form_list <- googledrive::drive_find(
  shared_drive = googledrive::as_id("0AJb5Zemj0AAkUk9PVA"),
  type = "form"
)

multiple_forms <- get_multiple_forms(form_ids = form_list$id)
} # }
```
