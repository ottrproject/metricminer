# Writes data to a Googlesheet

This is a function to write metricminer data to a Googlesheet. Scope
used for this function is the \`See, edit, create, and delete only the
specific Google Drive files you use with this app.\` When you get to the
OAuth consent screen. If you do not check this box, this function won't
work.

## Usage

``` r
write_to_gsheet(
  input,
  token = NULL,
  gsheet = NULL,
  overwrite = FALSE,
  append_rows = FALSE,
  sheet = 1,
  new_sheet = FALSE,
  ...
)
```

## Arguments

- input:

  input data to write to a googlesheet

- token:

  OAuth token from Google login.

- gsheet:

  Optionally a googlesheet to write to

- overwrite:

  TRUE/FALSE overwrite if there is data at the destination

- append_rows:

  TRUE/FALSE should the data be appended to the data?

- sheet:

  Index or name of the worksheet you want to write to. Forwarded to
  googlesheets4::write_sheet or googlesheets4::append_sheet to indicate
  what sheet it should be written to.

- new_sheet:

  default is FALSE. But if it is anything else will be used as the name
  for a new worksheet that will be made and written to.

- ...:

  these parameters are sent to googlesheets4::write_sheet.

## Value

The googlesheet URL where the data has been written

## Examples

``` r
if (FALSE) { # \dontrun{

authorize("github")
repo_list <- get_user_repo_list(owner = "metricminer")
gsheet <- paste0(
  "https://docs.google.com/spreadsheets/d/",
  "166MV4_1pfATB3Hes2HbdZCpkMc8JTT3u3eJes6Wu7Rk/edit#gid=0"
)
write_to_gsheet(repo_list)

datasheet <- write_to_gsheet(
  gsheet = gsheet,
  input = repo_list, append_rows = TRUE,
  sheet = 1
)

datasheet <- write_to_gsheet(
  gsheet = gsheet,
  input = repo_list,
  new_sheet = "github_data"
)
} # }
```
