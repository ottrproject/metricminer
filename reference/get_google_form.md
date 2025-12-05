# Get Google Forms

This is a function to get Google Form info and responses from the API.
The scopes it uses are the \`See all your Google Forms forms.\` and
\`See all responses to your Google Forms forms.\` If you don't check
this box on the OAuth screen this function won't work.

## Usage

``` r
get_google_form(form_id, token = NULL, dataformat = "dataframe")
```

## Arguments

- form_id:

  The form ID we need to get

- token:

  credentials for access to Google using OAuth. \`authorize("google")\`

- dataformat:

  What format would you like the data? Options are "raw" or "dataframe".
  "dataframe" is the default.

## Value

This returns a list of the form info and responses to the google form.
Default is to make this a list of nicely formatted dataframes.

## Examples

``` r
if (FALSE) { # \dontrun{

authorize("google")
form_info <- get_google_form(
  "https://docs.google.com/forms/d/1Neyj7wwNpn8wC7NzQND8kQ30cnbbETSpT0lKhX7uaQY/edit"
)
form_id <- "https://docs.google.com/forms/d/1Neyj7wwNpn8wC7NzQND8kQ30cnbbETSpT0lKhX7uaQY/edit"

### OR You can give it a direct form id

form_info <- get_google_form("1Neyj7wwNpn8wC7NzQND8kQ30cnbbETSpT0lKhX7uaQY")
} # }
```
