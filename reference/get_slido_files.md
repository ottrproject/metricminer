# Get Slido Files

This is a function to get slido response output files. The slido files
must be saved as googlesheets and cannot be xlsx. Authentication for
this function is handled by the \`googledrive\` package. However, the
user will need to authorize their google account twice (once for
googledrive and once for googlesheets). If you don't check these boxes
on the OAuth screens, this function won't work.

## Usage

``` r
get_slido_files(
  shared_drive_name,
  tags_to_find = "^Polls-per|^JoinedParticipants-",
  file_type = "spreadsheet",
  keep_duplicates = FALSE
)
```

## Arguments

- shared_drive_name:

  a name of a shared drive (not a URL or subpart of a URL) (will
  recursively search for files by default).

- tags_to_find:

  pattern or character that's a regular expression to look for in file
  names. Default is "^Polls-per\|^JoinedParticipants-" which will search
  for files starting with either of those patterns.

- file_type:

  which file type to search for. Default is "spreadsheet"

- keep_duplicates:

  By default we won't keep duplicated files if a two files have the same
  name. But if you set this to true, duplicates will be returned.

## Value

A list of the slido files and their content in a Googledrive location.

## Examples

``` r
if (FALSE) { # \dontrun{

shared_drive_name <- "ITCR"
slido_data <- get_slido_files(shared_drive_name)
} # }
```
