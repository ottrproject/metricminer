# Write playlist details from YouTube

Write playlist details from YouTube

## Usage

``` r
write_playlist_details(playlist_id, token = NULL, outfile = NULL)
```

## Arguments

- playlist_id:

  string, playlist ID on YouTube

- token:

  OAuth token from Google login.

- outfile:

  string, a filename to which to write results in the 'resources' folder

## Value

writes a file containing the dataframe of cleaned results

## Examples

``` r
if (FALSE) { # \dontrun{
# Not run
write_playlist_details(
  playlist_id = shorts_playlist_id,
  outfile = "youtube_shorts_data.tsv"
)
write_playlist_details(
  playlist_id = "PL6aYJ_0zJ4uCABkMngSYjPo_3c-nUUmio",
  outfile = "youtube_shorts_data.tsv"
)
} # }
```
